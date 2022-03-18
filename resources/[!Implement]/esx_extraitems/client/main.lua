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
local usedmunition = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer 
end)

-- Start of Dark Net

-- End of Dark Net
-- Start of Oxygen Mask


-- End of Oxygen Mask

-- Start of First Aid Kit

RegisterNetEvent('esx_extraitems:firstaidkit')
AddEventHandler('esx_extraitems:firstaidkit', function()
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed)
	local max = GetEntityMaxHealth(playerPed)
	
	if health > 0 and health < max then
		ESX.ShowNotification(_U('use_firstaidkit'))
		
		health = health + (max / 4)
		if health > max then
			health = max
		end
		SetEntityHealth(playerPed, health)
	end
end)


RegisterNetEvent('byte:use:ammo_pistol')
AddEventHandler('byte:use:ammo_pistol', function(b)
	local weaponHash = GetSelectedPedWeapon(PlayerPedId())
	local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
	--print(ammoType) 
	TriggerServerEvent('byte:sendLog', 'admin', 'AMMO HASH', ammoType)
	if ammoType == 1950175060 then 
		exports['glmp_progress']:startUI(4000)
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
		Citizen.Wait(4000)
		ClearPedTasksImmediately(PlayerPedId())
		AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
		if b == true then
			TriggerServerEvent('byte:removeItem', 'beamten_ammo_pistol')
		else
			TriggerServerEvent('byte:removeItem', 'ammo_pistol')
		end
		TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
	else
		TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
	end
end)
 
RegisterNetEvent('byte:use:ammo_smg')
AddEventHandler('byte:use:ammo_smg', function(b)
	local weaponHash = GetSelectedPedWeapon(PlayerPedId())
	local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
	if ammoType == 1820140472 then  
		exports['glmp_progress']:startUI(4000)
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
		Citizen.Wait(4000)
		ClearPedTasksImmediately(PlayerPedId())
		AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
		if b == true then
			TriggerServerEvent('byte:removeItem', 'beamten_ammo_smg')
		else
			TriggerServerEvent('byte:removeItem', 'ammo_smg')
		end
		TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
	else
		TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
	end
end)


RegisterNetEvent('byte:use:ammo_rifle')
AddEventHandler('byte:use:ammo_rifle', function(b)
	local weaponHash = GetSelectedPedWeapon(PlayerPedId())
	local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
	if ammoType == 218444191 then  
		exports['glmp_progress']:startUI(4000)
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
		Citizen.Wait(4000)
		ClearPedTasksImmediately(PlayerPedId())
		AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
		if b == true then
			TriggerServerEvent('byte:removeItem', 'beamten_ammo_rifle')
		else
			TriggerServerEvent('byte:removeItem', 'ammo_rifle')
		end
		TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
	else
		TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
	end
end)

 
RegisterNetEvent('byte:use:ammo_sniper')
AddEventHandler('byte:use:ammo_sniper', function(b)
	local weaponHash = GetSelectedPedWeapon(PlayerPedId())
	local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
	if ammoType == 1285032059 then  
		exports['glmp_progress']:startUI(4000)   
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
		Citizen.Wait(4000)
		ClearPedTasksImmediately(PlayerPedId())
		AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
		if b == true then
			TriggerServerEvent('byte:removeItem', 'beamten_ammo_sniper')
		else
			TriggerServerEvent('byte:removeItem', 'ammo_sniper')
		end
		TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
	else
		TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
	end
end)


RegisterNetEvent('byte:use:ammo_pump')
AddEventHandler('byte:use:ammo_pump', function(b)
	local weaponHash = GetSelectedPedWeapon(PlayerPedId())
	local ammoType = GetPedAmmoTypeFromWeapon_2(PlayerPedId(), weaponHash)
	if ammoType == -1878508229 then  
		exports['glmp_progress']:startUI(4000)   
		TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
		Citizen.Wait(4000)
		ClearPedTasksImmediately(PlayerPedId()) 
		AddAmmoToPed(GetPlayerPed(-1), weaponHash, 30) 
		if b == true then
			TriggerServerEvent('byte:removeItem', 'beamten_ammo_pump')
		else
			TriggerServerEvent('byte:removeItem', 'ammo_pump')
		end
		TriggerEvent('glmp_singlenotify', '', 'Du hast ein Magazin verwendet!')   
	else
		TriggerEvent('glmp_singlenotify', '', 'Dieses Magazin passt nicht in diese Waffe!') 
	end
end)



--[[RegisterNetEvent('esx_extraitems:clipcli')
AddEventHandler('esx_extraitems:clipcli', function()
	local playerPed = GetPlayerPed(-1)
	ped = GetPlayerPed(-1)
	if IsPedArmed(ped, 4) then
		hash = GetSelectedPedWeapon(ped)
		if hash ~= nil then
			usedmunition = true
			exports['glmp_progress']:startUI(2000)
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_PARKING_METER', 0, true)
			Citizen.Wait(2000)
			ClearPedTasksImmediately(playerPed)
			AddAmmoToPed(GetPlayerPed(-1), hash,60)
			--ESX.ShowNotification(_U("clip_use"))
			usedmunition = false
		else
			ESX.ShowNotification(_U("clip_no_weapon"))
		end
	else
		--ESX.ShowNotification(_U("clip_not_suitable"))
	end
end)]]

--Keys blockieren beim Munition Usen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if usedmunition then
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 74, true)
			DisableControlAction(0, 2, true) 
			DisableControlAction(0, 263, true) 
			DisableControlAction(0, 45, true) 
			DisableControlAction(0, 22, true) 
			DisableControlAction(0, 44, true) 
			DisableControlAction(0, 37, true) 
			DisableControlAction(0, 288, true) 
			DisableControlAction(0, 289, true) 
			DisableControlAction(0, 170, true) 
			DisableControlAction(0, 167, true) 
            DisableControlAction(1, 254, true)
            DisableControlAction(0, 47, true)  
        end
    end
end)