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
Tunnel.bindInterface("tractor",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
Buffs = {
	["Dexterity"] = {}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Payment()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Experience = vRP.GetExperience(Passport,"Tractor")
		local Level = ClassCategory(Experience)
		local Valuation = 800

		if Level == 2 or Level == 3 or Level == 5 then
			Valuation = Valuation + 10
		elseif Level == 6 or Level == 7 or Level == 8 then
			Valuation = Valuation + 15
		elseif Level == 9 or Level == 10 then
			Valuation = Valuation + 20
		end

		if Buffs["Dexterity"][Passport] then
			if Buffs["Dexterity"][Passport] > os.time() then
				Valuation = Valuation + (Valuation * 0.1)
			end
		end

		vRP.PutExperience(Passport,"Taxi",1)
		vRP.GenerateItem(Passport,"dollars",Valuation,true)
		TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",Valuation)
	end
end