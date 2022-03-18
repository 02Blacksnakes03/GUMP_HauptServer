ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)
--print("LOADED CLOTHINGSHOP")
local cNames = {
  ["1"] = {
      type = "normal",
      tid = "mask_1",
      draw = "mask_2"
  },
  ["4"] = {
      type = "normal",
      tid = "pants_1",
      draw = "pants_2"
  },
  ["6"] = {
      type = "normal",
      tid = "shoes_1",
      draw = "shoes_2"
  },
  ["7"] = {
      type = "normal",
      tid = "chain_1",
      draw = "chain_2"
  },
  ["8"] = {
      type = "normal",
      tid = "tshirt_1",
      draw = "thirst_2"
  }, 
  ["11"] = {
      type = "normal",
      tid = "torso_1",
      draw = "torso_2"
  },
  ["p-0"] = {
      type = "normal",
      tid = "helmet_1",
      draw = "helmet_2"
  },
  ["p-1"] = {
      type = "normal",
      tid = "glasses_1",
      draw = "glasses_2"
  },
  ["p-2"] = {
      type = "normal",
      tid = "ears_1",
      draw = "ears_2"
  },
  ["p-6"] = {
      type = "normal",
      tid = "watches_1",
      draw = "watches_2"
  },
  --[[["p-7"] = {
      type = "normal",
      tid = "bracelets_1",
      draw = "bracelets_2"
  }, ]]
  ["p-7"] = {
    type = "normal",
    tid = "arms",
    draw = "" 
} 
}


ESX.RegisterServerCallback("glmp:clothingShopLoadCategories", function(source, cb, id)
    --print("load from ".. id)
    MySQL.Async.fetchAll("SELECT * FROM clothingshop_categories WHERE slotid = @id", {['id'] = id}, function(result)
        local categorys = {}
        for i=1, #result, 1 do
            --print( result[i].name)
            categorys[result[i].categoryid] = {
                Name = result[i].name,
                Id = result[i].categoryid
            }
        end
        cb(CleanNils(categorys))
    end)
end)

ESX.RegisterServerCallback("glmp:clothingShopLoadClothes", function(source, cb, category, slot)
  if slot == "p-7" then
    slott = 99
  else
    slott = slot
  end
  --print("C: ".. category)
  --print("S: ".. slott)
    MySQL.Async.fetchAll("SELECT * FROM clothingshop_clothes WHERE slot = @slot AND category = @category AND frak = @frak", {['slot'] = slott, ['category'] = category, ['frak'] = 'all'}, function(result)
        local clothes = {}
        for i=1, #result, 1 do
            clothes[result[i].id] = {
                Name = result[i].name,
                Id = result[i].id,
                Price = result[i].price
            }
        end
        cb(CleanNils(clothes))
    end)
end)
ESX.RegisterServerCallback("glmp:wardrobeLoadClothes", function(source, cb, slot, frak)
  local xPlayer = ESX.GetPlayerFromId(source)
  ident = 'hf'
  if frak == 'normal' then 
     ident = xPlayer.getIdentifier()
  else
     ident = frak 
  end
  --print(ident)
  MySQL.Async.fetchAll("SELECT * FROM clothingshop_wardrobe WHERE slot = @slot AND identifier = @identifier", {['slot'] = slot, ['identifier'] = ident}, function(result)
      local clothes = {}
      for i=1, #result, 1 do
          clothes[result[i].id] = {
              Name = result[i].name,
              Id = result[i].clothid
          }
      end
      cb(CleanNils(clothes))
  end)
end)

RegisterCommand('setcprice', function(source, args)
	TriggerClientEvent('glmp_notify', source, 'green', 'KLEIDUNGSLADEN', 'Kleidung '.. args[1] .. ' kostet nun '.. args[2] ..'$!')
	MySQL.Sync.fetchScalar("UPDATE `clothingshop_clothes` SET `price` = @price WHERE `clothingshop_clothes`.`id` = @id;", { ['@price'] = args[2],  ['@id'] = args[1]})
	TriggerEvent('byte:sendLog', 'report', ESX.GetPlayerFromId(source).getName() .. ' - KLEIDUNG: Price set to '.. args[2] .. '$ where ID '.. args[1])
end)

RegisterCommand('setfc', function(source, args)
    MySQL.Async.fetchAll("SELECT * FROM clothingshop_clothes WHERE id = @id", {['id'] = args[1]}, function(result)
        MySQL.Async.execute("INSERT INTO clothingshop_wardrobe (identifier, clothid, slot, name) VALUES (@identifier, @clothid, @slot, @name)", {['identifier'] = args[2], ['clothid'] = args[1], ['slot'] = result[1].slot, ['name'] = result[1].name})
      end)   
      MySQL.Sync.fetchScalar("UPDATE `clothingshop_clothes` SET `frak` = @price WHERE `clothingshop_clothes`.`id` = @id;", { ['@price'] = args[2],  ['@id'] = args[1]})
      TriggerClientEvent('glmp_notify', source, 'green', 'KLEIDUNGSLADEN', 'Kleidung '.. args[1] .. ' ist nun im Kleiderschrank von '.. args[2] .. ' verfügbar!')
      TriggerEvent('byte:sendLog', 'report', ESX.GetPlayerFromId(source).getName() .. ' - KLEIDUNG: ID '.. args[1] .. ' | FRAK '.. args[2])
end)
RegisterCommand('removec', function( source, args ) 
	MySQL.Sync.fetchScalar("UPDATE `clothingshop_clothes` SET `frak` = @price WHERE `clothingshop_clothes`.`id` = @id;", { ['@price'] = "delete",  ['@id'] = args[1]})
	TriggerClientEvent('glmp_notify', source, 'green', 'KLEIDUNGSLADEN', 'Kleidung '.. args[1] .. ' entfernt! SYNTEX IST EIN HURENSOHN')
	TriggerEvent('byte:sendLog', 'report', ESX.GetPlayerFromId(source).getName() .. ' - KLEIDUNG: Delete '.. args[1] .. ' gegen gayced seine dummheut') 
end) 
 
ESX.RegisterServerCallback("glmp:ClothingShopBuy", function(source, cb, cart, wearing, skin)
  local xPlayer = ESX.GetPlayerFromId(source)
  local oldskin = skin
  local preis = 0
  local gekauft = {} 
  for i=1, #cart, 1 do
    local cur = cart[i]
    gekauft[cur.Id] = {
      Price = cur.Price,
      categoryName = cur.categoryName,
      slotName = cur.slotName,
      Name = cur.Name
    }
    preis = preis + cur.Price
  end
  for i=1, #wearing, 1 do 
    local cur = wearing[i]
    if gekauft[cur.Id] ~= nil then
      MySQL.Async.fetchAll("SELECT * FROM clothingshop_clothes WHERE slot = @slot AND id = @id", {['slot'] = cur.Slot, ['id'] = cur.Id}, function(result)
        local object = cNames[tostring(cur.Slot)]
        skin[object.tid] = result[1].draw
        skin[object.draw] = result[1].tid
      end)
    end
  end
  if xPlayer.getAccount("money").money >= preis then
    TriggerClientEvent('glmp_notify', xPlayer.source, "green", "", "Sie haben einen Einkauf im Wert von " .. preis .. "$ getätigt.")
    xPlayer.removeAccountMoney('money', preis)
    for k,v in pairs(gekauft) do
      MySQL.Async.fetchAll("SELECT * FROM clothingshop_clothes WHERE id = @id", {['id'] = k}, function(result)
        MySQL.Async.execute("INSERT INTO clothingshop_wardrobe (identifier, clothid, slot, name) VALUES (@identifier, @clothid, @slot, @name)", {['identifier'] = xPlayer.getIdentifier(), ['clothid'] = k, ['slot'] = result[1].slot, ['name'] = v.Name})
      end)
    end
    Wait(#wearing + #cart)
    local obj = { 
      skin = skin, 
      bought = true
    }
    cb(obj)
  elseif xPlayer.getAccount("money").money <= preis then
    TriggerClientEvent('glmp_notify', xPlayer.source, "red", "", "Sie können sich den Einkauf für " .. preis .. "$ nicht leisten.")
    Wait(#wearing + #cart)
    local obj = {
      skin = oldskin, 
      bought = false
    }
    cb(obj)
  end
end)

ESX.RegisterServerCallback("glmp:clothingShopGetIds", function(source, cb, clothid, slot)
    MySQL.Async.fetchAll("SELECT * FROM clothingshop_clothes WHERE slot = @slot AND id = @id", {['slot'] = slot, ['id'] = clothid}, function(result)
        if result[1] then
            cb(result)
        end
    end)
end) 

function CleanNils(t)
  local ans = {}
  for _,v in pairs(t) do
    ans[ #ans+1 ] = v
  end
  return ans
end

local obj = [[
  [
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 0,
      "Name": "Rote Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 1,
      "Name": "Blaue Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 2,
      "Name": "Grüne Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 3,
      "Name": "Gelbe Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 4,
      "Name": "Wüstentarn-Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 5,
      "Name": "Schwarze Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 6,
      "Name": "Graue Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 0,
      "TextureID": 7,
      "Name": "Weiße Ohrenschützer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 1,
      "TextureID": 0,
      "Name": "Weiße Eselsmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 0,
      "Name": "Schwarze Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 1,
      "Name": "Graue Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 2,
      "Name": "Blaue Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 3,
      "Name": "Rastafarbene Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 4,
      "Name": "Grau gestreifte Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 5,
      "Name": "Dreifarbige Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 6,
      "Name": "Weiße Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 2,
      "TextureID": 7,
      "Name": "Bordeauxrote Wintermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 3,
      "TextureID": 1,
      "Name": "Schwarzer Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 3,
      "TextureID": 2,
      "Name": "Hellbrauner Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 4,
      "TextureID": 0,
      "Name": "Schwarze LS Fitted-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 4,
      "TextureID": 1,
      "Name": "Graue LS Fitted-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 5,
      "TextureID": 0,
      "Name": "Schwarze Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 5,
      "TextureID": 1,
      "Name": "Graue Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 0,
      "Name": "Grüne Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 1,
      "Name": "Schwarze Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 2,
      "Name": "Graue Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 3,
      "Name": "Blaue Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 4,
      "Name": "Wüstentarn-Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 5,
      "Name": "Waldtarn-Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 6,
      "Name": "Beige Ranch Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 6,
      "TextureID": 7,
      "Name": "Braune Ranch Militärmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 0,
      "Name": "Weiße Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 1,
      "Name": "Graue Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 2,
      "Name": "Schwarze Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 3,
      "Name": "Marineblaue Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 4,
      "Name": "Rote Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 5,
      "Name": "Braune Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 6,
      "Name": "Grüne Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 7,
      "TextureID": 7,
      "Name": "Gelbe Schiebermütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 9,
      "TextureID": 5,
      "Name": "Grüne Fruntalot Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 9,
      "TextureID": 7,
      "Name": "Lila Stank Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 10,
      "TextureID": 5,
      "Name": "Grüne Fruntalot Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 10,
      "TextureID": 7,
      "Name": "Lila Stank Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 11,
      "TextureID": 1,
      "Name": "Schwarzer Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 11,
      "TextureID": 3,
      "Name": "Olivgrüner Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 11,
      "TextureID": 6,
      "Name": "Blauer Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 12,
      "TextureID": 0,
      "Name": "Schwarzer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 12,
      "TextureID": 1,
      "Name": "Weißer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 12,
      "TextureID": 2,
      "Name": "Aschgrauer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 12,
      "TextureID": 4,
      "Name": "Brauner Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 12,
      "TextureID": 6,
      "Name": "Grüner Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 12,
      "TextureID": 7,
      "Name": "Marineblauer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 0,
      "Name": "Schwarzer Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 1,
      "Name": "Brauner Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 2,
      "Name": "Schokobrauner Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 3,
      "Name": "Weißer Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 4,
      "Name": "Kastanienbrauner Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 5,
      "Name": "Beiger Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 6,
      "Name": "Roter Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 13,
      "TextureID": 7,
      "Name": "Hellbeiger Cowboyhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 0,
      "Name": "Weiße Paisley-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 1,
      "Name": "Schwarze Paisley-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 2,
      "Name": "Marineblaue Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 3,
      "Name": "Rote Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 4,
      "Name": "Grüne Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 5,
      "Name": "Lila Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 6,
      "Name": "Tarn-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 14,
      "TextureID": 7,
      "Name": "Gelbe Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 0,
      "Name": "Weiße Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 1,
      "Name": "Schwarze Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 2,
      "Name": "Rote Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 3,
      "Name": "Blaue Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 4,
      "Name": "Gelbe Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 5,
      "Name": "Lila Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 6,
      "Name": "Graue Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 15,
      "TextureID": 7,
      "Name": "Grüne Beat Off Kopfhörer"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 0,
      "Name": "Gelber Western MC Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 1,
      "Name": "Blauer Steel Horse Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 2,
      "Name": "Oranger Steel Horse Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 3,
      "Name": "Grüner Western MC Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 4,
      "Name": "Roter Western MC Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 5,
      "Name": "Schwarzer Steel Horse Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 6,
      "Name": "Schwarzer Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 16,
      "TextureID": 7,
      "Name": "Violetter Western MC Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 0,
      "Name": "Blauer Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 1,
      "Name": "Oranger Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 2,
      "Name": "Hellblauer Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 3,
      "Name": "Roter Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 4,
      "Name": "Grauer Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 5,
      "Name": "Schwarzer Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 6,
      "Name": "Pinker Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 17,
      "TextureID": 7,
      "Name": "Weißer Jethelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 0,
      "Name": "Splitter-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 1,
      "Name": "Sternen-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 2,
      "Name": "Quadrat-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 3,
      "Name": "Karmesinroter Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 4,
      "Name": "Totenschädel-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 5,
      "Name": "Pik-Ass-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 6,
      "Name": "Flammen-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 18,
      "TextureID": 7,
      "Name": "Weißer Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 20,
      "TextureID": 0,
      "Name": "Grüner Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 20,
      "TextureID": 1,
      "Name": "Grauer Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 20,
      "TextureID": 2,
      "Name": "Hinterland Stadttarn-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 20,
      "TextureID": 3,
      "Name": "Roter Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 20,
      "TextureID": 4,
      "Name": "Blumen-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 20,
      "TextureID": 5,
      "Name": "Waldtarn-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 0,
      "Name": "Hellbrauner Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 1,
      "Name": "Brauner Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 2,
      "Name": "Grauer Zorse Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 3,
      "Name": "Weißer Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 4,
      "Name": "Lila Ushero Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 5,
      "Name": "Schwarzer Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 6,
      "Name": "Grüner Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 21,
      "TextureID": 7,
      "Name": "Blauer Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 22,
      "TextureID": 0,
      "Name": "Rote Weihnachtsmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 22,
      "TextureID": 1,
      "Name": "Grüne Weihnachtsmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 23,
      "TextureID": 0,
      "Name": "Elfenmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 24,
      "TextureID": 0,
      "Name": "Rentiergeweih"
    },
    {
      "ComponentID": 0,
      "DrawableID": 25,
      "TextureID": 0,
      "Name": "Feiner blauer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 25,
      "TextureID": 1,
      "Name": "Feiner grauer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 25,
      "TextureID": 2,
      "Name": "Feiner brauner Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 0,
      "Name": "Schwarze Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 1,
      "Name": "Graue Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 2,
      "Name": "Blaue Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 3,
      "Name": "Hellgraue Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 4,
      "Name": "Olivgrüne Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 5,
      "Name": "Lila Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 6,
      "Name": "Hummerrote Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 7,
      "Name": "Braune Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 8,
      "Name": "Altmodische Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 9,
      "Name": "Cremefarbene Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 10,
      "Name": "Aschgraue Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 11,
      "Name": "Marineblaue Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 12,
      "Name": "Silberne Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 26,
      "TextureID": 13,
      "Name": "Weiße Melone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 0,
      "Name": "Schwarzer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 1,
      "Name": "Grauer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 2,
      "Name": "Blauer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 3,
      "Name": "Hellgrauer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 4,
      "Name": "Olivgrüner Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 5,
      "Name": "Lila Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 6,
      "Name": "Hummerroter Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 7,
      "Name": "Brauner Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 8,
      "Name": "Altmodischer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 9,
      "Name": "Cremefarbener Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 10,
      "Name": "Aschgrauer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 11,
      "Name": "Marineblauer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 12,
      "Name": "Silberner Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 27,
      "TextureID": 13,
      "Name": "Weißer Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 28,
      "TextureID": 0,
      "Name": "Blaue Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 28,
      "TextureID": 1,
      "Name": "Weiße Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 28,
      "TextureID": 2,
      "Name": "Rote Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 28,
      "TextureID": 3,
      "Name": "Hellgrüne Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 28,
      "TextureID": 4,
      "Name": "Lila Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 28,
      "TextureID": 5,
      "Name": "Gelbe Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 0,
      "Name": "Grauer Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 1,
      "Name": "Schwarzer Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 2,
      "Name": "Weißer Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 3,
      "Name": "Cremefarbener Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 4,
      "Name": "Roter Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 5,
      "Name": "Schwarzroter Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 6,
      "Name": "Brauner Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 29,
      "TextureID": 7,
      "Name": "Blauer Trilby"
    },
    {
      "ComponentID": 0,
      "DrawableID": 30,
      "TextureID": 0,
      "Name": "Roter Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 30,
      "TextureID": 1,
      "Name": "Pinker Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 31,
      "TextureID": 0,
      "Name": "USA-Fischerhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 32,
      "TextureID": 0,
      "Name": "USA-Zylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 33,
      "TextureID": 0,
      "Name": "Roter Schaumstoffzylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 33,
      "TextureID": 1,
      "Name": "Blauer Schaumstoffzylinder"
    },
    {
      "ComponentID": 0,
      "DrawableID": 34,
      "TextureID": 0,
      "Name": "Patrioten-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 35,
      "TextureID": 0,
      "Name": "USA-Krone"
    },
    {
      "ComponentID": 0,
      "DrawableID": 36,
      "TextureID": 0,
      "Name": "USA-Party-Haarreif"
    },
    {
      "ComponentID": 0,
      "DrawableID": 37,
      "TextureID": 0,
      "Name": "Pißwasser-Bierhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 37,
      "TextureID": 1,
      "Name": "Benedict-Bierhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 37,
      "TextureID": 2,
      "Name": "J Lager-Bierhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 37,
      "TextureID": 3,
      "Name": "Patriot-Bierhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 37,
      "TextureID": 4,
      "Name": "Blarneys-Bierhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 37,
      "TextureID": 5,
      "Name": "Supa Wet-Bierhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 38,
      "TextureID": 0,
      "Name": "Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 39,
      "TextureID": 0,
      "Name": "Kugelsicher, schwarz"
    },
    {
      "ComponentID": 0,
      "DrawableID": 39,
      "TextureID": 1,
      "Name": "Kugelsicher, grau"
    },
    {
      "ComponentID": 0,
      "DrawableID": 39,
      "TextureID": 2,
      "Name": "Kugelsicher, anthrazit"
    },
    {
      "ComponentID": 0,
      "DrawableID": 39,
      "TextureID": 3,
      "Name": "Kugelsicher, hellbraun"
    },
    {
      "ComponentID": 0,
      "DrawableID": 39,
      "TextureID": 4,
      "Name": "Kugelsicher, Wald"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 0,
      "Name": "Klassischer Baum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 1,
      "Name": "Lila Baum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 2,
      "Name": "Winterbeerenbaum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 3,
      "Name": "Rot gestreifter Baum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 4,
      "Name": "Grün gestreifter Baum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 5,
      "Name": "Sternenbaum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 6,
      "Name": "Weihnachtsmannbaum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 40,
      "TextureID": 7,
      "Name": "Elfenbaum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 41,
      "TextureID": 0,
      "Name": "Pudding-Wollstrickmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 42,
      "TextureID": 0,
      "Name": "Kesse Elfen-Wollzipfelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 42,
      "TextureID": 1,
      "Name": "Unartige Elfen-Wollzipfelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 42,
      "TextureID": 2,
      "Name": "Fröhliche Elfen-Wollzipfelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 42,
      "TextureID": 3,
      "Name": "Alberne Elfen-Wollzipfelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 43,
      "TextureID": 0,
      "Name": "Clan-Tartan-Pudelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 43,
      "TextureID": 1,
      "Name": "Highland-Tartan-Pudelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 43,
      "TextureID": 2,
      "Name": "Häuptling-Tartan-Pudelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 43,
      "TextureID": 3,
      "Name": "Klassik-Tartan-Pudelmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 0,
      "Name": "Naughty-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 1,
      "Name": "Schwarze Ho Ho Ho-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 2,
      "Name": "Blaue Schneeflockenkappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 3,
      "Name": "Nice-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 4,
      "Name": "Grüne Ho Ho Ho-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 5,
      "Name": "Rote Schneeflockenkappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 6,
      "Name": "Lebkuchenkappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 44,
      "TextureID": 7,
      "Name": "Bah Humbug-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 0,
      "Name": "Naughty-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 1,
      "Name": "Schw. Ho Ho Ho-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 2,
      "Name": "Blaue Schneeflockenk., rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 3,
      "Name": "Nice-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 4,
      "Name": "Grüne Ho Ho Ho-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 5,
      "Name": "Rote Schneeflockenk., rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 6,
      "Name": "Lebkuchenkappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 45,
      "TextureID": 7,
      "Name": "Bah Humbug-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 47,
      "TextureID": 0,
      "Name": "Schwarzer Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 48,
      "TextureID": 0,
      "Name": "Glänzend, schwarz, Offroad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 49,
      "TextureID": 0,
      "Name": "Matt, schwarz, Offroad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 50,
      "TextureID": 0,
      "Name": "Glänzend, schwarz, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 51,
      "TextureID": 0,
      "Name": "Glänz., verspiegelt, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 52,
      "TextureID": 0,
      "Name": "Matt, schwarz, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 53,
      "TextureID": 0,
      "Name": "Matt, verspiegelt, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 0,
      "Name": "Rote Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 1,
      "Name": "Anthrazitgraue Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 2,
      "Name": "Cremef. Trickster-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 3,
      "Name": "Marineblaue Trickster-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 4,
      "Name": "Braune Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 5,
      "Name": "Braune Harsh-Souls-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 6,
      "Name": "Orange Sweatbox-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 7,
      "Name": "Blaue Sweatbox-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 8,
      "Name": "Gestreifte Yeti-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 9,
      "Name": "Link-Trickster-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 10,
      "Name": "Rauten-Yeti-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 11,
      "Name": "Kirschrote Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 12,
      "Name": "Hellbraune Fruntalot-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 13,
      "Name": "Grüne Sweatbox-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 14,
      "Name": "Dschungeltarn-Yeti-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 15,
      "Name": "Waldtarn-Trickster-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 16,
      "Name": "Kaffeebraune Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 17,
      "Name": "Zweif. Trey-Baker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 18,
      "Name": "Graue Sweatbox-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 19,
      "Name": "Cremef. Sweatbox-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 20,
      "Name": "Rote Yeti-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 21,
      "Name": "Weiße Harsh-Souls-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 22,
      "Name": "Marineblaue Fruntalot-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 23,
      "Name": "Gelbe Sweatbox-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 24,
      "Name": "Ganz schwarze Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 55,
      "TextureID": 25,
      "Name": "Schwarze Broker-Snapback"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 0,
      "Name": "Magnetics Schreibschrift-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 1,
      "Name": "Magnetics Blockschrift-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 2,
      "Name": "Low Santos-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 3,
      "Name": "Boars-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 4,
      "Name": "Benny's-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 5,
      "Name": "Westside-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 6,
      "Name": "Eastside-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 7,
      "Name": "Strawberry-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 8,
      "Name": "Schwarze SA-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 56,
      "TextureID": 9,
      "Name": "Davis-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 58,
      "TextureID": 0,
      "Name": "Hellbraune Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 58,
      "TextureID": 1,
      "Name": "Khakifarbene Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 58,
      "TextureID": 2,
      "Name": "Schwarze Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 0,
      "Name": "Blauer Karo-Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 1,
      "Name": "Roter Fedora, Streifenband"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 2,
      "Name": "Grauer Karo-Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 3,
      "Name": "Schwarzer Fedora, lila Band"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 4,
      "Name": "Weißer Fedora, graues Band"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 5,
      "Name": "Himmelblauer Karo-Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 6,
      "Name": "Schokobrauner Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 7,
      "Name": "Senffarbener Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 8,
      "Name": "Karmesinroter Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 9,
      "Name": "Klassischer Karo-Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 10,
      "Name": "Beiger Karo-Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 64,
      "TextureID": 11,
      "Name": "Königsblauer Fedora"
    },
    {
      "ComponentID": 0,
      "DrawableID": 65,
      "TextureID": 0,
      "Name": "SecuroServ-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 66,
      "TextureID": 0,
      "Name": "SecuroServ-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 0,
      "Name": "Splitter-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 1,
      "Name": "Sternen-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 2,
      "Name": "Quadrat-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 3,
      "Name": "Karmesinroter Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 4,
      "Name": "Totenschädel-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 5,
      "Name": "Pik-Ass-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 6,
      "Name": "Flammen-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 7,
      "Name": "Weißer Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 8,
      "Name": "Talfahrt-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 9,
      "Name": "Slalom-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 10,
      "Name": "Tod-in-San-Andreas-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 11,
      "Name": "Puls-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 12,
      "Name": "Lava-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 13,
      "Name": "Tri-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 14,
      "Name": "Sprunk-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 15,
      "Name": "Skelett-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 16,
      "Name": "Todes-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 17,
      "Name": "Pflasterstein-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 18,
      "Name": "Kubismus-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 19,
      "Name": "Digitaltarn-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 20,
      "Name": "Schlangenhaut-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 21,
      "Name": "Boost-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 22,
      "Name": "Solar-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 67,
      "TextureID": 23,
      "Name": "Atomic-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 68,
      "TextureID": 0,
      "Name": "Glänzend, schwarz, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 69,
      "TextureID": 0,
      "Name": "Glänz., verspiegelt, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 70,
      "TextureID": 0,
      "Name": "Matt, schwarz, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 71,
      "TextureID": 0,
      "Name": "Matt, verspiegelt, Motorrad"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 0,
      "Name": "Cremefarbener Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 1,
      "Name": "Grauer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 2,
      "Name": "Oranger Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 3,
      "Name": "Hellblauer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 8,
      "Name": "Weißer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 9,
      "Name": "Blauer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 10,
      "Name": "Roter Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 11,
      "Name": "Schwarzer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 73,
      "TextureID": 12,
      "Name": "Rosa Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 0,
      "Name": "Cremefarbener Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 1,
      "Name": "Grauer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 2,
      "Name": "Oranger Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 3,
      "Name": "Hellblauer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 8,
      "Name": "Weißer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 9,
      "Name": "Blauer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 10,
      "Name": "Roter Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 11,
      "Name": "Schwarzer Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 74,
      "TextureID": 12,
      "Name": "Rosa Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 4,
      "Name": "Wirbel-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 5,
      "Name": "Roter Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 6,
      "Name": "Brauner Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 7,
      "Name": "Weißer Flaggen-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 8,
      "Name": "Blauer Sterne-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 9,
      "Name": "Schwarzer Schlitze-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 10,
      "Name": "Weißer Sterne-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 11,
      "Name": "Blauer Streifen-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 12,
      "Name": "Roter Streifen-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 13,
      "Name": "Blauer Ketten-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 14,
      "Name": "Schwarzer Streifen-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 75,
      "TextureID": 15,
      "Name": "Schwarzer Wellen-Rollerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 0,
      "Name": "Atomic-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 1,
      "Name": "Auto Exotic\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 2,
      "Name": "Chepalle-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 3,
      "Name": "Cunning Stunts\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 4,
      "Name": "Flash-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 5,
      "Name": "Fukaru-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 6,
      "Name": "Globe Oil\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 7,
      "Name": "Grotti-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 8,
      "Name": "Imponte Racing\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 9,
      "Name": "Lampadati Racing\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 10,
      "Name": "LTD-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 11,
      "Name": "Nagasaki Racing\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 12,
      "Name": "Nagasaki Moto\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 13,
      "Name": "Patriot-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 14,
      "Name": "Rebel Radio\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 15,
      "Name": "Redwood-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 16,
      "Name": "Scooter Brothers\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 17,
      "Name": "The Mount\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 18,
      "Name": "Total Ride\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 19,
      "Name": "Vapid-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 76,
      "TextureID": 20,
      "Name": "Xero Gas\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 0,
      "Name": "Atomic-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 1,
      "Name": "Auto Exotic\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 2,
      "Name": "Chepalle-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 3,
      "Name": "Cunning Stunts\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 4,
      "Name": "Flash-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 5,
      "Name": "Fukaru-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 6,
      "Name": "Globe Oil\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 7,
      "Name": "Grotti-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 8,
      "Name": "Imponte Racing\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 9,
      "Name": "Lampadati Racing\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 10,
      "Name": "LTD-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 11,
      "Name": "Nagasaki Racing\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 12,
      "Name": "Nagasaki Moto\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 13,
      "Name": "Patriot-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 14,
      "Name": "Rebel Radio\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 15,
      "Name": "Redwood-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 16,
      "Name": "Scooter Brothers\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 17,
      "Name": "The Mount\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 18,
      "Name": "Total Ride\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 19,
      "Name": "Vapid-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 77,
      "TextureID": 20,
      "Name": "Xero Gas\"-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 78,
      "TextureID": 0,
      "Name": "Weißer JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 78,
      "TextureID": 1,
      "Name": "Blauer JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 78,
      "TextureID": 2,
      "Name": "Roter JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 78,
      "TextureID": 3,
      "Name": "Schwarzer JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 78,
      "TextureID": 4,
      "Name": "Rosa JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 79,
      "TextureID": 0,
      "Name": "Weißer JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 79,
      "TextureID": 1,
      "Name": "Blauer JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 79,
      "TextureID": 2,
      "Name": "Roter JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 79,
      "TextureID": 3,
      "Name": "Schwarzer JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 79,
      "TextureID": 4,
      "Name": "Rosa JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 80,
      "TextureID": 0,
      "Name": "Goldener JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 80,
      "TextureID": 1,
      "Name": "Silberner JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 80,
      "TextureID": 2,
      "Name": "Goldener Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 80,
      "TextureID": 3,
      "Name": "Silberner Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 81,
      "TextureID": 0,
      "Name": "Goldener JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 81,
      "TextureID": 1,
      "Name": "Silberner JC-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 81,
      "TextureID": 2,
      "Name": "Goldener Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 81,
      "TextureID": 3,
      "Name": "Silberner Retrohelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 0,
      "Name": "Splitter-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 1,
      "Name": "Sternen-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 2,
      "Name": "Quadrat-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 3,
      "Name": "Karmesinroter Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 4,
      "Name": "Totenschädel-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 5,
      "Name": "Pik-Ass-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 6,
      "Name": "Flammen-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 7,
      "Name": "Weißer Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 8,
      "Name": "Talfahrt-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 9,
      "Name": "Slalom-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 10,
      "Name": "Tod-in-San-Andreas-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 11,
      "Name": "Puls-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 12,
      "Name": "Lava-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 13,
      "Name": "Tri-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 14,
      "Name": "Sprunk-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 15,
      "Name": "Skelett-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 16,
      "Name": "Todes-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 17,
      "Name": "Pflasterstein-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 18,
      "Name": "Kubismus-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 19,
      "Name": "Digitaltarn-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 20,
      "Name": "Schlangenhaut-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 21,
      "Name": "Boost-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 22,
      "Name": "Solar-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 82,
      "TextureID": 23,
      "Name": "Atomic-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 0,
      "Name": "Schwarzes geknotetes Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 1,
      "Name": "Gekn. Uptown-Riders-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 2,
      "Name": "Geknotetes Ride-Free-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 3,
      "Name": "Geknotetes Pik-Ass-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 4,
      "Name": "Geknotetes Schlangen-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 5,
      "Name": "Geknotetes Stier-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 83,
      "TextureID": 6,
      "Name": "Geknotetes Amerika-Bandana"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 0,
      "Name": "Schwarzer Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 1,
      "Name": "Carbon-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 2,
      "Name": "Oranger Carbon-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 3,
      "Name": "Amerika-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 4,
      "Name": "Grüner Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 5,
      "Name": "Feder-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 6,
      "Name": "Stier-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 7,
      "Name": "Ride-Free-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 8,
      "Name": "Pik-Ass-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 84,
      "TextureID": 9,
      "Name": "Schlangen-Stachelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 85,
      "TextureID": 0,
      "Name": "Halbschalenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 86,
      "TextureID": 0,
      "Name": "Halbschalenhelm mit Visier"
    },
    {
      "ComponentID": 0,
      "DrawableID": 87,
      "TextureID": 0,
      "Name": "Halbschalenhelm mit Kamm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 88,
      "TextureID": 0,
      "Name": "Halbschalenhelm mit Stacheln"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 0,
      "Name": "Schwarzer Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 1,
      "Name": "Carbon-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 2,
      "Name": "Oranger Carbon-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 3,
      "Name": "Amerika-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 4,
      "Name": "Grüner Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 5,
      "Name": "Feder-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 6,
      "Name": "Stier-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 7,
      "Name": "Ride-Free-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 8,
      "Name": "Pik-Ass-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 89,
      "TextureID": 9,
      "Name": "Schlangen-Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 90,
      "TextureID": 0,
      "Name": "Verchromter Kuppelhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 0,
      "Name": "Deadline Gelb"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 1,
      "Name": "Deadline Grün"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 2,
      "Name": "Deadline Orange"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 3,
      "Name": "Deadline Violett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 4,
      "Name": "Deadline Pink"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 5,
      "Name": "Deadline Rot"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 6,
      "Name": "Deadline Blau"
    },
    {
      "ComponentID": 0,
      "DrawableID": 91,
      "TextureID": 9,
      "Name": "Deadline Weiß"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 0,
      "Name": "Deadline Gelb"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 1,
      "Name": "Deadline Grün"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 2,
      "Name": "Deadline Orange"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 3,
      "Name": "Deadline Violett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 4,
      "Name": "Deadline Pink"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 5,
      "Name": "Deadline Rot"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 6,
      "Name": "Deadline Blau"
    },
    {
      "ComponentID": 0,
      "DrawableID": 92,
      "TextureID": 9,
      "Name": "Deadline Weiß"
    },
    {
      "ComponentID": 0,
      "DrawableID": 93,
      "TextureID": 0,
      "Name": "Mod-Kokarden-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 93,
      "TextureID": 1,
      "Name": "Faggio-Mod-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 93,
      "TextureID": 2,
      "Name": "Gr. Mod-Kokarden-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 93,
      "TextureID": 3,
      "Name": "Gr. Faggio-Mod-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 0,
      "Name": "Cremefarbener Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 1,
      "Name": "Roter Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 2,
      "Name": "Blauer Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 3,
      "Name": "Zyanfarbener Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 4,
      "Name": "Weißer Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 5,
      "Name": "Grauer Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 6,
      "Name": "Marineblauer Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 7,
      "Name": "Dunkelroter Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 8,
      "Name": "Schieferfarbener Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 94,
      "TextureID": 9,
      "Name": "Moosfarbener Mod-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 0,
      "Name": "Cremefarbener Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 1,
      "Name": "Roter Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 2,
      "Name": "Blauer Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 3,
      "Name": "Zyanfarbener Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 4,
      "Name": "Weißer Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 5,
      "Name": "Grauer Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 6,
      "Name": "Marineblauer Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 7,
      "Name": "Dunkelroter Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 8,
      "Name": "Schieferfarb. Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 95,
      "TextureID": 9,
      "Name": "Moosfarbener Mod-Porkpie-Hut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 0,
      "Name": "Schwarze Bigness-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 1,
      "Name": "Rote Bigness-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 2,
      "Name": "Orange Tarn-Sand-Castle-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 3,
      "Name": "Lila Güffy-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 4,
      "Name": "Altweiße Bigness-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 5,
      "Name": "Abstrakte Bigness-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 6,
      "Name": "Graue abstrakte Bigness-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 7,
      "Name": "Helle abstrakte Bigness-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 8,
      "Name": "Gestreifte Squash-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 9,
      "Name": "Gepunktete Squash-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 10,
      "Name": "Squash-Bananen-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 11,
      "Name": "Squash-Spritzer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 12,
      "Name": "Squash-Orangensaft-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 13,
      "Name": "Güffy-Blätter-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 14,
      "Name": "Rote Güffy-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 96,
      "TextureID": 15,
      "Name": "Weiße Güffy-Neon-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 97,
      "TextureID": 0,
      "Name": "Leuchtender klassischer Baum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 97,
      "TextureID": 1,
      "Name": "Leuchtender lila Baum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 97,
      "TextureID": 2,
      "Name": "Leuchtende Stechpalme"
    },
    {
      "ComponentID": 0,
      "DrawableID": 97,
      "TextureID": 3,
      "Name": "Leuchtender Sternenbaum"
    },
    {
      "ComponentID": 0,
      "DrawableID": 98,
      "TextureID": 0,
      "Name": "Leuchtende Pudding-Wollmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 99,
      "TextureID": 0,
      "Name": "Leuchtende kesse Elfenmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 100,
      "TextureID": 0,
      "Name": "Leuchtende Elfenmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 101,
      "TextureID": 0,
      "Name": "Leuchtendes Rentiergeweih"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 0,
      "Name": "Blaue Digitaltarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 1,
      "Name": "Braune Digitaltarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 2,
      "Name": "Grüne Digitaltarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 3,
      "Name": "Graue Digitaltarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 4,
      "Name": "Pfirsichf. Digitaltarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 5,
      "Name": "Herbsttarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 6,
      "Name": "Dunkle Waldtarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 7,
      "Name": "Crosshatch-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 8,
      "Name": "Moosgrüne Digitaltarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 9,
      "Name": "Graue Waldtarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 10,
      "Name": "Aquablaue Tarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 11,
      "Name": "Splitter-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 12,
      "Name": "Kontrasttarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 13,
      "Name": "Pflasterstein-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 14,
      "Name": "Pfirsichfarbene Tarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 15,
      "Name": "Pinselstrich-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 16,
      "Name": "Flecktarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 17,
      "Name": "Helle Waldtarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 18,
      "Name": "Moosgrüne Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 103,
      "TextureID": 19,
      "Name": "Sandbraune Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 0,
      "Name": "Blauer Digitaltarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 1,
      "Name": "Brauner Digitaltarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 2,
      "Name": "Grüner Digitaltarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 3,
      "Name": "Grauer Digitaltarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 4,
      "Name": "Pfirsichf. Digitaltarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 5,
      "Name": "Herbsttarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 6,
      "Name": "Dunkler Waldtarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 7,
      "Name": "Crosshatch-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 8,
      "Name": "Moosgrüner Digitaltarn-Kremp."
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 9,
      "Name": "Grauer Waldtarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 10,
      "Name": "Aquablauer Tarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 11,
      "Name": "Splitter-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 12,
      "Name": "Kontrasttarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 13,
      "Name": "Pflasterstein-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 14,
      "Name": "Pfirsichf. Tarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 15,
      "Name": "Pinselstrich-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 16,
      "Name": "Flecktarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 17,
      "Name": "Heller Waldtarn-Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 18,
      "Name": "Moosgrüner Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 19,
      "Name": "Sandbrauner Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 20,
      "Name": "Schwarzer Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 21,
      "Name": "Schiefergrauer Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 22,
      "Name": "Weißer Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 23,
      "Name": "Schokobrauner Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 24,
      "Name": "Olivgrüner Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 104,
      "TextureID": 25,
      "Name": "Hellbrauner Krempenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 0,
      "Name": "Blauer Digitaltarn-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 1,
      "Name": "Brauner Digitalt.-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 2,
      "Name": "Grüner Digitalt.-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 3,
      "Name": "Grauer Digitalt.-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 4,
      "Name": "Pfirs. Digitaltarn-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 5,
      "Name": "Herbsttarn-Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 6,
      "Name": "Dunkler Waldtarn-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 7,
      "Name": "Crosshatch-Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 8,
      "Name": "Moosgr. Digitalt.-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 9,
      "Name": "Grauer Waldtarn-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 10,
      "Name": "Aquablauer Tarn-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 11,
      "Name": "Splitter-Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 12,
      "Name": "Kontrasttarn-Krempenh. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 13,
      "Name": "Pflasterstein-Krempenh. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 14,
      "Name": "Pfirsichf. Tarn-Krempenh. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 15,
      "Name": "Pinselstrich-Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 16,
      "Name": "Flecktarn-Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 17,
      "Name": "Heller Waldtarn-Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 18,
      "Name": "Moosgrüner Krempenh. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 19,
      "Name": "Sandbrauner Krempenh. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 20,
      "Name": "Schwarzer Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 21,
      "Name": "Schiefergrauer Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 22,
      "Name": "Weißer Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 23,
      "Name": "Schokobrauner Kremp. (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 24,
      "Name": "Olivgrüner Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 105,
      "TextureID": 25,
      "Name": "Hellbrauner Krempenhut (hoch)"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 0,
      "Name": "Blaues Digitaltarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 1,
      "Name": "Braunes Digitaltarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 2,
      "Name": "Grünes Digitaltarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 3,
      "Name": "Graues Digitaltarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 4,
      "Name": "Pfirsichf. Digitaltarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 5,
      "Name": "Herbsttarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 6,
      "Name": "Dunkles Waldtarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 7,
      "Name": "Crosshatch-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 8,
      "Name": "Moosgrünes Digitaltarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 9,
      "Name": "Graues Waldtarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 10,
      "Name": "Aquablaues Tarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 11,
      "Name": "Splitter-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 12,
      "Name": "Kontrasttarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 13,
      "Name": "Pflasterstein-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 14,
      "Name": "Pfirsichfarbenes Tarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 15,
      "Name": "Pinselstrich-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 16,
      "Name": "Flecktarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 17,
      "Name": "Helles Waldtarn-Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 18,
      "Name": "Moosgrünes Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 19,
      "Name": "Sandbraunes Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 20,
      "Name": "Mitternachtsbarett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 21,
      "Name": "Schiefergraues Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 22,
      "Name": "Eisweißes Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 23,
      "Name": "Schokoladenbraunes Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 24,
      "Name": "Olivgrünes Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 106,
      "TextureID": 25,
      "Name": "Hellbraunes Barett"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 0,
      "Name": "Blaue Digitaltarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 1,
      "Name": "Braune Digitaltarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 2,
      "Name": "Grüne Digitaltarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 3,
      "Name": "Graue Digitaltarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 4,
      "Name": "Pfirsichf. Digitaltarn-Schirmm."
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 5,
      "Name": "Herbsttarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 6,
      "Name": "Dunkle Waldtarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 7,
      "Name": "Crosshatch-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 8,
      "Name": "Moosgr. Digitaltarn-Schirmm."
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 9,
      "Name": "Graue Waldtarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 10,
      "Name": "Aquablaue Tarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 11,
      "Name": "Splitter-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 12,
      "Name": "Kontrasttarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 13,
      "Name": "Pflasterstein-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 14,
      "Name": "Pfirsichf. Tarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 15,
      "Name": "Pinselstrich-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 16,
      "Name": "Flecktarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 17,
      "Name": "Helle Waldtarn-Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 18,
      "Name": "Moosgrüne Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 19,
      "Name": "Sandbraune Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 20,
      "Name": "Schwarze Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 21,
      "Name": "Schiefergraue Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 22,
      "Name": "Weiße Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 23,
      "Name": "Schokoladenbr. Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 24,
      "Name": "Olivgrüne Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 107,
      "TextureID": 25,
      "Name": "Hellbraune Schirmmütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 0,
      "Name": "Blaue Digitaltarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 1,
      "Name": "Braune Digitaltarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 2,
      "Name": "Grüne Digitaltarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 3,
      "Name": "Graue Digitaltarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 4,
      "Name": "Pfirs. Digitaltarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 5,
      "Name": "Herbsttarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 6,
      "Name": "Dunkle Waldtarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 7,
      "Name": "Crosshatch-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 8,
      "Name": "Moosgr. Digitaltarn-Beaniekap."
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 9,
      "Name": "Graue Waldtarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 10,
      "Name": "Aquablaue Tarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 11,
      "Name": "Splitter-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 12,
      "Name": "Kontrasttarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 13,
      "Name": "Pflasterstein-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 14,
      "Name": "Pfirsichf. Tarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 15,
      "Name": "Pinselstrich-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 16,
      "Name": "Flecktarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 17,
      "Name": "Helle Waldtarn-Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 18,
      "Name": "Moosgrüne Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 19,
      "Name": "Sandbraune Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 20,
      "Name": "Schwarze Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 21,
      "Name": "Schiefergraue Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 22,
      "Name": "Weiße Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 23,
      "Name": "Schokoladenbr. Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 24,
      "Name": "Olivgrüne Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 108,
      "TextureID": 25,
      "Name": "Hellbraune Beaniekappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 0,
      "Name": "Rote Hawk-&-Little-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 1,
      "Name": "Schwarze Hawk-&-Little-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 2,
      "Name": "Weiße Shrewsbury-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 3,
      "Name": "Schwarze Shrewsbury-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 4,
      "Name": "Weiße Vom-Feuer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 5,
      "Name": "Schwarze Vom-Feuer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 6,
      "Name": "Weinrote Coil-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 7,
      "Name": "Schwarze Coil-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 8,
      "Name": "Schwarze Ammu-Nation-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 9,
      "Name": "Rote Ammu-Nation-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 109,
      "TextureID": 10,
      "Name": "Warstock-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 0,
      "Name": "Rote Hawk-&-Little-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 1,
      "Name": "Schwarze Hawk-&-Little-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 2,
      "Name": "Weiße Shrewsbury-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 3,
      "Name": "Schwarze Shrewsbury-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 4,
      "Name": "Weiße Vom-Feuer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 5,
      "Name": "Schwarze Vom-Feuer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 6,
      "Name": "Weinrote Coil-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 7,
      "Name": "Schwarze Coil-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 8,
      "Name": "Schwarze Ammu-Nation-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 9,
      "Name": "Rote Ammu-Nation-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 110,
      "TextureID": 10,
      "Name": "Warstock-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 0,
      "Name": "Orangefarbener Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 1,
      "Name": "Grüner Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 2,
      "Name": "Brauner Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 3,
      "Name": "Weißer Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 8,
      "Name": "Limonengrün-schw. Pilotenh."
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 9,
      "Name": "51st-Squad-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 10,
      "Name": "Orange-schwarzer Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 11,
      "Name": "Zeus-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 12,
      "Name": "Grüngelber Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 13,
      "Name": "Blau-oranger Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 14,
      "Name": "DFA-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 15,
      "Name": "Snake-Killers-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 16,
      "Name": "Mind-Over-Matter-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 17,
      "Name": "Rotweißer Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 18,
      "Name": "Other-Side-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 19,
      "Name": "STFU-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 20,
      "Name": "Patriot-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 21,
      "Name": "Zebramuster-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 22,
      "Name": "Tigermuster-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 23,
      "Name": "Leopardenmuster-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 24,
      "Name": "Haimaul-Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 111,
      "TextureID": 25,
      "Name": "Gelb-schwarzer Pilotenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 0,
      "Name": "Waldtarn-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 1,
      "Name": "Dunkler Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 2,
      "Name": "Heller Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 3,
      "Name": "Flecktarn-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 4,
      "Name": "Schwarzer Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 5,
      "Name": "Sani-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 6,
      "Name": "Grauer Waldtarn-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 7,
      "Name": "Hellbr. Digitaltarn-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 8,
      "Name": "Aquablauer Tarn-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 9,
      "Name": "Splitter-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 10,
      "Name": "Roter-Stern-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 11,
      "Name": "Brauner Digitaltarn-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 12,
      "Name": "Feldjäger-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 13,
      "Name": "Zebramuster-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 14,
      "Name": "Leopardenmuster-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 15,
      "Name": "Tigermuster-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 16,
      "Name": "Polizei-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 17,
      "Name": "Flammen-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 18,
      "Name": "Amerika-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 19,
      "Name": "Patrioten-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 20,
      "Name": "Grüne-Sterne-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 112,
      "TextureID": 21,
      "Name": "Frieden-Kampfhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 0,
      "Name": "Blaurote Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 1,
      "Name": "Schwarze Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 2,
      "Name": "Blaue Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 3,
      "Name": "Marineblaue Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 4,
      "Name": "Aquablaue Tarn-Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 5,
      "Name": "Weiße Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 6,
      "Name": "Rotweiße Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 7,
      "Name": "Graue Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 8,
      "Name": "Grünrote Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 9,
      "Name": "Braunrote Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 10,
      "Name": "Hellbraune Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 11,
      "Name": "Moosgrüne Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 12,
      "Name": "Graue Digitaltarn-Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 13,
      "Name": "Dunkle Waldtarn-Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 14,
      "Name": "Rote Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 113,
      "TextureID": 15,
      "Name": "Schokobraune Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 0,
      "Name": "Weißgoldenes Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 1,
      "Name": "Weißblaues Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 2,
      "Name": "Graues Leoparden-Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 3,
      "Name": "Marineblaues Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 4,
      "Name": "Blaues Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 5,
      "Name": "Türkises Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 6,
      "Name": "Aquablaues Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 7,
      "Name": "Schwarzes Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 8,
      "Name": "Schokobraunes Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 9,
      "Name": "Rotes Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 10,
      "Name": "Rot-marineblaues Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 11,
      "Name": "Rotes Tarn-Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 12,
      "Name": "Pinselstrich-Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 13,
      "Name": "Moosgrünes Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 14,
      "Name": "Braunes Digitaltarn-Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 15,
      "Name": "Beiges Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 16,
      "Name": "Weißes Tarn-Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 17,
      "Name": "Graues Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 114,
      "TextureID": 18,
      "Name": "Zebramuster-Schiffchen"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 0,
      "Name": "Schwarze Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 1,
      "Name": "Moosgrüne Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 2,
      "Name": "Braune Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 3,
      "Name": "Weiße Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 8,
      "Name": "Leopardenmuster-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 9,
      "Name": "Braune Digitaltarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 10,
      "Name": "Tigermuster-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 11,
      "Name": "Pink gemusterte Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 12,
      "Name": "Pfirs. Digitaltarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 13,
      "Name": "Herbsttarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 14,
      "Name": "Dunkle Waldtarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 15,
      "Name": "Crosshatch-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 16,
      "Name": "Grün gemusterte Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 17,
      "Name": "Graue Waldtarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 18,
      "Name": "Aquablaue Tarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 19,
      "Name": "Splitter-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 20,
      "Name": "Kontrasttarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 21,
      "Name": "Pflasterstein-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 22,
      "Name": "Pinselstrich-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 23,
      "Name": "Flecktarn-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 24,
      "Name": "Schwarzrote Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 115,
      "TextureID": 25,
      "Name": "Zebramuster-Vollmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 0,
      "Name": "Schwarze Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 1,
      "Name": "Moosgrüne Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 2,
      "Name": "Braune Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 3,
      "Name": "Weiße Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 8,
      "Name": "Leopardenmuster-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 9,
      "Name": "Braune Digitaltarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 10,
      "Name": "Tigermuster-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 11,
      "Name": "Pink gemusterte Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 12,
      "Name": "Pfirsichf. Digitaltarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 13,
      "Name": "Herbsttarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 14,
      "Name": "Dunkle Waldtarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 15,
      "Name": "Crosshatch-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 16,
      "Name": "Grün gemusterte Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 17,
      "Name": "Graue Waldtarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 18,
      "Name": "Aquablaue Tarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 19,
      "Name": "Splitter-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 20,
      "Name": "Kontrasttarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 21,
      "Name": "Pflasterstein-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 22,
      "Name": "Pinselstrich-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 23,
      "Name": "Flecktarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 24,
      "Name": "Schwarzrote Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 116,
      "TextureID": 25,
      "Name": "Zebramuster-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 0,
      "Name": "Schwarze Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 1,
      "Name": "Moosgrüne Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 2,
      "Name": "Braune Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 3,
      "Name": "Weiße Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 8,
      "Name": "Leopardenmuster-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 9,
      "Name": "Braune Digitaltarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 10,
      "Name": "Tigermuster-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 11,
      "Name": "Pink gemusterte Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 12,
      "Name": "Pfirsichf. Digitaltarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 13,
      "Name": "Herbsttarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 14,
      "Name": "Dunkle Waldtarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 15,
      "Name": "Crosshatch-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 16,
      "Name": "Grün gemusterte Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 17,
      "Name": "Graue Waldtarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 18,
      "Name": "Aquablaue Tarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 19,
      "Name": "Splitter-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 20,
      "Name": "Kontrasttarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 21,
      "Name": "Pflasterstein-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 22,
      "Name": "Pinselstrich-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 23,
      "Name": "Flecktarn-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 24,
      "Name": "Schwarzrote Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 117,
      "TextureID": 25,
      "Name": "Zebramuster-Doppellinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 0,
      "Name": "Schwarze Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 1,
      "Name": "Moosgrüne Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 2,
      "Name": "Braune Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 3,
      "Name": "Weiße Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 8,
      "Name": "Leopardenmuster-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 9,
      "Name": "Br. Digitaltarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 10,
      "Name": "Tigermuster-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 11,
      "Name": "Pink gemusterte Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 12,
      "Name": "Pfirs. Digitaltarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 13,
      "Name": "Herbsttarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 14,
      "Name": "Dunkle Waldtarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 15,
      "Name": "Crosshatch-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 16,
      "Name": "Grün gemusterte Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 17,
      "Name": "Graue Waldtarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 18,
      "Name": "Aquablaue Tarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 19,
      "Name": "Splitter-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 20,
      "Name": "Kontrasttarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 21,
      "Name": "Pflasterstein-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 22,
      "Name": "Pinselstrich-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 23,
      "Name": "Flecktarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 24,
      "Name": "Schwarzrote Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 118,
      "TextureID": 25,
      "Name": "Zebramuster-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 0,
      "Name": "Schwarze Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 1,
      "Name": "Moosgrüne Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 2,
      "Name": "Braune Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 3,
      "Name": "Weiße Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 8,
      "Name": "Leopardenmuster-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 9,
      "Name": "Br. Digitaltarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 10,
      "Name": "Tigermuster-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 11,
      "Name": "Pink gemusterte Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 12,
      "Name": "Pfirs. Digitaltarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 13,
      "Name": "Herbsttarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 14,
      "Name": "Dunkle Waldtarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 15,
      "Name": "Crosshatch-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 16,
      "Name": "Grün gemusterte Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 17,
      "Name": "Graue Waldtarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 18,
      "Name": "Aquablaue Tarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 19,
      "Name": "Splitter-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 20,
      "Name": "Kontrasttarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 21,
      "Name": "Pflasterstein-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 22,
      "Name": "Pinselstrich-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 23,
      "Name": "Flecktarn-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 24,
      "Name": "Schwarzrote Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 119,
      "TextureID": 25,
      "Name": "Zebramuster-Vierfachlinse"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 0,
      "Name": "Schwarze flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 1,
      "Name": "Anthrazitgraue flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 2,
      "Name": "Aschgraue flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 3,
      "Name": "Weiße flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 4,
      "Name": "Rote flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 5,
      "Name": "Blaue flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 6,
      "Name": "Hellblaue flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 7,
      "Name": "Beige flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 8,
      "Name": "Helle flache Waldtarn-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 9,
      "Name": "Graue flache Waldtarn-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 10,
      "Name": "Aquablaue flache Tarn-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 11,
      "Name": "Flache Tigermuster-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 12,
      "Name": "Flache Trikolore-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 13,
      "Name": "Blau gestreifte flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 14,
      "Name": "Flache Rastatrio-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 15,
      "Name": "Braun gestreifte flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 16,
      "Name": "Flache Amerika-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 17,
      "Name": "Flache Rastastreifen-Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 18,
      "Name": "Schwarzgelbe flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 19,
      "Name": "Blaugelbe flache Beanie"
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 20,
      "Name": "Grüne flache Hahnentritt-B."
    },
    {
      "ComponentID": 0,
      "DrawableID": 120,
      "TextureID": 21,
      "Name": "Beige flache Hahnentritt-B."
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 0,
      "Name": "Schwarzer Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 1,
      "Name": "Weißer Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 2,
      "Name": "Grauer Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 3,
      "Name": "Moosgrüner Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 4,
      "Name": "Br. Digitaltarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 5,
      "Name": "Grauer Digitaltarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 6,
      "Name": "Crosshatch-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 7,
      "Name": "Blauer Digitaltarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 8,
      "Name": "Herbsttarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 9,
      "Name": "Aquablauer Tarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 10,
      "Name": "Splitter-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 11,
      "Name": "Grauer Waldtarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 12,
      "Name": "Pinselstrich-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 13,
      "Name": "Moosgr. Digitalt.-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 14,
      "Name": "MP-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 123,
      "TextureID": 15,
      "Name": "LSPD-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 0,
      "Name": "Schwarzer Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 1,
      "Name": "Weißer Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 2,
      "Name": "Grauer Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 3,
      "Name": "Moosgrüner Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 4,
      "Name": "Br. Digitaltarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 5,
      "Name": "Grauer Digitaltarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 6,
      "Name": "Crosshatch-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 7,
      "Name": "Blauer Digitaltarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 8,
      "Name": "Herbsttarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 9,
      "Name": "Aquablauer Tarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 10,
      "Name": "Splitter-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 11,
      "Name": "Grauer Waldtarn-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 12,
      "Name": "Pinselstrich-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 13,
      "Name": "Moosgr. Digitalt.-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 14,
      "Name": "MP-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 124,
      "TextureID": 15,
      "Name": "LSPD-Einsatzhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 0,
      "Name": "Schwarze Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 1,
      "Name": "Cremefarbene Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 2,
      "Name": "Steingraue Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 3,
      "Name": "Braune Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 4,
      "Name": "Rote Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 5,
      "Name": "Blaue Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 6,
      "Name": "Braune Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 7,
      "Name": "Graue Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 8,
      "Name": "Kontrasttarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 9,
      "Name": "Blaue Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 10,
      "Name": "Herbsttarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 11,
      "Name": "Aquablaue Tarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 12,
      "Name": "Helle Waldtarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 13,
      "Name": "Splitter-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 14,
      "Name": "Graue Waldtarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 15,
      "Name": "Moosgr. Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 16,
      "Name": "Crosshatch-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 17,
      "Name": "Anarchie-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 125,
      "TextureID": 18,
      "Name": "Polizei-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 0,
      "Name": "Schwarze Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 1,
      "Name": "Cremefarbene Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 2,
      "Name": "Steingraue Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 3,
      "Name": "Braune Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 4,
      "Name": "Rote Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 5,
      "Name": "Blaue Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 6,
      "Name": "Braune Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 7,
      "Name": "Graue Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 8,
      "Name": "Kontrasttarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 9,
      "Name": "Blaue Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 10,
      "Name": "Herbsttarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 11,
      "Name": "Aquablaue Tarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 12,
      "Name": "Helle Waldtarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 13,
      "Name": "Splitter-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 14,
      "Name": "Graue Waldtarn-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 15,
      "Name": "Moosgr. Digitalt.-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 16,
      "Name": "Crosshatch-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 17,
      "Name": "Anarchie-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 126,
      "TextureID": 18,
      "Name": "Polizei-Einsatzhaube"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 0,
      "Name": "Burger-Shot-Hamburger-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 1,
      "Name": "Burger-Shot-Fritten-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 2,
      "Name": "Burger-Shot-Logo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 3,
      "Name": "Burger-Shot-Volltreffer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 4,
      "Name": "Gelbe Cluckin'-Bell-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 5,
      "Name": "Blaue Cluckin'-Bell-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 6,
      "Name": "Cluckin'-Bell-Logo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 7,
      "Name": "Schwarze Hotdogs-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 8,
      "Name": "Taco-Bomb-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 9,
      "Name": "Violette Hotdogs-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 10,
      "Name": "Pinke Hotdogs-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 11,
      "Name": "Weiße Lucky-Plucker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 12,
      "Name": "Rote Lucky-Plucker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 13,
      "Name": "Rote Lucky-Plucker-Muster-K."
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 14,
      "Name": "Weiße Lucky-Plucker-Muster-K."
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 15,
      "Name": "Weiße Pißwasser-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 16,
      "Name": "Schwarze Pißwasser-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 17,
      "Name": "Weiße Taco-Bomb-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 130,
      "TextureID": 18,
      "Name": "Grüne Taco-Bomb-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 0,
      "Name": "Burger-Shot-Hamburger-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 1,
      "Name": "Burger-Shot-Fritten-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 2,
      "Name": "Burger-Shot-Logo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 3,
      "Name": "Burger-Shot-Volltreffer-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 4,
      "Name": "Gelbe Cluckin'-Bell-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 5,
      "Name": "Blaue Cluckin'-Bell-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 6,
      "Name": "Cluckin'-Bell-Logo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 7,
      "Name": "Schwarze Hotdogs-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 8,
      "Name": "Taco-Bomb-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 9,
      "Name": "Violette Hotdogs-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 10,
      "Name": "Pinke Hotdogs-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 11,
      "Name": "Weiße Lucky-Plucker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 12,
      "Name": "Rote Lucky-Plucker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 13,
      "Name": "Rote Lucky-Plucker-Muster-K."
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 14,
      "Name": "Weiße Lucky-Plucker-Muster-K."
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 15,
      "Name": "Weiße Pißwasser-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 16,
      "Name": "Schwarze Pißwasser-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 17,
      "Name": "Weiße Taco-Bomb-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 131,
      "TextureID": 18,
      "Name": "Grüne Taco-Bomb-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 132,
      "TextureID": 0,
      "Name": "Taco-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 132,
      "TextureID": 1,
      "Name": "Burger-Shot-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 132,
      "TextureID": 2,
      "Name": "Cluckin'-Bell-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 132,
      "TextureID": 3,
      "Name": "Hotdogs-Leinenhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 0,
      "Name": "Weiße The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 1,
      "Name": "Schwarze The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 2,
      "Name": "Weiße LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 3,
      "Name": "Schwarze LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 4,
      "Name": "Rote The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 5,
      "Name": "Orange The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 6,
      "Name": "Blaue LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 7,
      "Name": "Grüne The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 8,
      "Name": "Orange LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 9,
      "Name": "Violette The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 10,
      "Name": "Pinke LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 11,
      "Name": "Weiße Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 12,
      "Name": "Schwarze Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 13,
      "Name": "Türkise Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 14,
      "Name": "Rote Flying-Bravo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 15,
      "Name": "Grüne Flying-Bravo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 16,
      "Name": "Schwarze SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 17,
      "Name": "Türkise SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 18,
      "Name": "Violette SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 19,
      "Name": "Rote SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 20,
      "Name": "Weiße SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 21,
      "Name": "Graue Yeti-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 22,
      "Name": "Bunte Yeti-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 135,
      "TextureID": 23,
      "Name": "Yeti-Waldtarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 0,
      "Name": "Weiße The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 1,
      "Name": "Schwarze The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 2,
      "Name": "Weiße LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 3,
      "Name": "Schwarze LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 4,
      "Name": "Rote The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 5,
      "Name": "Orange The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 6,
      "Name": "Blaue LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 7,
      "Name": "Grüne The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 8,
      "Name": "Orange LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 9,
      "Name": "Violette The-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 10,
      "Name": "Pinke LS-Diamond-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 11,
      "Name": "Weiße Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 12,
      "Name": "Schwarze Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 13,
      "Name": "Türkise Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 14,
      "Name": "Rote Flying-Bravo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 15,
      "Name": "Grüne Flying-Bravo-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 16,
      "Name": "Schwarze SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 17,
      "Name": "Türkise SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 18,
      "Name": "Violette SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 19,
      "Name": "Rote SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 20,
      "Name": "Weiße SC-Broker-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 21,
      "Name": "Graue Yeti-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 22,
      "Name": "Bunte Yeti-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 136,
      "TextureID": 23,
      "Name": "Yeti-Waldtarn-Kappe"
    },
    {
      "ComponentID": 0,
      "DrawableID": 137,
      "TextureID": 0,
      "Name": "Gelber Feuerwehrhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 137,
      "TextureID": 1,
      "Name": "Oranger Feuerwehrhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 137,
      "TextureID": 2,
      "Name": "Weißer Feuerwehrhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 138,
      "TextureID": 0,
      "Name": "Gelber Feuerwehrhelm & Brille"
    },
    {
      "ComponentID": 0,
      "DrawableID": 138,
      "TextureID": 1,
      "Name": "Oranger Feuerwehrh. & Brille"
    },
    {
      "ComponentID": 0,
      "DrawableID": 138,
      "TextureID": 2,
      "Name": "Weißer Feuerwehrh. & Brille"
    },
    {
      "ComponentID": 0,
      "DrawableID": 139,
      "TextureID": 0,
      "Name": "Bugstars-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 139,
      "TextureID": 1,
      "Name": "Prison-Authority-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 139,
      "TextureID": 2,
      "Name": "Yung-Ancestor-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 140,
      "TextureID": 0,
      "Name": "Bugstars-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 140,
      "TextureID": 1,
      "Name": "Prison-Authority-Kappe, rück."
    },
    {
      "ComponentID": 0,
      "DrawableID": 140,
      "TextureID": 2,
      "Name": "Yung-Ancestor-Kappe, rück."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 0,
      "Name": "Schwarze Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 1,
      "Name": "Graue Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 2,
      "Name": "Hellgraue Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 3,
      "Name": "Rote Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 4,
      "Name": "Türkise Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 5,
      "Name": "Smiley-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 6,
      "Name": "Graue Digitaltarn-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 7,
      "Name": "Blaue Digitaltarn-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 8,
      "Name": "Blaue-Welle-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 9,
      "Name": "Amerika-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 10,
      "Name": "Breites-Grinsen-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 11,
      "Name": "Wolf-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 12,
      "Name": "Graue Tarn-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 13,
      "Name": "Schwarze Schädelkappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 14,
      "Name": "Blutkreuz-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 15,
      "Name": "Braune Schädelkappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 16,
      "Name": "Grüne Tarn-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 17,
      "Name": "Neongrüne Tarn-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 18,
      "Name": "Neonlila Tarn-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 19,
      "Name": "Kopfstein-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 20,
      "Name": "Gr. Schlangenh.-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 142,
      "TextureID": 21,
      "Name": "Lila Schlangenh.-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 0,
      "Name": "Schwarze Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 1,
      "Name": "Graue Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 2,
      "Name": "Hellgraue Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 3,
      "Name": "Rote Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 4,
      "Name": "Türkise Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 5,
      "Name": "Smiley-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 6,
      "Name": "Graue Digitaltarn-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 7,
      "Name": "Blaue Digitaltarn-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 8,
      "Name": "Blaue-Welle-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 9,
      "Name": "Amerika-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 10,
      "Name": "Breites-Grinsen-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 11,
      "Name": "Wolf-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 12,
      "Name": "Graue Tarn-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 13,
      "Name": "Schwarze Schädelkappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 14,
      "Name": "Blutkreuz-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 15,
      "Name": "Braune Schädelkappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 16,
      "Name": "Grüne Tarn-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 17,
      "Name": "Neongrüne Tarn-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 18,
      "Name": "Neonlila Tarn-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 19,
      "Name": "Kopfstein-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 20,
      "Name": "Gr. Schlangenh.-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 143,
      "TextureID": 21,
      "Name": "Lila Schlangenh.-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 144,
      "TextureID": 0,
      "Name": "Gruppe-Sechs-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 145,
      "TextureID": 0,
      "Name": "Gelber Bauarbeiterhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 145,
      "TextureID": 1,
      "Name": "Oranger Bauarbeiterhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 145,
      "TextureID": 2,
      "Name": "Weißer Bauarbeiterhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 145,
      "TextureID": 3,
      "Name": "Blauer Bauarbeiterhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 0,
      "Name": "Schwarzer Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 1,
      "Name": "Dunkelgrauer Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 2,
      "Name": "Violetter Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 3,
      "Name": "Hellgrauer Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 4,
      "Name": "Salbeigrüner Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 5,
      "Name": "Dunkelpinker Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 6,
      "Name": "Roter Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 7,
      "Name": "Terracottafarbener Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 8,
      "Name": "Cremefarbener Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 9,
      "Name": "Elfenbeinfarbener Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 10,
      "Name": "Aschgrauer Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 11,
      "Name": "Dunkellila Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 12,
      "Name": "Eierschalenfarb. Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 146,
      "TextureID": 13,
      "Name": "Weißer Bestatterhut"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 0,
      "Name": "Schwarze Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 1,
      "Name": "Salbeifarb. Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 2,
      "Name": "Beige Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 3,
      "Name": "Steingraue Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 4,
      "Name": "Weiße Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 5,
      "Name": "Beige Digital-Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 6,
      "Name": "Grüne Digital-Nachtsichtm."
    },
    {
      "ComponentID": 0,
      "DrawableID": 147,
      "TextureID": 7,
      "Name": "Wüstenf. Digital-Nachtsichtm."
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 0,
      "Name": "Schwarze Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 1,
      "Name": "Salbeifarb. Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 2,
      "Name": "Beige Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 3,
      "Name": "Steingraue Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 4,
      "Name": "Weiße Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 5,
      "Name": "Beige Digital-Nachtsichtmaske"
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 6,
      "Name": "Grüne Digital-Nachtsichtm."
    },
    {
      "ComponentID": 0,
      "DrawableID": 148,
      "TextureID": 7,
      "Name": "Wüstenf. Digital-Nachtsichtm."
    },
    {
      "ComponentID": 0,
      "DrawableID": 149,
      "TextureID": 0,
      "Name": "Captain-Parademütze"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 0,
      "Name": "Schwarzer fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 1,
      "Name": "Moosgrüner fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 2,
      "Name": "Brauner fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 3,
      "Name": "Weißer fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 8,
      "Name": "Fortschr. Leopardenhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 9,
      "Name": "Brauner fortschr. Digit.-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 10,
      "Name": "Fortschr. Tigerhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 11,
      "Name": "Pink gemusterter fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 12,
      "Name": "Pfirsichf. fortschr. Digit.-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 13,
      "Name": "Fortschr. Herbsttarnhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 14,
      "Name": "Dunkler fortschr. Waldtarnhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 15,
      "Name": "Fortschr. Crosshatch-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 16,
      "Name": "Grün gemusterter fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 17,
      "Name": "Grauer fortschr. Waldtarnhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 18,
      "Name": "Aquablauer fortschr. Tarnhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 19,
      "Name": "Fortschr. Splitter-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 20,
      "Name": "Fortschr. Kontrasttarnhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 21,
      "Name": "Fortschr. Pflasterstein-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 22,
      "Name": "Fortschr. Pinselstrich-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 23,
      "Name": "Fortschr. Flecktarnhelm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 24,
      "Name": "Schwarz-roter fortschr. Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 150,
      "TextureID": 25,
      "Name": "Fortschr. Zebra-Helm"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 0,
      "Name": "Enus-Yeti-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 1,
      "Name": "720-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 2,
      "Name": "Exsorbeo-720-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 3,
      "Name": "Güffy-Doppellogo-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 4,
      "Name": "Rockstar-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 5,
      "Name": "Weiße Civilist-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 6,
      "Name": "Schwarze Civilist-Kappe, vorw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 151,
      "TextureID": 7,
      "Name": "Orange Civilist-Kappe, vorwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 0,
      "Name": "Enus-Yeti-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 1,
      "Name": "720-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 2,
      "Name": "Exsorbeo-720-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 3,
      "Name": "Güffy-Doppellogo-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 4,
      "Name": "Rockstar-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 5,
      "Name": "Weiße Civilist-Kappe, rückwärts"
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 6,
      "Name": "Schwarze Civilist-Kappe, rückw."
    },
    {
      "ComponentID": 0,
      "DrawableID": 152,
      "TextureID": 7,
      "Name": "Orange Civilist-Kappe, rückw."
    }
  ]
]]
donet = {}

--[[CreateThread(function()
    Wait(100)
    obj = json.decode(obj)
    done = 0
    for i=1, #obj, 1 do
        done = done + 1
        --print("DONE: " .. done)
        MySQL.Async.execute("INSERT INTO clothingshop_clothes (category, slot, name, price, tid, draw) VALUES (@c, @s, @n, @p, @t, @d)", {['c'] = 1, ['s'] = "p-0", ['n'] = obj[i].Name, ['p'] = 2000, ['t'] = obj[i].TextureID, ['d'] = obj[i].DrawableID})
    end
end)]]

--[[CreateThread(function()
  MySQL.Async.fetchAll("SELECT * FROM clothingshop_clothes WHERE slot = @slot AND category = 1", {['slot'] = 4}, function(result)
    for i=1, #result, 1 do
      ----print(result[i].name)
      if string.find(result[i].name, "Arbeitshose") then
        --print("match - " .. result[i].name)
        MySQL.Async.execute("UPDATE clothingshop_clothes SET category = 8 WHERE id = @id", {['id'] = result[i].id})
        --MySQL.Async.execute("DELETE FROM clothingshop_clothes WHERE id = @id", {['id'] = result[i].id})
      end
    end
  end)
end)]]



function match(string, tosearch)
  if string.match(string, string) or string.match(string, string.lower(tosearch)) then
    return true
  else
    return false
  end
end

function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end