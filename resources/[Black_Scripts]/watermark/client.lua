-- Made by FAXES, Based off HRC
AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()
    local display = true

    TriggerEvent('Discord:display', true)
  end)
end)

RegisterNetEvent('Discord:display')
AddEventHandler('Discord:display', function(value)
  SendNUIMessage({
    type = "Discord",
    display = value
  })
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end