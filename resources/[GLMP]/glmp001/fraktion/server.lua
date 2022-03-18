local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)
ESX.RegisterServerCallback('getPlayerBalance', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    cb(xPlayer.getMoney())
end)
ESX.RegisterServerCallback('frakbank:cashIn', function(source, cb, frak, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name ~= 'unemployed' then
        local perms = MySQL.Sync.fetchScalar("SELECT frak_perms_bank FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        if perms == 1 then
            local payin = tonumber(amount) 
            if payin > 0 then
                local frakBalance = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
                if xPlayer.getMoney() >= payin then
                    
                    local frakNewBalance = frakBalance + payin
                    MySQL.Sync.fetchScalar("UPDATE `jobs` SET `bank` = @bank WHERE `jobs`.`name` = @frak;", { ['@frak'] = xPlayer.getJob().name, ['@bank'] = frakNewBalance})
                    xPlayer.removeMoney(payin)
                    TriggerClientEvent('glmp_notify', source, 'green', 'FRAK-BANK ('.. xPlayer.getJob().label ..')', 'Du hast '.. payin ..'$ eingezahlt.')
                    TriggerEvent('frakBankOpen', source)
                    TriggerEvent('byte:sendLog', 'fraktion', "(" .. xPlayer.getJob().label .. ") Fraktionsbank", xPlayer.getName() .. " hat ".. payin .. "$ in die Fraktionsbank eingezahlt.") 
                else   
                    TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Geld dabei.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Ungültige summe.')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dazu benötigst du Bankrechte.')
        end
    else
        TriggerClientEvent('glmp_singlenotify', source, 'red', 'Du bist in keiner Fraktion.')
    end
end)

ESX.RegisterServerCallback('frakbank:cashOut', function(source, cb, frak, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name ~= 'unemployed' then
        local perms = MySQL.Sync.fetchScalar("SELECT frak_perms_bank FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        if perms == 1 then
            local payin = tonumber(amount) 
            if payin > 0 then
                local frakBalance = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
                if frakBalance >= payin then
                     
                    local frakNewBalance = frakBalance - payin
                    MySQL.Sync.fetchScalar("UPDATE `jobs` SET `bank` = @bank WHERE `jobs`.`name` = @frak;", { ['@frak'] = xPlayer.getJob().name, ['@bank'] = frakNewBalance})
                    xPlayer.addMoney(payin) 
                    TriggerClientEvent('glmp_notify', source, 'green', 'FRAK-BANK ('.. xPlayer.getJob().label ..')', 'Du hast '.. payin ..'$ abgehoben.')
                    TriggerEvent('frakBankOpen', source)
                    TriggerEvent('byte:sendLog', 'fraktion', "(" .. xPlayer.getJob().label .. ") Fraktionsbank", xPlayer.getName() .. " hat ".. payin .. "$ von der Fraktionsbank abgehoben.") 
                else   
                    TriggerClientEvent('glmp_singlenotify', source, '', 'Die Fraktion hat nicht genug Geld auf der Bank.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Ungültige summe.')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dazu benötigst du Bankrechte.')
        end
    else
        TriggerClientEvent('glmp_singlenotify', source, 'red', 'Du bist in keiner Fraktion.')
    end
end)
--[[RegisterCommand('cashin', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name ~= 'unemployed' then
        if xPlayer.getJob().grade > 10 then
            local payin = tonumber(args[1])
            if payin > 0 then
                local frakBalance = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
                if xPlayer.getMoney() >= payin then
                    
                    local frakNewBalance = frakBalance + payin
                    MySQL.Sync.fetchScalar("UPDATE `jobs` SET `bank` = @bank WHERE `jobs`.`name` = @frak;", { ['@frak'] = xPlayer.getJob().name, ['@bank'] = frakNewBalance})
                    xPlayer.removeMoney(payin)
                    TriggerClientEvent('glmp_notify', source, 'green', 'FRAK-BANK ('.. xPlayer.getJob().label ..')', 'Du hast '.. payin ..'$ eingezahlt.')
                else
                    TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du hast nicht genug Geld dabei.')
                end
            else
                TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Ungültige summe.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Dazu hast du keine Rechte, du musst mindestens Rang 11 sein.')
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du bist in keiner Fraktion.')
    end
end)

RegisterCommand('cashout', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name ~= 'unemployed' then
        if xPlayer.getJob().grade > 10 then
            local payin = tonumber(args[1])
            if payin > 0 then
                local frakBalance = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
                if frakBalance >= payin then
                    
                    local frakNewBalance = frakBalance - payin
                    MySQL.Sync.fetchScalar("UPDATE `jobs` SET `bank` = @bank WHERE `jobs`.`name` = @frak;", { ['@frak'] = xPlayer.getJob().name, ['@bank'] = frakNewBalance})
                    xPlayer.addMoney(payin)
                    TriggerClientEvent('glmp_notify', source, 'green', 'FRAK-BANK ('.. xPlayer.getJob().label ..')', 'Du hast '.. payin ..'$ ausgezahlt.')
                else
                    TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du hast nicht genug Geld dabei.')
                end
            else
                TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Ungültige summe.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Dazu hast du keine Rechte, du musst mindestens Rang 11 sein.')
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du bist in keiner Fraktion.')
    end
end)

RegisterCommand('frakbank1', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name ~= 'unemployed' then 
        local frakBalance = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
        TriggerClientEvent('glmp_notify', source, 'green', 'FRAK-BANK ('.. xPlayer.getJob().label ..')', 'Auf der Fraktionsbank sind '.. frakBalance ..'$')
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du bist in keiner Fraktion.')
    end
end)]]

RegisterCommand('frakbank', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name ~= 'police' then
        if xPlayer.getJob().name ~= 'ambulance' then 
            if xPlayer.getJob().name ~= 'fib' then
                TriggerEvent('frakBankOpen', source)
            end
        end
    end
end)

RegisterNetEvent('frakBankOpen')
AddEventHandler('frakBankOpen', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayer = ESX.GetPlayerFromId(source)
        
    if xPlayer.getJob().name ~= 'unemployed' then 
        local perms = MySQL.Sync.fetchScalar("SELECT frak_perms_bank FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        if perms == 1 then
            local frakBalance = MySQL.Sync.fetchScalar("SELECT bank FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
            local frakLabel = MySQL.Sync.fetchScalar("SELECT label FROM jobs WHERE name = @frak", { ['@frak'] = xPlayer.getJob().name})
            TriggerClientEvent('openFrakBankMenu', source, xPlayer.getJob().name, frakLabel, frakBalance)
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dazu benötigst du Bankrechte.')
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du bist in keiner Fraktion.')
    end
end)



admindienst = {}
AddEventHandler('byte:toggleExternAduty', function(pid)
    ------print(source)
    local src = pid
    if admindienst[src] == nil then
        admindienst[src] = true
        ------print("set aduty true for ".. src)
    elseif admindienst[src] == false then
        admindienst[src] = true
        ------print("set aduty true for ".. src)
    elseif admindienst[src] == true then
        admindienst[src] = false
        ------print("set aduty false for ".. src)
    end 

end)

RegisterServerEvent('byte:invitePlayer')
AddEventHandler('byte:invitePlayer', function(targetName)
    ------print(source)
    local src = source
    local first, last = targetName:match("([^_]+)_([^_]+)")
    local ident = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
    if ident ~= nil then
        
        local xTarget = ESX.GetPlayerFromIdentifier(ident)
        if xTarget ~= nil then
            if admindienst[xTarget.source] ~= true then
                local target = tonumber(xTarget.source)
                local xPlayer = ESX.GetPlayerFromId(src)
                local identifier = xPlayer.getIdentifier()
                local xTarget = ESX.GetPlayerFromId(target)
                local tidentifier = xTarget.getIdentifier()
                local job = xPlayer.getJob().name
                local job_grade = xPlayer.getJob().grade
                local job_label = xPlayer.getJob().label
                
                --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job)
                --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job_grade)
                if job ~= 'unemployed' then
                    local manage_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                    if manage_perms == 0 then
                        local invite_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_invite FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        perms = invite_perms
                    else
                        perms = manage_perms
                    end
                    if perms == 1 then
                        local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = tidentifier})
                        local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = tidentifier})
                        local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        local frak = job
                        TriggerClientEvent('byte_frakinvite:open', target, job_label, 'Möchtest du die Einladung von '.. firstname .. '_' .. lastname .. ' Annehmen?', job)
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, firstname..'_'..lastname..' hat '..tfirstname..'_'..tlastname..' in die Fraktion eingeladen.')
                        TriggerEvent('byte:sendLog', 'fraktion', "(" .. job_label .. ") Invite gesendet", firstname..'_'..lastname..' ('.. xPlayer.getName() ..') hat '..tfirstname..'_'..tlastname..' ('.. xTarget.getName() ..') in die Fraktion eingeladen.')
                        
                    else 
                        TriggerClientEvent('glmp_singlenotify', src, 'red', 'Dazu benötigst du Invite- oder Verwaltungsrechte')
                    end
                    
                else
                    TriggerClientEvent('glmp_singlenotify', src, '', 'Du bist in keiner Fraktion.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', src, "", "Der Spieler ist nicht online!")
            end
        else

            TriggerClientEvent('glmp_singlenotify', src, "", "Der Spieler ist nicht online!")
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Der Spieler exestiert nicht.')
    end        
end)

perms = 0
RegisterServerEvent('byte:uninvitePlayer')
AddEventHandler('byte:uninvitePlayer', function(source, targetid)

    local target = tonumber(targetid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local tidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob_grade = xTarget.getJob().grade
    local job_label = xPlayer.getJob().label
    
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job)
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job_grade)
    if job ~= 'unemployed' then
        if tjob_grade < job_grade then
            local manage_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
            if manage_perms == 0 then
                local invite_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_invite FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                perms = invite_perms
            else
                perms = manage_perms
            end
            if perms == 1 then
                local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = tidentifier})
                local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = tidentifier})
                local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '0' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                MySQL.Sync.fetchScalar("UPDATE users SET job = 'unemployed' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                xTarget.setJob('unemployed', 0) 
                local frak = job
                TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, firstname..'_'..lastname..' hat '..tfirstname..'_'..tlastname..' aus der Fraktion geworfen.')
                TriggerClientEvent('glmp_singlenotify', xTarget.source, 'grey', 'Du wurdest aus der Fraktion geworfen. - '.. xPlayer.getJob().label)
                TriggerEvent('byte:sendLog', 'fraktion', "(" .. job_label .. ") Uninvite",  firstname..'_'..lastname..' ('.. xPlayer.getName() ..') hat '..tfirstname..'_'..tlastname..' ('.. xTarget.getName() ..') aus der Fraktion geworfen.')
                
            else
                TriggerClientEvent('glmp_singlenotify', source, 'red', 'Dazu benötigst du Invite- oder Verwaltungsrechte')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, 'red', 'Diese Person kannst du nicht aus der Fraktion werfen.')
        end
    else 
        TriggerClientEvent('glmp_singlenotify', source, 'red', 'Du bist in keiner Fraktion.')
    end
end)
--[[RegisterCommand('invite', function(source, args)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(args[1])
    local tidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local job_label = xPlayer.getJob().label
    
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job)
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job_grade)
    if job ~= 'unemployed' then
        if job_grade > 9 then
            local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = tidentifier})
            local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = tidentifier})
            local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
            local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
            local frak = job
            TriggerClientEvent('byte_frakinvite:open', target, job_label, 'Möchtest du die Einladung von '.. firstname .. '_' .. lastname .. ' Annehmen?', job)
            TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, firstname..'_'..lastname..' hat '..tfirstname..'_'..tlastname..' in die Fraktion eingeladen.')
            
        else
            TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Dazu hast du keine Rechte, du musst mindestens Rang 10 sein.')
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'Fehler', 'Du bist in keiner Fraktion.')
    end
end)]]

--[[RegisterCommand('uninvite', function(source, args)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local targetidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob = xTarget.getJob().name
    local tjob_grade = xTarget.getJob().grade
    local joblabel = xPlayer.getJob().label
    local joblabel = xTarget.getJob().label
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xTarget.getJob().name})
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job)
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job_grade)
    local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

    if job ~= 'unemployed' then
        if job_grade > 9 then
            if tjob == job then
                if tjob_grade < job_grade then
                    TriggerClientEvent('glmp_notify', source, jobcolor, joblabel, 'Der Spieler wurde erfolgreich aus der Fraktion entlassen.')
                    TriggerClientEvent('glmp_notify', target, jobcolor, joblabel, 'Du wurdest aus der Fraktion geworfen.')
                    xTarget.setJob("unemployed", 0)
                    MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '0' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET job = 'unemployed' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, firstname .. "_" .. lastname .. " wurde aus der Fraktion geworfen.")
                else
                    TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du kannst diese Person nicht aus der Fraktion werfen.')
                end
            else
                TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Der Spieler ist nicht in deiner Fraktion.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Dazu hast du keine Rechte, du musst mindestens Rang 10 sein.')
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'Fehler', 'Du bist in keiner Fraktion.')
    end
end)]]

RegisterNetEvent('byte_dmv:addLicense')
AddEventHandler('byte_dmv:addLicense', function(target, type)
    ------print("DEBUG: target - ".. target)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget ~= nil then
        local have = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xTarget.getIdentifier(), ['@type'] = type})
        if have == nil then
            local firstaid = MySQL.Sync.fetchScalar("SELECT id FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = xPlayer.identifier, ['@type'] = 'erstehilfe'})
            if type ~= 'erstehilfe' then
                if firstaid ~= nil then
                    local targetidentifier = xTarget.getIdentifier()
                    local identifier = xPlayer.getIdentifier()
                    local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

                    local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    
                    MySQL.Sync.fetchScalar("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", { ['@type'] = type,  ['@owner'] = targetidentifier})
                    if type == 'drive' then 
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine PKW Lizenz ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine PKW Lizenz ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast eine PKW Lizenz erhalten.')
                    elseif type == 'drive_bike' then
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine Motorrad Lizenz ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Motorrad Lizenz ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast eine Motorrad Lizenz erhalten.')
                    elseif type == 'drive_truck' then
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine LKW Lizenz ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine LKW Lizenz ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast eine LKW Lizenz erhalten.')
                    elseif type == 'pbs' then
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen PBS ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine PBS Lizenz ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast einen PBS erhalten.')
                    elseif type == 'aircraft_a' then
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Flugschein A ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Flug Lizenz A ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast einen Flugschein A erhalten.')
                    elseif type == 'aircraft_b' then
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Flugschein B ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Flug Lizenz B ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast einen Flugschein A erhalten.')
                    elseif type == 'boat' then 
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Bootsschein ausgestellt.")
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Boots Lizenz ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast einen Bootsschein erhalten.')
                    elseif type == 'erstehilfe' then
                        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine Erstehilfe-Lizenz ausgestellt.")
                        TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast einen Erstehilfeschein erhalten.')
                        TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Erstehilfe Lizenz ausgestellt.")
                    end
                else
                    TriggerClientEvent('glmp_singlenotify', _source, '', 'Die Lizenz konte nicht vergeben werden. - Der Spieler besitzt keinen Erstehilfeschein!')
                end 
            else
                MySQL.Sync.fetchScalar("INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)", { ['@type'] = type,  ['@owner'] = xTarget.getIdentifier()})
                local targetidentifier = xTarget.getIdentifier()
                local identifier = xPlayer.getIdentifier()
                local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

                local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})

                TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine Erstehilfe-Lizenz ausgestellt.")
                TriggerClientEvent('glmp_singlenotify', target, '', 'Du hast einen Erstehilfeschein erhalten.')
                TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Erstehilfe Lizenz ausgestellt.")
            end
        else
            TriggerClientEvent('glmp_singlenotify', _source, '', 'Die Lizenz konte nicht vergeben werden. - Der Spieler besitzt diese Lizenz bereits!')
        end
    else
        TriggerClientEvent('glmp_singlenotify', _source, '', 'Die Lizenz konte nicht vergeben werden. - Der Spieler ist nicht online!')
    end
end)

RegisterNetEvent('byte_dmv:removeLicense')
AddEventHandler('byte_dmv:removeLicense', function(target, type)
    ------print("DEBUG: target - ".. target)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget ~= nil then
        
                local targetidentifier = xTarget.getIdentifier()
                local identifier = xPlayer.getIdentifier()
                local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

                local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                MySQL.Sync.fetchScalar("DELETE FROM user_licenses WHERE owner = @identifier AND type = @type", { ['@identifier'] = targetidentifier, ['@type'] = type})
  
               -- TriggerEvent('esx_license:removeLicense', target, type)
                if type == 'drive' then 
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine PKW Lizenz entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine PKW Lizenz entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde die PKW Lizenz entzogen.')
                elseif type == 'drive_bike' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine Motorrad Lizenz entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Motorrad Lizenz entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde die Motorrad Lizenz entzogen.')
                elseif type == 'drive_truck' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." eine LKW Lizenz entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine LKW Lizenz entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde die LKW Lizenz entzogen.')
                elseif type == 'pbs' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen PBS entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine PBS Lizenz entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde der PBS entzogen.')
                elseif type == 'aircraft_a' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Flugschein A entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Flug Lizenz A entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde der Flugschein A entzogen.')
                elseif type == 'aircraft_b' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Flugschein B entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Flug Lizenz B entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde der Flugschein B entzogen.')
                elseif type == 'boat' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Bootsschein entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Boots Lizenz entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde der Bootsschein entzogen.')
                elseif type == 'weapon' then
                    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." einen Waffenschein entzogen.")
                    TriggerEvent('byte:sendLog', 'dmv', '('.. xPlayer.getJob().label .. ") Lizenz Vergabe", "Rang ".. xPlayer.getJob().grade .. " | " .. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") hat ".. tfirstname .."_" .. tlastname .." (".. xTarget.getName() ..") eine Waffen Lizenz entzogen.")
                    TriggerClientEvent('glmp_singlenotify', target, '', 'Dir wurde die Waffenlizenz entzogen.')
                
                end 
            
       
    else
        TriggerClientEvent('glmp_singlenotify', _source, '', 'Die Lizenz konte nicht vergeben werden. - Der Spieler ist nicht online!')
    end
end)


RegisterNetEvent('byte_taxi:buyLic')
AddEventHandler('byte_taxi:buyLic', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
   
    if xPlayer.getMoney() >= 2500 then
        TriggerEvent('esx_license:addLicense', _source, 'taxi')
    
        TriggerEvent('byte:sendLog', 'taxi', 'Taxi Lizenz erworben', xPlayer.getName() ..") hat eine Taxi Lizenz erworben.")
        TriggerClientEvent('glmp_singlenotify', _source, '', 'Du hast eine Taxi Lizenz erhalten.')
        TriggerClientEvent('glmp_singlenotify', _source, 'green', 'Du bezahlst 2.500$')
        xPlayer.removeMoney(2500)
    else
        TriggerClientEvent('glmp_singlenotify', _source, 'red', 'Du benötigst 2.500$!')
    end

end)


RegisterServerEvent('laptop:uninvite')
AddEventHandler('laptop:uninvite', function(ident, targetident)

    local targetidentifier = targetident
    local identifier = ident

    local job = MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", { ['@identifier'] = targetident})
    local joblabel = MySQL.Sync.fetchScalar("SELECT label FROM jobs WHERE name = @jobname", { ['@jobname'] = job})
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = job})

    local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

    local tname = MySQL.Sync.fetchScalar("SELECT name FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

    local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})

    local name = MySQL.Sync.fetchScalar("SELECT name FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    


    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier}) 
    MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '0' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    MySQL.Sync.fetchScalar("UPDATE users SET job = 'unemployed' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    TriggerEvent('sendFraktionInfo', joblabel, firstname .. "_" .. lastname .. " hat ".. tfirstname .."_" .. tlastname .." aus der Fraktion geworfen.")
    TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Uninvite", firstname .. "_" .. lastname .. " (".. name ..") hat ".. tfirstname .."_" .. tlastname .." (".. tname ..") aus der Fraktion geworfen.")

end)

RegisterServerEvent('laptop:setdienstnummer')
AddEventHandler('laptop:setdienstnummer', function(ident, targetident, dn)

    local targetidentifier = targetident
    local identifier = ident

    local job = MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", { ['@identifier'] = targetident})
    local joblabel = MySQL.Sync.fetchScalar("SELECT label FROM jobs WHERE name = @jobname", { ['@jobname'] = job})
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = job})

    local tfirstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})

    local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})

    local name = MySQL.Sync.fetchScalar("SELECT name FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local tname = MySQL.Sync.fetchScalar("SELECT name FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})


    MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = ".. dn .." WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    TriggerEvent('sendFraktionInfo', joblabel, firstname .. "_" .. lastname .. " hat die Dienstnummer von ".. tfirstname .."_" .. tlastname .." zu ".. dn .. " geändert.")
    TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Dienstnummer geändert", firstname .. "_" .. lastname .. " (".. name ..") hat die Dienstnummer von ".. tfirstname .."_" .. tlastname .." (".. tname ..") zu ".. dn .. " geändert.")
 
end)




--[[RegisterCommand('setgrade', function(source, args)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local targetidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob = xTarget.getJob().name
    local tjob_grade = xTarget.getJob().grade
    local joblabel = xPlayer.getJob().label
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xTarget.getJob().name})
    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local rpname = firstname .. '_' .. lastname
    local tfirstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local trpname = tfirstname .. '_' .. tlastname

    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job)
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job_grade)
    if job ~= 'unemployed' then
        if job_grade > 9 then
            if tjob == job then
                if tjob_grade < job_grade then
                   -- TriggerClientEvent('glmp_notify', source, jobcolor, joblabel, 'Der Spieler hat nun Rang '.. args[2] ..'.')
                   -- TriggerClientEvent('glmp_notify', target, jobcolor, joblabel, 'Du hast nun Rang '.. args[2].. '.')
                    xTarget.setJob(job, args[2])
                    TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat den Rang von ' .. trpname .. ' zu '.. args[2] ..' gesetzt.')
                    MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '".. args[2] .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    MySQL.Sync.fetchScalar("UPDATE users SET job = '".. job .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                else
                    TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du kannst diese Person nicht verwalten.')
                end
            else
                TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Der Spieler ist nicht in deiner Fraktion.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Dazu hast du keine Rechte, du musst mindestens Rang 10 sein.')
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'Fehler', 'Du bist in keiner Fraktion.')
    end
end)]]
notifyNoPerms = 0
RegisterServerEvent('byte:setPerms')
AddEventHandler('byte:setPerms', function(playerid, perms, state)
    local src = source
    ------print("DEBUG: ".. playerid)
    local target = tonumber(playerid)
    local xPlayer = ESX.GetPlayerFromId(src)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local targetidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob = xTarget.getJob().name
    local tjob_grade = xTarget.getJob().grade
    local joblabel = xPlayer.getJob().label
    
    local manage_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    if manage_perms == 1 then
        Wait(500)
        if tjob == job then
            Wait(500)
            if tjob_grade < job_grade then
                Wait(500)
                local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xTarget.getJob().name})
                local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                local rpname = firstname .. '_' .. lastname
                local tfirstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                local trpname = tfirstname .. '_' .. tlastname
                if state == 'add' then
                    TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Permission geändert", "Der Spieler ".. rpname .. " (".. xPlayer.getName() .. ") hat dem Spieler ".. trpname .. "(".. xTarget.getName()..") die " .. perms .. " permission gesetzt.")
                    if perms == 'manage' then
                        if job_grade > 11 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Verwaltungsrechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Verwaltungsrechte kann nur der Fraktionsleader vergeben.')
                        end
        
                    
                    elseif perms == 'bank' then
                        local bank_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_bank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        if bank_perms == 1 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Bankrechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Du kannst keine Rechte setzten, welche du selbst nicht hast. (Bankrechte)')
                        end
                    elseif perms == 'lager' then
                        local lager_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_lager FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        if lager_perms == 1 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Fraktionslagerrechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Du kannst keine Rechte setzten, welche du selbst nicht hast. (Inventarrechte)')
                        end
                    elseif perms == 'invite' then
                        local invite_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_invite FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        if invite_perms == 1 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Inviterechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 1 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Du kannst keine Rechte setzten, welche du selbst nicht hast. (Inviterechte)')
                        end
                    end
                elseif state == 'remove' then
                    TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Permission geändert", "Der Spieler ".. rpname .. " (".. xPlayer.getName() .. ") hat dem Spieler ".. trpname .. "(".. xTarget.getName()..") die " .. perms .. " permission entfernt.")
                    if perms == 'manage' then
                        if job_grade > 11 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Verwaltungsrechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Verwaltungsrechte kann nur der Fraktionsleader vergeben.')
                        end
        
                    
                    elseif perms == 'bank' then
                        local bank_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_bank FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        if bank_perms == 1 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Bankrechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Du kannst keine Rechte setzten, welche du selbst nicht hast. (Bankrechte)')
                        end
                    elseif perms == 'lager' then
                        local lager_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_lager FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        if lager_perms == 1 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Fraktionslagerrechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Du kannst keine Rechte setzten, welche du selbst nicht hast. (Inventarrechte)')
                        end
                    elseif perms == 'invite' then
                        local invite_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_invite FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        if invite_perms == 1 then
                            --TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat ' .. trpname .. ' Inviterechte gesetzt.')
                            MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 0 WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        else
                            TriggerClientEvent('glmp_singlenotify', src, 'grey', 'Du kannst keine Rechte setzten, welche du selbst nicht hast. (Inviterechte)')
                        end
                    end
                end
            end
        end
    
    
    end

end)

RegisterServerEvent('byte:setGrade')
AddEventHandler('byte:setGrade', function(source, playerid, rank)
    local target = tonumber(playerid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local targetidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob = xTarget.getJob().name
    local tjob_grade = xTarget.getJob().grade
    local joblabel = xPlayer.getJob().label
    
    
     -- BIS HIER LOGS FERTIG
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job)
    --TriggerClientEvent('glmp_singlenotify', source, 'red', 'DEBUG: '.. job_grade)
    if job ~= 'unemployed' then 
        local manage_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        if manage_perms == 1 then
            if tjob == job then
                if tjob_grade < job_grade then
                    if rank < job_grade then
                        local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xTarget.getJob().name})
                        local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                        local rpname = firstname .. '_' .. lastname
                        local tfirstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        local trpname = tfirstname .. '_' .. tlastname
                        TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Rang gesetzt ", rpname .. ' ('.. xPlayer.getName() ..') hat den Rang von ' .. trpname .. ' (' .. xTarget.getName() .. ') zu '.. rank ..' gesetzt.')
                    -- TriggerClientEvent('glmp_notify', source, jobcolor, joblabel, 'Der Spieler hat nun Rang '.. rank ..'.')
                    -- TriggerClientEvent('glmp_notify', target, jobcolor, joblabel, 'Du hast nun Rang '.. rank.. '.')
                        xTarget.setJob(job, rank)
                        TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat den Rang von ' .. trpname .. ' zu '.. rank ..' gesetzt.')
                        MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '".. rank .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                        MySQL.Sync.fetchScalar("UPDATE users SET job = '".. job .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    else
                        TriggerClientEvent('glmp_singlenotify', source, '', 'Diesen Rang kannst du nicht vergeben.')
                    end
                else
                    TriggerClientEvent('glmp_singlenotify', source, '', 'Du kannst diese Person nicht verwalten.')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Der Spieler ist nicht in deiner Fraktion.')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dazu benötigst du Verwaltungsrechte.')
        end
    else
        TriggerClientEvent('glmp_singlenotify', source, '', 'Du bist in keiner Fraktion.')
    end
end)
--[[RegisterCommand('setpayday', function(source, args)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local targetidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob = xTarget.getJob().name
    local tjob_grade = xTarget.getJob().grade
    local joblabel = xPlayer.getJob().label
    
    local trpname = tfirstname .. '_' .. tlastname
    if job ~= 'unemployed' then
        local manage_perms = MySQL.Sync.fetchScalar("SELECT frak_perms_manage FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        if manage_perms == 1 then
            if tjob == job then
                if tjob_grade < job_grade then
                    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xTarget.getJob().name})
                    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
                    local rpname = firstname .. '_' .. lastname
                    local tfirstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                    local pd = tonumber(args[2])
                    TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Payday geändert", rpname .. ' ('.. xPlayer.getName() ..') hat den PayDay von ' .. trpname .. ' ('.. xTarget.getName() ..') zu '.. pd ..'$ gesetzt.')
                    TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat den PayDay von ' .. trpname .. ' zu '.. pd ..' gesetzt.')
                    MySQL.Sync.fetchScalar("UPDATE users SET payday = '".. pd .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
                else
                    TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Du kannst diese Person nicht verwalten.')
                end
            else
                TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Der Spieler ist nicht in deiner Fraktion.')
            end
        else
            TriggerClientEvent('glmp_notify', source, 'red', 'FEHLER', 'Dazu benötigst du Verwaltungsrechte.') 
        end
    else
        TriggerClientEvent('glmp_notify', source, 'red', 'Fehler', 'Du bist in keiner Fraktion.')
    end
end)]]

--[[RegisterCommand('fraktion', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local job = MySQL.Sync.fetchScalar("SELECT job FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local job_grade = MySQL.Sync.fetchScalar("SELECT job_grade FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local xjob_grade = xPlayer.getJob().grade
    local xjob = xPlayer.getJob().label
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xPlayer.getJob().name})
    TriggerClientEvent('glmp_notify', source, jobcolor, xjob, 'Rang ' .. xjob_grade)

end)]]

RegisterCommand('dienstnummer', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local job = xPlayer.getJob().name
    local joblabel = xPlayer.getJob().label
    
    if job == 'police' or 'fib' or 'ambulance' then
        local dienstnummer = MySQL.Sync.fetchScalar("SELECT dienstnummer FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
        local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xPlayer.getJob().name})
        if dienstnummer ~= 0 then
            TriggerClientEvent('glmp_notify', source, jobcolor, joblabel, 'Deine Dienstnummer: '.. dienstnummer)
        else
            TriggerClientEvent('glmp_notify', source, jobcolor, joblabel, 'Du hast keine Dienstnummer.')
        end
    end
end)

--[[RegisterCommand('setdienstnummer', function(source, args)
    local target = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local xTarget = ESX.GetPlayerFromId(target)
    local targetidentifier = xTarget.getIdentifier()
    local job = xPlayer.getJob().name
    local job_grade = xPlayer.getJob().grade
    local tjob = xTarget.getJob().name
    local tjob_grade = xTarget.getJob().grade
    local joblabel = xPlayer.getJob().label
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xTarget.getJob().name})
    local firstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local rpname = firstname .. '_' .. lastname
    local tfirstname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local tlastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
    local trpname = tfirstname .. '_' .. tlastname
    local dienstnummer = MySQL.Sync.fetchScalar("SELECT dienstnummer FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    if job == 'police' or 'fib' or 'ambulance' then
        if job_grade > 9 then
            if job == tjob then
                TriggerEvent('sendFraktionInfo', joblabel, rpname .. ' hat die Dienstnummer von ' .. trpname .. ' zu '.. args[2] ..' gesetzt.')
                MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = '".. args[2] .."' WHERE identifier = @identifier", { ['@identifier'] = targetidentifier})
            else
                TriggerClientEvent('glmp_notify', source, 'red', 'Fehler', 'Der Spieler ist nicht in deiner Fraktion.')
            end
        end
    end
end)]]

RegisterServerEvent('sendFraktionInfo')
AddEventHandler('sendFraktionInfo', function(fraktion, msg)
    local xPlayers = ESX.GetPlayers()
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE label = @jobname", { ['@jobname'] = fraktion})
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getJob().label == fraktion then
            TriggerClientEvent("glmp_notify", xPlayers[i], jobcolor, fraktion, msg)
        end
    end
end)



RegisterServerEvent('byte_frakinvite:accepted')
AddEventHandler('byte_frakinvite:accepted', function(args)
    ------print("accept f invite")
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local name = GetPlayerName(source)
    xPlayer.setJob(args, 0)
    local joblabel = xPlayer.getJob().label
    local jobcolor = MySQL.Sync.fetchScalar("SELECT color FROM jobs WHERE name = @jobname", { ['@jobname'] = xPlayer.getJob().name})
    local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET job_grade = '0' WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET job = '".. args .."' WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET dienstnummer = 0 WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_manage = 0 WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_invite = 0 WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_bank = 0 WHERE identifier = @identifier", { ['@identifier'] = identifier})
    MySQL.Sync.fetchScalar("UPDATE users SET frak_perms_lager = 0 WHERE identifier = @identifier", { ['@identifier'] = identifier})
    TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, firstname .. "_" .. lastname .. " ist jetzt ein Mitglied!")
    TriggerEvent('byte:sendLog', 'fraktion', "(" .. joblabel .. ") Invite Angenommen", firstname .. "_" .. lastname .. " hat die Einladung angenommen.")
end)



--- DUTY

staatsdienst = {}
function getStateDuty(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    if staatsdienst[source] == nil then
        staatsdienst[source] = 0 
        ------print("set state duty")
    end   
end  
AddEventHandler('esx:playerDropped', function(source)
    ------print("dropped ".. source)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	if staatsdienst[src] == 1 then
        ------print("is staatsdienst")
        local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        MySQL.Sync.fetchScalar("UPDATE users SET loadout = '[]' WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})            
        TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, 'Rang ' .. xPlayer.getJob().grade .. ' | '.. firstname .. "_" .. lastname .. " meldet sich vom Dienst ab! (Schlafen)")
        TriggerEvent('byte:sendLog', 'staatsdienst', 'Dienst Abtritt - ' .. xPlayer.getJob().label, 'Rang ' .. xPlayer.getJob().grade .. ' | '.. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") meldet sich vom Dienst ab, weil er Disconnected ist!")
        staatsdienst[src] = 0 
        TriggerEvent('byte:setExternDuty', src, 0)   
       
    end
end)

RegisterServerEvent('byte_fraksystem:setDuty')
AddEventHandler('byte_fraksystem:setDuty', function(state)
    local xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    getStateDuty(src)
    if state == 'onDuty' then

        if staatsdienst[src] ~= 1  then
            local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
            local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
            TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, 'Rang ' .. xPlayer.getJob().grade .. ' | '.. firstname .. "_" .. lastname .. " meldet sich zum Dienst!")
            
            staatsdienst[src] = 1
            TriggerEvent('byte:sendLog', 'staatsdienst', 'Dienst Antritt - ' .. xPlayer.getJob().label, 'Rang ' .. xPlayer.getJob().grade .. ' | '.. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") meldet sich zum Dienst!")
            TriggerEvent('byte:setExternDuty', src, 1) 
            --MySQL.Sync.fetchScalar("UPDATE users SET stateDuty = '1' WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        else
            TriggerClientEvent('glmp_singlenotify', src, '', 'Du bist bereits im Dienst!')
        end

    elseif state == 'offDuty' then
        if staatsdienst[src] == 1  then
            local firstname= MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
            local lastname = MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
            TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, 'Rang ' .. xPlayer.getJob().grade .. ' | '.. firstname .. "_" .. lastname .. " meldet sich vom Dienst ab!")
            TriggerEvent('byte:sendLog', 'staatsdienst', 'Dienst Abtritt - ' .. xPlayer.getJob().label, 'Rang ' .. xPlayer.getJob().grade .. ' | '.. firstname .. "_" .. lastname .. " (".. xPlayer.getName() ..") meldet sich vom Dienst ab!")
            staatsdienst[src] = 0
            TriggerEvent('byte:setExternDuty', src, 0)
            for k,v in ipairs(xPlayer.getLoadout()) do
                xPlayer.removeWeapon(v.name)
                ------print(v.name)
            end
            --MySQL.Sync.fetchScalar("UPDATE users SET stateDuty = '0' WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        else
            TriggerClientEvent('glmp_singlenotify', src, '', 'Du bist nicht im Dienst!')
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Fehler!')
    end

end)

ESX.RegisterServerCallback('byte_fraksystem:getDuty', function(source, cb)
    local src = source
    getStateDuty(src) 
    cb(staatsdienst[src])
end)

RegisterServerEvent('byte:server:parkkralle')
AddEventHandler('byte:server:parkkralle', function(plate, state)
    MySQL.Sync.fetchScalar("UPDATE `owned_vehicles` SET `sperre` = @state WHERE `plate` = @plate;", { ['@plate'] = plate, ['@state'] = state})
end) 

RegisterServerEvent('byte:server:frakparkkralle')
AddEventHandler('byte:server:frakparkkralle', function(plate, state)
    MySQL.Sync.fetchScalar("UPDATE `frak_vehicles` SET `sperre` = @state WHERE `plate` = @plate;", { ['@plate'] = plate, ['@state'] = state})
end) 


RegisterServerEvent('byte:removeItem')
AddEventHandler('byte:removeItem', function(item)
    ------print("remove item: ".. item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src) 
    xPlayer.removeInventoryItem(item, 0)
end)

RegisterCommand('orten', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == 'fib' then
        if args[1] ~= nil then
            if tonumber(args[1]) then

                local num = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE phone_number = @identifier", { ['@identifier'] = args[1]})
                if num ~= nil then
                    local xTarget = ESX.GetPlayerFromIdentifier(num)
                    if xTarget ~= nil then
                        local item = xTarget.getInventoryItem("phone")
                        if item.count > 0 then
                            local flug = MySQL.Sync.fetchScalar("SELECT flugmodus FROM users WHERE phone_number = @identifier", { ['@identifier'] = args[1]})
                            if flug == '0' then
                                TriggerClientEvent('glmp_singlenotify', source, '', 'Der Aktuelle Standort der Person wurde auf deiner Karte markiert!')
                                TriggerClientEvent('byte:checkPos', xTarget.source, source) 
                            else
                                TriggerClientEvent('glmp_singlenotify', source, '', 'Diese Person ist derzeit im Flugmodus!')
                            end
                        else
                            TriggerClientEvent('glmp_singlenotify', source, '', 'Die Person besitzt derzeitig kein Handy!')
                        end
                    else
                        TriggerClientEvent('glmp_singlenotify', source, '', 'Diese Person ist derzeit nicht auf der Insel!')
                    end
                else
                    TriggerClientEvent('glmp_singlenotify', source, '', 'Diese Nummer exestiert nicht.')
                end 
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Bitte gebe ein Gültiges Nummer-Format an.')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Bitte gebe eine Nummer an.')
        end
    end
end)

RegisterServerEvent('byte:setWayPoint')
AddEventHandler('byte:setWayPoint', function(target, x, y)
    TriggerClientEvent('byte:setWayPoint', target, x, y)
end)

haft = 0
ESX.RegisterServerCallback("byte:getWantedPlayer", function(source, cb)
	haft = 0
	local jailedPersons = {}
   

	local xPlayers = ESX.GetPlayers()
    ld = 0
    ld2 = 0
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.getJob().name ~= "police" then
            if xPlayer.getJob().name ~= "fib" then
                if xPlayer.getJob().name ~= "ambulance" then
                    if xPlayer.getJob().name ~= "dmv" then
                            MySQL.Async.fetchAll("SELECT * FROM player_crimes WHERE player = @ident", {['@ident'] = xPlayer.getIdentifier()}, function(result)
                                crimes = {}
                                
                                haft = 0
                                sank = 0 
                                t = nil
                                date = nil
                                name = nil
                                for i = 1, #result, 1 do
                                    ld2 = ld2 + 1 
                                    
                                    haft = haft + result[i].jailTime
                                    sank = sank + result[i].jailCosts
                                  ------print(result[i].name) 
                                end 
                                    
                                if haft > 1 then
                                    local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
                                    table.insert(jailedPersons, { name = rpname, jailTime = haft, identifier = xPlayer.getIdentifier() })
                                    ld = ld + 1
                                end
                            end)
                                
                            
                        
                    end
                end
            end
        end
        Wait(500)
		cb(jailedPersons)
	end
end)


RegisterCommand('getnumber', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == 'fib' then
        local name = args[1]
        local first, last = name:match("([^_]+)_([^_]+)")

        local num = MySQL.Sync.fetchScalar("SELECT phone_number FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })

        if num ~= nil then
            TriggerClientEvent('glmp_singlenotify', source, '', 'Die Nummer von '.. args[1] ..' ist '.. num.. '!')
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dieser Einwohner exestiert nicht.')
        end
    end
end)

RegisterCommand('gabnote', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == 'police' then
        if xPlayer.getJob().grade > 9 then

            local name = args[1]
            local first, last = name:match("([^_]+)_([^_]+)")

            local num = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })

            if num ~= nil then
                
                if tonumber(args[2]) then
                    ------print("is number")
                    if tonumber(args[2]) >= 0 then
                        ------print("check 1")
                        if tonumber(args[2]) < 11 then
                            ------print("checjk 2")
                            
                            local rpname = MySQL.Sync.fetchScalar("SELECT firstname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()}) .. '_' .. MySQL.Sync.fetchScalar("SELECT lastname FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
                            TriggerEvent('sendFraktionInfo', xPlayer.getJob().label, rpname .. ' hat die Academy Note '.. args[2] .. ' an '.. name ..' ausgestellt!')
                            local x = ESX.GetPlayerFromIdentifier(num)
                            if x ~= nil then
                                ------print("send info")
                                TriggerClientEvent('glmp_singlenotify', x.source, '', 'Du hast die Police Academy Note '.. args[2] .. ' erhalten!')
                            end
                            MySQL.Sync.fetchScalar("UPDATE users SET academynote = @note WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last, ['@note'] = args[2] })
                        else
                            TriggerClientEvent('glmp_singlenotify', source, '', 'Bitte gebe eine Note (0-10) an!')
                        end
                    else
                        TriggerClientEvent('glmp_singlenotify', source, '', 'Bitte gebe eine Note (0-10) an!')
                    end
                else
                    TriggerClientEvent('glmp_singlenotify', source, '', 'Bitte gebe eine Note (0-10) an!')
                end
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Dieser Einwohner exestiert nicht.')
            end
        end
    end
end)




RegisterCommand('givelic', function(source, args)
    ------print("givelic")
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getJob().name ~= 'dmv' then
    
        if xPlayer.getJob().name ~= 'ambulance' then
            ------print("return")
            return
        end 
    end
        local name = args[1]
        local first, last = name:match("([^_]+)_([^_]+)")

        local num = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })

        if num ~= nil then
            local xTarget = ESX.GetPlayerFromIdentifier(num)
            if xTarget ~= nil then 
                TriggerClientEvent('openGiveLicMenu', source, xTarget.source, name)
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Dieser Einwohner ist nicht online.')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dieser Einwohner exestiert nicht.')
        end


end)

RegisterCommand('takelic', function(source, args)
    ------print("givelic")
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getJob().name ~= 'police' then
    
        if xPlayer.getJob().name ~= 'fib' then
            ------print("return")
            return
        end 
    end
        local name = args[1]
        local first, last = name:match("([^_]+)_([^_]+)")

        local num = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })

        if num ~= nil then
            local xTarget = ESX.GetPlayerFromIdentifier(num)
            if xTarget ~= nil then  
                TriggerClientEvent('openTakeLicMenu', source, xTarget.source, name) 
            else
                TriggerClientEvent('glmp_singlenotify', source, '', 'Dieser Einwohner ist nicht online.')
            end
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Dieser Einwohner exestiert nicht.')
        end


end)

ESX.RegisterServerCallback('byte:isNameExists', function(first, last)
    ------print(first)
    ------print(last)
    local ident = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
    if ident ~= nil then
        cb(true)
    else
        cb(false)
    end

end)

ESX.RegisterServerCallback('byte:getPlayerId', function(source, cb)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    cb(xPlayer.source)
end)

RegisterServerEvent('byte:changePlayerNumber')
AddEventHandler('byte:changePlayerNumber', function()
    local number = math.random(1000, 9999)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= 750000 then
        local numberex = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE phone_number = @pn ", { ["@pn"] = number})
        if numberex == nil then
            xPlayer.removeMoney(750000)
            MySQL.Sync.fetchScalar("UPDATE users SET phone_number = @pn WHERE identifier = @ident", { ["@pn"] = number, ["ident"] = xPlayer.getIdentifier()})
            TriggerClientEvent('glmp_singlenotify', src, '', 'Deine Nummer wurde erfolgreich geändert!')
            TriggerClientEvent('glmp_singlenotify', src, 'green', 'Du bezahlst 750.000$')

        else
            TriggerEvent('byte:changePlayerNumber')
        end
    else
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast nicht genug Geld dabei.')
    end
end)