

local sbrobs = {
    {id=1, name="Schließfächer 1", x=259.89, y=217.89, z=101.89, needSeconds = 3, cops=0},
    {id=2, name="Schließfächer 2", x=258.28, y=214.21, z=101.68, needSeconds = 3, cops=0},
} 

clostestTosbRob = false 
clostestsbRobId = 0
  
function nearStaatsbank()
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    
    for _, rob in pairs(sbrobs) do
        local distance = GetDistanceBetweenCoords(rob.x, rob.y, rob.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        if distance < 0.8 then
                clostestTosbRob = true
                clostestsbRobId = rob.id 
                clostestsbName = rob.name 
                clostestsbNeedCops = rob.cops 
                clostestsbNeedSeconds = rob.needSeconds
        elseif distance > 1.1 and distance < 5.0 then
            clostestTosbRob = false
        end
         
    end
    return clostestTosbRob
end

RegisterNetEvent('byte_staatsbank:trigger')
AddEventHandler('byte_staatsbank:trigger', function()
    print("Trigger Sgop Rob")
    if nearStaatsbank() then 
        ESX.ShowNotification("Versuche zu Schweißen... Staatsbank")
        TriggerServerEvent('byte:staatsbank:server', clostestsbRobId, clostestsbNeedCops, clostestsbName)
    else
        print("not near") 
        return 
        
    end
end)

 
RegisterNetEvent('byte:staatsbank')
AddEventHandler('byte:staatsbank', function()  
       
       local playerPed = GetPlayerPed(-1)
       TriggerEvent('patron_inventory:progressbar', clostestsbNeedSeconds * 1000)
       TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
       Citizen.Wait(clostestsbNeedSeconds * 1000)
       ClearPedTasksImmediately(playerPed)     
       print("sb Rob Ready") 
       TriggerServerEvent('byte:staatsbankReady', clostestsbRobId)
end) 

