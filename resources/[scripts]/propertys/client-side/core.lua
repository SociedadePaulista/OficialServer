-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("propertys",Creative)
vSERVER = Tunnel.getInterface("propertys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
local Nearest = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			local Coords = GetEntityCoords(Ped)
			local Number = parseInt(LocalPlayer["state"].Route-100000)
			if Propertys[Number] then
				SetPlayerBlipPositionThisFrame(Propertys[Number]["Coords"]["x"],Propertys[Number]["Coords"]["y"])
				for Key in pairs(Interiors) do
					for Index in pairs(Interiors[Key]) do
						if #(Coords - Interiors[Key][Index]["Exit"]) <= 0.75 then
							if not Nearest then
								Nearest = { Action = "Exit", Number = Number, Coords = Interiors[Key][Index]["Exit"] }
							end
						else
							if Nearest ~= nil then
								if #(Coords - Nearest.Coords) > 0.75 then
									if Coords["z"] < Nearest.Coords["z"]-1.0 then
										SetEntityCoords(Ped,Nearest.Coords,false,false,false,false)
									else
										Nearest = nil
									end
								end
							end
						end
					end
				end
			else
				for Number,Value in pairs(Propertys) do
					if #(Coords - Value.Coords["xyz"]) <= 0.75 then
						if not Nearest then
							Nearest = { Action = "Enter", Number = Number, Coords = Value.Coords["xyz"] }
						end
					else
						if Nearest ~= nil then
							if #(Coords - Nearest.Coords) > 0.75 then
								Nearest = nil
							end
						end
					end
				end
			end
		end
        Wait(1000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) and Nearest then
			TimeDistance = 1
			if IsControlJustPressed(1,38) then
				TriggerServerEvent("propertys:"..Nearest.Action,Nearest.Number)
			end
		end
        Wait(TimeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Tables = {}
	for Number,Value in pairs(Propertys) do
		local Road = GetStreetNameAtCoord(Value.Coords["x"],Value.Coords["y"],Value.Coords["z"])
		Tables[#Tables + 1] = { Value.Coords["x"],Value.Coords["y"],Value.Coords["z"],0.75,"E",GetStreetNameFromHashKey(Road).." Nº"..Number,"Pressione para acessar" }
	end
	for Key in pairs(Interiors) do
		for Index in pairs(Interiors[Key]) do
			Tables[#Tables + 1] = { Interiors[Key][Index]["Exit"]["x"],Interiors[Key][Index]["Exit"]["y"],Interiors[Key][Index]["Exit"]["z"],0.75,"E","Saída","Pressione para acessar" }
			exports["target"]:AddCircleZone("Clothes:"..Key.."-"..Index,Interiors[Key][Index]["Clothes"],1.0,{
				name = "Clothes:"..Key.."-"..Index,
			},{
				shop = Key..":"..Index,
				Distance = 0.75,
				options = {
					{
						event = "propertys:Clothes",
						label = "Abrir",
						tunnel = "shop",
					}
				}
			})
			for Name,Value in pairs(Interiors[Key][Index]["Chest"]) do
				exports["target"]:AddCircleZone(Name..":"..Key.."-"..Index,Value.Coords["xyz"],1.0,{
					name = Name..":"..Key.."-"..Index,
				},{
					shop = Key..":"..Index,
					Distance = 0.75,
					options = {
						{
							event = "chest:Open",
							label = "Abrir",
							tunnel = "shop",
							service = Name
						}
					}
				})
			end
		end
	end
	TriggerEvent("hoverfy:Insert",Tables)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Robbery")
AddEventHandler("propertys:Robbery",function(Class,Level)
	exports["target"]:RemCircleZone("Clothes:"..Class.."-"..Level)
	for Name,Value in pairs(Interiors[Class][Level]["Chest"]) do
		exports["target"]:RemCircleZone(Name..":"..Class.."-"..Level)
	end
	for Index,Coords in pairs(Interiors[Class][Level]["Robbery"]) do
		exports["target"]:AddCircleZone("Robbery"..Index..":"..Class.."-"..Level,Coords,1.0,{
			name = "Robbery"..Index..":"..Class.."-"..Level,
		},{
			shop = "Robbery"..Index..":"..Class.."-"..Level,
			Distance = 0.75,
			options = {
				{
					event = "chest:Open",
					label = "Roubar",
					tunnel = "shop",
					service = "Robbery"
				}
			}
		})
	end
	local Ped = PlayerPedId()
	local Theft = GetGameTimer() + 10000
	repeat
		if Theft < GetGameTimer() and GetEntitySpeed(Ped) > 2 then
			Theft = GetGameTimer() + 60000
			vSERVER.Police()
		end
		Wait(1000)
	until not Propertys[parseInt(LocalPlayer["state"].Route-100000)]
	exports["target"]:AddCircleZone("Clothes:"..Class.."-"..Level,Interiors[Class][Level]["Clothes"],1.0,{
		name = "Clothes:"..Class.."-"..Level,
	},{
		shop = Class..":"..Level,
		Distance = 0.75,
		options = {
			{
				event = "propertys:Clothes",
				label = "Abrir",
				tunnel = "shop",
			}
		}
	})
	for Name,Value in pairs(Interiors[Class][Level]["Chest"]) do
		exports["target"]:AddCircleZone(Name..":"..Class.."-"..Level,Value.Coords["xyz"],1.0,{
			name = Name..":"..Class.."-"..Level,
		},{
			shop = Class..":"..Level,
			Distance = 0.75,
			options = {
				{
					event = "chest:Open",
					label = "Abrir",
					tunnel = "shop",
					service = Name
				}
			}
		})
	end
	for Name,Value in pairs(Interiors[Class][Level]["Robbery"]) do
		exports["target"]:RemCircleZone("Robbery"..Name..":"..Class.."-"..Level)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPERTYS:BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Blips")
AddEventHandler("propertys:Blips",function()
	if json.encode(Blips) ~= "[]" then
		for _,v in pairs(Blips) do
			if DoesBlipExist(v) then
				RemoveBlip(v)
			end
		end
		Blips = {}
		TriggerEvent("Notify","verde","Marcações desativadas.",10000,"Sucesso")
	else
		for Index,Value in pairs(Propertys) do
			Blips[Index] = AddBlipForCoord(Value.Coords["xyz"])
			SetBlipAsShortRange(Blips[Index],true)
			if GlobalState["Markers"][Index] then
				if GlobalState["Markers"][Index] == LocalPlayer["state"]["Passport"] then
					SetBlipSprite(Blips[Index],40)
					SetBlipColour(Blips[Index],0)
				else
					SetBlipSprite(Blips[Index],374)
					SetBlipColour(Blips[Index],35)
				end
			else
				SetBlipSprite(Blips[Index],374)
				if Value.Price then
					SetBlipColour(Blips[Index],43)
				else
					SetBlipColour(Blips[Index],46)
				end	
			end
			SetBlipScale(Blips[Index],0.6)
		end
		TriggerEvent("Notify","verde","Marcações ativadas.",10000,"Sucesso")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHESMENU
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("propertys:Clothes")
AddEventHandler("propertys:Clothes",function()
	exports["dynamic"]:AddButton("Guardar","Salvar suas vestimentas do corpo.","propertys:Clothes","save",false,true)
	local Clothes = vSERVER.Clothes()
	if parseInt(#Clothes) > 0 then
		exports["dynamic"]:SubMenu("Vestir","Abrir lista com todas as vestimentas.","apply")
		exports["dynamic"]:SubMenu("Remover","Abrir lista com todas as vestimentas.","delete")
		for _,v in pairs(Clothes) do
			exports["dynamic"]:AddButton(v,"Vestir-se com as vestimentas.","propertys:Clothes","apply-"..v,"apply",true)
			exports["dynamic"]:AddButton(v,"Remover a vestimenta salva.","propertys:Clothes","delete-"..v,"delete",true)
		end
	end
	exports["dynamic"]:openMenu()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("propertys:Realty",function()
	local userPropertys = vSERVER.Propertys()
	if userPropertys[1] then
		local Open = false
		for Index in pairs(userPropertys) do
			local Value = Propertys[userPropertys[Index].Number]
			if userPropertys[Index].Interior ~= #Interiors[Value.Interior] then
				local Road = GetStreetNameAtCoord(Value.Coords["x"],Value.Coords["y"],Value.Coords["z"])
				for i = userPropertys[Index].Interior+1,#Interiors[Value.Interior] do
					local v = Interiors[Value.Interior][i]
					exports["dynamic"]:AddButton("Interior - Nível "..i,"Baú: <yellow>"..v["Chest"]["Vault"]["Weight"].."kg</yellow> <green>"..v["Chest"]["Vault"]["Slots"].."slot</green> Geladeira: <yellow>"..v["Chest"]["Fridge"]["Weight"].."kg</yellow> <green>"..v["Chest"]["Fridge"]["Slots"].."slot</green>","propertys:Realty",userPropertys[Index].Number.."-"..i.."-"..GetStreetNameFromHashKey(Road),tostring(userPropertys[Index].Number),true)
				end
				exports["dynamic"]:SubMenu(GetStreetNameFromHashKey(Road).." Nº"..userPropertys[Index].Number,"Informações sobre a propriedade.",tostring(userPropertys[Index].Number))
				Open = true
			end
		end
		if Open then
			exports["dynamic"]:openMenu()
		else
			TriggerEvent("Notify","amarelo","Propriedades já alcançaram o nível máximo",10000,"Aviso")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Locations = {
		{-698.65,271.18,83.1,300.48}
	}
    for Number,v in pairs(Locations) do
        exports["creative"]:AddPed({
			Distance = 25,
			Coords = { v[1],v[2],v[3],v[4] },
			Model = (math.random(2)%2~=0) and "a_m_y_business_0"..math.random(4) or "a_f_y_business_0"..math.random(3),
			anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
		})
		exports["target"]:AddCircleZone("Realty:"..Number,vec3(v[1],v[2],v[3]),0.5,{
            name = "Realty:"..Number,
            heading = 3374176
        },{
            Distance = 1.75,
            options = {
				{
					event = "propertys:Realty",
					label = "Interiores",
					tunnel = "client"
				}
            }
        })
    end
end)