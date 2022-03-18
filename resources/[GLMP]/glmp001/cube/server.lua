
ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('WÜRFEL')
AddEventHandler('WÜRFEL', function(player, closestPlayer, num)
    local xPlayer = ESX.GetPlayerFromId(player)
    local identifier = xPlayer.getIdentifier()
    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local name = firstname .. '_' .. lastname

    TriggerClientEvent("glmp_singlenotify", player, "grey", "* ".. name .." würfelt eine " .. num)
    TriggerClientEvent("glmp_singlenotify", closestPlayer, "grey", "* ".. name .." würfelt eine " .. num)
end)


RegisterNetEvent('WÜRFEL1')
AddEventHandler('WÜRFEL1', function(player, closestPlayer, num)
    local xPlayer = ESX.GetPlayerFromId(player)
    local identifier = xPlayer.getIdentifier()
    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local name = firstname .. '_' .. lastname

    TriggerClientEvent("glmp_singlenotify", player, "grey", "* ".. name .." würfelt eine " .. num)
    --TriggerClientEvent("glmp_singlenotify", closestPlayer, "grey", "* ".. name .." würfelt eine " .. num)
end)

ESX.RegisterUsableItem('cube', function(source)
    TriggerClientEvent('byte:würfeln', source)
end)

 
  