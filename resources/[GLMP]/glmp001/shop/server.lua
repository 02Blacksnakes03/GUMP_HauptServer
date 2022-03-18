ESX = nil

local backpack  = 0

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterServerCallback('shop:getPlayerMoney', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	cb(xPlayer.getMoney())
end)

RegisterServerEvent('shop:pay')
AddEventHandler('shop:pay', function(price)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.removeMoney(price)
	TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst '.. price .. '$!')
end)

RegisterServerEvent('shop:giveItem')
AddEventHandler('shop:giveItem', function(item, count)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addInventoryItem(item, count)
end)
ESX.RegisterServerCallback('glmp_shops:loadItems', function(source, cb, type)
	------print("load shop with type ".. type)
	MySQL.Async.fetchAll('SELECT * FROM shops WHERE category = @type', {['@type'] = type}, function(shops)
		cb(shops)
	end)
end)
 

