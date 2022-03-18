Citizen.CreateThread(function()
  RequestIpl("gabz_pillbox_milo_")

  local interiorID = GetInteriorAtCoords(311.2546, -592.4204, 42.32737)
  LoadInterior(GetInteriorAtCoords(440.84, -983.14, 30.69))

  if IsValidInterior(interiorID) then
    RemoveIpl("rc12b_fixed")
    RemoveIpl("rc12b_destroyed")
    RemoveIpl("rc12b_default")
    RemoveIpl("rc12b_hospitalinterior_lod")
    RemoveIpl("rc12b_hospitalinterior")
    RefreshInterior(interiorID)
  end
end)

Citizen.CreateThread(function()
    while (true) do
        ClearAreaOfPeds(440.84, -983.14, 30.69, 300, 1)
        Citizen.Wait(0)
    end
end)