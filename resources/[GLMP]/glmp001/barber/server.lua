ESX.RegisterServerCallback("barber:barberShopBuy", function(source, cb, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getAccount("money").money >= price then
      xPlayer.removeAccountMoney('money', price)
      cb(true)
    else
      cb(false)
    end
  end) 