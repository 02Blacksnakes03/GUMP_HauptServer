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
houseReload = 0
houseId = nil
houseOutside = nil
local PlayerData = {}
local currentHouse = ""
local inHouse = false
local lh = 0
local coordinates = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
   
    PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('byte_house:getHouses', function(result)
        local coordinatesS = {}
        print("gethouses")
        if #result == 0 then
            print("no houses loaded")
            return
        end
        for i = 1, #result, 1 do 
            lh = lh + 1
            table.insert(coordinatesS,  {id = result[i].id, type = result[i].type, price = result[i].price, interiorid = result[i].interiorid, ownerid = result[i].ownerID, owner = result[i].owner, posX = result[i].posX, posY = result[i].posY, posZ = result[i].posZ, heading = result[i].heading, maxrents = result[i].maxrents, interiorX = result[i].interiorX, interiorY = result[i].interiorY, interiorZ = result[i].interiorZ})
        end
        print(coordinatesS)
        coordinates = {}
        coordinates = coordinatesS
        print("loaded ".. lh .. ' houses clientside')
    end)
end)

RegisterNetEvent('updateHouses')
AddEventHandler('updateHouses', function()
    ESX.TriggerServerCallback('byte_house:getHouses', function(result)
        local coordinatesS = {} 
        print("gethouses")
        if #result == 0 then
            print("no houses loaded")
            return
        end
        for i = 1, #result, 1 do 
            lh = lh + 1
            table.insert(coordinatesS,  {id = result[i].id, type = result[i].type, price = result[i].price, interiorid = result[i].interiorid, ownerid = result[i].ownerID, owner = result[i].owner, posX = result[i].posX, posY = result[i].posY, posZ = result[i].posZ, heading = result[i].heading, maxrents = result[i].maxrents, interiorX = result[i].interiorX, interiorY = result[i].interiorY, interiorZ = result[i].interiorZ})
        end
        print(coordinatesS)
        coordinates = {}
        coordinates = coordinatesS
        print("loaded ".. lh .. ' houses clientside')
        houseReload = 1
        Wait(1000)
        houseReload = 0
    end)
end)



Citizen.CreateThread(function()
    Citizen.Wait(2000)
    while true do
        Citizen.Wait(0)
        for _k,v in ipairs(coordinates) do
            if IsControlJustPressed(0, 51) then
                local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.posX,v.posY,v.posZ)
                if dest < 5 then
                    houseId = v.id
                    
                    
                        ESX.TriggerServerCallback('byte_house:getOwnerName', function(houseOwner)
                            hOwner = houseOwner
                        end, houseId)
                        Wait(200)
                        TriggerEvent('byte_house:openMenu')
                    
                end
            end
        end
    end
end)
hOwner = nil
RegisterNetEvent('byte_house:openMenu')
AddEventHandler('byte_house:openMenu', function()
    if houseReload == 0 then
        for _k,v in ipairs(coordinates) do
            local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.posX,v.posY,v.posZ)
            if dest < 5 then
                houseId = v.id 
                hOwner = v.owner
                local elements = {}
                if hOwner ~= 'STAAT' then
                    elements = {
                        {label = 'Besitzer: ' .. hOwner, action = 'nan'},
                        {label = 'Haus Betreten', action = 'joinHouse'}
                    }
                else
                    elements = {
                        {label = 'Besitzer: ' .. hOwner, action = 'nan'},
                        {label = 'Haus Kaufen ('.. v.price .. '$)', action = 'buyHouse'}
                    }
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
                    title    = 'Haus '.. houseId,
                    align    = 'top-left',
                    elements = elements
                }, function(data, menu)
                    menu.close()
                if data.current.action == 'joinHouse' then
                        ESX.TriggerServerCallback('byte_house:getLocked', function(locked)
                            if locked == 0 then
                                TriggerEvent('glmp_notify', 'yellow', 'Haus '.. houseId, ' Betreten')
                                TriggerEvent('setDimension', 5342409 .. '.' .. houseId)
                                houseOutside = vector3(v.posX, v.posY, v.posZ)
                                local houseInside = vector3(v.interiorX, v.interiorY, v.interiorZ )
                                SetEntityCoords(PlayerPedId(), houseInside, 0, 0, 0, false)
                            else
                                TriggerEvent('glmp_notify', 'red', 'Haus '.. houseId, 'ist Abgeschlossen')
                            end
                        end, houseId)
                    elseif data.current.action == 'buyHouse' then
                        TriggerServerEvent('byte_house:buy', v.id, v.price)
                    end
                end, function(data, menu)
                    menu.close()
                end)
            end
        end
    else
        TriggerEvent('glmp_singlenotify', '', 'Bitte warte einen Moment!')
    end
end)


clothes = {
    {posX = 259.76, posY = -1003.52, posZ = -99.11}
}
goOut = false
Citizen.CreateThread(function()
    Wait(2000)
    while true do
        Citizen.Wait(1)

         ped = PlayerPedId()
         playerCoords = GetEntityCoords(ped)
         PlayerData = ESX.GetPlayerData()
        for _k,v in ipairs(coordinates) do
            local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.interiorX,v.interiorY,v.interiorZ)
            local dest2 = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.posX,v.posY,v.posZ)
           
             
           print('X:' .. v.interiorX .. ' Y:'.. v.interiorY ..' Z: ' ..v.interiorZ)
           print('X:' .. v.posX .. ' Y:'.. v.posY ..' Z: ' ..v.posZ)
           
          
            if dest < 2 then
                print("dest is under 3")
                if IsControlJustPressed(0, 51) then 
                    if dest < 2 then    
                        if goOut ~= true then
                            goOut = true
                            ESX.TriggerServerCallback('byte_house:getLocked', function(locked)
                                if locked == 0 then
                                    SetEntityHeading(ped, 100)
                                    SetEntityCoords(ped, houseOutside, false, false, false, true)
                                    TriggerEvent('glmp_notify', 'yellow', 'HAUS '.. houseId, 'Du hast das Haus verlassen.')
                                else
                                    TriggerEvent('glmp_notify', 'red', 'Haus '.. houseId, 'ist Abgeschlossen')
                                end
                            end, houseId)
                            Wait(1000)
                            goOut = false
                        end
                    end
                    
                elseif IsControlJustPressed(0, 303) then
                    if dest < 2 then
                        if goLock ~= true then
                            goLock = true
                            print("pressed U to Locked House")
                            ESX.TriggerServerCallback('byte_house:getIdentifier', function(identifier)
                                ESX.TriggerServerCallback('byte_house:isOwner', function(isOwner)
                                    if isOwner == true then
                                        ESX.TriggerServerCallback('byte_house:getLocked', function(locked)
                                            if locked == 0 then
                                                TriggerServerEvent('byte_house:setLocked', houseId, 1)
                                                TriggerEvent('glmp_notify', 'red', 'Haus '.. houseId, 'Abgeschlossen')
                                            else
                                                TriggerServerEvent('byte_house:setLocked', houseId, 0)
                                                TriggerEvent('glmp_notify', 'green', 'Haus '.. houseId, 'Aufgeschlossen')
                                            end
                                        end, houseId)
                                    end
                                end, houseId, identifier)
                            end)
                            Wait(1000)
                            goLock = false
                        end
                    end
                end
            elseif dest2 < 3 then
               print("dest2 under 3")
                if IsControlJustPressed(0, 303) then
                    ESX.TriggerServerCallback('byte_house:getIdentifier', function(identifier)
                        ESX.TriggerServerCallback('byte_house:isOwner', function(isOwner)
                            if isOwner == true then
                                ESX.TriggerServerCallback('byte_house:getLocked', function(locked)
                                    if locked == 0 then
                                        TriggerServerEvent('byte_house:setLocked', houseId, 1)
                                        TriggerEvent('glmp_notify', 'red', 'Haus '.. houseId, 'Abgeschlossen')
                                    else
                                        TriggerServerEvent('byte_house:setLocked', houseId, 0)
                                        TriggerEvent('glmp_notify', 'green', 'Haus '.. houseId, 'Aufgeschlossen')
                                    end
                                end, houseId)
                            end
                        end, houseId, identifier)
                    end)
                end
            end
        end

        for _k,v in ipairs(clothes) do
            
            print('X:' .. v.interiorX .. ' Y:'.. v.interiorY ..' Z: ' ..v.interiorZ)
            print('X:' .. v.posX .. ' Y:'.. v.posY ..' Z: ' ..v.posZ)
            
             local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.posX,v.posY,v.posZ)
            
            if dest < 2 then
               print("dest is under 3")
                if IsControlJustPressed(0, 51) then
                    if kschrank ~= true then 
                         krschrank = true
                         TriggerEvent('byte_kleiderschrank:open')
                         Wait(1000)
                         kschrank = false
                    else
                        TriggerEvent('glmp_singlenotify', '', 'Bitte warte einen Moment!')
                    end
                end
                     
            end
         end
    end
end)





Citizen.CreateThread(function()
    Citizen.Wait(2000)
    print("BLIP DINGENS")
    print(coordinates)
	for i=1, #coordinates, 1 do
            local blip = AddBlipForCoord(coordinates[i].posX, coordinates[i].posY, coordinates[i].posZ)
            
            SetBlipSprite (blip, 40)
            SetBlipDisplay(blip, 374)
            SetBlipScale  (blip, 0.4)
            SetBlipColour (blip, 4)
            SetBlipAsShortRange(blip, false)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Haus")
            EndTextCommandSetBlipName(blip)
        
	end

end)