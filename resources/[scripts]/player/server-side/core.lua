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
Tunnel.bindInterface("player",Creative)
vCLIENT = Tunnel.getInterface("player")
vTASKBAR = Tunnel.getInterface("taskbar")
vSKINSHOP = Tunnel.getInterface("nation_skinshop")
vKEYBOARD = Tunnel.getInterface("keyboard")
vKEYBOARD = Tunnel.getInterface("keyboard")
vPOLICE = Tunnel.getInterface("police")
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("skin",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and Message[2] then
		if vRP.HasGroup(Passport,"Admin", 1 or 2 or 3 or 4 or 5)  then
			local ClosestPed = vRP.Source(Message[1])
			if ClosestPed then
				vRPC.Skin(ClosestPed,Message[2])
				vRP.SkinCharacter(parseInt(Message[1]),Message[2])
				TriggerEvent("Discord","Admin","**skin**\n\n**Passaporte:** "..Passport.."\n**Para:** "..Message[1].."\n**Skin:** "..Message[2],3553599)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kill",function(source,Message,History)
	local source = source
	local Passport = vRP.Passport(source)
	if vRP.HasGroup(Passport,"Admin",1 or 2 or 3) then
		if Passport and Message[1] then
			
			vRP.Revive(Message[1],0)
		else
			vRP.Revive(Passport,0)
		end
	end
end)
------------------------------------------------------------------------------------------------------------------------
--------[ COMANDO /FPS ON & OFF ]---------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fps",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport then
		if Message[1] == "on" or Message[1] == "ON" then 
			SetTimecycleModifier("cinema")
			TriggerEvent("Notify","sucesso","Boost de fps  LIGADO! ", 5000)
		elseif Message[1] == "off" or Message[1] == "OFF" then
			SetTimecycleModifier("default")
			TriggerEvent("Notify","sucesso","Boost de fps  LIGADO! ", 5000)
			TriggerEvent("Notify","sucesso","Boost de fps  DESLIGADO! ", 5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DUITEXTURES
-----------------------------------------------------------------------------------------------------------------------------------------
local DuiTextures = {
	["MRPD"] = {
		["Distance"] = 1.50,
		["Dimension"] = 1.25,
		["Label"] = "Quadro Branco",
		["Coords"] = vec3(439.47,-985.85,35.99),
		["Link"] = "https://creative-rp.com/Quadro.png",
		["Dict"] = "prop_planning_b1",
		["Texture"] = "prop_base_white_01b",
		["Width"] = 550,
		["Weight"] = 450
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:TEXTURE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Texture")
AddEventHandler("player:Texture",function(Name)
	local source = source
	local Keyboard = vKEYBOARD.Primary(source,"Link:")
	if Keyboard then
		DuiTextures[Name]["Link"] = Keyboard[1]
		TriggerClientEvent("player:DuiUpdate",-1,Name,DuiTextures[Name])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Stress")
AddEventHandler("player:Stress",function(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.DowngradeStress(Passport,Number)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("me",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] then
		local message = string.sub(History:sub(4),1,100)

		local Players = vRPC.Players(source)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("showme:pressMe",v,source,message,10)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- E
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if Message[2] == "friend" then
			local ClosestPed = vRPC.ClosestPed(source,2)
			if ClosestPed then
				if vRP.GetHealth(ClosestPed) > 100 and not Player(ClosestPed)["state"]["Handcuff"] then
					local Identity = vRP.Identity(Passport)
					if vRP.Request(ClosestPed,"Pergunta","Pedido de <b>"..Identity["name"].."</b> da animação <b>"..Message[1].."</b>?","Sim, iniciar animação","Não, sai fora") then
						TriggerClientEvent("emotes",ClosestPed,Message[1])
						TriggerClientEvent("emotes",source,Message[1])
					end
				end
			end
		else
			TriggerClientEvent("emotes",source,Message[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- E2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e2",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if vRP.HasService(Passport,"Hospital") then
				TriggerClientEvent("emotes",ClosestPed,Message[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- E3
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e3",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport and vRP.GetHealth(source) > 100 then
		if vRP.HasGroup(Passport,"Admin",2) then
			local Players = vRPC.ClosestPeds(source,50)
			for _,v in pairs(Players) do
				async(function()
					TriggerClientEvent("emotes",v,Message[1])
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Doors")
AddEventHandler("player:Doors",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Vehicle,Network = vRPC.VehicleList(source,5)
		if Vehicle then
			local Players = vRPC.Players(source)
			for _,v in pairs(Players) do
				async(function()
					TriggerClientEvent("player:syncDoors",v,Network,Number)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:TRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:TrunkDoor")
AddEventHandler("player:TrunkDoor",function(Network,Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Players = vRPC.Players(source)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("player:syncTrunkDoor",v,Network,Mode)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 911
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("911",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Policia") then
			local Identity = vRP.Identity(Passport)
			local Service = vRP.NumPermission("Policia")
			for Passports,Sources in pairs(Service) do
				async(function()
					TriggerClientEvent("chat:ClientMessage",Sources,Identity["name"],History:sub(4))
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 112
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("112",function(source,Message,History)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and vRP.GetHealth(source) > 100 then
		if vRP.HasService(Passport,"Hospital") then
			local Identity = vRP.Identity(Passport)
			local Service = vRP.NumPermission("Hospital")
			for Passports,Sources in pairs(Service) do
				async(function()
					TriggerClientEvent("Datatable",Sources,Identity["name"].." "..Identity["name2"],History:sub(4))
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOTSFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.shotsFired(Vehicle)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Vehicle then
			Vehicle = "Disparos de um veículo"
		else
			Vehicle = "Disparos com arma de fogo"
		end
		if vRP.HasGroup(Passport,"Admin",1 or 2 or 3 or 4 or 5 ) then
			return
		end	
		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		local a,Service = vRP.NumPermission("Policia")
		for Passports,Sources in pairs(a) do
			if vRP.HasService(Passports or Sources,"Policia") then
				async(function()
					TriggerClientEvent("NotifyPush",Sources,{ code = 10, title = Vehicle, x = Coords["x"], y = Coords["y"], z = Coords["z"], blipColor = 6 })
				end)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CARRYPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
local playerCarry = {}
RegisterServerEvent("player:carryPlayer")
AddEventHandler("player:carryPlayer",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not vRP.InsideVehicle(source) then
			if playerCarry[Passport] then
				TriggerClientEvent("player:playerCarry",playerCarry[Passport],source)
				TriggerClientEvent("player:Commands",playerCarry[Passport],false)
				playerCarry[Passport] = nil
			else
				local ClosestPed = vRPC.ClosestPed(source,2)
				if ClosestPed then
					playerCarry[Passport] = ClosestPed
					TriggerClientEvent("player:playerCarry",playerCarry[Passport],source)
					TriggerClientEvent("player:Commands",playerCarry[Passport],true)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:WINSFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:winsFunctions")
AddEventHandler("player:winsFunctions",function(Mode)
	local source = source
	local vehicle,Network = vRPC.VehicleList(source,10)
	if vehicle then
		TriggerClientEvent("player:syncWins",source,Network,Mode)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CVFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:cvFunctions")
AddEventHandler("player:cvFunctions",function(Mode)
	local Distance = 1
	local source = source

	if Mode == "rv" then
		Distance = 10
	end

	local ClosestPed = vRPC.ClosestPed(source,Distance)
	if ClosestPed then
		local Passport = vRP.Passport(source)
		local Consult = vRP.InventoryItemAmount(Passport,"rope")
		if vRP.GetUserType(Passport,"Policia") or Consult[1] >= 1 then
			local Vehicle,Network = vRPC.VehicleList(source,5)
			if Vehicle then
				local Networked = NetworkGetEntityFromNetworkId(Network)
				local Door = GetVehicleDoorLockStatus(Networked)
				if parseInt(Door) <= 1 then
					if Mode == "rv" then
						vCLIENT.removeVehicle(ClosestPed)
					elseif Mode == "cv" then
						vCLIENT.putVehicle(ClosestPed,Network)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:checkTrunk")
AddEventHandler("player:checkTrunk",function()
	local source = source
	local ClosestPed = vRPC.ClosestPed(source,2)
	if ClosestPed then
		TriggerClientEvent("player:checkTrunk",ClosestPed)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKTRASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:checkTrash")
AddEventHandler("player:checkTrash",function()
	local source = source
	local ClosestPed = vRPC.ClosestPed(source,2)
	if ClosestPed then
		TriggerClientEvent("player:checkTrash",ClosestPed)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKSHOES
-----------------------------------------------------------------------------------------------------------------------------------------
local UniqueShoes = {}
-- RegisterServerEvent("player:checkShoes")
-- AddEventHandler("player:checkShoes",function(Entity)
-- 	local source = source
-- 	local Passport = vRP.Passport(source)
-- 	if Passport then
-- 		if not UniqueShoes[Entity] then
-- 			UniqueShoes[Entity] = os.time()
-- 		end

-- 		if os.time() >= UniqueShoes[Entity] then
-- 			if vSKINSHOP.checkShoes(Entity) then
-- 				vRP.GenerateItem(Passport,"WEAPON_SHOES",2,true)
-- 				UniqueShoes[Entity] = os.time() + 300
-- 			end
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT - REMOVER
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVIT
-----------------------------------------------------------------------------------------------------------------------------------------
local Removit = {
	["mp_m_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	},
	["mp_f_freemode_01"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:OUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Outfit")
AddEventHandler("player:Outfit",function(Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not exports["hud"]:Reposed(Passport) and not exports["hud"]:Wanted(Passport) then
		if Mode == "aplicar" then
			local Result = vRP.GetSrvData("Outfit:"..Passport,true)
			if Result["pants"] then
				TriggerClientEvent("skinshop:Apply",source,Result)
				TriggerClientEvent("Notify",source,"verde","Roupas aplicadas.","Sucesso",5000)
			else
				TriggerClientEvent("Notify",source,"amarelo","Roupas não encontradas.","Aviso",5000)
			end
		elseif Mode == "salvar" then
			local Custom = vSKINSHOP.getCloths(source)
			if Custom then
				vRP.SetSrvData("Outfit:"..Passport,Custom,true)
				TriggerClientEvent("Notify",source,"verde","Roupas salvas.","Sucesso",5000)
			end
		elseif Mode == "aplicarpre" then
			local Result = vRP.GetSrvData("Premiumfit:"..Passport,true)
			if Result["pants"] then
				TriggerClientEvent("skinshop:Apply",source,Result)
				TriggerClientEvent("Notify",source,"verde","Roupas aplicadas.","Sucesso",5000)
			else
				TriggerClientEvent("Notify",source,"amarelo","Roupas não encontradas.","Aviso",5000)
			end
		elseif Mode == "salvarpre" then
			local Custom = vSKINSHOP.getCloths(source)
			if Custom then
				vRP.SetSrvData("Premiumfit:"..Passport,Custom,true)
				TriggerClientEvent("Notify",source,"verde","Roupas salvas.","Sucesso",5000)
			end
		elseif Mode == "remover" then
			local Model = vRP.ModelPlayer(source)
			if Removit[Model] then
				TriggerClientEvent("skinshop:Apply",source,Removit[Model])
			end
		else
			TriggerClientEvent("skinshop:set"..Mode,source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEATH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:Death")
AddEventHandler("player:Death",function(nsource)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and source ~= nsource then
		local OtherPassport = vRP.Passport(nsource)
		if OtherPassport then
			if GetPlayerRoutingBucket(source) < 900000 then
				TriggerEvent("Discord","Deaths","**Matou:** "..Passport.."\n**Morreu:** "..OtherPassport,3092790)
			else
				local Name = "Individuo Indigente"
				local Name2 = "Individuo Indigente"
				local Identity = vRP.Identity(Passport)
				local nIdentity = vRP.Identity(OtherPassport)

				if Identity and nIdentity then
					Name = Identity["name"].." "..Identity["name2"]
					Name2 = nIdentity["name"].." "..nIdentity["name2"]
					TriggerClientEvent("Notify",source,"amarelo","<b>"..Name.."</b> matou <b>"..Name2.."</b>",10000)
					TriggerClientEvent("Notify",nsource,"amarelo","<b>"..Name.."</b> matou <b>"..Name2.."</b>",10000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BIKEPACK
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Bikepack()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local amountWeight = 10
		local myWeight = vRP.GetWeight(Passport)

		if parseInt(myWeight) < 45 then
			amountWeight = 15
		elseif parseInt(myWeight) >= 45 and parseInt(myWeight) <= 79 then
			amountWeight = 10
		elseif parseInt(myWeight) >= 80 and parseInt(myWeight) <= 95 then
			amountWeight = 5
		elseif parseInt(myWeight) >= 100 and parseInt(myWeight) <= 148 then
			amountWeight = 2
		elseif parseInt(myWeight) >= 150 then
			amountWeight = 1
		end

		vRP.SetWeight(Passport,amountWeight)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("player:DuiTable",source,DuiTextures)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if playerCarry[Passport] then
		TriggerClientEvent("player:Commands",playerCarry[Passport],false)
		playerCarry[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCCLEAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)