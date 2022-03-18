waitMinutes = 5

---

robbed = {}
activeRob = false
onlineCops = 0
RegisterServerEvent('byte:staatsbank:server')
AddEventHandler('byte:staatsbank:server', function(id, cops, name)
    print("[STAATSBANK] Try to Rob ".. id)
    local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.getJob().name == "unemployed" then
            if xPlayer.getJob().name == "ambulance" then
                if xPlayer.getJob().name == "police" then
                    if xPlayer.getJob().name == "fib" then
                        if xPlayer.getJob().name == "weazlenews" then
                            return
                        end 
                    end   
                end 
            end 

        end 
        if robbed[id] ~= true then  
            local xPlayers = ESX.GetPlayers()
            onlineCops = 0
            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         
                if xPlayer.getJob().name == "police" then 
                    onlineCops = onlineCops + 1
                end

            end
            if onlineCops >= cops then 
                robbed[id] = true  
                activeRob = true 
                TriggerClientEvent('byte:staatsbank', source)
                for i=1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
              
                    if xPlayer.getJob().name ~= "police" then 
                        if xPlayer.getJob().name ~= "fib" then  
                           return 
                        end
                    end 

                    TriggerClientEvent('glmp_notify', xPlayer.source, 'red', 'STAATSBANK ALARM', 'Im Tresor der Staatsbank wurde ein Stiller Alarm vom Tresor ausgelöst!')
      
                end  
            else 
                TriggerClientEvent('glmp_notify', source, '', 'FEHLER', 'Derzeitig können keine Schließfächer der Staatsbnk aufgebrochen werden!')    
            end 
        else 
            TriggerClientEvent('glmp_notify', source, '', 'FEHLER', 'Dieser Tresor wurde bereits Aufgebrochen!')    
        end 
    
end)

openStaatsbankFach = {}

RegisterServerEvent('byte:staatsbankReady') 
AddEventHandler('byte:staatsbankReady', function(id)
    print("SB | READY ROBBED ".. id .." ")
    local src = source   
    local xPlayer = ESX.GetPlayerFromId(src)  
    openStaatsbankFach[tostring(id)] = true
    Wait(60000 * waitMinutes )    
    robbed[id] = false  
    openStaatsbankFach[tostring(id)] = false
    
 
end)

ESX.RegisterServerCallback('staatsbank:getFachState', function(source, cb, fach)
    cb(openStaatsbankFach[fach])
end)