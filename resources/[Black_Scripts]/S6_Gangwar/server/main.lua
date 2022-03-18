ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Gangwardata = {
    attacker = nil,
    attackerpoints = 0,

    defender = nil,
    defenderpoints = 0
}

local Gangwardatak = nil
local Gangwardatav = nil
local currentgangwarid = nil

function resetgangwardata()
    Gangwardata.attacker = nil
    Gangwardata.attackerpoints = 0
    Gangwardata.defender = nil
    Gangwardata.defenderpoints = 0
    Gangwardatak = nil
    Gangwardatav = nil
    currentgangwarid = nil
end

local laststarter = nil

function winreward(fraktion)
    local random = math.random(1,#config.rewards)
    local random2 = math.random(1,#config.rewards)
    TriggerClientEvent("gagnwarsendnotify2", -1, fraktion, fraktion, 'Ihr habt Belohnungen durch das Gewinnen des Gangwars bekommen. Siehe in eure Waffenkammer für weitere Informationen!')
    MySQL.Async.fetchAll('SELECT * FROM jobs WHERE label = @label', {['@label'] = fraktion}, function(frak)
        for k,v in pairs(config.rewards) do
            if k == random then
                print(v.name)
                MySQL.Async.fetchAll('SELECT * FROM fraklager WHERE item = @item AND job = @job', {
                    ['@item'] = v.name, 
                    ['@job'] = frak[1].name
                }, function(result)
                    if #result ~= 0 then
                        if result[1].item == v.name then
                            MySQL.Async.execute('UPDATE fraklager SET count = @count WHERE item = @item AND job = @job', {
                                ['@count'] = tonumber(result[1].count) + v.amount,
                                ['@item'] = v.name, 
                                ['@job'] = frak[1].name
                            })
                        end
                    else
                        MySQL.Async.execute("INSERT INTO fraklager (job, item, count) VALUES (@job,@item,@count)", {
                            ['@job'] = frak[1].name,
                            ['@item'] = v.name,
                            ['@count'] = v.amount
                        })
                    end
                end)
            elseif k == random2 then
                print(v.name)
                MySQL.Async.fetchAll('SELECT * FROM fraklager WHERE item = @item AND job = @job', {
                    ['@item'] = v.name, 
                    ['@job'] = frak[1].name
                }, function(result)
                    if #result ~= 0 then
                        if result[1].item == v.name then
                            MySQL.Async.execute('UPDATE fraklager SET count = @count WHERE item = @item AND job = @job', {
                                ['@count'] = tonumber(result[1].count) + v.amount,
                                ['@item'] = v.name, 
                                ['@job'] = frak[1].name
                            })
                        end
                    else
                        MySQL.Async.execute("INSERT INTO fraklager (job, item, count) VALUES (@job,@item,@count)", {
                            ['@job'] = frak[1].name,
                            ['@item'] = v.name,
                            ['@count'] = v.amount
                        })
                    end
                end)
            end
        end
    end)
end

function StartGangwarTimer(time)
    local sekunde = 1000
    local minute = 60 * sekunde

    Gangwarzeit = time * minute / 1000
    TriggerClientEvent("StartTimer", -1, Gangwarzeit)

    Citizen.CreateThread(function()

        while Gangwarzeit > 0 do
            Citizen.Wait(1000)
            if Gangwarzeit > 0 then
				Gangwarzeit = Gangwarzeit - 1
			end
		end

        if Gangwarzeit == 0 then
            if Gangwardata.attackerpoints > Gangwardata.defenderpoints then
                TriggerClientEvent("StopGangwar", -1)
                TriggerClientEvent("gagnwarsendnotify2", -1, Gangwardata.attacker, Gangwardata.attacker, 'Ihr habt das Gangwar gegen '..Gangwardata.defender.. ' gewonnen und seid nun in besitz der Zone "'..Gangwardatak..'"')
                TriggerClientEvent("gagnwarsendnotify2", -1, Gangwardata.defender, Gangwardata.defender, 'Ihr habt das Gangwar gegen '..Gangwardata.attacker.. ' verloren und seid nun nicht mehr in besitz der Zone "'..Gangwardatak..'"')
                TriggerClientEvent("S6_gangwar:removeblip", -1, currentgangwarid)
                TriggerClientEvent("S6_gangwar:setBlips", -1, {{id = currentgangwarid,name = Gangwardatak,owner = Gangwardata.attacker}})
                MySQL.Async.execute('UPDATE gangwar SET owner = @owner WHERE name = @name',{['@owner'] =  Gangwardata.attacker,['@name'] =  Gangwardatak})  
                winreward(Gangwardata.attacker)  
                StartCooldwonZeit()

                resetgangwardata()
            elseif Gangwardata.attackerpoints < Gangwardata.defenderpoints then
                TriggerClientEvent("StopGangwar", -1)
                TriggerClientEvent("gagnwarsendnotify2", -1, Gangwardata.attacker, Gangwardata.attacker, 'Ihr habt das Gangwar gegen '..Gangwardata.defender.. ' verloren und seid nun nicht mehr in besitz der Zone "'..Gangwardatak..'"')
                TriggerClientEvent("gagnwarsendnotify2", -1, Gangwardata.defender, Gangwardata.defender, 'Ihr habt das Gangwar gegen '..Gangwardata.attacker.. ' gewonnen und seid nun in besitz der Zone "'..Gangwardatak..'"')
                winreward(Gangwardata.defender)  
                StartCooldwonZeit()

                resetgangwardata()
            elseif Gangwardata.attackerpoints == Gangwardata.defenderpoints then
                TriggerClientEvent("gagnwarsendnotify2", -1, Gangwardata.attacker, Gangwardata.attacker, "Gleichstand! + 5 Min")
                TriggerClientEvent("gagnwarsendnotify2", -1, Gangwardata.defender, Gangwardata.defender, "Gleichstand! + 5 Min")

                StartGangwarTimer(5)
            end
        end
    end)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

RegisterNetEvent('StartGangwar:Server')
AddEventHandler('StartGangwar:Server', function(k,v)
    local s = source
	local x = ESX.GetPlayerFromId(s)
    local job = x.getJob().label
    local xPlayers = ESX.GetPlayers()

    local frak1 = 0
    local frak2 = 0

    MySQL.Async.fetchAll('SELECT * FROM gangwar WHERE name = @name', {["name"] = k}, function(result)
        if #result ~= 0 then
            if not cooldown then
                if x.getJob().grade >= config.grade then
                    if laststarter ~= job then

                        for i=1, #xPlayers, 1 do
                            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                            if xPlayer.job.label == job then
                                frak1 = frak1 + 1
                            end
                        end

                        for i=1, #xPlayers, 1 do
                            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                            if xPlayer.job.label == result[1].owner then
                                frak2 = frak2 + 1
                            end
                        end

                        if frak2 >= config.Online and frak1 >= config.Online then
                            if Gangwardatak == nil then
                                if result[1].owner ~= job then
                                    TriggerClientEvent("StartGangwar:Client", -1, k, v, job, result[1].owner)
                                    Gangwardata.attacker = job
                                    Gangwardata.defender = result[1].owner
                                    Gangwardatak = k
                                    Gangwardatav = v
                                    Gangwardata.attackerpoints = Gangwardata.attackerpoints + 3
                                    currentgangwarid = result[1].id
                                    laststarter = job
                                    TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
                                    TriggerClientEvent("gagnwarsendnotify2", -1, result[1].owner, result[1].owner, "Die Sicherheitssysteme bei eurem Ganggebiet haben ein Alarm ausgelöst...")
                                    TriggerClientEvent("gagnwarsendnotify2", -1, job, job, 'Ihr greift nun das Ganggebiet "' .. result[1].name .. '" der Fraktion ' .. result[1].owner:gsub("^%l", string.upper) .. ' an!')
                                    StartGangwarTimer(45)
                                else
                                    TriggerClientEvent("notifications", s, "red", "Gangwar - Error", 'Das Ganggebiet "' .. result[1].name .. '" gehört deiner Fraktion bereits!')
                                end
                            else
                                TriggerClientEvent("notifications", s, "red", "Gangwar - Error", 'Es ist bereits ein Gangwar im gange...')
                            end
                        else
                            TriggerClientEvent("notifications", s, "red", "Gangwar - Error", 'Es müssen mindestens 6 Fraktionsmitglieder beider Fraktionen Online sein!')
                        end
                    else
                        TriggerClientEvent("notifications", s, "red", "Gangwar - Error", 'Ihr habt vor kurzem bereits ein Gangwar gestartet!')
                    end
                else
                    TriggerClientEvent("notifications", s, "red", "Gangwar - Error", 'Du musst mindestens Rang 10 sein um das Gangwar starten zu können!')
                end
            else
                TriggerClientEvent("notifications", s, "red", "Gangwar - Error", 'Bitte warte '..Cooldownzeit..' Sekunden um ein neues Gangwar starten zu können!')
            end
        else
            MySQL.Async.execute("INSERT INTO gangwar (name,owner) VALUES (@name,@owner)",
            {["@name"] = k, ["@owner"] = job})
        end
    end)
end)

RegisterNetEvent('addPointsFlagge')
AddEventHandler('addPointsFlagge', function()
    local s = source
	local x = ESX.GetPlayerFromId(s)

    local job = x.getJob().label

    if job == Gangwardata.attacker then
        Gangwardata.attackerpoints = Gangwardata.attackerpoints + 3
        TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
        TriggerClientEvent("gagnwarsendnotify", -1, job, job, "+ 3 Punkte für das einnehmen einer Flagge!")
    elseif job == Gangwardata.defender then
        Gangwardata.defenderpoints = Gangwardata.defenderpoints + 3
        TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
        TriggerClientEvent("gagnwarsendnotify", -1, job, job, "+ 3 Punkte für das einnehmen einer Flagge!")
    end
end)

RegisterNetEvent('addPointsKill')
AddEventHandler('addPointsKill', function(killersource)
    local s = source
	local x = ESX.GetPlayerFromId(s)

    local sk = killersource
	local xk = ESX.GetPlayerFromId(sk)

    if xk.getJob().label == Gangwardata.attacker then
        if x.getJob().label == Gangwardata.defender then
            Gangwardata.attackerpoints = Gangwardata.attackerpoints + 3
            TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
            GetRPName(s, function(Firstname, Lastname)
                TriggerClientEvent("gagnwarsendnotify", -1, xk.getJob().label, xk.getJob().label, "+3 Punkte für das Töten eines Gegners! ("..Firstname.."_"..Lastname..")")
            end)
        elseif x.getJob().label == Gangwardata.attacker then
            if Gangwardata.attackerpoints -3 >= 0 then
                Gangwardata.attackerpoints = Gangwardata.attackerpoints - 3
                TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
                GetRPName(s, function(Firstname, Lastname)
                    TriggerClientEvent("gagnwarsendnotify", -1, xk.getJob().label, xk.getJob().label, "-3 Punkte für das Töten eines Fraktionsmitgliedes! ("..Firstname.."_"..Lastname..")")
                end)
            end
        end
    elseif xk.getJob().label == Gangwardata.defender then
        if x.getJob().label == Gangwardata.attacker then
            Gangwardata.defenderpoints = Gangwardata.defenderpoints + 3
            TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
            GetRPName(s, function(Firstname, Lastname)
                TriggerClientEvent("gagnwarsendnotify", -1, xk.getJob().label, xk.getJob().label, "+3 Punkte für das Töten eines Gegners! ("..Firstname.."_"..Lastname..")")
            end)
        elseif x.getJob().label == Gangwardata.defender then
            if Gangwardata.defenderpoints -3 >= 0 then
                Gangwardata.defenderpoints = Gangwardata.defenderpoints - 3
                TriggerClientEvent("setPoints:client", -1, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
                GetRPName(s, function(Firstname, Lastname)
                    TriggerClientEvent("gagnwarsendnotify", -1, xk.getJob().label, xk.getJob().label, "-3 Punkte für das Töten eines Fraktionsmitgliedes! ("..Firstname.."_"..Lastname..")")
                end)
            end
        end
    end
end)

RegisterServerEvent('S6_gangwar:setBlips')
AddEventHandler('S6_gangwar:setBlips', function()
    local s = source
	local x = ESX.GetPlayerFromId(s)

    MySQL.Async.fetchAll('SELECT * FROM gangwar', {}, function(result)
        TriggerClientEvent("S6_gangwar:setBlips", s, result)
    end)
end)

RegisterNetEvent('S6_gangwar:getData')
AddEventHandler('S6_gangwar:getData', function()
    local s = source
	local x = ESX.GetPlayerFromId(s)

    if Gangwardatak ~= nil then
        TriggerClientEvent("StartGangwar:Client", s, Gangwardatak, Gangwardatav, Gangwardata.attacker, Gangwardata.defender)
        TriggerClientEvent("setPoints:client", s, Gangwardata.attackerpoints, Gangwardata.defenderpoints)
        TriggerClientEvent("StartTimer", s, Gangwarzeit)
    end
end)

function StartCooldwonZeit()
    local sekunde = 1000
    local minute = 60 * sekunde

    Cooldownzeit = 20 * minute / 1000

    Citizen.CreateThread(function()
        while Cooldownzeit > 0 do
            Citizen.Wait(1000)
            cooldown = true
            if Cooldownzeit > 0 then
				Cooldownzeit = Cooldownzeit - 1
			end
		end

        if Gangwarzeit == 0 then
            cooldown = false
        end
    end)
end