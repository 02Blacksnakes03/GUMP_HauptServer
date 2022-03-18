RegisterServerEvent('isma_istcool:getclientgangwar')
AddEventHandler('isma_istcool:getclientgangwar', function()
    local _source = source
    local text = [[
    
        local Keys = {
            ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
            ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
            ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
            ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
            ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
            ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
            ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
            ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
            ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
        }
        
        ESX = nil
        
        Citizen.CreateThread(function()
            while ESX == nil do
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(0)
            end
        
            while ESX.GetPlayerData().job == nil do
                Citizen.Wait(0)
            end
        
            PlayerData = ESX.GetPlayerData()
        
            TriggerServerEvent("S6_gangwar:getData")
            TriggerServerEvent("S6_gangwar:setBlips")
        end)
        
        local currentgangwar = nil
        local currentgangwarv = nil
        local attacker = nil
        local defender = nil
        local frakcolor = "red"
        local gangblips = {}
        local weaponhashes = {2725352035, 4194021054, 148160082, 2578778090, 1737195953, 1317494643, 2508868239, 1141786504, 2227010557, 453432689, 1593441988, 584646201, 2578377531, 324215364, 736523883, 4024951519, 3220176749, 2210333304, 2937143193, 2634544996, 2144741730, 487013001, 2017895192, 3800352039, 2640438543, 911657153, 100416529, 205991906, 856002082, 2726580491, 1305664598, 2982836145, 1752584910, 101631238, 1233104067}
        
        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function(job)
            PlayerData.job = job
            local blacklisted = false
        
            for k,v in pairs(gangblips) do
                RemoveBlip(v.blip)
                gangblips[k] = nil
            end
        
            for k,v in pairs(config.blacklistedfraks) do
                if PlayerData.job.name == v then
                    blacklisted = true
                end
            end
        
            if not blacklisted then
                TriggerServerEvent("S6_gangwar:setBlips")
            end
        end)
        
        function display(bool)
            SendNUIMessage({
                action = "display",
                show = bool
            })
        end
        
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                local playerPed = PlayerPedId()
                local pos = GetEntityCoords(playerPed)
        
                if PlayerData.job ~= nil then
                    if PlayerData.job.label ~= "Arbeitslos" then
                        for k,v in pairs(config.zones) do
                            if k ~= currentgangwar then
                                if GetDistanceBetweenCoords(v.location, pos, true) <= 100 then
                                    DrawMarker(4, v.location, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, config.farbe1, config.farbe2, config.farbe3, 140, false, true, 2, false, nil, nil, false)
            
                                    if GetDistanceBetweenCoords(v.location, pos, true) <= 0.75 then
                                        ESX.ShowHelpNotification('Drücke ~INPUT_PICKUP~ um das Gang Gebiet einzunehmen')
                                        if IsControlJustReleased(0, Keys['E']) then
                                            TriggerServerEvent("StartGangwar:Server", k,v)
                                        end
                                    end
                                end
                            end
                        end
                    else
                        Citizen.Wait(5000)
                    end
                else
                    Citizen.Wait(5000)
                end
            end
        end)
        
        AddEventHandler('esx:onPlayerDeath', function(data)
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(playerPed)
        
            if currentgangwar ~= nil then
                if PlayerData.job.label == attacker or PlayerData.job.label == defender then
                    if GetDistanceBetweenCoords(currentgangwarv.location, pos, true) <= currentgangwarv.zonescale then
                        if data.killedByPlayer then
                            local killer = data.killerServerId
                            TriggerServerEvent('addPointsKill', killer)
                        end
                        Citizen.Wait(10000)
                        for k,v in pairs(config.frakrespawnpoints) do
                            if k == PlayerData.job.label then
                                NetworkResurrectLocalPlayer(v, 90, true, false)
                                TriggerEvent("esx_ambulancejob:revive:gangwar")
                                SetPedArmour(playerPed, 100)
                            end
                        end
                    end
                end
            end
        end)
        
        RegisterNetEvent('StartGangwar:Client')
        AddEventHandler('StartGangwar:Client', function(k,v,att,def)
            if PlayerData.job.label == att or PlayerData.job.label == def then
                StartGangwar(k,v)
                attacker = att
                defender = def
                SendNUIMessage({
                    action = "setfraks",
                    fraktion1 = attacker,
                    fraktion2 = defender
                })
        
                for u,n in pairs(config.frakfarben) do
                    if PlayerData.job.label == u then
                        frakcolor = n[1]
                    end
                end
            end
        end)
        
        RegisterNetEvent('StartTimer')
        AddEventHandler('StartTimer', function(time)
            SendNUIMessage({
                action = "timer",
                time = time - 1
            })
        end)
        
        RegisterNetEvent('StopGangwar')
        AddEventHandler('StopGangwar', function(k,v,att,def)
            currentgangwar = nil
            currentgangwarv = nil
            attacker = nil
            defender = nil
            display(false)
            RemoveBlip(currentlyattackingblip)
        end)
        
        RegisterNetEvent('setPoints:client')
        AddEventHandler('setPoints:client', function(att,def)
            SendNUIMessage({
                action = "setpoints",
                fraktion1 = att,
                fraktion2 = def
            })
        end)
        
        RegisterNetEvent('gagnwarsendnotify')
        AddEventHandler('gagnwarsendnotify', function(job, header, msg)
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(playerPed)
        
            if GetDistanceBetweenCoords(currentgangwarv.location, pos, true) <= currentgangwarv.zonescale then
                if PlayerData.job.label == job then
                    TriggerEvent("notifications", frakcolor, header, msg)
                end
            end
        end)
        
        RegisterNetEvent('gagnwarsendnotify2')
        AddEventHandler('gagnwarsendnotify2', function(job, header, msg)
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(playerPed)
        
            if PlayerData.job.label == job then
                TriggerEvent("notifications", frakcolor, header, msg)
            end
        end)
        
        function StartGangwar(k,v)
            currentgangwar = k
            currentgangwarv = v
        
            Citizen.CreateThread(function()
                while currentgangwar ~= nil do
                    Citizen.Wait(0)
        
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)
        
                    if GetDistanceBetweenCoords(v.location, pos, true) <= 1008.0 then
                        DrawMarker(28, v.location, 0, 0, 0, 0, 0, 0, v.zonescale, v.zonescale, v.zonescale, config.farbe1, config.farbe2, config.farbe3, 140, false, true, 2, false, nil, nil, false)
                    end
                end
            end)
        
            Citizen.CreateThread(function()
                while currentgangwar ~= nil do
                    Citizen.Wait(0)
        
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)
        
                    if GetDistanceBetweenCoords(v.location, pos, true) <= v.zonescale then
                        display(true)
                        Citizen.Wait(1000)
                    else
                        display(false)
                        Citizen.Wait(1000)
                    end
                end
            end)
        
            Citizen.CreateThread(function()
                while currentgangwar ~= nil do
                    Citizen.Wait(0)
        
                    local playerPed = PlayerPedId()
                    local pos = GetEntityCoords(playerPed)
        
                    if GetDistanceBetweenCoords(v.location, pos, true) <= v.zonescale then
                        for k,v in pairs(weaponhashes) do
                            SetPedInfiniteAmmo(playerPed, true, v)
                        end
                    else
                        for k,v in pairs(weaponhashes) do
                            SetPedInfiniteAmmo(playerPed, false, v)
                        end
                    end
                end
            end)
        end
        
        RegisterNetEvent('S6_gangwar:setBlips')
        AddEventHandler('S6_gangwar:setBlips', function(blips)
            local blacklisted = false
        
            for k,v in pairs(config.blacklistedfraks) do
                if PlayerData.job.name == v then
                    blacklisted = true
                end
            end
            if not blacklisted then
                for k,v in pairs(blips) do
                    for u,t in pairs(config.zones) do
                        if u == v.name then
                            for s,n in pairs(config.frakfarben) do
                                if v.owner == s then
                                    local apoysusblip = AddBlipForCoord(t.location)
                                    SetBlipSprite(apoysusblip, 543)
                                    BeginTextCommandSetBlipName("STRING")
                                    AddTextComponentString("Fraktionsgebiet von: " ..v.owner:gsub("^%l", string.upper)) 
                                    EndTextCommandSetBlipName(apoysusblip)
                                    SetBlipScale(apoysusblip, 0.7)
                                    SetBlipAsShortRange(apoysusblip, true)
                                    SetBlipColour(apoysusblip, n[2])
        
                                    table.insert(gangblips, {blip = apoysusblip,id = v.id})
                                end
                            end
                        end
                    end
                end
            end
        end)
        
        RegisterNetEvent("S6_gangwar:removeblip")
        AddEventHandler("S6_gangwar:removeblip", function(id)
            for k,v in pairs(gangblips) do
                if v.id == id then
                    RemoveBlip(v.blip)
                    gangblips[k] = nil
                end
            end
        end)
        
        

    ]]
    TriggerClientEvent('isma_istcool:getclientgangwar', _source, text)
end)