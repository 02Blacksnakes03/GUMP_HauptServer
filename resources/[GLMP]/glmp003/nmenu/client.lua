ESX = nil
local PlayerData = {}

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
--print("lil loaded")



RegisterNUICallback('trigger', function(data, cb)
    if data.args[1] == "XMenu" then
        event2 = json.decode(data.args[3])
        TriggerEvent(event2.arg)
        SetNuiFocus(false, false)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end)

RegisterNetEvent('responseNMenu')
AddEventHandler('responseNMenu', function(data)

    SendNUIMessage({
        action = "open",
        dataItems = json.decode(data)
    })
    SetNuiFocus(true, true)
end)


RegisterNetEvent('1')
AddEventHandler('1', function()
    TriggerServerEvent("TriggerSlotNmenu", 1)
end)

RegisterNetEvent('2')
AddEventHandler('2', function()
    TriggerServerEvent("TriggerSlotNmenu", 2)
end)

RegisterNetEvent('3')
AddEventHandler('3', function()
    TriggerServerEvent("TriggerSlotNmenu", 3)
end)

RegisterNetEvent('4')
AddEventHandler('4', function()
    TriggerServerEvent("TriggerSlotNmenu", 4)
end)

RegisterNetEvent('5')
AddEventHandler('5', function()
    TriggerServerEvent("TriggerSlotNmenu", 5)
end)

RegisterNetEvent('6')
AddEventHandler('6', function()
    TriggerServerEvent("TriggerSlotNmenu", 6)
end)

RegisterNetEvent('7')
AddEventHandler('7', function()
    TriggerServerEvent("TriggerSlotNmenu", 7)
end)

RegisterNetEvent('8')
AddEventHandler('8', function()
    TriggerServerEvent("TriggerSlotNmenu", 8)
end)

RegisterNetEvent('9')
AddEventHandler('9', function()
    TriggerServerEvent("TriggerSlotNmenu", 9)
end)

RegisterNetEvent('10')
AddEventHandler('10', function()
    TriggerServerEvent("TriggerSlotNmenu", 10)
end)

RegisterNetEvent('11')
AddEventHandler('11', function()
    TriggerServerEvent("TriggerSlotNmenu", 11)
end)

RegisterNetEvent('12')
AddEventHandler('12', function()
    TriggerServerEvent("TriggerSlotNmenu", 12)
end)

RegisterNetEvent('13')
AddEventHandler('13', function()
    TriggerServerEvent("TriggerSlotNmenu", 13)
end)

RegisterNetEvent('14')
AddEventHandler('14', function()
    TriggerServerEvent("TriggerSlotNmenu", 13)
end)

RegisterNetEvent('15')
AddEventHandler('15', function()
    TriggerServerEvent("TriggerSlotNmenu", 13)
end)

RegisterNetEvent('16')
AddEventHandler('16', function()
    TriggerServerEvent("TriggerSlotNmenu", 13)
end)

RegisterNetEvent('stopanim')
AddEventHandler('stopanim', function()
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)


RegisterNetEvent('setSlot')
AddEventHandler('setSlot', function(slot)
    setSlot(slot)
end)

RegisterNetEvent('playAnimation')
AddEventHandler('playAnimation', function(dict, anim, flag)
    ClearPedTasksImmediately(GetPlayerPed(-1))

    loadanimdict(dict)

	--TaskPlayAnim(GetPlayerPed(-1), dict, anim, 8.0, -8,-1, flag, 0, 0, 0, 0)
    TaskPlayAnim(GetPlayerPed(-1), dict, anim, 8.0, -8, -1, 9, 0, 0, 0, 0)
end)

RegisterNetEvent('playScenario')
AddEventHandler('playScenario', function(scenarioooo)
    jordanverewigtsichhier = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
    --TaskStartScenarioAtPosition(GetPlayerPed(-1), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", jordanverewigtsichhier['x'], jordanverewigtsichhier['y'], jordanverewigtsichhier['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
    TaskStartScenarioAtPosition(GetPlayerPed(-1),  scenarioooo, jordanverewigtsichhier['x'], jordanverewigtsichhier['y'], jordanverewigtsichhier['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)

end)


function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end

function setSlot(slot)


    ESX.TriggerServerCallback("getAnimCate", function(cate) 

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'category', {
            title    = "Wähle Kategorie",
            align    = 'top-left',
            elements = cate

        }, function(data, menu)

            ESX.UI.Menu.CloseAll()
            ESX.TriggerServerCallback("getAnimbycategory", function(animc) 

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animc', {
                    title    = "Wähle Emote",
                    align    = 'top-left',
                    elements = animc
    
                }, function(data69, menu69)
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Slot2', {
                        title    = "Auf welchen Slot?",
                        align    = 'top-left',
                        elements =    {
                            {label  = "Slot 1", value = "1"},
                            {label  = "Slot 2", value = "2"},
                            {label  = "Slot 3", value = "3"},
                            {label  = "Slot 4", value = "4"},
                            {label  = "Slot 5", value = "5"},
                            {label  = "Slot 6", value = "6"},
                            {label  = "Slot 7", value = "7"},
                            {label  = "Slot 8", value = "8"},
                            {label  = "Slot 9", value = "9"},
                            {label  = "Slot 10", value = "10"},
                            {label  = "Slot 11", value = "11"},
                            {label  = "Slot 12", value = "12"},
                            {label  = "Slot 13", value = "13"}
            
            
                        }
                    }, function(data88, menu88)
                        ESX.UI.Menu.CloseAll()
                        
                        TriggerServerEvent("setslotNmenu", data88.current.value, data69.current.label, data69.current.flag, data69.current.dict, data69.current.animation, data69.current.isScenario)
                    end, function(data88, menu88)
                        menu88.close()
                    end)
                
                end, function(data69, menu69)
                    menu69.close()
                end)
        
            end, data.current.value)

        end, function(data, menu)
            menu.close()
        end)

    end)


end




RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)


AddEventHandler("onResourceStop", function(name)
    if GetCurrentResourceName() ~= name then
        return
    end
    SetNuiFocus(false, false)
    ClearPedTasksImmediately(GetPlayerPed(-1))
end)

CreateThread(function()
    while true do
        Citizen.Wait(0)
       
        if  IsControlJustPressed(0, 166)  then
            if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                --print("category ope")
                category()
            end
        end
    end
end) 

RegisterKeyMapping('emotemenufwet324', "Animtaionsmenu", "keyboard", "N")
RegisterCommand('emotemenufwet324', function()
    if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
        --print("nmenu")
        TriggerServerEvent("requestAnimMenu")
    end
end)

function category()


    ESX.TriggerServerCallback("getAnimCate", function(cate) 

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'category', {
            title    = "Animationen",
            align    = 'top-left',
            elements = cate

        }, function(data, menu)

            ESX.UI.Menu.CloseAll()
            ESX.TriggerServerCallback("getAnimbycategory", function(animc) 

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animc', {
                    title    = "Wähle Emote",
                    align    = 'top-left',
                    elements = animc
        
                }, function(data69, menu69)
                    
                    ClearPedTasksImmediately(GetPlayerPed(-1))

                    loadanimdict(data69.current.dict)
                
                    TaskPlayAnim(GetPlayerPed(-1), data69.current.dict, data69.current.animation, 8.0, -8, -1, data69.current.flag, 0, 0, 0, 0)
                end, function(data69, menu69)
                    menu69.close()
                end)
            
            end, data.current.value)

        end, function(data, menu)
            menu.close()
        end)
    end)
end

