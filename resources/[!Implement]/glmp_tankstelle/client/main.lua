local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX = nil
local PlayerData = {}
local currentTankstelle = "NAN"

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

local blips = {
    vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}

local coordinates = {
	{49.4187, 2778.793, 58.043, "Xero", 1},
    {263.894, 2606.463, 44.983, "Globe Oil", 2},
    {1039.958, 2671.134, 39.550, "Globe Oil", 3},
    {1207.260, 2660.175, 37.899, "Globe Oil", 4},
    {2539.685, 2594.192, 37.944, "Globe Oil", 5 },
    {2679.858, 3263.946, 55.240, "Xero", 6},
    {2005.055, 3773.887, 32.403, "Xero", 7},
    {1687.156, 4929.392, 42.078, "LTD", 8},
    {1701.314, 6416.028, 32.763, "Globe Oil", 9},
    {179.857, 6602.839, 31.868, "Ron", 10},
    {-94.4619, 6419.594, 31.489, "Xero", 11},
    {-2554.996, 2334.40, 33.078, "Ron", 12},
    {-1800.375, 803.661, 138.651, "LTD", 13},
    {-1437.622, -276.747, 46.207, "Ron", 14},
    {-2096.243, -320.286, 13.168, "Xero", 15},
    {-724.619, -935.1631, 19.213, "LTD", 16},
    {-526.019, -1211.003, 18.184, "Xero", 17},
    {-70.2148, -1761.792, 29.534, "LTD", 18},
    {265.648, -1261.309, 29.292, "Xero", 18},
    {819.653, -1028.846, 26.403, "Ron", 19},
    {1208.951, -1402.567, 35.224, "Ron", 20},
    {1181.381, -330.847, 69.316, "LTD", 21},
    {620.843, 269.100, 103.089, "Globe Oil", 22},
    {2581.321, 362.039, 108.468, "Ron", 23},
    {176.631, -1562.025, 29.263; "Ron", 24},
    {-319.292, -1471.715, 30.549, "Globe Oil", 25},
    {1784.324, 3330.55, 41.253, "Globe Oil", 26}
}

local enableField = false
local nearPump = false

function open(vehicle, tankstelle, tid, price)
    SetNuiFocus(true, true)
	enableField = true

	--print(GetVehicleFuelLevel(vehicle))
	SendNUIMessage({
	
		action = "open",
		tanke = tankstelle,
		fuel = GetVehicleFuelLevel(vehicle),
		price = price

    })
end

AddEventHandler('tankstelle:open', function(veh)
	for _k,v in ipairs(coordinates) do
		local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v[1],v[2],v[3])
		if dest < 50 then
			currentTankstelle = v[4]
			tankstelleId = v[5]
		end
	end
	ESX.TriggerServerCallback('glmp_tankstelle:getPrice', function(tankprice)
		open(veh, currentTankstelle, tankstelleId, tankprice)
		--print('Tank: '.. tankprice)
		--print(tankstelleId)
	end, tankstelleId)
end)
  
function close()
	SetNuiFocus(false, false)
	enableField = false
	
	SendNUIMessage({
		action = "close"
	})
end

RegisterNUICallback('escape', function(data, cb)
	close()
end)

local allowedPumps = 
{
    [-2007231801] = true,
	[1339433404] = true,
	[1694452750] = true,
	[1933174915] = true,
	[-462817101] = true,
	[-469694731] = true,
	[-164877493] = true
}

function FindNearestFuelPump()
	local coords = GetEntityCoords(PlayerPedId())
	local fuelPumps = {}
	local handle, object = FindFirstObject()
	local success

	repeat
		if allowedPumps[GetEntityModel(object)] then
			table.insert(fuelPumps, object)
		end

		success, object = FindNextObject(handle, object)
	until not success

	EndFindObject(handle)

	local pumpObject = 0
	local pumpDistance = 1000

	for _, fuelPumpObject in pairs(fuelPumps) do
		local dstcheck = GetDistanceBetweenCoords(coords, GetEntityCoords(fuelPumpObject))

		if dstcheck < pumpDistance then
			pumpDistance = dstcheck
			pumpObject = fuelPumpObject
		end
	end

	return pumpObject, pumpDistance
end

CreateThread(function()
    while true do
        local pumpObject, pumpDistance = FindNearestFuelPump()

		if pumpDistance < 3.5 then
            nearPump = pumpObject
        else
            nearPump = false 
        end

        Wait(500)
    end
end)


Citizen.CreateThread(function()
    for _, coords in pairs(blips) do
        local blip = AddBlipForCoord(coords)

        SetBlipSprite(blip, 361)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Tankstelle")
        EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler('onResourceStart', function(name)
    if GetCurrentResourceName() ~= name then
        return
    end

    close()
end)

RegisterNUICallback('escape', function(data, cb)
    close()
    cb('ok')
end)

local payed = false

RegisterNUICallback('pay', function(data, cb)
	local money = tonumber(data.money)
	local new_perc = tonumber(data.new_perc)
	local change = new_perc - Round(GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
	--print("Tankstelle: ".. tankstelleId .. " New: ".. new_perc .. " Change: " .. change)
	if not payed then
		payed = true
		local f1 = data.fuel
		ESX.TriggerServerCallback('glmp_tankstelle:getFuel', function(fuel)
			if fuel then
				ESX.TriggerServerCallback('glmp_tankstelle:buy', function(bought)
					if bought then
						ESX.ShowNotification(('Du hast $%s bezahlt!'):format(money))

						local veh = GetVehiclePedIsIn(GetPlayerPed(-1), true)

						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(veh)) <= 5.0 then
							SetVehicleFuelLevel(veh, (GetVehicleFuelLevel(veh) + change))
						end
						TriggerServerEvent('byte_tankstelle:addMoney', tankstelleId, money)
						local newF = change - f1
						--print('New: ' .. newF)
						TriggerServerEvent('byte_tankstelle:removeFuel', tankstelleId, newF)
						TriggerClientEvent('byte:sendLog', 'tankstelle', '(Tankstelle '.. tankstelleId .. ') Benzin gekauft', 'Es wurden '.. change .. ' Liter für '.. money .. ' gekauft.')
					else
						ESX.ShowNotification(('Du kannst %s Liter Kraftstoff nicht bezahlen'):format(change))
					end
				end, change, money)
			else
				ESX.ShowNotification('Tankstelle hat kein Benzin mehr.')
			end 
		end, tankstelleId, f1)
	end

    cb('ok')
end)

CreateThread(function()
	while true do
		if payed then
			payed = false
		end

		Wait(500)
	end
end)


RegisterNetEvent('glmp_tankstelle:openMenu')
AddEventHandler('glmp_tankstelle:openMenu', function(tankstelleId)

		local elements = {
			{label = 'Schließen', value = 'close'},
			{label = 'Informationen', value = 'infos'},
			{label = 'Verwalten', value = 'manage'}
		}
	
		
	 
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tankstelle', {
			title    = 'Tankstelle - '.. tankstelleId,
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
	
			if data.current.value == 'close' then 
				ESX.UI.Menu.CloseAll() 
			elseif data.current.value == 'infos' then
				TriggerEvent('glmp_tankstelle:openInfoMenu', tankstelleId)
			elseif data.current.value == 'manage' then
				TriggerEvent('glmp_tankstelle:openManageMenu', tankstelleId)
			end
	
		end, function(data, menu)
			ESX.UI.Menu.CloseAll()
	
		end)
	
end)

RegisterNetEvent('glmp_tankstelle:openInfoMenu')
AddEventHandler('glmp_tankstelle:openInfoMenu', function(tankstelleId)
	ESX.TriggerServerCallback('glmp_tankstelle:getInfos', function(data)
		
		local elements = {
			{label = 'Schließen', value = 'close'},
			{label = 'Zurueck', value = 'back'}, 
			{label = 'Verfübare Liter: '.. data.fuel, value = '1'},
			{label = 'Preis pro Liter: '.. data.price .. '$', value = '1'},
			{label = 'Guthaben: '.. data.money .. '$', value = '1'}
		}
		
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tankstelleInfos', {
				title    = 'Tankstelle - '.. tankstelleId,
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
		
				if data.current.value == 'close' then
					ESX.UI.Menu.CloseAll() 
				elseif data.current.value == 'back' then
					menu.close()
		
				end
		
			end, function(data, menu)
				ESX.UI.Menu.CloseAll()
		
			end)
	end, tankstelleId) 
	
end)

RegisterNetEvent('glmp_tankstelle:openManageMenu')
AddEventHandler('glmp_tankstelle:openManageMenu', function(tankstelleId)

		
		local elements = {
			{label = 'Schließen', value = 'close'},
			{label = 'Zurueck', value = 'back'}, 
			{label = 'Preis pro Liter ändern', value = 'changePrice'},
			{label = 'Benzin nachfüllen', value = 'refill'},
			{label = 'Guthaben auszahlen', value = 'cashout'},
			{label = 'Guthaben einzahlen', value = 'cashin'}
		}
		
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tankstelleManage', {
				title    = 'Tankstelle - '.. tankstelleId,
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
		
				if data.current.value == 'close' then
					ESX.UI.Menu.CloseAll() 
				elseif data.current.value == 'back' then
					menu.close()
				elseif data.current.value == 'refill' then
					ESX.UI.Menu.CloseAll() 
					ESX.TriggerServerCallback('glmp_tankstelle:getLiterPrice', function(literPrice)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'asas',
							{
							title = "Tankstelle - ".. tankstelleId, 
							text = "Fülle Benzin deiner Tankstelle nach. (Aktuller Preis pro Liter: ".. literPrice .."$)"
							},
						function(data2, menu2)



							menu2.close()

							ESX.TriggerServerCallback('glmp_tankstelle:refill', function(cb)
							
							end, tankstelleId, tonumber(data2.value))
							
						end, function(data2, menu2) 
							menu2.close() 
						end)

						
					end, tankstelleId)
				elseif data.current.value == 'cashout' then
					ESX.UI.Menu.CloseAll() 
					ESX.TriggerServerCallback('glmp_tankstelle:getInfos', function(data)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'asas',
							{
							title = "Tankstelle - ".. tankstelleId, 
							text = "Hier kannst du Geld von deinem Tankstellen Konto abheben. (Guthaben: ".. data.money .."$)"
							},
						function(data2, menu2)



							menu2.close()

							ESX.TriggerServerCallback('glmp_tankstelle:cashout', function(cb)
							
							end, tankstelleId, tonumber(data2.value))
							
						end, function(data2, menu2) 
							menu2.close() 
						end)

						
					end, tankstelleId)
				elseif data.current.value == 'cashin' then
					ESX.UI.Menu.CloseAll() 
					ESX.TriggerServerCallback('glmp_tankstelle:getInfos', function(data)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'asas',
							{
							title = "Tankstelle - ".. tankstelleId, 
							text = "Hier kannst du Geld auf dein Tankstellen einzahlen. (Guthaben: ".. data.money .."$)"
							},
						function(data2, menu2)



							menu2.close()

							ESX.TriggerServerCallback('glmp_tankstelle:cashin', function(cb)
							
							end, tankstelleId, tonumber(data2.value))
							
						end, function(data2, menu2) 
							menu2.close() 
						end)

						
					end, tankstelleId)
				elseif data.current.value == 'changePrice' then
					
					ESX.UI.Menu.CloseAll() 
					ESX.TriggerServerCallback('glmp_tankstelle:getInfos', function(data)
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'asas',
							{
							title = "Tankstelle - ".. tankstelleId, 
							text = "Ändere den Liter Preis deiner Tankstelle (Aktuell: ".. data.price .."$ pro Liter )"
							},
						function(data2, menu2)



							menu2.close()

							
							TriggerServerEvent("byte_tankstelle:setPrice", tankstelleId, tonumber(data2.value))
							TriggerEvent('sendPlayerNotification', 'normal', 'Tankstelle '.. tankstelleId, 'Der Preis pro Liter deiner Tankstelle wurde zu '.. data2.value .. '$ gesetzt.', 'blue', 5000)
						end, function(data2, menu2) 
							menu2.close() 
						end)
					end, tankstelleId)

					end

				
			
				end, function(data, menu)
					ESX.UI.Menu.CloseAll()
			
				end)
	
end)

