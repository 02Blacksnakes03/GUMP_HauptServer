ESX = nil
outVehs = {}
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local Garage = nil
RegisterServerEvent('currentgarage')
AddEventHandler('currentgarage', function(usedGarage)

	Garage = usedGarage
end)
RegisterServerEvent('garage:setParkedOut')
AddEventHandler('garage:setParkedOut', function(plate)
	outVehs[plate] = true
end)
vehName = {}


AddEventHandler('setVehicleName', function(plate, name)
    vehName[plate] = name
end) 

RegisterServerEvent('garage:loadVehicles')
AddEventHandler('garage:loadVehicles', function()
	------print("loadVehicles!")
	local ownedCars = {}
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `owner` = @owner AND `garage` = @garage  AND `stored` = 1 AND `state` = 0'   , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

		for _,v in pairs(vehicles) do
			local vehicle = json.decode(v.vehicle) 
			TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
			Wait(125)
				
				table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Eigentum'})
			
		end 

		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `keyowner` = @owner AND `garage` = @garage  AND `stored` = 1 AND `state` = 0'   , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

			for _,v in pairs(vehicles) do
				local vehicle = json.decode(v.vehicle)
				TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
				Wait(125)
				
				table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Schlüssel'})
			
			end
			
			
			MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `fraktion` = @owner AND `garage` = @garage  AND `stored` = 1 AND `state` = 0'   , {['@owner'] = x.getJob().name , ['@garage'] = Garage}, function(vehicles)

				for _,v in pairs(vehicles) do
					local vehicle = json.decode(v.vehicle)
					TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
					Wait(125)
				
				table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Fraktion'})
			
				end
				
				MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `renter` = @owner AND `garage` = @garage  AND `stored` = 1 AND `state` = 0'   , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

					for _,v in pairs(vehicles) do
						local vehicle = json.decode(v.vehicle)
						TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
						Wait(125)
					
					table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Miete'})
				
					end
					Wait(250) 
					TriggerClientEvent('responseVehicles', s, ownedCars)	
				end)

			end)
			
		end)
		 
	end) 

	
	local ocars = ownedCars
	--TriggerClientEvent('responseVehicles', s, ocars)
end)
onMapVeh = {}
RegisterServerEvent('vehicleOnMap')
AddEventHandler('vehicleOnMap', function(plate, exist)
	onMapVeh[plate] = exist
end)
RegisterServerEvent('impound:loadVehicles')
AddEventHandler('impound:loadVehicles', function()
	------print("loadVehicles!")
	local ownedCars = {}
	local s = source 
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `owner` = @owner AND `stored` = 0 AND `state` = 1'   , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

		for _,v in pairs(vehicles) do
			local vehicle = json.decode(v.vehicle) 
			TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
			Wait(125)
				
				table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Eigentum'})
			 
		end 

		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `keyowner` = @owner AND `stored` = 0 AND `state` = 1'  , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

			for _,v in pairs(vehicles) do
				local vehicle = json.decode(v.vehicle)
				TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
				Wait(125)
				
				table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Schlüssel'})
			
			end
			
			
			MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `fraktion` = @owner AND `stored` = 0 AND `state` = 1'  , {['@owner'] = x.getJob().name , ['@garage'] = Garage}, function(vehicles)

				for _,v in pairs(vehicles) do
					local vehicle = json.decode(v.vehicle)
					TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
					Wait(125)
				
				table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Fraktion'})
			
				end
				
				MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `renter` = @owner AND `stored` = 0 AND `state` = 1'   , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

					for _,v in pairs(vehicles) do 
						local vehicle = json.decode(v.vehicle)
						TriggerClientEvent('requestVehicleName', s, vehicle.plate, vehicle.model)
						Wait(125)
					
					table.insert(ownedCars, {Id = v.plate, Name = vehName[vehicle.plate], Plate = 'Miete'})
				
					end
					Wait(250)  
					TriggerClientEvent('responseVehicles', s, ownedCars)	
				end)

			end)
			
		end)
		 
	end) 

	
	local ocars = ownedCars
	--TriggerClientEvent('responseVehicles', s, ocars)
end)
 
ESX.RegisterServerCallback('impound:parkOutVehicle', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getMoney() > 1000 then
		xPlayer.removeMoney(1000)
		TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'green', 'Du bezahlst 1.000$!')
		cb(true)
	else
		cb(false)
	end
end)
--[[ESX.RegisterServerCallback('garage:loadVehicles1', function(source, cb)
	
	local ownedCars = {}
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `keyowner` = @owner AND `garage` = @garage  AND `stored` = 1 AND `state` = 0'   , {['@owner'] = x.identifier , ['@garage'] = Garage}, function(vehicles)

		for _,v in pairs(vehicles) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedCars, {Id = v.id, Name = v.name, Plate = v.plate})
		end
		cb(ownedCars)
	end)
end)]]

ESX.RegisterServerCallback('garage:loadVehicle', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `plate` = @plate', {['@plate'] = plate}, function(vehicle)

		
		cb(vehicle)
	end)
end)

ESX.RegisterServerCallback('garage:loadVehicleId', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `id` = @plate', {['@plate'] = plate}, function(vehicle)

		
		cb(vehicle)
	end)
end)
 


ESX.RegisterServerCallback('garage:isOwned', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)

	local s = source
	local x = ESX.GetPlayerFromId(s)
	------print("is owned ".. plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `plate` = @plate', {['@plate'] = plate, ['@owner'] = x.identifier}, function(res)
		------print("owner from ".. plate .. " is " .. res[1].owner)
		if res[1].owner == x.getIdentifier() then 
			cb({true, 'Eigentum'})
			------print("own")
		elseif res[1].keyowner == x.getIdentifier() then
			cb({true, 'Schlüssel'})
			------print("key own") 
		elseif res[1].renter == x.getIdentifier() then
			cb({true, 'Miete'})
			------print("key own")
		--[[elseif res[1].fraktion == x.getJob().name then
			cb({true, 'Fraktion'})
			------print("frak own")]]
		else
			cb({false})
			------print("no own")
		end
	end)
end)


ESX.RegisterServerCallback('garage:isOwnedFrak', function(source, cb, plate)
	
	local s = source
	local x = ESX.GetPlayerFromId(s)

	local s = source
	local x = ESX.GetPlayerFromId(s)
	------print("is owned ".. plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE `plate` = @plate', {['@plate'] = plate, ['@owner'] = x.identifier}, function(res)
		------print("owner from ".. plate .. " is " .. res[1].owner)
		
		if res[1].fraktion == x.getJob().name then
			cb({true, 'Fraktion'})
			------print("frak own")
		else
			cb({false})
			------print("no own")
		end
	end)
end)


RegisterNetEvent('garage:changeState')
AddEventHandler('garage:changeState', function(plate, state)

	local state2
	if state == 1 then
		state2 = 0
	else
		state2 = 1
	end
	MySQL.Sync.execute("UPDATE owned_vehicles SET `stored` = @state  WHERE `plate` = @plate", {['@state'] = state, ['@plate'] = plate})
	MySQL.Sync.execute("UPDATE owned_vehicles SET `garage` = @garage WHERE `plate` = @plate", {['@plate'] = plate, ['@garage'] = Garage})
	MySQL.Sync.execute("UPDATE owned_vehicles SET `state` = @garage WHERE `plate` = @plate", {['@plate'] = plate, ['@garage'] = state2})
	
end)



RegisterNetEvent('garage:saveProps')
AddEventHandler('garage:saveProps', function(plate, props)
	local xProps = json.encode(props)
	MySQL.Sync.execute("UPDATE owned_vehicles SET `vehicle` = @props WHERE `plate` = @plate", {['@plate'] = plate, ['@props'] = xProps})
end)

