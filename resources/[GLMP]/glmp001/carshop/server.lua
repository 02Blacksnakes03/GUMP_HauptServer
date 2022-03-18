ESX = nil
vehicles = {
	{id = 1, x = 241.68,  y = -1148.0,  z = 28.16, h = 178.87, price = 50000, model = 'bati', plate = "AH1"},
	{id = 2, x = 244.86,  y = -1148.16,  z = 28.24, h = 180.05, price = 50000, model = 'bf400', plate = "AH1"},
	{id = 3, x = 248.12,  y = -1148.28,  z = 28.28, h = 181.59, price = 15000, model = 'manchez2', plate = "AH1"},
	{id = 4, x = 251.31,  y = -1148.32,  z = 28.29, h = 178.73, price = 30000, model = 'nightblade', plate = "AH1"},
	{id = 5, x = 254.84,  y = -1148.73,  z = 28.29, h = 183.86, price = 7500, model = 'faggio2', plate = "AH1"},
	{id = 6, x = 258.19,  y = -1148.82,  z = 28.29, h = 181.86, price = 35000, model = 'zombieb', plate = "AH1"},
	{id = 7, x = 261.64,  y = -1148.75,  z = 28.29, h = 181.44, price = 30000, model = 'zombiea', plate = "AH1"},
	{id = 8, x = 264.47,  y = -1148.63,  z = 28.29, h = 179.33, price = 30000, model = 'wolfsbane', plate = "AH1"},
	{id = 9, x = 262.42,  y = -1162.07,  z = 28.19, h = 1.89, price = 20000, model = 'sanchez', plate = "AH1"},
	{id = 10, x = 259.53,  y = -1162.08,  z = 28.19, h = 0.99, price = 45000, model = 'double', plate = "AH1"},
	{id = 11, x = 256.24,  y = -1162.18,  z = 28.18, h = 2.61, price = 50000, model = 'carbonrs', plate = "AH1"},
	{id = 12, x = 253.3,  y = -1162.15,  z = 28.15, h = 359.86, price = 25000, model = 'akuma', plate = "AH1"},
    {id = 13, x = 1759.84,  y = 3345.6,  z = 40.0, h = 301.1, price = 250000, model = 'caracara2', plate = "AH2"},
    {id = 14, x = 1762.4,  y = 3340.72,  z = 40.12, h = 301.1, price = 360000, model = 'dubsta3', plate = "AH2"},
	{id = 15, x = 1757.28,  y = 3350.28,  z = 40.88, h = 293.19, price = 75000, model = 'dloader', plate = "AH2"},
	{id = 16, x = 1754.8, y = 3355.8,  z = 40.8, h = 295.04, price = 125000, model = 'sandking', plate = "AH2"},
	{id = 17, x = 1751.72,  y = 3361.12,  z = 40.4, h = 288.78, price = 76000, model = 'seminole2', plate = "AH2"},
	{id = 18, x = 1749.84,  y = 3365.24,  z = 40.12, h = 263.99, price = 85000, model = 'mesa', plate = "AH2"},
	{id = 19, x = 1752.84,  y = 3369.88,  z = 38.72, h = 206.88, price = 160000, model = 'kamacho', plate = "AH2"},
	{id = 20, x = 1757.84,  y = 3373.24,  z = 38.36, h = 211.41, price = 150000, model = 'brawler', plate = "AH2"},
	{id = 21, x = 1763.45,  y = 3371.55,  z = 38.54, h = 157.53, price = 210000, model = 'outlaw', plate = "AH2"},
	{id = 22, x = 1765.68,  y = 3367.12,  z = 18.76, h = 150.65, price = 135000, model = 'everon', plate = "AH2"},
	{id = 23, x = 1768.97,  y = 3362.35,  z = 39.96, h = 138.5, price = 50000, model = 'rebel', plate = "AH2"},
	{id = 24, x = 1770.2,  y = 3358.4,  z = 39.16, h = 132.96, price = 45000, model = 'bfinjection', plate = "AH2"},
	{id = 25, x = 1773.0,  y = 3354.24,  z = 39.28, h = 139.61, price = 90000, model = 'patriot', plate = "AH2"},
	{id = 26, x = -145.62,  y = -1346.96,  z = 28.7, h = 181.77, price = 375000, model = 'rebla', plate = "AH3"},
	{id = 27, x = -142.35,  y = -1347.07,  z = 28.7, h = 179.69, price = 345000, model = 'baller4', plate = "AH3"},
	{id = 28, x = -138.98,  y = -1346.98,  z = 28.66, h = 183.29, price = 260000, model = 'xls', plate = "AH3"},
	{id = 29, x = -133.28,  y = -1347.72,  z = 28.51, h = 139.1, price = 380000, model = 'toros', plate = "AH3"},
	{id = 30, x = -149.45,  y = -1353.56,  z = 28.72, h = 272.23, price = 230000, model = 'dubsta2', plate = "AH3"},
	{id = 31, x = -1013.88,  y = -2690.75,  z = 12.97, h = 195.07, price = 7500, model = 'bmx', plate = "LSAP"},
	{id = 32, x = -1008.25,  y = -2681.9,  z = 12.97, h = 198.88, price = 10000, model = 'faggio', plate = "LSAP"},
	{id = 33, x = -1003.57,  y = -2673.64,  z = 12.97, h = 202.32, price = 7500, model = 'cruiser', plate = "LSAP"},
	{id = 34, x = -999.52,  y = -2666.25,  z = 12.97, h = 209.02, price = 11000, model = 'scorcher', plate = "LSAP"},
	{id = 35, x = -91.91,  y = 81.11,  z = 70.61, h = 329.79, price = 750000, model = 't20', plate = "AH4"},
	{id = 36, x = -94.77,  y = 82.96,  z = 70.59, h = 330.64, price = 510000, model = 'schlagen', plate = "AH4"},
	{id = 37, x = -97.83,  y = 84.79, z = 70.57, h = 327.79, price = 320000, model = 'drafter', plate = "AH4"},
	{id = 38, x = -100.83,  y = 86.43,  z = 70.54, h = 331.62, price = 490000, model = 'paragon', plate = "AH4"},
	{id = 39, x = -103.82,  y = 88,  z = 70.52, h = 335.57, price = 185000, model = 'comet2', plate = "AH4"},
	{id = 40, x = -107.14,  y = 89.14,  z = 70.45, h = 330.96, price = 435000, model = 'ninef', plate = "AH4"},
	{id = 41, x = -109.54,  y = 91.54,  z = 70.51, h = 331.41, price = 490000, model = 'neo', plate = "AH4"},
	{id = 42, x = -101.44,  y = 99.54,  z = 71.44, h = 155.76, price = 195000, model = 'schwarzer', plate = "AH4"},
	{id = 43, x = -98.19,  y = 97.95,  z = 71.39, h = 152.63, price = 450000, model = 'seven70', plate = "AH4"},
	{id = 44, x = -95.24,  y = 96.04,  z = 71.31, h = 157.12, price = 1500000, model = 'italirsx', plate = "AH4"},
	{id = 45, x = -92.05,  y = 94.96,  z = 71.33, h = 155.1, price = 375000, model = 'carbonizzare', plate = "AH4"},
	{id = 46, x = -88.79,  y = 93.61,  z = 71.34, h = 159.34, price = 950000, model = 'coquette4', plate = "AH4"},
	{id = 47, x = -85.72,  y = 91.94,  z = 71.34, h = 154.28, price = 755000, model = 'cyclone', plate = "AH4"},
	{id = 48, x = -40.78,  y = -1666.08,  z = 28.48, h = 321.72, price = 10000, model = 'burrito3', plate = "AH5"}, 
	{id = 49, x = -35.35,  y = -1659.53,  z = 28.48, h = 319.69, price = 25000, model = 'gburrito2', plate = "AH5"},
	{id = 50, x = -31.11,  y = -1654.09,  z = 28.48, h = 320.3, price = 103000, model = 'minivan2', plate = "AH5"},
	{id = 51, x = -26.78,  y = -1656.99,  z = 28.48, h = 320.36, price = 83000, model = 'surfer', plate = "AH5"},
	{id = 52, x = -17.91,  y = -1655.28,  z = 28.48, h = 321.28, price = 88000, model = 'speedo', plate = "AH5"},
	{id = 53, x = -14.16,  y = -1650.21,  z = 28.48, h = 319.59, price = 110000, model = 'bison', plate = "AH5"},
	{id = 54, x = -21.32,  y = -1642.19,  z = 28.48, h = 50.52, price = 8000, model = 'moonbeam2', plate = "AH5"},
	{id = 55, x = -24.02,  y = -1645.03,  z = 28.48, h = 49.75, price = 35000, model = 'tornado3', plate = "AH5"},
	{id = 56, x = -227.69,  y = -1161.16,  z = 22.02, h = 177.9, price = 275000, model = 'gauntlet4', plate = "AH6"},
	{id = 57, x = -231.68,  y = -1161.24,  z = 22, h = 184.4, price = 325000, model = 'dominator3', plate = "AH6"},
	{id = 58, x = -236.17,  y = -1161.35,  z = 22.01, h = 184.25, price = 150000, model = 'deviant', plate = "AH6"},
	{id = 59, x = -239.96,  y = -1161.75,  z = 22.03, h = 176.07, price = 231000, model = 'faction3', plate = "AH6"}, 
	{id = 60, x = -223.03,  y = -1183.88,  z = 22.03, h = 359.64, price = 256000, model = 'jugular', plate = "AH6"},
	{id = 61, x = -226.21,  y = -1183.28,  z = 22.03, h = 0.9, price = 313000, model = 'revolter', plate = "AH6"},
	{id = 62, x = -230.3,  y = -1183.03,  z = 22.03, h = 358.05, price = 211000, model = 'komoda', plate = "AH6"},
	{id = 63, x = -234.5,  y = -1182.62,  z = 22.03, h = 6.11, price = 425000, model = 'neon', plate = "AH6"},
	{id = 64, x = -242.11,  y = -1182.45,  z = 22.03, h = 315.49, price = 415000, model = 'cognoscenti', plate = "AH6"},
	{id = 65, x = 1248.47,  y = 2717.38,  z = 37.01, h = 89.41, price = 215000, model = 'schafter3', plate = "AH8"},
	{id = 66, x = 1248.56,  y = 2748.27,  z = 37.01, h = 83.5, price = 300000, model = 'stafford', plate = "AH8"},
	{id = 67, x = 1248.65,  y = 2708.08,  z = 37.01, h = 89.88, price = 155009, model = 'sugoi', plate = "AH8"},
	{id = 68, x = 1250.8,  y = 2702.81,  z = 37.01, h = 117.17, price = 250000, model = 'raiden', plate = "AH8"},
	{id = 69, x = 1253.3,  y = 2698.28,  z = 37.01, h = 122.46, price = 325000, model = 'vstr', plate = "AH8"},
	{id = 70, x = 1209.93,  y = 2712.74,  z = 37.01, h = 179.12, price = 2500000, model = 'pounder', plate = "AH8"},
	{id = 71, x = 1219.58,  y = 2714.26,  z = 37.01, h = 182.13, price = 500000, model = 'mule2', plate = "AH8"},
	{id = 72, x = 1226.83,  y = 2713.85,  z = 37.01, h = 179.28, price = 1550000, model = 'benson', plate = "AH8"}
}



TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
    
end)


carSpawned = {}

Citizen.CreateThread(function()
    Citizen.Wait(10000)  
    while true do 
        Citizen.Wait(10000) 
        local xPlayers = ESX.GetPlayers()
            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                for i = 1, #vehicles, 1 do
            
               
                    Wait(200)
                   -- ------print("spawn veh carshop server for id ".. vehicles[i].id )
                    TriggerClientEvent('carshop:spawnVeh', xPlayer.source, vehicles[i].model,vehicles[i].x,vehicles[i].y,vehicles[i].z,vehicles[i].h,vehicles[i].plate,vehicles[i].id)
                end
            end  
    end 
end) 

--[[Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(1)
        for i = 1, #vehicles, 1 do
            Wait(200)
            id = vehicles[i].id
            if carSpawned[id] ~= 1 then 
                
                local xPlayers = ESX.GetPlayers()
    
                for i=1, #xPlayers, 1 do
                    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                    if carSpawned[id] ~= 1 then
                        carSpawned[id] = 1 
                    TriggerClientEvent('carshop:spawnVeh', xPlayer.source, vehicles[i].model,vehicles[i].x,vehicles[i].y,vehicles[i].z,vehicles[i].h,vehicles[i].plate,vehicles[i].id)
                    end
                    return
                end
              
                  
           end
        end  
    end 
end)]] 

function generateCarPlate()
    local plate = math.random(10000, 99999)
    local exis = MySQL.Sync.fetchScalar("SELECT id FROM owned_vehicles WHERE plate = @identifier", { ['@identifier'] = plate})
    if exis == nil then
        return plate
    else
        generateCarPlate()
    end
end
RegisterServerEvent('carshop:buyVeh')
AddEventHandler('carshop:buyVeh', function(id)
	local xPlayer = ESX.GetPlayerFromId(source)
    for i = 1, #vehicles, 1 do
        --if vehicles[i].id == id then
            
            if xPlayer.getMoney() >= vehicles[id].price then
                local genPlate = generateCarPlate()
                xPlayer.removeMoney(vehicles[id].price) 
				if vehicles[id].plate ~= "LSAP" then
					TriggerClientEvent('carshop:spawnBuyedVeh', xPlayer.source, xPlayer.source, vehicles[id].model, genPlate, 18 ) 
					TriggerClientEvent('glmp_notify', xPlayer.source, 'gold', 'AUTOHAUS', 'Du hast das Fahrzeug '.. vehicles[id].model:upper() .. ' erfolgreich erworben! Es ist nun in der Pillbox Garage verfügbar.')
				else 
					TriggerClientEvent('carshop:spawnBuyedVeh', xPlayer.source, xPlayer.source, vehicles[id].model, genPlate, 20 ) 
					TriggerClientEvent('glmp_notify', xPlayer.source, 'gold', 'AUTOHAUS', 'Du hast das Fahrzeug '.. vehicles[id].model:upper() .. ' erfolgreich erworben! Es ist nun in der LSAP Garage verfügbar.')
				 
					TriggerClientEvent('sendPlayerNotification', xPlayer.source, 'normal', '', "ACHTUNG: Das Auto kannst du nun in der Garage auf dem Parkplatz neben dir, wo eine Garage gekenzeichnet ist, Ausparken!", 'red', 30000)
				end   
                TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'green', 'Du bezahlst '.. vehicles[id].price .. '$!') 
            else
                TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'red', 'Du hast nicht genug Geld dabei!')
            end
			return
       -- end
    end
end)    
ESX.RegisterServerCallback('carshop:getVehicles', function(source, cb)

    cb(vehicles)
end)


RegisterServerEvent('carshop:setVehicle')
AddEventHandler('carshop:setVehicle', function (vehicleProps, playerID, g)
	------print("set vehicle for ".. playerId .. " with plate ".. vehicleProps.plate)
	local _source = playerID
	local xPlayer = ESX.GetPlayerFromId(_source)
  
	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type, state, garage) VALUES (@owner, @plate, @vehicle, @stored, @type, @state, @garage)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@stored']  = 1,
        ['@state'] = 0,
        ['@garage'] = g,
		['type'] = "car"
	}, function ()
		--
	end)
end)

RegisterServerEvent('admin:setVehicle')
AddEventHandler('admin:setVehicle', function (vehicleProps, frak, g)
	------print("set vehicle for ".. playerId .. " with plate ".. vehicleProps.plate)
	
  
	MySQL.Async.execute('INSERT INTO owned_vehicles (owner, fraktion, plate, vehicle, stored, type, state, garage) VALUES (@owner, @fraktion, @plate, @vehicle, @stored, @type, @state, @garage)',
	{
		['@owner']   = "Fraktion",
		['@plate']   = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps),
		['@fraktion'] = frak,
		['@stored']  = 1,
        ['@state'] = 0,
        ['@garage'] = g,
		['type'] = "car"
	}, function ()
		--
	end)
end)

 
RegisterServerEvent('admin:setVehicleOwn')
AddEventHandler('admin:setVehicleOwn', function (vehicleProps, playerid)
	------print("set vehicle for ".. playerId .. " with plate ".. vehicleProps.plate)
	local src = source 
	local xTarget = ESX.GetPlayerFromId(playerid)
	if xTarget ~= nil then 
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, fraktion, plate, vehicle, stored, type, state, garage) VALUES (@owner, @fraktion, @plate, @vehicle, @stored, @type, @state, @garage)',
		{
			['@owner']   = xTarget.getIdentifier(),
			['@plate']   = vehicleProps.plate,
			['@vehicle'] = json.encode(vehicleProps),
			['@fraktion'] = "Keine",
			['@stored']  = 1,
			['@state'] = 0,
			['@garage'] = 18, 
			['type'] = "car"
		}, function () 
			--
		end) 
		TriggerClientEvent('glmp_notify', xTarget.source, '', 'AUTOVERGABE', 'Du hast das Fahrzeug '.. vehicleProps.model:upper() .. ' erhalten. Es ist nun in der Würfelpark Garage verfügbar.')
		TriggerClientEvent('glmp_notify', src, '', 'AUTOVERGABE', 'Der Spieler '.. xTarget.getName() .. ' hat das Fahrzeug '.. vehicleProps.model:upper() .. ' erhalten.')
	else
		print("cannot set car for ".. playerid)
		TriggerClientEvent('glmp_notify', src, '', 'AUTOVERGABE', 'Fahrzeug konnte nicht vergeben werden. Spieler ist nicht online!')
	end
end)