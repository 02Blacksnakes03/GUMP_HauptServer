ESX = nil
local okay = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("patron_inventory:loadTarget", function(source, cb)
	local s = source
	local x = ESX.GetPlayerFromId(s)
	local data = {
		items = x.getInventory(),
		money = x.getMoney(),
	}
	cb(data)
end)


RegisterCommand('players', function()
	local src = source
	allPlayers = 0
	local xPlayers, xPlayer = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		allPlayers = allPlayers + 1  
	end
	TriggerClientEvent('glmp_singlenotify', src, '', 'Aktuell '.. allPlayers .. ' Spieler.')
end)
RegisterNetEvent('patron_inventory:throwItem')
AddEventHandler('patron_inventory:throwItem', function(name, count)
	local playerPed = GetPlayerPed(-1)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(name)
	
	if tonumber(count) > 0 and sourceItem.count >= tonumber(count) then
		xPlayer.removeInventoryItem(name, count)
		TriggerClientEvent("playanimation", _source)
		TriggerClientEvent('esx:showNotification', _source, "Du hast " ..count.. "x " ..sourceItem.label.. "  weggeworfen.")
	else
		TriggerClientEvent('esx:showNotification', _source, "Soviel hast du nicht!")
	end
end)

ESX.RegisterServerCallback('byte:hasBackpack', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getInventoryItem('backpack').count > 0 then
		cb(true)
	else
		cb(false)
	end
end) 
RegisterNetEvent('patron_inventory:giveItem')
AddEventHandler('patron_inventory:giveItem', function(name, count, target,data)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)
	local sourceItem = xPlayer.getInventoryItem(name)
	if xTarget.getInventoryItem('backpack').count > 0 then
		MaxWeight = 40000
	else
		MaxWeight = 10000
	end
end)

ESX.RegisterServerCallback('byte:hasBackpack2', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getInventoryItem('backpack2').count > 0 then
		cb(true)
	else
		cb(false)
	end
end) 
RegisterNetEvent('patron_inventory:giveItem')
AddEventHandler('patron_inventory:giveItem', function(name, count, target,data)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)
	local sourceItem = xPlayer.getInventoryItem(name)
	if xTarget.getInventoryItem('backpack2').count > 0 then
		MaxWeight = 100000
		print("drake ist ein HS")
	else
		MaxWeight = 10000
	end		
	if sourceItem.weight * count + xTarget.getWeight() <= MaxWeight then
		xPlayer.removeInventoryItem(name, count)
		xTarget.addInventoryItem(name, count)
		TriggerClientEvent("playanimation", _source)
		TriggerClientEvent('reloadInv', target)
		TriggerClientEvent('esx:showNotification', target, "Du hast " ..count.. "x " ..sourceItem.label.. "  bekommen")
		TriggerClientEvent("esx:showNotification", _source, "Du hast jemanden "..count.."x " ..sourceItem.label.." zugesteckt")
		TriggerEvent('byte:sendLog', 'giveitem',  "Neue Item Übergabe", 'Der Spieler '.. GetPlayerName(_source) .. ' hat **'.. count ..'x '.. name ..'** an '.. GetPlayerName(target) .. ' gegeben!\n\n**'.. GetPlayerName(_source) ..' Identifiers:**```'.. json.encode( GetPlayerIdentifiers(_source)) ..'```\n\n **'.. GetPlayerName(target) ..' Identifiers:**```'.. json.encode(GetPlayerIdentifiers(target)) ..'```')
	else 
		TriggerClientEvent("esx:showNotification", _source, "Die Person kann nicht so viel tragen.")
	end
end)

RegisterNetEvent("patron_inventory:packArmor")
AddEventHandler("patron_inventory:packArmor", function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT patron_weste FROM users WHERE `identifier` = @identifier', {["@identifier"] = xPlayer.identifier}, function(result)
		if result[1].patron_weste == "true" then
			MySQL.Async.execute('UPDATE users SET patron_weste = @patron_weste WHERE identifier = @identifier', {['@patron_weste'] =  "false",['@identifier'] =  xPlayer.identifier})
			TriggerClientEvent("patron_inventory:packArmor:2", _source)
			Citizen.Wait(PATRONHABIBI.packArmortime)
			xPlayer.addInventoryItem(PATRONHABIBI.packArmorItem, "1")
			TriggerClientEvent("esx:showNotification", _source, "Du hast deine Schutzweste ausgezogen!")
		else
			MySQL.Async.execute('UPDATE users SET patron_weste = @patron_weste WHERE identifier = @identifier', {['@patron_weste'] =  "false",['@identifier'] =  xPlayer.identifier})
			TriggerClientEvent("esx:showNotification", _source, "Das kannst du zurzeit nicht tun!")
		end
	end)
end)

RegisterNetEvent("patron_inventory:setArmorState")
AddEventHandler("patron_inventory:setArmorState", function(state)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('UPDATE users SET patron_weste = @patron_weste WHERE identifier = @identifier', {['@patron_weste'] =  state,['@identifier'] =  xPlayer.identifier})
end)

function getWeaponbyItem(item)
	for k,v in pairs(PATRONHABIBI.WeaponItems) do
		if item == v.item then
			return k
		end
	end
	return "keinebruda"
end

function getItembyWeapon(weapon)
    for k,v in pairs(PATRONHABIBI.WeaponItems) do
        if weapon == GetHashKey(k) then
            return v.item
        end
    end
    return "keinebruda"
end

function getMunibyItem(item)
	for k,v in pairs(PATRONHABIBI.WeaponItems) do
		if item == v.item then
			return v.ammo
		end
	end
	return "keinebruda"
end

RegisterNetEvent('patron_inventory:useItem')
AddEventHandler('patron_inventory:useItem', function(name)
	local playerPed = GetPlayerPed(-1)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(name)

	if sourceItem.usable then
		if name ~= nil then
			if tonumber(sourceItem.count) >= 1 then
				ESX.UseItem(_source, name)
			end
		end
	else
		if getWeaponbyItem(name) ~= "keinebruda" then
			xPlayer.removeInventoryItem(name, "1")
			xPlayer.addWeapon(getWeaponbyItem(name))
			TriggerClientEvent("esx:showNotification", _source, "Du hast deine "..sourceItem.label.." ausgerüstet!")
		end
	end
end)

RegisterNetEvent("patron_inventory:packGun")
AddEventHandler("patron_inventory:packGun", function(name,ammo)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weapon = getWeaponbyItem(name)
	local sourceItem = xPlayer.getInventoryItem(name)
	local derbremachtmathe = ammo / getMunibyItem(name)
	
	TriggerClientEvent("patron_inventory:packGun:2",_source,sourceItem.label)
	
	for k,v in ipairs(xPlayer.getLoadout()) do
		if v.name:upper() == weapon:upper() then
			xPlayer.removeWeapon(v.name)
		end
	end
	Citizen.Wait(PATRONHABIBI.packArmortime)
	xPlayer.addInventoryItem(name, "1")
end)

 


RegisterNetEvent("patron_inventory:packBGun")
AddEventHandler("patron_inventory:packBGun", function(name,ammo)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weapon = getWeaponbyItem(name)  
	local sourceItem = xPlayer.getInventoryItem(ammo)

	TriggerClientEvent("patron_inventory:packGun:2",_source,'Beamten ' .. sourceItem.label)
	 
	for k,v in ipairs(xPlayer.getLoadout()) do
		if v.name:upper() == getWeaponbyItem(ammo):upper() then
			xPlayer.removeWeapon(v.name)
		end
	end
	Citizen.Wait(PATRONHABIBI.packArmortime)
	xPlayer.addInventoryItem(name, "1")
end)



-----------------------------------------------------------------------------------------------------

ESX.RegisterUsableItem('pistol', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_pistol', 0)
    xPlayer.removeInventoryItem('pistol', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('pistol') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('combatpistol', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_combatpistol', 0)
    xPlayer.removeInventoryItem('combatpistol', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('combatpistol') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('appistol', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_appistol', 0)
    xPlayer.removeInventoryItem('appistol', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('appistol') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('stungun', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_stungun', 0)
    xPlayer.removeInventoryItem('stungun', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('stungun') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('pistol50', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_pistol50', 0)
    xPlayer.removeInventoryItem('pistol50', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('pistol50') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('heavypistol', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_heavypistol', 0)
    xPlayer.removeInventoryItem('heavypistol', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('heavypistol') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('revolver', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_revolver', 0)
    xPlayer.removeInventoryItem('revolver', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('revolver') ..' ausgerüstet.')
end)


ESX.RegisterUsableItem('smg', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_smg', 0)
    xPlayer.removeInventoryItem('smg', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('smg') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('assaultsmg', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_assaultsmg', 0)
    xPlayer.removeInventoryItem('assaultsmg', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('assaultsmg') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('combatpdw', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_combatpdw', 0)
    xPlayer.removeInventoryItem('combatpdw', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('combatpdw') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('assaultrifle', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_assaultrifle', 0)
    xPlayer.removeInventoryItem('assaultrifle', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('assaultrifle') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('carbinerifle', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_carbinerifle', 0)
    xPlayer.removeInventoryItem('carbinerifle', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('carbinerifle') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('advancedrifle', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_advancedrifle', 0)
    xPlayer.removeInventoryItem('advancedrifle', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('advancedrifle') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('specialcarbine', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_specialcarbine', 0)
    xPlayer.removeInventoryItem('specialcarbine', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('specialcarbine') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('bullpuprifle', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_bullpuprifle', 0)
    xPlayer.removeInventoryItem('bullpuprifle', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('bullpuprifle') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('gusenberg', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_gusenberg', 0)
    xPlayer.removeInventoryItem('gusenberg', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('gusenberg') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('flare', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_flare', 25)
    xPlayer.removeInventoryItem('flare', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('flare') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('marksmanrifle', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_marksmanrifle', 6)
    xPlayer.removeInventoryItem('marksmanrifle', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('marksmanrifle') ..' ausgerüstet.')
end)

ESX.RegisterUsableItem('sniperrifle', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
	xPlayer.addWeapon('weapon_sniperrifle', 0)
    xPlayer.removeInventoryItem('sniperrifle', 1)
	TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre '.. ESX.GetItemLabel('sniperrifle') ..' ausgerüstet.')
end)

-- BEAMTEN WAFFEN --

isDuty = {}
RegisterServerEvent('byte:setExternDuty')
AddEventHandler('byte:setExternDuty', function(source, state)
	local src = source
	isDuty[src] = state
	--print(state) 
	--print("set extern duty from " .. isDuty[src] .. " to ".. state)
end)
 

ESX.RegisterUsableItem('beamten_pistol', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_pistol', 0)
			xPlayer.removeInventoryItem('beamten_pistol', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Pistole ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)



ESX.RegisterUsableItem('beamten_advancedrifle', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_advancedrifle', 0)
			xPlayer.removeInventoryItem('beamten_advancedrifle', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Advancedrifle ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)



ESX.RegisterUsableItem('beamten_appistol', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_appistol', 0)
			xPlayer.removeInventoryItem('beamten_appistol', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten APPistole ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_stungun', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_stungun', 0)
			xPlayer.removeInventoryItem('beamten_stungun', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihren Beamten Tazer ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)



ESX.RegisterUsableItem('beamten_nightstick', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv")  
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_nightstick', 0)
			xPlayer.removeInventoryItem('beamten_nightstick', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihren Beamten Schlagstock ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_pistol50', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_pistol50', 0)
			xPlayer.removeInventoryItem('beamten_pistol50', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Pistol .50 ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_heavypistol', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_heavypistol', 0)
			xPlayer.removeInventoryItem('beamten_heavypistol', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Schwere Pistole ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)

ESX.RegisterUsableItem('beamten_revolver', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_revolver', 0)
			xPlayer.removeInventoryItem('beamten_revolver', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihren Beamten Revolver ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_smg', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_smg', 0)
			xPlayer.removeInventoryItem('beamten_smg', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten SMG ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)

ESX.RegisterUsableItem('beamten_assaultsmg', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_assaultsmg', 0)
			xPlayer.removeInventoryItem('beamten_assaultsmg', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Assault SMG ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)

ESX.RegisterUsableItem('beamten_combatpdw', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_combatpdw', 0)
			xPlayer.removeInventoryItem('beamten_combatpdw', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Combat PDW ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)

ESX.RegisterUsableItem('beamten_assaultrifle', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_assaultrifle', 0)
			xPlayer.removeInventoryItem('beamten_assaultrifle', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Assaultrifle ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_carbinerifle', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_carbinerifle', 0)
			xPlayer.removeInventoryItem('beamten_carbinerifle', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Karabiner ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_specialcarbine', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_specialcarbine', 0)
			xPlayer.removeInventoryItem('beamten_specialcarbine', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Spezialkarabiner ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_bullpuprifle', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_bullpuprifle', 0)
			xPlayer.removeInventoryItem('beamten_bullpuprifle', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Bullpuprifle ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_gusenberg', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_gusenberg', 0)
			xPlayer.removeInventoryItem('beamten_gusenberg', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Gusenberg ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_flare', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_flare', 0)
			xPlayer.removeInventoryItem('beamten_flare', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Flare ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	

		
end)

ESX.RegisterUsableItem('beamten_marksmanrifle', function(playerId)
	--print("use")
	
		--print("check") 
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_marksmanrifle', 0)
			xPlayer.removeInventoryItem('beamten_marksmanrifle', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Marksmanrifle ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)


ESX.RegisterUsableItem('beamten_sniperrifle', function(playerId)
	--print("use")
	
		--print("check")  
		local pid = playerId
		if isDuty[pid] == nil then
			isDuty[pid] = 0 
		end
		if isDuty[pid] == 1 then
			--print("positiv") 
			local xPlayer = ESX.GetPlayerFromId(pid)
			xPlayer.addWeapon('weapon_sniperrifle', 0)
			xPlayer.removeInventoryItem('beamten_sniperrifle', 1)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Sie haben ihre Beamten Sniper ausgerüstet.')
		else 
			--print("negga")
			local xPlayer = ESX.GetPlayerFromId(pid)
			TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Diese Waffe kann nur im Staatsdienst verwendet werden.')
		end
	
end)



ESX.RegisterUsableItem('parkkralle', function(playerId)
    --print("using parkkralle") 
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent('byte:client:parkkralle', playerId)
end)


use = {}

ESX.RegisterUsableItem('drill', function(playerId)
    --print("using drill") 
    local xPlayer = ESX.GetPlayerFromId(playerId)
	TriggerClientEvent('byte:client:drill', playerId)
end)


-- AMMO

ESX.RegisterUsableItem('ammo_pistol', function(playerId)
	TriggerClientEvent('byte:use:ammo_pistol', playerId)
end)


ESX.RegisterUsableItem('ammo_smg', function(playerId)
	TriggerClientEvent('byte:use:ammo_smg', playerId)
end)

  

ESX.RegisterUsableItem('ammo_rifle', function(playerId)
	TriggerClientEvent('byte:use:ammo_rifle', playerId)
end)

ESX.RegisterUsableItem('ammo_sniper', function(playerId)
	TriggerClientEvent('byte:use:ammo_sniper', playerId)
end)
  

ESX.RegisterUsableItem('ammo_pump', function(playerId)
	TriggerClientEvent('byte:use:ammo_pump', playerId)
end)


--- B AMMO

ESX.RegisterUsableItem('beamten_ammo_pistol', function(playerId)
	local pid = playerId
	if isDuty[pid] == nil then
		isDuty[pid] = 0
	end
	if isDuty[pid] == 0 then
		TriggerClientEvent('glmp_singlenotify', playerId, '', 'Diese Munition kann nur im Staatsdienst verwendet werden.')
		return
	end 
	TriggerClientEvent('byte:use:ammo_pistol', playerId, true)
end)


ESX.RegisterUsableItem('beamten_ammo_smg', function(playerId)
	local pid = playerId
	if isDuty[pid] == nil then
		isDuty[pid] = 0
	end
	if isDuty[pid] == 0 then
		TriggerClientEvent('glmp_singlenotify', playerId, '', 'Diese Munition kann nur im Staatsdienst verwendet werden.')
		return
	end 
	TriggerClientEvent('byte:use:ammo_smg', playerId, true)
end)

  

ESX.RegisterUsableItem('beamten_ammo_rifle', function(playerId)
	local pid = playerId
	if isDuty[pid] == nil then
		isDuty[pid] = 0
	end
	if isDuty[pid] == 0 then
		TriggerClientEvent('glmp_singlenotify', playerId, '', 'Diese Munition kann nur im Staatsdienst verwendet werden.')
		return
	end 
	TriggerClientEvent('byte:use:ammo_rifle', playerId, true)
end)

ESX.RegisterUsableItem('beamten_ammo_sniper', function(playerId)
	local pid = playerId
	if isDuty[pid] == nil then
		isDuty[pid] = 0
	end
	if isDuty[pid] == 0 then
		TriggerClientEvent('glmp_singlenotify', playerId, '', 'Diese Munition kann nur im Staatsdienst verwendet werden.')
		return
	end 
	TriggerClientEvent('byte:use:ammo_sniper', playerId, true)
end)
  

ESX.RegisterUsableItem('beamten_ammo_pump', function(playerId)
	local pid = playerId
	if isDuty[pid] == nil then
		isDuty[pid] = 0
	end
	if isDuty[pid] == 0 then
		TriggerClientEvent('glmp_singlenotify', playerId, '', 'Diese Munition kann nur im Staatsdienst verwendet werden.')
		return
	end 
	TriggerClientEvent('byte:use:ammo_pump', playerId, true)
end)


--- 
function getPicbyItem(itemname)
    for k,v in pairs(PATRONHABIBI.Items) do
        if itemname == k then
            return v.img
        end
    end
    return PATRONHABIBI.DefaultPic
end


ESX.RegisterServerCallback('spind_loadItems', function(source, cb, ownerId, name)  
    MySQL.Async.fetchAll("SELECT * FROM player_spind WHERE identifier = @ident AND inventory = @name", {['@ident'] = ownerId, ['@name'] = name}, function(result) 
        items = {}
        slot = -1
        for i = 1, #result, 1 do
           
            slot = slot + 1
			table.insert(items, {Id = math.random(99, 9999),Label = ESX.GetItemLabel(result[i].item),Name = result[i].item,Amount = result[i].amount,Weight = 0,Slot = slot, ImagePath = getPicbyItem(result[i].item),MaxStackSize = "99"})
            
			--print(result[i].item)
        end
        Wait(250)
        cb(items)  
        
    end) 

end)

RegisterServerEvent('spind:putItem')
AddEventHandler('spind:putItem', function( item, amount, inv)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local ident = xPlayer.getIdentifier()
	TriggerEvent('byte:sendLog', 'inv', 'Private Inv ('.. inv ..')', 'Der Spieler '.. xPlayer.getName() .. ' legt '.. amount .. 'x '.. item ..' in das Inventar '.. inv ..' .\n\n**Identifiers:**\n\n```'.. json.encode(GetPlayerIdentifiers(source)) .. '```')
	xPlayer.removeInventoryItem(item, amount) 
	local exis = MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE item = @item AND inventory = @inventory AND identifier = @identifier", { ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})
	if exis == nil then
		MySQL.Sync.fetchScalar("INSERT INTO `player_spind` (`id`, `identifier`, `item`, `amount`, `inventory`) VALUES (NULL, @identifier, @item, @amount, @inventory);", {['@identifier'] = ident, ['@item'] = item, ['@amount'] = amount, ['@inventory'] = inv})   
	else
		MySQL.Sync.fetchScalar("UPDATE `player_spind` SET amount = @amount WHERE item = @item AND inventory = @inventory AND identifier = @identifier", {['@amount'] = exis + amount, ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})  
	end
end)

RegisterServerEvent('spind:getItem')
AddEventHandler('spind:getItem', function( item, amount, inv )
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src) 
	local ident = xPlayer.getIdentifier() 
	local am = MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", { ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})
	if am >= amount then
		TriggerEvent('byte:sendLog', 'inv', 'Private Inv ('.. inv ..')', 'Der Spieler '.. xPlayer.getName() .. ' nimmt '.. amount .. 'x '.. item ..' aus dem Inventar '.. inv ..' raus.\n\n**Identifiers:**\n\n```'.. json.encode(GetPlayerIdentifiers(src)) .. '```')
		xPlayer.addInventoryItem(item, amount) 
		local exis = MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", { ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident}) - amount
		if exis > 0 then
			MySQL.Sync.fetchScalar("UPDATE `player_spind` SET amount = @amount WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", {['@amount'] = exis, ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})  
		else
			MySQL.Sync.fetchScalar("DELETE FROM `player_spind` WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", {['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})  
		end
	end 
end)


RegisterServerEvent('gInv:putItem')
AddEventHandler('gInv:putItem', function( item, amount, inv)
	--print("get gitem")
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local ident = 'global'
	TriggerEvent('byte:sendLog', 'inv', 'Global Inv ('.. inv ..')', 'Der Spieler '.. xPlayer.getName() .. ' legt '.. amount .. 'x '.. item ..' in das Inventar '.. inv ..' .\n\n**Identifiers:**\n\n```'.. json.encode(GetPlayerIdentifiers(source)) .. '```')
	xPlayer.removeInventoryItem(item, amount) 
	local exis = MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE item = @item AND inventory = @inventory AND identifier = @identifier", { ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})
	--print(exis)
	if exis == nil then
		MySQL.Sync.fetchScalar("INSERT INTO `player_spind` (`id`, `identifier`, `item`, `amount`, `inventory`) VALUES (NULL, @identifier, @item, @amount, @inventory);", {['@identifier'] = ident, ['@item'] = item, ['@amount'] = amount, ['@inventory'] = inv})   
	else
		MySQL.Sync.fetchScalar("UPDATE `player_spind` SET amount = @amount WHERE item = @item AND inventory = @inventory AND identifier = @identifier", {['@amount'] = exis + amount, ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})  
	end
end)

RegisterServerEvent('gInv:getItem')
AddEventHandler('gInv:getItem', function( item, amount, inv )
	--print("put gitem")
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local ident = 'global' 
	local am = MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", { ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})
	if am >= amount then
		TriggerEvent('byte:sendLog', 'inv', 'Global Inv ('.. inv ..')', 'Der Spieler '.. xPlayer.getName() .. ' nimmt '.. amount .. 'x '.. item ..' aus dem Inventar '.. inv ..' raus.\n\n**Identifiers:**\n\n```'.. json.encode(GetPlayerIdentifiers(src)) .. '```')
		xPlayer.addInventoryItem(item, amount)  
		
		local exis = MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", { ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident}) - amount
		Wait(10)
		if exis > 0 then
			MySQL.Sync.fetchScalar("UPDATE `player_spind` SET amount = @amount WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", {['@amount'] = exis, ['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})  
		else
			MySQL.Sync.fetchScalar("DELETE FROM `player_spind` WHERE item = @item AND inventory = @inventory  AND identifier = @identifier", {['@item'] = item, ['@inventory'] = inv, ['@identifier'] = ident})  
		end
	end
end)