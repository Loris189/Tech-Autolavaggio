local ESX = exports.es_extended:getSharedObject()

ESX.RegisterServerCallback("loris:checksoldi", function(source, cb, prezzo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local soldi = xPlayer.getAccount('money').money

if soldi >= prezzo then 

    xPlayer.removeMoney(prezzo)

    cb(true)

else cb(false)

end
end)