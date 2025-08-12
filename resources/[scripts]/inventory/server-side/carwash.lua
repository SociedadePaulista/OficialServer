RegisterServerEvent("magicarrow-carwash-server:watereffect")
AddEventHandler("magicarrow-carwash-server:watereffect", function(coords)
	TriggerClientEvent("magicarrow-carwash:watereffect", -1, coords)
	TriggerClientEvent("magicarrow-carwash:watereffect2", -1, coords)
	TriggerClientEvent("magicarrow-carwash:watereffect3", -1, coords)
	TriggerClientEvent("magicarrow-carwash:watereffect4", -1, coords)
end)

RegisterServerEvent('magicarrow-carwash:moneycontrol')
AddEventHandler('magicarrow-carwash:moneycontrol', function()
    local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        if vRP.PaymentFull(Passport, 20, "car-washed") then
            TriggerClientEvent("magicarrow-carwash:moneyisaccepted", source)
        end
    end
end)