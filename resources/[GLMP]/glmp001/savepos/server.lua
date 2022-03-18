
RegisterServerEvent("savePosition")
AddEventHandler("savePosition", function(x, y, z, heading)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local position = "{" .. x .. ", " .. y .. ",  " .. z .. "}"
	MySQL.Async.execute("UPDATE users SET pos = @pos WHERE identifier = @identifier", {["@identifier"] = xPlayer.getIdentifier(), ["@pos"] = position})
end)
 
AddEventHandler('esx:playerDropped', function(source)
    ----print("player dropped")
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local player = src 
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)
    ----print(playerCoords)
    ----print(playerCoords.x) 
    local position = "{" .. playerCoords.x .. ", " .. playerCoords.y .. ",  " .. playerCoords.z .. "}"
	MySQL.Async.execute("UPDATE users SET pos = @pos WHERE identifier = @identifier", {["@identifier"] = xPlayer.getIdentifier(), ["@pos"] = position})
end)

RegisterServerEvent("teleportPlayerToPos")
AddEventHandler("teleportPlayerToPos", function()
    ----print("tp")
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.getIdentifier()}, function(result)
        ----print(result[1].pos)
        local decodedCoords = json.decode(result[1].pos)

        if result[1] then
            ----print("tp 2")
            ----print(decodedCoords.x)
            xPlayer.triggerEvent("setPosition", decodedCoords[1], decodedCoords[2], decodedCoords[3])
        end 
    end) 
end)   


ESX.RegisterServerCallback('haveWeste', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('bulletproof').count > 0 then 
        cb(true)
    else
        cb(false)
    end
end)




ESX.RegisterServerCallback('haveMedikit', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('medikit').count > 0 then 
        cb(true)  
    else
        cb(false)
    end
end)

 
ESX.RegisterUsableItem('bulletproof', function(source)
    ----print("use weste")
    TriggerClientEvent('useSpecItem', source, 'bulletproof')
end)

ESX.RegisterUsableItem('medikit', function(source)
    ----print("use medikit")
    TriggerClientEvent('useSpecItem', source, 'medikit')
end)
