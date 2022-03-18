
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("lucky_rasenjob:45345340fsdf132")
AddEventHandler("lucky_rasenjob:45345340fsdf132", function(GFDGFDGDF23423)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if GFDGFDGDF23423 < 0 then
	-- ban player or log it
	------print('~g~Lucky_RasenJob: ' .. xPlayer.identifier .. ' versucht die variable zu compilen!')
	return
    end

    if GFDGFDGDF23423 > 10000 then
        ------print('~g~Lucky_RasenJob: ' .. xPlayer.identifier .. ' versucht die variable zu compilen!')
	return		 
    end
		 
    xPlayer.addMoney(GFDGFDGDF23423 * 7) 
    TriggerEvent('byte:sendLog', 'rasen_verkauf', 'Rasen verkauft', 'Der Spieler '.. xPlayer.getName().. ' verkauft '.. GFDGFDGDF23423 .. ' Rasen für '.. GFDGFDGDF23423 * 7 ..'$')
end)
