ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback('lspd:automat:getPayTicketSumme', function( source , cb )
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local ident = xPlayer.getIdentifier()
    MySQL.Async.fetchAll("SELECT * FROM player_crimes WHERE player = @ident AND jailTime = @jail", {['@ident'] = ident, ['@jail'] = 0}, function(result)
        ld = 0
        sank = 0
		for i = 1, #result, 1 do
            ld = ld + 1 
            
            sank = sank + result[i].jailCosts

		end 
        Wait(100)  
 
		cb(sank) 
	end)
end)

RegisterServerEvent('payTickets')
AddEventHandler('payTickets', function(cash)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= cash then
        xPlayer.removeMoney(cash)
        MySQL.Sync.fetchScalar("DELETE FROM player_crimes WHERE player = @identifier AND jailTime = @jail", { ['@identifier'] = xPlayer.getIdentifier(), ['@jail'] = 0})
        TriggerClientEvent('glmp_singlenotify', src, '', 'Deine Akten wurden erlassen!') 
        TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst '.. cash .. '$!')
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Geld dabei!')
    end
end)

RegisterServerEvent('buyGunLic')
AddEventHandler('buyGunLic', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= 50000 then
        xPlayer.removeMoney(50000)
        MySQL.Sync.fetchScalar("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", { ['@type'] = 'weapon',  ['@owner'] = xPlayer.getIdentifier()})
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast einen Waffenschein erhalten.') 
        TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst 50.000$!')
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Geld dabei!')
    end
end)