local ESX = exports.es_extended:getSharedObject()
Citizen.CreateThread(function()
  for k,v in pairs(Tech.Posizioni) do
   TriggerEvent('gridsystem:registerMarker', {
     name = 'Autolavaggio',
     pos = v,
     scale = vector3(1.5, 1.5, 1.5),
     msg = 'Premi ~INPUT_CONTEXT~ per aprire il menu',
     control = 'E',
     type = 20,
     color = { r = 0, g = 120, b = 0 },
     action = function()
      ApriIlMenu()
     end
   })
  end
end)

ApriIlMenu = function()

  ESX.TriggerServerCallback("loris:checksoldi", function(soldi) 
  

  local ped = PlayerPedId()
  local veicolo = GetVehiclePedIsUsing(ped)

  FreezeEntityPosition(veicolo, true)

  if IsPedSittingInAnyVehicle(ped) then



ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Autolavaggio', {
 title    = 'Autolavaggio',
 align    = 'top-left',
 elements = Tech.Elementi
}, function(data, menu)
  
  if soldi == false then

    ESX.ShowNotification('Non hai abbastanza soldi!')
    
    return end

SetVehicleDirtLevel(
	veicolo, 0)

  FreezeEntityPosition(veicolo, false)

  ESX.ShowNotification('Hai pulito il veicolo!')


end, function(data, menu)
    menu.close()
    FreezeEntityPosition(veicolo, false)
end)
else     ESX.ShowNotification('Devi essere a bordo di un veicolo!')
end
end, Tech.Prezzo)
end

RegisterCommand('sporcaauto', function(source, args, rawCommand)
local ped = PlayerPedId()
local veicolo = GetVehiclePedIsUsing(ped)
  SetVehicleDirtLevel(
  veicolo, 15.0)
end)