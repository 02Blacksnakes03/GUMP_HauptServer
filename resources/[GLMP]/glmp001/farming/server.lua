ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


ESX.RegisterServerCallback('farming:hasNeededItem', function(source, cb, item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = xPlayer.getInventoryItem(item).count
    if item > 0 then
        cb(true)
    else 
        cb(false)
    end 
end)

ESX.RegisterServerCallback('farming:items', function(source, cb, item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    cb(xPlayer.getInventoryItem(item).count)
    
end)


RegisterServerEvent('farming:item')
AddEventHandler('farming:item', function(item, count)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.addInventoryItem(item, count)
    TriggerClientEvent('glmp_notify', src, 'green', 'FARMING', 'Du hast '.. count .. 'x '.. ESX.GetItemLabel(item) .. ' erhalten.')
end)


RegisterServerEvent('farming:veritem')
AddEventHandler('farming:veritem', function(item, count, item2, count2)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.removeInventoryItem(item, count) 
    xPlayer.addInventoryItem(item2, count2)
    TriggerClientEvent('glmp_notify', src, 'green', 'VERARBEITUNG', 'Du hast '.. count .. 'x '.. ESX.GetItemLabel(item) .. ' zu '.. count2 .. 'x '.. ESX.GetItemLabel(item2) .. ' verarbeitet.')
    
end)



-- 

RegisterServerEvent('workstation:open')
AddEventHandler('workstation:open', function(name, type)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
     identifier = xPlayer.getIdentifier()
     if type == "takein" then
        invName = "Workstation | Lager"
     else
        invName = "Workstation | Endprodukt"
     end
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
        
         
        for i = 1, #result, 1 do
            ------print(result[i].workstation)
            if result[i].workstation == name then
                TriggerClientEvent('openPlayerSecondInv', src, 'workstation_'..name..'_'..type, invName, identifier)
            else
                TriggerClientEvent('openPlayerInv', src)
            end
        end
    end)
end)

ESX.RegisterServerCallback('workstation:get', function(source, cb )
    local xPlayer = ESX.GetPlayerFromId(source) 
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
       
        
        for i = 1, #result, 1 do
            cb(result[i].workstation) 
            
        end
    end)
end)
RegisterServerEvent('workstation:verarbeiten')
AddEventHandler('workstation:verarbeiten', function(name, oldItem, oldCount, newItem, newCount)
    local src = source

    local oamount =  MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE identifier = @ident AND inventory = @inv AND item = @item", { ['@inv'] = 'workstation_'..name..'_takein', ['@item'] = oldItem, ['@ident'] = ESX.GetPlayerFromId(src).getIdentifier()})
    if oamount ~= nil then
        if oamount >= oldCount then
            if oamount - oldCount < 1 then
                MySQL.Sync.fetchScalar("DELETE FROM player_spind WHERE identifier = @ident AND inventory = @inv AND item = @item", { ['@inv'] = 'workstation_'..name..'_takein', ['@item'] = oldItem, ['@ident'] = ESX.GetPlayerFromId(src).getIdentifier()})
            end
            MySQL.Async.execute('UPDATE player_spind SET amount = @amount WHERE identifier = @identifier AND inventory = @inv AND item = @item', 
            { ['inv'] = 'workstation_'..name..'_takein' , ['identifier'] = ESX.GetPlayerFromId(src).getIdentifier(), ['amount'] = oamount - oldCount, ['@item'] = oldItem},
            function(affectedRows) 
            end)


            local oamountn =  MySQL.Sync.fetchScalar("SELECT amount FROM player_spind WHERE identifier = @ident AND inventory = @inv AND item = @item", { ['@inv'] = 'workstation_'..name..'_takeout', ['@item'] = newItem, ['@ident'] = ESX.GetPlayerFromId(src).getIdentifier()})
            if oamountn == nil then 
                MySQL.Sync.fetchScalar("INSERT INTO `player_spind` (`id`, `identifier`, `item`, `amount`, `inventory`) VALUES (NULL, @ident, @item, @amount, @inv);", { ['@inv'] = 'workstation_'..name..'_takeout', ['@item'] = newItem, ['@ident'] = ESX.GetPlayerFromId(src).getIdentifier(), ['@amount'] = newCount})
            else
                MySQL.Async.execute('UPDATE player_spind SET amount = @amount WHERE identifier = @identifier AND inventory = @inv AND item = @item', 
                { ['inv'] = 'workstation_'..name..'_takeout' , ['identifier'] = ESX.GetPlayerFromId(src).getIdentifier(), ['amount'] = oamountn + newCount, ['@item'] = newItem},
                function(affectedRows)
                end) 
            end
        else
        end
    else
    end
end) 

RegisterServerEvent('workstation:buy')
AddEventHandler('workstation:buy', function(name,price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price) 
        TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst '.. price .. '$!')
        MySQL.Sync.fetchScalar('UPDATE users SET workstation = @workstation WHERE identifier = @identifier', 
            { ['workstation'] = name, ['identifier'] = ESX.GetPlayerFromId(src).getIdentifier()})
        MySQL.Sync.fetchScalar('DELETE FROM player_spind WHERE identifier = @identifier AND inventory = @inv', 
            { ['inv'] = 'workstation_'..name..'_takein' , ['identifier'] = ESX.GetPlayerFromId(src).getIdentifier()})
        MySQL.Sync.fetchScalar('DELETE FROM player_spind WHERE identifier = @identifier AND inventory = @inv', 
            { ['inv'] = 'workstation_'..name..'_takeout' , ['identifier'] = ESX.GetPlayerFromId(src).getIdentifier()})
        TriggerClientEvent('glmp_notify', src, '', ' Workstation', 'Du hast dich erfolgreich eingemietet!')
        TriggerClientEvent('workstation:update', src)
    else  
        TriggerClientEvent('glmp_singlenotify', src, 'red', 'Du hast nicht genug Geld dabei!')
    end
end)