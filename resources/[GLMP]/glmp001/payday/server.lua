Citizen.CreateThread(function()
    Wait(2000)
    while true do 
        Citizen.Wait(60000)
        payCheck()
    end  
end)  
 

playMinutes = {}
playHours = {}
playNewMinutes = {}
oldVisum = {}
newVisum = {}
playerPayDay = {}
frakBalance = {}
frakNewBalance = {}
houseSteuer = {}
ar = {}
glmpBonus = {}
einkommen = {}
vehSteuer = {}
vehModel = {}

RegisterNetEvent('payday:setvehmodel')
AddEventHandler('payday:setvehmodel', function(plate, model)
	if vehModel[plate] == nil then
		vehModel[plate] = model
	end
end)

	function payCheck()
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do

			
			
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])  
			
			 playMinutes[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT playminutes FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()})
			 
			if playMinutes[xPlayer.source] < 1 then
				playHours[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT playhours FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()})
             houseSteuer[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT steuer FROM houses WHERE ownerId = @ident", { ['@ident'] = xPlayer.getIdentifier()}) 
             ar[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()}) 
             glmpBonus[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT bonus FROM adminranks WHERE adminRank = @ident", { ['@ident'] = ar[xPlayer.source]})  
				MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
					------print(#result) 
					vehSteuer[xPlayer.source]  = 0
					for i = 1, #result, 1 do
						TriggerClientEvent('payday:checkvehmodel', xPlayer.source, result[i].plate, result[i].vehicle)
						
						local localSteuer = MySQL.Sync.fetchScalar("SELECT steuern FROM vehicle_db WHERE model = @ident", { ['@ident'] = vehModel[result[i].plate]}) 
						if localSteuer == nil then
							localSteuer = 75  
						end  
						vehSteuer[xPlayer.source] = vehSteuer[xPlayer.source] + localSteuer
						------print(vehSteuer[xPlayer.source] .. " PLAYER CAR STEUER") 
					end  
				end)
				if xPlayer.getJob().name ~= 'unemployed' then
					 frakBalance[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
					 playerPayDay[xPlayer.source] = MySQL.Sync.fetchScalar("SELECT payday FROM users WHERE identifier = @ident", { ['@ident'] = xPlayer.getIdentifier()})
					if frakBalance[xPlayer.source] >= playerPayDay[xPlayer.source] then
						 frakNewBalance[xPlayer.source] = frakBalance[xPlayer.source] - playerPayDay[xPlayer.source]
						MySQL.Sync.fetchScalar("UPDATE `jobs` SET `bank` = @bank WHERE `jobs`.`name` = @frak;", { ['@frak'] = xPlayer.getJob().name, ['@bank'] = frakNewBalance[xPlayer.source]})
						xPlayer.addAccountMoney('bank', playerPayDay[xPlayer.source])
                        einkommen[xPlayer.source] = playerPayDay[xPlayer.source]
						--[[MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + tonumber(playerPayDay[xPlayer.source]), ['reason'] = "Einkommen"},
						function(affectedRows)
						end)]]
					else
						
                        --[[MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + 0, ['reason'] = "Einkommen"},
						function(affectedRows)
						end)]]
                        einkommen[xPlayer.source] = 0
					end	
					 
				else
					xPlayer.addAccountMoney('bank', 0)
                    einkommen[xPlayer.source] = 0
					--[[MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + 0, ['reason'] = "Einkommen"},
						function(affectedRows)
						end) ]]
					
				end 
                TriggerClientEvent('glmp_notify', xPlayer.source, 'green', 'KONTOVERÄNDERUNG', 'Du hast deinen PayDay erhalten. Schau auf deinem Konto für mehr Informationen!')
                MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + einkommen[xPlayer.source], ['reason'] = "Einkommen"},
						function(affectedRows)
						end) 
				TriggerEvent('byte_visumsystem:reward', xPlayer.source)
				MySQL.Sync.fetchScalar("UPDATE `users` SET `playminutes` = @playminutes WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@playminutes'] = 60})
				MySQL.Sync.fetchScalar("UPDATE `users` SET `playhours` = @playhours WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@playhours'] = playHours[xPlayer.source] + 1})

				TriggerEvent('byte_visumsystem:getLevel', xPlayer.source)  
				
				if xPlayer.getAccount('bank').money >= 50 then 
                    xPlayer.removeAccountMoney('bank', 50)
                    MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 - 50, ['reason'] = "Rundfunkbeitrag"},
						function(affectedRows)
						end)
                end 
                if xPlayer.getAccount('bank').money >= houseSteuer[xPlayer.source] then
                    xPlayer.removeAccountMoney('bank', houseSteuer[xPlayer.source])
                    MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 - houseSteuer[xPlayer.source], ['reason'] = "Haussteuer"},
						function(affectedRows)
						end)    
                end    
                if glmpBonus[xPlayer.source] > 0 then 
                    xPlayer.addAccountMoney('bank', glmpBonus[xPlayer.source])
                    MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + glmpBonus[xPlayer.source], ['reason'] = "GLMP Bonus"},
						function(affectedRows)
						end)   
                end 
				if vehSteuer[xPlayer.source] > 0 then
					xPlayer.removeAccountMoney('bank', vehSteuer[xPlayer.source])
                    MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',  
						{ ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 - vehSteuer[xPlayer.source], ['reason'] = "Fahrzeugsteuer"},
						function(affectedRows)
						end)   
				end 
			else
				 playNewMinutes[xPlayer.source] = playMinutes[xPlayer.source] - 1
				MySQL.Sync.fetchScalar("UPDATE `users` SET `playminutes` = @playminutes WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@playminutes'] = playNewMinutes[xPlayer.source]})
			end
		end
    end

