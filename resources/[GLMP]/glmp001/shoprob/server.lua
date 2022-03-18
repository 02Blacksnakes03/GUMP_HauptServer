waitMinutes = 5

---

robbed = {}
activeRob = false
onlineCops = 0
RegisterServerEvent('byte:shopRob:server')
AddEventHandler('byte:shopRob:server', function(id, cops, name)
    print("[SHIPROB] Try to Rob ".. id)
    if activeRob == false then
        if robbed[id] ~= true then 
            local xPlayers = ESX.GetPlayers()
            onlineCops = 0
            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         
                if xPlayer.getJob().name == "police" then 
                    onlineCops = onlineCops + 0
                end

            end
            if onlineCops >= cops then 
                robbed[id] = true  
                activeRob = true
                TriggerClientEvent('byte:shopRob', source)
                for i=1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
              
                    if xPlayer.getJob().name == "police" then 
                        TriggerClientEvent('glmp_notify', xPlayer.source, 'dodgerblue', 'SHOP ALARM', 'Im '.. name .. ' ('.. id ..') wurde ein Stiller Alarm vom Tresor ausgelöst!')
                    end 
    
                end 
            else 
                TriggerClientEvent('glmp_notify', source, '', 'FEHLER', 'Derzeitig können keine Ladenräube gestartet werden! (LSPD)')    
            end 
        else
            TriggerClientEvent('glmp_notify', source, '', 'FEHLER', 'Dieser Tresor wurde bereits Aufgebrochen!')    
        end 
    else 
        TriggerClientEvent('glmp_notify', source, '', 'FEHLER', 'Es läuft bereits ein Shop Rob!')
    end 
end)


RegisterServerEvent('byte:shopRobReady') 
AddEventHandler('byte:shopRobReady', function(id, min, max)
    print("READY ROBBED ".. id .." ")
    local src = source   
    local xPlayer = ESX.GetPlayerFromId(src) 
    local cash = math.random(min, max)   
    xPlayer.showNotification("Du hast Erfolgreich einen Laden ausgeraubt und ".. cash .."$ Schwarzgeld erhalten!")
    xPlayer.addAccountMoney("black_money", cash)
    activeRob = false    
    Wait(60000 * waitMinutes )   
    robbed[id] = false  

end)