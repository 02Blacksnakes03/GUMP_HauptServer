ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('OOC')
AddEventHandler('OOC', function(player, closestPlayer, argString)
    TriggerClientEvent("glmp_notify", player, "#18880c", "OOC (" .. GetPlayerName(player) .. ")", argString)
    TriggerClientEvent("glmp_notify", closestPlayer, "#18880c", "OOC (" .. GetPlayerName(player) .. ")", argString)
end)
