local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("nation_skinshop")
vRPC = Tunnel.getInterface("vRP")
func = {}
Tunnel.bindInterface("nation_skinshop", func)


---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PERMISSÃO--------------------------
---------------------------------------------------------------------------


function func.checkPermission(permission)
    local source = source
    local user_id = vRP.Passport(source)
    if type(permission) == "table" then
        for i, perm in pairs(permission) do
            if vRP.HasGroup(user_id, perm) then
                return true
            end
        end
        return false
    end
    return vRP.HasGroup(user_id, permission)
end



---------------------------------------------------------------------------
-----------------------VERIFICAÇÃO DE PAGAMENTO--------------------------
---------------------------------------------------------------------------


--[[ function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.getUserId(source)
    if value >= 0 then
        return vRP.tryPayment(user_id, value)
    end
    return false
end ]]


function func.updateClothes(spawn)
    local source = source
    local user_id = vRP.Passport(source)
    local clothes = fclient.getCloths(source)
    vRP.Query("playerdata/SetData",{ Passport = user_id, dkey = "Clothings", dvalue = json.encode(clothes) })
    if spawn then
        vRP.Query("playerdata/SetData", { Passport = user_id, dkey = "Creator", dvalue = json.encode(1) })
		TriggerEvent("vRP:BucketServer", source, "Exit")
		TriggerClientEvent("sounds:Private",source,"shop",1.0)
		Wait(1000)
		local Bags = { "prop_luggage_01a", "prop_luggage_02a", "prop_luggage_03a", "prop_luggage_04a", "prop_luggage_05a", "prop_luggage_06a", "prop_luggage_07a", "prop_luggage_08a", "prop_big_bag_01", "xm_prop_x17_bag_01d" }
		vRPC.createObjects(source,"move_weapon@jerrycan@generic","idle",Bags[math.random(#Bags)],50,57005,0.425,0.0,0.025, 0, 260.0,  60.0)
    end
    -- vRP.setUData(user_id,"Clothings",json.encode(clothes))
end


--------- CREATIVE V3 ------------


function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.Passport(source)
    if value >= 0 then
        if vRP.PaymentFull(user_id, value, "Skinshop") or value == 0 then
            local clothes = fclient.getCloths(source)
            vRP.Query("playerdata/SetData",{ Passport = user_id, dkey = "Clothings", dvalue = json.encode(clothes) })
            return true
        end
    end
    return false
end






















--------- NYO GUARDA ROUPAS ------------


--[[ 
 local clothParts = {
	["legs"] = 4,
	["torsos"] = 3,
	["undershirts"] = 8,
	["tops"] = 11,
	["bodyArmors"] = 9,
	["bags"] = 5,
	["shoes"] = 6,
	["masks"] = 1,
	["hats"] = "p0",
	["glasses"] = "p1",
	["ears"] = "p2",
	["watches"] = "p7",
	["bracelets"] = "p7",
	["accessories"] = 7,
	["decals"] = 10
}




function func.tryPayClothes(value)
    local source = source
    local user_id = vRP.getUserId(source)
    if value >= 0 then
        if vRP.tryPayment(user_id, value) then
            local parts = fclient.getCloths(source) or {}
            local dataParts = vRP.getUData(user_id, "nyo:GuardaRoupa")
            local playerParts = {}
            if dataParts then 
                playerParts = json.decode(dataParts) or {}
            end
            for _, comp in pairs(clothParts) do
                if parts[comp] and parts[comp][1] >= 0 then
                    local drawable = tostring(parts[comp][1])
                    local c = tostring(comp)
                    if playerParts[c] then
                        playerParts[c][drawable] = true
                    else
                        playerParts[c] = { [drawable] = true}
                    end
                end
            end

           vRP.setUData(user_id,"nyo:GuardaRoupa",json.encode(playerParts)) 
           return true
        end
    end
    return false
end ]]


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