local Reasons = {
    ["1"] = {
        {
            name = "30km/h zu schnell",
            id = 1
        },
        {
            name = "50km/h zu schnell",
            id = 2
        }
    }
}

RegisterNUICallback('trigger', function(data, cb)
    if data.event == "componentTriggerServerEvent" then
        if data.args[1] == "VehicleTaxApp" then
            if data.args[2] == "requestVehicleTaxByModel" then
                ESX.TriggerServerCallback("matthias:requestVehicleTaxByModel", function(cb) 
                    SendNUIMessage({action="responseVehicleTaxApp", data=json.encode(cb)})
                end, data.args[3])
            end
        end
        if data.args[1] == "FahrzeugUebersichtApp" then
            if data.args[2] == "requestVehicleOverviewByCategory" then
                ESX.TriggerServerCallback("matthias:requestVehicleOverviewByCategory", function(cb)
                    for i=1, #cb, 1 do
                        cb[i].vehiclehash = GetDisplayNameFromVehicleModel(cb[i].vehiclehash)
                    end 
                    SendNUIMessage({action="responseVehicleOverviewByCategory", data=json.encode(cb)})
                end, data.args[3])
            end
        end
        if data.args[1] == "EmailApp" then
            if data.args[2] == "requestEmails" then
                ESX.TriggerServerCallback("matthias:requestEmails", function(cb) 
                    SendNUIMessage({action="responseEmails", data=json.encode(cb)})
                end)
            end
            if data.args[2] == "deleteMail" then
                TriggerServerEvent('matthias:deleteMail', data.args[3])
            end
            if data.args[2] == "markEmailAsRead" then
                TriggerServerEvent('matthias:markEmailAsRead', data.args[3])
            end
        end
        if data.args[1] == "KennzeichenUebersichtApp" then
            if data.args[2] == "requestVehicleOverviewByPlate" then
                ESX.TriggerServerCallback("matthias:requestVehicleOverviewByPlate", function(cb) 
                    SendNUIMessage({action="responseVehicleOverviewByPlate", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "requestVehicleOverviewByVehicleId" then
                ESX.TriggerServerCallback("matthias:requestVehicleOverviewById", function(cb) 
                    SendNUIMessage({action="responseVehicleOverviewByPlate", data=json.encode(cb)})
                end, data.args[3])
            end
        end
        if data.args[1] == "StreifenApp" then
            if data.args[2] == "createStreife" then
                ESX.TriggerServerCallback("matthias:getInfoAboutCarId", function(cb) 
                    if cb ~= false then
                        local name = GetDisplayNameFromVehicleModel(json.decode(cb).model)
                        TriggerServerEvent('matthias:createStreife', name, data.args[3], data.args[4])
                    else
                        TriggerEvent('notify', "red", "Staat", "Die angegebene Fahrzeug-ID ist ungültig.")
                    end
                end, data.args[4])
            end
            if data.args[2] == "requestCurrentStreifen" then
                ESX.TriggerServerCallback("matthias:requestCurrentStreifen", function(cb) 
                    SendNUIMessage({action="responseStreifenData", data=json.encode(cb)})
                end) -- StreifenData(' [{"id": 1, "vehid": 1202, "vehname": "Police Felon", "state": 1, "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": [{"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Dr. Christian Cunningham",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Yasha-Tiberius Bleifuss",  "rank": 12, "funk": "1000.7", "handy": 1337}, {"name": "Hannes Hill",  "rank": 12, "funk": "1000.7", "handy": 12345},{"name": "Bernd Brinkmann",  "rank": 12, "funk": "1000.7", "handy": 254651}]}, {"vehid": 1202, "vehname": "Police Felon", "name": "Downtown 1", "location": "Grapeseed Farm East", "officers": []}]');-->
            end
            if data.args[2] == "addOfficerToStreife" then
            end
        end
        if data.args[1] == "PoliceListProgressApp" then
            if data.args[2] == "requestCrimeProgress" then
                ESX.TriggerServerCallback("matthias:requestCrimeProgress", function(cb) 
                    SendNUIMessage({action="responseCrimeProgress", data=json.encode(cb)})
                end, data.args[3])
            end
        end
        if data.args[1] == "PoliceEditPersonApp" then
            if data.args[2] == "requestLicenses" then
                ESX.TriggerServerCallback("matthias:requestLicenses", function(cb) 
                    SendNUIMessage({action="responseLicenses", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "requestPersonData" then
                ESX.TriggerServerCallback("matthias:requestPersonData", function(cb) 
                    SendNUIMessage({action="responsePersonData", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "requestAkte" then
                ESX.TriggerServerCallback("matthias:requestAkte", function(cb) 
                    SendNUIMessage({action="responseAkte", data=json.encode(cb)})
                end, data.args[3])
            end
            --[[if data.args[2] == "requestAktenList" then
                ESX.TriggerServerCallback("matthias:requestAktenList", function(cb) 
                    SendNUIMessage({action="responseAktenList", data=json.encode(cb)})
                end, data.args[3])
            end]]
            if data.args[2] == "savePersonData" then
                TriggerServerEvent('matthias:savePersonData', data.args)
            end
            if data.args[2] == "requestOpenCrimes" then
                Wait(100)
                ESX.TriggerServerCallback("matthias:requestOpenCrimes", function(cb)
                    SendNUIMessage({action="responseOpenCrimes", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "removeAllCrimes" then
                TriggerServerEvent('matthias:removeAllCrimes', data.args[3])
            end
            if data.args[2] == "requestJailTime" then
                ESX.TriggerServerCallback("matthias:requestJailTime", function(cb) 
                    SendNUIMessage({action="responseJailTime", jailtime=cb})
                end, data.args[3])
            end
            if data.args[2] == "requestJailCosts" then
                ESX.TriggerServerCallback("matthias:requestJailCosts", function(cb) 
                    SendNUIMessage({action="responseJailCosts", jailcost=cb})
                end, data.args[3])
            end
            if data.args[2] == "removePlayerCrime" then
                TriggerServerEvent("matthias:removePlayerCrime", data.args[3], data.args[4])
            end
        end
        if data.args[1] == "PoliceAddAktenApp" then
            if data.args[2] == "savePersonAkte" then
                TriggerServerEvent("matthias:savePersonAkte", data.args[3], data.args[4])
            end
        end 
        if data.args[2] == "closeComputer" then
            SendNUIMessage({action="closeComputer"})
            SetNuiFocus(false, false)
        end
        if data.args[1] == "PoliceEditWantedsApp" then
            if data.args[2] == "addPlayerWanteds" then
                TriggerServerEvent('matthias:addPlayerWanteds', data.args[3], data.args[4])
            end
            if data.args[2] == "requestOpenCrimes" then
                ESX.TriggerServerCallback("matthias:requestOpenCrimes", function(cb) 
                    SendNUIMessage({action="responseOpenCrimes", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "requestWantedCategories" then
                ESX.TriggerServerCallback("matthias:requestWantedCategorys", function(cb) 
                    SendNUIMessage({action="responseWantedCategories", data=json.encode(cb)})
                end)
                local categories = {
                    {
                        name = "Geschwindigkeitsübertretungen",
                        id = 1
                    },
                    {
                        name = "Lizenzverstöße",
                        id = 2
                    }
                }
            end
            if data.args[2] == "requestCategoryReasons" then
                ESX.TriggerServerCallback("matthias:requestWantedReasons", function(cb)
                    SendNUIMessage({action="responseCategoryReasons", data=json.encode(cb)})
                end, data.args[3])
            end
        end
        if data.args[1] == "DesktopApp" then
            if data.args[2] == "requestComputerApps" then
                local apps = {
                    {
                        id = 1,
                        appName = "ServiceOverviewApp",
                        name = "Dispatch-App",
                        icon = "204316.svg"
                    },
                    {
                        id = 2,
                        appName = "MarketplaceApp",
                        name = "E-Bay",
                        icon = "gebay.png"
                    },
                    --[[{
                        id = 3,
                        appName = "StreifenApp",
                        name = "StreifenApp",
                        icon = "204316.svg"
                    },]]
                    {
                        id = 6,
                        appName = "EmailApp",
                        name = "E-Mails",
                        icon = "email.png"
                    },
                    --[[{
                        id = 7,
                        appName = "VehicleImpoundApp",
                        name = "VehicleImpoundApp",
                        icon = "858320.svg"
                    },]]
                    {
                        id = 8,
                        appName = "VehicleTaxApp",
                        name = "VehicleTaxApp",
                        icon = "858320.svg"
                    }
                    --[[{
                        id = 9,
                        appName = "VehicleClawUebersichtApp",
                        name = "VehicleClawUebersichtApp",
                        icon = "858320.svg"
                    },
                    {
                        id = 10,
                        appName = "KFZRentApp",
                        name = "KFZRentApp",
                        icon = "858320.svg"
                    },
                    {
                        id = 11,
                        appName = "HouseApp",
                        name = "HouseApp",
                        icon = "858320.svg"
                    },
                    {
                        id = 12,
                        appName = "FraktionListApp",
                        name = "FraktionListApp",
                        icon = "858320.svg"
                    },
                    {
                        id = 13,
                        appName = "ExportApp",
                        name = "ExportApp",
                        icon = "858320.svg"
                    },
                    {
                        id = 14,
                        appName = "BusinessDetailApp",
                        name = "BusinessDetailApp",
                        icon = "858320.svg"
                    }]]
                }
                                --[[


                    case "FraktionListApp":
                        this.pageStack.push(FraktionListApp)
                        break
                    case "ExportApp":
                        this.pageStack.push(ExportApp)
                        break
                    case "BusinessDetailApp":
                        this.pageStack.push(BusinessDetailApp)
                        break
                }
                ]]
                if ESX.PlayerData.job.name == "police" then
                    table.insert(apps,                     {
                        id = 3,
                        appName = "FahrzeugUebersichtApp",
                        name = "Fahrzeuge",
                        icon = "189088.svg"
                    })
                    table.insert(apps, {
                        id = 4,
                        appName = "PoliceAktenSearchApp",
                        name = "AktenApp",
                        icon = "858320.svg"
                    })
                    table.insert(apps, {
                        id = 5,
                        appName = "KennzeichenUebersichtApp",
                        name = "Fahrzeugsuche",
                        icon = "858320.svg"
                    })
                end
                SendNUIMessage({action="responseComputerApps", apps=json.encode(apps)})
            end
        end
        if data.args[1] == "MessengerMessageApp" then
            if data.args[2] == "sendPhoneMessage" then
                TriggerServerEvent('sendPhoneMessage', data.args[3], data.args[4])
            end
        end
        if data.args[1] == "PoliceAktenSearchApp" then
            if data.args[2] == "requestPlayerResults" then
                ESX.TriggerServerCallback("matthias:getPlayerResults", function(cb) 
                    SendNUIMessage({action="responsePlayerResults", data=json.encode(cb)})
                end, data.args[3])
            end
        end
        if data.args[1] == "MarketplaceApp" then
            if data.args[2] == "deleteOffer" then
                TriggerServerEvent('deleteoffer', data.args[3])
            end
            if data.args[2] == "requestMarketPlaceOffers" then
                ESX.TriggerServerCallback("computer:loadoffers", function(cb) 
                    SendNUIMessage({action="responseMarketPlaceOffers", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "addOffer" then
                TriggerServerEvent('computer:addOffer', data.args[3], data.args[4], data.args[5], data.args[6], data.args[7])
            end
            if data.args[2] == "requestMarketplaceCategories" then
                category = {
                    {
                        id = 1,
                        name = "Fahrzeuge"
                    },
                    {
                        id = 2,
                        name = "Waren"
                    },
                    {
                        id = 3,
                        name = "Immobilien"
                    },
                    {
                        id = 4,
                        name = "Vermietungen"
                    },
                    {
                        id = 5,
                        name = "Dienstleistungen"
                    }
                }
                SendNUIMessage({action="responseMarketPlaceCategories", data=json.encode(category)})
            end
            if data.args[2] == "requestMyOffers" then
                ESX.TriggerServerCallback("computer:loadmyoffers", function(cb) 
                    SendNUIMessage({action="responseMyOffers", data=json.encode(cb)})
                end)
            end
        end
        if data.args[1] == "ServiceListApp" then
            if data.args[2] == "requestOpenServices" then
                ESX.TriggerServerCallback("mdev:requestServices", function(cb) 
                    SendNUIMessage({action="responseOpenServices", data=json.encode(cb)})
                end, false)
            end
            if data.args[2] == "acceptOpenService" then
                TriggerServerEvent('acceptOpenService', data.args[3])
            end
        end
        if data.args[1] == "ServiceOwnApp" then
            if data.args[2] == "requestOwnServices" then
                ESX.TriggerServerCallback("mdev:requestServices", function(cb) 
                    SendNUIMessage({action="responseAcceptedServices", data=json.encode(cb)})
                end, true)
            end
            if data.args[2] == "finishOwnAcceptedService" then
                TriggerServerEvent('removeService', data.args[3])
            end
        end
        if data.args[1] == "ServiceAcceptedApp" then
            if data.args[2] == "RequestTeamServiceList" then
                ESX.TriggerServerCallback("mdev:requestAllServices", function(cb) 
                    SendNUIMessage({action="responseAllServices", data=json.encode(cb)})
                end)
            end
        end
    end
    if data.event == "componentEvent" then
        if data.args[2] == "setGpsCoordinatesAccepted" then
            local obj = json.decode(data.args[3])
            SetNewWaypoint(obj.x + 0.0, obj.y + 0.0)
        end
        if data.args[2] == "setGpsCoordinates" then
            local obj = json.decode(data.args[3])
            if tonumber(obj.x) == -696969 and tonumber(obj.y) == -696969 then
                return
            end
            SetNewWaypoint(obj.x + 0.0, obj.y + 0.0)
        end
    end
    if data.event == "componentReady" then
        if data.args[1] == "VehicleTaxApp" then
            ESX.TriggerServerCallback("matthias:requestVehicleTaxApp", function(cb) 
                SendNUIMessage({action="responseVehicleTaxApp", data=json.encode(cb)})
            end)
        end
        if data.args[1] == "KennzeichenUebersichtApp" then
            ESX.TriggerServerCallback("matthias:requestKennzeichenUebersichtApp", function(cb) 
                SendNUIMessage({action="responseVehicleOverviewByPlate", data=json.encode(cb)})
            end)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustPressed(0, 170) then
            SendNUIMessage({action="showComputer"})
            SetNuiFocus(true, true)
        end
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)
