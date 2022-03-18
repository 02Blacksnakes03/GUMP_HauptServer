ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

inJail = {}
Citizen.CreateThread(function()
    Wait(2000)
    while true do 
        Citizen.Wait(60000)
        ------print("jailtime")
        inJail = {}
        MySQL.Async.fetchAll("SELECT * FROM users WHERE crime_jailTime > 0", {}, function(result)
            for i = 1, #result, 1 do
                if result[i].crime_jailTime > 1 then
                    local x = ESX.GetPlayerFromIdentifier(result[i].identifier)
                    if x ~= nil then
                        MySQL.Async.fetchScalar("UPDATE users SET crime_jailTime = @newjail WHERE identifier = @ident", {['@newjail'] = result[i].crime_jailTime - 1, ['@ident'] = result[i].identifier})
                        table.insert(inJail, {name = result[i].firstname .. '_' .. result[i].lastname, he = result[i].crime_jailTime - 1})
                    end 
                
                elseif result[i].crime_jailTime == 1 then
                    local x = ESX.GetPlayerFromIdentifier(result[i].identifier)
                    if x ~= nil then
                        TriggerClientEvent('jail:unjail', x.source)
                        MySQL.Async.fetchScalar("UPDATE users SET crime_jailTime = @newjail WHERE identifier = @ident", {['@newjail'] = 0, ['@ident'] = result[i].identifier})
                    end
                end
            end  
        end)  
        
    end 
end)  
ESX.RegisterServerCallback('jail:isJailed', function(source, cb)
    local src = source
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @ident", {['@ident'] = ESX.GetPlayerFromId(src).getIdentifier()}, function(result)
        for i = 1, #result, 1 do
            cb(result[i].crime_jailTime)
            ------print(result[i].crime_jailTime)
        end  
    end) 
end)
ESX.RegisterServerCallback('jail:getPlayers', function(source, cb)
    cb(inJail)
end)
crimes = nil
function table_to_string(tbl)
    local result = ""
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result..""..v
        end
        result = result.."<br>"
    end 
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result..""
end



RegisterServerEvent('jail:in')
AddEventHandler('jail:in', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    ------print("server ready")
    MySQL.Async.fetchAll("SELECT * FROM player_crimes WHERE player = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
        crimes = {}
        ld = 0
        haft = 0
        sank = 0
        t = nil
        date = nil
		for i = 1, #result, 1 do
            ld = ld + 1 
            
			haft = haft + result[i].jailTime
            sank = sank + result[i].jailCosts
            table.insert(crimes, result[i].name .. ' ' .. result[i].description) 
		end 
        Wait(500)  
        if haft > 0 then
            t = os.date ("*t")
            date = t.day .. '.' .. t.month .. '.' .. t.year 
            MySQL.Async.fetchScalar("UPDATE users SET crime_jailTime = @jailtime WHERE identifier = @identifier", {['@jailtime'] = haft, ['@identifier'] = xPlayer.getIdentifier()})
            MySQL.Sync.fetchScalar("DELETE FROM player_crimes WHERE player = @id", { ['@id'] = xPlayer.getIdentifier()})
                  
                local xname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
                sendJailMsg(xname .. " sitzt nun hinter Gittern. ")
                
                TriggerClientEvent('jail:ready', src, "Du hast eine E-Mail erhalten!") 
               
               
                if xPlayer.getMoney() >= sank then
                    xPlayer.removeMoney(sank)
                    TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst '.. sank .. '$!')
                else
                    if xPlayer.getAccount('bank').money < sank then
                        sank = xPlayer.getAccount('bank').money 
                        xPlayer.removeAccountMoney('bank', sank)
                        MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
                        { ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 - sank, ['reason'] = "Inhaftierung"},
                        function(affectedRows)
                        end)
                    else
                        xPlayer.removeAccountMoney('bank', sank)
                        MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
                        { ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 - sank, ['reason'] = "Inhaftierung"},
                        function(affectedRows)
                        end)
                    end
                end 
                MySQL.Async.fetchScalar("INSERT INTO `player_emails` (`id`, `identifier`, `readed`, `subject`, `body`) VALUES (NULL, @identifier, '0', 'Inhaftierung', @mail);", {['@mail'] = "<p style=\"font-size: 15px\">Los Santos Police Department - ".. date .."</p><br><p>Sie wurden ins Gefängnis eingewiesen. Der Staat hat eine Haftzeit von ".. haft .." Hafteinheiten und einen Haftbetrag von $".. sank .." festgelegt!</p><br><b>Begangene Straftaten:</b><br>" .. table_to_string(crimes), ['@identifier'] = xPlayer.getIdentifier()})

        end 
	end) 
end)  
jailtimeCooldown = {}
RegisterCommand('jailtime', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if jailtimeCooldown[src] ~= true then 
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
            for i = 1, #result, 1 do
                if result[i].crime_jailTime > 0 then
                    TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast noch '.. result[i].crime_jailTime .. ' Hafteinheiten übrig!')
                    jailtimeCooldown[src] = true
                else
                    TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast keine offenen Hafteinheiten!')
                    jailtimeCooldown[src] = true
                end
            end
        end) 
        Wait(5100)
        jailtimeCooldown[src] = false
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte warte 5 Sekunden!')
    end
end)
function sendJailMsg(msg)
    local xPlayers = ESX.GetPlayers()
    
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        
        if xPlayer.getJob().name == 'police' then
            
            TriggerClientEvent("glmp_notify", xPlayers[i], lspdColor, xPlayer.getJob().label, msg)
        end

        if xPlayer.getJob().name == 'fib' then

            TriggerClientEvent("glmp_notify", xPlayers[i], fibColor, xPlayer.getJob().label, msg)
        end 
    end
end