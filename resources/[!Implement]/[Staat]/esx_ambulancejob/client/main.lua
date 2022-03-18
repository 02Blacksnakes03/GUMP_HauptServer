Keys = {
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
local FirstSpawn, PlayerLoaded = true, false

IsDead = false
Dead = false
ESX = nil
local schlapp = false
local gummi = false
local godmode = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent("einliefern")
AddEventHandler("einliefern", function()
	SetEntityCoords(PlayerPedId(), 314.73, -584.22, 44.2, false, false, false, true)
end)



AddEventHandler('esx:onPlayerSpawn', function()
	IsTot = false

	if FirstSpawn then
		FirstSpawn = false

		if Config.AntiCombatLog then
			while not PlayerLoaded do
				Citizen.Wait(1000)
			end

			ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(shouldDie)
				if shouldDie then
					SetPlayerHealth(GetPlayerPed(-1), -1) 
				end
			end)
		end
	end
end)


-- Disable most inputs when dead
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsDead then
			
			DisableAllControlActions(0)
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			DisableControlAction(0, Keys['TAB'], true)
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			EnableControlAction(0, 1, true) -- Disable pan
			EnableControlAction(0, 2, true) -- Disable tilt
			EnableControlAction(0, 47, true)
			
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if gummi then
			DisableAllControlActions(0)
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			DisableControlAction(0, Keys['TAB'], true)
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			EnableControlAction(0, 1, true) -- Disable pan
			EnableControlAction(0, 2, true) -- Disable tilt
			EnableControlAction(0, 47, true)

		else
			Citizen.Wait(500)
		end
	end
end)




RegisterNetEvent('medic:revivePlayer')
AddEventHandler('medic:revivePlayer', function()
	--print("revive player")
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local closestPlayerPed = GetPlayerPed(closestPlayer)
	local closestPlayerHealth = GetEntityHealth(GetPlayerPed(closestPlayer))
	--print(closestPlayerHealth)
	if closestPlayerHealth == 100 then
		local playerPed = PlayerPedId()
 
		ESX.ShowNotification('Du belebst einen Spieler wieder...')

		local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
 
		for i=1, 15, 1 do
			Citizen.Wait(900) 
	
			ESX.Streaming.RequestAnimDict(lib, function()
				TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
			end)
		end

		TriggerServerEvent('esx_ambulancejob:gehhoch', GetPlayerServerId(closestPlayer))


	else
		ESX.ShowNotification("Der Spieler ist nicht Tot")
	end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsDead then
			if not ( IsEntityPlayingAnim( GetPlayerPed(-1), 'combat@damage@rb_writhe', "rb_writhe_loop", 3 ) ) then 
            	RequestAnimDict('combat@damage@rb_writhe')
        
            	while not HasAnimDictLoaded('combat@damage@rb_writhe') do
                	Citizen.Wait(0)
           		end

	
				TaskPlayAnim(GetPlayerPed(-1), 'combat@damage@rb_writhe' , "rb_writhe_loop", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )    
				PlaceObjectOnGroundProperly(GetPlayerPed(-1))
			

			end
        else
            Citizen.Wait(500)
        end
    end
end)



-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Hospitals) do
		local blip = AddBlipForCoord(v.Blip.coords)

		SetBlipSprite(blip, v.Blip.sprite)
		SetBlipScale(blip, v.Blip.scale)
		SetBlipColour(blip, v.Blip.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('hospital'))
		EndTextCommandSetBlipName(blip)
	end
end)



function OnPlayerDeath()
	ClearPedTasksImmediately(PlayerPedId()) 
	IsDead = true
	godmode = true
	ESX.UI.Menu.CloseAll()
	
	exports['saltychat']:SetRadioChannel('', true) -- radio
	
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
	local playerPed = PlayerPedId()
	
	local pcoords = GetEntityCoords(PlayerPedId())
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
	StartScreenEffect('DeathFailOut', 0, true)
 
	
	SetEntityCoords(PlayerPedId(),-428.95,1110.902,327.69, false, false, false, true)
	
	Wait (1000)

    ResurrectPed(playerPed)
	ClearPedTasksImmediately(playerPed)
	
	RequestAnimDict('combat@damage@rb_writhe')
	
	
	while not HasAnimDictLoaded('combat@damage@rb_writhe') do
		Citizen.Wait(0)
	end

	TaskPlayAnim(GetPlayerPed(-1), 'combat@damage@rb_writhe' , "rb_writhe_loop", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )   

	SetEntityCoords(PlayerPedId(), 	pcoords, false, false, false, true)
  
	Dead = true

	StartDeathTimer()
	StartDebugSignal()
	SendDistressSignal()

	
	DisplayRadar(true)

	SetEntityInvincible(GetPlayerPed(-1), true)
	SetPlayerInvincible(PlayerId(), true)
	SetPedCanRagdoll(GetPlayerPed(-1), false)
	ClearPedBloodDamage(GetPlayerPed(-1))
	ResetPedVisibleDamage(GetPlayerPed(-1))
	ClearPedLastWeaponDamage(GetPlayerPed(-1))
	SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
	SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
	SetEntityCanBeDamaged(GetPlayerPed(-1), false)
	SetEntityHealth(playerPed, 100)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	
end

Citizen.CreateThread(function() --Godmode
	while true do
		Citizen.Wait(1)

		if godmode then
	
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
			SetEntityCanBeDamaged(GetPlayerPed(-1), false)
        else
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(1), true)
			SetEntityCanBeDamaged(GetPlayerPed(1), true)
		end
	end
end)
 




local stabile = false

function StartDistressSignal()
	Citizen.CreateThread(function()
		local timer = Config.BleedoutTimer

		while timer > 0 and IsDead and Dead do
			Citizen.Wait(2)
			timer = timer - 30

			SetTextFont(4)
			SetTextScale(0.45, 0.45)
			SetTextColour(185, 185, 185, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			BeginTextCommandDisplayText('STRING')
			--AddTextComponentSubstringPlayerName(_U('distress_send'))
			EndTextCommandDisplayText(0.175, 0.805)
		end
	
		
	end)
end
function StartDebugSignal()
	Citizen.CreateThread(function()
		local timer = Config.BleedoutTimer

		while timer > 0 and IsDead and Dead do
			Citizen.Wait(2)
			timer = timer - 30

			SetTextFont(4)
			SetTextScale(0.45, 0.45)
			SetTextColour(185, 185, 185, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			BeginTextCommandDisplayText('STRING')
		---	AddTextComponentSubstringPlayerName("Drücke [~r~U~s~] um dich für alle Spieler sichtbar zu machen")
			EndTextCommandDisplayText(0.650, 0.805)

			--[[if IsControlPressed(0, Keys['U']) then
				SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
				Wait(200)
				ClearPedTasksImmediately(GetPlayerPed(-1))

				Citizen.CreateThread(function()

					Citizen.Wait(1000 * 60 * 1)
					if IsDead and Dead then
						ClearPedTasksImmediately(GetPlayerPed(-1))

						StartDebugSignal()
					end
				end)

				break
			end]]
		end
	end)
end



function SendDistressSignal()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local position = {x = coords.x, y = coords.y, z = coords.z}

	TriggerServerEvent("d-phone:server:sendservicemessage", GetPlayerServerId(PlayerId()), "Bewusstlose Person", "LSMD", 0, 1, position, "5")
	TriggerEvent("notifications", "RED", "LSMD", "Dispatch abgeschickt")
end

function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format("%02.f", math.floor(seconds / 3600))
		local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end
local canstabile = true

function StartDeathTimer()
	local canPayFine = false

	if Config.EarlyRespawnFine then
		ESX.TriggerServerCallback('esx_ambulancejob:checkBalance', function(canPay)
			canPayFine = canPay
		end)
	end

	local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)

	Citizen.CreateThread(function()
		-- early respawn timer
		while earlySpawnTimer > 0 and IsDead and Dead do
			Citizen.Wait(1000)

			if earlySpawnTimer > 0 then
				earlySpawnTimer = earlySpawnTimer - 1
				if stabile and canstabile then
					earlySpawnTimer = earlySpawnTimer + 300
					stabile = false
					canstabile = false

				end
			end
		end

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(1000)

			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
			end

		end
	end)

	Citizen.CreateThread(function()
		local text, timeHeld

		-- early respawn timer
		while earlySpawnTimer > 0 and IsDead and Dead do
			Citizen.Wait(0)
	--		text = _U('respawn_available_in', secondsToClock(earlySpawnTimer))

	--		DrawGenericTextThisFrame()

	--		SetTextEntry("STRING")
	--		AddTextComponentString(text)
	--		DrawText(0.5, 0.8)
		end

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead and Dead do
			Citizen.Wait(0)
			text = _U('respawn_bleedout_in', secondsToClock(bleedoutTimer))

			if not Config.EarlyRespawnFine then
				--text = text .. _U('respawn_bleedout_prompt')

				if IsControlPressed(0, Keys['E']) and timeHeld > 60 then
					RemoveItemsAfterRPDeath()
					break
				end
			elseif Config.EarlyRespawnFine and canPayFine then
				--text = text .. _U('respawn_bleedout_fine', ESX.Math.GroupDigits(Config.EarlyRespawnFineAmount))

				if IsControlPressed(0, Keys['E']) and timeHeld > 60 then
					TriggerServerEvent('esx_ambulancejob:payFine')
					RemoveItemsAfterRPDeath()
					break
				end
			end

			if IsControlPressed(0, Keys['E']) then
				timeHeld = timeHeld + 1
			else
				timeHeld = 0
			end

			DrawGenericTextThisFrame()

			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end
			
		if bleedoutTimer < 1 and IsDead and Dead then
			RemoveItemsAfterRPDeath()
		end
	end)
end

function RemoveItemsAfterRPDeath()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			local formattedCoords = {
				x = Config.RespawnPoint.coords.x,
				y = Config.RespawnPoint.coords.y,
				z = Config.RespawnPoint.coords.z
			}

			ESX.SetPlayerData('lastPosition', formattedCoords)
			ESX.SetPlayerData('loadout', {})

			TriggerServerEvent('esx:updateLastPosition', formattedCoords)
			RespawnPed(PlayerPedId(), formattedCoords, Config.RespawnPoint.heading)

			StopScreenEffect('DeathFailOut')
			DoScreenFadeIn(800)
		end)
	end)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)
	Dead = false
	godmode = false

	canstabile = true
	ClearPedTasksImmediately(ped)
	DisplayRadar(true)
	SetEntityInvincible(GetPlayerPed(-1), false)
	SetPlayerInvincible(PlayerId(), false)
	SetPedCanRagdoll(GetPlayerPed(-1), true)
	ClearPedLastWeaponDamage(GetPlayerPed(-1))
	SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
	SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
	SetEntityCanBeDamaged(GetPlayerPed(-1), true)
	SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)

	ESX.UI.Menu.CloseAll()

end



AddEventHandler('esx:onPlayerDeath', function(data)
	OnPlayerDeath()
end)


RegisterNetEvent('esx_ambulancejob:ja')
AddEventHandler('esx_ambulancejob:ja', function()

	TriggerEvent("notifications", "green", "INFO", "Du wurdest stabilsiert!")
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
	
	stabile = true



end)



RegisterNetEvent('esx_ambulancejob:gehhoch')
AddEventHandler('esx_ambulancejob:gehhoch', function()
	
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	Dead = false
	godmode = false

	IsDead = false

	Citizen.CreateThread(function()
	---	DoScreenFadeOut(800)

		--while not IsScreenFadedOut() do
			--Citizen.Wait(50)
	--	end

		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 1),
			y = ESX.Math.Round(coords.y, 1),
			z = ESX.Math.Round(coords.z, 1)
		}

		ESX.SetPlayerData('lastPosition', formattedCoords)

		TriggerServerEvent('esx:updateLastPosition', formattedCoords)

		RespawnPed(playerPed, formattedCoords, 0.0)

		StopScreenEffect('DeathFailOut')
	    --DoScreenFadeIn(800)
		--schlapp = true
		Wait(1000)
		ClearPedTasks(playerPed)
		--schlapp = false
	end)
end)



RegisterNetEvent('esx_ambulancejob:gummihurensohn')
AddEventHandler('esx_ambulancejob:gummihurensohn', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	Dead = false
	godmode = false

	IsDead = false



	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		--DoScreenFadeOut(800)

	--	while not IsScreenFadedOut() do
		--	Citizen.Wait(50)
	--	end

		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 1),
			y = ESX.Math.Round(coords.y, 1),
			z = ESX.Math.Round(coords.z, 1)
		}

		ESX.SetPlayerData('lastPosition', formattedCoords)

		TriggerServerEvent('esx:updateLastPosition', formattedCoords)

		RespawnPed(playerPed, formattedCoords, 0.0)

		StopScreenEffect('DeathFailOut')
		--DoScreenFadeIn(800)
		gummi = true
		Wait(20000)
		gummi = false
		ClearPedTasksImmediately(playerPed)

	
	end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if gummi then
          if not ( IsEntityPlayingAnim( GetPlayerPed(-1), 'missfbi5ig_0', "lyinginpain_loop_steve", 3 ) ) then 
            RequestAnimDict('missfbi5ig_0')
        
            while not HasAnimDictLoaded('missfbi5ig_0') do
                Citizen.Wait(0)
            end

			TaskPlayAnim(GetPlayerPed(-1), 'missfbi5ig_0' , "lyinginpain_loop_steve", 8.0, 1.0, -1, 33, 0, 0, 0, 0 )    
			PlaceObjectOnGroundProperly(GetPlayerPed(-1))

		end
        else
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	IsDead = false
	SetPedCanRagdoll(playerPed, true)
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(50)
		end

		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 1),
			y = ESX.Math.Round(coords.y, 1),
			z = ESX.Math.Round(coords.z, 1)
		}

		ESX.SetPlayerData('lastPosition', formattedCoords)

		TriggerServerEvent('esx:updateLastPosition', formattedCoords)

		RespawnPed(playerPed, formattedCoords, 0.0)

		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(800)
		TriggerServerEvent('KorioZ-PersonalMenu:logRespawn', GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))))
	end)
end)


-- Load unloaded IPLs
if Config.LoadIpl then
	Citizen.CreateThread(function()
		RequestIpl('Coroner_Int_on') -- Morgue
	end)
end



