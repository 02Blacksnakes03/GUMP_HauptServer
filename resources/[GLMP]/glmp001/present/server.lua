ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('byte:removeItem')
AddEventHandler('byte:removeItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)

RegisterNetEvent('byte:giveItem')
AddEventHandler('byte:giveItem', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, count)
end)

RegisterNetEvent('byte:giveWeapon')
AddEventHandler('byte:giveWeapon', function(weapon, ammo)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addWeapon(weapon, ammo)
end)

RegisterNetEvent('byte:addMoney')
AddEventHandler('byte:addMoney', function(count)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(count)
end)
