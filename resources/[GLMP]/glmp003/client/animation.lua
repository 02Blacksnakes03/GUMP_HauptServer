function DoThrowGiveAnimation()
    local ped = PlayerPedId()
    local AnimationLib = 'anim@mp_snowball'
    local AnimationStatus = 'pickup_snowball'

    RequestAnimDict(AnimationLib)
    --ClearPedTasksImmediately(PlayerPedId()) 
	TaskPlayAnim(ped, AnimationLib, AnimationStatus, 8.0, -1, -1, 0, 1, 0, 0, 0)
end

function DoPackAnimation()
    local ped = PlayerPedId()
    local AnimationLib = 'anim@heists@narcotics@funding@gang_idle'
    local AnimationStatus = 'gang_chatting_idle01'

    RequestAnimDict(AnimationLib)
   -- ClearPedTasksImmediately(PlayerPedId()) 
    ESX.Streaming.RequestAnimDict(AnimationLib, function()
        TaskPlayAnim(PlayerPedId(), AnimationLib, AnimationStatus, 8.0, -8.0, -1, 1, 0, false, false, false)
    end)
end