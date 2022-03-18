 local ESX = nil


 -------- Config --------
 local enreiseamt = false
 ------------------------

 TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

 ESX.RegisterServerCallback('byte_einreise:getEinreise', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local einreise = MySQL.Sync.fetchScalar("SELECT einreise FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    cb(einreise)
end)


RegisterServerEvent('byte_einriese:login')
AddEventHandler('byte_einreise:login', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local einreise = MySQL.Sync.fetchScalar("SELECT einreise FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    if einreise == 0 then
        TriggerClientEvent('byte_einreise:join', source)
    end
end)


RegisterServerEvent('byte_einreise:setTempEinreise')
AddEventHandler('byte_einreise:setTempEinreise', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    MySQL.Sync.fetchScalar("UPDATE users SET einreise = '2' WHERE identifier = @identifier", { ['@identifier'] = identifier})
    TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG')
end)