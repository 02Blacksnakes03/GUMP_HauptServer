carSellBuyer = {} 
carSellPrice = {}
carSellSeller = {}

RegisterCommand("carsellcancel", function(source, args)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    if args[1] == nil then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte verwende: /carsellcancel <kennzeichen>!')
        return 
    end
    local owner = MySQL.Sync.fetchScalar("SELECT owner FROM owned_vehicles WHERE plate = @plate ", {["@plate"] = args[1]})
    if owner ~= xPlayer.getIdentifier() then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Dieses Fahrzeug gehört dir nicht!')
        return 
    end

    if carSellBuyer[args[1]] == nil then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Dieses Fahrzeug steht nicht zum Verkauf offen!')
        return 
    end
    TriggerClientEvent('glmp_singlenotify', carSellBuyer[args[1]], '', 'Das Kaufangebot vom Fahrzeug mit dem Kennezeichen '.. args[1] ..' wurde vom Verkäufer abgebrochen!')
    carSellBuyer[args[1]] = nil 
    carSellPrice[args[1]] = nil 
    carSellSeller[args[1]] = nil 
    TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast das Kaufangebot von dem Fahrzeug mit Kennzeichen '.. args[1] ..' abgebrochen!')
    
    return 
end)
RegisterCommand("carsell", function(source, args)
    print("CARSELL")
    local src = source
    local first, last = args[1]:match("([^_]+)_([^_]+)")
    local ident = MySQL.Sync.fetchScalar("SELECT identifier FROM users WHERE firstname = @firstname AND lastname = @lastname", { ["@firstname"] = first, ["@lastname"] = last })
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getInventoryItem('carkaufvertrag').count < 1 then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast keinen KFZ Kaufvertrag dabei!')
        return 
    end 
    if ident == nil then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Der Spieler wurde nicht gefunden.')
        return 
    end 
    print("checked 1")
    local xTarget = ESX.GetPlayerFromIdentifier(ident)
    if ident == nil then
        TriggerClientEvent('glmp_singlenotify', src, '', 'Der Spieler ist nicht online.')
        return 
    end 
    print("checked 2")
    if args[1] == nil then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte verwende: /carsell Vorname_Nachname Kennzeichen Preis')
        return 
    end
    print("checked 3")
    print(xPlayer.getIdentifier())
    local vehOwner = MySQL.Sync.fetchScalar("SELECT owner FROM owned_vehicles WHERE plate = @plate", { ["@plate"] = ESX.Math.Trim(args[2]) })
    print(vehOwner)
    if vehOwner ~= xPlayer.getIdentifier() then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Dieses Fahrzeug gehört dir nicht!')
        return 
    end 
    print("checked 4")
    if args[2] == nil then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Bitte verwende: /carsell Vorname_Nachname Kennzeichen Preis')
        return 
    end
    print("checked 5")
    print(xTarget.getIdentifier())
   carSellBuyer[args[2]] = xTarget.source
   print("c 5.1")
   carSellPrice[args[2]] = tonumber(args[3])
   print("c 5.2")
    carSellSeller[args[2]] = xPlayer.source
    print("c 5.3")
    TriggerClientEvent('glmp_singlenotify', xTarget.source, '', 'Dir wurde ein Fahrzeug mit dem Kennzeichen '.. args[2] .. ' zum Kauf für '.. args[3] .. '$ Angeboten! Um zu Akzeptieren, verwende `/carsellaccept '.. args[2] ..'`.')
   
    TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast dem Spieler das Fahrzeug mit dem Kennzeichen '.. args[2] .. ' für '.. args[3] .. '$ Angeboten!')
    TriggerClientEvent('glmp_singlenotify', src, '', 'Du kannst das Angebot mit `/carsellcancel '.. args[2] ..'` jederzeit Abbrechen!')
       print("chek 6")
       xPlayer.removeInventoryItem('carkaufvertrag', 1)  
end)


RegisterCommand("carsellaccept", function( source, args )
    local src = source
    local xSeller = ESX.GetPlayerFromId(carSellSeller[args[1]])
    if xSeller == nil then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Es ist kein Kaufangebot offen!')
        return 
    end
    if carSellBuyer[args[1]] ~= src then 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Es ist kein Kaufangebot offen!')
        return 
    end
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >= carSellPrice[args[1]] then 
        xPlayer.removeMoney(carSellPrice[args[1]]) 
        xSeller.addMoney(carSellPrice[args[1]])
        MySQL.Sync.fetchScalar("UPDATE owned_vehicles SET owner = @owner WHERE plate = @plate", { ["@plate"] = args[1], ["@owner"] = xPlayer.getIdentifier() })
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast das Kaufangebot akzeptiert!')
        TriggerClientEvent('glmp_singlenotify', xSeller.source, '', 'Der Spieler hat das Kaufangebot Akzeptiert!')
        return   
    else 
        TriggerClientEvent('glmp_singlenotify', src, '', 'Du hast zu wenig Geld dabei!')
        return 
    end

end)