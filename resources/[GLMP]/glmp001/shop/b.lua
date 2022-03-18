RegisterNUICallback('trigger', function(data, cb)
    ownedCars = {}
    if data.args[1] == "Shop" then 
        if data.args[2] == "shopBuy" then
            TriggerEvent('shopBuyBasket', data.args[3])
        end
    end 
end)

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
local wasinside = false

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

local laden = {
    {x = 372.57, y = 326.66, z = 103.57, h = 253.43, type = '24/7'},--1
    {x = 2557.02, y = 380.79, z = 108.62, h = 356.23, type = '24/7'},--2
	{x = -3038.94, y = 584.51, z = 7.91, h = 21.55, type = '24/7'},--3
	{x = 3241.21, y = 999.92, z = 12.83, h = 354.41, type = '24/7'},--4
	{x = 549.14, y = 2671.33, z = 42.16, h = 106.57,type = '24/7'},--5
	{x = 1960.09, y = 3739.89, z = 32.34, h = 302.17, type = '24/7'},--6
	{ x = 2678.09, y = 3279.31, z = 55.24, h = 331.19, type = '24/7'},--7
    {x = 1727.91, y = 6415.43, z = 35.04, h = 243.0, type = '24/7'},--8
    {x = 1134.17, y = -982.6, z = 46.42, h = 276.23, type = '24/7'},--9
    {x = -1221.9, y = -908.33, z = 12.33, h = 35,47, type = '24/7'},--10
	{x = -1486.24, y = -377.94, z = 40.16, h = 136.17, type = '24/7'},--11
	{x = -2966.34, y = 391.0, z = 15.04, h = 89.93, type = '24/7'},--12
	{x = 1165.78, y = 2710.86, z = 38.16, h = 179.76, type = '24/7'},--13
	{x = 1392.6, y = 3606.39, z = 34.98, h = 197.55, type = '24/7'},--14
	{x = 24.4, y = -1347.15, z = 29.5, h = 273.02, type = '24/7'},--15
    {x = 129.57, y = -1284.21, z = 29.27, h = 123.02, type = '24/7'},--16
    {x = -47.01, y = -1758.33, z = 29.42, h = 44.16, type = '24/7'},--17
	{x = 1164.87, y = -323.37, z = 69.21,  h = 99.75, type = '24/7'},--18
	{x = -706.07, y = -913.87, z = 19.22, h = 86.85, type = '24/7'},--19
	{x = -1820.01, y = 794.17, z = 138.09, h = 136.66, type = '24/7'},--20
	{x = 1697.82, y = 4923.0, z = 42.06, h = 323.42, type = '24/7'},--21
    {x = -2534.29, y = 2313.93, z = 33.41, h = 92.44, type = '24/7'},--21
    {x = -1070.74, y = -2836.12, z = 27.7, h =  284.54, type = 'airport'},--22
    {x = -661.64, y = -933.51, z = 21.83, h = 174.12, type = 'ammunation'},--23
    {x = 809.37, y = -2159.13, z = 29.62, h = 353.17, type = 'ammunation'},--24
	{x = 1692.54, y = 3761.32, z = 34.71, h = 223.89, type = 'ammunation'},--25
	{x = -331.25, y = 6085.43, z = 31.45, h = 218.64, type = 'ammunation'},--26
	{x = 253.64, y = -51.08, z = 69.94, h = 65.96, type = 'ammunation'},--27 
	{x = 23.04, y = -1105.61, z = 29.8, h = 255.58, type = 'ammunation'},--28
	{x = 2567.01, y = 292.55, z = 108.73, h = 356.47, type = 'ammunation'},--29
    {x = -1118.55, y = 2700.25, z = 18.55, h = 214.41, type = 'ammunation'},--30
    {x = 841.68, y = -1035.34, z = 28.19, h = 357.93, type = 'ammunation'},--31
    {x = -563.28,  y = -194.2,  z = 37.36,  h = 250.86, type = 'regierung'},--32 
    {x = -87.2,  y = 30.28,  z = 71.96, h = 63.65 , type = 'phone'},--33
    {x = -656.6,  y = -858.72,  z = 24.48, h = 4.2, type = 'phone'},--33
    {x = -627.4,  y = -276.84,  z = 35.56, type = 'phone'},--33
    {x = 2748.16,  y = 3472.68,  z = 55.68, type = 'baumarkt'},--34
    {x = -1519.12,  y = -918.08,  z = 10.16, type = 'backpack'}--35
}
 
RegisterNetEvent('shopBuyBasket')
AddEventHandler('shopBuyBasket', function(shop)
	playerCanBuy = true
    ESX.TriggerServerCallback('shop:getPlayerMoney', function(playerMoney)
        price = 0
        for _, basket in pairs(shop) do
            price = price + basket.price
        end 
        if playerMoney >= price then
            shopBasket = {}
            for _, basket in pairs(shop) do 
                ESX.TriggerServerCallback('canInInventory', function(can)
                   
                    if can == false then
                        ESX.ShowNotification('Deine Inventar Größe reicht nicht aus!') 
                        ------print("inv reicht nich")
                        playerCanBuy = false
                        return
                    else
                        ------print("inv reicht")
                    end
                end, basket.itemId, basket.count)
                
            end
            Wait(500)
            if playerCanBuy == true then
                TriggerServerEvent('shop:pay', price)
                
                for _, basket in pairs(shop) do 
                    TriggerServerEvent('shop:giveItem', basket.itemId, basket.count)
                    
                end
                TriggerEvent('glmp_notify', 'green', 'Shop', 'Du hast einige Items gekauft!')
            end
        else 
            TriggerEvent('glmp_singlenotify', 'red', 'Du hast nicht genug Geld dabei!')
        end
    end)
end)

local enableField = false
shopItems = {} 
function toggleField(enable, type)
    shopItems = {}
    --SetNuiFocus(enable, enable)
    enableField = enable
    itemId = 0
    if enable then
       --[[ SendNUIMessage({
            action = 'open'
        }) ]]
        ESX.TriggerServerCallback('glmp_shops:loadItems', function(items)
            for key, value in pairs(items) do
                itemId = itemId + 1 
                
                table.insert(shopItems, {id = itemId, name = value.name, price = value.price, img = value.img, label = value.display})
            end
            
        end, type)
        Wait(250)
        TriggerEvent('open247Shop', 1, shopItems)
        
    else 
        --[[SendNUIMessage({
            action = 'close'
        }) ]]
    end
end
--Unnötig
--AddEventHandler('onResourceStart', function(name)
 --   if GetCurrentResourceName() ~= name then
 --       return
 --   end

 --   toggleField(false)
--end)


Citizen.CreateThread(function()
    while true do
        Wait(1000)
        for key, value in pairs(laden) do
            DrawMarker(-1, vector3(value.x, value.y, value.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Wait(500)
        for key, value in pairs(laden) do
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.x, value.y, value.z))
            if dist < 2.0 then
                if wasinside == false then
                    TriggerEvent('static_interact', "E", "show")
                    wasinside = true
                end
            elseif dist > 2.0 and dist < 5.0 then
                if wasinside then
                    wasinside = false
                    TriggerEvent('static_interact', "E", "hide")
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(10) 
        ladendev = 0
        if npcSpawned == nil then
            for _,v in pairs(laden) do
                RequestModel(GetHashKey("a_m_o_acult_02"))
                while not HasModelLoaded(GetHashKey("a_m_o_acult_02")) do
                Wait(1)
                end
            
                RequestAnimDict("mini@strip_club@idles@bouncer@base")
                while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
                Wait(1)
                end
                ped =  CreatePed(4, 0x4BA14CCA,v.x, v.y,v.z-1, 3374176, false, true)
                SetEntityHeading(ped, v.h) 
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true) 
                SetBlockingOfNonTemporaryEvents(ped, true)
            end 
            npcSpawned = true
        end
        for key, value in pairs(laden) do
            ladendev = ladendev + 1
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(value.x, value.y, value.z))

            if dist <= 2.0 then
                if IsControlJustReleased(0, 38) then
                    toggleField(true, value.type)
                    TriggerEvent('static_interact', "E", "hide")
                    ------print("LADEN: ".. ladendev)
                end
            end
        end
    end 
end) 

Citizen.CreateThread(function()
    for _, coords in pairs(laden) do
        if coords.type == 'ammunation' then
            local blip = AddBlipForCoord(vector3(coords.x, coords.y, coords.z))
 
            SetBlipSprite(blip, 110)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 0)
            SetBlipDisplay(blip, 2)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Waffenladen")
            EndTextCommandSetBlipName(blip)
        elseif coords.type == 'phone' then
            local blip = AddBlipForCoord(vector3(coords.x, coords.y, coords.z))

            SetBlipSprite(blip, 521)
            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 0)
            SetBlipDisplay(blip, 2)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Elektroladen")
            EndTextCommandSetBlipName(blip)

        end
    end
end)



