local ESX = nil
local visible = false
scriptVersion = '1.0-BETA'
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)
local aduty = false




--- DISCORD LOGS ---

function sendLog(hook, title, msg)
    TriggerEvent('byte:sendLog', hook, title, msg)
end
permlevel = {}
adminRank = {}
function getAdminLevel(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    if permlevel[source] == nil then
        local admin = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        adminRank[source] = admin
        permlevel[source] = MySQL.Sync.fetchScalar("SELECT permission_level FROM adminRanks WHERE adminRank = @adminRank", { ['@adminRank'] = admin})
        ------print("set permlevel")
    end   
end


RegisterServerEvent('byte:adminLog')
AddEventHandler('byte:adminLog', function(title, message)
    TriggerEvent('byte:sendLog', 'admin', title, message)
end)

RegisterServerEvent('bringplayertome')
AddEventHandler('bringplayertome', function(target,x,y,z)
    TriggerClientEvent('teleport', target, x, y, z)
end)



ESX.RegisterServerCallback('byte:getTickets', function(source, cb)
    cb(MySQL.Sync.fetchScalar("SELECT * FROM support_tickets"))
end)

 
ESX.RegisterServerCallback('byte:getVehId', function(source, cb, plate)
    ----print(plate)
     local id = MySQL.Sync.fetchScalar("SELECT id FROM owned_vehicles WHERE plate = @identifier", { ['@identifier'] = plate})
     ----print(id) 
     cb(id)
end)

ESX.RegisterServerCallback('byte:getFrakVehId', function(source, cb, plate)
    local id = MySQL.Sync.fetchScalar("SELECT id FROM frak_vehicles WHERE plate = @identifier", { ['@identifier'] = plate})
    cb(id)
end)  

ESX.RegisterServerCallback('byte:getAdminLevel', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source) 
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    cb(permlevel[source])
end)

adminRank = {}
ESX.RegisterServerCallback('byte:getAdminRank', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    
    if adminRank[source] == nil then
        adminRank[source] = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        ------print("set admin rank for player ".. source)
    end
    cb(adminRank[source])
end)

outfit = {}
ESX.RegisterServerCallback('byte:getAdminOutfit', function(source, cb, rang)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local rank = rang
    if outfit[rank] == nil then
        outfit[rank] = MySQL.Sync.fetchScalar("SELECT clothesID FROM adminRanks WHERE adminRank = @adminRank", { ['@adminRank'] = rank})
        cb(outfit[rank])
    else
        cb(outfit[rank])
    end
end)



ESX.RegisterServerCallback('byte:getPlayerName', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    cb(xPlayer.getName())
end)

ESX.RegisterServerCallback('byte:getPlayerName2', function(source, cb, sid)
    local xPlayer = ESX.GetPlayerFromId(sid)
    local identifier = xPlayer.getIdentifier()
    cb(xPlayer.getName())
end)





RegisterServerEvent('notifyother')
AddEventHandler('notifyother', function(target, color, title, msg)
    TriggerClientEvent('glmp_notify', target, color, title, msg)
end)




RegisterServerEvent('byte:notifyother')
AddEventHandler('byte:notifyother', function(target, title, color, text)
    TriggerClientEvent('glmp_notify', target, title, color, text)
end)





RegisterCommand('broadcast', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 96 then
        if admindienst[source] == true then
            local modname = GetPlayerName(source)
            local xPlayers = ESX.GetPlayers()
            local argString = table.concat(args, " ")   
            --TriggerClientEvent('byte_broadcast:show', -1, argString, 'yellow', 'glob')
            TriggerClientEvent('sendGlobalNotification', -1, argString, "#d9a30f", "glob", 10000, "red")
            sendLog('admin', 'Befehl "/broadcast"', '**' .. modname .. '** hat eine Announce gesendet. ( ' .. argString .. ' )')
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end

end)

RegisterCommand('askin', function( source, args )
    ----print("askin")
	local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(src)
    if permlevel[src] >= 98 then
        if args[1] == nil then
	        TriggerClientEvent('esx_skin:openSaveableMenu', src)
        else 
            local xT = ESX.GetPlayerFromId(tonumber(args[1]))
            if xT ~= nil then
	            TriggerClientEvent('esx_skin:openSaveableMenu', args[1])
            else
                TriggerClientEvent('esx_skin:openSaveableMenu', src)
            end
        end
    end

end)

RegisterCommand('clearads', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(src)
    if permlevel[src] >= 96 then
        if admindienst[src] == true then
            local modname = GetPlayerName(src)
            TriggerEvent('clearLifeInvaderApp_requestAd')
            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Du hast die Lifeinvader Anzeigen geleert.')
            sendLog('admin', 'Befehl "/clearads"', '**' .. modname .. '** hat die Lifeinvader Anzeigen geleert.')
        else
            TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dazu hast du keine Rechte.")
    end

end)

RegisterCommand('afkcheck', function( source, args )
    local src = source
    getAdminLevel(src)
    if permlevel[src] >= 95 then
        if admindienst[source] == true then
            local xPlayer = ESX.GetPlayerFromId(source)
            
            if args[1] ~= nil then
                local xTarget = ESX.GetPlayerFromId(args[1])
                if xTarget ~= nil then
                    TriggerClientEvent('sendAfkCheck', args[1])
                    ------print("try to trigger client event for ".. args[1])
                -- TriggerClientEvent('glmp_notify', source, 'red', 'ADMIN', 'Du hast dem Spieler '.. xTarget.GetName() .. ' einen AFK Check gesendet.')
                    --TriggerEvent('byte:sendLog', 'admin', 'AFK CHECK', adminRank[source] .. ' ' .. xPlayer.GetName() .. ' hat dem Spieler ' .. xTarget.GetName() .. ' einen AFK Check gesendet.')
                else
                    TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist nicht online.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Bitte gebe eine Spieler-ID an.')
            end
        end
    end
end)

RegisterCommand('cleartaxis', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(src)
    if permlevel[src] >= 96 then
        if admindienst[src] == true then
            local modname = GetPlayerName(src)
            MySQL.Sync.fetchScalar("TRUNCATE TABLE `phone_taxis`")
            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Du hast die Taxiliste geleert.')
            sendLog('admin', 'Befehl "/cleartaxis"', '**' .. modname .. '** hat die Taxiliste geleert.')
        else
            TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dazu hast du keine Rechte.")
    end

end)

RegisterCommand('cleardispatches', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(src)
    if permlevel[src] >= 96 then
        if admindienst[src] == true then
            local modname = GetPlayerName(src)
            MySQL.Sync.fetchScalar("TRUNCATE TABLE `dispatches`")
            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Du hast die Dispatches geleert.')
            sendLog('admin', 'Befehl "/cleardispatches"', '**' .. modname .. '** hat die Dispatches geleert.')
        else
            TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dazu hast du keine Rechte.")
    end

end)

RegisterCommand('cleartickets', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(src)
    if permlevel[src] >= 97 then
        if admindienst[src] == true then
            local modname = GetPlayerName(src)
            MySQL.Sync.fetchScalar("TRUNCATE TABLE `support_tickets`")
            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Du hast die Support Tickets geleert.')
            TriggerClientEvent('sendGlobalNotification', -1, 'Aus Internen Gründen, wurden alle Support Tickets geschlossen! Wir bitten darum, aktuelle Tickets neu zu erstellen.', "red", "dev", 20000, "red")
           
            sendLog('admin', 'Befehl "/cleartickets"', '**' .. modname .. '** hat die Support Tickets geleert.')
        else
            TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dazu hast du keine Rechte.")
    end

end)
   
RegisterCommand('clearnews', function(source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(src)
    if permlevel[src] >= 97 then
        if admindienst[src] == true then
            local modname = GetPlayerName(src)
            MySQL.Sync.fetchScalar("TRUNCATE TABLE `".. args[1] .."`") 
            TriggerClientEvent('glmp_notify', src, 'red', 'ADMIN', 'Du hast die Weazle News Anzeigen geleert.')
            --TriggerClientEvent('sendGlobalNotification', -1, 'Aus Internen Gründen, wurden alle Support Tickets geschlossen! Wir bitten darum, aktuelle Tickets neu zu erstellen.', "red", "dev", 20000, "red")
            TriggerEvent('requestNewsUpdate')
            sendLog('admin', 'Befehl "/clearnews"', '**' .. modname .. '** hat die Weazle News geleert.')
        else
            TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dazu hast du keine Rechte.")
    end

end)


RegisterCommand('redbroadcast', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 98 then
        if admindienst[source] == true then
            local modname = GetPlayerName(source)
            local xPlayers = ESX.GetPlayers()
            local argString = table.concat(args, " ")   
            sendLog('admin', 'Befehl "/redbroadcast"', '**' .. modname .. '** hat ein Announce gesendet. ( ' .. argString .. ' )')
            TriggerClientEvent('sendGlobalNotification', -1, argString, "red", "glob", 10000, "red")
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end

end)

RegisterServerEvent('support:tp')
AddEventHandler('support:tp', function(tid)
    local src = source
    if admindienst[src] == true then
        local xTarget = ESX.GetPlayerFromId(tid)
        local xPlayer = ESX.GetPlayerFromId(src) 
        if xTarget ~= nil then
            local src = source
            TriggerClientEvent('byte:checkTpPlayer', tid, src)
            TriggerEvent('byte:sendLog', 'admin', 'Befehl "/stp"', adminRank[src].. ' hat sich zu '.. xTarget.getName() .. ' Teleportiert!')
            TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Du hast dich zu ".. xTarget.getName().. " Teleportiert!")
            TriggerClientEvent('glmp_notify', xTarget.source, "red", "ADMIN", adminRank[source].. ' ' .. xPlayer.getName() .. ' hat sich zu dir Teleportiert!')
        else  
            TriggerClientEvent('glmp_singlenotify', src, "red", "Der Spieler ist nicht online!")
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
    end
end)
RegisterCommand('stp', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 96 then
        if admindienst[source] == true then
            local xTarget = ESX.GetPlayerFromId(args[1])
            if xTarget ~= nil then
                local src = source
                TriggerClientEvent('byte:checkTpPlayer', args[1], src)
                TriggerEvent('byte:sendLog', 'admin', 'Befehl "/stp"', adminRank[source].. ' hat sich zu '.. xTarget.getName() .. ' Teleportiert!')
                TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Du hast dich zu ".. xTarget.getName().. " Teleportiert!")
            else 
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        else
            TriggerClientEvent('glmp_singlenotify', src, "red", "Du befindest dich nicht im Admindienst!")
        end
    end
end)
 
RegisterCommand('tp', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 94 then
        if admindienst[source] == true then
            local xTarget = ESX.GetPlayerFromId(args[1])
            if xTarget ~= nil then
                local src = source
                TriggerClientEvent('byte:checkTpPlayer', args[1], src)
                TriggerEvent('byte:sendLog', 'admin', 'Befehl "/tp"', adminRank[source].. ' hat sich zu '.. xTarget.getName() .. ' Teleportiert!')
                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast dich zu ".. xTarget.getName().. " Teleportiert!")
                TriggerClientEvent('glmp_notify', xTarget.source, "red", "ADMIN", adminRank[source].. ' ' .. xPlayer.getName() .. ' hat sich zu dir Teleportiert!')
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    end
end)


RegisterServerEvent('support:tphere')
AddEventHandler('support:tphere', function(tid)
    local src = source
    if admindienst[src] == true then
        local xTarget = ESX.GetPlayerFromId(tid)
        local xPlayer = ESX.GetPlayerFromId(src)
        if xTarget ~= nil then
            local src = source
            TriggerClientEvent('byte:checkTpPlayer', src, tid)
            TriggerEvent('byte:sendLog', 'admin', 'Befehl "/tphere"', adminRank[src].. ' hat '.. xTarget.getName() .. ' zu sich Teleportiert!')
            TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Du hast ".. xTarget.getName().. " zu dir Teleportiert!")
            TriggerClientEvent('glmp_notify', xTarget.source, "red", "ADMIN", adminRank[src].. ' ' .. xPlayer.getName() .. ' hat dich zu sich Teleportiert!')
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
        end
    else
        TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
    end
end)
RegisterCommand('tphere', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 94 then
        if admindienst[source] == true then
            local xTarget = ESX.GetPlayerFromId(args[1])
            local xPlayer = ESX.GetPlayerFromId(src)
            if xTarget ~= nil then
                local src = source
                TriggerClientEvent('byte:checkTpPlayer', src, args[1])
                TriggerEvent('byte:sendLog', 'admin', 'Befehl "/tphere"', adminRank[source].. ' hat '.. xTarget.getName() .. ' zu sich Teleportiert!')
                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast ".. xTarget.getName().. " zu dir Teleportiert!")
                TriggerClientEvent('glmp_notify', xTarget.source, "red", "ADMIN", adminRank[source].. ' ' .. xPlayer.getName() .. ' hat dich zu sich Teleportiert!')
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    end
end)
RegisterServerEvent('byte:teleportPlayer')
AddEventHandler('byte:teleportPlayer', function(target, coords)
    local src = target
    TriggerClientEvent('byte:tpPlayer', src, coords)
end)

RegisterCommand('freeze', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 95 then
        if admindienst[source] == true then
            local xTarget = ESX.GetPlayerFromId(args[1])
            if xTarget ~= nil then
                TriggerClientEvent('glmp_notify', args[1], 'red', 'ADMIN', 'Du wurdest von '.. adminRank[source] .. ' ' .. xPlayer.getName() .. ' eingefroren.')
                sendLog('admin', 'FREEZE', adminRank[source] .. ' ' .. xPlayer.getName() .. ' hat den Spieler '.. xTarget.getName() .. ' eingefroren.')
                TriggerClientEvent('glmp_notify', source, 'red', 'ADMIN', 'Du hast ' .. xTarget.getName() .. ' eingefroren.')  
                TriggerClientEvent('byte:freezePlayer', args[1], true)
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    end
end)

RegisterCommand('unfreeze', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source) 
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 95 then
        if admindienst[source] == true then
            local xTarget = ESX.GetPlayerFromId(args[1])
            if xTarget ~= nil then
                TriggerClientEvent('glmp_notify', args[1], 'red', 'ADMIN', 'Du wurdest von '.. adminRank[source] .. ' ' .. xPlayer.getName() .. ' entfroren.')
                TriggerClientEvent('glmp_notify', source, 'red', 'ADMIN', 'Du hast ' .. xTarget.getName() .. ' entfroren.')
                TriggerClientEvent('byte:freezePlayer', args[1], false)
                sendLog('admin', 'FREEZE', adminRank[source] .. ' ' .. xPlayer.getName() .. ' hat den Spieler '.. xTarget.getName() .. ' entforen.')
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    end
end)

--car clear 
RegisterCommand('carclear', function(source, args, rawCommand) 
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 99 then
        if admindienst[source] == true then
            TriggerClientEvent('sendGlobalNotification', -1, "In 60 Sekunden, werden alle nicht besetzten Fahrzeuge automatisch Entfernt!", "gold", "dev", 10000, "gold")
            Citizen.Wait(30000)
            TriggerClientEvent('sendGlobalNotification', -1, "In 30 Sekunden, werden alle nicht besetzten Fahrzeuge automatisch Entfernt!", "gold", "dev", 10000, "gold")
            Citizen.Wait(20000)
            TriggerClientEvent('sendGlobalNotification', -1, "In 10 Sekunden, werden alle nicht besetzten Fahrzeuge automatisch Entfernt!", "gold", "dev", 10000, "gold")
            Citizen.Wait(5000)
            TriggerClientEvent('sendGlobalNotification', -1, "In 5 Sekunden, werden alle nicht besetzten Fahrzeuge automatisch Entfernt!", "gold", "dev", 10000, "gold")
            Citizen.Wait(5000)
            TriggerClientEvent("byte_adminsystem:carclear", -1)
            Citizen.Wait(500)
            TriggerClientEvent("byte_adminsystem:carclear", -1)
            Citizen.Wait(500)
            TriggerClientEvent("byte_adminsystem:carclear", -1)
            Citizen.Wait(2500)
            TriggerClientEvent('sendGlobalNotification', -1, "Es wurden alle nicht besetzten Fahrzeuge Entfernt!", "gold", "dev", 10000, "gold")
            sendLog('admin', 'Befehl "/carclear"', xPlayer.getName() .. " hat einen Carclear gemacht. ")
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end

end)




-- revive


RegisterCommand('revive', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 96 then
        if admindienst[source] == true then
            local modname = GetPlayerName(source)
            if args[1] ~= nil then
                if GetPlayerName(tonumber(args[1])) ~= nil then
                    local pname = GetPlayerName(args[1])
                    TriggerClientEvent('esx_ambulancejob:gehhoch', tonumber(args[1]))
                    TriggerClientEvent('glmp_notify', tonumber(args[1]), "red", "ADMIN", "Du wurdest wiederbelebt.")
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast ".. pname .. " (".. args[1] ..") wiederbelebt.")
                    sendLog('admin', 'Befehl "/revive"', '**' .. modname .. '** hat '.. pname .. ' wiederbelebt.')
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Spieler ist nicht online.")	
                end 
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Du musst eine ID angeben.")		
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else 
        TriggerClientEvent('glmp_singlenotify', source, "red", "Dazu hast du keine Rechte")
    end
         
end)


RegisterServerEvent('support:revive')
AddEventHandler('support:revive', function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 95 then
        if admindienst[source] == true then
            local modname = GetPlayerName(source)
            if id ~= nil then
                if GetPlayerName(tonumber(id)) ~= nil then
                    local pname = GetPlayerName(id)
                    TriggerClientEvent('esx_ambulancejob:gehhoch', tonumber(id))
                    TriggerClientEvent('glmp_notify', tonumber(id), "red", "ADMIN", "Du wurdest wiederbelebt.")
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast ".. pname .. " (".. id ..") wiederbelebt.")
                    sendLog('admin', 'Befehl "/revive"', '**' .. modname .. '** hat '.. pname .. ' wiederbelebt. (F9)')
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Spieler ist nicht online.")	
                end 
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Du musst eine ID angeben.")		
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else 
        TriggerClientEvent('glmp_singlenotify', source, "red", "Dazu hast du keine Rechte")
    end
         
end)


RegisterCommand('respawn', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 97 then
        if admindienst[source] == true then
            local modname = GetPlayerName(source)
            if args[1] ~= nil then
                if GetPlayerName(tonumber(args[1])) ~= nil then
                    local pname = GetPlayerName(args[1])
                    TriggerClientEvent('esx_ambulancejob:gehhoch', tonumber(args[1]))
                    TriggerClientEvent('setDimension',  tonumber(args[1]), 0)     
                    TriggerClientEvent('respawnPlayer', tonumber(args[1]))
                    TriggerClientEvent('glmp_notify', tonumber(args[1]), "red", "ADMIN", "Du wurdest Respawned.")
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast ".. pname .. " (".. args[1] ..") respawned.")
                    sendLog('admin', 'Befehl "/revive"', '**' .. modname .. '** hat '.. pname .. ' respawned.')
                    TriggerServerEvent('byte:teleportPlayer', source, coords)
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Spieler ist nicht online.")	
                end 
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Du musst eine ID angeben.")		
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else 
        TriggerClientEvent('glmp_singlenotify', source, "red", "Dazu hast du keine Rechte")
    end
         
end)


--setmoney

RegisterCommand('setbalance', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 99 then
        if admindienst[source] then
            local _source = source
            local target = tonumber(args[1])
            local money_type = args[2]
            local money_amount = tonumber(args[3])
            local modname = GetPlayerName(source)
            local pname = GetPlayerName(target)
            
            local xPlayer = ESX.GetPlayerFromId(target)
            if xPlayer ~= nil then
                if target and money_type and money_amount and xPlayer ~= nil then
                    if money_type == 'cash' then
                        xPlayer.setMoney(money_amount)
                        TriggerClientEvent('glmp_notify', target, "red", "ADMIN", "Dein Bargeld wurde zu ".. money_amount .. "$ gesetzt.")
                        sendLog('admin', 'Befehl "/setbalance"', '**' .. modname .. '** hat das Bargeld von '.. pname .. ' zu '.. money_amount ..'$ gesetzt.')
                    elseif money_type == 'bank' then
                        xPlayer.setAccountMoney('bank', money_amount)
                        TriggerClientEvent('glmp_notify', target, "red", "ADMIN", "Dein Konto-Guthaben wurde zu ".. money_amount .. "$ gesetzt.")
                        sendLog('admin', 'Befehl "/setbalance"', '**' .. modname .. '** hat das Konto-Guthaben von '.. pname .. ' zu '.. money_amount ..'$ gesetzt.')
                    elseif money_type == 'black' then
                        xPlayer.setAccountMoney('black_money', money_amount)
                        TriggerClientEvent('glmp_notify', target, "red", "ADMIN", "Dein Schwarzgeld wurde zu ".. money_amount .. "$ gesetzt.")
                        sendLog('admin', 'Befehl "/setbalance"', '**' .. modname .. '** hat das Schwarzgeld von '.. pname .. ' zu '.. money_amount ..'$ gesetzt.')
                    else
                        TriggerClientEvent('glmp_notify', source, "red", "Fehler", "Falscher Geld-Typ")
                        return
                    end
                else
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Falsche Angaben")
                    return
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist nicht online!')
            end
            
            ------print('es_extended: ' .. GetPlayerName(source) .. ' just set $' .. money_amount .. ' (' .. money_type .. ') to ' .. xPlayer.name)
            
            
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)

 
 
admindienst = {}
RegisterServerEvent('byte_adminsystem:setAdmindienstS')
AddEventHandler('byte_adminsystem:setAdmindienstS', function(state)
    ------print("set serverside aduty for ".. source)

    local src = source

    if state == 'on' then
        admindienst[src] = true
        MySQL.Async.execute('UPDATE users SET flugmodus = @flugmodus, lautlos = @lautlos, anrufeablehnen = @anrufe WHERE identifier = @identifier',
        { ['flugmodus'] = 1, ['lautlos'] = 1, ['anrufe'] = 1, ['identifier'] = ESX.GetPlayerFromId(src).getIdentifier()},
        function(affectedRows)
        end)
    elseif state == 'off' then
        admindienst[src] = false
    end
end)
-- Aduty
RegisterCommand("aduty", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 94 then
 
        TriggerClientEvent('toggleAduty', source)
        TriggerClientEvent('togglePAduty', source)
        local src = source
        TriggerEvent('byte:toggleExternAduty', src)
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end, false)

-- Charreset
RegisterCommand("resetidentity", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 96 then
        if admindienst[source] == true then

            local pname = GetPlayerName(tonumber(args[1]))
            if pname ~= nil then
                local modname = GetPlayerName(source)
                TriggerClientEvent('esx_identity:showRegisterIdentity', args[1], {})
                TriggerClientEvent('glmp_notify', source, 'red', 'ADMIN', 'Du hast die Identität von '.. pname ..'('.. args[1] ..') zurückgesetzt.')
                TriggerClientEvent('glmp_notify', args[1], 'red', 'ADMIN', 'Deine Identität wurde von ' .. adminRank[source] ..' ' .. modname .. ' zurückgesetzt.')
                sendLog('admin', 'Befehl "/resetidentity"', '**' .. adminRank[source] .. ' ' .. modname .. '** hat die Identität von '.. pname .. ' zurückgesetzt')
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_singlenotify', source, "red", "Dazu hast du keine Rechte")
    end

end)

RegisterServerEvent('byte_adminsystem:parkCar')
AddEventHandler('byte_adminsystem:parkCar', function(plate, garage)
    ------print(plate)
    ------print(garage)
    MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET state = '0' WHERE plate = @plate", { ['@plate'] = plate})
    MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET stored = '1' WHERE plate = @plate", { ['@plate'] = plate}) 
    MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET garage = @garage WHERE plate = @plate", { ['@plate'] = plate, ['@garage'] = garage})
end)



RegisterCommand('createfrakveh', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 99 then
        if admindienst[source] == true then  
            TriggerClientEvent('admin:spawnCreateFrakVeh', source, args[1], args[2], args[3], args[4])
            TriggerClientEvent('glmp_singlenotify', source, "red", "Das Fraktions Auto wurde erstellt !!")
            print("FRAK CAR ERSTELLT")
        end
    end
end)


RegisterCommand('createveh', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 99 then
        if admindienst[source] == true then   
            TriggerClientEvent('admin:spawnCreateOwnVeh', source, args[1], args[2], args[3])
            print("FRAK CAR ERSTELLT")
        end
    end 
end)


--- /setfraktion
RegisterCommand('setfraktion', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(args[1])
    local targetidentifier = xTarget.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 97 then
        if admindienst[source] == true then
            if tonumber(args[1]) and args[2] then
                local pname = GetPlayerName(source)
                local xPlayer = ESX.GetPlayerFromId(args[1])

                if xPlayer then
                    if ESX.DoesJobExist(args[2], 0) then
                        xPlayer.setJob(args[2], 0)
                        MySQL.Sync.fetchScalar("UPDATE users SET job = '"..args[2].."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '0' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Du bist nun Mitglied von " .. args[2] .. ".") 
                        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", xPlayer.getName() .. " ist nun Mitglied von " .. args[2] .. ".")
                        sendLog('admin', 'Befehl "/setfraktion"', xPlayer.getName() .. " hat den Spieler ".. xTarget.getName() .. " in die Fraktion ".. args[2] .. " gesetzt.")
                    else
                        TriggerClientEvent('glmp_singlenotify', source, "red", "Diese Fraktion Exestiert nicht.")
                    end

                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler befindet sich nicht auf dem Server.")
                end
            else
                TriggerClientEvent('glmp_notify', source, "red", "Fehler", "Falsche Angaben")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)
  
RegisterCommand('moneyforall', function(source, args)
     
     
    getAdminLevel(source)
    
    if permlevel[source] >= 99 then
        if admindienst[source] == true then
            local xPlayers = ESX.GetPlayers()

            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         
                xPlayer.addMoney(args[1])
                TriggerClientEvent('glmp_notify', xPlayer.source, '', 'GLMP-BONUS (MONEY)', 'Du hast '.. args[1] .. '$ erhalten.')   

            end
            
        end
    end 
end)

RegisterCommand('itemforall', function(source, args)
     
      
    getAdminLevel(source)
    
    if permlevel[source] >= 99 then
        if admindienst[source] == true then
            local xPlayers = ESX.GetPlayers()

            for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          
                xPlayer.addInventoryItem(args[1], 1)   
                TriggerClientEvent('glmp_notify', xPlayer.source, '', 'GLMP-BONUS (ITEM)', 'Du hast 1x '.. args[1] .. ' erhalten.')   

            end
            
        end
    end 
end)
 
RegisterCommand('createfrak', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local identifier = xPlayer.getIdentifier()
    
    getAdminLevel(source)
   
    if permlevel[source] >= 99 then
        if admindienst[source] == true then
            if ESX.DoesJobExist(args[1], 0) then
            
                TriggerClientEvent('glmp_singlenotify', source, "red", "Diese Fraktion exestiert bereits!")
                return 
            end
            TriggerClientEvent('glmp_singlenotify', source, "red", "Frak wurde erstellt")
                MySQL.Sync.fetchScalar("INSERT INTO `jobs` (`name`, `label`, `color`) VALUES (@name, @label, @color)", {['@name'] = args[1], ['@label'] = args[2], ['@color'] = args[3]})
                MySQL.Sync.fetchScalar("INSERT INTO `job_grades` ( `job_name`, `grade`, `name`, `label`) VALUES(@frakname, 12, 'rang12', 'Rang 12'), (@frakname, 11, 'rang11', 'Rang 11'), (@frakname, 10, 'rang10', 'Rang 10'), (@frakname, 9, 'rang9', 'Rang 9'), (@frakname, 8, 'rang8', 'Rang 8'), (@frakname, 7, 'rang7', 'Rang 7'), (@frakname, 6, 'rang6', 'Rang 6'), (@frakname, 5, 'rang5', 'Rang 5'), (@frakname, 4, 'rang4', 'Rang 4'), (@frakname, 3, 'rang3', 'Rang 3'), (@frakname, 2, 'rang2', 'Rang 2'), (@frakname, 1, 'rang1', 'Rang 1'), (@frakname, 0, 'rang0', 'Rang 0');", {['@frakname'] = args[1]})
                sendLog('admin', 'Befehl "/createfrak"', xPlayer.getName() .. ' hat eine Fraktion erstellt.\nName: '.. args[1] .. '\nLabel: '.. args[2] .. '\nColor: '.. args[3]) 
            
        end
    end
end)
  







RegisterCommand('setleader', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local identifier = xPlayer.getIdentifier()
    
    getAdminLevel(source)
   
    if permlevel[source] >= 98 then
        if admindienst[source] == true then
            if tonumber(args[1]) then
                local pname = GetPlayerName(source)
                local tname = GetPlayerName(args[1])
                if tname ~= nil then
                    local xTarget = ESX.GetPlayerFromId(args[1])
                    local targetidentifier = xTarget.getIdentifier()
                    local xIdentifier = ESX.GetPlayerFromId(args[1])
                    local job = MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    xTarget.setJob(job, 12)
                    MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '12' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET job = '".. job .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Der Spieler ".. tname .." ist nun Leader seiner Fraktion.")
                    TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Du bist nun Fraktionsleader [Rang 12]. Du musst dich einmal neuverbinden um volle Rechte zu erhalten.")
                    sendLog('admin', 'Befehl "/setleader"', xPlayer.getName() .. " hat den Spieler ".. xTarget.getName().. " zum Fraktionsleader gesetzt.")
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
                end
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)


RegisterCommand('setfrakrank', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    getAdminLevel(source)
    
    if permlevel[source] >= 97 then
        if admindienst[source] == true then
            if tonumber(args[1]) then
                local pname = GetPlayerName(source)
                local tname = GetPlayerName(args[1])
                if tname ~= nil then
                    local xTarget = ESX.GetPlayerFromId(args[1])
                    local identifier = xPlayer.getIdentifier()
                    local targetidentifier = xTarget.getIdentifier()
                    local job = MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    local xIdentifier = ESX.GetPlayerFromId(args[1])
                    xTarget.setJob(job, tonumber(args[2]))
                    MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '".. args[2] .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET job = '".. job .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    --[[MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})]]
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Der Spieler ".. tname .." ist nun Rang ".. args[2] .." in seiner Fraktion.")
                    TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Dein " .. xTarget.getJob().label .." Rang wurde zu ".. args[2] .. " gesetzt.")
                    sendLog('admin', 'Befehl "/setleader"', xPlayer.getName() .. " hat den Spieler ".. xTarget.getName().. " in der Fraktion ".. xTarget.getJob().label .. " zu Rang ".. args[2] .." gesetzt.")
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
                end
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)



RegisterCommand('setrank', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    getAdminLevel(source) 

    if permlevel[source] >= 99 then
        if tonumber(args[1]) then
            local pname = GetPlayerName(source)
            local tname = GetPlayerName(args[1])
            if tname ~= nil then
                local plevel = MySQL.Sync.fetchScalar("SELECT permission_level FROM adminRanks WHERE adminRank = @adminRank", { ['@adminRank'] = args[2]})
                if plevel ~= nil then
                    local xTarget = ESX.GetPlayerFromId(args[1])
                    local identifier = xPlayer.getIdentifier()
                    local targetidentifier = xTarget.getIdentifier()
                    local dc = MySQL.Sync.fetchScalar("SELECT discord FROM users WHERE identifier = @adminRank", { ['@adminRank'] = xTarget.getIdentifier()})
                    TriggerEvent('discord:syncAccount', xTarget.getIdentifier(), dc, xTarget.source)
                    local xIdentifier = ESX.GetPlayerFromId(args[1])
                    MySQL.Sync.fetchScalar("UPDATE users SET adminRank = '".. args[2] .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast dem Spieler ".. xTarget.getName() .. " den Rang ".. args[2] .. " gesetzt.")
                    TriggerEvent('byte:sendLog', 'admin', 'Befehl "/setrank"', xPlayer.getName() .. " hat dem Spieler ".. xTarget.getName() .. " den ".. args[2] .. " Rang gesetzt.")
                   -- xTarget.kick("Du hast den Rang ".. args[2] .. " erhalten.")
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Rang exestiert nicht.")
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
            end
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)



RegisterCommand('setrankdc', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    getAdminLevel(source) 
    local src = source
    if permlevel[source] >= 99 then 
        if tonumber(args[1]) then
            local pname = GetPlayerName(source)
            local dc = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE discord = @adminRank", { ['@adminRank'] = args[1]})
            if dc ~= nil then 
                local display = MySQL.Sync.fetchScalar("SELECT displayname FROM users WHERE discord = @adminRank", { ['@adminRank'] = args[1]})
                local plevel = MySQL.Sync.fetchScalar("SELECT permission_level FROM adminRanks WHERE adminRank = @adminRank", { ['@adminRank'] = args[2]})
                if plevel ~= nil then
                    local identifier = xPlayer.getIdentifier()
                
                    TriggerEvent('discord:syncAccount', dc, args[1], 0)
                       
                    MySQL.Sync.fetchScalar("UPDATE users SET adminRank = '".. args[2] .."' WHERE discord = @identifier", { ['@identifier'] = args[1]})
                    TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Du hast dem Spieler ".. display.. " den Rang ".. args[2] .. " gesetzt.")
                    TriggerEvent('byte:sendLog', 'admin', 'Befehl "/setrankdc"', xPlayer.getName() .. " hat dem Spieler ".. display .. " den ".. args[2] .. " Rang gesetzt.")
                   -- xTarget.kick("Du hast den Rang ".. args[2] .. " erhalten.")
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Rang exestiert nicht.")
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht existent!")
            end
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)



----------------


--doors
RegisterCommand('createdoors', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 99 then
        TriggerClientEvent("Doors:CreateDoors",source)
        sendLog('admin', 'Befehl "/createdoors"', xPlayer.getName() .. " erstellt türen.")
    end
end)

RegisterCommand('deletedoors', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 99 then
        TriggerClientEvent("deletedoors",source)
        sendLog('admin', 'Befehl "/deletedoors"', xPlayer.getName() .. " entfernt türen.")
    end
end)



ESX.RegisterServerCallback("byte_adminsystem:getOnlinePlayers", function(source, cb)
	
	local players = {}
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        table.insert(players, { name = GetPlayerName(xPlayer.source), id = xPlayer.source})
        
    end
    cb(players)
   
end)

RegisterCommand("tc", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 90 then
        if admindienst[source] == true then
            if adminRank[source] == nil then
                adminRank[source] = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                ------print("set admin rank for player ".. source)
            end  
            sendTcMessage('[TC] ' .. adminRank[source] .. ' ' .. xPlayer.getName() .. ":", table.concat(args, " ")    )
        elseif teamchat[source] == true then
            if adminRank[source] == nil then
                adminRank[source] = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                ------print("set admin rank for player ".. source)
            end  
            sendTcMessage('[TC] ' .. adminRank[source] .. ' ' .. xPlayer.getName() .. ":", table.concat(args, " ")    )
        end
    end
end)

RegisterCommand("tctoggle", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 90 then
        if teamchat[source] ~= true then
            teamchat[source] = true
            TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'red', 'Teamchat Aktiviert')
        else
            teamchat[source] = false
            TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'red', 'Teamchat Deaktiviert')
        end
    end
end)


teamchat = {}

function sendTcMessage(title, msg)
    local xPlayers = ESX.GetPlayers()

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

            if admindienst[xPlayer.source] == true then
                TriggerClientEvent('glmp_notify', xPlayer.source, 'red', title, msg)
            elseif teamchat[xPlayer.source] == true then
                TriggerClientEvent('glmp_notify', xPlayer.source, 'red', title, msg)
            end
  
        end
end

supportnotify = {}
function AdminNotify(msg)
    local xPlayers = ESX.GetPlayers()

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

            if admindienst[xPlayer.source] == true then
                TriggerClientEvent('glmp_notify', xPlayer.source, 'red', "Support", msg)
            elseif supportnotify[xPlayer.source] == true then
                TriggerClientEvent('glmp_notify', xPlayer.source, 'red', "Support", msg)
            end
  
        end
end

RegisterCommand("togglenotify", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source) 
    if permlevel[source] >= 94 then
        if supportnotify[source] ~= true then
            supportnotify[source] = true 
            TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'red', 'Admin Messages Aktiviert')
        else 
            supportnotify[source] = false
            TriggerClientEvent('glmp_singlenotify', xPlayer.source, 'red', 'Admin Messages Deaktiviert')
        end
    end
end)


RegisterCommand('rank', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    if adminRank[source] == nil then
        adminRank[source] = MySQL.Sync.fetchScalar("SELECT adminRank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        ------print("set admin rank for player ".. source)
    end
    TriggerClientEvent('glmp_notify', source, '', '', 'Du hast den '.. adminRank[source] ..' Rang.')
end)


banexec = {}
banreason = {}
day = {}
year = {}
month = {}
hour = {}
min = {}

RegisterCommand('clearinventory', function(source, args)

    getAdminLevel(source)
    if permlevel[source] >= 97 then
        local pname = GetPlayerName(source)


            xPlayer = ESX.GetPlayerFromId(args[1])

    
        if not xPlayer then
            TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online.")
            return
        end
     
        for i=1, #xPlayer.inventory, 1 do
            if xPlayer.inventory[i].count > 0 then
                xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
            end
        end
        TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Dein Inventar wurde geleert.")
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Das Inventar von ".. xPlayer.getName().. ' wurde geleert.')
        local xAdmin = ESX.GetPlayerFromId(source)
        sendLog('admin', 'Befehl "/clearinventory"', xAdmin.getName() .. ' hat das Inventar von '.. xPlayer.getName() .. ' geleert.')
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end
end)



RegisterCommand('weapon', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(args[1])
    local weaponName = string.upper(args[2])
    local identifier = xPlayer.getIdentifier()
    local modname = GetPlayerName(source)
    local pname = GetPlayerName(args[1])
    getAdminLevel(source)
    if permlevel[source] >= 99 then
        if admindienst[source] == true then
            if pname ~= nil then
                if ESX.GetWeaponLabel('weapon_' .. weaponName) ~= nil then
                    xTarget.addWeapon('weapon_' .. weaponName, 250)
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast ".. pname .." die Waffe ".. ESX.GetWeaponLabel('weapon_' .. weaponName) .." gegeben.")
                    TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Du hast die Waffe ".. ESX.GetWeaponLabel('weapon_' .. weaponName) .." bekommen.")
                    sendLog('admin', 'Befehl "/weapon"', '**'.. modname ..'** hat '.. pname ..' die Waffe '.. ESX.GetWeaponLabel('weapon_' .. weaponName) ..' ('.. 'weapon_' .. weaponName ..') gegeben.')
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Diese Waffe exestiert nicht!")
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Spieler ist nicht online!")
            end                
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end

end)

RegisterCommand('item', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(args[1])
    local itemName = args[2]
    local count   = (args[3] == nil and 1 or tonumber(args[3]))
    local identifier = xPlayer.getIdentifier()
    local modname = GetPlayerName(source)
    local pname = GetPlayerName(args[1])
    getAdminLevel(source)
    if permlevel[source] >= 99 then
        if admindienst[source] == true then
            if pname ~= nil then
                if ESX.GetItemLabel(itemName) ~= nil then
                    xTarget.addInventoryItem(itemName, count)
                    TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast ".. pname .." ".. count .."x ".. ESX.GetItemLabel(itemName).." gegeben.")
                    TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Du hast ".. count .."x ".. ESX.GetItemLabel(itemName).." bekommen.")
                    sendLog('admin', 'Befehl "/item"', '**'.. modname ..'** hat '.. pname .. ' '.. count .. 'x das Item '.. ESX.GetItemLabel(itemName) ..' ('.. itemName ..') gegeben.')
                else
                    TriggerClientEvent('glmp_singlenotify', source, "red", "Dieses Item exestiert nicht!")
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, "red", "Dieser Spieler ist nicht online!")
            end

        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end

end)





RegisterCommand('tickets', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)

    local resultadd = 0
    local string = "("

    if permlevel[source] >= 94 then       
        local counts =  MySQL.Sync.fetchScalar('SELECT COUNT(*) FROM support_tickets WHERE `state` = 0')
        MySQL.Async.fetchAll('SELECT id FROM support_tickets WHERE state = 0', {}, function (result)
    
 

            for resultadd = 1, counts, 1 do
              
               
                if resultadd  == 1 then
                string = string .. tostring(result[resultadd].id) .. ", "
                elseif resultadd == counts then
                    string = string .. tostring(result[resultadd].id) .. ")"
                else
                    string = string .. tostring(result[resultadd].id) .. ", "
                end
            end
            if counts == 0 then
                TriggerClientEvent('glmp_singlenotify', source, "", "Es sind derzeit keine Tickets offen.")
               else
               TriggerClientEvent('glmp_singlenotify', source, "", "Es sind derzeit: " .. counts .." Tickets offen.")
               end
        end)
       
      
    

     
            
    else
        TriggerClientEvent('glmp_notify', source, "", "Dazu hast du keine Rechte.")
    end
end)


RegisterServerEvent('sendTeamChat')
AddEventHandler('sendTeamChat', function(group, playername, msg)

    TriggerClientEvent('glmp_tcnotify', -1, "red", 'TEAMCHAT - '.. group .. ' ' .. playername, msg)

end)

ESX.RegisterServerCallback("byte_adminsystem:getSupportTickets", function(source, cb)
	
	local ownedVehs = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll("SELECT * FROM support_tickets WHERE state = @owner", { ["@owner"] = 0}, function(result)

		for i = 1, #result, 1 do
			table.insert(ownedVehs, { id = result[i].id, cname = result[i].creatorname, state = result[i].state, staff = result[i].staff})
		end  
 
		cb(ownedVehs)
	end) 
end)

ESX.RegisterServerCallback("byte_adminsystem:getAcceptedSupportTickets", function(source, cb)
	
	local ownedVehs = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll("SELECT * FROM support_tickets WHERE state = @owner", { ["@owner"] = 1}, function(result)

		for i = 1, #result, 1 do
			table.insert(ownedVehs, { id = result[i].id, cname = result[i].creatorname, state = result[i].state, staff = result[i].staff})
		end  
 
		cb(ownedVehs)
	end) 
end)

ESX.RegisterServerCallback("byte_adminsystem:getSupportDetails", function(source, cb, ticketid)
	
	local data = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	local creator_id = MySQL.Sync.fetchScalar("SELECT `creator_id` FROM `support_tickets` WHERE `id` = @id;", { ['@id'] = ticketid})
    local creator_name = MySQL.Sync.fetchScalar("SELECT `creatorname` FROM `support_tickets` WHERE `id` = @id;", { ['@id'] = ticketid})
    local creator_identifier = MySQL.Sync.fetchScalar("SELECT `creator` FROM `support_tickets` WHERE `id` = @id;", { ['@id'] = ticketid})
    local message = MySQL.Sync.fetchScalar("SELECT `message` FROM `support_tickets` WHERE `id` = @id;", { ['@id'] = ticketid})
    local state = MySQL.Sync.fetchScalar("SELECT `state` FROM `support_tickets` WHERE `id` = @id;", { ['@id'] = ticketid})
	local data = {
		creator_id  = creator_id,
        creator_name = creator_name,
		creator_identifier = creator_identifier,
        message = message,
		state = state
	}
	cb(data) 
end)

--[[RegisterCommand('supportmenu', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 91 then
        if admindienst[source] == true then
            ------print("open menu server side")
            TriggerClientEvent('openSupportMainMenu', source, permlevel[source])
        end
    end
end)]]







RegisterServerEvent('byte_adminmenu:resetpw')
AddEventHandler('byte_adminmenu:resetpw', function(args)
    local au = table.unpack(args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(au[1])
    local targetidentifier = xTarget.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] > 98 then
        if tonumber(args[1]) then
            local pname = GetPlayerName(source)
            local xPlayer = ESX.GetPlayerFromId(args[1])

            if xPlayer then
                MySQL.Sync.fetchScalar("UPDATE `users` SET `password` = NULL WHERE `users`.`identifier` = @identifier;", { ['@identifier'] = targetidentifier})
                TriggerClientEvent('glmp_notify', args[1], "red", "ADMIN", "Dein Passwort wurde zurückgesetzt.")
                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", xTarget.getName() .. " wurde sein Passwort zurückgesetzt.")
            else
                TriggerClientEvent('glmp_notify', source, "red", "Fehler", "Der Spieler befindet sich nicht auf dem Server.")
            end
        else
            TriggerClientEvent('glmp_notify', source, "red", "Fehler", "Falsche Angaben")
        end
    else
        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dazu hast du keine Rechte")
    end
end)


RegisterCommand('addrank', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] >= 100 then
        local rankName = args[1]
        local permLevel = tonumber(args[2])
        local clotheId = args[3]
        MySQL.Sync.fetchScalar("INSERT INTO adminRanks (adminRank, permission_level, clothesID) VALUES (@rankName, @permLevel, @clothes)", { ['@rankName'] = rankName,  ['@permLevel'] = permLevel, ['@clothes'] = clotheId})
        TriggerEvent('byte:sendLog', 'admin', 'RANG ERSTELLT', xPlayer.getName() .. ' hat einen neuen Admin Rang erstellt.\n**Name:** '.. rankName .. ' \n**Permission:**'.. permLevel.. '\n**ClothesID:**'.. clotheId)
        TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Rang wurde erstellt.')
    end 
end)
RegisterCommand('support', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    getAdminLevel(source)
    if permlevel[source] < 91 then
        local pname = GetPlayerName(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = xPlayer.getIdentifier()
        if args[1] ~= nil then
            local exists = MySQL.Sync.fetchScalar("SELECT * FROM support_tickets WHERE creator = @identifier", { ['@identifier'] = identifier})
            if exists == nil then
                if args[1] ~= 'cancel' then
                    local report = table.concat(args, " ")
                    MySQL.Sync.fetchScalar("INSERT INTO support_tickets (creator_id, creator, creatorname, message, state) VALUES (@cid, @identifier, @cname, @msg, 0)", { ['@cid'] = source,  ['@cname'] = xPlayer.getName(), ['@identifier'] = identifier, ['@msg'] = report})
                    local ticketid = MySQL.Sync.fetchScalar("SELECT id FROM support_tickets WHERE creator = @identifier", { ['@identifier'] = identifier})
                    sendLog('support', "Support-System", "\n\n**".. GetPlayerName(source) .. "** hat ein neues Ticket erstellt.\n\n**Ticket-ID:** ``".. ticketid .."``\n**Player ID:** ``".. source .. "``\n**Identifier:** ``".. identifier .. "`` \n **Anliegen:** ```".. report .. "```")
                    TriggerClientEvent('glmp_notify', source, "red", "Support", "Dein Ticket wurde erstellt. Bitte habe nun ein wenig geduld. Ein Teammitglied wird sich gleich um dich kümmern.")
                    AdminNotify(GetPlayerName(source) .. ' hat ein Ticket erstellt. Grund: '.. report)
                else
                    TriggerClientEvent('glmp_notify', source, "red", "Support", "Du hast derzeitig keine Offene Support Anfragen.")
                end
            else
                if args[1] == 'cancel' then
                    MySQL.Sync.fetchScalar("DELETE FROM support_tickets WHERE creator = @identifier", { ['@identifier'] = identifier})
                    TriggerClientEvent('glmp_notify', source, "red", "Support", "Deine Support-Anfrage wurde zurück gezogen.")
                    ticket("12745742", "Ticket", "Support-System", "**".. GetPlayerName(source) .. "** hat sein Ticket Geschlossen.", embedFooter)
                else
                    TriggerClientEvent('glmp_notify', source, "red", "Support", "Du hast bereits ein Ticket geöffnet. Um dein Aktuelles Ticket zu Schließen, nutze '/support cancel'")
                end
            end
        else
            TriggerClientEvent('glmp_notify', source, "red", "Support", "Bitte gebe einen Grund an.")
        end
    else
        --[[if admindienst[source] == true then
            if args[1] ~= nil then
                if args[1] == 'close' then
                    if args[2] ~= nil then
                        local exists = MySQL.Sync.fetchScalar("SELECT * FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(args[2])})
                        if exists ~= nil then

                            local creatorid = MySQL.Sync.fetchScalar("SELECT creator_id FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(args[2])})
                            MySQL.Sync.fetchScalar("DELETE FROM support_tickets WHERE id = @ticketid", { ['@ticketid'] = tonumber(args[2])})
                            TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast das Ticket ".. args[2] .." geschlossen.")
                            TriggerClientEvent('glmp_notify', creatorid, "red", "SUPPORT", "Deine Anfrage wurde Geschlossen.")
                            sendLog('admin', 'Befehl "/support"', '**' .. pname .. '** hat das Ticket '.. args[2] .. ' Geschlossen.')

                        else
                            TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dieses Ticket exestiert nicht.")
                        end
                    else
                        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Bitte Gebe eine Ticket-ID an.")
                    end
                elseif args[1] == 'accept' then
                    if args[2] ~= nil then
                        local exists = MySQL.Sync.fetchScalar("SELECT * FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(args[2])})
                        if exists ~= nil then
                            local status = MySQL.Sync.fetchScalar("SELECT state FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(args[2])})
                            local creatorid = MySQL.Sync.fetchScalar("SELECT creator_id FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(args[2])})
                            if status == 0 then
                                MySQL.Sync.fetchScalar("UPDATE support_tickets SET state = 1, staff = @staff WHERE id = @id", { ['@staff'] = GetPlayerName(source), ['@id'] = tonumber(args[2])})
                                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Du hast das Ticket ".. args[2] .." angenommen.")
                                TriggerClientEvent('glmp_notify', creatorid, "red", "ADMIN", "Deine Anfrage wird nun Bearbeitet.")
                                sendLog('admin', 'Befehl "/support"', '**' .. pname .. '** hat das Ticket '.. args[2] .. ' Angenommen.')
                                TriggerClientEvent('glmp_notify', creatorid, "red", "SUPPORT", "Deine Anfrage wird nun Bearbeitet.")
                            elseif status == 1 then
                                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dieses Ticket wird bereits Bearbeitet.")
                            elseif status == 2 then
                                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dieses Ticket wurde schon Bearbeitet.")
                            end
                        else
                            TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Dieses Ticket exestiert nicht.")
                        end
                    else
                        TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Bitte Gebe eine Ticket-ID an.") 
                    end
                
                end
            else
                TriggerClientEvent('glmp_notify', source, "red", "ADMIN", "Verwende: /support (accept/close) (ticket-id)")
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Du befindest dich nicht im Admindienst!")
        end]]
        TriggerClientEvent('glmp_singlenotify', source, "red", "Bitte nutze /supportmenu oder /tickets!") 
    end
end)

 
RegisterServerEvent('byte_adminsystem:support:accept') 
AddEventHandler('byte_adminsystem:support:accept', function(tid)
    local ticketid = tid
    local src = source
    local exists = MySQL.Sync.fetchScalar("SELECT * FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(ticketid)})
    if exists ~= nil then
        local status = MySQL.Sync.fetchScalar("SELECT state FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(ticketid)})
        local creatorid = MySQL.Sync.fetchScalar("SELECT creator_id FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(ticketid)})
        if status == 0 then 
            MySQL.Sync.fetchScalar("UPDATE support_tickets SET state = 1, staff = @staff WHERE id = @id", { ['@staff'] = ESX.GetPlayerFromId(src).getIdentifier(), ['@id'] = tonumber(ticketid)})
            TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Du hast das Ticket ".. ticketid .." angenommen.")
            TriggerClientEvent('glmp_notify', creatorid, "red", "ADMIN", "Deine Anfrage wird nun Bearbeitet.") 
            sendLog('support_admin', 'Ticket Angenommen', '**' .. ESX.GetPlayerFromId(src).getName() .. '** hat das Ticket '.. ticketid .. ' Angenommen.')
            --TriggerClientEvent('glmp_notify', creatorid, "red", "SUPPORT", "Deine Anfrage wird nun Bearbeitet.")
        elseif status == 1 then
            TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dieses Ticket wird bereits Bearbeitet.")
        elseif status == 2 then
            TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dieses Ticket wurde schon Bearbeitet.")
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, "", "Dieses Ticket exestiert nicht mehr.")
    end
end)

RegisterServerEvent('byte_adminsystem:support:close')
AddEventHandler('byte_adminsystem:support:close', function(tid)
    local ticketid = tid
    local src = source
    local exists = MySQL.Sync.fetchScalar("SELECT * FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(tid)})
    if exists ~= nil then

        local creatorid = MySQL.Sync.fetchScalar("SELECT creator_id FROM support_tickets WHERE id = @id", { ['@id'] = tonumber(tid)})
        MySQL.Sync.fetchScalar("DELETE FROM support_tickets WHERE id = @ticketid", { ['@ticketid'] = tonumber(tid)})
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Du hast das Ticket ".. tid .." geschlossen.")
        TriggerClientEvent('glmp_notify', creatorid, "red", "SUPPORT", "Deine Anfrage wurde Geschlossen.")
        sendLog('support_admin', 'Ticket Geschlossen', '**' .. ESX.GetPlayerFromId(src).getName() .. '** hat das Ticket '.. tid .. ' Geschlossen.')
 
    else
        TriggerClientEvent('glmp_notify', src, "red", "ADMIN", "Dieses Ticket exestiert nicht.")
    end
end)

    
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == 'germanlifemultiplayer' then
        MySQL.Sync.fetchScalar("TRUNCATE TABLE `support_tickets`")
        MySQL.Sync.fetchScalar("TRUNCATE TABLE `dispatches`")
        MySQL.Sync.fetchScalar("TRUNCATE TABLE `phone_taxis`")
    end 
end)
  
  
-- EINREISE


RegisterCommand('ausreise', function(source, args)
    local target = tonumber(args[1])
    local xTarget = ESX.GetPlayerFromId(target)
   
    getAdminLevel(source)
    if permlevel[source] > 89 then
        if einreiseDuty[source] == 1 then
            if xTarget ~= nil then
                local xPlayer = ESX.GetPlayerFromId(source)
                local identifier = xPlayer.getIdentifier()
                local targetidentifier = xTarget.getIdentifier()
                local modname = GetPlayerName(source)
                local pname = GetPlayerName(target)
                local einreise = MySQL.Sync.fetchScalar("SELECT einreise FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local xPlayer = ESX.GetPlayerFromId(source)
                local identifier = xPlayer.getIdentifier()
                if einreise ~= 1 then
                    sendLog('einreise', 'AUSREISE', 'Der Spieler '.. rpname .. ' ('.. xTarget.getName() ..') wurde von '.. xPlayer.getName() .. ' abgeschoben.')
                    TriggerClientEvent('glmp_notify', source, 'darkgreen', 'Einreiseamt', 'Du hast '.. rpname ..' Abgeschoben.')
                    xTarget.kick('Einreise nicht bestanden')  
                else
                    TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist bereits eingereist.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist nicht online.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'darkgreen', 'Einreiseamt', 'Du bist nicht im Dienst.')
        end

    end
end)
 




RegisterCommand('einreise', function(source, args)
    local target = tonumber(args[1])
    local xTarget = ESX.GetPlayerFromId(target)
   
    getAdminLevel(source)
    if permlevel[source] > 89 then
        if einreiseDuty[source] == 1 then
            if xTarget ~= nil then
                local xPlayer = ESX.GetPlayerFromId(source)
                local identifier = xPlayer.getIdentifier()
                local targetidentifier = xTarget.getIdentifier()
                local modname = GetPlayerName(source)
                local pname = GetPlayerName(target)
                local einreise = MySQL.Sync.fetchScalar("SELECT einreise FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local xPlayer = ESX.GetPlayerFromId(source)
                local identifier = xPlayer.getIdentifier()
                if einreise ~= 1 then
                    MySQL.Sync.fetchScalar("UPDATE users SET einreise = '1' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    TriggerClientEvent('glmp_notify', source, 'darkgreen', 'Einreiseamt', 'Du hast '.. rpname ..' sein Visum gewährt.')
                    TriggerClientEvent('byte_einreise:bestanden', args[1])
                    sendLog('einreise', 'EINREISE', 'Der Spieler '.. rpname .. ' ('.. xTarget.getName() ..') wurde von '.. xPlayer.getName() .. ' eingereist.')
                else
                    TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist bereits eingereist.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Der Spieler ist nicht online.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'darkgreen', 'Einreiseamt', 'Du bist nicht im Dienst.')
        end
    end
end)
 
einreiseDuty = {}

RegisterCommand('einreiseamt', function(source)
    getAdminLevel(source)
    if permlevel[source] > 89 then
        TriggerClientEvent('byte:einreiseDuty', source)
        if einreiseDuty[source] == nil then
            einreiseDuty[source] = 1 
        elseif einreiseDuty[source] == 0 then
            einreiseDuty[source] = 1 
        elseif einreiseDuty[source] == 1 then
            einreiseDuty[source] = 0 
        end 
    end
end)

RegisterCommand('einreiseamtother', function(source, args)
    getAdminLevel(source)
    if permlevel[source] > 97 then
        local xTarget = ESX.GetPlayerFromId(args[1])
        if xTarget ~= nil then
            TriggerClientEvent('byte:einreiseDuty', args[1])
            if einreiseDuty[args[1]] == nil then
                einreiseDuty[args[1]] = 1 
                TriggerClientEvent('glmp_notify', source, "red", "EINREISEAMT (ADMIN)", "Du hast den Spieler ".. xTarget.getName() .. " in den Dienst versetzt.")
            elseif einreiseDuty[args[1]] == 0 then
                einreiseDuty[args[1]] = 1 
                TriggerClientEvent('glmp_notify', source, "red", "EINREISEAMT (ADMIN)", "Du hast den Spieler ".. xTarget.getName() .. " in den Dienst versetzt.")

            elseif einreiseDuty[args[1]] == 1 then
                einreiseDuty[args[1]] = 0 
                TriggerClientEvent('glmp_notify', source, "red", "EINREISEAMT (ADMIN)", "Du hast den Spieler ".. xTarget.getName() .. " aus dem Dienst versetzt.")
            end 
            
        else
            TriggerClientEvent('glmp_singlenotify', source, "red", "Der Spieler ist nicht online!")
        end 
    end
end)



---

