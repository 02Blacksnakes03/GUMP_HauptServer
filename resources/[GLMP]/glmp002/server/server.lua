NeueESXVersion = false


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ads = {}


ESX.RegisterServerCallback('byte:hasPhone', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = xPlayer.getInventoryItem("phone")
    if item.count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('byte:hasFunk', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = xPlayer.getInventoryItem("radio")
    if item.count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)
cooldown = {}
RegisterServerEvent('AddWerbung')
AddEventHandler('AddWerbung', function(title, msg)
     local src = source
     local xPlayer = ESX.GetPlayerFromId(src)
     if xPlayer ~= nil then 
        if cooldown[xPlayer.source] ~= 1 then
            adIf = 0
            adId = math.random(1,123123123123)
            ads[math.random(1,1231231231233)] = {
                id = adId,
                title = "Lifeinvader", 
                content = msg ..'$$$$' ..title
            }
            TriggerClientEvent('glmp_notify', -1, 'yellow', 'Lifeinvader', 'Es wurde eine neue Anzeige veröffentlicht.')
            TriggerEvent('byte:sendLog', 'lifeinvader', 'Neue Werbung', 'Der Spieler **'.. xPlayer.getName() ..' (ID: '.. src .. ')** hat eine neue Werbung veröffentlicht.\n\n**Message:** '.. msg ..'\n**Nummer:** '.. title .. '\n**ID:** '.. adId)
            cooldown[xPlayer.source] = 1
            Wait(5 * 60000) 
            cooldown[xPlayer.source] = 0
        else
            TriggerClientEvent('glmp_notify', xPlayer.source, 'yellow', 'Lifeinvader', 'Du kannst nur alle 5 Minuten eine Anzeige schalten.')
        end
    end
end)
 
RegisterNetEvent('LifeInvaderApp_requestAd')
AddEventHandler('LifeInvaderApp_requestAd', function()
    TriggerClientEvent('Lifeinvader', source, ads)
end)

RegisterNetEvent('clearLifeInvaderApp_requestAd')
AddEventHandler('clearLifeInvaderApp_requestAd', function()
    ads = {}
    TriggerClientEvent('Lifeinvader', source, ads)
end)

ESX.RegisterServerCallback("matthias:getNumber", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
            cb(result[1].phone_number)
        end
    end)
end)


ESX.RegisterServerCallback("getProfilDaten", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then

			local data = {
				vorname = result[1].firstname,
                nachname = result[1].lastname,
                level = result[1].level,
                id = xPlayer.source,
                fraktion = xPlayer.job.label,
                handynummer = result[1].phone_number,
                spielstunden = 1
			}
			cb(data)
		end
	end)
end)


ESX.RegisterServerCallback('antiafk:kick', function(source, cb)
    DropPlayer(source, "Du wurdest ausgeloggt! \n Aufgrund das du längere Zeit AFK warst, wurdest du automatisch ausgeloggt.")
end)

ESX.RegisterServerCallback('byte:getFlugmodus', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local flug = MySQL.Sync.fetchScalar("SELECT flugmodus FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if flug == '0' then
        cb(false)
    else
        cb(true)
    end
end)

ESX.RegisterServerCallback('mdev:loadProfileAppHandy', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['identifier'] = xPlayer.getIdentifier()}, function(result)
       
        local adminRank = result[1].adminRank
        local data = {
        ["Name"] = result[1].firstname .. '_' .. result[1].lastname,
        --["Geburtsdatum"] = result[1].dateofbirth, 
        
        ["Telefonnummer"] = result[1].phone_number,
        ["Team"] = xPlayer.getJob().label,
        
        ["TeamRang"] = xPlayer.getJob().grade,
        
        ["Level"] = result[1].level,
        ["GWDNote"] = result[1].gwdnote,
        ["LSPDGABNote"] = result[1].academynote,
        ["GLMP"] = result[1].adminRank, 
        ["BiszumPayDay"] = result[1].playminutes .. ' Minuten'
        }
 
        cb(data)
    end) 
end)



RegisterServerEvent('addDispatch')
AddEventHandler('addDispatch', function(fraktion, message, phonenumber, posX, posY)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
     number = 'Fehler'
    if phonenumber == true then
         number = MySQL.Sync.fetchScalar("SELECT phone_number FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    else  
         number = 'Nicht Angegeben'
    end
    local frak = MySQL.Sync.fetchScalar("SELECT label FROM jobs WHERE name = @identifier", { ['@identifier'] = fraktion})
    local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    local dpatch = MySQL.Sync.fetchScalar("SELECT name FROM dispatches WHERE name = @identifier", { ['@identifier'] = rpname})
    if dpatch == nil then
        MySQL.Sync.fetchScalar("INSERT INTO dispatches (name, message, number, posX, posY, fraktion, identifier) VALUES (@name, @msg, @number, @posX, @posY, @frak, @identifier)", { ['@name'] = rpname, ['@msg'] = message, ['@number'] = number, ['@posX'] = posX, ['@posY'] = posY, ['@frak'] = fraktion, ['@identifier'] = xPlayer.getIdentifier()}) 
        TriggerClientEvent('glmp_notify', src, '', '', 'Dein Dispatch wurde abgesendet.')    
        TriggerEvent('byte:sendLog', 'dispatch', 'Neuer Dispatch', 'Der Spieler '.. xPlayer.getName() ..' (ID: '.. src .. ') hat einen dispatch Abgesendet.\n\n**Message:** '.. message ..'\n**Nummer:** '.. number ..'\n**Fraktion:** '.. fraktion)
        TriggerEvent('sendFraktionInfo', frak, 'Ein neuer Notruf von '.. rpname .. ' (Grund: '.. message .. ') ist eingegangen!')
        --print(fraktion)
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast bereits einen Dispatch abgesendet.')
    end
end) 

RegisterServerEvent('cancelDispatches')
AddEventHandler('cancelDispatches', function() 
    --print("canceled dispatches")
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Sync.fetchScalar("DELETE FROM dispatches WHERE identifier = @identifier", {['@identifier'] = xPlayer.getIdentifier()}) 
    TriggerClientEvent('glmp_notify', src, '', 'NOTRUF ZENTRALE', 'Deine Anfragen wurden abgebrochen.')   
    TriggerEvent('byte:sendLog', 'dispatch', 'Dispatch Abgebrochen', 'Der Spieler '.. xPlayer.getName() ..' (ID: '.. src .. ') hat seine Dispatches geschlossen.')
end) 
currentCall2 = {}
RegisterNetEvent('endCall')
AddEventHandler('endCall', function()
    local src = source  
    if currentCall2[src] == nil then
        TriggerClientEvent('endCallC', currentCall[src])
        sound = false
    end
    --print(currentCall2[src])
    --print(currentCall[src])
    --print(currentCall2[currentCall2[src]])
--    TriggerClientEvent('endCallC', currentCall2[src])
    exports['saltychat']:EndCall(currentCall2[src], src)
    exports['saltychat']:EndCall(src, currentCall2[src])
    currentCall2[src] = nil 
    currentCall2[currentCall2[src]] = nil
    sound = false
    
    
end)

RegisterNetEvent('acceptCall')
AddEventHandler('acceptCall', function()
    if currentCall[source] == nil then
        sound = false
    else
        TriggerClientEvent('callacc1', currentCall[source])
        exports['saltychat']:EstablishCall(source, currentCall[source])
        currentCall2[source] = currentCall[source]
        currentCall2[currentCall[source]] = source
        currentCall[source] = nil
        currentCall2[currentCall[source]] = nil
    end
end)



currentCall = {}
RegisterNetEvent('startCall')
AddEventHandler('startCall', function(number)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE phone_number = @num', {['num'] = number}, function(result)
        if result[1] then
            local id = result[1].identifier
            local tPlayer = ESX.GetPlayerFromIdentifier(id)
            if tPlayer and tPlayer.identifier ~= xPlayer.identifier then
                local flugmodus = MySQL.Sync.fetchScalar("SELECT flugmodus FROM users WHERE identifier = @identifier", { ['@identifier'] = tPlayer.getIdentifier()})
                local executedNumber = MySQL.Sync.fetchScalar("SELECT phone_number FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
                if flugmodus == '0' then
                    local blockcalls = MySQL.Sync.fetchScalar("SELECT anrufeablehnen FROM users WHERE identifier = @identifier", { ['@identifier'] = tPlayer.getIdentifier()})
                    local playerCName = MySQL.Sync.fetchScalar("SELECT name FROM phone_contacts WHERE identifier = @identifier AND number = @number", { ['@identifier'] = tPlayer.getIdentifier(), ['@number'] = executedNumber})
                    if playerCName ~= nil then
                        showCPName = playerCName
                    else
                        showCPName = executedNumber
                    end  


                    local targetCName = MySQL.Sync.fetchScalar("SELECT name FROM phone_contacts WHERE identifier = @identifier AND number = @number", { ['@identifier'] = xPlayer.getIdentifier(), ['@number'] = number})
                    if targetCName ~= nil then
                        showCTName = targetCName
                    else
                        showCTName = number
                    end  
                    if blockcalls == '0' then
                        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['identifier'] = xPlayer.getIdentifier()}, function(result2)
                        tdata = {
                            name = showCPName,
                            method = 'incoming',
                            caller = result2[1].phone_number,
                            callerid = tPlayer.source,
                            receiverid = xPlayer.source,
                            acceptnumber = result[1].phone_number
                        }
                        odata = {
                            name = showCTName,
                            method = 'outgoing',
                            caller = result[1].phone_number,
                            callerid = tPlayer.source,
                            receiverid = xPlayer.source,
                            acceptnumber = result2[1].phone_number
                        }
                        TriggerClientEvent('callReceive', tPlayer.source, tdata)
                        TriggerClientEvent('callReceive', xPlayer.source, odata)
                        currentCall[xPlayer.source] = tPlayer.source
                        currentCall[tPlayer.source] = xPlayer.source
                        --recentcalls = recentcalls .. string.format('<div class="phone-all-call-sector-selection" data-number="%s"><div class="phone-all-call-sector-selection-text"><font style="color: gray;"> %s </font><br> %s</div><div class="phone-all-call-sector-selection-recall"><i id="pacs-message" data-number="%s"   style="margin-top: 2.5vh; margin-left: 1vh" class="fas fa-envelope pacs-icon"></i><i id="pacs-call" data-number="%s" class="fas fa-phone pacs-icon"></i></div></div>', v.receiver, _U("incomingcall") ,contactname, v.receiver, v.receiver)
                        end)
                        TriggerClientEvent('sendPlayerNotification', tPlayer.source, "normal", "", 'Du wirst Angerufen', "", 5000)
                         sound = true
                         fickieeadfas(tPlayer.source)
                      -- TriggerClientEvent('InteractSound_CL:PlayOnOne', tPlayer.source, 'ring2', 1)
                        
                        

                    else
                        TriggerClientEvent('sendPlayerNotification', xPlayer.source, "normal", "", 'Die gewählte Rufnummer nimmt derzeitig keine Anrufe entgegen.', "", 5000)
                    end
                else
                    TriggerClientEvent('sendPlayerNotification', xPlayer.source, "normal", "", 'Die gewählte Rufnummer ist derzeit nicht verfügbar. (Flugmodus)', "", 5000)
                end
            else

               -- TriggerClientEvent('pnotify', xPlayer.source, "Telefon", 'Die gewählte Rufnummer ist derzeit nicht verfügbar', 'red')
                TriggerClientEvent('sendPlayerNotification', xPlayer.source, "normal", "", 'Die gewählte Rufnummer ist derzeit nicht verfügbar.', "", 5000)
            end
        else
            TriggerClientEvent('sendPlayerNotification', xPlayer.source, "normal", "", 'Die gewählte Rufnummer ist nicht vergeben.', "", 5000)
        end
    end)
end)



function fickieeadfas(adad)
    if not sound then
       -- print("sound ist nicht aktiviert")
        return
    end
Citizen.CreateThread(function()
    while sound do
        Citizen.Wait(3800)
       -- local source = source
       -- --local aloooo = source
       --- local xPlayer = ESX.GetPlayerFromId(source)
       -- local tPlayer = ESX.GetPlayerFromIdentifier(id)
                --if sound then
                    --print("alooo")
            TriggerClientEvent('InteractSound_CL:PlayOnOne', adad, 'ring2', 1)
           -- print("anruf")
       -- else
      --      Citizen.Wait(500)
       -- end
    end
end)
end


ESX.RegisterServerCallback('isPlayerinBusiness', function(source, cb)
    local bus = MySQL.Sync.fetchScalar("SELECT business FROM users WHERE identifier = @identifier", { ['@identifier'] = ESX.GetPlayerFromId(source).getIdentifier()})
    if bus == "Keins" then
        cb('no')
    else 
        cb(bus)
    end 
end)

RegisterServerEvent('business:leave')
AddEventHandler('business:leave', function(business)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Sync.fetchScalar("UPDATE users SET business = 'Keins' WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})  
    MySQL.Sync.fetchScalar("UPDATE users SET businessRank = 0 WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})  
    TriggerClientEvent('glmp_notify', src, 'darkgrey', 'BUSINESS', 'Du hast das Business erfolgreich verlassen!')
    local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    TriggerEvent('business:sendMsg', business, rpname .. ' hat das Business verlassen.')
end)

RegisterServerEvent('business:kickMember')
AddEventHandler('business:kickMember', function(id, name, manage, b)
    
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    local brank = MySQL.Sync.fetchScalar("SELECT businessRank FROM users WHERE identifier = @identifier", { ['@identifier'] = ESX.GetPlayerFromId(source).getIdentifier()})

    if brank >= 1 then
        --print(manage)
        if manage == 1 then
            if brank ~= 2 then
                TriggerClientEvent('glmp_notify', src, 'darkgrey', 'BUSINESS', 'Keine Rechte!')
                return
            end
        end  
        if brank > 0 then
            local xMember = ESX.GetPlayerFromId(id)
            if xMember.getIdentifier() == xPlayer.getIdentifier() then
                TriggerClientEvent('glmp_notify', src, 'darkgrey', 'BUSINESS', 'Du kannst dich nicht selbst entlassen!')
                return
            end
            MySQL.Sync.fetchScalar("UPDATE users SET business = 'Keins' WHERE identifier = @identifier", { ['@identifier'] = xMember.getIdentifier()})  
            MySQL.Sync.fetchScalar("UPDATE users SET businessRank = 0 WHERE identifier = @identifier", { ['@identifier'] = xMember.getIdentifier()})  
            TriggerClientEvent('glmp_notify', xMember.source, 'darkgrey', 'BUSINESS', 'Du wurdest entlassen!')
            local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
            TriggerEvent('business:sendMsg', b, rpname .. ' hat '.. name .. ' entlassen.')
        else
            TriggerClientEvent('glmp_notify', src, 'darkgrey', 'BUSINESS', 'Keine Rechte!')
        end
    end
end)

RegisterServerEvent('business:setMotd')
AddEventHandler('business:setMotd', function(business, motd)
    local src = source
    local rank = MySQL.Sync.fetchScalar("SELECT businessRank FROM users WHERE identifier = @identifier", { ['@identifier'] = ESX.GetPlayerFromId(src).getIdentifier()})
    if rank > 0 then
        TriggerClientEvent('glmp_notify', src, 'darkgrey', 'BUSINESS', 'Die MOTD wurde erfolgreich geändert!')
        MySQL.Sync.fetchScalar("UPDATE business SET motd = @motd WHERE name = @business", { ['@motd'] = motd, ['@business'] = business})
    else
        TriggerClientEvent('glmp_notify', src, 'darkgrey', 'BUSINESS', 'Keine Rechte!')
    end
end)
ESX.RegisterServerCallback('business:requestMembers', function(source, cb, bus)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()

    MySQL.Async.fetchAll("SELECT * FROM users WHERE business = @business", {['@business'] = bus}, function(result)
        members = {}
        ld = 0
        managePerms = 0
		for i = 1, #result, 1 do
            ld = ld + 1 
            if result[i].identifier == identifier then
                managePerms = result[i].businessRank
            end
            local xMember = ESX.GetPlayerFromIdentifier(result[i].identifier)
            if xMember ~= nil then
                isOwner = false 
                isManage = 0 
                if result[i].businessRank > 0 then
                    isManage = 1
                end
                if result[i].businessRank == 2 then
                    isOwner = true
                end
                table.insert(members, {id = xMember.source, name = result[i].firstname .. '_' .. result[i].lastname ,rank = result[i].businessRank, number = result[i].phone_number, manage = isManage, owner = isOwner})
            end 
		end 
        Wait(100)  
        --print("loaded ".. ld .. ' business members')
        local member = {
            ManagePermission = managePerms,
            BusinessMemberList = members
        }
		cb(member) 
	end)
end)

RegisterServerEvent('business:sendMsg')
AddEventHandler('business:sendMsg', function(business, msg)
    --print("send message for ".. business .. " busines! ".. msg)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE business = @business", {['@business'] = business}, function(result)
        
		for i = 1, #result, 1 do 
            ld = ld + 1 
            
            local xMember = ESX.GetPlayerFromIdentifier(result[i].identifier)
            if xMember ~= nil then
               TriggerClientEvent('glmp_notify', xMember.source, 'darkgrey', 'BUSINESS', msg)
            end 
		end 
        
	end)
end)

RegisterServerEvent('business:acceptInvite')
AddEventHandler('business:acceptInvite', function( business, inviter )
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src) 
    local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    MySQL.Sync.fetchScalar("UPDATE users SET business = @business WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier(), ['@business'] = business})  
    MySQL.Sync.fetchScalar("UPDATE users SET businessRank = 0 WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})   
    TriggerEvent('business:sendMsg', business, rpname .. ' ist jetzt ein Mitglied ~' .. business)  
end)
RegisterServerEvent('business:invitePlayer')
AddEventHandler('business:invitePlayer', function(targetName, business)
    local src = source
    local first, last = targetName:match("([^_]+)_([^_]+)")
    local ident = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
    if ident ~= nil then
         
        local xTarget = ESX.GetPlayerFromIdentifier(ident)
        if xTarget ~= nil then 
            if admindienst[xTarget.source] ~= true then
                local b =  MySQL.Sync.fetchScalar("SELECT business FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
                if b == 'Keins' then
                    local xPlayer = ESX.GetPlayerFromId(src)
                    
                    local inviter = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
                    TriggerClientEvent('business:sendPlayerInvite', xTarget.source, business, inviter)
                    TriggerClientEvent('glmp_singlenotify', src, "", "Du hast ".. targetName .. ' in das Business eingeladen.s')
                else
                    TriggerClientEvent('glmp_singlenotify', src, "", "Der Spieler ist bereits in einem Business!")
                end
            else
                TriggerClientEvent('glmp_singlenotify', src, "", "Der Spieler ist nicht online!11")
            end
        else

            TriggerClientEvent('glmp_singlenotify', src, "", "Der Spieler ist nicht online!")
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Der Spieler exestiert nicht.')
    end       

end)
ESX.RegisterServerCallback('business:requestMotd', function(source, cb, bus)
    
    local bus = MySQL.Sync.fetchScalar("SELECT motd FROM business WHERE name = @identifier", { ['@identifier'] = bus})
    cb(bus)
end)


ESX.RegisterServerCallback('isPlayerinFrak', function(source, cb)
    if ESX.GetPlayerFromId(source).getJob().name == "unemployed" then
        cb(0)
    else
        cb(1)
    end
end)



admindienst = {}
RegisterNetEvent('byte:toggleExternAduty')
AddEventHandler('byte:toggleExternAduty', function(pid)
    --print(source)
    local src = pid
    if admindienst[src] == nil then
        admindienst[src] = true
        --print("set aduty true for ".. src)
    elseif admindienst[src] == false then
        admindienst[src] = true
        --print("set aduty true for ".. src)
    elseif admindienst[src] == true then
        admindienst[src] = false
        --print("set aduty false for ".. src)
    end 

end)

RegisterNetEvent('requestTeamMembers')
AddEventHandler('requestTeamMembers', function(number)
    local src = source
    local xPlayers = ESX.GetPlayers()
    local members = {}
    local job = ESX.GetPlayerFromId(source).getJob().name
    if ESX.GetPlayerFromId(source).getJob().name == "unemployed" then
        local xPlayer = ESX.GetPlayerFromId(source)
        TriggerClientEvent('pnotify', xPlayer.source, "Fraktion", 'Du bist in keiner Fraktion', 'red')
        return
    end
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        local id = xPlayer.getIdentifier()
        if xPlayer.getJob().name == job then
            --[[members[xPlayer.source] = {
                name = xPlayer.getJob().name,
                number = "1234"
            }]]
            local bankrechte = MySQL.Sync.fetchScalar("SELECT frak_perms_bank FROM users WHERE identifier = @identifier", { ['@identifier'] = id})
            local managerechte = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = id})
            local inventoryrechte = MySQL.Sync.fetchScalar("SELECT frak_perms_lager FROM users WHERE identifier = @identifier", { ['@identifier'] = id})
            local inviterechte = MySQL.Sync.fetchScalar("SELECT frak_perms_invite FROM users WHERE identifier = @identifier", { ['@identifier'] = id})
            if bankrechte == 1 then
                bankPerms = true
            else
                bankPerms = false
            end
            if managerechte == 1 then
                managePerms = true
            else
                managePerms = false
            end
            if inventoryrechte == 1 then
                invPerms = true
            else
                invPerms = false
            end
            if inviterechte == 1 then
                invitePerms = true
            else
                invitePerms = false
            end
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = id }, function(result)
                if result[1] then 
                    if admindienst[xPlayer.source] ~= true then
                        table.insert(members, {id=xPlayer.source, name=result[1].firstname .. "_" .. result[1].lastname, number=result[1].phone_number, rank=xPlayer.getJob().grade, manage=managePerms, bank=bankPerms, inventory=invPerms, invite=invitePerms})
                    end
                end
            end)
        end
        
    end
    Wait(150)
    local managePerms1 = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = ESX.GetPlayerFromId(src).getIdentifier()})
    if managePerms1 == 1 then
        ManagePermission1 = 2
    else
        local managePerms2 = MySQL.Sync.fetchScalar("SELECT frak_perms_invite FROM users WHERE identifier = @identifier", { ['@identifier'] = ESX.GetPlayerFromId(src).getIdentifier()})
        if managePerms2 == 1 then 
            ManagePermission1 = 2
        else
            ManagePermission1 = 0
        end
    end
    Wait(5)
    local member = {
        ManagePermission = ManagePermission1,
        TeamMemberList = members
    }
    TriggerClientEvent("responseTeamMembers", src, member)
end)


RegisterNetEvent('team:kickMember')
AddEventHandler('team:kickMember', function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(id)
    --[[if xPlayer.getJob().grade >= 10 then
        TriggerClientEvent('pnotify', xPlayer.source, "Team", "Du hast " .. GetPlayerName(tPlayer.source) .. " aus der Fraktion " .. xPlayer.getJob().label .. " geworfen", "green")
        tPlayer.setJob("unemployed", 0)
    else
        TriggerClientEvent('pnotify', xPlayer.source, "Team", 'Hierzu hast du keine Berechtigung', "red")
    end]]
    TriggerEvent('byte:uninvitePlayer', source, id)
end)

RegisterNetEvent('updateTeamMember')
AddEventHandler('updateTeamMember', function(id, grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(id)
    --[[if xPlayer.getJob().grade >= 10 then
        TriggerClientEvent('pnotify', xPlayer.source, "Team", "Du hast " .. GetPlayerName(tPlayer.source) .. " auf Rang " .. grade .. " gesetzt (sofern der Rang existiert)", "green")
        tPlayer.setJob(tPlayer.getJob().name, grade)
    else
        TriggerClientEvent('pnotify', xPlayer.source, "Team", "Hierzu hast du keine Rechte", "red")
    end]]
    TriggerEvent('byte:setGrade', source, id, grade)
end)

ESX.RegisterServerCallback('loadGPSPoints', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local hId = MySQL.Sync.fetchScalar("SELECT id FROM houses WHERE ownerID = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if hId ~= nil then
        local posX = MySQL.Sync.fetchScalar("SELECT posX FROM houses WHERE id = @identifier", { ['@identifier'] = hId})
        local posY = MySQL.Sync.fetchScalar("SELECT posY FROM houses WHERE id = @identifier", { ['@identifier'] = hId})
        cb({posY, posX, hId})
    else
        cb({0, 0, 0})
    end
end)
ESX.RegisterServerCallback("mdev_phone:ownsveh", function(source, cb, plate)
    local hasveh = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate AND owner = @owner AND gps = 1', { ['@plate'] = plate, ['@owner'] = xPlayer.getIdentifier() }, function(result)
        if result[1] then
            cb(true)
        else
            cb(false)
        end
    end)
end)

ESX.RegisterServerCallback("mdev_phone:ownsvehkeys", function(source, cb, plate)
    local hasveh = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate AND keyowner = @owner AND gps = 1', { ['@plate'] = plate, ['@owner'] = xPlayer.getIdentifier() }, function(result)
        if result[1] then
            cb(true)
        else
            cb(false)
        end
    end)
end)


ESX.RegisterServerCallback("mdev_phone:frakvehs", function(source, cb, plate)
    local hasveh = {}
    local xPlayer = ESX.GetPlayerFromId(source) 
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate AND fraktion = @owner', { ['@plate'] = plate, ['@owner'] = xPlayer.getJob().name }, function(result)
        if result[1] then
            cb(true)
        else
            cb(false)
        end
    end)
end)


ESX.RegisterServerCallback('handy:saveSettings', function(source, cb, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
            MySQL.Sync.execute("UPDATE `users` SET `phone_settings`=@settings WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@settings'] = json.encode(data)})
		end
	end)
end)


ESX.RegisterServerCallback('handy:requestWallpaper', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent('checkNum', source)
    MySQL.Async.fetchAll('SELECT wallpaper FROM users WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
            cb(result[1].wallpaper)
		end
	end)
end)

--[[RegisterCommand("taxi", function(source, args, rawCommand)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    if args[1] == "off" then
        MySQL.Async.fetchAll('SELECT * FROM phone_taxis WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
            if result[1] ~= nil then
                MySQL.Sync.execute("DELETE FROM `phone_taxis` WHERE `identifier` = @identifier", {['@identifier'] = xPlayer.identifier})
            else
                TriggerClientEvent('pnotify', xPlayer.source, "Taxi", "Du bist nicht angemeldet", "red")
            end
        end)
    elseif args[1] == "on" then
        MySQL.Async.fetchAll('SELECT * FROM phone_taxis WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
            if result[1] ~= nil then
                TriggerClientEvent('pnotify', xPlayer.source, "Taxi", "Du bist bereits angemeldet", "red")
            else
                MySQL.Sync.execute("INSERT INTO `phone_taxis` (identifier, name, number, price) VALUES (@id, @name, @num, @price)", {['@id'] = xPlayer.identifier, ['name'] = GetPlayerName(xPlayer.source), ['num'] = args[3], ['price'] = args[2]})
            end
        end)
    else
        TriggerClientEvent('pnotify', xPlayer.source, "Taxi", "Ungültiger Status. Verwende /taxi [on/off] [preis] [nummer] zB /taxi on 2000 oder /taxi off", "red")
    end
end, false)--]]

ESX.RegisterServerCallback('byte_taxi:hasPBS', function(source, cb, type)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local pbs = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.identifier, ['@type'] = type})
    if pbs ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
RegisterNetEvent('taxi')
AddEventHandler('taxi', function(state, price)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    if state == "off" then
        MySQL.Async.fetchAll('SELECT * FROM phone_taxis WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
            if result[1] ~= nil then
                MySQL.Sync.execute("DELETE FROM `phone_taxis` WHERE `identifier` = @identifier", {['@identifier'] = xPlayer.identifier})
                TriggerClientEvent('pnotify', xPlayer.source, "Taxi Zentrale", "Du bist nun abgemeldet.", "yellow")
                TriggerEvent('byte:sendLog', 'taxi', 'Taxi Anmeldung', xPlayer.getName() .. ' meldet sich ab.')
            else 
                TriggerClientEvent('pnotify', xPlayer.source, "Taxi Zentrale", "Du bist nicht angemeldet", "yellow")
            end
        end)
    elseif state == "on" then
       
        MySQL.Async.fetchAll('SELECT * FROM phone_taxis WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
            if result[1] ~= nil then
                TriggerClientEvent('pnotify', xPlayer.source, "Taxi Zentrale", "Du bist bereits angemeldet.", "yellow")
            else
                TriggerClientEvent('pnotify', xPlayer.source, "Taxi Zentrale", "Du bist nun angemeldet.", "yellow")
                TriggerEvent('byte:sendLog', 'taxi', 'Taxi Anmeldung', xPlayer.getName() .. ' meldet sich mit einem Preis von '.. price .. '$ an.')
                local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
                local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
                local rpname = firstname .. '_' .. lastname
                MySQL.Sync.execute("INSERT INTO `phone_taxis` (identifier, name, number, price) VALUES (@id, @name, @num, @price)", {['@id'] = xPlayer.identifier, ['name'] = rpname, ['num'] = '/', ['price'] = price})
            end
        end)
    end
end)



RegisterServerEvent('checkNum')
AddEventHandler('checkNum', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
        if result[1] then
            if result[1].phone_number == nil then
                local number = math.random(10000, 99999)
                MySQL.Async.fetchAll('SELECT * FROM users WHERE `phone_number` = @num', {['@num'] = number}, function(result)
                    if result[1] == nil then
                        MySQL.Sync.execute("UPDATE `users` SET `phone_number` = @number WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@number'] = number})
                    else
                        TriggerEvent('checknum', src)
                    end
                end)
            end
        end
    end)
end)

ESX.RegisterServerCallback('handy:getTaxiList', function(source, cb)
    local taxis = {}
    MySQL.Async.fetchAll('SELECT * FROM phone_taxis', {}, function(result)
		for k,v in pairs(result) do
            local x = ESX.GetPlayerFromIdentifier(v.identifier)
            if admindienst[x.source] ~= true then
                table.insert(taxis, {name = v.name, number = v.number, price = v.price})
            end
		end
	end)
    Wait(100)
    cb(taxis)
end)

ESX.RegisterServerCallback('handy:getTaxiServices', function(source, cb)
    local requests = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT requests FROM phone_taxis WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
        if result[1] ~= nil then
            if result[1].requests == nil then
                requests = {}
                cb(requests, false)
            else
                cb(json.decode(result[1].requests), true)
            end
        else
            requests = {}
            cb(requests, false)
        end
	end)
end)

local id = 1

ESX.RegisterServerCallback('handy:addTaxiService', function(source, cb, name, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    id = id + 1
    MySQL.Async.fetchAll('SELECT * FROM phone_taxis WHERE `name` = @name', {['@name'] = name}, function(result)
        if result[1].requests == nil then
            local requests = {}
            table.insert(requests, {id = id, name = xPlayer.name, message = message})
            MySQL.Sync.execute("UPDATE `phone_taxis` SET `requests`=@requests WHERE name=@name", {['@name'] = name, ['@requests'] = json.encode(requests)})
        else
            local requests = json.decode(result[1].requests)
            local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
            local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
            local rpname = firstname .. '_' .. lastname
            table.insert(requests, {id = id, name = rpname, message = message, playerid = xPlayer.source})
            MySQL.Sync.execute("UPDATE `phone_taxis` SET `requests`=@requests WHERE name=@name", {['@name'] = name, ['@requests'] = json.encode(requests)})
        end
        local taxiFahrer = ESX.GetPlayerFromIdentifier(result[1].identifier)
        
        TriggerClientEvent('pnotify', taxiFahrer.source, "Taxi Zentrale", "Du hast eine neue Anfrage erhalten.", "yellow")
    end) 
    Wait(100)
    cb(true)
end)

ESX.RegisterServerCallback('handy:acceptService', function(source, cb, id, pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local requests = {}
    MySQL.Async.fetchAll('SELECT * FROM phone_taxis WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
        if result[1].requests == nil then
            requests = {}
        else
            requests = json.decode(result[1].requests)
        end
        TriggerClientEvent('pnotify', pid, "Taxi Zentrale", "Deine Anfrage wurde entgegen genommen.", "yellow")
	end)
    Wait(100)
    removebyKey(requests, id) 
    
    MySQL.Sync.execute("UPDATE `phone_taxis` SET `requests`=@requests WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@requests'] = json.encode(CleanNils(requests))})
    Wait(100)
    cb(true)
end)


function removebyKey(tab, val)
    for i, v in ipairs (tab) do 
        if (v.id == val) then
            tab[i] = nil
        end
    end
end

ESX.RegisterServerCallback('saveWallpaper', function(source, cb, wallpaper)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Sync.execute("UPDATE `users` SET `wallpaper`= @wallpaper WHERE identifier=@identifier", {['@identifier'] = xPlayer.identifier, ['@wallpaper'] = wallpaper}, function(result)
	end)
end)

function CleanNils(t)
    local ans = {}
    for _,v in pairs(t) do
      ans[ #ans+1 ] = v
    end
    return ans
end

ESX.RegisterServerCallback('matthias:getBankData', function(source, cb, wallpaper)
    local xPlayer = ESX.GetPlayerFromId(source)
    local obj = {
        balance = xPlayer.getAccount('bank').money,
        history = {}
    }
    MySQL.Async.fetchAll('SELECT * FROM phone_bankhistory WHERE identifier = @identifier', {['identifier'] = xPlayer.getIdentifier()}, function(result)
        for i=1, #result, 1 do
            obj.history[math.random(1, 1231245)] = {
                name = result[i].reason,
                value = result[i].amount
            }
        end
    end)
    Wait(250)
    cb(obj)
    obj = nil
end)



RegisterNetEvent('addContact')
AddEventHandler('addContact', function(obj)
    local xPlayer = ESX.GetPlayerFromId(source)
    local obj = json.decode(obj)
    local src = source
    MySQL.Async.execute('INSERT INTO phone_contacts (identifier, name, number) VALUES (@id, @name, @number)',
    { ['id'] = xPlayer.getIdentifier(), ['name'] = obj.name, ['number'] = obj.number},
    function(affectedRows)
        TriggerClientEvent('udate', src)
    end)
end)

RegisterNetEvent('removeContact')
AddEventHandler('removeContact', function(number)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.execute("DELETE FROM phone_contacts WHERE identifier = @id AND number = @number", {['id'] = xPlayer.identifier, ['number'] = number})
    TriggerClientEvent('udate', xPlayer.source, true)
end)

RegisterNetEvent('transferMoney')
AddEventHandler('transferMoney', function(id, amount)
    local src = source
    local first, last = id:match("([^_]+)_([^_]+)")
    local ident = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
    local xPlayer = ESX.GetPlayerFromId(src) 
    if ident ~= nil then 
        
        local xTarget = ESX.GetPlayerFromIdentifier(ident)
        if xTarget ~= nil then

            if admindienst[xTarget.source] ~= true then
                if xPlayer.getAccount("bank").money >= amount then
                    TriggerClientEvent('pnotify', src, "", "Verarbeite Zahlung...", "orange")
                    xPlayer.removeAccountMoney('bank', amount)
                    Wait(1000)
                    xTarget.addAccountMoney('bank', amount)
                    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
                    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.identifier})
                    local rpname = firstname .. '_' .. lastname

                    local tfirstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xTarget.identifier})
                    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xTarget.identifier})
                    local trpname = tfirstname .. '_' .. tlastname
                    TriggerClientEvent('glmp_singlenotify', src, "", "Du hast " .. trpname .. " " .. amount .. "$ überwiesen")
                    TriggerClientEvent('glmp_singlenotify', xTarget.source, "", rpname .. " hat dir " .. amount .. "$ überwiesen")
                    MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
                    { ['id'] = xPlayer.getIdentifier(), ['amount'] = 0 - amount, ['reason'] = "Überweisung an " .. trpname},
                    function(affectedRows)
                    end)
                    MySQL.Async.execute('INSERT INTO phone_bankhistory (identifier, amount, reason) VALUES (@id, @amount, @reason)',
                    { ['id'] = xTarget.getIdentifier(), ['amount'] = amount, ['reason'] = "Überweisung von " .. rpname},
                    function(affectedRows)
                    end)
                else
                    TriggerClientEvent('glmp_singlenotify', src, "", "Du hast nicht genügend Geld!")
                end
            else
                TriggerClientEvent('glmp_singlenotify', src, "", "Dieser Spieler ist nicht online!")
            end

        else
            TriggerClientEvent('glmp_singlenotify', src, "", "Dieser Spieler ist nicht online!")
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, "", "Dieser Spieler exestiert nicht.")
    end
end)


RegisterNetEvent('editContact')
AddEventHandler('editContact', function(obj)
    local xPlayer = ESX.GetPlayerFromId(source)
    local obj = json.decode(obj)
    local src = source
    MySQL.Async.execute('UPDATE phone_contacts SET number = @neue, name = @neuen WHERE number = @old AND identifier = @id',
    { ['id'] = xPlayer.getIdentifier(), ['old'] = obj.storeNumber, ['neue'] = obj.editNumber, ['neuen'] = obj.editName},
    function(affectedRows)
        TriggerClientEvent('udate', src, obj.editNumber, obj.editName)
    end)
end)

ESX.RegisterServerCallback('mdev:loadSettings', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['identifier'] = xPlayer.getIdentifier()}, function(result)
        TriggerClientEvent('responsePhoneSettings', source, result[1].flugmodus, result[1].anrufeablehnen, result[1].lautlos)
        cb(true)
    end)
end)

RegisterNetEvent('savePhoneSettings')
AddEventHandler('savePhoneSettings', function(fl, ll, aa)
    --print("serve rset ps")
    local xPlayer = ESX.GetPlayerFromId(source)
    flugmodus = 0
    lautlos = 0
    anrufablehnen = 0
    if fl == true then
        flugmodus = 1
    end
    if ll == true then
        lautlos = 1
    end
    if aa == true then
        anrufablehnen = 1
    end 

    MySQL.Async.execute('UPDATE users SET flugmodus = @flugmodus, lautlos = @lautlos, anrufeablehnen = @anrufe WHERE identifier = @identifier',
    { ['flugmodus'] = flugmodus, ['lautlos'] = lautlos, ['anrufe'] = anrufablehnen, ['identifier'] = xPlayer.getIdentifier()},
    function(affectedRows)
    end)
end)



ESX.RegisterServerCallback('getKontaktDaten', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM handykontakt WHERE `identifier` = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] ~= nil then
			local data = json.decode(result[1].responseContacts)
            local ddata = {
                number = data.number,
                name = data.name
            }
			cb(ddata)
		else
			cb(data)
		end
	end)
end)




RegisterNetEvent('requestPhoneMessages')
AddEventHandler('requestPhoneMessages', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    local lastId = 1
    local contacts = {}
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.getIdentifier() }, function(result)
        if result[1] then
            local phonenum = result[1].phone_number
            MySQL.Async.fetchAll('SELECT * FROM phone_messages WHERE sender = @num OR receiver = @num ORDER BY `phone_messages`.`id` ASC', {['@num'] = phonenum}, function(result)
                for i=1, #result, 1 do
                    if result[i].sender == phonenum then
                        if contacts[result[i].receiver] == nil then
                            contacts[result[i].receiver] = {
                                id = math.random(1,234234234234),
                                messagesId = lastId,
                                messageSender = result[i].receiver,
                                messageSenderNumber = result[i].receiver,
                                lastMessage = "Gestern",
                                messages = {}
                            }
                            lastId = lastId + 1
                        end 
                        table.insert(contacts[result[i].receiver].messages, {id=math.random(1,4124124), sender=result[i].sender, receiver=result[i].receiver, date=result[i].date, message=result[i].message})
                elseif result[i].receiver == phonenum then
                        if contacts[result[i].sender] == nil then
                            contacts[result[i].sender] = {
                                messagesId = lastId,
                                messageSender = result[i].sender,
                                messageSenderNumber = result[i].sender,
                                lastMessage = "Gestern",
                                messages = {}
                            }
                            lastId = lastId + 1
                        end
                        table.insert(contacts[result[i].sender].messages, {id=math.random(1,4124124), sender=result[i].sender, receiver=result[i].receiver, date=result[i].date, message=result[i].message})
                    end
                end
            end)
            Wait(100)
            TriggerClientEvent('conts', src, contacts)
        end
    end)
end)


RegisterServerEvent('invPlayer')
AddEventHandler('invPlayer', function(id2)
    local src = source
    local tid = id2
    local xPlayer = ESX.GetPlayerFromId(src)
    local tPlayer = ESX.GetPlayerFromId(tid)
    
        if admindienst[tPlayer.source] ~= true then
            TriggerEvent('byte:invitePlayer', src, tid)
        else
            TriggerClientEvent('glmp_singlenotify', src, '', 'Dieser Spieler ist nicht online!')
        end
    
end)
handystumm = nil
RegisterNetEvent('sendPhoneMessage')
AddEventHandler('sendPhoneMessage', function(source2, msg)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    --print("DEBUG: ".. source2)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.getIdentifier() }, function(result)
        if result[1] then
            phonenum = result[1].phone_number 
            MySQL.Async.execute('INSERT INTO phone_messages (sender, receiver, message, date) VALUES (@owner, @target, @msg, @date)', { ['msg'] = msg, ['owner'] = phonenum, ['target'] = source2, ['date'] = os.date("%x") .. ' ' .. os.date("%H") .. ':' .. os.date("%M")})
            TriggerClientEvent('updatemsg', src)
            msgs = {}
            table.insert(msgs, {id=math.random(1,12312312312), sender=phonenum, receiver=source2, date=os.date("%x") .. ' ' .. os.date("%H") .. ':' .. os.date("%M"), message=msg})
            local data = {
                id=math.random(1,12312312312), sender=phonenum, receiver=source2, date=os.date("%x") .. ' ' .. os.date("%H") .. ':' .. os.date("%M"), message=msg
            }
            TriggerClientEvent('pushNewMsg', src, json.encode(data))
            local identifier = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE phone_number = @identifier", { ['@identifier'] = source2})
             handystumm = MySQL.Sync.fetchScalar("SELECT lautlos FROM users WHERE phone_number = @identifier", { ['@identifier'] = source2})
                MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = identifier }, function(result) 
                local target = ESX.GetPlayerFromIdentifier(result[1].identifier)
                if target ~= nil then 
                    --print("STUMM ".. handystumm) 
                    if handystumm == '0' then
                        flug = MySQL.Sync.fetchScalar("SELECT flugmodus FROM users WHERE phone_number = @identifier", { ['@identifier'] = source2})
                        if flug  == '0' then
                            TriggerClientEvent('sendPlayerNotification', target.source, "normal", "", "Neue SMS von " .. phonenum, "", 5000)
                        end
                    end
                    --print("send to ".. target.source)  
                end 
            end) 
        end 
    end)  
end)


RegisterNetEvent('requestPhoneContacts')
AddEventHandler('requestPhoneContacts', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    local contacts = {}
    MySQL.Async.fetchAll('SELECT * FROM phone_contacts WHERE identifier = @identifier', {['@identifier'] = xPlayer.getIdentifier() }, function(result)
        for i=1, #result, 1 do
            table.insert(contacts, {number=result[i].number, name=result[i].name})
        end
        Wait(100)
        TriggerClientEvent('setcontacts', src, contacts)
    end)
end)


house = 0
RegisterNetEvent('loadIdCard')
AddEventHandler('loadIdCard', function(playerId) 
    print("loadidcard server : ".. playerId)
    local pid = playerId
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local mhouse = MySQL.Sync.fetchScalar("SELECT house FROM houses WHERE owner = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if mhouse ~= nil then
        house = mhouse
    end
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @num', {['num'] = xPlayer.getIdentifier()}, function(result)
        --print("result loaded")
        TriggerClientEvent('showIdCard', pid, result[1].firstname, result[1].lastname, result[1].dateofbirth, 'Haus '.. house, result[1].level, false)
    end)
end)  


RegisterNetEvent('loadIdCardFrom')
AddEventHandler('loadIdCardFrom', function(playerId) 
    print("loadidcard server : ".. playerId)
    local pid = playerId
    local src = source
    local xPlayer = ESX.GetPlayerFromId(pid)
    local mhouse = MySQL.Sync.fetchScalar("SELECT house FROM houses WHERE owner = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
    if mhouse ~= nil then
        house = mhouse
    end
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @num', {['num'] = xPlayer.getIdentifier()}, function(result)
        --print("result loaded")
        TriggerClientEvent('showIdCard', src, result[1].firstname, result[1].lastname, result[1].dateofbirth, 'Haus '.. house, result[1].level, false)
    end)
end) 


RegisterNetEvent('loadDutyCard')
AddEventHandler('loadDutyCard', function(playerId) 
    --print("loaddutycard server : ".. playerId)
    local pid = playerId
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @num', {['num'] = xPlayer.getIdentifier()}, function(result)
        --print("result loaded")
        TriggerClientEvent('showDutyCard', pid, xPlayer.getJob().label, result[1].job_grade, result[1].dienstnummer)
    end) 
end)


hasFirstAid = false
hasDrive = false
hasWeapon = false
hasDrive_truck = false
hasDrive_bike = false
hasAircraft_a = false
hasAircraft_b = false
hasBoat = false
hasTaxi = false
hasPBS = false
hasAnwalt = false
hasStandesamt = false
RegisterNetEvent('loadLicenseBook')
AddEventHandler('loadLicenseBook', function(playerId)
    local pid = playerId
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)


    hasFirstAid = false
    hasDrive = false
    hasWeapon = false
    hasDrive_truck = false
    hasDrive_bike = false
    hasAircraft_a = false
    hasAircraft_b = false
    hasBoat = false
    hasTaxi = false
    hasPBS = false
    hasAnwalt = false
    hasStandesamt = false 
    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier ", { ['@identifier'] = xPlayer.getIdentifier()})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier ", { ['@identifier'] = xPlayer.getIdentifier()})
    local rpname = firstname .. '_'.. lastname

    local firstAid = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'erstehilfe'})
    local drive = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'drive'})
    local weapon = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'weapon'})
    local drive_truck = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'drive_truck'})
    local drive_bike = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'drive_bike'})
    local aircraft_a = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'aircraft_a'})
    local aircraft_b = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'aircraft_b'})
    local boat = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'boat'})
    local taxi = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'taxi'})
    local pbs = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'boat'})
    local anwalt = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'anwalt'})
    local standesamt = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.getIdentifier(), ['@type'] = 'standesamt'})

    if firstAid ~= nil then
        hasFirstAid = true
    end

    if drive ~= nil then
        hasDrive = true
    end
    if weapon ~= nil then
        hasWeapon = true
    end
    if drive_truck ~= nil then
        hasDrive_truck = true
    end
    if drive_bike ~= nil then
        hasDrive_bike = true
    end
    if aircraft_a ~= nil then
        hasAircraft_a = true
    end
    if aircraft_b ~= nil then
        hasAircraft_b = true
    end
    if boat ~= nil then
        hasBoat = true
    end
    if taxi ~= nil then
        hasTaxi = true
    end
    if pbs ~= nil then
        hasPBS = true
    end
    if anwalt ~= nil then
        hasAnwalt= true
    end
    if standesamt ~= nil then
        hasStandesamt = true
    end
 
    TriggerClientEvent('showLic', pid, rpname, hasFirstAid, hasWeapon, hasDrive, hasDrive_truck, hasDrive_bike, hasBoat, hasAircraft_a, hasAircraft_b, hasTaxi, hasPBS, hasAnwalt, hasStandesamt)
end) 

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'radio' then
	    TriggerClientEvent('removeFunk', source)
	end
end)

--RegisterNetEvent('matthias:saveRingtone')
--AddEventHandler('matthias:saveRingtone', function(ringtone)
--    local xPlayer = ESX.GetPlayerFromId(source)
--    MySQL.Async.execute("UPDATE users SET ringtoneid = @ringtone WHERE identifier = @identifier", {['identifier'] = xPlayer.getIdentifier(), ['ringtone'] = ringtone})
--end)
