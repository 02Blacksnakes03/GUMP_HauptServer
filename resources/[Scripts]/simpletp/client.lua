key_to_teleport = 38

Teleport_Vehicles = true

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]
    {{-2360.73, 3249.46, 31.81, 0}, {-2360.83, 3249.4, 91.9, 0},{36,237,157}, "Aufzug Tower"}, --Medic
    {{327.19, -603.78, 42.28, 0}, {338.64, -583.9, 73.16, 0},{255, 157, 0}, "Aufzug Helipad"}, --Medic
    {{332.43, -595.65, 42.28, 0}, {344.45, -587.06, 27.8, 0},{255, 157, 0}, "Aufzug Lobby"}, --Medic
    {{345.93, -582.54, 27.8, 0}, {338.11, -585.87, 73.16, 0},{255, 157, 0}, "Aufzug Helipad"}, --Medic
    {{340.11, -584.8, 27.8, 0}, {330.41, -601.1, 42.28, 0},{255, 157, 0}, "Aufzug Garage"}, --Medic
    {{996.94, -3200.69, -37.39, 0}, {-1541.19, 91.88, 52.9, 0}, {0, 0, 0}, "LCN Labor"}, --LCN
    {{1066.28, -3183.31, -40.16, 0}, {-1108.56, -1643.45, 3.64, 0}, {0, 0, 0}, "Vagos Labor"}, --Vagos
    {{977.54, 74.04, 69.23, 0}, {965.11, 58.46, 111.55, 0}, {255, 0, 0}, "Casino Aufzug"}, --Casino
    {{-574.87, -940.48, 22.86, 0}, {-568.74, -927.75, 35.83, 0}, {255, 0, 0}, "Aufzug Helipad"}, --Redline Performance
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) and Teleport_Vehicles == true then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) and Teleport_Vehicles == true then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end