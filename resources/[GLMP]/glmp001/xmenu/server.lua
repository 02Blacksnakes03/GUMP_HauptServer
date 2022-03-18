ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('player_menu:uwe')
AddEventHandler('player_menu:uwe', function(source)
    TriggerClientEvent('glmp_singlenotify', source, 'green', 'Du wurdest stabilisiert!')
	TriggerClientEvent('ds:hide', source, 1)
	TriggerClientEvent('ds:show', source, 2)
	TriggerClientEvent('esx_ambulancejob:stabi', source)
end)

RegisterNetEvent('byte:givecarkeys') 
AddEventHandler('byte:givecarkeys', function(playerid)
	------print("CHECK")
	------print(playerid)
	local xPlayer = ESX.GetPlayerFromId(playerid)
	TriggerClientEvent('openGiveKeyMenu', source, playerid, 'Test_Test', xPlayer.getIdentifier())
end)

RegisterNetEvent('byte:setKeyOwner') 
AddEventHandler('byte:setKeyOwner', function(playerid, identifier, carid)
	------print('triggered setkeyowner')
	------print(playerid)
	------print(identifier)
	------print(carid)
	------print(source)
	local src = source
	------print("ID: " .. src)
	local keyowner = MySQL.Sync.fetchScalar("SELECT keyowner FROM owned_vehicles WHERE id = @owner", { ["@owner"] =  carid}) 
	if keyowner == 'Keiner' then
		local plate = MySQL.Sync.fetchScalar("SELECT plate FROM owned_vehicles WHERE id = @owner", { ["@owner"] =  carid}) 
		MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET keyowner = @identifier WHERE id = @id", { ['@identifier'] = identifier, ['@id'] = carid})
		TriggerClientEvent('glmp_singlenotify', playerid, '', 'Du hast Schlüssel für das Fahrzeug '.. plate .. ' ('.. carid .. ') erhalten!')
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast Schlüssel für das Fahrzeug '.. plate .. ' ('.. carid .. ') vergeben!')
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Die Schlüssel für dieses Fahrzeug sind bereits vergeben!')
	end
end)

RegisterNetEvent('byte:resetKeyOwner')  
AddEventHandler('byte:resetKeyOwner', function(carid)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getMoney() >= 3000 then
		local plate = MySQL.Sync.fetchScalar("SELECT plate FROM owned_vehicles WHERE id = @id", { ["@id"] =  carid}) 
		MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET keyowner = @identifier WHERE id = @id", { ['@identifier'] = 'Keiner', ['@id'] = carid})
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast die Schlösser für das Fahrzeug '.. plate .. '('.. carid .. ') ausgetauscht!')
		TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst 3.000$')
		xPlayer.removeMoney(3000)
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du braucht 3.000$ auf der Hand!')
	end

end)
RegisterNetEvent('byte:activateGps') 
AddEventHandler('byte:activateGps', function(carid)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getMoney() >= 5000 then
		local plate = MySQL.Sync.fetchScalar("SELECT plate FROM owned_vehicles WHERE id = @id", { ["@id"] =  carid}) 
		MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET gps = @identifier WHERE id = @id", { ['@identifier'] = 1, ['@id'] = carid})
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast ein GPS in das Fahrzeug '.. plate .. '('.. carid .. ') eingebaut!')
		TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst 5.000$')
		xPlayer.removeMoney(5000) 
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du braucht 5.000$ auf der Hand!')
	end

end)

RegisterNetEvent('byte:setPlate') 
AddEventHandler('byte:setPlate', function(carid)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getMoney() >= 25000 then
		local plate = MySQL.Sync.fetchScalar("SELECT plate FROM owned_vehicles WHERE id = @id", { ["@id"] =  carid}) 
		MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET keyowner = @identifier WHERE id = @id", { ['@identifier'] = 'Keiner', ['@id'] = carid})
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast die Schlösser für das Fahrzeug '.. plate .. '('.. carid .. ') ausetauscht!')
		TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst 25.000$')
		xPlayer.removeMoney(25000)
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du braucht 25.000$ auf der Hand!')
	end

end)

ESX.RegisterServerCallback("getOwnedPlayerVehicles", function(source, cb)
	
	local ownedVehs = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	------print("ident from ".. source .. ": ".. xPlayer.getIdentifier())
	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @owner", { ["@owner"] =  xPlayer.getIdentifier()}, function(result)

		for i = 1, #result, 1 do
			table.insert(ownedVehs, { id = result[i].id, plate = result[i].plate})
		end  

		cb(ownedVehs)
	end)
end)

ESX.RegisterServerCallback("getVehPlate", function(source, cb, id)
	
	local plate = MySQL.Sync.fetchScalar("SELECT plate FROM owned_vehicles WHERE id = @id", { ["@id"] =  id}) 
	cb(plate)
end)

RegisterNetEvent('player_menu:giveCash')
AddEventHandler('player_menu:giveCash', function(target, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(target)
    local money = xPlayer.getMoney()
    if money >= count then
        xPlayer.removeMoney(count)
        
        xTarget.addMoney(count)
		TriggerClientEvent('glmp_singlenotify', target, 'green', 'Du hast ' ..count.. '$ bekommen')
		TriggerClientEvent('glmp_singlenotify', _source, 'green', 'Du hast jemanden ' ..count.. '$ zugesteckt')
        
        TriggerClientEvent('player_menu:setMax', source, count - 1)
        TriggerClientEvent('player_menu:setMax', target, 1 - count) 
		TriggerEvent('byte:sendLog', 'givecash', "Neue Übergabe", 'Der Spieler '.. GetPlayerName(_source) .. ' hat **'.. count ..'$** an '.. GetPlayerName(target) .. ' gegeben!\n\n**'.. GetPlayerName(_source) ..' Identifiers:**```'.. json.encode( GetPlayerIdentifiers(_source)) ..'```\n\n **'.. GetPlayerName(target) ..' Identifiers:**```'.. json.encode(GetPlayerIdentifiers(target)) ..'```')
    else 
        TriggerClientEvent('glmp_singlenotify', _source, 'red', 'Du hast nicht genug Geld')
    end
end)

RegisterNetEvent('player_menu:handcuff')
AddEventHandler('player_menu:handcuff', function(target)
	TriggerClientEvent('player_menu:handcuff', target)
	
end)

cuffed = {} 
RegisterNetEvent('player_menu:trytoget')
AddEventHandler('player_menu:trytoget', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)
	if xTarget.getInventoryItem('cuffs').count >= 1 then

		TriggerClientEvent('player_menu:handcuffdran', source)
		xTarget.removeInventoryItem('cuffs', 1)
		cuffed[source] = true
	else
		TriggerClientEvent('glmp_singlenotify', target, 'red', 'Du hast keine Kabelbinder')
	end
	
end)

RegisterNetEvent('player_menu:trytoweg')
AddEventHandler('player_menu:trytoweg', function(target)

	local xTarget = ESX.GetPlayerFromId(target)
	xTarget.addInventoryItem('cuffs', 1)
	TriggerClientEvent('player_menu:handcuffweg', source)
	cuffed[source] = false
end)

ESX.RegisterServerCallback('byte:isPlayerCuffed', function(source,cb,playerid)
	local pid = playerid
    if cuffed[pid] == true then
        cb(true) 
    else
        cb(false)
    end
end)
