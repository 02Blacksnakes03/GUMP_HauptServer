ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('glmp_uniformen:lspdstandard')
AddEventHandler('glmp_uniformen:lspdstandard', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local lspdstandard = xPlayer.getInventoryItem('lspdstandard', 1)

      if lspdstandard and lspdstandard.count ~= 0 then
        TriggerClientEvent('glmp_uniformen:lspdstandard', source)
        xPlayer.removeInventoryItem('lspdstandard', 1)
      end
end)

RegisterServerEvent('glmp_uniformen:lsfdstandard')
AddEventHandler('glmp_uniformen:lsfdstandard', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local lspdstandard = xPlayer.getInventoryItem('lsfdstandard', 1)

      if lspdstandard and lspdstandard.count ~= 0 then
        TriggerClientEvent('glmp_uniformen:lsfdstandard', source)
        xPlayer.removeInventoryItem('lsfdstandard', 1)
      end
end)


ESX.RegisterUsableItem('lspdstandard', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('lspdstandard', 1)

    TriggerClientEvent('glmp_uniformen:lspdstandard', source)
end)

ESX.RegisterUsableItem('lsfdstandard', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.removeInventoryItem('lsfdstandard', 1)

  TriggerClientEvent('glmp_uniformen:lsfdstandard', source)
end)