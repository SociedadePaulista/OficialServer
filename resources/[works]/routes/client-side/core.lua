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
Tunnel.bindInterface("routes",Creative)
vSERVER = Tunnel.getInterface("routes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Button = GetGameTimer()
local inCollect = 1
local inDelivery = 1
local inService = false
local blipCollect = nil
local blipDelivery = nil
local lastService = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Index,Value in pairs(Collect) do
		exports["creative"]:AddPed({
			Distance = 25,
			Coords = { Value["Coords"][1],Value["Coords"][2],Value["Coords"][3],Value["Coords"][4] or 0.0 },
			Model = pedModels[math.random(#pedModels)], 
			anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
		})
    end
	for Index,Value in pairs(Delivery) do
		exports["creative"]:AddPed({
			Distance = 25,
			Coords = { Value["Coords"][1],Value["Coords"][2],Value["Coords"][3],Value["Coords"][4] or 0.0 },
			Model = pedModels[math.random(#pedModels)], 
			anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
		})
    end
	for Index in pairs(Routes) do
		for _,Value in pairs(Routes[Index]) do
			exports["creative"]:AddPed({
				Distance = 25,
				Coords = { Value[1],Value[2],Value[3],Value[4] or 0.0 },
				Model = pedModels[math.random(#pedModels)], 
				anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
			})
		end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(Collect) do
				local distance = #(coords - vector3(v["Coords"][1],v["Coords"][2],v["Coords"][3]))
				if distance <= 2 and LocalPlayer["state"][k] then
					timeDistance = 1
					if not inService then
						DrawText3D(v["Coords"][1],v["Coords"][2],v["Coords"][3],"~g~E~w~   INICIAR COLETA")
					else
						DrawText3D(v["Coords"][1],v["Coords"][2],v["Coords"][3],"~g~E~w~   FINALIZAR COLETA")
					end
					if IsControlJustPressed(1,38) and GetGameTimer() >= Button then
						Button = GetGameTimer() + 500
						if not inService then
							if vSERVER.Permission(k) then
								inService = k
								if lastService ~= k then
									if v["IsRouteRandom"] then
										inCollect = 1
									else
										inCollect = math.random(#Routes[v.Route])
									end
								end
								makeCollectMarked(Routes[v.Route][inCollect][1],Routes[v.Route][inCollect][2],Routes[v.Route][inCollect][3])
								TriggerEvent("Notify","amarelo","Serviço iniciado.",5000)
								CreateThread(function()
									while inService == k do
										local timeDistance = 999
										if #(GetEntityCoords(PlayerPedId()) - vector3(Routes[v.Route][inCollect][1],Routes[v.Route][inCollect][2],Routes[v.Route][inCollect][3])) <= 5 then
											timeDistance = 1
											DrawText3D(Routes[v.Route][inCollect][1],Routes[v.Route][inCollect][2],Routes[v.Route][inCollect][3],"~g~E~w~  COLETAR")
											if IsControlJustPressed(1,38) then
												local Selected = ClosestPed(4)
												if DoesEntityExist(Selected) then
													FreezeEntityPosition(Selected,false)
													TaskTurnPedToFaceEntity(Selected,PlayerPedId(),0.0)
													RequestAnimDict("mp_safehouselost@")
													while not HasAnimDictLoaded("mp_safehouselost@") do
														RequestAnimDict("mp_safehouselost@")
														Wait(1)
													end
													TaskPlayAnim(Selected,"mp_safehouselost@","package_dropoff",8.0,8.0,-1,48,1,0,0,0)
													RequestModel("prop_paper_bag_small")
													while not HasModelLoaded("prop_paper_bag_small") do
														RequestModel("prop_paper_bag_small")
														Wait(1)
													end
													local Coords = GetPedBoneCoords(Selected, GetPedBoneIndex(Selected,28422))
													local Object = CreateObject("prop_paper_bag_small",Coords["x"],Coords["y"],Coords["z"],false,false,false)
													AttachEntityToEntity(Object,Selected,GetPedBoneIndex(Selected,28422),0.0,-0.05,0.05,180.0,0.0,0.0,true,true,false,true,2,true)
													Wait(3000)
													ClearPedTasks(Selected)
													ClearPedSecondaryTask(Selected)
													if DoesEntityExist(Object) then
														DeleteEntity(Object)
													end

													if vSERVER.Collect(inService) then
														PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
													end

													if v["IsRouteRandom"] then
														inCollect = math.random(#Routes[v.Route])
													else
														if inCollect >= #Routes[v.Route] then
															inCollect = 1
														else
															inCollect = inCollect + 1
														end
													end
													makeCollectMarked(Routes[v.Route][inCollect][1],Routes[v.Route][inCollect][2],Routes[v.Route][inCollect][3])

												end
											end
										end
										Wait(timeDistance)
									end
								end)
							end
						else
							if inService == k then
								lastService = k
								inService = false
								TriggerEvent("Notify","amarelo","Serviço finalizado.",5000)
								if DoesBlipExist(blipCollect) then
									RemoveBlip(blipCollect)
									blipCollect = nil
								end
								if DoesBlipExist(blipDelivery) then
									RemoveBlip(blipDelivery)
									blipDelivery = nil
								end
							else
								TriggerEvent("Notify","amarelo","Finalize o emprego anterior para iniciar um novo.",5000)
							end
						end
					end
				end
			end
			for k,v in pairs(Delivery) do
				local distance = #(coords - vector3(v["Coords"][1],v["Coords"][2],v["Coords"][3]))
				if distance <= 2 and LocalPlayer["state"][k] then
					timeDistance = 1
					if not inService then
						DrawText3D(v["Coords"][1],v["Coords"][2],v["Coords"][3],"~g~E~w~   INICIAR ENTREGAS")
					else
						DrawText3D(v["Coords"][1],v["Coords"][2],v["Coords"][3],"~g~E~w~   FINALIZAR ENTREGAS")
					end
					if IsControlJustPressed(1,38) and GetGameTimer() >= Button then
						Button = GetGameTimer() + 500
						if not inService then
							if vSERVER.Permission(k) then
								inService = k
								if lastService ~= k then
									if v["IsRouteRandom"] then
										inDelivery = 1
									else
										inDelivery = math.random(#Routes[v.Route])
									end
								end
								makeDeliveryMarked(Routes[v.Route][inDelivery][1],Routes[v.Route][inDelivery][2],Routes[v.Route][inDelivery][3])
								TriggerEvent("Notify","amarelo","Serviço iniciado.",5000)
								CreateThread(function()
									while inService == k do
										local timeDistance = 999
										if #(GetEntityCoords(PlayerPedId()) - vector3(Routes[v.Route][inDelivery][1],Routes[v.Route][inDelivery][2],Routes[v.Route][inDelivery][3])) <= 5 then
											timeDistance = 1
											DrawText3D(Routes[v.Route][inDelivery][1],Routes[v.Route][inDelivery][2],Routes[v.Route][inDelivery][3],"~g~E~w~  ENTREGAR")
											if IsControlJustPressed(1,38) then
												local Selected = ClosestPed(4)
												if DoesEntityExist(Selected) then
													FreezeEntityPosition(Selected,false)
													TaskTurnPedToFaceEntity(Selected,PlayerPedId(),0.0)
													TaskTurnPedToFaceEntity(PlayerPedId(),Selected,0.0)
													RequestModel("prop_paper_bag_small")
													while not HasModelLoaded("prop_paper_bag_small") do
														RequestModel("prop_paper_bag_small")
														Wait(1)
													end
													RequestModel("prop_anim_cash_note")
													while not HasModelLoaded("prop_anim_cash_note") do
														RequestModel("prop_anim_cash_note")
														Wait(1)
													end
													RequestAnimDict("mp_safehouselost@")
													while not HasAnimDictLoaded("mp_safehouselost@") do
														RequestAnimDict("mp_safehouselost@")
														Wait(1)
													end

													TaskPlayAnim(ped,"mp_safehouselost@","package_dropoff",8.0,8.0,-1,48,1,0,0,0)
													local Coords = GetPedBoneCoords(ped, GetPedBoneIndex(ped,28422))
													local Object = CreateObject("prop_paper_bag_small",Coords["x"],Coords["y"],Coords["z"],false,false,false)
													AttachEntityToEntity(Object,ped,GetPedBoneIndex(ped,28422),0.0,-0.05,0.05,180.0,0.0,0.0,true,true,false,true,2,true)
												
													TaskPlayAnim(Selected,"mp_safehouselost@","package_dropoff",8.0,8.0,-1,48,1,0,0,0)
													local Coords = GetPedBoneCoords(Selected, GetPedBoneIndex(Selected,28422))
													local Object2 = CreateObject("prop_anim_cash_note",Coords["x"],Coords["y"],Coords["z"],false,false,false)
													AttachEntityToEntity(Object2,Selected,GetPedBoneIndex(Selected,28422),0.0,0.0,0.0,90.0,0.0,0.0,true,true,false,true,2,true)
							
													Wait(3000)
													ClearPedTasks(ped)
													ClearPedSecondaryTask(ped)
													if DoesEntityExist(Object) then
														DeleteEntity(Object)
													end
													ClearPedTasks(Selected)
													ClearPedSecondaryTask(Selected)
													if DoesEntityExist(Object2) then
														DeleteEntity(Object2)
													end

													if vSERVER.Delivery(inService) then
														PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
													end
													if v["IsRouteRandom"] then
														inDelivery = math.random(#Routes[v.Route])
													else
														if inDelivery >= #Routes[v.Route] then
															inDelivery = 1
														else
															inDelivery = inDelivery + 1
														end
													end
													makeDeliveryMarked(Routes[v.Route][inDelivery][1],Routes[v.Route][inDelivery][2],Routes[v.Route][inDelivery][3])
												end
											end
										end
										Wait(timeDistance)
									end
								end)
							end
						else
							if inService == k then
								lastService = k
								inService = false
								TriggerEvent("Notify","amarelo","Serviço finalizado.",5000)
								if DoesBlipExist(blipCollect) then
									RemoveBlip(blipCollect)
									blipCollect = nil
								end
								if DoesBlipExist(blipDelivery) then
									RemoveBlip(blipDelivery)
									blipDelivery = nil
								end
							else
								TriggerEvent("Notify","amarelo","Finalize o emprego anterior para iniciar um novo.",5000)
							end
						end
					end
				end
			end
		end
		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESTPED
-----------------------------------------------------------------------------------------------------------------------------------------
function ClosestPed(Radius)
	local Selected = false
	local Ped = PlayerPedId()
	local Radius = Radius + 0.0001
	local Coords = GetEntityCoords(Ped)
	local GamePool = GetGamePool("CPed")
	for _,Entity in pairs(GamePool) do
		if Entity ~= PlayerPedId() and not IsPedAPlayer(Entity) and not IsEntityDead(Entity) and not IsPedInAnyVehicle(Entity) and GetPedType(Entity) ~= 28 then
			local EntityCoords = GetEntityCoords(Entity)
			local EntityDistance = #(Coords - EntityCoords)
			if EntityDistance < Radius then
				Radius = EntityDistance
				Selected = Entity
			end
		end
	end
	return Selected
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)
	if onScreen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)

		local width = string.len(text) / 160 * 0.45
		DrawRect(_x,_y + 0.0125,width,0.03,15,15,15,175)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKECOLLECTMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
function makeCollectMarked(x,y,z)
	if DoesBlipExist(blipCollect) then
		RemoveBlip(blipCollect)
		blipCollect = nil
	end

	if inService then
		blipCollect = AddBlipForCoord(x,y,z)
		SetBlipSprite(blipCollect,12)
		SetBlipColour(blipCollect,2)
		SetBlipScale(blipCollect,0.9)
		SetBlipRoute(blipCollect,true)
		SetBlipAsShortRange(blipCollect,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Coletar")
		EndTextCommandSetBlipName(blipCollect)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEDELIVERYMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
function makeDeliveryMarked(x,y,z)
	if DoesBlipExist(blipDelivery) then
		RemoveBlip(blipDelivery)
		blipDelivery = nil
	end

	if inService then
		blipDelivery = AddBlipForCoord(x,y,z)
		SetBlipSprite(blipDelivery,12)
		SetBlipColour(blipDelivery,5)
		SetBlipScale(blipDelivery,0.9)
		SetBlipRoute(blipDelivery,true)
		SetBlipAsShortRange(blipDelivery,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Entregar")
		EndTextCommandSetBlipName(blipDelivery)
	end
end