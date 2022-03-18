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


Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)

--LSPD
RegisterNetEvent('glmp_uniformen:lspdstandard')
AddEventHandler('glmp_uniformen:lspdstandard', function(source)
  local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
    --Männlich
    if skin.sex == 0 then
		local clothesSkin = {
    ['tshirt_1'] = 58,  ['tshirt_2'] = 0,
		['torso_1'] = 55,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 41,
		['pants_1'] = 24,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0
    }
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)  
  ESX.ShowNotification('Du hast dir LSPD Kleidung (Standard) angezogen')
  else--Weiblich    
    local clothesSkin = {
      ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
      }
    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    ESX.ShowNotification('Du hast dir LSPD Kleidung (Standard) angezogen')
    end
	end)
end)   

--LSFD
RegisterNetEvent('glmp_uniformen:lsfdstandard')
AddEventHandler('glmp_uniformen:lsfdstandard', function(source)
  local playerPed = GetPlayerPed(-1)
  TriggerEvent('skinchanger:getSkin', function(skin)
    --Männlich
    if skin.sex == 0 then
		local clothesSkin = {
    ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 123,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 0,
		['pants_1'] = 24,   ['pants_2'] = 5,
		['shoes_1'] = 77,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 126,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0
    }
  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)  
  ESX.ShowNotification('Du hast dir LSFD Kleidung (Standard) angezogen')
  else--Weiblich    
    local clothesSkin = {
      ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 119,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 23,   ['pants_2'] = 0,
			['shoes_1'] = 81,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 96,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
      }
    TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    ESX.ShowNotification('Du hast dir LSFD Kleidung (Standard) angezogen')
    end
	end)
end)   


