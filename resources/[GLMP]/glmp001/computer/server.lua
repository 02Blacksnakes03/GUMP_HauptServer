ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  

    lspdColor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = 'police'})
    fibColor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = 'fib'})
end)
dispatches = {}
ESX.RegisterServerCallback('getOpenServices', function(source, cb, frak)
    ------print(frak)
    MySQL.Async.fetchAll("SELECT * FROM dispatches WHERE fraktion = @frak AND state = @state ", {['@frak'] = frak, ['@state'] = 'open'}, function(result)
        dispatches = {}
        ------print("set dispatches")
        ld = 0
		for i = 1, #result, 1 do
            ld = ld + 1
			table.insert(dispatches, {name = result[i].name, message = result[i].message, telnr = result[i].number, posX = result[i].posX, posY = result[i].posY, sended = result[i].sended, identifier = result[i].identifier})
		end 
        Wait(500)
        ------print("loaded ".. ld .. ' dispatches')
 
		cb(dispatches) 
	end)
end)



ESX.RegisterServerCallback('getFrakServices', function(source, cb, frak)
    ------print(frak)
    MySQL.Async.fetchAll("SELECT * FROM dispatches WHERE fraktion = @frak", {['@frak'] = frak}, function(result)
        dispatches = {}
        ------print("set dispatches") 
        ld = 0
		for i = 1, #result, 1 do
            ld = ld + 1
            ac = 'Nein'
            if result[i].state == 'accepted' then
                ac = 'Ja'
            else
                ac = 'Nein'
            end
			table.insert(dispatches, {name = result[i].name, accepted = ac, message = result[i].message, telnr = result[i].number, posX = result[i].posX, posY = result[i].posY, sended = result[i].sended, identifier = result[i].identifier})
		end 
        Wait(500)
        ------print("loaded ".. ld .. ' dispatches')
 
		cb(dispatches) 
	end)
end)


ESX.RegisterServerCallback('getFrakMembers', function(source, cb, frak)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE job = @frak", {['@frak'] = frak}, function(result)
        frakMembers = {}
        frakMembersG = {}
       
		for i = 1, #result, 1 do
            if xPlayer.getJob().grade > result[i].job_grade then
                mperms = true
            else
                mperms = false
            end 
            if result[i].frak_perms_bank == 1 then
                bank = true
            end
            if result[i].frak_perms_lager == 1 then
                lager = true
            end
            if result[i].frak_perms_invite == 1 then
                invite = true
            end
            if result[i].frak_perms_manage == 1 then
                manage = true
            end
            table.insert(frakMembers, {id = result[i].identifier, name = result[i].firstname .. '_' .. result[i].lastname, rang = result[i].job_grade, title = result[i].frak_title, payday = result[i].payday, rights_bank = bank, rights_storage = lager, rights_invite = invite, rights_manage = manage})
		end 
        Wait(500)
		cb(frakMembers) 
	end)
end) 
 

RegisterServerEvent('editFraktionMember')
AddEventHandler('editFraktionMember', function(playerId, newRank, newPayDay, newFrakTitle)

    local src = source
    local xTarget = ESX.GetPlayerFromIdentifier(playerId)
    local xPlayer = ESX.GetPlayerFromId(src)
    local oldRank = MySQL.Sync.fetchScalar("SELECT job_grade FROM users WHERE identifier = @identifier", { ['@identifier'] = playerId})
    local manage = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    local xTargetName = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = playerId}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = playerId})
    local xPlayerName = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    
    if manage ~= 1 then
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Rechte, um diese Aktion durchzuführen!')
        return
    end  
    if tonumber(newRank) >= xPlayer.getJob().grade then
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Rechte um diesen Rang zu vergeben.')
        return
    end 
    if oldRank >= xPlayer.getJob().grade then
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Rechte um diese Person zu verwalten.')
        return
    end
    if xTarget ~= nil then
        xTarget.setJob(xTarget.getJob().name, newRank)
    end    
        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, xPlayerName .. ' hat den Rang von '.. xTargetName .. ' auf '.. newRank ..' gesetzt und den PayDay auf '.. newPayDay .. '$ angepasst.') 
        MySQL.Sync.execute("UPDATE `users` SET `job_grade` = @rank WHERE identifier = @playerId", {['@playerId'] = playerId, ['@rank'] = newRank, ['@payday'] = newPayDay, ['@frakTitle'] = newFrakTitle})
        MySQL.Sync.execute("UPDATE `users` SET `payday` = @payday WHERE identifier = @playerId", {['@playerId'] = playerId, ['@rank'] = newRank, ['@payday'] = newPayDay, ['@frakTitle'] = newFrakTitle})
        MySQL.Sync.execute("UPDATE `users` SET `frak_title` = @frakTitle WHERE identifier = @playerId", {['@playerId'] = playerId, ['@rank'] = newRank, ['@payday'] = newPayDay, ['@frakTitle'] = newFrakTitle})

end) 


RegisterServerEvent('kickFraktionMember')
AddEventHandler('kickFraktionMember', function(playerId, name, rank)

    local src = source
    local xTarget = ESX.GetPlayerFromIdentifier(playerId)
    local xPlayer = ESX.GetPlayerFromId(src)
   
    local manage = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    local xPlayerName = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
     
    if manage ~= 1 then
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Rechte, um diese Aktion durchzuführen!')
        return
    end  
    if rank >= xPlayer.getJob().grade then
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Rechte um diese Person zu entlassen.')
        return  
    end 
    if xTarget ~= nil then
        xTarget.setJob('unemployed', 0)
        TriggerClientEvent('glmp_singlenotify', xTarget.source, 'grey', 'Du wurdest aus der Fraktion geworfen. - '.. xPlayer.getJob().label)
         
    end 
        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, xPlayerName .. ' hat '.. name .. ' aus der Fraktion geworfen.') 
        MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '0' WHERE identifier = @identifier", { ['@identifier'] = playerId})
        MySQL.Sync.fetchScalar("UPDATE users SET job = 'unemployed' WHERE identifier = @identifier", { ['@identifier'] = playerId})
        MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = 0 WHERE identifier = @identifier", { ['@identifier'] = playerId})
        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 0 WHERE identifier = @identifier", { ['@identifier'] = playerId})
        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 0 WHERE identifier = @identifier", { ['@identifier'] = playerId})
        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 0 WHERE identifier = @identifier", { ['@identifier'] = playerId})
        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 0 WHERE identifier = @identifier", { ['@identifier'] = playerId})
        TriggerEvent('byte:sendLog', 'fraktion', "(" .. xPlayer.getJob().label .. ") Uninvite",  xPlayerName .. ' ('.. xPlayer.getName() ..') hat '.. name ..' ('.. xTarget.getName() ..') aus der Fraktion geworfen.')
end) 

ESX.RegisterServerCallback('hasFrakManagePerms', function( source, cb )
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local manage = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if manage == 1 then
        cb(true)
    else 

        cb(false)
    end
end)
vehName = {}
RegisterServerEvent('setVehicleName')
AddEventHandler('setVehicleName', function(plate, name)
    vehName[plate] = name
end) 

garageName = {}
RegisterServerEvent('computer:setGarageName')
AddEventHandler('computer:setGarageName', function(id, name)
    garageName[id] = name
end) 


ESX.RegisterServerCallback('byte:hasSpecificItem', function(source, cb, item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = xPlayer.getInventoryItem(item)
    if item.count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('getVehiclesForPlateOverview', function(source, cb, type, search)
    if plateCooldown ~= true then
        if type == "id" then
            MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE id = @ident", {['@ident'] = search}, function(result)
                vehs = {}
                
                for i = 1, #result, 1 do
                    rpname = "Fehler"
                    if result[i].owner ~= "Fraktion" then
                        rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner})
                    else
                        local label = MySQL.Sync.fetchScalar("SELECT label FROM jobs WHERE name = @identifier", { ['@identifier'] = result[i].fraktion})
                        rpname = label                
                    end  
                    
                    table.insert(vehs, {id = result[i].id, owner = rpname, officer = 'System', status = true, plate = result[i].plate})
                end  
                Wait(100)
                cb(vehs) 
            end)
        elseif type == "plate" then
            if search[2] ~= nil then 
                searching = search[1] .. ' ' .. search[2]
            else
                searching = search[1] 
            end 
            MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @ident", {['@ident'] = searching}, function(result)
                vehs = {}
                
                for i = 1, #result, 1 do
                    local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner})
                    
                    table.insert(vehs, {id = result[i].id, owner = rpname, officer = 'System', status = true, plate = result[i].plate})
                end  
                Wait(100)
                cb(vehs) 
            end) 
        end
        plateCooldown = true
        Wait(5000)
        plateCooldown = false
    else
        TriggerClientEvent('glmp_singlenotify', source, '', 'Bitte warte 5 Sekunden!')
    end
end)

ESX.RegisterServerCallback('requestVehicleData', function(source, cb, vehId)
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE id = @ident", {['@ident'] = vehId}, function(result)
        vehs = {} 
        
        for i = 1, #result, 1 do
           
            isParked = false
            ------print(result[i].stored)
            if result[i].stored == true then 
                ------print("set true")
                isParked = true 
                 
            end 
            gn = garageName[result[i].garage]
            if result[i].owner == "Fraktion" then 
                owner = result[i].fraktion .. ' (Fraktion)' 
            else
                local vehOwner = ESX.GetPlayerFromIdentifier(result[i].owner)
                if vehOwner ~= nil then
                    owner = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. ' ('.. vehOwner.getName() .. ')'
                else
                    owner = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner})

                end
            end
            local vProps = json.decode(result[i].vehicle)
            TriggerClientEvent('requestVehicleName', source, vProps.plate, vProps.model)
           Wait(100)
            local vname = vehName[vProps.plate]
            Wait(150)
            ------print("VN: ".. vname) 
            table.insert(vehs, {name = 'TEST', vehiclehash = vname, plate = result[i].plate, id = result[i].id, owner = owner, inGarage = isParked, garage = gn })
            
        cb(vehs) 
        end 
        
    end)

end)

ESX.RegisterServerCallback('requestVehiclesForSupport', function(source, cb, ownerId)
    local first, last = ownerId:match("([^_]+)_([^_]+)")   
    local ident =  MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @first AND lastname = @last", { ['@first'] = first, ['@last'] = last})
    MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @ident", {['@ident'] = ident}, function(result) 
        vehs = {}
        
        for i = 1, #result, 1 do
           
            isParked = false
            ------print(result[i].stored)
            if result[i].stored == true then 
                ------print("set true")
                isParked = true 
                 
            end 
            gn = garageName[result[i].garage]
            if result[i].owner == "Fraktion" then 
                owner = result[i].fraktion .. ' (Fraktion)' 
            else
                local vehOwner = ESX.GetPlayerFromIdentifier(result[i].owner)
                if vehOwner ~= nil then
                    owner = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = result[i].owner}) .. ' ('.. vehOwner.getName() .. ')'
                
                end
            end
            local vProps = json.decode(result[i].vehicle)
            TriggerClientEvent('requestVehicleName', source, vProps.plate, vProps.model)
           Wait(100) 
            local vname = vehName[vProps.plate]
            Wait(50)
            ------print("VN: ".. vname) 
            table.insert(vehs, {name = 'TEST', vehiclehash = vname, plate = result[i].plate, id = result[i].id, owner = owner, inGarage = isParked, garage = gn })
            
        
        end
        Wait(250)
        cb(vehs)  
        
    end)

end)

ESX.RegisterServerCallback('getVehiclesForOverview', function(source, cb, type) 
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if type == 'owned' then 
        
        MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
            vehs = {}
            
            for i = 1, #result, 1 do
                if result[i].gps == 1 then
                    gn = 'Nicht Eingeparkt'
                else
                    gn = 'kein GPS Signal...'
                end
                isParked = false
                ------print(result[i].stored)
                if result[i].stored == true then 
                    ------print("set true")
                    isParked = true 
                    if result[i].gps == 1 then
                        gn = garageName[result[i].garage]
                    end 
                end 
                local vProps = json.decode(result[i].vehicle)
                TriggerClientEvent('requestVehicleName', source, vProps.plate, vProps.model)
               Wait(100)
                local vname = vehName[vProps.plate]
                Wait(150)
                ------print("VN: ".. vname)
                table.insert(vehs, {name = 'TEST', vehiclehash = vname, plate = result[i].plate, id = result[i].plate, inGarage = isParked, garage = gn })
            end 
            Wait(100)
            cb(vehs) 
        end)
    elseif type == 'keys' then
        MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE keyowner = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
            vehs = {}
            
            for i = 1, #result, 1 do
                if result[i].gps == 1 then
                    gn = 'Nicht Eingeparkt'
                else
                    gn = 'kein GPS Signal...'
                end 
                isParked = false
                ------print(result[i].stored)
                if result[i].stored == true then 
                    ------print("set true")
                    isParked = true 
                    if result[i].gps == 1 then
                        gn = garageName[result[i].garage]
                    end 
                end 
                local vProps = json.decode(result[i].vehicle)
                TriggerClientEvent('requestVehicleName', source, vProps.plate, vProps.model)
               Wait(100)
                local vname = vehName[vProps.plate]
                Wait(150)
                ------print("VN: ".. vname)
                table.insert(vehs, {name = 'TEST', vehiclehash = vname, plate = result[i].plate, id = result[i].plate, inGarage = isParked, garage = gn })
            end 
            Wait(100)
            cb(vehs) 
        end)
    elseif type == 'fraktion' then
        MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE fraktion = @ident", {['@ident'] = xPlayer.getJob().name}, function(result)
            vehs = {} 
            
            for i = 1, #result, 1 do
                    gn = 'Nicht Eingeparkt'
                
                
                isParked = false
                ------print(result[i].stored)
                if result[i].stored == true then 
                    ------print("set true")
                    isParked = true 
                        gn = garageName[result[i].garage]
                     
                end 
                local vProps = json.decode(result[i].vehicle)
                TriggerClientEvent('requestVehicleName', source, vProps.plate, vProps.model)
               Wait(100)
                local vname = vehName[vProps.plate]
                Wait(150)
                ------print("VN: ".. vname)
                table.insert(vehs, {name = 'TEST', vehiclehash = vname, plate = result[i].plate, id = result[i].plate, inGarage = isParked, garage = gn })
            end 
            Wait(100)
            cb(vehs) 
        end)
    end
end)
ESX.RegisterServerCallback('hasPlayerHouse', function( source, cb )
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local h = MySQL.Sync.fetchScalar("SELECT id FROM houses WHERE ownerID = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if h ~= nil then
        cb(true)
    else 

        cb(false)
    end
end)

ESX.RegisterServerCallback('getOwnServices', function(source, cb)

    local src  = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll("SELECT * FROM dispatches WHERE beamter = @beamter", {['@beamter'] = xPlayer.getIdentifier()}, function(result)
        dispatches = {}
        ------print("set owne dispatches")
        ld = 0
		for i = 1, #result, 1 do
            ld = ld + 1 
            
			table.insert(dispatches, {name = result[i].name, message = result[i].message, telnr = result[i].number, posX = result[i].posX, posY = result[i].posY, sended = result[i].sended, identifier = result[i].identifier})
		end 
        Wait(500)
        ------print("loaded ".. ld .. ' dispatches')
 
		cb(dispatches)  
	end)
end)




ESX.RegisterServerCallback('akten:requestPlayerOpenCrimes', function( source, cb , name )
    local first, last = name:match("([^_]+)_([^_]+)")   
    local ident =  MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @first AND lastname = @last", { ['@first'] = first, ['@last'] = last})
    MySQL.Async.fetchAll("SELECT * FROM player_crimes WHERE player = @ident", {['@ident'] = ident}, function(result)
        crimes = {}
        ld = 0
		for i = 1, #result, 1 do
            ld = ld + 1 
            
			table.insert(crimes, {id = result[i].id, name = result[i].name, description = result[i].description})
		end 
        Wait(250)
        ------print("loaded ".. ld .. ' player crimes for '.. name)
 
		cb(crimes) 
	end)
end) 

function sendAktenMsg(msg)
    local xPlayers = ESX.GetPlayers()
    
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        
        if xPlayer.getJob().name == 'police' then
            
            TriggerClientEvent("glmp_notify", xPlayers[i], lspdColor, xPlayer.getJob().label, msg)
        end

        if xPlayer.getJob().name == 'fib' then

            TriggerClientEvent("glmp_notify", xPlayers[i], fibColor, xPlayer.getJob().label, msg)
        end
    end
end
RegisterServerEvent('akten:addPlayerWanteds')
AddEventHandler('akten:addPlayerWanteds', function(name, akten, pid)
    
    local first, last = name:match("([^_]+)_([^_]+)")
    local ident =  MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @first AND lastname = @last", { ['@first'] = first, ['@last'] = last}) 
    local aktende = json.decode(akten)
    ld = 0
    for i = 1, #aktende, 1 do
        ld = ld + 1 
       addAkteToPlayer(ident, aktende[i])
    end 
    
    local xPlayer = ESX.GetPlayerFromIdentifier(pid)
    local xIdent = xPlayer.getIdentifier() 
    local xname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xIdent}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xIdent})
    sendAktenMsg("Die Akte von ".. name .. " wurde von ".. xname .. " bearbeitet.")  
end)
   
function addAkteToPlayer(identifier, id)
    ------print("add akte ".. id .. " to ".. identifier)
    MySQL.Async.fetchAll("SELECT * FROM crime_reasons WHERE id = @ident", {['@ident'] = id}, function(result)
        for i = 1, #result, 1 do
            MySQL.Sync.fetchScalar("INSERT INTO `player_crimes` (`id`, `player`, `name`, `description`, `jailTime`, `jailCosts`) VALUES (NULL, @identifier, @name, @description, @jailTime, @jailCosts);", {['@identifier'] = identifier, ['@name'] = result[i].description, ['@description'] = result[i].name, ['@jailTime'] = result[i].jailtime, ['@jailCosts'] = result[i].costs})     
        end 
       
	end) 
    
end
ESX.RegisterServerCallback('akten:requestCrimeReasons', function( source, cb, cat )
    MySQL.Async.fetchAll("SELECT * FROM crime_reasons WHERE crime_category_id = @ident", {['@ident'] = cat}, function(result)
        crimes = {}
        ld = 0
		for i = 1, #result, 1 do
            ld = ld + 1 
            
			table.insert(crimes, {id = result[i].id, name = result[i].name, description = result[i].description, jailtime = result[i].jailtime, costs = result[i].costs})
		end 
        Wait(100)
        ------print("loaded ".. ld .. ' crime reasons ')
 
		cb(crimes)  
	end)
end)
ESX.RegisterServerCallback('akten:requestPlayerLicenses', function( source, cb , name )
    local first, last = name:match("([^_]+)_([^_]+)")   
    local ident =  MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @first AND lastname = @last", { ['@first'] = first, ['@last'] = last})
    MySQL.Async.fetchAll("SELECT * FROM user_licenses WHERE owner = @ident", {['@ident'] = ident}, function(result)
        lics = {}
        ld = 0
        drive = 0
        drive_truck = 0
        drive_bike = 0
        pbs = 0
        aca = 0
        boat = 0
        acb = 0
        waffe = 0 
		for i = 1, #result, 1 do
            ld = ld + 1 
            if result[i].type == 'drive' then
                drive = 1
            end
            if result[i].type == 'drive_truck' then
                drive_truck = 1
            end
            if result[i].type == 'drive_bike' then
                drive_bike = 1
            end
            if result[i].type == 'pbs' then
                pbs = 1
            end
            if result[i].type == 'aircraft_a' then
                aca = 1
            end
            if result[i].type == 'aircraft_b' then
                acb = 1
            end
            if result[i].type == 'boat' then
                boat = 1
            end
            if result[i].type == 'weapon' then
                waffe = 1
            end
			
		end  
        table.insert(lics, {name = "PKW Lizenz", value = drive})
        table.insert(lics, {name = "LKW Lizenz", value = drive_truck})
        table.insert(lics, {name = "Motorrad Lizenz", value = drive_bike})
        table.insert(lics, {name = "Personenbeförderungsschein", value = pbs}) 
        table.insert(lics, {name = "Flugschein A", value = aca}) 
        table.insert(lics, {name = "Flugschein B", value = acb}) 
        table.insert(lics, {name = "Bootsschein", value = boat}) 
        table.insert(lics, {name = "Waffenschein", value = boat}) 
        Wait(100)
        ------print("loaded ".. ld .. ' player licenses for '.. name) 
 
		cb(lics) 
	end)
end) 


ESX.RegisterServerCallback('akten:requestPlayerJailData', function( source, cb , name )
    local first, last = name:match("([^_]+)_([^_]+)")   
    local ident =  MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @first AND lastname = @last", { ['@first'] = first, ['@last'] = last})
    MySQL.Async.fetchAll("SELECT * FROM player_crimes WHERE player = @ident", {['@ident'] = ident}, function(result)
        crimes = {}
        ld = 0
        haft = 0
        sank = 0
		for i = 1, #result, 1 do
            ld = ld + 1 
            
			haft = haft + result[i].jailTime
            sank = sank + result[i].jailCosts

		end 
        Wait(500) 
        ------print("loaded ".. ld .. ' player crimes for '.. name)
 
		cb({time = haft, money = sank }) 
	end)
end)



RegisterServerEvent('acceptService') 
AddEventHandler('acceptService', function(name)
    local src = source 
    local identifier = MySQL.Sync.fetchScalar("SELECT identifier FROM dispatches WHERE name = @identifier", { ['@identifier'] = name})
    if identifier ~= nil then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer ~= nil then
            local xb = ESX.GetPlayerFromId(src)
            MySQL.Sync.execute("UPDATE `dispatches` SET `state` = @state WHERE name = @identifier", {['@identifier'] = name, ['@state'] = 'accepted'})
            MySQL.Sync.execute("UPDATE `dispatches` SET `beamter` = @state WHERE name = @identifier", {['@identifier'] = name, ['@state'] = xb.getIdentifier()})
            TriggerClientEvent('glmp_singlenotify',src, '', 'Du hast den Dispatch von ' .. name .. ' Angenommen.') 
            TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Dein Dispatch wurde entgegen genommen und wird nun Bearbeitet.')
        else
            MySQL.Sync.execute("DELETE FROM `dispatches` WHERE name = @identifier", {['@identifier'] = name, ['@state'] = 'closed'})
            TriggerClientEvent('glmp_singlenotify', '', name .. ' ist nicht mehr auf der Insel. Lösche Dispatch...')
        end
    else
        TriggerClientEvent('glmp_singlenotify', src,'', 'Dieser Dispatch ist nicht mehr offen.')
    end

end) 

RegisterServerEvent('finishService') 
AddEventHandler('finishService', function(name)
    local src = source
    local identifier = MySQL.Sync.fetchScalar("SELECT identifier FROM dispatches WHERE name = @identifier", { ['@identifier'] = name})
    if identifier ~= nil then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer ~= nil then 
            local xb = ESX.GetPlayerFromId(src)
            MySQL.Sync.execute("DELETE FROM `dispatches` WHERE name = @identifier", {['@identifier'] = name, ['@state'] = 'closed'})
            TriggerClientEvent('glmp_singlenotify',src, '', 'Du hast den Dispatch von ' .. name .. ' Geschlossen.') 
            TriggerClientEvent('glmp_singlenotify', xPlayer.source, '', 'Dein Dispatch wurde erfolgreich Bearbeitet und somit geschlossen.')
        else
            MySQL.Sync.execute("DELETE FROM `dispatches` WHERE name = @identifier", {['@identifier'] = name, ['@state'] = 'closed'})
            TriggerClientEvent('glmp_singlenotify', '', name .. ' ist nicht mehr auf der Insel. Lösche Dispatch...')
        end
    else 
        TriggerClientEvent('glmp_singlenotify', src,'', 'Dieser Dispatch ist nicht mehr offen.')
    end

end) 

RegisterServerEvent('markEmailAsRead')
AddEventHandler('markEmailAsRead', function(id)
    MySQL.Sync.fetchScalar("UPDATE player_emails SET readed = 1 WHERE id = @id", { ['@id'] = id})
end)

RegisterServerEvent('deleteEmail')
AddEventHandler('deleteEmail', function(id)
    MySQL.Sync.fetchScalar("DELETE FROM player_emails WHERE id = @id", { ['@id'] = id})
end)

RegisterServerEvent('akten:removePlayerCrime')
AddEventHandler('akten:removePlayerCrime', function(id)
    ------print("remove player crime ".. id)
    MySQL.Sync.fetchScalar("DELETE FROM player_crimes WHERE id = @id", { ['@id'] = id})
    
end)


RegisterServerEvent('akten:removeAllPlayerCrimes')
AddEventHandler('akten:removeAllPlayerCrimes', function(name, pid)
    ------print("remove all crimes from ".. name)
    local first, last = name:match("([^_]+)_([^_]+)")   
    local ident =  MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @first AND lastname = @last", { ['@first'] = first, ['@last'] = last})
    MySQL.Sync.fetchScalar("DELETE FROM player_crimes WHERE player = @id", { ['@id'] = ident})
    local x = ESX.GetPlayerFromIdentifier(pid)
    local xIdent = x.getIdentifier()
    local xname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xIdent}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xIdent})
    sendAktenMsg("Die Akte von ".. name .. " wurde von ".. xname .. " erlassen.") 
end)


ESX.RegisterServerCallback('requestEmails', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll("SELECT * FROM player_emails WHERE identifier = @identifier ORDER BY id", {['@identifier'] = xPlayer.getIdentifier()}, function(result)
        emails = {} 
        ld = 0
        for i = 1, #result, 1 do
            ld = ld + 1  
            table.insert(emails, {id = result[i].id, readed = result[i].readed, identifier = result[i].identifier, subject = " " .. result[i].subject, body = result[i].body})
        end 
        Wait(500)
        ------print("loaded ".. ld .. ' player mails')
 
        cb(emails) 
    end)    
end)

---
ESX.RegisterServerCallback('akten:requestPlayerResults', function(source, cb, lastname)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    players = {} 
    MySQL.Async.fetchAll("SELECT * FROM users WHERE lastname LIKE @lastname ORDER BY firstname", {['@lastname'] = lastname}, function(result)
        
        ld = 0 
        for i = 1, #result, 1 do 
            ld = ld + 1  
            table.insert(players, result[i].firstname .. '_' .. result[i].lastname)
        end 
        ------print("loaded ".. ld .. ' players')
        
        MySQL.Async.fetchAll("SELECT * FROM users WHERE firstname LIKE @lastname ORDER BY firstname", {['@lastname'] = lastname}, function(result)
            
            ld = 0 
            for i = 1, #result, 1 do 
                ld = ld + 1  
                table.insert(players, result[i].firstname .. '_' .. result[i].lastname)
            end 
            Wait(500) 
            ------print("loaded ".. ld .. ' players')
      
            cb(players) 
        end)    
    end)    
end)

ESX.RegisterServerCallback('getVehDatabaseInfo', function(source, cb, model)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    players = {}  
    MySQL.Async.fetchAll("SELECT * FROM vehicle_db WHERE model LIKE @model ORDER BY id", {['@model'] = model:upper()}, function(result)
        
        ld = 0 
        for i = 1, #result, 1 do  
            ld = ld + 1  
            table.insert(players, {model = result[i].model, tax = result[i].steuern, inv_weight = result[i].trunk_maxweight / 1000, inv_size = result[i].trunk_slots, fuel = result[i].fuel})
        end 
        ------print("loaded ".. ld .. ' veh taxs')
        Wait(500)
        cb(players)   
    end)    
end)


RegisterServerEvent('akten:savePersonData')
AddEventHandler('akten:savePersonData', function(name, adress, fraktion, phone, info)

    MySQL.Async.fetchScalar("UPDATE `player_policedata` SET adress = @adress, phone = @phone, fraktion = @fraktion, info = @info WHERE name = @name;", {['@name'] = name, ['@adress'] = adress, ['@phone'] = phone, ['@fraktion'] = fraktion, ['@info'] = info})
                
end)

ESX.RegisterServerCallback('akten:requestPlayerData', function(source, cb, name )

    MySQL.Async.fetchAll("SELECT * FROM player_policedata WHERE name = @name", {['@name'] = name}, function(result)
        playerData = {} 
        lpd = 0
        for i = 1, #result, 1 do  
            ------print(result[i].name)
              
                lpd = lpd + 1
                cb({name = result[i].name, address = result[i].adress, membership = result[i].fraktion, number = result[i].phone, info = result[i].info})
            
        end 
        if lpd == 0 then
            MySQL.Async.fetchScalar("INSERT INTO `player_policedata` (`id`, `name`, `adress`, `phone`, `fraktion`) VALUES (NULL, @name, 'Nicht Angegeben', 'Nicht Angegeben', 'Nicht Angegeben');", {['@name'] = name})
            cb({name = name, address = 'Nicht Angegeben', membership = 'Nicht Angegeben', number = 'Nicht Angegeben', info = ''})
        end
        ------print("loadded ".. lpd .. " data")
    end)   
end)
---- SUPP

ESX.RegisterServerCallback('requestAcceptedSupportTickets', function(source, cb, staff)
 
    local src  = source
    local xPlayer = ESX.GetPlayerFromId(src) 
        MySQL.Async.fetchAll("SELECT * FROM support_tickets WHERE state = @state AND staff = @staff ORDER BY id", {['@state'] = 1, ['@staff'] = staff}, function(result)
            tickets = {} 
            ld = 0
            for i = 1, #result, 1 do
                ld = ld + 1
                 
                table.insert(tickets, {creator = result[i].creatorname, text = result[i].message, id = result[i].id, created_at = result[i].created_at,  creatorid = result[i].creator_id })
            end 
            Wait(500)
            ------print("loaded ".. ld .. ' support tickets')
     
            cb(tickets) 
        end)
    
end)


ESX.RegisterServerCallback('requestOpenSupportTickets', function(source, cb)
 
    local src  = source 
    local xPlayer = ESX.GetPlayerFromId(src) 
        MySQL.Async.fetchAll("SELECT * FROM support_tickets WHERE state = @state ORDER BY id", {['@state'] = 0, ['@staff'] = staff}, function(result)
            tickets = {} 
            ld = 0
            for i = 1, #result, 1 do
                ld = ld + 1
                 
                table.insert(tickets, {creator = result[i].creatorname, text = result[i].message, id = result[i].id, created_at = result[i].created_at,  creatorid = result[i].creator_id })
            end 
            Wait(500)
            ------print("loaded ".. ld .. ' support tickets')
     
            cb(tickets) 
        end)
    
end)
