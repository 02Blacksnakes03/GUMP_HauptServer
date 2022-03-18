playMinutes = {}
playHours = {}
playNewMinutes = {}
oldVisum = {}
newVisum = {}
playerPayDay = {}
frakBalance = {}
frakNewBalance = {}
--[[ESX.StartPayCheck = function()
	function payCheck()
		local xPlayers = ESX.GetPlayers()
		--print("START PAYDAY")
		for i=1, #xPlayers, 1 do

			--print(xPlayers[i].source)
			--print(xPlayers.source)
			--print(xPlayers[i])
			--print(xPlayers)
			
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i].source)
			 playMinutes[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT playminutes FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()})
			 playHours[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT playhours FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()})
			if playMinutes[xPlayer.source] < 1 then
				if xPlayer.getJob().name ~= 'unemployed' then
					 frakBalance[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
					 playerPayDay[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT payday FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()})
					if frakBalance[xPlayer.source] >= playerPayDay[xPlayer.source] then
						 frakNewBalance[xPlayer.source] = frakBalance[xPlayer.source] - playerPayDay[xPlayer.source]
						MySQL.Sync.fetchScalar("UPDATE `jobs` SET `bank` = @bank WHERE `jobs`.`name` = @frak;", { ['@frak'] = xPlayer.getJob().name, ['@bank'] = frakNewBalance[xPlayer.source]})
						xPlayer.addAccountMoney('bank', playerPayDay[xPlayer.source])
						TriggerClientEvent('glmp_notify', xPlayer.source, 'green', 'FLEECA BANK', 'Du hast deinen PayDay erhalten. ('.. playerPayDay[xPlayer.source] ..'$)')
						MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + tonumber(playerPayDay[xPlayer.source]), ['reason'] = "PayDay"},
						function(affectedRows)
						end)
					else
						TriggerClientEvent('glmp_notify', xPlayer.source, 'green', 'FLEECA BANK', 'Du hast deinen PayDay erhalten. (+0$)')
					end	
					 
				else
					xPlayer.addAccountMoney('bank', 0)
					TriggerClientEvent('glmp_notify', xPlayer.source, 'green', 'FLEECA BANK', 'Du hast deinen PayDay erhalten. (+0$)')
					
				end
				TriggerEvent('byte_visumsystem:reward', xPlayer.source)
				MySQL.Sync.fetchScalar("UPDATE `users` SET `playminutes` = @playminutes WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@playminutes'] = 60})
				MySQL.Sync.fetchScalar("UPDATE `users` SET `playhours` = @playhours WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@playhours'] = playHours[xPlayer.source] + 1})

				TriggerEvent('byte_visumsystem:getLevel', xPlayer.source)
				
				
			else
				 playNewMinutes[xPlayer.source] = playMinutes[xPlayer.source] - 1
				MySQL.Sync.fetchScalar("UPDATE `users` SET `playminutes` = @playminutes WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@playminutes'] = playNewMinutes[xPlayer.source]})
			end
		end

	end

end]]