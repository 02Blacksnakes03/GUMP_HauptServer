
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 1800 then
        CreateThread(function()
            TriggerClientEvent('sendGlobalNotification', -1, '[AUTO-RESTART] Der Server wird in 30 Minuten Automatisch neugestartet.', "#d9a30f", "glob", 10000, "red")
        end)

    elseif eventData.secondsRemaining == 600 then
        CreateThread(function()
          
            TriggerClientEvent('sendGlobalNotification', -1, '[AUTO-RESTART] Der Server wird in 10 Minuten Automatisch neugestartet.', "#d9a30f", "glob", 10000, "red")
        end)
    elseif eventData.secondsRemaining == 300 then
        TriggerClientEvent('blackout', -1) 
        CreateThread(function()
            TriggerClientEvent('sendGlobalNotification', -1, '[AUTO-RESTART] Der Server wird in 5 Minuten Automatisch neugestartet.', "#d9a30f", "glob", 10000, "red")
         
        end)
   
    elseif eventData.secondsRemaining == 60 then
        CreateThread(function()
            --TriggerClientEvent('byte_broadcast:show', -1, '[AUTO-RESTART] Der Server wird in einer Minute Automatisch neugestartet.<br>Bitte trenne Jetzt deine Verbindung!', 'gold', 'warning')
            TriggerClientEvent('sendGlobalNotification', -1, '[AUTO-RESTART] Der Server wird in einer Minute Automatisch neugestartet.', "#d9a30f", "glob", 10000, "red")
        end)
    end
end) 

