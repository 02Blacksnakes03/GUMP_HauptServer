If you habe any question visit our Discord: https://discord.gg/cEyrXMUd8N


Insert the sql into your database



Add this to the script where you get armor when using an Item! Else it won't work!!!

--> TriggerServerEvent("patron_inventory:setArmorState", "true")

This line should be added right after the PlayerPed got the armor

If you ask yourself why I connected the script with database I did it so cheaters can't give
their self armor and pack it!






If you want to use the Progressbar in other skripts this is the event!

TriggerEvent("patron_inventory:progressbar", [duration])

EXAMPLE

TriggerEvent("patron_inventory:progressbar", 1000)

dont forgett to add Citizen.Wait([duration]) matching with the duration in the event!