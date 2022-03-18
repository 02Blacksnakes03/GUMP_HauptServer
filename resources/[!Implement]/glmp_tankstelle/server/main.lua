ESX = nil
literPrice = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
	literPrice = MySQL.Sync.fetchScalar("SELECT `value` FROM `settings` WHERE `id` = @type;", { ['@type'] = 1})
end)

ESX.RegisterServerCallback('glmp_tankstelle:buy', function(source, cb, change, money)
	
	local s = source 
	local x = ESX.GetPlayerFromId(s)

	if x.getMoney() >= money then
		x.removeMoney(round(money, 0))
		cb(true)
	else
		cb(false)
	end


end)

ESX.RegisterServerCallback('glmp_tankstelle:getFuel', function(source, cb, tankstelle, fuel)
	--print("Tankstelle (Trigger getFuel Tankstelle ".. tankstelle .. " mit ".. fuel .. " Liter.")
	local tankstelleFuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})

	if tankstelleFuel >= fuel then
		cb(true)
	else
		cb(false)
	end

end)

ESX.RegisterServerCallback('glmp_tankstelle:getPrice', function(source, cb, tankstelle)
	----print("Tankstelle (Trigger getFuel Tankstelle ".. tankstelle .. " mit ".. fuel .. " Liter.")
	local tankstellePrice = MySQL.Sync.fetchScalar("SELECT `price` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})

	cb(tankstellePrice)

end)

RegisterServerEvent('byte_tankstelle:addMoney')
AddEventHandler('byte_tankstelle:addMoney', function(tankstelle, amount)
	if amount > 0 then
		local oldBank = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
		local newBank = oldBank + amount
		MySQL.Sync.fetchScalar("UPDATE `tankstelle` SET `bank` = @newbank WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle, ['@newbank'] = newBank})
		TriggerEvent('byte:sendLog', 'tankstelle_dev', '(Tankstelle '.. tankstelle .. ') Geld entfernt', 'Es wurden '.. amount .. '$ hinzugefügt.')
	end
end)

RegisterServerEvent('byte_tankstelle:removeMoney')
AddEventHandler('byte_tankstelle:removeMoney', function(tankstelle, amount)
	if amount > 0 then
		local oldBank = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
		local newBank = oldBank - amount
		MySQL.Sync.fetchScalar("UPDATE `tankstelle` SET `bank` = @newbank WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle, ['@newbank'] = newBank})
		TriggerEvent('byte:sendLog', 'tankstelle_dev', '(Tankstelle '.. tankstelle .. ') Geld entfernt', 'Es wurden '.. amount .. '$ entfernt.')
	end
end)

RegisterServerEvent('byte_tankstelle:removeFuel')
AddEventHandler('byte_tankstelle:removeFuel', function(tankstelle, amount)
	if amount > 0 then
		local oldFuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
		local newFuel = oldFuel - amount
		MySQL.Sync.fetchScalar("UPDATE `tankstelle` SET `fuel` = @newfuel WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle, ['@newfuel'] = newFuel})
		TriggerEvent('byte:sendLog', 'tankstelle_dev', '(Tankstelle '.. tankstelle .. ') Benzin entfernt', 'Es wurden '.. amount .. ' Liter benzin entfernt.')
	end
end)


RegisterServerEvent('byte_tankstelle:addFuel')
AddEventHandler('byte_tankstelle:addFuel', function(tankstelle, amount)
	if amount > 0 then
		local oldFuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
		local newFuel = oldFuel + amount
		MySQL.Sync.fetchScalar("UPDATE `tankstelle` SET `fuel` = @newfuel WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle, ['@newfuel'] = newFuel})
		TriggerEvent('byte:sendLog', 'tankstelle_dev', '(Tankstelle '.. tankstelle .. ') Benzin hinzugefügt', 'Es wurden '.. amount .. ' Liter benzin hinzugefügt.')

	end
end)


RegisterServerEvent('byte_tankstelle:setPrice')
AddEventHandler('byte_tankstelle:setPrice', function(tankstelle, amount)
	if amount > 0 then
		MySQL.Sync.fetchScalar("UPDATE `tankstelle` SET `price` = @price WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle, ['@price'] = amount})
		TriggerEvent('byte:sendLog', 'tankstelle', '(Tankstelle '.. tankstelle .. ') Preis angepasst', 'Der Preis wurde auf '.. amount .. '$ angepasst.')
	end
end)

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
  end


permlevel = {}
function getAdminLevel(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    if permlevel[source] == nil then
        local adminRank = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        permlevel[source] = MySQL.Sync.fetchScalar("SELECT permission_level FROM adminRanks WHERE adminRank = @adminRank", { ['@adminRank'] = adminRank})
        --print("set permlevel")
    end   
end

RegisterCommand('settankstelle', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] > 99 then
		if args[1] ~= nil then
			local xTarget = ESX.GetPlayerFromId(args[1])
			MySQL.Sync.fetchScalar("UPDATE `tankstelle` SET `owner` = @owner WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = args[2], ['@owner'] = xTarget.getIdentifier()})
			TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Du bist nun Besitzer der Tankstelle ".. args[2])
			TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Der Spieler ".. xTarget.getName().. ' ist nun Besitzer der Tankstelle '.. args[2])
			TriggerEvent('byte:sendLog', 'admin', '(Tankstellen) Owner Rechte', xPlayer.getName() .. " hat ".. xTarget.getName() .. " die Tankstelle ".. args[2] .. " gesetzt.")
			TriggerEvent('byte:sendLog', 'tankstelle', '(ADMIN) Owner Rechte', xPlayer.getName() .. " hat ".. xTarget.getName() .. " die Tankstelle ".. args[2] .. " gesetzt.")
		end
	end
end) 

RegisterCommand('setliterprice', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
	getAdminLevel(source)
    if permlevel[source] > 99 then
		MySQL.Sync.fetchScalar("UPDATE `settings` SET `value` = @value WHERE `type` = @type;", { ['@value'] = args[1], ['@type'] = 'literPrice'})
		literPrice = MySQL.Sync.fetchScalar("SELECT `value` FROM `settings` WHERE `type` = @type;", { ['@type'] = 'literPrice'})
		TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Der Benzin Preis zum Nachfüllen der Tankstellen, wurde auf ".. args[1] .. "$ gesetzt.")
		TriggerEvent('byte:sendLog', 'tankstelle', '(ADMIN) Benzin Preis angepasst', xPlayer.getName() .. ' hat den Benzinpreis auf '.. args[1] .. '$ angepasst.')
		TriggerEvent('byte:sendLog', 'admin', '(Tankstellen) Benzin Preis angepasst', xPlayer.getName() .. ' hat den Benzinpreis auf '.. args[1] .. '$ angepasst.')

	end
end)

ESX.RegisterServerCallback('glmp_tankstelle:getLiterPrice', function(source, cb)
	cb(literPrice)
end)



RegisterCommand('checktankstelle', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] > 99 then
		if args[1] ~= nil then
			local tankstelle = args[1]
			local fuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
			local money = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
			local price = MySQL.Sync.fetchScalar("SELECT `price` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
			local o1 = MySQL.Sync.fetchScalar("SELECT `owner` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})

			if o1 == 'STAAT' then
				local bes = 'Kein Besitzer (STAAT)'
				TriggerClientEvent("glmp_notify", source, 'red', '(ADMIN) Tankstelle '.. tankstelle, 'Besitzer: '.. bes ..' - Preis pro Liter: '.. price ..'$ - Verfügbare Liter: '.. fuel ..' - Guthaben: '.. money .. '$')
			else
				local bes = MySQL.Sync.fetchScalar("SELECT name FROM users WHERE identifier = @identifier", { ['@identifier'] = o1})
				TriggerClientEvent("glmp_notify", source, 'red', '(ADMIN) Tankstelle '.. tankstelle, 'Besitzer: '.. bes ..' - Preis pro Liter: '.. price ..'$ - Verfügbare Liter: '.. fuel ..' - Guthaben: '.. money .. '$')
			end
			
		end
	end
end)

ESX.RegisterServerCallback('glmp_tankstelle:getInfos', function(source, cb, tankstelle)
	local fuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
	local money = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
	local price = MySQL.Sync.fetchScalar("SELECT `price` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
	local data = {
		fuel  = fuel,
		money = money,
		price = price
	}
	cb(data) 
end)

ESX.RegisterServerCallback('glmp_tankstelle:getPrice', function(source, cb, tankstelle)
	local price = MySQL.Sync.fetchScalar("SELECT `price` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
	cb(price) 
end)
 
ESX.RegisterServerCallback('glmp_tankstelle:refill', function(source, cb, tankstelle, liter)
	local xPlayer = ESX.GetPlayerFromId(source)
	if tonumber(liter) > 49 then
		local fuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
		if tonumber(liter) + fuel < 4001 then
			if xPlayer.getMoney() >= tonumber(liter) * literPrice then
				TriggerEvent('byte_tankstelle:addFuel', tankstelle, tonumber(liter))
				xPlayer.removeMoney(tonumber(liter) * literPrice)
				TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du hast '.. liter ..' Liter für '.. tonumber(liter) * literPrice ..'$ deiner Tankstelle hinzugefügt. ('.. literPrice ..'$ / Liter)')
				TriggerEvent('byte:sendLog', 'tankstelle', '(Tankstelle '.. tankstelle .. ') Benzin nachgefüllt', xPlayer.getName() .. ' hat ' .. liter .. ' Liter für '.. tonumber(liter) * literPrice ..'$ nachgefüllt. ('.. literPrice ..'$ / Liter)' )
			else
				TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du hast nicht genug Geld dabei. Du benötigst '.. tonumber(liter) * literPrice ..'$ ('.. literPrice ..'$ / Liter)')
			end
		else
			TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Deine Tankstelle kann maximal 4000 Liter lagern.')
		end
	else
		TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du musst mindestens 50 Liter nachfüllen. ('.. literPrice ..'$ / Liter)')
	end
end) 

ESX.RegisterServerCallback('glmp_tankstelle:cashout', function(source, cb, tankstelle, amount)  
		local xPlayer = ESX.GetPlayerFromId(source)
		local money = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
		if money >= tonumber(amount) then
			TriggerEvent('byte_tankstelle:removeMoney', tankstelle, tonumber(amount))
			xPlayer.addMoney(amount) 
			TriggerClientEvent("glmp_notify", source, 'blue', 'Tankstelle '.. tankstelle, 'Du hast '.. amount ..'$ Abgehoben')
			TriggerEvent('byte:sendLog', 'tankstelle', '(Tankstelle '.. tankstelle .. ') Geld Ausgezahlt', xPlayer.getName() .. ' hat '.. amount .. '$ abgehoben.')
		else
			TriggerClientEvent("glmp_singlenotify", source, 'grey', 'So viel Geld hat deine Tankstelle nicht.')
		end

end)
 


ESX.RegisterServerCallback('glmp_tankstelle:cashin', function(source, cb, tankstelle, amount)  
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= tonumber(amount) then
		TriggerEvent('byte_tankstelle:addMoney', tankstelle, tonumber(amount))
		xPlayer.removeMoney(amount)  
		TriggerClientEvent("glmp_notify", source, 'blue', 'Tankstelle '.. tankstelle, 'Du hast '.. amount ..'$ Eingezahlt')
		TriggerEvent('byte:sendLog', 'tankstelle', '(Tankstelle '.. tankstelle .. ') Geld Ausgezahlt', xPlayer.getName() .. ' hat '.. amount .. '$ ausgezahlt.')
	else
		TriggerClientEvent("glmp_singlenotify", source, 'grey', 'So viel Geld hast du nicht dabei.')
	end

end)

RegisterCommand('tankstelle', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local tankstelle = MySQL.Sync.fetchScalar("SELECT `tankstelle` FROM `tankstelle` WHERE `owner` = @owner;", { ['@owner'] = xPlayer.getIdentifier()})
	--print("[".. xPlayer.getIdentifier() .."] Triggered Tankstell Command (MENU) with Tankstelle " .. tankstelle)
	TriggerClientEvent('glmp_tankstelle:openMenu', source, tankstelle)
end)
RegisterCommand('tankstelle1', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local tankstelle = MySQL.Sync.fetchScalar("SELECT `tankstelle` FROM `tankstelle` WHERE `owner` = @owner;", { ['@owner'] = xPlayer.getIdentifier()})
	--print("[".. xPlayer.getIdentifier() .."] Triggered Tankstell Command with Tankstelle " .. tankstelle)
	if tankstelle ~= nil then
		if args[1] == nil then
			local fuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
			local money = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
			local price = MySQL.Sync.fetchScalar("SELECT `price` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
			TriggerClientEvent("glmp_notify", source, 'blue', 'Tankstelle '.. tankstelle, 'Verfügbare Liter: '.. fuel ..' - Preis pro Liter: '.. price ..'$ - Guthaben: '.. money .. '$')
		elseif args[1] == 'cashout' then
			if args[2] ~= nil then
				local money = MySQL.Sync.fetchScalar("SELECT `bank` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
				if money >= tonumber(args[2]) then
					TriggerEvent('byte_tankstelle:removeMoney', tankstelle, tonumber(args[2]))
					xPlayer.addMoney(args[2])
					TriggerClientEvent("glmp_notify", source, 'blue', 'Tankstelle '.. tankstelle, 'Du hast '.. args[2] ..'$ Abgehoben')
				else
					TriggerClientEvent("glmp_singlenotify", source, 'grey', 'So viel Geld hat deine Tankstelle nicht.')
				end
			else
				TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Bitte gebe eine Summe an.')
			end
		elseif args[1] == 'setprice' then
			if args[2] ~= nil then
				if tonumber(args[2]) >= 30 then
					if tonumber(args[2]) > 250 then
						TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Bitte gebe einen Preis an. (Maximal 250$)')
					else
						TriggerEvent('byte_tankstelle:setPrice', tankstelle, tonumber(args[2]))
						TriggerClientEvent("glmp_notify", source, 'blue', 'Tankstelle ' .. tankstelle,  'Der Preis wurde auf '.. args[2] .. '$ Angepasst.')
					end
				else
					TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Bitte gebe einen Preis an. (Mindestens 30$)')
				end 
			else
				TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Bitte gebe einen Preis an.')
			end 
		elseif args[1] == 'refill' then
			if args[2] ~= nil then
				if tonumber(args[2]) > 49 then
					local fuel = MySQL.Sync.fetchScalar("SELECT `fuel` FROM `tankstelle` WHERE `tankstelle` = @tankstelle;", { ['@tankstelle'] = tankstelle})
					if tonumber(args[2]) + fuel < 4001 then
						if xPlayer.getMoney() >= tonumber(args[2]) * literPrice then
							TriggerEvent('byte_tankstelle:addFuel', tankstelle, tonumber(args[2]))
							xPlayer.removeMoney(tonumber(args[2]) * literPrice)
							TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du hast '.. args[2] ..' Liter für '.. tonumber(args[2]) * literPrice ..'$ deiner Tankstelle hinzugefügt. ('.. literPrice ..'$ / Liter)')
						else
							TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du hast nicht genug Geld dabei. Du benötigst '.. tonumber(args[2]) * literPrice ..'$ ('.. literPrice ..'$ / Liter)')
						end
					else
						TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Deine Tankstelle kann maximal 4000 Liter lagern.')
					end
				else
					TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du musst mindestens 50 Liter nachfüllen. ('.. literPrice ..'$ / Liter)')
				end
			else
				TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Bitte gebe eine Liter Anzahl an. ('.. literPrice ..'$ / Liter)')
			end
		else
			TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Falsche Angaben')
		end
		
	else
		TriggerClientEvent("glmp_singlenotify", source, 'grey', 'Du hast keine Tankstelle.')
	end
end)