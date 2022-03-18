ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)





function SetFirstName(identifier, firstName)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= firstName
	})
end

function SetLastName(identifier, lastName)
	MySQL.Async.execute('UPDATE `users` SET `lastname` = @lastname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@lastname']		= lastName
	})
end


RegisterServerEvent('byte:requestChangeName')
AddEventHandler('byte:requestChangeName', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer.getMoney() >= 1000000 then
		TriggerClientEvent('byte:openChangeName', src)
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Geld dabei!')
	end
end)

RegisterServerEvent('byte:changePlayerName')
AddEventHandler('byte:changePlayerName', function(name)
	local src = source
	local first, last = name:match("([^_]+)_([^_]+)")
	if first ~= nil then
		if last ~= nil then
			local exists = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })

			------print(first)
			------print(last)
			------print(exists) 
			if exists == nil then
				------print("ex is nil")
				local xPlayer = ESX.GetPlayerFromId(src)
				xPlayer.removeMoney(1000000) 
				MySQL.Sync.fetchScalar("UPDATE users SET firstname = @firstname WHERE identifier = @ident", { ["@firstname"] = first, ["@ident"] = xPlayer.getIdentifier() })
				MySQL.Sync.fetchScalar("UPDATE users SET lastname = @firstname WHERE identifier = @ident", { ["@firstname"] = last, ["@ident"] = xPlayer.getIdentifier() })
				TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst 1.000.000$')
				xPlayer.kick('Dein Name wurde zu '.. first .. '_'.. last .. ' geändert!')
				
			else
				TriggerClientEvent('glmp_singlenotify', src, '', 'Dieser Name ist bereits vergeben!')
			end
		else
			TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte gebe ein Gültiges Format an (Vorname_Nachname)!')
		end
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte gebe ein Gültiges Format an (Vorname_Nachname)!')
	end
end)

RegisterServerEvent('byte:changePlayerNameRegister')
AddEventHandler('byte:changePlayerNameRegister', function(name)
	local src = source
	local first, last = name:match("([^_]+)_([^_]+)")
	if first ~= nil then
		if last ~= nil then
			local exists = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
 
			------print(first)  
			------print(last)
			------print(exists) 
			if exists == nil then
				------print("ex is nil")
				local xPlayer = ESX.GetPlayerFromId(src)
			
				MySQL.Sync.fetchScalar("UPDATE users SET firstname = @firstname WHERE identifier = @ident", { ["@firstname"] = first, ["@ident"] = xPlayer.getIdentifier() })
				MySQL.Sync.fetchScalar("UPDATE users SET lastname = @firstname WHERE identifier = @ident", { ["@firstname"] = last, ["@ident"] = xPlayer.getIdentifier() })


				TriggerClientEvent('glmp_singlenotify', src, 'green', 'Dein Name ist nun '.. name)
				TriggerClientEvent('identity:openGebMenu', src)
			else
				TriggerClientEvent('glmp_singlenotify', src, '', 'Dieser Name ist bereits vergeben!')
				TriggerClientEvent('identity:openNameMenu', src)
			end
		else
			TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte gebe ein Gültiges Format an (Vorname_Nachname)!')
			TriggerClientEvent('identity:openNameMenu', src)
		end
	else
		TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte gebe ein Gültiges Format an (Vorname_Nachname)!')
		TriggerClientEvent('identity:openNameMenu', src)
	end
end)

RegisterServerEvent('byte:changePlayerGebRegister')
AddEventHandler('byte:changePlayerGebRegister', function(name)
	
				    
				local xPlayer = ESX.GetPlayerFromId(src)
			
				MySQL.Sync.fetchScalar("UPDATE users SET birthday = @firstname WHERE identifier = @ident", { ["@firstname"] = name, ["@ident"] = xPlayer.getIdentifier() })


				TriggerClientEvent('glmp_singlenotify', src, 'green', 'Dein Geburtsdatum ist am '.. name)
				--TriggerClientEvent('esx_skin:openSaveableMenu', src)
			
end)