RegisterNetEvent("realtime:event")
AddEventHandler("realtime:event", function()
	TriggerClientEvent("realtime:event", source, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end) 

RegisterCommand('sw', function(source, args)
    TriggerClientEvent('vSync:updateWeather', -1, args[1], args[2])
end) 