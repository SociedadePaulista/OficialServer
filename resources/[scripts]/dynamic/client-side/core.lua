-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("dynamic")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local menuOpen = false
local animalHash = nil
local spawnAnimal = false
local animalFollow = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddButton",function(title,description,trigger,par,id,server)
	SendNUIMessage({ addbutton = true, title = title, description = description, trigger = trigger, par = par, id = id, server = server })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUBMENU
-----------------------------------------------------------------------------------------------------------------------------------------
exports("SubMenu",function(title,description,id)
	SendNUIMessage({ addmenu = true, title = title, description = description, menuid = id })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENMENU
-----------------------------------------------------------------------------------------------------------------------------------------
exports("openMenu",function()
	SendNUIMessage({ show = true })
	SetNuiFocus(true,true)
	menuOpen = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLICKED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("clicked",function(Data,Callback)
	if Data["trigger"] and Data["trigger"] ~= "" then
		if Data["server"] == "true" then
			TriggerServerEvent(Data["trigger"],Data["param"])
		else
			TriggerEvent(Data["trigger"],Data["param"])
		end
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SetNuiFocus(false,false)
	menuOpen = false
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:closeSystem")
AddEventHandler("dynamic:closeSystem",function()
	if menuOpen then
		SendNUIMessage({ close = true })
		SetNuiFocus(false,false)
		menuOpen = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("globalFunctions",function()
	if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not menuOpen and LocalPlayer["state"]["Route"] < 900000 and not IsPauseMenuActive() then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		if GetEntityHealth(Ped) > 100 then

			if animalHash ~= nil then
				exports["dynamic"]:AddButton("Seguir","Seguir o proprietário.","dynamic:animalFunctions","seguir","animal",false)
				exports["dynamic"]:AddButton("Colocar no Veículo","Colocar o animal no veículo.","dynamic:animalFunctions","colocar","animal",false)
				exports["dynamic"]:AddButton("Remover do Veículo","Remover o animal no veículo.","dynamic:animalFunctions","remover","animal",false)
			end
			
			if LocalPlayer["state"]["Premium"] then
				exports["dynamic"]:AddButton("Vestir Premium","Vestir-se com as vestimentas guardadas.","player:Outfit","aplicarpre","wardrobe",true)
				exports["dynamic"]:AddButton("Guardar Premium","Salvar suas vestimentas do corpo.","player:Outfit","salvarpre","wardrobe",true)
			end

			exports["dynamic"]:AddButton("Chapéu","Colocar/Retirar o chapéu.","player:Outfit","Hat","clothes",true)
			exports["dynamic"]:AddButton("Máscara","Colocar/Retirar a máscara.","player:Outfit","Mask","clothes",true)
			exports["dynamic"]:AddButton("Óculos","Colocar/Retirar o óculos.","player:Outfit","Glasses","clothes",true)
			exports["dynamic"]:AddButton("Vestir","Vestir-se com as vestimentas guardadas.","player:Outfit","aplicar","clothes",true)
			exports["dynamic"]:AddButton("Guardar","Salvar suas vestimentas do corpo.","player:Outfit","salvar","clothes",true)
			exports["dynamic"]:AddButton("Remover","Remover suas vestimentas do corpo.","player:Outfit","remover","clothes",true)
					
			exports["dynamic"]:AddButton("Propriedades","Marcar/Desmarcar propriedades no mapa.","propertys:Blips","","others",false)
			exports["dynamic"]:AddButton("Ferimentos","Verificar ferimentos no corpo.","paramedic:Injuries","","others",false)
			exports["dynamic"]:AddButton("Desbugar","Recarregar o personagem.","barbershop:Debug","","others",true)

			local Vehicle = vRP.ClosestVehicle(7)
			if IsEntityAVehicle(Vehicle) then
				if not IsPedInAnyVehicle(Ped) then
					exports["dynamic"]:AddButton("Remover do Veículo","Remover do veículo mais próximo.","player:cvFunctions","rv","player",true)
				else
					exports["dynamic"]:AddButton("Sentar no Motorista","Sentar no banco do motorista.","player:seatPlayer","0","vehicle",false)
					exports["dynamic"]:AddButton("Sentar no Passageiro","Sentar no banco do passageiro.","player:seatPlayer","1","vehicle",false)
					exports["dynamic"]:AddButton("Sentar em Outros","Sentar no banco do passageiro.","player:seatPlayer","2","vehicle",false)
					exports["dynamic"]:AddButton("Levantar Vidros","Levantar os vidros.","player:winsFunctions","1","vehicle",true)
					exports["dynamic"]:AddButton("Abaixar Vidros","Abaixar os vidros.","player:winsFunctions","0","vehicle",true)
					exports["dynamic"]:SubMenu("Veículo","Funções do veículo.","vehicle")
				end

				exports["dynamic"]:AddButton("Porta do Motorista","Abrir porta do motorista.","player:Doors","1","doors",true)
				exports["dynamic"]:AddButton("Porta do Passageiro","Abrir porta do passageiro.","player:Doors","2","doors",true)
				exports["dynamic"]:AddButton("Porta Traseira Esquerda","Abrir porta traseira esquerda.","player:Doors","3","doors",true)
				exports["dynamic"]:AddButton("Porta Traseira Direita","Abrir porta traseira direita.","player:Doors","4","doors",true)
				exports["dynamic"]:AddButton("Porta-Malas","Abrir porta-malas.","player:Doors","5","doors",true)
				exports["dynamic"]:AddButton("Capô","Abrir capô.","player:Doors","6","doors",true)
				exports["dynamic"]:SubMenu("Portas","Portas do veículo.","doors")
			end

			if vRP.ClosestPed(3) then
				exports["dynamic"]:AddButton("Carregar","Carregar a pessoa mais próxima.","player:carryPlayer","","player",true)
				exports["dynamic"]:AddButton("Colocar no Veículo","Colocar no veículo mais próximo.","player:cvFunctions","cv","player",true)
				exports["dynamic"]:AddButton("Remover Chapéu","Remover da pessoa mais próxima.","skinshop:Remove","Hat","player",true)
				exports["dynamic"]:AddButton("Remover Máscara","Remover da pessoa mais próxima.","skinshop:Remove","Mask","player",true)
				exports["dynamic"]:AddButton("Remover Óculos","Remover da pessoa mais próxima.","skinshop:Remove","Glasses","player",true)
			end

			exports["dynamic"]:SubMenu("Jogador","Pessoa mais próxima de você.","player")


			local Exclusivas = vSERVER.Exclusivas()
			if vSERVER.CheckVip() then
				if parseInt(#Exclusivas) > 0 then
					for _,v in pairs(Exclusivas) do
						if v["type"] == "backpack" then
							exports["dynamic"]:AddButton(v["name"],"Clique para colocar/remover.","skinshop:toggleBackpack",v["id"].."-"..v["texture"],"Exclusivas",false)
						end
					end
				end
				exports["dynamic"]:SubMenu("Exclusivas","Todas as roupas exclusivas.","Exclusivas")
			end
			
			if animalHash ~= nil then
				exports["dynamic"]:SubMenu("Domésticos","Todas as funções dos animais domésticos.","animal")
			end

			exports["dynamic"]:SubMenu("Roupas","Colocar/Retirar roupas.","clothes")
			exports["dynamic"]:SubMenu("Outros","Todas as funções do personagem.","others")

			exports["dynamic"]:openMenu()
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMERGENCYFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("emergencyFunctions",function()
	if not IsPauseMenuActive() then
		if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not menuOpen and LocalPlayer["state"]["Route"] < 900000 then
			local Open = {}
			for Permission,Value in pairs(Groups) do
				if LocalPlayer["state"][Permission] and Value.Type ~= "Premium" then
					table.insert(Open,Permission)
				end
			end
			if Open[1] then
				if Open[2] then
					for _,Permission in pairs(Open) do
						exports["dynamic"]:AddButton(Groups[Permission]["Name"] or Permission, Groups[Permission]["Type"], "painel:Open", Permission, false, true)	
					end
					exports["dynamic"]:openMenu()
				else
					TriggerServerEvent("painel:Open",Open[1])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMINFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("adminFunctions", function()
	if not IsPauseMenuActive() then
		if LocalPlayer["state"]["Admin"] then
			if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not menuOpen and LocalPlayer["state"]["Route"] < 900000 then

				exports["dynamic"]:SubMenu("Gerênciamento", "Clique para mais informações.", "admin")
				exports["dynamic"]:AddButton("Whitelist", "Editar Whitelist de um ID.", "admin:Dynamic", "wl", "admin",true)
				exports["dynamic"]:AddButton("God", "Deixar o ID com tudo 100%.", "admin:Dynamic", "god", "admin", true)
				exports["dynamic"]:AddButton("GodAll", "Deixar Todos com tudo 100%.", "admin:Dynamic", "godall", "admin", true)
				exports["dynamic"]:AddButton("Armour", "Deixar o ID com tudo Colete 100%.", "admin:Dynamic", "armour","admin", true)
				exports["dynamic"]:AddButton("Announce", "Enviar um anúncio para todos.", "admin:Dynamic", "announce","admin", true)
				exports["dynamic"]:AddButton("Rename", "Renomeie algum ID.", "admin:Dynamic", "rename", "admin", true)
				exports["dynamic"]:AddButton("Kick", "Expuldar o ID.", "admin:Dynamic", "kick", "admin", true)
				exports["dynamic"]:AddButton("Ban", "Banir o ID.", "admin:Dynamic", "ban", "admin", true)
				exports["dynamic"]:AddButton("Unban", "Desbanir o ID.", "admin:Dynamic", "unban", "admin", true)
				exports["dynamic"]:AddButton("Clearprison", "Limpar prisão do ID.", "admin:Dynamic", "clearprison","admin", true)

				exports["dynamic"]:SubMenu("Clima", "Clique para mais informações.", "weather")
				exports["dynamic"]:AddButton("Timeset", "Mudar o Clima do jogo.", "admin:Dynamic", "timeset", "weather",true)
				exports["dynamic"]:AddButton("Temperatureset", "Mudar a Temperatura do jogo.", "admin:Dynamic","temperatureset", "weather", true)
				exports["dynamic"]:AddButton("Blackoutset", "Ativar/Desativar o Blackout.", "admin:Dynamic","blackoutset", "weather", true)

				exports["dynamic"]:SubMenu("Grupos", "Clique para mais informações.", "groups")
				exports["dynamic"]:AddButton("Ver Grupos", "Veja quais grupos do ID.", "admin:Dynamic", "ugroups", "groups",true)
				exports["dynamic"]:AddButton("Group", "Dar um grupo para o ID.", "admin:Dynamic", "group", "groups", true)
				exports["dynamic"]:AddButton("Ungroup", "Remover o grupo de um ID.", "admin:Dynamic", "ungroup", "groups",true)

				exports["dynamic"]:SubMenu("Personagens", "Clique para mais informações.", "peds")
				exports["dynamic"]:AddButton("Skin", "Mude a Skin do ID.", "admin:Dynamic", "skin", "peds", true)
				exports["dynamic"]:AddButton("Resetskin", "Resete a Skin do ID.", "admin:Dynamic", "resetskin", "peds",true)
				exports["dynamic"]:AddButton("Delete", "Delete a conta do ID.", "admin:Dynamic", "delete", "peds", true)

				exports["dynamic"]:SubMenu("Veículos", "Clique para mais informações.", "vehicles")
				exports["dynamic"]:AddButton("Tuning", "Tunar o veículo atual.", "admin:Dynamic", "tuning", "vehicles",true)
				exports["dynamic"]:AddButton("Fix", "Arrumar o veículo atual.", "admin:Dynamic", "fix", "vehicles", true)
				exports["dynamic"]:AddButton("Fuel", "Defina a Gasolina no veículo atual.", "admin:Dynamic", "fuel","vehicles", true)
				exports["dynamic"]:AddButton("Hash", "Pegar a Hash do veículo atual.", "admin:Dynamic", "hash","vehicles", true)
				exports["dynamic"]:AddButton("Setcar", "Envie um veículo para o ID.", "admin:Dynamic", "setcar","vehicles", true)
				exports["dynamic"]:AddButton("Remcar", "Remove um veículo do ID.", "admin:Dynamic", "remcar", "vehicles",true)

				exports["dynamic"]:SubMenu("Financeiros", "Clique para mais informações.", "wallet")
				exports["dynamic"]:AddButton("Setbank", "Dar dinheiro para o ID.", "admin:Dynamic", "setbank", "wallet",true)
				exports["dynamic"]:AddButton("Rembank", "Remover dinheiro do ID.", "admin:Dynamic", "rembank", "wallet",true)
				exports["dynamic"]:AddButton("Gemas.","Inserir Gemas no ID.", "admin:Dynamic", "gem", "wallet", true)

				exports["dynamic"]:SubMenu("Itens", "Clique para mais informações.", "item")
				exports["dynamic"]:AddButton("Clearinv", "Limpe o inventário do ID.", "admin:Dynamic", "clearinv","item", true)
				exports["dynamic"]:AddButton("Item", "Pegar Itens para você.", "admin:Dynamic", "item", "item", true)
				exports["dynamic"]:AddButton("Item2", "Dar Itens para o ID.", "admin:Dynamic", "item2", "item", true)
				exports["dynamic"]:AddButton("Itemall", "Dar Itens para todos conectados.", "admin:Dynamic", "itemall","item", true)

				exports["dynamic"]:SubMenu("Básicos", "Clique para mais informações.", "basic")
				exports["dynamic"]:AddButton("Blips", "Ativar/Desativar os Blips.", "admin:Dynamic", "blips", "basic",true)
				exports["dynamic"]:AddButton("Nc", "Ativar/Desativar o NoClip.", "admin:Dynamic", "nc", "basic", true)
				exports["dynamic"]:AddButton("Flash", "Ativar/Desativar o efeito Flash.", "admin:Dynamic", "flash","basic", true)
				exports["dynamic"]:AddButton("Cds", "Pegue sua coordenada atual.", "admin:Dynamic", "cds", "basic", true)
				exports["dynamic"]:AddButton("Tpcds", "Teletransporte para uma coordenada.", "admin:Dynamic", "tpcds","basic", true)
				exports["dynamic"]:AddButton("Tptome", "Teletransporte um ID para você.", "admin:Dynamic", "tptome","basic", true)
				exports["dynamic"]:AddButton("Tpto", "Teletransporte para um ID.", "admin:Dynamic", "tpto", "basic", true)
				exports["dynamic"]:AddButton("Tpway", "Teletransporte para uma marcação no GPS.", "admin:Dynamic","tpway", "basic", true)
				exports["dynamic"]:AddButton("Limparea", "Limpar a área próxima a você.", "admin:Dynamic", "limparea","basic", true)
				exports["dynamic"]:AddButton("Players", "Verifique quantos onlines existem.", "admin:Dynamic", "players","basic", true)
				exports["dynamic"]:AddButton("PlayersConnected", "Verifique os players onlines.", "admin:Dynamic","playersconnected", "basic", true)

				exports["dynamic"]:openMenu()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("globalFunctions","Abrir menu principal.","keyboard","F9")
RegisterKeyMapping("emergencyFunctions","Abrir menu de emergencial.","keyboard","F10")
RegisterKeyMapping("adminFunctions", "Abrir menu de administração.", "keyboard", "INSERT")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:ANIMALSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:animalSpawn")
AddEventHandler("dynamic:animalSpawn",function(model)
	if animalHash == nil then
		if not spawnAnimal then
			spawnAnimal = true
			local Ped = PlayerPedId()
			local heading = GetEntityHeading(Ped)
			local coords = GetOffsetFromEntityInWorldCoords(Ped,0.0,1.0,0.0)
			local Entity,Network = vSERVER.CreateAnimal(model,coords["x"],coords["y"],coords["z"],heading)
			if Entity then
				local spawnAnimal = 0
				animalHash = NetworkGetEntityFromNetworkId(Network)
				while not DoesEntityExist(animalHash) and spawnAnimal <= 1000 do
					animalHash = NetworkGetEntityFromNetworkId(Network)
					spawnAnimal = spawnAnimal + 1
					Wait(1)
				end

				spawnAnimal = 0
				local pedControl = NetworkRequestControlOfEntity(animalHash)
				while not pedControl and spawnAnimal <= 1000 do
					pedControl = NetworkRequestControlOfEntity(animalHash)
					spawnAnimal = spawnAnimal + 1
					Wait(1)
				end

				SetPedCanRagdoll(animalHash,false)
				SetEntityInvincible(animalHash,true)
				SetPedFleeAttributes(animalHash,0,0)
				SetEntityAsMissionEntity(animalHash,true,false)
				SetBlockingOfNonTemporaryEvents(animalHash,true)
				SetPedRelationshipGroupHash(animalHash,GetHashKey("k9"))
				GiveWeaponToPed(animalHash,GetHashKey("WEAPON_ANIMAL"),200,true,true)
		
				SetEntityAsNoLongerNeeded(animalHash)

				TriggerEvent("dynamic:animalFunctions","seguir")
			end
			spawnAnimal = false
		end
	else
		vSERVER.deleteAnimal()
		animalFollow = false
		animalHash = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:ANIMALFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:animalFunctions")
AddEventHandler("dynamic:animalFunctions",function(functions)
	if animalHash ~= nil then
		local Ped = PlayerPedId()
		if functions == "seguir" then
			if not animalFollow then
				TaskFollowToOffsetOfEntity(animalHash,Ped,1.0,1.0,0.0,5.0,-1,2.5,1)
				SetPedKeepTask(animalHash,true)
				animalFollow = true
			else
				SetPedKeepTask(animalHash,false)
				ClearPedTasks(animalHash)
				animalFollow = false
			end
		elseif functions == "colocar" then
			if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) then
				local vehicle = GetVehiclePedIsUsing(Ped)
				if IsVehicleSeatFree(vehicle,0) then
					TaskEnterVehicle(animalHash,vehicle,-1,0,2.0,16,0)
				end
			end
		elseif functions == "remover" then
			if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) then
				TaskLeaveVehicle(animalHash,GetVehiclePedIsUsing(Ped),256)
				TriggerEvent("dynamic:animalFunctions","seguir")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ 427.94,-984.72,29.52, "Pcesp",0.75 },
	{ 615.72,3.64,82.75, "Pmesp",0.75 },
	{ 373.9,-1589.18,29.76, "1BPChq",1.25 },
	{ -581.82,-2359.48,16.07, "2BPChq",0.75 },
	{ 2622.12,5280.5,47.6, "Prf",1.75 },
	{ 311.87,-569.8,43.22,"Hospital",1.25 },
	{  84.39, 294.33, 111.11,"McDonalds",1.25 },
	{ -1297.43,-298.95,41.0,"AutoSport",1.75 },
	{ 874.29,-2100.89,30.41,"EastCustoms",1.75 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for k,v in pairs(List) do
		exports["target"]:AddCircleZone("Service:"..v[4],vec3(v[1],v[2],v[3]),0.5,{
			name = "Service:"..v[4],
			heading = 3374176
		},{
			shop = k,
			Distance = v[5],
			options = {
				{
					label = "Entrar em Serviço",
					event = "service:Toggle",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Toggle")
AddEventHandler("service:Toggle",function(Service)
	if LocalPlayer["state"]["Route"] < 900000 then
		TriggerServerEvent("service:Toggle",List[Service][4])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:LABEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Label")
AddEventHandler("service:Label",function(Service,Text)
	exports["target"]:LabelText("Service:"..Service,Text)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	-- Hospital
	{ 313.47,-586.99,38.33,"Hospital","Hospital" },
	{ 308.38,-588.34,38.33,"Hospital","Hospital" },
	-- Policia Civil
	{ 439.9,-985.95,29.52,"Pcesp","Pcesp" },
	{ 443.61,-985.96,29.52,"Pcesp","Pcesp" },
	{ 437.54,-989.72,29.52,"Pcesp","Pcesp" },
	{ 442.24,-989.69,29.52,"Pcesp","Pcesp" },
	-- Policia Militar
	{ 551.77,27.87,69.35,"RádioPatrulha","Pmesp" },
	{ 554.63,29.48,69.35,"Rocam","Pmesp" },
	{ 550.73,30.99,69.35,"ForçaTática","Pmesp" },
	{ 552.45,23.83,69.35,"Trânsito","Pmesp" },
	{ 548.81,25.31,69.35,"BAEP","Pmesp" },
	{ 549.84,22.90,69.35,"GRPAE","Pmesp" },
	-- Batalhão Rota
	{ 389.89,-1610.95,29.57,"Rota","1BPChq" },
	{ 393.66,-1613.92,29.57,"Rota","1BPChq" },
	-- Batalhão Anchieta
	{ -610.07,-2355.71,16.07,"Oficial","2BPChq" },
	{ -606.85,-2358.3,16.07,"Praca","2BPChq" },
	-- Policia Rodoviaria Federal
	{ 2613.37,5334.64,47.57,"Prf","Prf" },
	{ 2612.08,5333.04,47.57,"Prf","Prf" },
	{ 2616.31,5331.35,47.55,"Prf","Prf" },

	{ 883.18,-2100.46,30.46,"EastCustoms","EastCustoms" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for k,v in pairs(List) do
		exports["target"]:AddCircleZone("Preset:"..k,vec3(v[1],v[2],v[3]),0.5,{
			name = "Preset:"..k,
		},{
			shop = v[4],
			Distance = 0.75,
			options = {
				{
					label = "Uniforme "..v[4],
					event = "dynamic:Presets",
					tunnel = "shop",
					service = v[5]
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("dynamic:Presets",function(Preset,Permission)
	local Presets = vSERVER.Presets(Preset)
	if Presets and LocalPlayer["state"][Permission] then
		for Index,Value in pairs(Presets) do
			exports["dynamic"]:AddButton(Preset.." "..Index,false,"dynamic:Preset",Preset.."-"..Index,false, true)				
		end
		exports["dynamic"]:openMenu()
	end
end)