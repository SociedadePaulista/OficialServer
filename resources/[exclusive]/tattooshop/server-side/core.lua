-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("tattooshop", Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Tattoos)
	local Passport = vRP.Passport(source)
    if Passport then
        vRP.Query("playerdata/SetData", { Passport = Passport, dkey = "Tatuagens", dvalue = json.encode(Tattoos) })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckWanted()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not exports["hud"]:Reposed(Passport) then
		return true
	end

	return false
end
function Creative.CheckPerm()
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Admin",1 or 2 or 3) then
		return true
	else
		return
	end
end