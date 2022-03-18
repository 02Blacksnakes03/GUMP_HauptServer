ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wc:addToPlayer')
AddEventHandler('wc:addToPlayer', function(weaponName, componentName)
    local src = source  
    local xPlayer = ESX.GetPlayerFromId(src) 
    xPlayer.addWeapon(weaponName, 0)
    xPlayer.addWeaponComponent(weaponName, componentName)
   
end)
 


ESX.RegisterUsableItem('suppressor', function(source)
    local src = source
    TriggerClientEvent('wc:schalli', src)
end)
 
ESX.RegisterUsableItem('grip', function(source)
    local src = source
    TriggerClientEvent('wc:grip', src)
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local src = source
    TriggerClientEvent('wc:flashlight', src)
end)