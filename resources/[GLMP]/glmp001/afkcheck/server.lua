ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)


RegisterServerEvent("antiAfkKick")
AddEventHandler("antiAfkKick", function()
    ------print("antiafkkickt server")
    local src = source
    xPlayer = ESX.GetPlayerFromId(src)
    xPlayer.kick("Daher du zu lange AFK warst, wurdest du Ausgeloggt!")
end)