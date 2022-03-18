local ESX = nil
visumLevel = nil 
visumReward = nil
  
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

function getVisumLevel(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = xPlayer.getIdentifier()
    local playTime = MySQL.Sync.fetchScalar("SELECT playhours FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local level = MySQL.Sync.fetchScalar("SELECT level FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    
    ------print("VISU: " .. playTime)

    if playTime < 1 then
        visumLevel = 0
    elseif playTime > 179 then
        visumLevel = 10
    elseif playTime > 143 then
        visumLevel = 9
    elseif playTime > 111 then
        visumLevel = 8
    elseif playTime > 83  then
        visumLevel = 7
    elseif playTime > 59 then
        visumLevel = 6
    elseif playTime > 39 then
        visumLevel = 5
    elseif playTime > 23 then
        visumLevel = 4
    elseif playTime > 11  then
        visumLevel = 3
    elseif playTime > 3  then
        visumLevel = 2
    elseif playTime > 0 then
        visumLevel = 1
    end
    MySQL.Sync.fetchScalar("UPDATE `users` SET `level` = @visumLevel WHERE `users`.`identifier` = @ident;", { ['@ident'] = xPlayer.getIdentifier(), ['@visumLevel'] = visumLevel})
    local levelNew = MySQL.Sync.fetchScalar("SELECT level FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    if levelNew > level then 
					
		TriggerClientEvent('glmp_notify', source, 'yellow', 'LEVEL', 'Du bist nun Level '.. levelNew)
		TriggerClientEvent('glmp_singlenotify', source, '', 'Herzlichen Glückwunsch! Du bist um ein Level aufgestiegen.')
	end
   -- TriggerClientEvent('glmp_notify', source, 'orange', 'LOS SANTOS', 'Du hast Visum-Stufe '.. visumLevel .. ' .')

end

RegisterServerEvent('byte_visumsystem:getLevel')
AddEventHandler('byte_visumsystem:getLevel', function(source)
    getVisumLevel(source)
end)
 
ESX.RegisterServerCallback("byte_visumsystem:getLevel", function(source, cb)
    getVisumLevel(source) 
    cb(visumLevel)
end)



--RegisterCommand('Reward', function(source)
--  TriggerEvent('byte_visumsystem:reward', source)
--end)

RegisterServerEvent('byte_visumsystem:reward')
AddEventHandler('byte_visumsystem:reward', function (source)

    getVisumLevel(source)
    
    if visumLevel > 0 then 
        if visumLevel >= 50 then
            visumReward = 7350
        elseif visumLevel >= 49 then
            visumReward = 7200
        elseif visumLevel >= 48 then
            visumReward = 7050
        elseif visumLevel >= 47 then
            visumReward = 6900
        elseif visumLevel >= 46 then
            visumReward = 6750
        elseif visumLevel >= 45 then
            visumReward = 6600
        elseif visumLevel >= 44 then
            visumReward = 6450
        elseif visumLevel >= 43 then
            visumReward = 6300
        elseif visumLevel >= 42 then
            visumReward =  6150
        elseif visumLevel >= 41 then
            visumReward =   6000
        elseif visumLevel >= 40 then
            visumReward =  5850
        elseif visumLevel >= 39 then
            visumReward =  5700
        elseif visumLevel >= 38 then
            visumReward =  5500
        elseif visumLevel >= 37 then
            visumReward =  5400
        elseif visumLevel >= 36 then
            visumReward =  5250
        elseif visumLevel >= 35 then
            visumReward =  5100
        elseif visumLevel >= 34 then
            visumReward =  4950
        elseif visumLevel >= 33 then
            visumReward =  4800
        elseif visumLevel >= 32 then
            visumReward =  4650
        elseif visumLevel >= 31 then
            visumReward =  4500
        elseif visumLevel >= 30 then
            visumReward =  4350
        elseif visumLevel >= 29 then
            visumReward =  4200
        elseif visumLevel >= 28 then
            visumReward =  4050
        elseif visumLevel >= 27 then
            visumReward =  3900
        elseif visumLevel >= 26 then
            visumReward =  3750
        elseif visumLevel >= 25 then
            visumReward =  3600
        elseif visumLevel >= 24 then
            visumReward =  3450
        elseif visumLevel >= 23 then
            visumReward =  3300
        elseif visumLevel >= 22 then
            visumReward =  3150
        elseif visumLevel >= 21 then
            visumReward =  3000
        elseif visumLevel >= 20 then
            visumReward =  2850
        elseif visumLevel >= 19 then
            visumReward =  2700
        elseif visumLevel >= 18 then
            visumReward =  2550
        elseif visumLevel >= 17 then
            visumReward =  2400
        elseif visumLevel >= 16 then
            visumReward =  2250
        elseif visumLevel >= 15 then
            visumReward =  2100
        elseif visumLevel >= 14 then
            visumReward =  1950
        elseif visumLevel >= 13 then
            visumReward =  1800
        elseif visumLevel >= 12 then
            visumReward =  1650
        elseif visumLevel >= 11 then
            visumReward =  1500
        elseif visumLevel >= 10 then
            visumReward =  1350
        elseif visumLevel >= 9 then
            visumReward =  1200
        elseif visumLevel >= 8 then
            visumReward =  1050
        elseif visumLevel >= 7 then
            visumReward =  900
        elseif visumLevel >= 6 then
            visumReward =  750
        elseif visumLevel >= 5 then
            visumReward =  600
        elseif visumLevel >= 4 then 
            visumReward =  450
        elseif visumLevel >= 3 then
            visumReward =  300
        elseif visumLevel >= 2 then
            visumReward =  150
        elseif visumLevel >= 1 then
            visumReward =  125
        end

        if visumReward > 0 then
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            local identifier = xPlayer.getIdentifier() 
            xPlayer.addAccountMoney('bank', visumReward)
            MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
            { ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 + tonumber(visumReward), ['reason'] = "Sozialbonus"},
            function(affectedRows)
            end)
        end 
    end
    
end)

