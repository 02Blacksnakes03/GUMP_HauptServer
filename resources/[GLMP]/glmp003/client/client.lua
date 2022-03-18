ESX = nil
local PlayerData        = {}
local hudopen           = false
local ampacken          = false
secondInventory = 'none'
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end
 
    PlayerData = ESX.GetPlayerData()
end)

RegisterNUICallback("trigger", function(data,cb)
    if data.event == "onWindowClosed" then
        SetNuiFocus(false,false)
        settonull()
    end
    if data.event == "componentTriggerServerEvent" then
        --print("ARGUMENTS...")
        --print(table.concat(data.args, " "))
        if data.args[2] == "useInventoryItem" then
            TriggerServerEvent('patron_inventory:useItem', data.args[3])
        end
        if data.args[2] == "dropInventoryItem" then
            Citizen.Wait(0)
            TriggerServerEvent('patron_inventory:throwItem', data.args[3], data.args[4])
        end
        if data.args[2] == "moveItemToInventory" then
            Citizen.Wait(0)
            TriggerEvent("playanimation")
            
            local vehicle = ESX.Game.GetVehicleInDirection()
            if DoesEntityExist(vehicle) then
                 --print("exist")
                if data.args[3] ~= 'splitItem' then
                    --print("not split")
                    if data.args[6] == GetPlayerServerId(PlayerId()) then
                        --print("puted")
                        ESX.TriggerServerCallback('getVehicleInvSize', function(vehInvSize)
                        
                            ESX.TriggerServerCallback('canInVehInventory', function(can)
                                if can == true then
                                    TriggerServerEvent("esx_trunk:putItem", GetVehicleNumberPlateText(vehicle), "item_standard", data.args[4], data.args[7], 50000, false)
                                    
                                else
                                    ESX.ShowNotification('Der Kofferraum ist voll!')
                                end
                            end, GetVehicleNumberPlateText(vehicle), data.args[4], data.args[7], vehInvSize[2]) 
                    end, GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

                    else
                        --print("remove")
                        ESX.TriggerServerCallback('canInInventory', function(can)
                            if can == true then
                                TriggerServerEvent("esx_trunk:getItem", GetVehicleNumberPlateText(vehicle), "item_standard", data.args[4], data.args[7])
                            else
                                ESX.ShowNotification('Dein Inventar ist voll!')
                            end
                        end, data.args[4], data.args[7])
                    end

                else
                    --print("split")
                    if data.args[5] ==  GetPlayerServerId(PlayerId()) then
                        --print("put split")
                        ESX.TriggerServerCallback('getVehicleInvSize', function(vehInvSize)
                        
                            ESX.TriggerServerCallback('canInVehInventory', function(can)
                                if can == true then
                                    TriggerServerEvent("esx_trunk:putItem", GetVehicleNumberPlateText(vehicle), "item_standard", data.args[4], data.args[6], 50000, false) 
                                else
                                    ESX.ShowNotification('Der Kofferraum ist voll!')
                                end
                            end, GetVehicleNumberPlateText(vehicle), data.args[4], data.args[6], vehInvSize[2]) 
                    end, GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
                        
                        
 
                    else
                        --print("remove split") 
                        ESX.TriggerServerCallback('canInInventory', function(can)
                            if can == true then
                                TriggerServerEvent("esx_trunk:getItem", GetVehicleNumberPlateText(vehicle), "item_standard", data.args[4], data.args[6])
                            else
                                ESX.ShowNotification('Dein Inventar ist voll!')
                            end
                        end, data.args[4], data.args[6])
                    end
                end
            
            else
                --if secondInventory == 'playerSpind' then
                if secondInventoryType == 'player' then
                    if data.args[3] ~= 'splitItem' then
                        --print("not split")
                        if data.args[6] == GetPlayerServerId(PlayerId()) then
                            --print("puted")
                            --TriggerServerEvent("esx_trunk:putItem", GetVehicleNumberPlateText(vehicle), "item_standard", data.args[4], data.args[7], 50000, false)
                            TriggerServerEvent('spind:putItem', data.args[4], data.args[7], secondInventory)
                            

                        else
                            --print("remove")
                            TriggerServerEvent('spind:getItem', data.args[4], data.args[7], secondInventory)
                        end

                    else 
                        --print("split")
                        if data.args[5] ==  GetPlayerServerId(PlayerId()) then
                            --print("put split")
                            TriggerServerEvent('spind:putItem', data.args[4], data.args[6], secondInventory)
                            
    
                        else
                            --print("remove split") 
                            TriggerServerEvent('spind:getItem', data.args[4], data.args[6], secondInventory)
                        end
                    end
                else
                    if data.args[3] ~= 'splitItem' then
                        --print("not split")
                        if data.args[6] == GetPlayerServerId(PlayerId()) then
                            --print("puted")
                            --TriggerServerEvent("esx_trunk:putItem", GetVehicleNumberPlateText(vehicle), "item_standard", data.args[4], data.args[7], 50000, false)
                            TriggerServerEvent('gInv:putItem', data.args[4], data.args[7], secondInventory)
                            

                        else
                            --print("remove")
                            TriggerServerEvent('gInv:getItem', data.args[4], data.args[7], secondInventory)
                        end

                    else 
                        --print("split")
                        if data.args[5] ==  GetPlayerServerId(PlayerId()) then
                            --print("put split")
                            TriggerServerEvent('gInv:putItem', data.args[4], data.args[6], secondInventory)
                             
    
                        else
                            --print("remove split") 
                            TriggerServerEvent('gInv:getItem', data.args[4], data.args[6], secondInventory)
                        end
                    end
                end
            end
        end
        if data.args[2] == "giveInventoryItem" then
            Citizen.Wait(0)
            TriggerEvent('giveInventoryItem', data.args[3], data.args[4])
        end
        if data.args[2] == "fillInventorySlots" then
            openinventory()
        end
        if data.args[2] == "packArmor" then
            TriggerEvent('patron_inventory:packArmor')
        end
        if data.args[2] == "packGun" then
            TriggerEvent('patron_inventory:packGun')
        end
    end
end)

function getPicbyItem(itemname)
    for k,v in pairs(PATRONHABIBI.Items) do
        if itemname == k then
            return v.img
        end
    end
    return PATRONHABIBI.DefaultPic
end

function getItembyWeapon(weapon)
    for k,v in pairs(PATRONHABIBI.WeaponItems) do
        if weapon == GetHashKey(k) then
            return v.item
        end 
    end
    return "keinebruda"
end

local items = {}
local trunkitems = {}
t = {}
RegisterNetEvent('openPlayerInv')
AddEventHandler('openPlayerInv', function( )
    openinventory()
    openinventory1() 
end)


function openinventory1()
    ESX.TriggerServerCallback('patron_inventory:loadTarget', function(data)
        ESX.TriggerServerCallback('byte:hasBackpack2', function(hasBackpack2)
            local numberslots = -1
            for k, v in pairs(data.items) do
                if tonumber(v.count) > 0 then
                    table.insert(items, {Id = math.random(1,12),Label = v.label,Name = v.name,Amount = v.count,Weight = v.weight,Slot = numberslots + 1,ImagePath = getPicbyItem(v.name),MaxStackSize = "2"})
                    numberslots = numberslots + 1
                end
            end
            if hasBackpack2 == true then
       
                 t = {
                    ["inventory1"] = {
                        {
                        ["Id"] = GetPlayerServerId(PlayerId()),
                        ["Name"] = PATRONHABIBI.Inventoryname,
                        ["Money"] = data.money,
                        ["MaxWeight"] = 100000,
                        ["MaxSlots"] = 12,
                            ["Slots"] = items
                        }
                    }
                }
                SendNUIMessage({
                    action = "open",
                    data = json.encode(t)
                })
            else
                
                 t = {
                    ["inventory1"] = {
                        {
                        ["Id"] = GetPlayerServerId(PlayerId()),
                        ["Name"] = PATRONHABIBI.Inventoryname,
                        ["Money"] = data.money,
                        ["MaxWeight"] = 10000,
                        ["MaxSlots"] = 6,
                            ["Slots"] = items
                        }
                    }
                }
                SendNUIMessage({
                    action = "open",
                    data = json.encode(t)
                })
            end
        end)
        if not hudopen then
            
            hudopen = true
        end
        SetNuiFocus(true,true)
    end)
end


function openinventory()
    ESX.TriggerServerCallback('patron_inventory:loadTarget', function(data)
        ESX.TriggerServerCallback('byte:hasBackpack', function(hasBackpack)
            local numberslots = -1
            for k, v in pairs(data.items) do
                if tonumber(v.count) > 0 then
                    table.insert(items, {Id = math.random(1,12),Label = v.label,Name = v.name,Amount = v.count,Weight = v.weight,Slot = numberslots + 1,ImagePath = getPicbyItem(v.name),MaxStackSize = "2"})
                    numberslots = numberslots + 1
                end
            end
            if hasBackpack == true then
       
                 t = {
                    ["inventory"] = {
                        {
                        ["Id"] = GetPlayerServerId(PlayerId()),
                        ["Name"] = PATRONHABIBI.Inventoryname,
                        ["Money"] = data.money,
                        ["MaxWeight"] = 40000,
                        ["MaxSlots"] = 12,
                            ["Slots"] = items
                        }
                    }
                }
                SendNUIMessage({
                    action = "open",
                    data = json.encode(t)
                })
            else
                
                 t = {
                    ["inventory"] = {
                        {
                        ["Id"] = GetPlayerServerId(PlayerId()),
                        ["Name"] = PATRONHABIBI.Inventoryname,
                        ["Money"] = data.money,
                        ["MaxWeight"] = 10000,
                        ["MaxSlots"] = 6,
                            ["Slots"] = items
                        }
                    }
                }
                SendNUIMessage({
                    action = "open",
                    data = json.encode(t)
                })
            end
        end)
        if not hudopen then
            
            hudopen = true
        end
        SetNuiFocus(true,true)
    end)
end

RegisterKeyMapping('invfgew34fr', 'Inventar', 'keyboard', 'i')
RegisterCommand('invfgew34fr', function()
    PlayerData = ESX.GetPlayerData()
    local vehicle = ESX.Game.GetVehicleInDirection()
    secondInventory = 'none'
    if DoesEntityExist(vehicle) then
        TriggerEvent('trunkopen123')
    else
        -- PLAYER SPINDE
        if(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 463.75, -984.44, 25.57, true) < 1.5) then
            openPlayerSecondInv('playerSpind', 'Spind', ESX.GetPlayerData().identifier)
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1844.89, 2586.07, 45.89, true) < 1.5) then
            openPlayerSecondInv('playerSpind', 'Spind', ESX.GetPlayerData().identifier)
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 449.36, -985.12, 30.68, true) < 1.5) then
            openPlayerSecondInv('playerSpind', 'Spind', ESX.GetPlayerData().identifier)
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1688.96, 2579.92, 45.92, true) < 1.5) then
            openPlayerSecondInv('playerSpind', 'Spind', ESX.GetPlayerData().identifier)
        -- STAAT SPINDE
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 143.99, 242.15, 242.15, true) < 1.5) then
            if PlayerData.job.name == 'fib' then
                openPlayerSecondInv('playerStaatSpind', 'Beamten Spind (FIB)', ESX.GetPlayerData().identifier)
            else
                openinventory()
            end
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 452.24, -993.31, 30.69, true) < 4) then
            if PlayerData.job.name == 'police' then
                openPlayerSecondInv('playerStaatSpind', 'Beamten Spind (LSPD)', ESX.GetPlayerData().identifier)
            else
                openinventory()
            end  

        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -790.8, -1347.28, 8.56, true) < 4) then
            if PlayerData.job.name == 'dmv' then
                openPlayerSecondInv('playerStaatSpind', 'Beamten Spind (DMV)', ESX.GetPlayerData().identifier)
            else
                openinventory()
            end 
            
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 298.6, -598.76, 43.28, true) < 4) then
            if PlayerData.job.name == 'ambulance' then
                openPlayerSecondInv('playerStaatSpind', 'Beamten Spind (LSMD)', ESX.GetPlayerData().identifier)
            else
                openinventory()
            end  
        -- FRAKLAGER
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1719.57, 4765.67, 14.21, true) < 5) then
            TriggerServerEvent('fraklager:open')


        -- WORKSTATIONS 

        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1469.5, 6551.78, 14.68, true) < 2) then
            TriggerServerEvent('workstation:open', 'weed', 'takein')
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1470.14, 6541.58, 14.68, true) < 2) then
            TriggerServerEvent('workstation:open', 'weed', 'takeout')

        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -272.96, -2496.76, 7.28, true) < 2) then
            TriggerServerEvent('workstation:open', 'kevlar', 'takein')
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -271.16, -2475.92, 7.28, true) < 2) then
            TriggerServerEvent('workstation:open', 'kevlar', 'takeout')


       


        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -69.4, 6261.72, 31.08, true) < 2) then
            TriggerServerEvent('workstation:open', 'chicken', 'takein')
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -155.44, 6139.68, 32.32, true) < 2) then
            TriggerServerEvent('workstation:open', 'chicken', 'takeout') 


        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -689.28, 5789.4, 17.32, true) < 2) then
            TriggerServerEvent('workstation:open', 'coffee', 'takein')
        elseif(GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), -687.04, 5793.84, 17.32, true) < 2) then
            TriggerServerEvent('workstation:open', 'coffee', 'takeout') 

        else 
            openinventory()
        end
    end

end) 

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterNetEvent("playanimation")
AddEventHandler("playanimation", function(name, count)
    local playerPed = GetPlayerPed(-1)

    DoThrowGiveAnimation()

    Citizen.Wait(1300)
    ClearPedTasks(playerPed)
end)

RegisterNetEvent("giveInventoryItem")
AddEventHandler("giveInventoryItem", function(name, count)
    local playerPed = GetPlayerPed(-1)
    local player, dist = ESX.Game.GetClosestPlayer()
	
    if player == -1 or dist > 2.0 then
        ESX.ShowNotification('Es ist keine Person in der Nähe')
    else
        DoThrowGiveAnimation()
        TriggerServerEvent('patron_inventory:giveItem', name, count, GetPlayerServerId(player),data)
		Citizen.Wait(1300)
		ClearPedTasks(playerPed)
    end
    cb('ok')
end)

RegisterNetEvent("patron_inventory:packArmor")
AddEventHandler("patron_inventory:packArmor", function()
    local playerPed = GetPlayerPed(-1)
    local getweste = GetPedArmour(playerPed)

    if tonumber(getweste) >= 100 then
        TriggerServerEvent("patron_inventory:packArmor")
    elseif tonumber(getweste) == 0 then
        ESX.ShowNotification('Du hast keine Weste, die du ausziehen kannst!')
    else
        ESX.ShowNotification('Deine Weste ist beschädigt! Es lohnt sich nicht diese auszuziehen.')
    end
end)

RegisterNetEvent("patron_inventory:packArmor:2")
AddEventHandler("patron_inventory:packArmor:2", function()
    local playerPed = GetPlayerPed(-1)
    local getweste = GetPedArmour(playerPed)

    DoPackAnimation()

    TriggerEvent("patron_inventory:progressbar", PATRONHABIBI.packArmortime)
    Citizen.Wait(PATRONHABIBI.packArmortime)

    AddArmourToPed(GetPlayerPed(-1), -100)
    ClearPedTasks(playerPed)
    if PATRONHABIBI.packArmorremoveclothe then
        SetPedComponentVariation(playerPed, 9, 0, 0, 0)
    end
end)

function settonull()
    items = {}

    trunkitems = {}

    handschuhfachItems = {}

    hudopen = false
end

 


 

RegisterNetEvent("sendGlobalNotification")
AddEventHandler("sendGlobalNotification", function(text, color, icon, time)
    --print("EVENT:")
    SendNUIMessage({
        action = "gnotify",
        text = text,
        color = color,
        time = tonumber(time),
        icon = icon,
        bgColor = color
    })
end)

RegisterNetEvent("patron_inventory:progressbar")
AddEventHandler("patron_inventory:progressbar", function(duration)
    SendNUIMessage({
        action = "penis",
        data = tonumber(duration)
    })
end)


RegisterCommand('packgun', function(source)
    TriggerEvent('patron_inventory:packGun')
end)
RegisterNetEvent("patron_inventory:packGun")
AddEventHandler("patron_inventory:packGun", function()
    local ped = PlayerPedId() 
    local weapon = GetSelectedPedWeapon(ped)
    local munition = GetAmmoInPedWeapon(ped,weapon)
    itemname = getItembyWeapon(weapon)
    ESX.TriggerServerCallback('byte_fraksystem:getDuty', function(staatsdienst)
        if staatsdienst == 1 then
            itemname = 'beamten_' .. getItembyWeapon(weapon)
            --print("ba")
             
            if not ampacken then
                if itemname ~= "keinebruda" then 
                    TriggerServerEvent("patron_inventory:packBGun", itemname, getItembyWeapon(weapon))
                    ampacken = true
                elseif weapon == GetHashKey("WEAPON_UNARMED") then
                    ESX.ShowNotification('Du musst eine Waffe in der Hand halten!')
                else
                    ESX.ShowNotification('Diese Waffe kann nicht eingepackt werden!')
                end
            end
        else
            itemname = getItembyWeapon(weapon)
            --print("nba")

            
            if not ampacken then
                if itemname ~= "keinebruda" then
                    TriggerServerEvent("patron_inventory:packGun", itemname, munition)
                    ampacken = true
                elseif weapon == GetHashKey("WEAPON_UNARMED") then
                    ESX.ShowNotification('Du musst eine Waffe in der Hand halten!')
                else
                    ESX.ShowNotification('Diese Waffe kann nicht eingepackt werden!')
                end
            end
        end
    end)

end)
RegisterNetEvent('machenWestenAnim')
AddEventHandler('machenWestenAnim', function()
    DoPackAnimation()
end)
RegisterNetEvent("patron_inventory:packGun:2")
AddEventHandler("patron_inventory:packGun:2", function(itemname)
    local playerPed = GetPlayerPed(-1)

    DoPackAnimation()

    TriggerEvent("patron_inventory:progressbar", PATRONHABIBI.packArmortime)
    Citizen.Wait(PATRONHABIBI.packArmortime)

    ESX.ShowNotification('Sie haben ihre '..itemname..' in ihr Inventar verstaut!')
    ClearPedTasks(playerPed)
    ampacken = false
end)

trunklock = {}

RegisterNetEvent('trunklock')
AddEventHandler('trunklock', function()
    --print("trunk lock") 
    local vehicle = ESX.Game.GetVehicleInDirection()
    --print(json.encode(vehicle))
    --print(DoesEntityExist(vehicle))
    if DoesEntityExist(vehicle) then
        --print("veh is da")
        local locked = GetVehicleDoorLockStatus(vehicle)
        --print("LOCKED: " .. locked)
        if locked == 1 then
           if trunklock[GetVehicleNumberPlateText(vehicle)] == nil then
                trunklock[GetVehicleNumberPlateText(vehicle)] = false
                TriggerEvent('glmp_singlenotify', 'green', 'Kofferraum aufgeschlossen!')
           elseif trunklock[GetVehicleNumberPlateText(vehicle)] == true then
                trunklock[GetVehicleNumberPlateText(vehicle)] = false
                TriggerEvent('glmp_singlenotify', 'green', 'Kofferraum aufgeschlossen!')
           elseif trunklock[GetVehicleNumberPlateText(vehicle)] == false then
                trunklock[GetVehicleNumberPlateText(vehicle)] = true
                TriggerEvent('glmp_singlenotify', 'red', 'Kofferraum abgeschlossen!')
           end

        else
           TriggerEvent('glmp_singlenotify', 'red', 'Das Fahrzeug ist abgeschlossen.')
        end 
    else 
        --print(" no veh")
    end
end)

RegisterNetEvent("trunkopen123")
AddEventHandler("trunkopen123", function()
    local vehicle = ESX.Game.GetVehicleInDirection()
    if DoesEntityExist(vehicle) then 
        local locked = GetVehicleDoorLockStatus(vehicle)
        --print("LOCKED: " .. locked)
        if locked == 1 then
            if trunklock[GetVehicleNumberPlateText(vehicle)] == false then
                ESX.TriggerServerCallback('patron_inventory:loadTarget', function(data)
                    ESX.TriggerServerCallback('esx_trunk:getInventoryV', function(inventory)
                        --print(json.encode(inventory))
                        ESX.TriggerServerCallback('getPlayerInvSize', function(invSize)
                            ESX.TriggerServerCallback('getVehicleInvSize', function(vehInvSize)
                                --print(json.encode(vehInvSize))
                                local numberslots = -1
                                local trunkslots = -1 
                                for k, v in pairs(data.items) do
                                    if tonumber(v.count) > 0 then
                                        table.insert(items, {Id = math.random(1,12),Label = v.label,Name = v.name,Amount = v.count,Weight = v.weight,Slot = numberslots + 1,ImagePath = getPicbyItem(v.name),MaxStackSize = "99"})
                                        numberslots = numberslots + 1
                                    end 
                                end
                                for i=1, #inventory.items, 1 do
                                    local item = inventory.items[i]
                                    if tonumber(item.count) > 0 then
                                        table.insert(trunkitems, {Id = math.random(1,12),Label = item.label,Name = item.name,Amount = item.count,Weight = item.weight,Slot = trunkslots + 1,ImagePath = getPicbyItem(item.name),MaxStackSize = "99"})
                                        trunkslots = trunkslots + 1 
                                    end
                                end 
                                local t = {
                                    ["inventory"] = {
                                        {
                                            ["Id"] = GetPlayerServerId(PlayerId()),
                                            ["Name"] = PATRONHABIBI.Inventoryname,
                                            ["MaxWeight"] = invSize[1],
                                            ["MaxSlots"] = invSize[2],
                                            ["Slots"] = items
                                        },
                                        {
                                            ["Id"] = 1337,
                                            ["Name"] = 'Kofferraum',
                                            ["MaxWeight"] = vehInvSize[2],
                                            ["MaxSlots"] = vehInvSize[1],
                                            ["Slots"] = trunkitems
                                        }
                                    }
                                        }
                                if not hudopen then
                                    SendNUIMessage({
                                        action = "open",
                                        data = json.encode(t)
                                    })
                                    hudopen = true
                                end
                                SetNuiFocus(true,true)
                            end, GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
                        end)
                    end, GetVehicleNumberPlateText(vehicle))
                end)
            else
                openinventory()
            end
        else
           -- TriggerEvent('glmp_singlenotify', '', 'Das Fahrzeug ist abgeschlossen.')
            openinventory()
        end 
    end
end)
secondInventoryType = 'player'
RegisterNetEvent('openPlayerSecondInv')
AddEventHandler('openPlayerSecondInv', function(name, label, identifier)
    --print("open")
    openPlayerSecondInv(name, label, identifier)
end)
function openPlayerSecondInv(name, label, identifier)
    if identifier == 'global' then
        secondInventoryType = 'global'
    else

        secondInventoryType = 'player'
    end
    secondInventory = name
    --print(identifier) 
    --print(secondInventory)

    ESX.TriggerServerCallback('patron_inventory:loadTarget', function(data)
        ESX.TriggerServerCallback('spind_loadItems', function(spind)
            local numberslots = -1
            local trunkslots = -1 
            for k, v in pairs(data.items) do
                if tonumber(v.count) > 0 then 
                    table.insert(items, {Id = math.random(1,12),Label = v.label,Name = v.name,Amount = v.count,Weight = v.weight,Slot = numberslots + 1,ImagePath = getPicbyItem(v.name),MaxStackSize = "99"})
                    numberslots = numberslots + 1
                end 
            end
             
            local t = { 
                ["inventory"] = {
                    {
                        ["Id"] = GetPlayerServerId(PlayerId()),
                        ["Name"] = PATRONHABIBI.Inventoryname,
                        ["MaxWeight"] = PATRONHABIBI.MaxWeight,
                        ["MaxSlots"] = PATRONHABIBI.MaxSlots,
                        ["Slots"] = items
                    },
                    {
                        ["Id"] = 187,
                        ["Name"] = label,
                        ["MaxWeight"] = PATRONHABIBI.MaxWeight,
                        ["MaxSlots"] = PATRONHABIBI.MaxSlots,
                        ["Slots"] = spind
                    }
                }
                    }
            if not hudopen then
                SendNUIMessage({
                    action = "open",
                    data = json.encode(t)
                })
                hudopen = true
                
            end
            SetNuiFocus(true,true)
        end, identifier, secondInventory)
    end)
end


local actionkey=21 --Lshift (or whatever your sprint key is bound to)
local allowshuffle = false
local playerped=nil
local currentvehicle=nil

--getting vars
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		--constantly getting the current 
		playerped=PlayerPedId()
		--constantly get player vehicle
		currentvehicle=GetVehiclePedIsIn(playerped, false)
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if IsPedInAnyVehicle(playerped, false) and allowshuffle == false then
			--if they're trying to shuffle for whatever reason
			SetPedConfigFlag(playerped, 184, true)
			if GetIsTaskActive(playerped, 165) then
				--getting seat player is in 
				seat=0
				if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
					seat=-1
				end
				--if the passenger doesn't shut the door, shut it manually
				--if GetVehicleDoorAngleRatio(currentvehicle,1) > 0.0 and seat == 0 then
					--SetVehicleDoorShut(currentvehicle,1,false)
				--end
				--move ped back into the seat right as the animation starts
				SetPedIntoVehicle(playerped, currentvehicle, seat)
			end
		elseif IsPedInAnyVehicle(playerped, false) and allowshuffle == true then
			SetPedConfigFlag(playerped, 184, false)
		end
	end
end)


RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(playerped, false) then
		--getting seat
		seat=0
		if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
			seat=-1
		end
		--if they're a driver
		if GetPedInVehicleSeat(currentvehicle,-1) == playerped then
			TaskShuffleToNextVehicleSeat(playerped,currentvehicle)
		end
		--if they're a passenger
		--adding a block until they are actually in their new seat
		allowshuffle=true
		while GetPedInVehicleSeat(currentvehicle,seat) == playerped do
			Citizen.Wait(0)
		end
		allowshuffle=false
	else
		allowshuffle=false
		CancelEvent('SeatShuffle')
	end
end)


local elapsed=0
--thread to get duration of key press
Citizen.CreateThread(function()
  while true do
	Citizen.Wait(0)
	elapsed=0
	while IsControlPressed(0,actionkey) and GetIsTaskActive(playerped, 165) do
		Citizen.Wait(100)
		elapsed=elapsed+0.1
	end
  end
end)



Citizen.CreateThread(function()
  while true do
  --if the press the control then start the animation
	if IsControlJustPressed(1, actionkey) then -- Lshift
	   TriggerEvent("SeatShuffle")
    end
	--if they release the control mid anim then set back
	if IsControlJustReleased(1, actionkey) and allowshuffle == true then 
		--setting threshold for how long the ksy should be pressed for
		threshhold=0.8
		--if they're in passenger seat then remove add 1 second to the threshold because of slight delay when moving from passenger side
		--if GetPedInVehicleSeat(currentvehicle, 0) == playerped then
			--threshhold=threshhold+0.55
		--end
		--if the animation is playing and the key is pressed down for long enough, cancel the animation
	   if GetIsTaskActive(playerped, 165) and elapsed < threshhold then
			allowshuffle=false
	   end
    end
    Citizen.Wait(0)
  end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

ESX = nil
   Citizen.CreateThread(function()
       while ESX == nil do
           TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
           Citizen.Wait(0)
       end
   
       while ESX.GetPlayerData().job == nil do
           Citizen.Wait(0)
       end
   
       PlayerData = ESX.GetPlayerData()
   
       ESX.TriggerServerCallback('fraklager:loadPositions', function(result)
           local coordinatesS = {}
           lh = 0
           ----print("gethouses")
           if #result == 0 then
               ----print("no houses loaded")
               return
           end 
           for i = 1, #result, 1 do 
               lh = lh + 1
               table.insert(coordinatesS,  {fraktion = result[i].fraktion, position = result[i].position, dim = result[i].dim, posX = result[i].posX, posY = result[i].posY, posZ = result[i].posZ})
           end 
           ----print(coordinatesS)
           coordinates = {}
           coordinates = coordinatesS 
           ----print("loaded ".. lh .. ' flager clientside')
       end)
   end)
   
    
   
   Citizen.CreateThread(function()
       Citizen.Wait(2000)
       while true do 
           Citizen.Wait(0)
           for _k,v in ipairs(coordinates) do
               local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.posX, v.posY, v.posZ)
               local dest2 = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1719.57, 4765.67, 14.21)
               local dest3 = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1706.27, 4774.78, 14.21)
               if dest < 20 then  
                --DrawMarker(1, v.posX, v.posY, v.posZ-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.7, 144, 128, 0, 100, false, true, 2, nil, nil, false)
   
                elseif dest < 2 then 
                    
                   if IsControlJustPressed(0, 51) then
                        
                       if v.fraktion == ESX.GetPlayerData().job.name then
                           TriggerEvent('setDimension', v.dim)   
                           SetEntityCoords(PlayerPedId(), 1719.57, 4765.67, 14.21, 0, 0, 0, true)
                       end  
                   end
               elseif dest2 < 5 then 
                   
                   if IsControlJustPressed(0, 51) then
                       if v.fraktion == ESX.GetPlayerData().job.name then
                           TriggerEvent('setDimension', 0)    
                           SetEntityCoords(PlayerPedId(), v.posX, v.posY, v.posZ, 0, 0, 0, true)
                       end
                       
                   end
               elseif dest3 < 1 then 
                   
                   if IsControlJustPressed(0, 51) then
                       if v.fraktion == ESX.GetPlayerData().job.name then
                           TriggerEvent('byte_frakkleiderschrank:open')
                       end
                       
                   end
                elseif dest > 2 and dest < 5 then 
                    showFLmsg = false 
               end
   
               
           end 
       end
   end)