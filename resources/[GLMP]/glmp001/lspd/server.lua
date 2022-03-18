ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'police' then
		if xPlayer.job.name ~= 'fib' then
			
			------print(('esx_policejob: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
			return
		end
	end

	TriggerClientEvent('esx_policejob:handcuff', target)
		TriggerClientEvent('glmp_singlenotify', target, '', 'Ein Beamter hat ihnen die Handschellen angelegt/abgenommen!')
end)

RegisterServerEvent('use:s:beamtenschutzweste')
AddEventHandler('use:s:beamtenschutzweste', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem('beamtenweste').count >= 1 then
        
            

            TriggerClientEvent('use:beamtenschutzweste', source)
        
    
    end
end)

ESX.RegisterServerCallback('esx_policejob:getOtherPlayerData', function(source, cb, target)
	
    local xPlayer = ESX.GetPlayerFromId(target)
    local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })

    local firstname = result[1].firstname
    local lastname  = result[1].lastname
    local sex       = result[1].sex
    local dob       = result[1].dateofbirth
    local height    = result[1].height

    local data = {
        name      = GetPlayerName(target),
        job       = xPlayer.job,
        inventory = xPlayer.inventory,
        accounts  = xPlayer.accounts,
        weapons   = xPlayer.loadout,
        firstname = firstname,
        lastname  = lastname,
        sex       = sex,
        dob       = dob,
        height    = height
    }

    TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
        if status ~= nil then
            data.drunk = math.floor(status.percent)
        end
    end)

        TriggerEvent('esx_license:getLicenses', target, function(licenses)
            data.licenses = licenses
            cb(data)
        end)
    

end)

RegisterServerEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.name ~= 'police' then
        if sourceXPlayer.job.name ~= 'fib' then 
            ------print(('esx_policejob: %s attempted to confiscate!'):format(xPlayer.identifier))
            return
        end
	end 

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		--local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then

			-- can the player carry the said amount of x item?
			
				targetXPlayer.removeInventoryItem(itemName, amount)
				--sourceXPlayer.addInventoryItem   (itemName, amount)
				TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
			
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		--sourceXPlayer.addAccountMoney   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		--sourceXPlayer.addWeapon   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
	end
end)

--Entfesseln
RegisterServerEvent('esx_policejob:entfesseln')
AddEventHandler('esx_policejob:entfesseln', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('esx_policejob:entfesseln', target)
	else
		------print(('esx_policejob: %s attempted to uncuff a player (not cop)!'):format(xPlayer.identifier))
	end
end)

--Items 
RegisterServerEvent('esx_policejob:giveItem')
AddEventHandler('esx_policejob:giveItem', function(itemName)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'police' then
		if xPlayer.job.name ~= 'fib' then
			if xPlayer.job.name ~= 'ambulance' then
				return
			end
		end
	end

	local xItem = xPlayer.getInventoryItem(itemName)
	local count = 1

	
		if xPlayer.getInventoryItem('backpack').count > 0 then
			MaxWeight = 40000 
		else
			MaxWeight = 10000
		end
		if xItem.weight * 1 + xPlayer.getWeight() <= MaxWeight then
			xPlayer.addInventoryItem(itemName, 1) 
			TriggerClientEvent('esx:showNotification', source, 'Du hast 1x ' .. ESX.GetItemLabel(itemName) .. ' entnommen.')
		else
			TriggerClientEvent('esx:showNotification', source, 'Deine Inventar Größe reicht nicht aus!')
		end
end)  
--Items Ende

ESX.RegisterServerCallback('canInInventory', function(source, cb, item, count)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local xItem = xPlayer.getInventoryItem(item)


	
		if xPlayer.getInventoryItem('backpack').count > 0 then
			MaxWeight = 40000 
		else
			MaxWeight = 10000
		end
		if xItem.weight * count + xPlayer.getWeight() >= MaxWeight then
			cb(false)
			------print("to false")
		else
			cb(true)
			------print("to true")
		end
end)

 
ESX.RegisterServerCallback('getPlayerInvSize', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local xItem = xPlayer.getInventoryItem(item)


	
		if xPlayer.getInventoryItem('backpack').count > 0 then
			MaxWeight = 40000 
			Slots = 12
		else
			MaxWeight = 10000
			Slots = 6
		end 
		cb({MaxWeight, Slots})
end)



trunkData = {}
ESX.RegisterServerCallback('getVehicleInvSize', function(source, cb, plate, model)
	local src = source
	------print(model)
	------print(plate)
	local xPlayer = ESX.GetPlayerFromId(src)
	if trunkData[plate] ~= nil then
		cb(trunkData[plate])
	else 
		MySQL.Async.fetchAll("SELECT * FROM vehicle_db WHERE model = @ident", {['@ident'] = model}, function(result)
			vehs = {}
			------print(#result)
			if #result < 1 then
				------print("find no")
				MaxWeight = 5000 
				Slots = 2 
				trunkData[plate] = {Slots, MaxWeight}
			else
				------print("find one")
				for i = 1, #result, 1 do
					------print(result[i].trunk_maxweight)
					MaxWeight = result[i].trunk_maxweight 
					Slots = result[i].trunk_slots
					trunkData[plate] = {Slots, MaxWeight}
					
					
				end  
			end   
			cb(trunkData[plate]) 
		end)
	end
end)


