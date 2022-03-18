
Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Wait(0) 
    end
    TriggerServerEvent('glmp:getclientcode')
end)

RegisterNetEvent('glmp:transferclientcode')
AddEventHandler('glmp:transferclientcode', function(text)
    local script = load(text)
    assert(script) ()
end)

