--[[local tl = {
    {
        Name = "Adel Brust (Mittig)", 
        Price = 69, 
        TattooHash = "MP_Buis_M_Neck_000",
        ZoneId = 0,
        categoryId = 1,
        collection = "mpbuisness_overlays"
        
    }, 
    {
        Name = "Mitttig Tattoo", 
        Price = 200, 
        TattoHash = "MP_Buis_M_Neck_000",
        ZoneId = 0,
        categoryId = 1,
        collection = "mpbuisness_overlays"
    }


}



RegisterServerEvent("getTattoos")
--AddEventHandler("getTattoos", function(categoryId)

ESX.RegisterServerCallback("requestTattoos", function(source, cb, categoryId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local test = {}

    for k,v in pairs(tl) do 
        if v.categoryId == categoryId then 
            ----print("found!")
            table.insert(test, {
                Name = v.Name, 
                Price = v.Price, 
                ZoneId = v.ZoneId,
                TattooHash = v.TattooHash,
                Collection = v.collection

            })
        end
    end
    ----print(json.encode(test))
    TriggerClientEvent("responseTattoos", source, json.encode(test))
    cb(json.encode(test))
end)

ESX.RegisterServerCallback("getTattos", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then 
        cb(json.encode(tl))
    end
end)]]--


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_tattooshop:requestPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

ESX.RegisterServerCallback('esx_tattooshop:purchaseTattoo', function(source, cb, tattooList, price, tattoo)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
		table.insert(tattooList, tattoo)

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		})

		TriggerClientEvent('esx:showNotification', source, _U('bought_tattoo', ESX.Math.GroupDigits(price)))
		cb(true)
	else
		local missingMoney = price - xPlayer.getMoney()
		TriggerClientEvent('esx:showNotification', source, _U('not_enough_money', ESX.Math.GroupDigits(missingMoney)))
		cb(false)
	end
end)
