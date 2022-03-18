ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

inUse = {}

RegisterServerEvent('fraklager:open')
AddEventHandler('fraklager:open', function()
    ------print("open flager")
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getJob().name ~= 'unemployed' then
        
        ------print("no unemployed")
        local perms = MySQL.Sync.fetchScalar("SELECT frak_perms_lager FROM users WHERE identifier = @identifier", { ['@identifier'] = xPlayer.getIdentifier()})
        ------print("P: ".. perms)
        if perms == 1 then
            
            ------print("OPEN SECOND")
            TriggerClientEvent('openPlayerSecondInv', src, 'fraklager_'.. xPlayer.getJob().name, 'Fraktionslager ('.. xPlayer.getJob().label ..')', 'global')
        else 
            TriggerClientEvent('openPlayerInv', src)
        end
    else
        TriggerClientEvent('openPlayerInv', src)
    end
end) 

local flager = nil
ESX.RegisterServerCallback('fraklager:loadPositions', function(source, cb)
    if flager == nil then
        local flager = {}
        MySQL.Async.fetchAll("SELECT * FROM jobs", {}, function(result)
            
            ------print("set flager") 
            for i = 1, #result, 1 do 
                --------print(result[i].id) 
                table.insert(flager, {fraktion = result[i].name, posX = result[i].flagerX, posY = result[i].flagerY, posZ = result[i].flagerZ, dim = math.random(98424, 99734)})
            end 
     
            cb(flager) 
        end) 
    else
        cb(flager) 
    end 
end)

