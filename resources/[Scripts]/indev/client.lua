ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
RegisterNetEvent('wc:schalli')
AddEventHandler('wc:schalli', function()
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    if currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_ADVANCEDRIFLE', 'suppressor')
    elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_ASSAULTRIFLE', 'suppressor')
    elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_CARBINERIFLE', 'suppressor')
    elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_HEAVYPISTOL', 'suppressor')
    else    
        ESX.ShowNotification("Der Aufsatz passt nicht auf diese Waffe...")
        return
    end
    TriggerServerEvent('byte:removeItem', 'suppressor')
end)
 

RegisterNetEvent('wc:flashlight')
AddEventHandler('wc:flashlight', function()
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    if currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_ADVANCEDRIFLE', 'flashlight')
    elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_ASSAULTRIFLE', 'flashlight')
    elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_CARBINERIFLE', 'flashlight')
    elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_HEAVYPISTOL', 'flashlight')
    else    
        ESX.ShowNotification("Der Aufsatz passt nicht auf diese Waffe...")
        return
    end
    TriggerServerEvent('byte:removeItem', 'flashlight')
end)


RegisterNetEvent('wc:grip')
AddEventHandler('wc:grip', function()
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    
    if currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_ASSAULTRIFLE', 'grip')
    elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        TriggerServerEvent('wc:addToPlayer', 'WEAPON_CARBINERIFLE', 'grip')
    else    
        ESX.ShowNotification("Der Aufsatz passt nicht auf diese Waffe...")
        return
    end
    TriggerServerEvent('byte:removeItem', 'grip')
end)
