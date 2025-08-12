-----------------------------------------------------------------------------------------------------------------------------------------
-- DROPS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Drops(Slot,Item,Amount)
	local source = source
	local Passport = vRP.Passport(source)
	local Route = GetPlayerRoutingBucket(source)
	if Passport and not Active[Passport] and not Player(source)["state"]["Handcuff"] and not vRP.InsideVehicle(source) then
		Active[Passport] = true

		Player(source)["state"]["Buttons"] = true
		Player(source)["state"]["Cancel"] = true

		if not itemBlock(Item) and vRP.DropInventory(Passport, Route, Amount, Slot) ~= Amount then
			vRPC.playAnim(source,false,{"pickup_object","pickup_low"},true)
			TriggerClientEvent("inventory:Update",source,"Backpack")
			SetTimeout(1000,function()
				vRPC.removeObjects(source)
			end)
		end

		Player(source)["state"]["Buttons"] = false
		Player(source)["state"]["Cancel"] = false

		Active[Passport] = nil
	else
		TriggerClientEvent("inventory:Update",source,"Backpack")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PICKUP
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Pickup(Route,Slot,Target,Amount)
	local source = source
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and not Player(source)["state"]["Handcuff"] and not vRP.InsideVehicle(source) then
		Active[Passport] = true

		Player(source)["state"]["Buttons"] = true
		Player(source)["state"]["Cancel"] = true

		if vRP.PickupInventory(Passport, Route, Amount, Slot, Target) ~= Amount then
			vRPC.playAnim(source,false,{"pickup_object","pickup_low"},true)
			TriggerClientEvent("inventory:Update",source,"Backpack")
			SetTimeout(1000,function()
				vRPC.removeObjects(source)
			end)
		end

		Player(source)["state"]["Buttons"] = false
		Player(source)["state"]["Cancel"] = false

		Active[Passport] = nil
	else
		TriggerClientEvent("inventory:Update",source,"Backpack")
	end
end