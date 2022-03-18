ESX.RegisterUsableItem('geschenk', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('geschenk', 1)  
    TriggerClientEvent('byte:normalesgeschenk', xPlayer.source)
    xPlayer.showNotification('Du hast ein Geschenk eingelöst.')
    print("einlösen")
end)  


RegisterServerEvent('w:getGeschenk')
AddEventHandler('w:getGeschenk', function()
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll('SELECT * FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = xPlayer.getIdentifier()
	}, function(result)
		if result[1].wgeschenk == 0 then   
            xPlayer.addInventoryItem('geschenk', 1)  
            MySQL.Sync.fetchScalar("UPDATE `users` SET `wgeschenk` = 1 WHERE identifier = @identifier;", { ['@identifier'] = xPlayer.getIdentifier()})
            xPlayer.showNotification('Du hast ein Normales Geschenk erhalten! Viel Spaß beim öffnen...')
		else   
			xPlayer.showNotification('Du hast dein Geschenk für Heute bereits abgeholt!')
		end
	end)
end)  