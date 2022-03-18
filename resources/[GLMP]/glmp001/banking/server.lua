ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent('banking:auszahlen')
AddEventHandler('banking:auszahlen', function(money )
    -- body

	local _source = source
	local xSource = ESX.GetPlayerFromId(_source)
	
	if xSource.getAccount("bank").money >= tonumber(money) then
		xSource.removeAccountMoney('bank', tonumber(money))
		xSource.addMoney(tonumber(money)) 
		TriggerEvent('byte:sendLog', 'atm', 'Automat Auszahlung', xSource.getName() .. ' hat '.. money .. '$ ausgezahlt.')
		MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
		{ ['id'] = xSource.getIdentifier(), ['amount'] = 0 - money, ['reason'] = "ATM Auszahlung "},
		function(affectedRows)
		end)
        TriggerClientEvent('glmp_singlenotify', _source, 'green', 'Du hast '.. money .. '$ von deinem Konto abgehoben.')
	else 
		return
	end
end)

RegisterNetEvent('banking:einzahlen')
AddEventHandler('banking:einzahlen', function(money )
    -- body

	local _source = source
	local xSource = ESX.GetPlayerFromId(_source)
	
	if xSource.getMoney() >= tonumber(money) then
		xSource.removeMoney(tonumber(money))
		xSource.addAccountMoney('bank', tonumber(money))
		
		TriggerEvent('byte:sendLog', 'atm', 'Automat Einzahlung', xSource.getName() .. ' hat '.. money .. '$ eingezahlt.')
		MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
		{ ['id'] = xSource.getIdentifier(), ['amount'] = 0 + money, ['reason'] = "ATM Einzahlung "},
		function(affectedRows)
		end)
        TriggerClientEvent('glmp_singlenotify', _source, 'green', 'Du hast '.. money .. '$ auf dein Bankkonto eingezahlt.')
	else
		return
	end
end)

atmRobs = {}
RegisterServerEvent('byte:atmRob')
AddEventHandler('byte:atmRob', function(atmId)
	------print("triggered atm rob")
	------print(atmId)
	local src = source
	if atmRobs[atmId] == nil then
		atmRobs[atmId] = true
		------print("start rob") 
		TriggerClientEvent('byte:atmRob', src, atmId) 
	elseif atmRobs[atmId] == true then
		TriggerClientEvent('glmp_singlenotify', src, '', 'Dieser ATM wurde bereits geschweißt.')
		------print("robbed")
		return
	elseif atmRobs[atmId] == false then
		atmRobs[atmId] = true
		------print("start rob") 
		TriggerClientEvent('byte:atmRob', src, atmId) 
		
	end

end)

RegisterServerEvent('byte:atmRob:2')
AddEventHandler('byte:atmRob:2', function(atmId)
	local src = source
	local atm = atmId
	local xPlayer = ESX.GetPlayerFromId(src)
	local reward = math.random(750, 7500) 
	xPlayer.addAccountMoney('black_money', reward)  
	TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast einen ATM geschweißt und '.. reward .. '$ Schwarzgeld bekommen.')

	TriggerEvent('byte:sendLog', 'atm', 'Automat geschweißt', xPlayer.getName() .. ' hat einen Automat geschweißt.\n**Schwarzgeld:** '.. reward .. '$\n**ATM:** '.. atm)

end)  
atmHisData = nil
ESX.RegisterServerCallback('atm:getdata', function( source, cb )
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
        rpname = 'Name_Name'
        atmData = {}
        atmHisData = {}
        for i = 1, #result, 1 do
            MySQL.Async.fetchAll("SELECT * FROM phone_bankhistory WHERE identifier = @ident ORDER BY id ASC", {['@ident'] = xPlayer.getIdentifier()}, function(resultt)
                
                
                for i = 1, #resultt, 1 do
                    ------print(resultt[i].reason)
                    table.insert(atmHisData, { name = resultt[i].reason, value = resultt[i].amount, date = resultt[i].date })
                end  
                
            end)
            rpname = result[i].firstname .. '_' .. result[i].lastname
                table.insert(atmData, { name = rpname, money = xPlayer.getMoney(), bank = xPlayer.getAccount("bank").money, his = atmHisData }) 
            
            
        end  
        cb(atmData) 
        
    end)
end)














ESX.RegisterServerCallback('atm:getdata1', function( source, cb )
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
   
        atmData = {}
        atmHisData = {}
        
            MySQL.Async.fetchAll("SELECT * FROM phone_bankhistory WHERE identifier = @ident ORDER BY id DESC", {['@ident'] = xPlayer.getIdentifier()}, function(resultt)
                
                
                for i = 1, #resultt, 1 do
                    table.insert(atmHisData, { name = resultt[i].reason, value = resultt[i].amount, date = resultt[i].date })
                end  
                cb(atmHisData)
            end)
            
            
            
        
end)