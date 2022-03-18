RegisterServerEvent('dealer:sell')
AddEventHandler('dealer:sell', function(item)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src) 
    if item == 'chickenfilet' then 
       
        if xPlayer.getInventoryItem('chickenfilet').count > 0 then 
            xPlayer.removeInventoryItem('chickenfilet', 1)
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast 1x Chicken Filet für 1.000$ verkauft!')
            xPlayer.addMoney(2500) 
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Chicken Filet dabei!')
        end 
    elseif item == "kbohnekiste" then 
        if xPlayer.getInventoryItem('kbohnekiste').count > 0 then 
            xPlayer.removeInventoryItem('kbohnekiste', 1)
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast 1x Kaffee Bohnen Kiste für 1.250$ verkauft!')
            xPlayer.addMoney(3000)
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Kaffee Bohnen Kisten dabei!')
        end
    elseif item == "weedkiste" then 
        if xPlayer.getInventoryItem('weedkiste').count > 0 then 
            xPlayer.removeInventoryItem('weedkiste', 1)
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast 1x Hanfkiste Kiste für 5.000$ verkauft!')
            xPlayer.addMoney(5000)
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Hanf Kisten dabei!')
        end
    elseif item == "batterien" then 
        if xPlayer.getInventoryItem('batterien').count > 0 then 
            xPlayer.removeInventoryItem('batterien', 1)
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast 1x Batterien für 900$ verkauft!')
            xPlayer.addMoney(5000)
        else
            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Batterien dabei!')
        end
    elseif item == 'bulletproof' then 
        if xPlayer.getInventoryItem('kevlar').count > 5 then 
            if xPlayer.getMoney() >= 1000 then
                xPlayer.removeInventoryItem('kevlar', 6)
                xPlayer.removeMoney(1000)
                xPlayer.addInventoryItem('bulletproof', 1) 
                TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast eine Weste hergestellt!')
            else 
                TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Geld dabei!')
            end
        else

            TriggerClientEvent('glmp_singlenotify', source, '', 'Du hast nicht genug Kevlar dabei!')
        end
    end
    

end)