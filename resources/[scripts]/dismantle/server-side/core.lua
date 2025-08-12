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
Tunnel.bindInterface("dismantle",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.checkVehicle(Plate)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Vehicle = vRP.PassportPlate(Plate)
		if Vehicle then
			if Vehicle["Passport"] ~= Passport then
				if Vehicle["arrest"] >= os.time() then
					TriggerClientEvent("Notify",source, "vermelho","Veículo encontra-se apreendido na seguradora.")	
				else
					return VehicleMode(Vehicle["vehicle"]) ~= "work"
				end
			end
		else
			TriggerClientEvent("Notify",source, "vermelho","Veículo não encontrado na lista de proprietário.")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.checkPermission(Perm)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasPermission(Passport,Perm,1) then
			return true
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.checkPayment(Plate)
	local source = source
	local Passport = vRP.Passport(source)
	if not Active[Passport] or Active[Passport] <= os.time() then
		Active[Passport] = os.time() + 2
		local Vehicle = vRP.PassportPlate(Plate)
		if Vehicle then
			local Price = VehiclePrice(Vehicle["vehicle"])
			local Valuation = (VehicleMode(Vehicle["vehicle"]) == "Rental" and 20000) or (Price <= 0 and 10000) or parseInt(Price*0.1)
			if Vehicle["Passport"] ~= Passport then
				vRP.Query("vehicles/arrestVehicles",{ Passport = Vehicle["Passport"], vehicle = Vehicle["vehicle"] })
				TriggerClientEvent("garages:Delete",source)
				vRP.GenerateItem(Passport,"dollars2",Valuation,true)
				if math.random(100) >= 75 then
					vRP.GenerateItem(Passport,"plate",1,true)
				end
			end
		end	
	end
end