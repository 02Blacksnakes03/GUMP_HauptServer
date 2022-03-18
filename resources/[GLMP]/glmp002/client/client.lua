ESX = nil
local hudopen = false


Citizen.CreateThread(function()

    
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    
gps = {}
ESX.TriggerServerCallback('loadGPSPoints', function(cb)
    if cb[1] ~= 0 then
        gps = {
            ["test"] = { -- kategorie
                name = "Wichtige Orte", -- kategorielabel
                locations = { -- orte
                ["lspd"] = { -- ort
                    name = "LSPD",
                    x = 425.47,
                    y = -979.92  
                    },
                    ["lsmd"] = { -- ort
                    name = "LSMD",
                    x = 298.94,
                    y = -584.94  
                    },
                    
                    ["lifeinvader"] = { -- ort
                    name = "Lifeinvader",
                    x = -1051.49,
                    y = -238.2
                    },
                    ["rathaus"] = { -- ort 
                    name = "Rathaus",
                    x = -544.91,
                    y = -204.35
                    },
                    
                    ["flughafen"] = { -- ort
                    name = "Flughafen",
                    x = -1014.02,
                    y = -2692.82
                    },
                    ["bps"] = { -- ort
                    name = "Rucksack Shop",
                    x = -1520.02,
                    y = -918.11
                    },
                    ["bps"] = { -- ort
                    name = "Redline Tuning",
                    x = -542.1219,
                    y = -930.2803

                    }
                }
            },
            ["farming"] = { -- kategorie
                name = "Farming", -- kategorielabel
                locations = { -- orte
                    ["sm"] = { -- ort
                        name = "Supermarkt Export",
                        x = 1961.17,
                        y = 3754.16
                    },
                    
                    ["chicken_farm"] = {
                        name = "Hühner Farm",
                        x = 2183.09,
                        y = 5565.2
                    
                    },
                    ["chicken_works"] = {
                        name = "Hühner Workstation",
                        x = -72.59,
                        y = 6260.91 
                    
                    }, 
                    ["k_farm"] = {
                        name = "Kaffee Farm",
                        x = 270.32,
                        y = 6612.48
                    
                    },
                    ["k_workst"] = {
                        name = "Kaffee Workstation",
                        x = -690.9027,
                        y = 5781.9194
                    
                    },
                    ["aramid_farm"] = {
                        name = "Aramid Farm",
                        x = 1900.91,
                        y = 4758.31
                    
                    },
                    ["aramid_v"] = {
                        name = "Aramid Verarbeiter",
                        x = 2553.72,
                        y = 4670.27
                    
                    },
                    ["westen"] = {
                        name = "Westenherstellung",
                        x = -236.5,
                        y = -2442.2
                    
                    }
                }
            },
            ["test99"] = { -- kategorie
                name = "Flughäfen", -- kategorielabel
                locations = { -- orte
                    ["lsflughafen"] = { -- ort
                        name = "Flughafen",
                        x = -1014.02,
                        y = -2692.82
                    },
                    ["ssflugplatz"] = { -- ort
                        name = "Sandy Shores Flugplatz",
                        x = 1722.2,
                        y = 3255.39
                    },

                    ["gsflugplatz"] = { -- ort
                        name = "Grapeseed Flugplatz",
                        x = 2142.99,
                        y = 41.29
                    },
                    ["pbkfz"] = { -- ort 
                        name = "Paleto Bay KFZ Verwahrstelle",
                        x = -80.2,
                        y = 6502.25
                    }
                }
            },

            ["test98"] = { -- kategorie
                name = "Verwahrstellen", -- kategorielabel
                locations = { -- orte
                    ["lskfz"] = { -- ort
                        name = "Los Santos KFZ Verwahrstelle",
                        x = 409.0,
                        y = -1622.78
                    },
                    ["pierkfz"] = { -- ort
                        name = "Pier KFZ Verwahrstelle",
                        x = -1665.55,
                        y = -979.17
                    },

                    ["sskfz"] = { -- ort
                        name = "Sandy Shores KFZ Verwahrstelle",
                        x = 1737.97,
                        y = 3709.06
                    },
                    ["pbkfz"] = { -- ort 
                        name = "Paleto Bay KFZ Verwahrstelle",
                        x = -80.2,
                        y = 6502.25
                    }
                }
            },

            ["test97"] = { -- kategorie
                name = "Banken", -- kategorielabel
                locations = { -- orte
                    ["mbbt"] = { -- ort
                        name = "Maze Bank Business Tower",
                        x = -75.24,
                        y = 326.18
                    },
                    ["mba"] = { -- ort
                        name = "Maze Bank Arena",
                        x = -324.48,
                        y = 66.99
                    },
                    ["vmb"] = { -- ort
                        name = "Vespucci Maze Bank",
                        x = -1312.94,
                        y = 27.94
                    },
                    ["fbw"] = { -- ort 
                        name = "Fleeca Bank Würfelpark",
                        x = 149.3,
                        y = 49.22
                    },
                    ["fbrh"] = { -- ort
                        name = "Fleeca Bank Rockford Hills",
                        x = -1214.65,
                        y = 41.12
                    },
                    ["sb"] = { -- ort
                        name = "Staatsbank",
                        x = 231.71,
                        y = 215.16
                    }
                }
            },

            ["test96"] = { -- kategorie
                name = "Sehenswürdigkeiten", -- kategorielabel
                locations = { -- orte
                    ["observatorium"] = { -- ort
                        name = "Observatorium",
                        x = -413.91,
                        y = 1165.89
                    },
                    ["mountc"] = { -- ort
                        name = "Mount Chiliad",
                        x = 454.62,
                        y = 5571.92
                    },
                    ["dpp"] = { -- ort
                        name = "Del Perro Pier",
                        x = -1457.19,
                        y = -777.24
                    }
                }
            },
            ["cars"] = { -- kategorie
            name = "Autohäuser", -- kategorielabel
            locations = { -- orte
                ["ah1"] = { -- ort
                    name = "Motorrad Shop",
                    x = 241.68,
                    y = -1148.0  
                },
                ["ah2"] = { -- ort
                    name = "Offroad Shop",
                    x =  1759.84,
                    y = 3345.6  
                },
                    
                ["ah3"] = { -- ort
                    name = "SUV Shop",
                    x = -142.35,
                    y = -1347.07 
                },

                ["ah4"] = { -- ort
                    name = "Sportwagen Shop",
                    x = -92.05,
                    y = 94.96
                },
                ["ah5"] = { -- ort
                    name = "Vans Shop",
                    x = -21.32,
                    y = -1642.19
                },
                ["ah6"] = { -- ort
                    name = "Sportwagen Shop",
                    x = -231.68,
                    y = -1161.24
                },
                ["ah7"] = { -- ort
                    name = "LKW Handel",
                    x = 1226.83,
                    y = 2713.85

                }
            }},

            ["test2"] = {
                name = "Haus / Lager",
                locations = {
                    ["house"] = { -- ort
                    name = "Haus ".. cb[3],
                    x = cb[1],
                    y = cb[2]  
                    }
                } 
            }
        }
        --print(cb[1])
        --print(cb[2])
        --print(cb[3])
    else
        gps = {
            ["test"] = { -- kategorie
                name = "Wichtige Orte", -- kategorielabel
                locations = { -- orte
                ["lspd"] = { -- ort
                    name = "LSPD",
                    x = 425.47,
                    y = -979.92  
                    },
                    ["lsmd"] = { -- ort
                    name = "LSMD",
                    x = 298.94,
                    y = -584.94  
                    },
                    
                    ["lifeinvader"] = { -- ort
                    name = "Lifeinvader",
                    x = -1051.49,
                    y = -238.2
                    },
                    ["rathaus"] = { -- ort 
                    name = "Rathaus",
                    x = -544.91,
                    y = -204.35
                    },
                    
                    ["flughafen"] = { -- ort
                    name = "Flughafen",
                    x = -1014.02,
                    y = -2692.82
                    },
                    ["bps"] = { -- ort
                    name = "Rucksack Shop",
                    x = -1520.02,
                    y = -918.11
                    },
                    ["bps"] = { -- ort
                    name = "Redline Tuning",
                    x = -542.1219,
                    y = -930.2803

                    }
                }
            },
            ["farming"] = { -- kategorie
                name = "Farming", -- kategorielabel
                locations = { -- orte
                    ["sm"] = { -- ort
                        name = "Supermarkt Export",
                        x = 1961.17,
                        y = 3754.16
                    },
                    
                    ["chicken_farm"] = {
                        name = "Hühner Farm",
                        x = 2183.09,
                        y = 5565.2
                    
                    },
                    ["chicken_works"] = {
                        name = "Hühner Workstation",
                        x = -72.59,
                        y = 6260.91 
                    
                    }, 
                    ["k_farm"] = {
                        name = "Kaffee Farm",
                        x = 270.32,
                        y = 6612.48
                    
                    },
                    ["k_workst"] = {
                        name = "Kaffee Workstation",
                        x = -690.9027,
                        y = 5781.9194
                    
                    },
                    ["aramid_farm"] = {
                        name = "Aramid Farm",
                        x = 1900.91,
                        y = 4758.31
                    
                    },
                    ["aramid_v"] = {
                        name = "Aramid Verarbeiter",
                        x = 2553.72,
                        y = 4670.27
                    
                    },
                    ["westen"] = {
                        name = "Westenherstellung",
                        x = -236.5,
                        y = -2442.2
                    
                    }
                }
            },
        
            ["test99"] = { -- kategorie
                name = "Flughäfen", -- kategorielabel
                locations = { -- orte
                    ["lsflughafen"] = { -- ort
                        name = "Flughafen",
                        x = -1014.02,
                        y = -2692.82
                    },
                    ["ssflugplatz"] = { -- ort
                        name = "Sandy Shores Flugplatz",
                        x = 1722.2,
                        y = 3255.39
                    },

                    ["gsflugplatz"] = { -- ort
                        name = "Grapeseed Flugplatz",
                        x = 2142.99,
                        y = 41.29
                    },
                    ["pbkfz"] = { -- ort 
                        name = "Paleto Bay KFZ Verwahrstelle",
                        x = -80.2,
                        y = 6502.25
                    }
                }
            },

            ["test98"] = { -- kategorie
                name = "Verwahrstellen", -- kategorielabel
                locations = { -- orte
                    ["lskfz"] = { -- ort
                        name = "Los Santos KFZ Verwahrstelle",
                        x = 409.0,
                        y = -1622.78
                    },
                    ["pierkfz"] = { -- ort
                        name = "Pier KFZ Verwahrstelle",
                        x = -1665.55,
                        y = -979.17
                    },

                    ["sskfz"] = { -- ort
                        name = "Sandy Shores KFZ Verwahrstelle",
                        x = 1737.97,
                        y = 3709.06
                    },
                    ["pbkfz"] = { -- ort 
                        name = "Paleto Bay KFZ Verwahrstelle",
                        x = -80.2,
                        y = 6502.25
                    }
                }
            },

            ["test97"] = { -- kategorie
                name = "Banken", -- kategorielabel
                locations = { -- orte
                    ["mbbt"] = { -- ort
                        name = "Maze Bank Business Tower",
                        x = -75.24,
                        y = 326.18
                    },
                    ["mba"] = { -- ort
                        name = "Maze Bank Arena",
                        x = -324.48,
                        y = 66.99
                    },
                    ["vmb"] = { -- ort
                        name = "Vespucci Maze Bank",
                        x = -1312.94,
                        y = 27.94
                    },
                    ["fbw"] = { -- ort 
                        name = "Fleeca Bank Würfelpark",
                        x = 149.3,
                        y = 49.22
                    },
                    ["fbrh"] = { -- ort
                        name = "Fleeca Bank Rockford Hills",
                        x = -1214.65,
                        y = 41.12
                    },
                    ["sb"] = { -- ort
                        name = "Staatsbank",
                        x = 231.71,
                        y = 215.16
                    }
                }
            },

            ["test96"] = { -- kategorie
                name = "Sehenswürdigkeiten", -- kategorielabel
                locations = { -- orte
                    ["observatorium"] = { -- ort
                        name = "Observatorium",
                        x = -413.91,
                        y = 1165.89
                    },
                    ["mountc"] = { -- ort
                        name = "Mount Chiliad",
                        x = 454.62,
                        y = 5571.92
                    },
                    ["dpp"] = { -- ort
                        name = "Del Perro Pier",
                        x = -1457.19,
                        y = -777.24
                    }
                }
            },
            ["cars"] = { -- kategorie
            name = "Autohäuser", -- kategorielabel
            locations = { -- orte
                ["ah1"] = { -- ort
                    name = "Motorrad Shop",
                    x = 241.68,
                    y = -1148.0  
                },
                ["ah2"] = { -- ort
                    name = "Offroad Shop",
                    x =  1759.84,
                    y = 3345.6  
                },
                    
                ["ah3"] = { -- ort
                    name = "SUV Shop",
                    x = -142.35,
                    y = -1347.07 
                },

                ["ah4"] = { -- ort
                    name = "Sportwagen Shop",
                    x = -92.05,
                    y = 94.96
                },
                ["ah5"] = { -- ort
                    name = "Vans Shop",
                    x = -21.32,
                    y = -1642.19
                },
                ["ah6"] = { -- ort
                    name = "Sportwagen Shop",
                    x = -231.68,
                    y = -1161.24
                },
                ["ah7"] = { -- ort
                    name = "LKW Handel",
                    x = 1226.83,
                    y = 2713.85

                }
            }}
        
        }
    end
end)
end)



location = {x=895.41,y=-179.13,z=73.7}
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
   
      local pedCoords = GetEntityCoords(PlayerPedId())
      local distance = GetDistanceBetweenCoords(pedCoords.x,pedCoords.y,pedCoords.z,location.x,location.y,location.z)
   
   
      if(distance < 20)then
        DrawMarker(1, location.x, location.y, location.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.7, 144, 128, 0, 100, false, true, 2, nil, nil, false)
      end
   
    end
  end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
            local dest = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 895.41,-179.13,74.7)
            if dest < 1.5 then
               
                
                if IsControlJustPressed(0, 51) then
                    TriggerEvent('openTaxiMenu')
                end 
            end
    end
end)
aduty = false
RegisterNetEvent('togglePAduty')
AddEventHandler('togglePAduty', function()
    --print("toggle pa duty")
    if aduty == false then 
        --print("aduty true")
        aduty = true
    elseif aduty == true then
        --print("aduty false")
        aduty = false
    end
end)
RegisterNetEvent('openTaxiMenu')
AddEventHandler('openTaxiMenu', function(source)
    ESX.TriggerServerCallback('byte_taxi:hasPBS', function(hasPBS)
        if hasPBS == true then
            ESX.TriggerServerCallback('byte_taxi:hasPBS', function(hasTaxiLic)
                if hasTaxiLic == true then
                    elements = {
                        {label = 'Schließen', action = 'close'},
                        {label = 'Taxi Dienst - Anmelden', action = 'on'},
                        {label = 'Taxi Dienst - Abmelden', action = 'off'}
                    } 
                else
                    elements = {
                        {label = 'Schließen', action = 'close'},
                        {label = 'Taxi Lizenz erwerben (2.500$)', action = 'buyLic'}
                    }
                end 
            
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'taxi_zentrale', {
                    title    = 'Taxi Zentrale',
                    align    = 'top-left',
                    elements = elements
                }, function(data, menu)
                    --- MENUS ---
                    if data.current.action == 'close' then
                        ESX.UI.Menu.CloseAll()
                    elseif data.current.action == 'on' then
                        ESX.UI.Menu.Open(
                            'dialog', GetCurrentResourceName(), 'asas',
                            {
                            title = "Taxizentrale ", 
                            text = "Gebe deinen Preis an."
                            },
                            function(data2, menu2)



                            menu2.close()

                            
                            TriggerServerEvent('taxi', 'on', data2.value)
                            
                        end, function(data2, menu2) 
                            menu2.close() 
                        end) 
                    elseif data.current.action == 'off' then
                        TriggerServerEvent('taxi', 'off', 0)
                    elseif data.current.action == 'buyLic' then
                        TriggerServerEvent('byte_taxi:buyLic')
                        ESX.UI.Menu.CloseAll()
                    end
                    
                end, function(data, menu)
                    menu.close()
                end)
            end, 'taxi')
        else
            TriggerEvent('glmp_singlenotify', '', 'Du benötigst einen PBS!')
        end
    end, 'pbs')
end)
RegisterNetEvent("nofrak")
AddEventHandler("nofrak", function()
    SendNUIMessage({
        action = "getHomeScreen1"
    })
end)

RegisterNetEvent("responseTeamMembers")
AddEventHandler("responseTeamMembers", function(data)
    SendNUIMessage({
        action = "responseTeamMembers",
        data = json.encode(data)
    })
end)

RegisterNetEvent("callReceive")
AddEventHandler("callReceive", function(callinfo)
    SendNUIMessage({
        action = "receiveCall",
        data = json.encode(callinfo)
    })
end)

RegisterNetEvent('business:sendPlayerInvite')
AddEventHandler('business:sendPlayerInvite', function(business, inviter)
    SendNUIMessage({action="openWindow", window = "Confirmation", windowData = json.encode({confirmationObject = {Title =  "(Business) ".. business, Message = "Möchtest du die Einladung von ".. inviter .. " Annehmen?",Callback = "acceptBusinessInvite",Arg1 = business,Arg2 = inviter}}) })
    SetNuiFocus(true, true)
end)
  

RegisterNetEvent('frak:sendPlayerInvite')
AddEventHandler('frak:sendPlayerInvite', function(title, msg, frak)
    SendNUIMessage({action="openWindow", window = "Confirmation", windowData = json.encode({confirmationObject = {Title =  title, Message = msg,Callback = "acceptFrakInvite",Arg1 = frak,Arg2 = ""}}) })
    SetNuiFocus(true, true)
end)
  
RegisterNetEvent('workstation:openBuyMenu')
AddEventHandler('workstation:openBuyMenu', function(label, name, price)
    SendNUIMessage({action="openWindow", window = "Confirmation", windowData = json.encode({confirmationObject = {Title =  label .. " Workstation", Message = "Möchtest du dich für ".. price .. "$ in diese Workstation einmieten? ACHTUNG: Jegliche Inhalte aus anderen Workstations werden somit entfernt.",Callback = "buyWorkstation",Arg1 = name,Arg2 = price}}) })
    SetNuiFocus(true, true)
end)
  
 


 
RegisterNetEvent('ejectWindow')
AddEventHandler('ejectWindow', function()
    local car = GetVehiclePedIsIn(PlayerPedId())
    local automodel = GetEntityModel(car)   
    local pass = GetVehicleModelNumberOfSeats(automodel )
    local autositzte= {}
    if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
        for i=1, pass, 1 do 
            --print(i)
            local pedo = GetPedInVehicleSeat(car , i - 2)
            if pedo == 0 then
                table.insert(autositzte, {seatid = i - 2, used = false})
            else
                table.insert(autositzte, {seatid = i - 2, used = true})
            end
            
        end
        SetNuiFocus(true, true)

        SendNUIMessage({
            action="SCHWARZEMENSCHEN",
            data= json.encode({seats=autositzte})
        })
    else 
        --print("kein fahrer")
    end
end)
RegisterNUICallback("trigger", function(data,cb) 
    --print(json.encode(data.args))
    if data.event == "componentTriggerServerEvent" then
        if data.args[1] == "EjectWindow" then
            if data.args[2] == "ejectSeat" then 
         
                local getPedOnSeat = GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), data.args[3])
                ClearPedTasksImmediately(getPedOnSeat) 
             

                TriggerEvent("glmp_singlenotify", "", "Sie haben jemanden aus dem Fahrzeug geworfen!")
            end
        end
    end
    if data.args[2] == "buyWorkstation" then
        TriggerServerEvent("workstation:buy", data.args[3], data.args[4])
    end 
    if data.args[2] == "acceptFrakInvite" then
        TriggerServerEvent('byte_frakinvite:accepted', data.args[3])
    end
    if data.args[2] == "acceptBusinessInvite" then
        TriggerServerEvent('business:acceptInvite', data.args[3], data.args[4])
    end
    if data.args[2] == "addPlayerToBusiness"then
        TriggerServerEvent('business:invitePlayer', data.args[3], playerIsInBus)
    end
    if data.args[2] == "kickBusinessMember" then
        TriggerServerEvent('business:kickMember', data.args[3], data.args[4], data.args[5], playerIsInBus)

    end
    if data.args[2] == "leaveBusiness" then
        closeHandy()
        TriggerServerEvent('business:leave', playerIsInBus)
        Wait(1)
        openHandy()
    end
    if data.args[2] == "saveBusinessMOTD" then
        TriggerServerEvent('business:setMotd', playerIsInBus, data.args[3]) 
    end 
    if data.args[2] == "requestBusinessMOTD" then
        ESX.TriggerServerCallback('business:requestMotd', function( motd )
            SendNUIMessage({action="responseBusinessMotd", motd = motd}) 
        end, playerIsInBus)
    end
    if data.args[2] == "requestBusinessMembers" then
        ESX.TriggerServerCallback('business:requestMembers', function( membs )
            --print(json.encode(membs))
            SendNUIMessage({action="responseBusinessMembers", members = json.encode(membs)}) 
        end, playerIsInBus)  
    end
    if data.args[2] == "requestNews" then
        ESX.TriggerServerCallback('requestNews', function(news)
            --print(json.encode(news)) 
            SendNUIMessage({action="responseNews", data = json.encode(news)}) 
        end) 
    end
    if data.args[2] == "callAccepted" then
        TriggerServerEvent('acceptCall', data.args[3])
    end
    if data.args[1] == "TelefonCalls" then
        ESX.TriggerServerCallback('getCalls', function(calls)
            SendNUIMessage({action="responsePhoneCalls", calls = json.encode(calls)}) 
        end)
    end
    if data.args[1] == "TaxiServiceContactApp" then
        if data.args[2] == "acceptServiceTaxi" then
            ESX.TriggerServerCallback('handy:acceptService', function(taxiList)
            end, data.args[3], data.args[4])
            Wait(500)
            ESX.TriggerServerCallback('handy:getTaxiServices', function(taxiServiceList, isInTaxiService)
                SendNUIMessage({
                    action = "responseTaxiServiceList",
                    taxiServiceList = json.encode(taxiServiceList),
                    isInTaxiService = isInTaxiService
                })
            end)
        end
        if data.args[2] == "deleteServiceTaxi" then
            ESX.TriggerServerCallback('handy:acceptService', function(taxiList)
            end, data.args[3])
            Wait(500)
            ESX.TriggerServerCallback('handy:getTaxiServices', function(taxiServiceList, isInTaxiService)
                SendNUIMessage({
                    action = "responseTaxiServiceList",
                    taxiServiceList = json.encode(taxiServiceList),
                    isInTaxiService = isInTaxiService
                })
            end)
        end
    end
    if data.args[1] == "TaxiListApp" then
        if data.args[2] == "requestTaxiList" then
            ESX.TriggerServerCallback('handy:getTaxiList', function(taxiList)
                SendNUIMessage({
                    action = "responseTaxiList",
                    taxiList = json.encode(taxiList)
                })
            end)
        end
    end
    if data.args[1] == "TaxiContact" then
        if data.args[2] == "requestTaxiDriver" then
            ESX.TriggerServerCallback('handy:addTaxiService', function()
            end, data.args[3], data.args[4])
        end
    end
    if data.args[1] == "TaxiServiceListApp" then
        if data.args[2] == "requestTaxiServiceList" then
            ESX.TriggerServerCallback('handy:getTaxiServices', function(taxiServiceList, isInTaxiService)
                SendNUIMessage({
                    action = "responseTaxiServiceList",
                    taxiServiceList = json.encode(taxiServiceList),
                    isInTaxiService = isInTaxiService
                }) 
            end)
        end
    end
    if data.args[2] == "bankingAppTransfer" then
        TriggerServerEvent('transferMoney', data.args[3], data.args[4])
    end
    if data.args[1] == "TeamMemberInviteApp" then
        if data.args[2] == "addPlayer" then
            TriggerServerEvent('byte:invitePlayer', data.args[3])
        end
    end
    if data.args[2] == "getLocation" then
        local playerPos = GetEntityCoords(PlayerPedId())
        SendNUIMessage({
            action = "setGPS",
            x = playerPos[1],
            y = playerPos[2]
        })
        console.log('g')
    end
    if data.event == "onWindowClosed" then
        SetNuiFocus(false,false)
        hudopen = false
    end
    if data.args[2] == "callUserPhone" then
        TriggerServerEvent('startCall', data.args[3])
    end
    if data.event == "componentTriggerServerEvent" then
        if data.args[1] == "TeamMemberEditApp" then
            if data.args[2] == "editTeamMember" then
                TriggerServerEvent('updateTeamMember', data.args[3], data.args[4])
                --print("Update Team Member: ".. data.args[1] .. " - " .. data.args[2] .. " - ".. data.args[3].. " - ".. data.args[4])
                if data.args[5] == true then
                    --print("ARG 5: true")
                    TriggerServerEvent('byte:setPerms', data.args[3], 'bank', 'add')
                else
                    TriggerServerEvent('byte:setPerms', data.args[3], 'bank', 'remove')  
                end
                if data.args[6] == true then
                    --print("ARG 6: true")
                    TriggerServerEvent('byte:setPerms', data.args[3], 'lager', 'add')
                else
                    TriggerServerEvent('byte:setPerms', data.args[3], 'lager', 'remove')  
                end
                if data.args[7] == true then
                    --print("ARG 7: true")
                    TriggerServerEvent('byte:setPerms', data.args[3], 'manage', 'add')
                else
                    TriggerServerEvent('byte:setPerms', data.args[3], 'manage', 'remove')  
                end
                if data.args[8] == true then
                    --print("ARG 8: true")
                    TriggerServerEvent('byte:setPerms', data.args[3], 'invite', 'add')
                else
                    TriggerServerEvent('byte:setPerms', data.args[3], 'invite', 'remove')  
                end
            end
            if data.args[2] == "kickMember" then
                TriggerServerEvent('team:kickMember', data.args[3])
            end
        end
    end
    if data.args[2] == "callDeclined" then
        SendNUIMessage({action="hideCallManage"})
        TriggerServerEvent('endCall')
        closeHandy()
        openHandy()
    end
    if data.event == "componentReady" then
        if data.args[1] == "BankAppTransfer" then
            SendNUIMessage({
                action="bankingAppTransfer",
            })
        end
        if data.args[1] == "BankAppOverview" then
            ESX.TriggerServerCallback("matthias:getBankData", function(cb) 
                local balance = cb.balance
                local history = cb.history
                SendNUIMessage({action="updateBankOverview", balance=balance, history=json.encode(history)})
            end)
        end
        if data.args[1] == "MessengerOverviewApp" then
            ESX.TriggerServerCallback("matthias:getNumber", function(cb) 
                SendNUIMessage({type="updateOverview", data=cb})
            end)
        end
        if data.args[1] == "TeamListApp" then
            TriggerServerEvent('requestTeamMembers')
        end
        if data.args[1] == "ContactsApp" then
            TriggerServerEvent("requestPhoneContacts")
        end
    end
    if data.event == "componentEvent" then
        if data.args[1] == "AntiAFK" then
            if data.args[2] == "disableAntiAFK" then
                SetNuiFocus(false,false)
                hudopen = false
            end
        end
        if data.args[1] == "ContactsEdit" then
            if data.args[2] == "updateContact" then
                TriggerServerEvent("editContact", data.args[3])
            end
            if data.args[2] == "removeContact" then
                local obj = json.decode(data.args[3])
                TriggerServerEvent('removeContact', obj.number)
            end 
        end
        if data.args[1] == "ContactsOverview" then
            if data.args[2] == "updateContact" then
                TriggerServerEvent("editContact", data.args[3])
            end
        end
        if data.args[1] == "ContactsAdd" then
            if data.args[2] == "addContact" then -- Kontakte adden
                TriggerServerEvent("addContact", data.args[3])
            end
        end


        if data.args[1] == "ContactsEdit" then
            if data.args[2] == "updateContact" then
                TriggerServerEvent("editContact", data.args[3])
            end
        end
        if data.args[1] == "Smartphone" then
            if data.args[2] == "getHomeScreen" then
                SendNUIMessage({
                    action = "getHomeScreen"
                })
            end
        end
        if data.args[1] == "GpsApp" then
            ownedCars = 0
            yourCars = false
            frakCars1 = 0
            frakCars = false
            keyCars1 = 0
            keyCars = false
        end
    end
    if data.args[2] == "setGpsCoordinates" then
        local data = json.decode(data.args[3])
        SetNewWaypoint(data.x + .0, data.y + .0)
        TriggerEvent('glmp_singlenotify', '', 'Der Wegpunkt wurde dir auf dem GPS markiert.')
    end
    if data.event == "componentTriggerServerEvent" then
        if data.args[2] == "addServiceRequest" then
            local playerPos = GetEntityCoords(GetPlayerPed(-1))
            TriggerServerEvent("addDispatch", data.args[3], data.args[4], data.args[5], playerPos.x, playerPos.y)
            --print(data.args[3])
            --print(data.args[4])
            --print(data.args[5]) 
        return
        end
        if data.args[2] == "cancelServiceRequest" then  
            TriggerServerEvent("cancelDispatches")
        return
        end
        if data.args[1] == "AntiAFK" then
            if data.args[2] == "AntiAFKKick" then
                ESX.TriggerServerCallback('antiafk:kick', function()
                end)
            end
        end 
        if data.args[1] == "LifeInvaderApp" then
            if data.args[2] == "requestAd" then
                TriggerServerEvent("LifeInvaderApp_requestAd", data.args[3])
            end
        end
        if data.args[1] == "MessengerListApp" then
            if data.args[2] == "requestKonversations" then
                TriggerServerEvent('requestPhoneMessages')
            end
        end
        if data.args[2] == "sendPhoneMessage" then
            TriggerServerEvent('sendPhoneMessage', data.args[3], data.args[4])
        end
        if data.args[1] == "FunkApp" then
            if data.args[2] == "changeFrequenz" then
                PlayerData = ESX.GetPlayerData()
                if tonumber(data.args[3]) == 1 then 
                    if PlayerData.job.name ~= 'police' then
                        if PlayerData.job.name ~= 'fib' then
                            if PlayerData.job.name ~= 'ambulance' then
                                --print("Locked Funk") 
                                return
                            end
                        end  
                    end
                end

                if tonumber(data.args[3]) == 2 then 
                    if PlayerData.job.name ~= 'police' then
                        if PlayerData.job.name ~= 'fib' then
                            if PlayerData.job.name ~= 'ambulance' then
                                --print("Locked Funk") 
                                return
                            end
                        end  
                    end
                end

                if tonumber(data.args[3]) == 3 then 
                    if PlayerData.job.name ~= 'police' then
                        if PlayerData.job.name ~= 'fib' then
                            if PlayerData.job.name ~= 'ambulance' then
                                --print("Locked Funk") 
                                return
                            end
                        end  
                    end
                end

                if tonumber(data.args[3]) == 4 then 
                    if PlayerData.job.name ~= 'police' then
                        if PlayerData.job.name ~= 'fib' then
                            if PlayerData.job.name ~= 'ambulance' then
                                --print("Locked Funk") 
                                return
                            end
                        end  
                    end
                end 

                

                if tonumber(data.args[3]) == 5 then 
                    if PlayerData.job.name ~= 'dmv' then
                         
                                --print("Locked Funk") 
                                return
                            
                     
                    end
                end

 


                exports['saltychat']:SetRadioChannel(data.args[3], true)
                TriggerServerEvent('SaltyChat_IsSending', exports['saltychat']:GetRadioChannel(true), false)
                --print(data.args[4])
                TriggerEvent('setDefaultRadioType')
            end
            if data.args[2] == "changeSettings" then
                --print(data.args[3]) 
                local selection = data.args[3]
                if selection == 0 then 
                    exports['saltychat']:SetRadioChannel('', true)
                    TriggerServerEvent('SaltyChat_IsSending', exports['saltychat']:GetRadioChannel(true), false)
                elseif selection == 1 then
                    TriggerServerEvent('SaltyChat_IsSending', exports['saltychat']:GetRadioChannel(true), false)
                elseif selection == 2 then
                    TriggerServerEvent('SaltyChat_IsSending', exports['saltychat']:GetRadioChannel(true), true)
                     
                end 

            end
        end
        if data.args[1] == "HomeApp" then
            if data.args[2] == "requestPhoneWallpaper" then
                ESX.TriggerServerCallback('handy:requestWallpaper', function(data)
                    SendNUIMessage({
                        action = "responsePhoneWallpaper",
                        wallpaper = data
                    })
                end)
            end
            if data.args[2] == "requestApps" then
                SendNUIMessage({
                    action = "responseApps"
                })
            end
            if data.args[2] == "requestContacts" then
                TriggerServerEvent("requestPhoneContacts")
            end
        end
        if data.args[1] == "GpsApp" then
            ownedCars = 0
            yourCars = false
            frakCars1 = 0
            frakCars = false
            keyCars1 = 0
            keyCars = false
            if data.args[2] == "requestGpsLocations" then
                SendNUIMessage({
                    action = "gpsLocationsResponse",
                    gpsPositions = json.encode(gps)
                })
            end
            if data.args[2] == "requestVehicleGps" then
                loadGpsApp()
            end
        end
        if data.args[1] == "SettingsApp" then
            if data.args[2] == "requestPhoneSettings" then
                ESX.TriggerServerCallback('mdev:loadSettings', function(cb) 
                end)
            end
            if data.args[2] == "savePhoneSettings" then
                TriggerServerEvent('savePhoneSettings', data.args[3], data.args[4], data.args[5])
                closeHandy()
                openHandy()
            end
        end
        if data.args[1] == "SettingsEditWallpaperApp" then
            if data.args[2] == "requestWallpaperList" then
                SendNUIMessage({
                    action = "responseWallpaperList"
                })
            end
            if data.args[2] == "saveWallpaper" then
                ESX.TriggerServerCallback('saveWallpaper', function()

                end, data.args[4])
                SendNUIMessage({action="responseWallpaper", url = data.args[4]})
            end
        end
      if data.args[1] == "SettingsEditRingtonesApp" then
            if data.args[2] == "requestRingtoneList" then
                SendNUIMessage({
                    action = "responseRingtoneList"
                })
            end
        end
        if data.args[1] == "ProfileApp" then
            if data.args[2] == "requestSpecialProfilData" then
                ESX.TriggerServerCallback('mdev:loadProfileAppHandy', function(cb) 
                    local data = json.encode({
                        ["Name"] = cb.Name,
                        --["Geburtsdatum"] = result[1].dateofbirth, 
                        
                        ["Telefonnummer"] = cb.Telefonnummer,
                        ["Team"] = cb.Team,
                        
                        ["Team Rang"] = cb.TeamRang,
                        
                        ["Level"] = cb.Level,
                        ["GWD Note"] = cb.GWDNote,
                        ["LSPD GAB Note"] = cb.LSPDGABNote,
                        ["GUMP"] = cb.GLMP, 
                        ["Bis zum PayDay"] = cb.BiszumPayDay 
                    }) 
                    SendNUIMessage({action="responseProfil", data=data})
                end)
            end
        end
    end
end)

 
RegisterNUICallback('loadContacts', function(event)
    TriggerServerEvent("requestPhoneContacts")
end)

local entityEnumerator = {
    __gc = function(enum)
    if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
end
}


RegisterNetEvent("updatemsg")
AddEventHandler("updatemsg", function()
    TriggerServerEvent('requestPhoneMessages')
end)

RegisterNetEvent('removeFunk')
AddEventHandler('removeFunk', function()
    exports['saltychat']:SetRadioChannel('', true)
end)

RegisterNetEvent("updatemsg2")
AddEventHandler("updatemsg2", function()
    TriggerServerEvent('requestPhoneMessages2')
end)

RegisterNetEvent("conts")
AddEventHandler("conts", function(ss)
    SendNUIMessage({
        action = "setKonversationen",
        data = json.encode(ss)
    })
end)


RegisterNetEvent("showLic")
AddEventHandler("showLic", function(A, B, g, V, Q, E, I, q, C, i, M, U, o)
    SendNUIMessage({
        action = "showLic", A = A, B = B, g = g, V = V, Q = Q, E = E, I = I, q = q, C = C, i = i, M = M, U = U, o = o
    })
end)


RegisterNetEvent("showCarHud")
AddEventHandler("showCarHud", function()

    SendNUIMessage({
        action = "showCarHud"
    })
end)


RegisterNetEvent("hideCarHud")
AddEventHandler("hideCarHud", function()

    SendNUIMessage({
        action = "hideCarHud"
    })
end)

RegisterNetEvent("carHudsetFuel")
AddEventHandler("carHudsetFuel", function(fuel)

    SendNUIMessage({
        action = "carHudsetFuel",
        fuel = fuel
    })
end)

RegisterNetEvent("carHudsetEngine")
AddEventHandler("carHudsetEngine", function(engine)

    SendNUIMessage({
        action = "carHudtoggleEndinge",
        engine = engine
    })
end)

RegisterNetEvent("carHudsetLock")
AddEventHandler("carHudsetLock", function(locked)

    SendNUIMessage({
        action = "carHudsetLock",
        locked = locked
    })
end)

RegisterNetEvent("carHudsetMileage")
AddEventHandler("carHudsetMileage", function(mileage)

    SendNUIMessage({
        action = "carHudSetMileage",
        mileage = mileage
    })
end)

RegisterNetEvent("carHudsetSpeed")
AddEventHandler("carHudsetSpeed", function(speed)

    SendNUIMessage({
        action = "carHudSetSpeed",
        speed = speed
    })
end)



RegisterNetEvent("pushNewMsg")
AddEventHandler("pushNewMsg", function(data)
    SendNUIMessage({action="pushMsg", data=data})
end)




RegisterNetEvent("endCallC")
AddEventHandler("endCallC", function()
    SendNUIMessage({action="hideCallManage"})
    openHandy()
end)


RegisterNetEvent("callacc1")
AddEventHandler("callacc1", function()
    SendNUIMessage({action="callAcceptedS"})
end)

RegisterNetEvent("Lifeinvader")
AddEventHandler("Lifeinvader", function(data)
    SendNUIMessage({action="updateLifeInvaderAds", data=json.encode(data)})
end)


local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
        disposeFunc(iter)
        return
    end
      
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
      
    local next = true
    repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
        until not next
      
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end
  
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
  
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
  
function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

local ownedCars = 0
    local frakCars1 = 0
    local keyCars1 = 0 

function loadGpsApp()
    ownedCars = 0
            yourCars = false
            frakCars1 = 0
            frakCars = false
            keyCars1 = 0
            keyCars = false

    local vehicles = EnumerateVehicles()
    local hasvehicles = {}
    local hasvehiclekeys = {}
    local hasfrakvehicle = {}
    
    for veh in vehicles do
        ESX.TriggerServerCallback("mdev_phone:ownsveh", function(cb) 
            if cb == true then
                --hasvehicles = {}
                local b = GetEntityCoords(veh)
                hasvehicles[GetVehicleNumberPlateText(veh)] = {
                    name = GetVehicleNumberPlateText(veh),
                    x = b.x,
                    y = b.y
                }
                ownedCars = ownedCars + 1
            elseif cb == false then
            end
        end, GetVehicleNumberPlateText(veh))

        ESX.TriggerServerCallback("mdev_phone:ownsvehkeys", function(cb) 
            if cb == true then
                --hasvehiclekeys = {}
                local b = GetEntityCoords(veh)
                
                hasvehiclekeys[GetVehicleNumberPlateText(veh)] = {
                    name = GetVehicleNumberPlateText(veh),
                    x = b.x,
                    y = b.y
                }
                keyCars1 = keyCars1 + 1
            elseif cb == false then
            end 
        end, GetVehicleNumberPlateText(veh))

        ESX.TriggerServerCallback("mdev_phone:frakvehs", function(cb) 
            if cb == true then
                --hasfrakvehicle = {}
                local b = GetEntityCoords(veh)
                hasfrakvehicle[GetVehicleNumberPlateText(veh)] = {
                    name = GetVehicleNumberPlateText(veh),
                    x = b.x,
                    y = b.y 
                } 
                frakCars1 = frakCars1 + 1
            elseif cb == false then
            end 
        end, GetVehicleNumberPlateText(veh))
    end

    
    
    Citizen.Wait(500)
        if ownedCars > 0 then
            yourCars = true
        end
        if keyCars1 > 0 then
            keyCars = true
        end
        if frakCars1 > 0 then
            frakCars = true
        end
        if yourCars == true then
            if keyCars == true then
                if frakCars == true then
                    local autotable = {
                        ["a"] = {
                            name = "Deine Fahrzeuge",
                            locations = hasvehicles 
                        },  
                        ["b"] = {
                            name = "Fahrzeuge mit Schlüssel",
                            locations = hasvehiclekeys 
                        } ,
                        ["c"] = {
                            name = "Fraktionsfahrzeuge", 
                            locations = hasfrakvehicle 
                        } 
                
                    }
                    SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)}) 
                else
                    local autotable = {
                        ["a"] = {
                            name = "Deine Fahrzeuge",
                            locations = hasvehicles 
                        },  
                        ["b"] = {
                            name = "Fahrzeuge mit Schlüssel",
                            locations = hasvehiclekeys 
                        } 

                    }  
                    SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})
                end
            else
                if frakCars == true then
                    local autotable = {
                        ["a"] = {
                            name = "Deine Fahrzeuge",
                            locations = hasvehicles 
                        },  
                        ["b"] = {
                            name = "Fraktionsfahrzeuge",
                            locations = hasfrakvehicle 
                        }

                    }
                    SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})
                else
                    local autotable = {
                        ["a"] = {
                            name = "Deine Fahrzeuge",
                            locations = hasvehicles 
                        }

                    }
                    SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})
                end
            end

        elseif keyCars == true then
            if frakCars == true then
                local autotable = {
                    ["b"] = {
                        name = "Fahrzeuge mit Schlüssel",
                        locations = hasvehiclekeys 
                    },
                    ["c"] = {
                        name = "Fraktionsfahrzeuge",
                        locations = hasfrakvehicle 
                    } 

                }
                SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})
            else
                local autotable = {
                    ["b"] = {
                        name = "Fahrzeuge mit Schlüssel",
                        locations = hasvehiclekeys 
                    } 

                }
                SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})
            end

        elseif frakCars == true then
                local autotable = {
                    ["c"] = {
                        name = "Fraktionsfahrzeuge",
                        locations = hasfrakvehicle 
                    } 

                }
                SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})

        else
            local autotable = {
                ["a"] = {
                    name = "Keine Fahrzeuge ausgeparkt",
                    locations = ''  
                }

            }
            SendNUIMessage({action="responseVehicleGps", data=json.encode(autotable)})
        end
            

end

RegisterNetEvent("responsePhoneSettings")
AddEventHandler("responsePhoneSettings", function(flugmodus, anrufeablehnen, lautlos)
    if tonumber(flugmodus) == 1 then
        flugmodus = true
    else
        flugmodus = false
    end
    if tonumber(anrufeablehnen) == 1 then
        anrufeablehnen = true
    else
        anrufeablehnen = false
    end
    if tonumber(lautlos) == 1 then
        lautlos = true
    else
        lautlos = false
    end

    SendNUIMessage({
        action = "responsePhoneSettings",
        flugmodus = flugmodus,
        anrufeablehnen = anrufeablehnen,
        lautlos = lautlos
    })
end)
playerIsInFrak = 0
flugmodus = 0
playerIsInBus = 'no'
function openHandy()
    ESX.TriggerServerCallback('byte:hasPhone', function(hasPhone)
        if hasPhone == true then
            ESX.TriggerServerCallback('byte:hasFunk', function(hasFunk)
               
                    SendNUIMessage({
                        action = "showPhone"
                    })
                    ownedCars = 0
                    yourCars = false
                    frakCars1 = 0
                    frakCars = false
                    keyCars1 = 0
                    keyCars = false
                    hudopen = true
                    flugmodus = 0
                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
                    DoPhoneAnimation2("amb@world_human_stand_mobile@male@text@idle_a", "idle_a")
                    SetNuiFocus(true,true)
                    local apps = {}
                    ESX.TriggerServerCallback('isPlayerinFrak', function(isPlayerinFrak)
                        --print("DEBUG: " .. isPlayerinFrak)
                        playerIsInFrak = isPlayerinFrak
                    end)

                    ESX.TriggerServerCallback('isPlayerinBusiness', function(business)
                        --print("DEBUG: " .. business)
                        playerIsInBus = business
                    end) 

                    Citizen.Wait(500)
                    ESX.TriggerServerCallback('byte:getFlugmodus', function(isflugmodus)
                        flugmodus = 0
                        --print(isflugmodus)
                        if isflugmodus == true then
                            flugmodus = 1
                            --print("active fl")
                        end
                        --print(flugmodus)
                        if flugmodus < 1 then
                            if playerIsInFrak > 0 then 
                                table.insert(apps, {id = "TeamApp", name = "Team", icon = "TeamApp.png"})
                                --print('DEBUG: loaded Team app')
                            end
                            if playerIsInBus ~= 'no' then 
                                table.insert(apps, {id = "BusinessApp", name = "Business", icon = "BusinessApp.png"})
                                --print('DEBUG: loaded Buisness app')
                            end
                            
                            if hasFunk == true then 
                                table.insert(apps, {id="FunkApp", name="Funk", icon="FunkApp.png"})
                            end
                        end
                        
                        table.insert(apps, {id="GpsApp", name="GPS", icon="GpsApp.png"})
                        if flugmodus < 1 then
                            --print(flugmodus)
                            --print("show contact")
                            table.insert(apps, {id="ContactsApp", name="Kontakte", icon="ContactsApp.png"})
                            table.insert(apps, {id="LifeInvaderApp", name="Lifeinvader", icon="LifeinvaderApp.png"})
                            table.insert(apps, {id="TaxiApp", name="Taxi", icon="TaxiApp.png"})
                            table.insert(apps, {id="TelefonApp", name="Telefon", icon="TelefonApp.png"})
                            
                        end    
                        table.insert(apps, {id="ProfileApp", name="Profil", icon="ProfilApp.png"})
                        if flugmodus < 1 then
                            table.insert(apps, {id="MessengerApp", name="SMS", icon="MessengerApp.png"})
                        end

                        if aduty == false then
                            table.insert(apps, {id="SettingsApp", name="Settings", icon="SettingsApp.png"})
                        end
                        table.insert(apps, {id="CalculatorApp", name="Rechner", icon="CalculatorApp.png"})
                        if aduty == false then
                            table.insert(apps, {id="ServiceRequestApp", name="Service", icon="ServiceApp.png"})
                        end
                        if flugmodus < 1 then
                            table.insert(apps, {id="BankingApp", name="Banking", icon="BankingApp.png"})
                            table.insert(apps, {id="NewsApp", name="News", icon="NewsApp.png"}) 
                        end
                        SendNUIMessage({action="responseApps", apps=json.encode(apps)})
                        ESX.TriggerServerCallback('handy:requestWallpaper', function(data)
                            SendNUIMessage({
                                action = "responsePhoneWallpaper",
                                wallpaper = data
                            })
                        end)
                    end) 
                
                
            end)
        
        end
    end)
end
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 288) then
            openHandy()
        end
    end
end)


function closeHandy()
    SetNuiFocus(false,false)
    hudopen = false
    --[[ClearPedTasks(GetPlayerPed(-1))
    PhoneData.AnimationData.lib = nil
    PhoneData.AnimationData.anim = nil
    CancelPhoneAnim()]]
end
RegisterNUICallback("close", function(data,cb)
    SetNuiFocus(false,false)
    hudopen = false
    ClearPedTasks(GetPlayerPed(-1))
    PhoneData.AnimationData.lib = nil
    PhoneData.AnimationData.anim = nil
    CancelPhoneAnim()
end)

RegisterNetEvent("setcontacts")
AddEventHandler("setcontacts", function(contacts)
    SendNUIMessage({
        action = "setContactListData",
        data = json.encode(contacts)
    })

end)

RegisterNetEvent("udate")
AddEventHandler("udate", function(nummer, name)
    SendNUIMessage({action="updateCurContact", nummer=nummer, name=name})
    TriggerServerEvent("requestPhoneContacts")
end)



RegisterNetEvent("updateLifeinvader")
AddEventHandler("updateLifeinvader", function()
    SendNUIMessage({
        action = "updateLifeInvaderAds",
        data = json.encode(AdvertisingData)
    })
end)


RegisterNetEvent("pnotify")
AddEventHandler("pnotify", function(title, msg, color)
    SendNUIMessage({action="pushPlayerNotification", msg=msg, duration=5000, stumm=true, color=color, title=title})
    TriggerEvent('glmp_notify', color, title, msg)
end)


RegisterNetEvent('showIdCard')
AddEventHandler('showIdCard', function(firstname, lastname, birthday, house, level, casino)
    --print("show id card client")
    SendNUIMessage({
        action = "showIdCard",
        test = "zeigen",
        firstName = firstname,
        lastName = lastname,
        birthday = birthday,
        house = house,
        level = level,
        casino = casino,
        gov = 0
    })
end)



RegisterNetEvent('showDutyCard')
AddEventHandler('showDutyCard', function(frak, rank, dn)
    --print("show duty card client")
    SendNUIMessage({
        action = "showDutyCard",
        test = "zeigen",
        fraktion = frak,
        rank = rank,
        dienstnummer = dn
    })
end)

--[[showXMasMsg = false   
Citizen.CreateThread(function()
    ped =  CreatePed(4, 0x61D4C771,vector3(200.36, -991.64, 30.08), 3374176, false, true)
    SetEntityHeading(ped, 45.86) 
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)  
    SetBlockingOfNonTemporaryEvents(ped, true)
    while true do
        Wait(10)
         
            local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), vector3(200.36, -991.64, 30.08))
            if dist < 5 then 
                if showXMasMsg ~= true then 
                    ESX.ShowNotification("Drücke E um dein Weihnachtsgeschenk Abzuholen!")
                    showXMasMsg = true 
                end  
            end
            if dist < 5 then  
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('w:getGeschenk') 
                end
            elseif dist > 5 and dist < 8 then 
                showXMasMsg = false 
            end
         
    end
end)]]-- 


--RegisterNetEvent('matthias:setCallData')
--AddEventHandler('matthias:setCallData', function(obj, stumm, ringtone)
--    lastcalldata = {obj=obj, stumm=stumm, ringtone=ringtone}
--    SendNUIMessage({action="setCallData", data=json.encode(obj), stumm=stumm, ringtone=ringtone})
--end)


