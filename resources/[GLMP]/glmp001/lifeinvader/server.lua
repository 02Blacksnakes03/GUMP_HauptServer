RegisterServerEvent('lifeinvader:pay')
AddEventHandler('lifeinvader:pay', function(price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeMoney(price) 
    TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst ' .. price .. '$!')
end)