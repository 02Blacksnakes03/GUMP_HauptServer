ESX = nil
local arrayWeight = Config.localWeight
local VehicleList = { }
local VehicleInventory = {}


TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)



RegisterServerEvent('esx_trunk_inventory:getOwnedVehicule')
AddEventHandler('esx_trunk_inventory:getOwnedVehicule', function()
  local vehicules = {}
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles WHERE owner = @owner',
   		{
   			['@owner'] = xPlayer.identifier
   		},
    function(result)
      if result ~= nil and #result > 0 then
          for _,v in pairs(result) do
      			local vehicle = json.decode(v.vehicle)
      			table.insert(vehicules, {plate = vehicle.plate})
      		end
      end
    TriggerClientEvent('esx_trunk_inventory:setOwnedVehicule', _source, vehicules)
    end)
end)

function getItemWeight(item)
  local weight = 0
  local itemWeight = 0
    if item ~= nil then
      itemWeight = Config.DefaultWeight
      if arrayWeight[item] ~= nil then
        itemWeight = arrayWeight[item]
      end
    end
  return itemWeight
end


ESX.RegisterServerCallback('canInVehInventory', function(source, cb, plate, item, count, MaxWeight)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local xItem = xPlayer.getInventoryItem(item)


		local w = getTotalInventoryWeight(plate)
		print('weight from '.. plate .. ' is  '.. w .. '('..  xItem.weight * count + w  ..') maxed is '.. MaxWeight)
		if xItem.weight * count + w * 1000 >= MaxWeight then
			cb(false)
			--print("to false")
		else
			cb(true)
			--print("to true")
		end
end)





function getInventoryWeight(inventory)
  local weight = 0
  local itemWeight = 0
  if inventory ~= nil then
	  for i=1, #inventory, 1 do
	    if inventory[i] ~= nil then
	      itemWeight = Config.DefaultWeight
	      if arrayWeight[inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[inventory[i].name]
	      end
	      weight = weight + (itemWeight * (inventory[i].count or 1))
	    end
	  end
  end
  return weight
end


function getTotalInventoryWeight(plate)
  local total
  TriggerEvent('esx_trunk:getSharedDataStore',plate,function(store)
    local W_weapons = getInventoryWeight(store.get('weapons') or {})
    local W_coffre = getInventoryWeight(store.get('coffre') or {})
    local W_blackMoney =0
    local blackAccount = (store.get('black_money')) or 0
    if blackAccount ~=0 then
      W_blackMoney = blackAccount[1].amount /10
    end
    total = W_weapons + W_coffre + W_blackMoney
  end)
  return total
end

ESX.RegisterServerCallback('esx_trunk:getInventoryV',function(source,cb,plate)
  TriggerEvent('esx_trunk:getSharedDataStore',plate,function(store)
    local blackMoney = 0
     local items      = {}
     local weapons    = {}
     local xPlayer = ESX.GetPlayerFromId(source)
    weapons = (store.get('weapons') or {})

    local blackAccount = (store.get('black_money')) or 0
    if blackAccount ~=0 then
      blackMoney = blackAccount[1].amount
    end

    local coffre = (store.get('coffre') or {})
    for i=1,#coffre,1 do 
      table.insert(items,{name=coffre[i].name,count=coffre[i].count,label=ESX.GetItemLabel(coffre[i].name),weight = xPlayer.getInventoryItem(coffre[i].name).weight})
    end

    local weight = getTotalInventoryWeight(plate)
    cb({
    blackMoney = blackMoney,
    items      = items,
    weapons    = weapons,
    weight     = weight
    })
  end)
end)

RegisterServerEvent('esx_trunk:getItem')
AddEventHandler('esx_trunk:getItem', function(plate, type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_standard' then

    TriggerEvent('esx_trunk:getSharedDataStore', plate, function(store)
      local coffre = (store.get('coffre') or {})
      for i=1, #coffre,1 do
        if coffre[i].name == item then
          if (coffre[i].count >= count and count > 0) then
            local xItem = xPlayer.getInventoryItem(item)
			----print(ESX.DumpTable(coffre[i]))
			--break
			--[[if (xItem.count + count) > coffre[i].count then
			  TriggerClientEvent('esx:showNotification', _source, _U('invalid_quantity'))
			  --print(xItem.count)
			  --print(count)
			  --print(coffre[i].count)
			else
			]]       if xPlayer.getInventoryItem('backpack').count > 0 then
                  MaxWeight = 40000
                else
                  MaxWeight = 10000
                end
                if xItem.weight * count + xPlayer.getWeight() <= MaxWeight then
                  xPlayer.addInventoryItem(item, count) 
                  TriggerEvent('byte:sendLog', 'trunk', 'Kofferraum von '.. plate, "Der Spieler ".. xPlayer.name ..' nimmt '.. count ..'x '.. item .. ' raus.\n\n**Identifiers:**```'.. json.encode(GetPlayerIdentifiers(_source)) ..'```')
                  if (coffre[i].count - count) == 0 then
                    table.remove(coffre,i)
                  else
                    coffre[i].count = coffre[i].count - count
                  end
                else
                  TriggerClientEvent('esx:showNotification', _source, 'Deine Inventar Größe reicht nicht aus!')
                end
            --end
            break
          else
            TriggerClientEvent('glmp_notify', source, 'red', 'Kofferraum', 'Ungültige Menge')

          end
        end
      end


      store.set('coffre',coffre)
    end)
  end

  if type == 'item_account' then

    TriggerEvent('esx_trunk:getSharedDataStore', plate, function(store)

      local blackMoney = store.get('black_money')
      if (blackMoney[1].amount >= count and count > 0) then
        blackMoney[1].amount = blackMoney[1].amount - count
        store.set('black_money', blackMoney)
        xPlayer.addAccountMoney(item, count)
      else
        TriggerClientEvent('glmp_notify',source, 'red', 'Kofferraum', 'Ungültige Anzahl')
      end
    end)

  end

  if type == 'item_weapon' then

    TriggerEvent('esx_trunk:getSharedDataStore',  plate, function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      local weaponName   = nil
      local ammo         = nil

      for i=1, #storeWeapons, 1 do
        if storeWeapons[i].name == item then

          weaponName = storeWeapons[i].name
          ammo       = storeWeapons[i].ammo

          table.remove(storeWeapons, i)

          break
        end
      end

      store.set('weapons', storeWeapons)

      xPlayer.addWeapon(weaponName, ammo)

    end)

  end

end)

RegisterServerEvent('esx_trunk:putItem')
AddEventHandler('esx_trunk:putItem', function(plate, type, item, count,max, owned)
  --print("putItem")
  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)
  local xPlayerOwner = ESX.GetPlayerFromIdentifier(owner)

  if type == 'item_standard' then
    --print("itemStandard")
    local playerItemCount = xPlayer.getInventoryItem(item).count

    if (playerItemCount >= count and count > 0 )then
      --print("item count checked")

      TriggerEvent('esx_trunk:getSharedDataStore', plate, function(store)
        --print("get data store")
        local found = false
        local coffre = (store.get('coffre') or {})


        for i=1,#coffre,1 do
          if coffre[i].name == item then
            coffre[i].count = coffre[i].count + count
            found = true
          end
        end
        if not found then
          table.insert(coffre, {
            name = item,
            count = count
          })
        end
        --print("c2")
        if (getTotalInventoryWeight(plate)+(getItemWeight(item)*count))>max then
           TriggerClientEvent('glmp_notify',source, 'red', 'Kofferraum', 'Es ist nicht genug Platz im Kofferraum')
           --print("weight")
        else
          -- Checks passed, storing the item.
          --print("coffe")
          store.set('coffre', coffre)
          TriggerEvent('byte:sendLog', 'trunk', 'Kofferraum von '.. plate, "Der Spieler ".. xPlayer.name ..' legt '.. count ..'x '.. item .. ' rein.\n\n**Identifiers:**```'.. json.encode(GetPlayerIdentifiers(_source)) .. '```')
          xPlayer.removeInventoryItem(item, count)
          --print("sql")
          MySQL.Async.execute( 'UPDATE trunk_inventory SET owned = @owned WHERE plate = @plate',
          {
            ['@plate'] = plate,
            ['@owned'] = owned,
          })

        end
      end)

    else
      TriggerEvent('glmp_notify', 'red', 'Kofferraum', 'Ungültige Menge')
    end

  end

  if type == 'item_account' then

    local playerAccountMoney = xPlayer.getAccount(item).money


    if (playerAccountMoney >= count and count > 0) then


      TriggerEvent('esx_trunk:getSharedDataStore', plate , function(store)

        local blackMoney = (store.get('black_money') or nil)
        if blackMoney ~= nil then
          blackMoney[1].amount = blackMoney[1].amount + count
        else
          blackMoney = {}
          table.insert(blackMoney,{amount=count})
        end

        if (getTotalInventoryWeight(plate)+blackMoney[1].amount/10) > max then
          TriggerEvent('glmp_notify', 'red', 'Kofferraum', 'Es ist nicht genug Platz im Kofferraum')
        else
          
          -- Checks passed. Storing the item.
          xPlayer.removeAccountMoney(item, count)
          store.set('black_money', blackMoney)

          MySQL.Async.execute( 'UPDATE trunk_inventory SET owned = @owned WHERE plate = @plate',
          {
            ['@plate'] = plate,
            ['@owned'] = owned,
          })
        end
      end)

    else
      TriggerEvent('glmp_notify', 'red', 'Kofferraum', 'Ungültige Anzahl')
    end

  end

  if type == 'item_weapon' then

    TriggerEvent('esx_trunk:getSharedDataStore', plate, function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      table.insert(storeWeapons, {
        name = item,
        ammo = count
      })
      if (getTotalInventoryWeight(plate)+(getItemWeight(item)))>max then
          TriggerEvent('glmp_notify', 'red', 'Kofferraum', 'Ungültige Anzahl')
      else
        store.set('weapons', storeWeapons)
        xPlayer.removeWeapon(item)
        
        MySQL.Async.execute( 'UPDATE trunk_inventory SET owned = @owned WHERE plate = @plate',
        {
          ['@plate'] = plate,
          ['@owned'] = owned,
        })
      end
    end)

  end

end)

ESX.RegisterServerCallback('esx_trunk:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local blackMoney = xPlayer.getAccount('black_money').money
  local items      = xPlayer.inventory

  cb({
    blackMoney = blackMoney,
    items      = items
  })

end)

function all_trim(s)
	if s then
		return s:match"^%s*(.*)":match"(.-)%s*$"
	else
		return 'noTagProvided'
	end
end
