ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)





news = {} 
RegisterServerEvent('requestNewsUpdate')
AddEventHandler('requestNewsUpdate', function()
    newsupdate = true
    news = {}
end)
 
newsupdate = true
ESX.RegisterServerCallback('requestNews', function( source, cb )
    if newsupdate == true then
        MySQL.Async.fetchAll("SELECT * FROM weazlenews", {['@ident'] = cat}, function(result)
            
            ld = 0 
            for i = 1, #result, 1 do
                ld = ld + 1 
                
                table.insert(news, {id = result[i].id, title = result[i].title, content = result[i].content})
            end  
            
            ------print("loaded ".. ld .. ' news ')
    
            Wait(100)
            cb(news) 
        end)
        newsupdate = false
    else
        cb(news)
    end
     
end)

RegisterServerEvent('addWeazleNews')
AddEventHandler('addWeazleNews', function( content, type )
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    wtype = "0$%%$"
    if type == "Event" then
        wtype = "1$%%$" 
    elseif type == "Bericht" then
        wtype = "2$%%$"
    end
    MySQL.Async.fetchScalar("INSERT INTO `weazlenews` (`id`, `title`, `content`, `sender`) VALUES (NULL, @type, @content, @sender);", {['@type'] = wtype, ['@content'] = content, ['@sender'] = xPlayer.getIdentifier()})
    newsupdate = true 
    news = {}
    TriggerClientEvent('glmp_notify', -1, 'yellow', 'Weazle News', 'Eine neue Anzeige ist verfügbar! Checke die App!')
end)