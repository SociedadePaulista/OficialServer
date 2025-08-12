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
Tunnel.bindInterface("doors",Creative)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Doors"] = {
	-- Policia Civil
	["1"] = { Coords = vec3(427.19,-991.2,29.34), Hash = 1525532175, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp", Other = "2" },
	["2"] = { Coords = vec3(427.21,-992.91,29.35), Hash = 1525532175, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp", Other = "1" },
	["3"] = { Coords = vec3(436.78,-982.23,29.52), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["4"] = { Coords = vec3(433.21,-1007.86,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["5"] = { Coords = vec3(433.18,-1005.23,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["6"] = { Coords = vec3(433.06,-1002.59,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["7"] = { Coords = vec3(433.02,-999.87,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["8"] = { Coords = vec3(432.95,-994.58,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["10"] = { Coords = vec3(431.1,-1007.77,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["11"] = { Coords = vec3(431.11,-1005.08,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["12"] = { Coords = vec3(431.24,-1002.43,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["13"] = { Coords = vec3(431.17,-999.7,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["14"] = { Coords = vec3(431.29,-997.02,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	["15"] = { Coords = vec3(431.28,-994.25,29.52), Hash = 631614199, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pcesp" },
	-- Policia Militar
	["15"] = { Coords = vec3(565.56,13.18,69.35), Hash = 1070054098, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "16" },
	["16"] = { Coords = vec3(566.91,12.72,69.35), Hash = -1103852343, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "15" },
	["17"] = { Coords = vec3(621.84,7.94,82.75), Hash = 1070054098, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "18" },
	["18"] = { Coords = vec3(620.8,8.5,82.75), Hash = -1103852343, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "17" },
	["19"] = { Coords = vec3(605.27,11.42,82.75), Hash = 1070054098, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "20" },
	["20"] = { Coords = vec3(604.26,11.7,82.75), Hash = -1103852343, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "19" },
	["21"] = { Coords = vec3(552.7,33.31,69.35), Hash = 1070054098, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "22" },
	["22"] = { Coords = vec3(554.02,32.83,69.35), Hash = -1103852343, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "21" },
	["23"] = { Coords = vec3(536.38,32.83,69.51), Hash = 243539984, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "24" },
	["24"] = { Coords = vec3(537.34,31.64,69.51), Hash = 243539984, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp", Other = "23" },
	["25"] = { Coords = vec3(567.29,22.71,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["26"] = { Coords = vec3(563.25,23.89,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["27"] = { Coords = vec3(559.39,25.43,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["28"] = { Coords = vec3(561.35,33.68,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["29"] = { Coords = vec3(565.31,32.27,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["30"] = { Coords = vec3(569.12,30.88,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["31"] = { Coords = vec3(573.08,32.15,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["32"] = { Coords = vec3(568.91,33.63,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["33"] = { Coords = vec3(565.07,35.32,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	["34"] = { Coords = vec3(561.26,36.44,69.35), Hash = -413682504, Disabled = false, Lock = true, Distance = 1.75, Perm = "Pmesp" },
	-- Batalhão Rota
	["35"] = { Coords = vec3(332.11,-1571.39,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["36"] = { Coords = vec3(336.61,-1575.15,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["37"] = { Coords = vec3(382.44,-1613.48,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["38"] = { Coords = vec3(386.96,-1617.11,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["39"] = { Coords = vec3(386.71,-1623.45,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["40"] = { Coords = vec3(325.72,-1572.8,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["41"] = { Coords = vec3(345.01,-1582.45,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["42"] = { Coords = vec3(340.84,-1578.92,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	["43"] = { Coords = vec3(378.23,-1609.66,29.57), Hash = -2051651622, Disabled = false, Lock = true, Distance = 1.75, Perm = "1BPChq" },
	-- Batalhão Anchieta
	["44"] = { Coords = vec3(-604.95,-2355.25,16.07), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "2BPChq" },
	["45"] = { Coords = vec3(-609.53,-2351.45,16.07), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "2BPChq" },
	["46"] = { Coords = vec3(-577.38,-2346.29,16.07), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "2BPChq" },
	["47"] = { Coords = vec3(-583.52,-2327.78,16.07), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "2BPChq" },
	["48"] = { Coords = vec3(-589.54,-2322.46,16.07), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "2BPChq" },
	["49"] = { Coords = vec3(-595.5,-2317.10,16.07), Hash = 1162041580, Disabled = false, Lock = true, Distance = 1.75, Perm = "2BPChq" },


	--[[ ["51"] = { Coords = vec3(82.16,275.29,110.21), Hash = -1922281023, Disabled = false, Lock = true, Distance = 1.75, Perm = "McDonalds", Other = "38" }, ]]
	--[[ ["52"] = { Coords = vec3(81.04,275.73,110.21), Hash = -1922281023, Disabled = false, Lock = true, Distance = 1.75, Perm = "McDonalds", Other = "37" }, ]]
	--[[ ["53"] = { Coords = vec3(79.76,288.14,110.20), Hash = 2010236044, Disabled = false, Lock = true, Distance = 1.75, Perm = "McDonalds", Other = "40" }, ]]
	--[[ ["54"] = { Coords = vec3(80.27,289.53,110.20), Hash = 1465287574, Disabled = false, Lock = true, Distance = 1.75, Perm = "McDonalds", Other = "39" }, ]]
	
	
	["999"] = { Coords = vec3(251.85,221.06,101.83), Hash = -1508355822, Disabled = true, Lock = true, Distance = 1.75, Perm = "Admin" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Number)
	local source = source
	local Passport = vRP.Passport(source)
	local Doors = GlobalState["Doors"]
	if Passport and Doors[Number] and Doors[Number]["Perm"] then
		if (SplitTwo(Doors[Number]["Perm"]) and vRP.HasPermission(Passport,SplitOne(Doors[Number]["Perm"]),parseInt(SplitTwo(Doors[Number]["Perm"]))) and vRP.HasService(Passport,SplitOne(Doors[Number]["Perm"]))) or (vRP.HasPermission(Passport,Doors[Number]["Perm"]) or vRP.HasService(Passport,Doors[Number]["Perm"])) then
			Doors[Number]["Lock"] = not Doors[Number]["Lock"]
			if Doors[Number]["Other"] then
				local Second = Doors[Number]["Other"]
				Doors[Second]["Lock"] = not Doors[Second]["Lock"]
			end
			GlobalState:set("Doors",Doors,true)
			vRPC.playAnim(source,true,Doors[Number]["Other"] and {"veh@mower@base","start_engine"} or {"anim@heists@keycard@","exit"},false)
			if Doors[Number]["Lock"] then
				TriggerClientEvent("sounds:Private",source,"houses_door_lock",0.5)
			else
				TriggerClientEvent("sounds:Private",source,"houses_door_unlock",0.5)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROXIMITY
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Proximity",function(Coords)
	for Index,Value in pairs(GlobalState["Doors"]) do
		if not Value["Disabled"] and Value["Lock"] then
			if #(Coords - Value["Coords"]) <= Value["Distance"] then
				return Index
			end
		end
	end
	return false
end)