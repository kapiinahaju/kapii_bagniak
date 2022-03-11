ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('ziolo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('janczesky:bagniak', source)
	xPlayer.removeInventoryItem('ziolo', 1)
end)