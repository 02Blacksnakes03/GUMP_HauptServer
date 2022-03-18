ESX = nil


TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

local houses = nil
ESX.RegisterServerCallback('byte_house:getHouses', function(source, cb)
    local houses = {}
    MySQL.Async.fetchAll("SELECT * FROM houses", {}, function(result)
        
        ------print("set houses")
		for i = 1, #result, 1 do
            --------print(result[i].id)
			table.insert(houses, {id = result[i].id, type = result[i].type, price = result[i].price, interiorid = result[i].interiorid, ownerid = result[i].ownerID, owner = result[i].owner, posX = result[i].posX, posY = result[i].posY, posZ = result[i].posZ, heading = result[i].heading, maxrents = result[i].maxrents, interior = result[i].interior, interiorX = result[i].interiorX, interiorY = result[i].interiorY, interiorZ = result[i].interiorZ})
		end 
 
		cb(houses) 
	end) 
end)

ESX.RegisterServerCallback('byte_house:isOwner', function(source, cb, house, identifier)
    local owner = MySQL.Sync.fetchScalar("SELECT `ownerID` FROM `houses` WHERE `id` = @houseid;", { ['@houseid'] = house})
    if owner == identifier then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('byte_house:getOwner', function(source, cb, house)
    local owner = MySQL.Sync.fetchScalar("SELECT `ownerID` FROM `houses` WHERE `id` = @houseid;", { ['@houseid'] = house})
    cb(owner)
end)

ESX.RegisterServerCallback('byte_house:getOwnerName', function(source, cb, house)
    local owner = MySQL.Sync.fetchScalar("SELECT `owner` FROM `houses` WHERE `id` = @houseid;", { ['@houseid'] = house})
    if owner ~= '' then
       
        cb(owner)
    else
        cb('Keiner')
    end
end)

ESX.RegisterServerCallback('byte_house:getIdentifier', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getIdentifier())
end)

ESX.RegisterServerCallback('byte_house:getIdentifier', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getIdentifier())
end)

houseLocked = {}
RegisterServerEvent('byte_house:setLocked')
AddEventHandler('byte_house:setLocked', function(house, state)
	houseLocked[house] = state
end) 

ESX.RegisterServerCallback('byte_house:getLocked', function(source, cb, house)
    cb(houseLocked[house])
end)

RegisterServerEvent('byte_house:buy')
AddEventHandler('byte_house:buy', function(house, price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local hOwner = MySQL.Sync.fetchScalar("SELECT owner FROM houses WHERE id = @identifier", { ['@identifier'] = house})
    local housed = MySQL.Sync.fetchScalar("SELECT id FROM houses WHERE ownerID = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    ------print(hOwner)
    if hOwner == 'STAAT' then
        if housed == nil then
            if xPlayer.getMoney() >= price then 
                local xPlayer = ESX.GetPlayerFromId(src)
                xPlayer.removeMoney(price) 
                TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst '.. price .. '$!')
                local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
                MySQL.Async.execute('UPDATE houses SET ownerID = @identifier, owner = @rpname WHERE id = @house',
                { ['rpname'] = rpname, ['identifier'] = xPlayer.getIdentifier(), ['house'] = house},
                function(affectedRows)
                end)
                Wait(200)
                TriggerClientEvent('updateHouses', -1) 
            else
                TriggerClientEvent('glmp_singlenotify', src, 'red', 'Du hast nicht genug Geld dabei!')
            end
        else
            TriggerClientEvent('glmp_singlenotify', src, 'red', 'Du besitzt bereits ein Haus!')
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, 'red', 'Dieses Haus steht nicht zum Verkauf!')
    end
end)

ESX.RegisterServerCallback('byte_house:getCash', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(MySQL.Sync.fetchScalar("SELECT inv_cash FROM houses WHERE ownerID = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}))
end)

RegisterServerEvent('byte_house:cashOut')
AddEventHandler('byte_house:cashOut', function(cashout)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local cash = MySQL.Sync.fetchScalar("SELECT inv_cash FROM houses WHERE ownerID = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if cash >= tonumber(cashout) then
        MySQL.Sync.fetchScalar("UPDATE houses SET inv_cash = @newcash WHERE ownerID = @identifier", {['@identifier'] = xPlayer.getIdentifier(), ['@newcash'] = cash - tonumber(cashout)})
        TriggerClientEvent('glmp_notify', src, 'green', 'Haus', 'Du hast '.. cashout ..'$ Ausgezahlt!')
        xPlayer.addMoney(tonumber(cashout))
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Nicht genug Geld in der Hauskasse!')
    end
end)