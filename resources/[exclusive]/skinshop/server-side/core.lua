-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("skinshop",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetFine(Passport) > 0 then
			TriggerClientEvent("Notify",source,"amarelo","Você possui multas pendentes.",10000)
			return false
		end

		if exports["hud"]:Wanted(Passport,source) and exports["hud"]:Reposed(Passport) then
			return false
		end
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckPerm()
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Admin",1 or 2 or 3) then
		return true
	else
		return
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Clothes,Spawn)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Clothings", dvalue = json.encode(Clothes) })
		if Spawn then
			vRP.Query("playerdata/SetData", { Passport = Passport, dkey = "Creator", dvalue = json.encode(1) })
			TriggerEvent("vRP:BucketServer", source, "Exit")
			TriggerClientEvent("sounds:Private",source,"shop",1.0)
			Wait(1000)
			local Bags = { "prop_luggage_01a", "prop_luggage_02a", "prop_luggage_03a", "prop_luggage_04a", "prop_luggage_05a", "prop_luggage_06a", "prop_luggage_07a", "prop_luggage_08a", "prop_big_bag_01", "xm_prop_x17_bag_01d" }
			vRPC.createObjects(source,"move_weapon@jerrycan@generic","idle",Bags[math.random(#Bags)],50,57005,0.425,0.0,0.025, 0, 260.0,  60.0)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("skinshop:Remove")
AddEventHandler("skinshop:Remove",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if vRP.HasService(Passport,"Police") then
				TriggerClientEvent("skinshop:set"..Mode,ClosestPed)
			end
		end
	end
end)