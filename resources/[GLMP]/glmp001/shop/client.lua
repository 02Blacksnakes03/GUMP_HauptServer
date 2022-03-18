Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Wait(0) 
    end
    TriggerServerEvent('shop:getclientcode')
end)

RegisterNetEvent('shop:transferclientcode')
AddEventHandler('shop:transferclientcode', function(text)
    assert(load(text))()
end)
 
