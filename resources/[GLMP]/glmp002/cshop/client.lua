Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

local cNames = {
    ["1"] = {
        type = "normal",
        tid = "mask_1",
        draw = "mask_2"
    },
    ["4"] = {
        type = "normal",
        tid = "pants_1",
        draw = "pants_2"
    },
    ["6"] = {
        type = "normal",
        tid = "shoes_1",
        draw = "shoes_2"
    },
    ["7"] = {
        type = "normal",
        tid = "chain_1",
        draw = "chain_2"
    },
    ["8"] = {
        type = "normal",
        tid = "tshirt_1",
        draw = "thirst_2"
    },
    ["11"] = {
        type = "normal",
        tid = "torso_1",
        draw = "torso_2"
    },
    ["69"] = {
        type = "body",
        tid = "arms", 
    },  
    ["p-0"] = {
        id = 0,
        type = "prop",
        tid = "helmet_1",
        draw = "helmet_2"
    },
    ["p-1"] = {
        id = 1,
        type = "prop",
        tid = "glasses_1",
        draw = "glasses_2"
    },
    ["p-2"] = {
        id = 2,
        type = "prop",
        tid = "ears_1",
        draw = "ears_2"
    },
    ["p-6"] = {
        id = 6,
        type = "prop",
        tid = "watches_1",
        draw = "watches_2"
    },
    --[[["p-7"] = {
        id = 7,
        type = "prop",
        tid = "bracelets_1",
        draw = "bracelets_2"
    },]]
    

}

local torsod = {
    ['0'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['1'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['2'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['3'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['4'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['5'] = {TorsoCID = 3, TorsoDID = 5, TorsoTID = 0},
['6'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['7'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['8'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['9'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['10'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['11'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['12'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['13'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['14'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['16'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['17'] = {TorsoCID = 3, TorsoDID = 5, TorsoTID = 0},
['18'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['19'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['20'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['21'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['22'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['23'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['24'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['25'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['26'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['27'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['28'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['29'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['30'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['31'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['32'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['33'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['34'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['35'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['36'] = {TorsoCID = 3, TorsoDID = 5, TorsoTID = 0},
['37'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['38'] = {TorsoCID = 3, TorsoDID = 8, TorsoTID = 0},
['39'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['40'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['41'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['42'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['43'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['44'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['45'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['46'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['47'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['48'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['49'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['50'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['51'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['52'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['53'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['54'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['55'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['57'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['58'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['59'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['60'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['61'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['62'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['63'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['64'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['68'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['69'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['70'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['71'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['72'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['73'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['74'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['75'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['76'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['77'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['78'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['80'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['81'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['82'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['83'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['84'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['85'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['86'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['87'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['88'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['89'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['90'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['92'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['93'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['94'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['95'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['96'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['97'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['98'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['99'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['100'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['101'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['102'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['103'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['104'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['105'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['106'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['107'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['108'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['109'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['110'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['112'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['113'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['114'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['115'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['117'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['119'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['120'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['121'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['122'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['123'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['124'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['125'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['126'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['127'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['129'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['130'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['131'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['132'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['133'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['134'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['135'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['136'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['137'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['138'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['139'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['140'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['141'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['142'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['144'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['145'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['150'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['151'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['152'] = {TorsoCID = 3, TorsoDID = 111, TorsoTID = 0},
['153'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['154'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['156'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['157'] = {TorsoCID = 3, TorsoDID = 112, TorsoTID = 0},
['158'] = {TorsoCID = 3, TorsoDID = 113, TorsoTID = 0},
['159'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['160'] = {TorsoCID = 3, TorsoDID = 115, TorsoTID = 0},
['161'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['162'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['163'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['164'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['165'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['166'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['167'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['168'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['169'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['170'] = {TorsoCID = 3, TorsoDID = 112, TorsoTID = 0},
['172'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['173'] = {TorsoCID = 3, TorsoDID = 112, TorsoTID = 0},
['174'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['175'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['176'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['177'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['183'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['184'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['185'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['187'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['188'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['189'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['190'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['191'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['192'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['193'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['194'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['195'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['196'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['197'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['198'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['199'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['200'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['202'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['203'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['204'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['205'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['206'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['207'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['208'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['209'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['210'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['211'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['212'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['213'] = {TorsoCID = 3, TorsoDID = 113, TorsoTID = 0},
['214'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['215'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['216'] = {TorsoCID = 3, TorsoDID = 112, TorsoTID = 0},
['217'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['218'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['219'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['220'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['221'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['222'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['223'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['224'] = {TorsoCID = 3, TorsoDID = 12, TorsoTID = 0},
['225'] = {TorsoCID = 3, TorsoDID = 8, TorsoTID = 0},
['226'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['229'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['230'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['232'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['233'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['234'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['235'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['236'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['238'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['239'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['240'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['244'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['245'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['247'] = {TorsoCID = 3, TorsoDID = 114, TorsoTID = 0},
['248'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['255'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['256'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['257'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['258'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['259'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['260'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['261'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['262'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['263'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['264'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['265'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['266'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['267'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['268'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['269'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['271'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['273'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['275'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['276'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['279'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['280'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['281'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['282'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['288'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['289'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['292'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['293'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['294'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['295'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['296'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['297'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['298'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['299'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['300'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['301'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['302'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['303'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['304'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['305'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['306'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['307'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['308'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['309'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['310'] = {TorsoCID = 3, TorsoDID = 14, TorsoTID = 0},
['311'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['312'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['313'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['316'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['317'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['318'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['319'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['321'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['322'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['323'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['324'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['325'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['326'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['327'] = {TorsoCID = 3, TorsoDID = 113, TorsoTID = 0},
['328'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['329'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['330'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['331'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['332'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['334'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['335'] = {TorsoCID = 3, TorsoDID = 8, TorsoTID = 0},
['336'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['337'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['338'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['339'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['340'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['341'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['342'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['343'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['344'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['345'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['346'] = {TorsoCID = 3, TorsoDID = 184, TorsoTID = 0},
['347'] = {TorsoCID = 3, TorsoDID = 184, TorsoTID = 0},
['348'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['349'] = {TorsoCID = 3, TorsoDID = 1, TorsoTID = 0},
['350'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['351'] = {TorsoCID = 3, TorsoDID = 0, TorsoTID = 0},
['354'] = {TorsoCID = 3, TorsoDID = 11, TorsoTID = 0},
['355'] = {TorsoCID = 3, TorsoDID = 184, TorsoTID = 0},
['356'] = {TorsoCID = 3, TorsoDID = 8, TorsoTID = 0},
['357'] = {TorsoCID = 3, TorsoDID = 2, TorsoTID = 0},
['358'] = {TorsoCID = 3, TorsoDID = 6, TorsoTID = 0},
['359'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['360'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0},
['361'] = {TorsoCID = 3, TorsoDID = 4, TorsoTID = 0}
}


local Kleiderschrank = {
    {
        pos = vector3(406.4330, -805.0630, 29.3399),
        heading = 119.1532,
        type = 'normal'
    },
    { 
        pos = vector3(461.62, -998.96, 30.69),
        radius             = 5.0,
        heading = 461.62,
        type = 'fraktion'
    },
    {
        pos = vector3(-786.48, -1350.96, 8.56),
        heading = 113.13,
        type = 'fraktion'
    },
    { 
        pos = vector3(298.6, -598.76, 43.28),
        heading = 250.02,
        type = 'fraktion'
    },
    {  
        pos = vector3(1706.04, 4774.64, 14.2),
        heading = 250.02,
        type = 'fraktion'
    },
    {  
        pos = vector3(-819.81, -1067.22, 11.33),
        heading = 114.81,
        type = 'normal'
    }, 
    {
        pos = vector3(429.68, -811.5, 29.49),
        heading = 0.34,
        type = 'normal'
    },
    {
        pos = vector3(71.15, -1387.44, 29.38),
        heading = 179.54,
        type = 'normal'
    },
    {
        pos = vector3(-1182.25, -765.22, 17.33),
        heading = 122.27,
        type = 'normal'
    },
    {
        pos = vector3(118.1, -232.32, 54.56),
        heading = 339.22,
        type = 'normal'
    },
    {
        pos = vector3(-170.94, -296.44, 39.73),
        heading = 251.61,
        type = 'normal'
    },
    {
        pos = vector3(-700.05, -151.63, 37.42),
        heading = 109.22,
        type = 'normal'
    },
    {
        pos = vector3(-1446.01, -246.43, 49.83),
        heading = 41.02,
        type = 'normal'
    },
    {
        pos = vector3(-3178.75, 1035.7, 20.86),
        heading = 334.62,
        type = 'normal'
    },
    {
        pos = vector3(617.79, 2773.38, 42.09),
        heading = 180.66,
        type = 'normal'
    },  
    {   
        pos = vector3(1201.82, 2714.38, 38.22),
        heading = 90.43,
        type = 'normal'
    },
    {
        pos = vector3(1698.7, 4818.33, 42.06),
        heading = 4.96,
        type = 'normal'
    },
    {
        pos = vector3(3.66, 6505.89, 31.88),
        heading = 307.75,
        type = 'normal'
    },
    {   
        pos = vector3(-1037.28, -2815.88, 27.69),
        heading = 147.77,
        type = 'normal'
    },
}

local Kleidungsladen = {
    {
        pos = vector3(72.254,-1399.102,28.376),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "normal"
    },
 
 {
        pos = vector3(-703.776,-152.258,36.415),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "luxus_boutique"
    },

{
        pos = vector3(-167.863,-298.969,38.733),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "luxus"
    },

{
        pos = vector3(428.694,-800.106,28.491),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "normal"
    },

{
        pos = vector3(-829.413,-1073.710,10.328),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "normal"
    },

{
        pos = vector3(-1447.797,-242.461,48.820),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "luxus"
    },

{
        pos = vector3(11.632,6514.224,30.877),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "normal"
    },

{
        pos = vector3(123.646,-219.440,53.557),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "extended_normal"
    },

{
        pos = vector3(1696.291,4829.312,41.063),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "normal"
    },

{
        pos = vector3(618.093,2759.629,41.088),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "extended_normal"
    },

{
        pos = vector3(1190.550,2713.441,37.222),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "normal"
    },

{
        pos = vector3(-1193.429,-772.262,16.324),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "extended_normal"
    },

{
        pos = vector3(-3172.496,1048.133,19.863),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "extended_normal"
    },
 
{
        pos = vector3(1104.17,196.07,-49.44),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "casino"
    },

{
        pos = vector3(-622.01,-230.93,38.06),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "juwe" 
    },

{
        pos = vector3(-1045.04, -2827.44, 27.68),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "einreise"
    },

{
        pos = vector3(-1339.06,-1278.03,4.88),
        heading = 428.6092, -800.6047, 29.4911, 92.0190,
        type = "mask"
    }

















}
 
function blipsclothing()
    for _,x in pairs(Kleidungsladen) do
		local blip = AddBlipForCoord(x.pos.x, x.pos.y, x.pos.z)

		SetBlipSprite (blip, 73)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Kleidungsladen")
		EndTextCommandSetBlipName(blip)
    end
end
blipsclothing()
playerWType = nil
local wasinmarker = false
local wasinschrank = false

function OpenShopMenu()
	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
   
		menu.close()
 
		ESX.UI.Menu.Open(
			'default', "CShop", 'shop_confirm',
			{
				title = 'Möchtest du deinen Skin so lassen?',
				align = 'top-left',
				elements = { 
					{label = 'Bestätigen', value = 'yes'},
					{label = 'Abbrechen', value = 'no'},
				}
			},
			function(data, menu)

				menu.close()

				if data.current.value == 'yes' then

					

							ESX.ShowNotification("Skin wurde Gespeichert!")

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

							
						

					

				end

				if data.current.value == 'no' then

					TriggerEvent('esx_skin:getLastSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)

				end 

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = '_U(press_access)'
				CurrentActionData = {}

			end, 
			function(data, menu)

				menu.close()

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = " _U('press_access')"
				CurrentActionData = {}

			end
		)

	end, function(data, menu)

			menu.close()

			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = "_U('press_access')"
			CurrentActionData = {}

	end, {
		'torso_1',
		'torso_2',
		'tshirt_1',
		'tshirt_2',
		'arms',
		'shoes_1',
		'shoes_2',
		'pants_1',
		'pants_2',
		'glasses_1',
		'glasses_2',
		'helmet_1',
		'helmet_2',
		'chain_1',
		'chain_2', 
		'bag',
		'bag_color',

	})
end

function OpenShopMenuM()
	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
   
		menu.close()
 
		ESX.UI.Menu.Open(
			'default', "CShop", 'shop_confirm',
			{
				title = 'Möchtest du deinen Skin so lassen?',
				align = 'top-left',
				elements = { 
					{label = 'Bestätigen', value = 'yes'},
					{label = 'Abbrechen', value = 'no'},
				}
			},
			function(data, menu)

				menu.close()

				if data.current.value == 'yes' then

					

							ESX.ShowNotification("Skin wurde Gespeichert!")

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)

							
						

					

				end

				if data.current.value == 'no' then

					TriggerEvent('esx_skin:getLastSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)

				end 

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = '_U(press_access)'
				CurrentActionData = {}

			end, 
			function(data, menu)

				menu.close()

				CurrentAction     = 'shop_menu'
				CurrentActionMsg  = " _U('press_access')"
				CurrentActionData = {}

			end
		)

	end, function(data, menu)

			menu.close()

			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = "_U('press_access')"
			CurrentActionData = {}

	end, {
		'mask_1',
		'mask_2',

	})
end

Citizen.CreateThread(function()
    while true do
        Wait(1)
        for _,x in pairs(Kleidungsladen) do
            local dist = GetDistanceBetweenCoords(x.pos, GetEntityCoords(PlayerPedId()))
            if dist < 2.5 then
                if wasinmarker == false then
                    wasinmarker = true
                   -- ESX.ShowNotification("Drücke E um auf den Kleidungsladen zuzugreifen")
                end
                if IsControlJustPressed(0, 38) then
                    --[[if x.type == 'mask' then 
                        OpenShopMenuM()
                    else   
                        OpenShopMenu()
                    end--]]
                    local data = {
                        name = "Kleidungsladen"
                    }
                    SetNuiFocus(true, true)
                    SendNUIMessage({action="openClothingShop", data=json.encode(data)})
                    CreationCamHead(x.heading, x.pos)
                end
            elseif dist > 2.5 and dist < 4 then
                wasinmarker = false
            end 
        end
        for _,x in pairs(Kleiderschrank) do
            local dist = GetDistanceBetweenCoords(x.pos, GetEntityCoords(PlayerPedId()))
            if dist < 2.5 then
                if wasinschrank == false then
                    wasinschrank = true
                    ESX.ShowNotification("Drücke E um auf den Kleiderschrank zuzugreifen")
                end
                --ESX.ShowHelpNotification("Drücke ~INPUT_PICKUP~ um auf den Kleidungsladen zuzugreifen")
                if IsControlJustPressed(0, 38) then
                    local data = {
                        name = "Kleiderschrank"
                    }
                    SetNuiFocus(true, true)
                    SendNUIMessage({action="openWardrobe", data=json.encode(data)})
                    CreationCamHead(x.heading, x.pos)
                    if x.type == 'fraktion' then
                        playerWType = ESX.GetPlayerData().job.name 
                    else
                        playerWType = x.type
                    end
                end
            elseif dist > 2.5 and dist < 4 then
                wasinschrank = false
            end
        end
    end
end)

hasbought = false

RegisterNUICallback("trigger", function(data, cb)
    if data.event == "componentTriggerServerEvent" then
        if data.args[1] == "Wardrobe" then
            if data.args[2] == "wardrobeSave" then
                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end
            if data.args[2] == "wardrobeLoadClothes" then
                ESX.TriggerServerCallback("glmp:wardrobeLoadClothes", function(cb) 
                    SendNUIMessage({action="responseWardrobeClothes", data=json.encode(cb)})
                end, data.args[3], playerWType )
            end
            if data.args[2] == "wardrobeDress" then
                ESX.TriggerServerCallback("glmp:clothingShopGetIds", function(cb) 
                    local n = tostring(data.args[4])
                    local obj = cNames[n]

           
                    TriggerEvent('skinchanger:change', obj.draw, cb[1].tid)
                    TriggerEvent('skinchanger:change', obj.tid, cb[1].draw)
           

                    if tonumber(data.args[5]) == 11 then
                        SetPedComponentVariation(PlayerPedId(), torsod[tostring(cb[1].draw)].TorsoCID, torsod[tostring(cb[1].draw)].TorsoDID, torsod[tostring(cb[1].draw)].TorsoTID, 1)
                    end

            

                    --[[if obj.type == "prop" then
                        SetPedPropIndex(PlayerPedId(), tonumber(string.gsub(data.args[4], "p-", "")), cb[1].draw, cb[i].tid, true)
                    else
                        SetPedComponentVariation(PlayerPedId(), tonumber(data.args[4]), cb[1].draw, cb[1].tid, 2)
                    end]]

                end, data.args[3], data.args[4])

            end
        end
        if data.args[1] == "ClothingShop" then
            if data.args[2] == "clothingShopUndress" then
                ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(cb) 
                    local object = cNames[tostring(data.args[3])]
                    local id = tonumber(cb[cNames[tostring(data.args[3])].tid])
                    local id2 = tonumber(cb[cNames[tostring(data.args[3])].draw])
                    if object.type == "normal" then
                        SetPedComponentVariation(PlayerPedId(), tonumber(data.args[3]), id2, id, 1)
                        --print("id2"..id2)
                    else
                        local att = true
                        if id == -1 then
                            ClearPedProp(PlayerPedId(), object.id)
                        else
                            SetPedPropIndex(PlayerPedId(), object.id, id2, id, att)
                        end
                    end
                end)
                -- 3 = cid
            end
            if data.args[2] == "clothingShopWeg" then
                TriggerServerEvent('delclothe', data.args[3], data.args[4], data.args[5])
            end
            if data.args[2] == "clothingShopDress" then
                ESX.TriggerServerCallback("glmp:clothingShopGetIds", function(cb) 
                    local n = tostring(data.args[5])
                    local obj = cNames[n]
                    
        

                    if tonumber(data.args[5]) == 11 then
                        SetPedComponentVariation(PlayerPedId(), torsod[tostring(cb[1].draw)].TorsoCID, torsod[tostring(cb[1].draw)].TorsoDID, torsod[tostring(cb[1].draw)].TorsoTID, 1)
                    end

                    if obj.type == "prop" then
                        SetPedPropIndex(PlayerPedId(), obj.id, cb[1].draw, cb[1].tid, true)
                    elseif obj.type == "body" then
                        SetPedComponentVariation(PlayerPedId(), 3, cb[1].draw, cb[1].tid, 2)
                 
                    else
                        SetPedComponentVariation(PlayerPedId(), tonumber(data.args[5]), cb[1].draw, cb[1].tid, 2)
                    
                    end

                end, data.args[3], data.args[5])
            end
            if data.args[2] == "clothingShopBuy" then
                hasbought = true
                local cartData = json.decode(data.args[3])
                local wearingData = json.decode(data.args[4])
                ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin) 
                    TriggerEvent('skinchanger:loadSkin', skin)  
                    ESX.TriggerServerCallback("glmp:ClothingShopBuy", function(cb) 
                        --print(cb.skin['tshirt_1'] .. "TSH")
                        cb.skin['arms'] = torsod[tostring(cb.skin['tshirt_1'])].TorsoDID
                        cb.skin['arms_2'] = torsod[tostring(cb.skin['tshirt_1'])].TorsoTID
                        TriggerEvent('skinchanger:loadSkin', cb.skin)
                        if cb.bought == true then
                            TriggerServerEvent('esx_skin:save', cb.skin)
                        elseif cb.bought == false then
                            ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skinOld) 
                                TriggerEvent('skinchanger:loadSkin', skinOld)  
                            end)
                        end
                    end, cartData, wearingData, skin)
                end)
            end
            if data.args[2] == "clothingShopReset" then
                ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin) 
                    TriggerEvent('skinchanger:loadSkin', skin)  
                end)
            end
            if data.args[2] == "clothingShopLoadCategories" then
                ESX.TriggerServerCallback("glmp:clothingShopLoadCategories", function(cb) 
                    --print(json.encode(cb))
                    SendNUIMessage({action="responseClothingShopCategories", data=json.encode(cb)})
                end, data.args[3])
            end
            if data.args[2] == "clothingShopLoadClothes" then
                --print("AMK KLEIDUNG LADEN")
                ESX.TriggerServerCallback("glmp:clothingShopLoadClothes", function(cb) 
                    SendNUIMessage({action="responseClothingShopClothes", data=json.encode(cb)})
                end, data.args[3], data.args[4])
            end
        end
    end
    if data.event == "componentEvent" then
        if data.args[1] == "ClothingShop" then
            if data.args[2] == "moveCam" then
                local obj = json.decode(data.args[3])
                moveCam(obj.offset, obj.slot, obj.isX, obj.isY)
            end
            if data.args[2] == "zoomToSlot" then
                local obj = json.decode(data.args[3])
                zoomToSlot(obj.slot, obj.isY)
            end
            if data.args[2] == "zoomOut" then
                toInitialZoom()
            end
        end
        if data.args[1] == "Wardrobe" then
            if data.args[2] == "moveCam" then
                local obj = json.decode(data.args[3])
                moveCam(obj.offset, obj.slot, obj.isX, obj.isY)
            end
            if data.args[2] == "zoomToSlot" then
                local obj = json.decode(data.args[3])
                zoomToSlot(obj.slot, obj.isY)
            end
            if data.args[2] == "zoomOut" then
                toInitialZoom()
            end
        end
    end
    if data.event == "onWindowClosed" then
        if data.args[1] == "ClothingShop" then
            RenderScriptCams(0)
            SetNuiFocus(false, false)
            wasinmarker = false
            hasbought = false
        end
        if data.args[1] == "Wardrobe" then
            RenderScriptCams(0)
            SetNuiFocus(false, false)
            wasinmarker = false
        end
    end
end)


function CreationCamHead(h, pos)
    SetEntityHeading(PlayerPedId(), h)
    SetEntityCoordsNoOffset(PlayerPedId(), pos)
	cam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
    local player = {
        position = GetEntityCoords(PlayerPedId())
    }
	local coordsCam = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.40, 0.0)
	local coordsPly = GetEntityCoords(PlayerPedId())
    local offset = offsetPosition(player.position.x, player.position.y, GetEntityHeading(PlayerPedId()), 1.8);
    local targetPositionFly = vector3(offset.x, offset.y, player.position.z)
    local targetPositionPoint = player.position
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)

	SetCamActive(cam, true)
	RenderScriptCams(true, false, 500, true, true)
end

function zoomToSlot(slot, isY)
    local player = {
        position = GetEntityCoords(PlayerPedId())
    }
    local data = getMovementData(slot, isY)
    local offset = offsetPosition(player.position.x, player.position.y, data.heading, data.distance)
    local targetPositionFly = vector3(offset.x, offset.y, data.camPos.z)
    local targetPositionPoint = vector3(player.position.x, player.position.y, data.pointPos.z)
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
end

function toInitialZoom(create)
    if create == nil then
        create = false
    end
    local player = {
        position = GetEntityCoords(PlayerPedId())
    }
    local offset = offsetPosition(player.position.x, player.position.y, GetEntityHeading(PlayerPedId()), 1.8);
    if create then
        SetCamCoord(cam, vector3(offset.x, offset.y, player.position.z))
        PointCamAtCoord(player.position)
    end
    local targetPositionFly = vector3(offset.x, offset.y, player.position.z)
    local targetPositionPoint = player.position
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
end

function moveCam(heading, slot, isX, isY)
    local player = {
        position = GetEntityCoords(PlayerPedId())
    }
    --print(heading, slot, isX, isY)
    if (isX ~= isY) and slot ~= nil then
        local data = getMovementData(slot, isY)
        local offset = offsetPosition(player.position.x, player.position.y, data.heading + heading, data.distance)
        local targetPositionFly = vector3(offset.x, offset.y, data.camPos.z)
        local targetPositionPoint = vector3(player.position.x, player.position.y, data.pointPos.z)
        SetCamCoord(cam, targetPositionFly)
        PointCamAtCoord(cam, targetPositionPoint)
        --RenderScriptCams(true, false, 500, true, true)
        return
    end

    local offset = offsetPosition(player.position.x, player.position.y, GetEntityHeading(PlayerPedId()) + heading, 1.8);
    local targetPositionFly = vector3(offset.x, offset.y, player.position.z)
    local targetPositionPoint = player.position
    SetCamCoord(cam, targetPositionFly)
    PointCamAtCoord(cam, targetPositionPoint)
    --RenderScriptCams(true, false, 500, true, true)
end


function getMovementData(slot, isY)
    local data = {
        heading = GetEntityHeading(PlayerPedId()),
        distance = 1,
        camPos = {
            z = GetEntityCoords(PlayerPedId()).z
        },
        pointPos = {
            z = GetEntityCoords(PlayerPedId()).z
        }
    }
    local slot = tostring(slot)
    --print(type(slot), slot)
    if slot == "1" then
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.5
    elseif slot == "3" then
        data.distance = 3
    elseif slot == "4" then
        data.camPos.z = data.camPos.z - 0.6
    elseif slot == "5" then
        data.heading = data.heading + 100
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.2
    elseif slot == "6" then
        data.camPos.z = data.camPos.z - 0.6
        data.pointPos.z = data.pointPos.z - 0.8
    elseif slot == "11" then
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.2
    elseif slot == "p-0" then
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.5
    elseif slot == "p-2" then
        if isY == true then
            data.heading = data.heading + 90
        else
            data.heading = data.heading - 90
        end
        data.camPos.z = data.camPos.z + 0.5
        data.pointPos.z = data.pointPos.z + 0.5
    elseif slot == "p-7" then
        if isY == true then
            data.heading = data.heading + 90
        else
            data.heading = data.heading - 90
        end
        data.camPos.z = data.camPos.z + 0.3
        data.pointPos.z = data.pointPos.z - 0.1
    end
    return data
end

function offsetPosition(x, y, rot, distance)
    local obj = {
        x = x + math.sin(-rot * math.pi / 180) * distance,
        y = y + math.cos(-rot * math.pi / 180) * distance
    }
    return obj
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if PlayerData.job and PlayerData.job.name == 'police' then

            local playerPed = PlayerPedId()
            local coords    = GetEntityCoords(playerPed)
            local isInMarker, hasExited, letSleep = false, false, true
            local currentStation, currentPart, currentPartNum

            for k,v in pairs(Kleiderschrank) do
                for i=1, #v.Cloakrooms, 1 do
                    local distance = GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true)

                    if distance < Config.DrawDistance then 
                        DrawMarker(20, v.Cloakrooms[i], true)
                        letSleep = false
                    end

                    if distance < Config.MarkerSize.x then
                        isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Kleiderschrank', i
                    end
                end
            end
        end 
    end
end)
                    
                    