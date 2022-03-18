
apiKey = "apiKeyBot"

local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)


function isPlayerOnDiscord(id)
    PerformHttpRequest("http://localhost:3000/discord/user/"..id, 
    function (errorCode, resultData, resultHeaders)
         ------print( tostring(resultData) )
  
    end, 'GET', "", {Authorization = "Bearer ".. apiKey}) 
end

function addDiscordRole(id, role)
    PerformHttpRequest("http://localhost:3000/discord/user/".. id .."/role/add/".. role, 
    function (errorCode, resultData, resultHeaders)
        ------print(errorCode)
        ------print(resultData)
        ------print(json.encode(resultHeaders))
    end, 'POST', "", {Authorization = "Bearer ".. apiKey})  
end

function setDiscordNick(id, nick) 
    ------print("set dc nick from ".. id .. " to ".. nick)
    PerformHttpRequest("http://localhost:3000/discord/user/".. id .."/nickname/".. nick, 
    function (errorCode, resultData, resultHeaders)
        ------print(errorCode)
        ------print(resultData)
        ------print(json.encode(resultHeaders))
    end, 'POST', "", {Authorization = "Bearer ".. apiKey})  
end


function removeDiscordRole(id, role)
    PerformHttpRequest("http://localhost:3000/discord/user/".. id .."/role/remove/".. role, 
    function (errorCode, resultData, resultHeaders)
        ------print(errorCode)
        ------print(resultData)
        ------print(json.encode(resultHeaders))
    end, 'POST', "", {Authorization = "Bearer ".. apiKey})  
end

function removeAllDiscordRole(id)
    PerformHttpRequest("http://localhost:3000/discord/user/".. id .."/role/removeall", 
    function (errorCode, resultData, resultHeaders)
        ------print(errorCode)
        ------print(resultData)
        ------print(json.encode(resultHeaders))
    end, 'POST', "", {Authorization = "Bearer ".. apiKey})  
end

  
RegisterServerEvent('discord:sendMessage')
AddEventHandler('discord:sendMessage', function(id, msg)
    ------print("send ".. msg .. " for ".. id)
    sendMessage(id, msg)
end) 
function sendMessage(id, msg)
    ----print("AMK DU HS SEND DC MESSAGE")
    PerformHttpRequest("http://localhost:3000/discord/user/".. id .."/message/private", 
    function (errorCode, resultData, resultHeaders)
        ------print(errorCode)
        ------print(resultData) 
        ------print(json.encode(resultHeaders))
    end, 'POST', msg, {Authorization = "Bearer ".. apiKey})  
end
  
function sendEmbed(id, msg)
    PerformHttpRequest("http://localhost:3000/discord/user/".. id .."/message/private", 
    function (errorCode, resultData, resultHeaders)
        ------print(errorCode)
        ------print(resultData) 
        ------print(json.encode(resultHeaders))
    end, 'POST', msg, {Authorization = "Bearer ".. apiKey})  
end

verifyToken = {}
discordId = {}
adminRank = {}

administrator = {}
RegisterServerEvent('discord:syncAccount')
AddEventHandler('discord:syncAccount', function(identifier, discord, playerSrc)
    ------print(identifier)
    ------print(discord) 
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @ident", {['@ident'] = identifier }, function(resultt)
        if resultt[1].firstname ~= "" then
            setDiscordNick(discord, resultt[1].firstname .. '_' .. resultt[1].lastname)
        end 
        if playerSrc > 0 then
            if GetPlayerName(playerSrc) ~= nil then
                MySQL.Async.fetchScalar("UPDATE users SET displayname = @dc WHERE identifier = @ident", {['@ident'] = identifier, ['@dc'] = GetPlayerName(playerSrc)}) 
            end
        end 
        MySQL.Async.fetchScalar("UPDATE users SET discord = @dc WHERE identifier = @ident", {['@ident'] = identifier, ['@dc'] = discord}) 
        administrator[discord] = resultt[1].adminRank  
        MySQL.Async.fetchAll("SELECT * FROM adminRanks ", {['@ident'] = resultt[1].adminRank}, function(result)
             
            if #result > 0 then
                for i = 1, #result, 1 do 
                    
                    local roles = json.decode(result[i].discordroles )
                    if #roles > 0 then
                        for i = 1, #roles, 1 do  
                            removeDiscordRole(discord, roles[i])
                        end
                    end
                    if result[i].adminRank == administrator[discord] then
                        local roles = json.decode(result[i].discordroles )
                        if #roles > 0 then
                            for i = 1, #roles, 1 do  
                                addDiscordRole(discord, roles[i])
                            end
                        end    
                    end
                end
            end
            
        end)
    end)
end)