i = nil
day = nil
apiKeyDiscord = "apiKeyBot"
i = nil
day = nil
permlevel = {}
adminRank = {}
function getAdminLevel(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    if permlevel[source] == nil then
        local admin = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        adminRank[source] = admin
        permlevel[source] = MySQL.Sync.fetchScalar("SELECT permission_level FROM adminRanks WHERE adminRank = @adminRank", { ['@adminRank'] = admin})
        ------print("set permlevel")
    end   
end
discordId = {}
i = {}
AddEventHandler("playerConnecting", function(name, setReason, deferrals)
--	if string.find(GetPlayerIdentifiers(source), "steam:") then
       -- if string.find(GetPlayerIdentifiers(source), "discord:") then 
            ------print(GetPlayerIdentifiers(source)[3])
            src = source
            for k,v in pairs(GetPlayerIdentifiers(source))do
                ------print(v)
                    
                  
                if string.sub(v, 1, string.len("discord:")) == "discord:" then
                    discordId[src] = v:gsub("discord:",  "") 
                  end
                  if string.sub(v, 1, string.len("license:")) == "license:" then
                    i[src] = v
                    ----print("set identifier")
                end
                
              end 
            PerformHttpRequest("http://localhost:3000/discord/user/".. discordId[src],  
            function (errorCode, resultData, resultHeaders)
                 ------print( resultData )
                    ------print(errorCode)
                    ------print(resultHeaders)
                    deferrals.defer()
                    deferrals.update("Überprüfe Spieleraccount! Bitte warten...")
                    
                    
                    name = GetPlayerName(src)
                    ----print("PIDENT1: " .. i[src]) 
                    --if resultData == "true" then  
                        ----print("PIDENT2: " .. i[src])
                        ----print("DC")
                        if discordId[src] ~= '689292662322233437' then 
                            TriggerEvent('discord:syncAccount', i[src]:gsub("license:", ""),  discordId[src], src)
                        end
                        MySQL.Async.fetchAll("SELECT * FROM bans WHERE identifier = @ident AND revoked = 0", {['@ident'] = i[src]}, function(result)
                            
                            if #result > 0 then   
                                banned = false
                                t = os.time() 
                            reason = "Fehler000"
                                
                                
                                for i = 1, #result, 1 do
                                    if result[i].date == -1 then
                                        banned = true 
                                        bannedto = "permanent"

                                    elseif result[i].date > t then
                                        banned = true
                                        bannedto = 'bis zum '.. os.date('%d.%m.%Y um %H:%M Uhr', result[i].date)
                                    end   
                                    if banned == true then
                                        banid = result[i].id 
                                        reason = result[i].reason 
                                    end
                                    reason = result[i].reason
                                end  
                                
                                if banned == true then
                                    --deffrals.done("Gebannt")
                                deferrals.done("\n\n\nHallo ".. name .. ", \n\n Leider musste der GLMP-Support festellen, dass du gegen die Regelwerke von GLMP verstoßen hast. Dementsprechend wurde die Freischaltung deines Benutzeraccounts für den GLMP-Gameserver deaktiviert (BAN-ID: ".. banid ..").\nFolgender Verstoß liegt gegen deinen Account vor:\n\n".. reason .. "\n\nDie Sperrung deines Accounts ist " .. bannedto .. "! Diese Sperre gillt nur für den Gameserver von GLMP und nicht für alle Plattformen. Du kannst eine Aufhebung dieser Sperre auf unserem Discord ( https://discord.gg/Nt4cWkdjjz ) beantragen.\n\nMit freundlichen Grüßen,\nGLMP-Team")
                                else
                                    deferrals.done()
                                end
                            else 
                            deferrals.done()
                            end
                            
                        
                        end)
                    --[[else
                        deferrals.done("German Life Multiplayer1: Du musst Discord mit FiveM verbunden haben und auf unserem Discord Server ( https://discord.gg/jpwdSxX7CK ) sein, um auf dem Server zu Spielen!")
                    end]]
                
            end, 'GET', "", {Authorization = "Bearer ".. apiKeyDiscord})

        --[[else
            setReason("German Life Multiplayer2: Du musst Discord mit FiveM verbunden haben und auf unserem Discord Server ( https://discord.gg/jpwdSxX7CK ) sein, um auf dem Server zu Spielen!")
            CancelEvent()
        end
	else 
		setReason("German Life Multiplayer: Du musst Steam gestartet haben, um auf dem Server zu Spielen!")
		CancelEvent()
	end]]
end)

RegisterCommand('ban', function(source, args)
    local src = source
    getAdminLevel(src)
    if permlevel[src] >= 95 then
        local xTarget = ESX.GetPlayerFromId(args[1])
        if xTarget ~= nil then
            local ident = xTarget.getIdentifier()
            local xPlayer = ESX.GetPlayerFromId(source)
            local date = os.time()
            if tonumber(args[2]) then  
                if args[3]:upper() == 'D' then 
                    date = date + 60 * 60 * 24 * args[2]
                    ------print(os.date('%d.%m.%Y um %H:%M Uhr', date))
                elseif args[3]:upper() == 'H' then 
                    date = date + 60 * 60 * args[2]
                    ------print(os.date('%d.%m.%Y um %H:%M Uhr', date))
                elseif args[3]:upper() == 'M' then 
                    date = date + 60 * 60 * 24 * 30 * args[2]
                    ------print(os.date('%d.%m.%Y um %H:%M Uhr', date))
                else
                    TriggerClientEvent('glmp_singlenotify', source, 'red', 'Bitte gebe eine Zeitform an! (H, D, M)')
                    return
                end
                TriggerClientEvent('openBanReason', source, xTarget.getName(), xTarget.getIdentifier(), date,  os.date('%d.%m.%Y um %H:%M Uhr', date), xPlayer.getName(), xTarget.getName())
            elseif args[2]:upper() == "P" then
                TriggerClientEvent('openBanReason', source, xTarget.getName(), xTarget.getIdentifier(), -1,  "permanent", xPlayer.getName(), xTarget.getName())
            else
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Bitte gebe eine Zeit an!')
            end 
        else
            TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist nicht online')
        end    
    end
    
end)


RegisterCommand('bandc', function(source, args)
    ----print("ban discord id")
    local src = source
    getAdminLevel(src)
    if permlevel[src] >= 95 then
        ----print("had perms")
        local ident = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE discord = @identifier", { ['@identifier'] = args[1]})
        ----print(ident)
        if ident ~= nil then
            ----print("ident found")
            local name = MySQL.Sync.fetchScalar("SELECT displayname FROM users WHERE discord = @identifier", { ['@identifier'] = args[1]})
            local xPlayer = ESX.GetPlayerFromId(source) 
            local date = os.time()
            ----print("checki") 
            if tonumber(args[2]) then  
                if args[3]:upper() == 'D' then 
                    date = date + 60 * 60 * 24 * args[2]
                    ------print(os.date('%d.%m.%Y um %H:%M Uhr', date))
                elseif args[3]:upper() == 'H' then 
                    date = date + 60 * 60 * args[2]
                    ------print(os.date('%d.%m.%Y um %H:%M Uhr', date))
                elseif args[3]:upper() == 'M' then 
                    date = date + 60 * 60 * 24 * 30 * args[2]
                    ------print(os.date('%d.%m.%Y um %H:%M Uhr', date))
                else
                    TriggerClientEvent('glmp_singlenotify', source, 'red', 'Bitte gebe eine Zeitform an! (H, D, M)')
                    return
                end  
                TriggerClientEvent('openBanReason', source, name, ident, date,  os.date('%d.%m.%Y um %H:%M Uhr', date), xPlayer.getName(), name)
            elseif args[2]:upper() == "P" then
                TriggerClientEvent('openBanReason', source, name, ident, -1,  "permanent", xPlayer.getName(), name)
            else 
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Bitte gebe eine Zeit an!')
                ----print("cheki 2")
            end 
        else
            TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist nicht online')
        end    
    end
    
end)



RegisterCommand('checkban', function(source, args)
    local src = source
    getAdminLevel(src)
    if permlevel[src] >= 94 then
        if tonumber(args[1]) ~= nil then
            MySQL.Async.fetchAll("SELECT * FROM bans WHERE id = @ident", {['@ident'] = args[1]}, function(result)
        
                if #result > 0 then  
                    banned = false
                    t = os.time() 
                reason = "Fehler000"
                    
                    
                    for i = 1, #result, 1 do 
                        if result[i].revoked == 0 then
                            if result[i].date == -1 then
                                banned = true 
                                bannedto = "permanent"

                            elseif result[i].date > t then
                                banned = true
                                bannedto = 'bis zum '.. os.date('%d.%m.%Y um %H:%M Uhr', result[i].date)
                            end   
                        else
                            bannedto = "Entbannt von ".. result[i].revokedStaffName
                        end
                        reason = result[i].reason  
                        TriggerClientEvent('glmp_notify', src, 'red', 'BAN (ID: '.. args[1] .. ')' , 'Grund: '.. result[i].reason .. ' | Bis: '.. bannedto .. ' | Von: '.. result[i].staff ) 
                    end  
                    
                else    
                    TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Der Ban wurde nicht gefunden!') 
                end
                
            end) 
        end
    end

end)



RegisterCommand('unban', function(source, args)
    local src = source
    getAdminLevel(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if permlevel[src] >= 95 then
        if tonumber(args[1]) ~= nil then
            MySQL.Async.fetchAll("SELECT * FROM bans WHERE id = @ident", {['@ident'] = args[1]}, function(result)
        
                if #result > 0 then  
                    for i = 1, #result, 1 do
                        if result[i].revoked == 0 then

                            MySQL.Async.fetchAll("UPDATE bans SET revoked = 1 WHERE id = @id", {['@id'] = args[1]})   
                            MySQL.Async.fetchAll("UPDATE bans SET revokedStaff = @staff WHERE id = @id", {['@id'] = args[1], ['@staff'] = xPlayer.getIdentifier()}) 
                            MySQL.Async.fetchAll("UPDATE bans SET revokedStaffName = @staff WHERE id = @id", {['@id'] = args[1], ['@staff'] = xPlayer.getName()}) 
                            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Der Ban wurde erfolgreich Aufgehoben!')  
                        else 
                            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Der Ban wurde bereits Aufgehoben!') 
                        end    
                    end 
                    
                else    
                    TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Der Ban wurde nicht gefunden!') 
                end
                
            end) 
        end
    end

end)

RegisterServerEvent('ban:banPlayer')
AddEventHandler('ban:banPlayer', function(identifier, reason, date, mod, name, modRank)
    ----print("ban player")
    src = source
    if isPlayerBanned(identifier) == nil then 
        banPlayer(identifier, reason, date, mod) 
        

        if mod ~= nil then
            if name ~= nil then  
                if modRank ~= nil then
                    adminRank = modRank 
                else
                    adminRank = 'Teammitglied' 
                end 
                TriggerClientEvent('sendGlobalNotification', -1, adminRank ..' '.. mod .. ' hat den Spieler '.. name .. ' gebannt! (Grund: '.. reason .. ')', "red", "dev", 10000, "red")
            end 
        end 
        local xTarget = ESX.GetPlayerFromIdentifier(identifier) 
        if xTarget ~= nil then
            xTarget.kick("Du wurdest vom GLMP Gameserver gebannt! \n Grund: ".. reason .. '')    
        end  
     
    else 
        TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Der Spieler '.. name .. ' ist bereits Gebannt! (BAN-ID: '.. isPlayerBanned(identifier) .. ')') 
    end 
end)
  
function banPlayer(identifier, reason, date, staff) 
    MySQL.Sync.fetchScalar("INSERT INTO `bans` (`identifier`, `reason`, `date`, `staff`) VALUES (@i, @r, @d, @s)", {['@s'] = staff,['@i'] = 'license:'..identifier, ['@r'] = reason, ['@d'] = date})
    discordInfoBan(identifier)
end

function isPlayerBanned(identifier)
    local banid = MySQL.Sync.fetchScalar("SELECT id FROM bans WHERE identifier = @i AND revoked = 0", {['@i'] = 'license:'..identifier})
    return banid
end


function discordInfoBan(identifier)
    local discord =  MySQL.Sync.fetchScalar("SELECT discord FROM users WHERE identifier = @i", {['@i'] = identifier})

    ------print(discord)
   -- TriggerEvent("discord:sendMessage", discord, "Du wurdest gebannt!")
    if discord ~= 'no' then  
        dname = MySQL.Sync.fetchScalar("SELECT displayname FROM users WHERE identifier = @i", {['@i'] = identifier})
        MySQL.Async.fetchAll("SELECT * FROM bans WHERE identifier = @ident AND revoked = 0", {['@ident'] = 'license:'..identifier}, function(result)
            ------print("LOADED BANS: " .. #result) 
            if #result > 0 then  
                 
                t = os.time() 
                reason = "Fehler000"
                bid = 0
                
                for i = 1, #result, 1 do
                    if result[i].date == -1 then
                        banned = true 
                        bannedto = "permanent"
 
                    elseif result[i].date > t then
                        banned = true
                        bannedto = 'bis zum '.. os.date('%d.%m.%Y um %H:%M Uhr', result[i].date)
                    end    
                    bid = result[i].id
                    reason = result[i].reason 
                
                
                    --deffrals.done("Gebannt")
                    ------print("SEND") 
                    TriggerEvent("discord:sendMessage", discord, "\n\n\nHallo **".. MySQL.Sync.fetchScalar("SELECT displayname FROM users WHERE identifier = @i", {['@i'] = identifier}) .. "**, \n\nLeider musste der GLMP-Support festellen, dass du gegen die Regelwerke von GLMP verstossen hast. Dementsprechend wurde die Freischaltung deines Benutzeraccounts für den GLMP-Gameserver deaktiviert **(BAN-ID: ".. bid ..")**.\nFolgender Verstoss liegt gegen deinen Account vor:\n\n**".. reason .. "**\n\nDie Sperrung deines Accounts ist **" .. bannedto .. "**! Diese Sperre gilt nur für den Gameserver von GLMP und nicht fuer alle Plattformen. Du kannst eine Aufhebung dieser Sperre auf unserem Discord ( https://discord.gg/glmp ) beantragen.\n\nMit freundlichen Gruessen,\nGLMP-Team")
                
                
                end
             
            end
             
        end) 
    end
end