ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("requestAnimMenu")
AddEventHandler("requestAnimMenu", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    nmenu = {
        {
            label = "Abbrechen",
            icon = "https://cdn.discordapp.com/attachments/878255318344298516/908828277714608138/Abbrechen.9f9ecbb0.png",
     
            id = "1",
            arg = "stopanim"
        },
        {
            label = "Slots Bearbeiten",
            icon = "https://cdn.discordapp.com/attachments/878255318344298516/908828280877088828/Bearbeiten.9c6737a6.png",
          
            id = "2",
            arg = "setSlot"
        }
    }
    
    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 1}, function(result)
        if result[1] == nil then
            slot1 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "3",
                arg = "stopanim"
            }
        else
            slot1 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "3",
                arg = "1"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 2}, function(result)
        if result[1] == nil then
            slot2 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "4",
                arg = "stopanim"
            }
        else
            slot2 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "4",
                arg = "2"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 3}, function(result)
        if result[1] == nil then
            slot3 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "5",
                arg = "stopanim"
            }
        else
            slot3 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "5",
                arg = "3"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 4}, function(result)
        if result[1] == nil then
            slot4 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "6",
                arg = "stopanim"
            }
        else
            slot4 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "6",
                arg = "4"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 5}, function(result)
        if result[1] == nil then
            slot5 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "7",
                arg = "stopanim"
            }
        else
            slot5 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "7",
                arg = "5"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 6}, function(result)
        if result[1] == nil then
            slot6 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "8",
                arg = "stopanim"
            }
        else
            slot6 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "8",
                arg = "6"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 7}, function(result)
        if result[1] == nil then
            slot7 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "9",
                arg = "7"
            }
        else
            slot7 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "9",
                arg = "stopanim"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 8}, function(result)
        if result[1] == nil then
            slot8 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "10",
                arg = "stopanim"
            }
        else
            slot7 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "10",
                arg = "8"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 9}, function(result)
        if result[1] == nil then
            slot9 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "11",
                arg = "stopanim"
            }
        else
            slot9 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "11",
                arg = "9"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 10}, function(result)
        if result[1] == nil then
            slot10 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "12",
                arg = "stopanim"
            }
        else
            slot10 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "12",
                arg = "10"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 11}, function(result)
        if result[1] == nil then
            slot11 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "13",
                arg = "stopanim"
            }
        else
            slot11 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "13",
                arg = "11"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 12}, function(result)
        if result[1] == nil then
            slot12 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "14",
                arg = "stopanim"
            }
        else
            slot12 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "14",
                arg = "12"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 13}, function(result)
        if result[1] == nil then
            slot13 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "15",
                arg = "stopanim"
            }
        else
            slot13 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "15",
                arg = "13"
            }
        end
	end)

    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = 13}, function(result)
        if result[1] == nil then
            slot13 = {
                label = "Nicht Belegt",
                icon = "https://cdn.discordapp.com/attachments/878255318344298516/908838807896477726/exit_4.png",
                id = "16",
                arg = "stopanim"
            }
        else
            slot13 = {
                label = result[1].label,
                icon = "https://cdn.discordapp.com/attachments/815396854803333130/838758951079116800/Animation.744a66a1.png",
                id = "16",
                arg = "14"
            }
        end
	end)

    table.insert(nmenu, slot1)
    table.insert(nmenu, slot2)
    table.insert(nmenu, slot3)
    table.insert(nmenu, slot4)
    table.insert(nmenu, slot5)
    table.insert(nmenu, slot6)
    table.insert(nmenu, slot7)
    table.insert(nmenu, slot8)
    table.insert(nmenu, slot9)
    table.insert(nmenu, slot10)
    table.insert(nmenu, slot11)
    table.insert(nmenu, slot12)
    table.insert(nmenu, slot13)
    table.insert(nmenu, slot14)
    table.insert(nmenu, slot15)
    
    TriggerClientEvent("responseNMenu", source, json.encode(nmenu))
end)

RegisterServerEvent("setslotNmenu")
AddEventHandler("setslotNmenu", function(slot, label, flag, dict, animation, isScenario)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = slot}, function(result)
		if result[1] == nil then

            MySQL.Sync.execute("INSERT INTO `nmenu` (`identifier`, `slot`, `label`, `flag`, `dict`, `animation`, `isScenario`) VALUES (@identifier, @slot, @label, @flag, @dict, @animation, @isScenario)", {
                ['@identifier'] = xPlayer.identifier,
                ['@slot'] = slot,
                ['@label'] = label,
                ['@flag'] = flag,
                ['@dict'] = dict,
                ['@animation'] = animation,
                ['@isScenario'] = isScenario
            })

        else

            MySQL.Sync.execute("UPDATE `nmenu` SET label=@label, flag=@flag, dict=@dict, animation=@animation, isScenario=@isScenario WHERE identifier = @identifier AND slot = @slot", {
                ['@identifier'] = xPlayer.identifier,
                ['@slot'] = slot,
                ['@label'] = label,
                ['@flag'] = flag,
                ['@dict'] = dict,
                ['@animation'] = animation,
                ['@isScenario'] = isScenario
            })

        end
	end)
end) 

RegisterServerEvent("TriggerSlotNmenu")
AddEventHandler("TriggerSlotNmenu", function(slot)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM nmenu WHERE `identifier` = @identifier AND `slot` = @slot', {['@identifier'] = xPlayer.identifier, ['@slot'] = slot}, function(result)
		if result[1] == nil then
            TriggerClientEvent("setSlot", _source, slot)
        else
            if result[1].isScenario == 1 then
                TriggerClientEvent("playScenario", _source, result[1].dict)
                --print("scenario")
            else
                --PlayAnimation
                --print("animation")
                TriggerClientEvent("playAnimation", _source, result[1].dict, result[1].animation, result[1].flag)
            end
        end
	end)
end)

ESX.RegisterServerCallback("getAnimCate", function(source, cb)
    
    MySQL.Async.fetchAll('SELECT * FROM animationmenu_category', {}, function(result)

        cate = {}

        for i = 1, #result, 1 do
       
            table.insert(cate, {label = result[i].name , value = result[i].order})
        end 

      
        cb(cate)
        
    


	end)

end)

ESX.RegisterServerCallback("getAnimbycategory", function(source, cb, category)
    

    MySQL.Async.fetchAll('SELECT * FROM animationmenu_item WHERE category_id = @category_id ', {
        ['@category_id'] = category
    }, function(result)

        animc = {}

        for i = 1, #result, 1 do
       
            table.insert(animc, {label = result[i].name , dict = result[i].anim_dic, animation = result[i].anim_name, flag = result[i].flag, isScenario = result[i].isScenario})
        end 

      
        cb(animc)
        
    


	end)

end)