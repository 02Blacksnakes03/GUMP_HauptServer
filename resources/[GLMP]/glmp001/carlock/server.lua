ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('carlock:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)
	------print(identifier)
	----print(plate)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = ESX.GetPlayerFromId(source).getIdentifier(),
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == ESX.GetPlayerFromId(source).getIdentifier())
		else
			local xPlayer = ESX.GetPlayerFromId(source)
			MySQL.Async.fetchAll('SELECT fraktion FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
				['@owner'] = 'Fraktion',
				['@plate'] = plate
			}, function(resultt)
				if resultt[1] then
					cb(resultt[1].fraktion == xPlayer.getJob().name)
				else 
					local src = source
					local xPlayer = ESX.GetPlayerFromId(src)
					MySQL.Async.fetchAll('SELECT keyowner FROM owned_vehicles WHERE keyowner = @owner AND plate = @plate', {
						['@owner'] = xPlayer.getIdentifier(),
						['@plate'] = plate
					}, function(resultt)
						if resultt[1] then 
							cb(resultt[1].keyowner == xPlayer.getIdentifier())
						else 
							MySQL.Async.fetchAll('SELECT renter FROM owned_vehicles WHERE renter = @owner AND plate = @plate', {
								['@owner'] = xPlayer.getIdentifier(),
								['@plate'] = plate
							}, function(resultt)
								if resultt[1] then 
									cb(resultt[1].renter == xPlayer.getIdentifier())
								else
									cb(false)
								end
							end)
						end
					end)
				end
			end)
		end
	end)
end)


ESX.RegisterServerCallback('carlock:isSperre', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)
	local wegfahrsperre = MySQL.Sync.fetchScalar("SELECT sperre FROM owned_vehicles WHERE plate = @plate", { ['@plate'] = plate})
	if wegfahrsperre ~= nil then
		if wegfahrsperre == 1 then
			cb(true)
		else
			cb(false)
		end
	else
		local wegfahrsperre = MySQL.Sync.fetchScalar("SELECT sperre FROM frak_vehicles WHERE plate = @plate", { ['@plate'] = plate})
		if wegfahrsperre == 1 then
			cb(true)
		else
			cb(false)
		end
	end

	
end)