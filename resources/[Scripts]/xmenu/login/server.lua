
login = {}
RegisterServerEvent('byte:login')
AddEventHandler('byte:login', function(password)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local pw = MySQL.Sync.fetchScalar("SELECT password FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if pw ~= nil then 
        if password == pw then 
            TriggerClientEvent("sendLoginMsg", src, "successfully")

            login[src] = true
        else
            TriggerClientEvent("sendLoginMsg", src, "Falsches Passwort!")
         
        end
    else
        MySQL.Async.execute('UPDATE users SET password = @pw WHERE identifier = @steam', {['@steam'] = xPlayer.getIdentifier(), ['pw'] = password})
         
        TriggerClientEvent("sendLoginMsg", src, "successfully")
       
        
    end
    local fn = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
       if fn == "" then
            TriggerClientEvent('esx_identity:showRegisterIdentity', src)
       end
end)

RegisterServerEvent('loginKickPlayer')
AddEventHandler('loginKickPlayer', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.kick("Du hast zu lange gebraucht !\n\nAufgrund das du längere Zeit im Login Fenster warst, ohne dich einzuloggen, wurdest du vom Server gekickt!")
end)
rpname = {}
  RegisterServerEvent('requestLogin')
  AddEventHandler('requestLogin', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if rpname[xPlayer.getIdentifier()] == nil then
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @lastname", {['@lastname'] = xPlayer.getIdentifier()}, function(result)
                
           
            for i = 1, #result, 1 do 
                rpname[xPlayer.getIdentifier()] = result[i].firstname .. '_' .. result[i].lastname
            end  
    
             
        end)    
    end
    Wait(250)
    ----print(rpname[xPlayer.getIdentifier()])
    TriggerClientEvent('openLoginScreen', src, rpname[xPlayer.getIdentifier()])
  end)


  ESX.RegisterServerCallback('isPlayerLoggedIn', function(source, cb)
    if login[source] == true then
        cb(true)
    else
        cb(false)
    end
  end)
  