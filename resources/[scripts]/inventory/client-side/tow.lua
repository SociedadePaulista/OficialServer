-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Attached = nil
local Impounds = {
	{ -706.04,-1670.7,25.0,252.29 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(Impounds) do
		exports["creative"]:AddPed({
			Distance = 25,
			Coords = { v[1],v[2],v[3],v[4] or 0.0 },
			Model = "g_m_m_armboss_01",
			anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
		})
		exports["target"]:AddCircleZone("Impounds:"..Number,vec3(v[1],v[2],v[3]),0.5,{
			name = "Impounds:"..Number,
			heading = 3374176
		},{
			shop = Number,
			Distance = 1.5,
			options = {
				{
					event = "garages:Impound",
					label = "Apreendidos",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:TOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:Tow")
AddEventHandler("inventory:Tow",function()
	local Ped = PlayerPedId()
	local Vehicle = GetLastDrivenVehicle()
	if GetEntityModel(Vehicle) == GetHashKey("bennysscania") and not IsPedInAnyVehicle(Ped) then
		local Tower = vRP.ClosestVehicle(10)

		if IsEntityAVehicle(Vehicle) and IsEntityAVehicle(Tower) and not Entity(Tower)["state"]["Dismantle"] then
			if #(GetEntityCoords(Vehicle) - GetEntityCoords(Tower)) <= 15 then
				if Attached then
					if DoesEntityExist(Vehicle) and DoesEntityExist(Attached) then
						TriggerServerEvent("inventory:Tow",VehToNet(Vehicle),VehToNet(Attached),"out")
					end
					Attached = nil
					Tower = nil
				else
					if Vehicle ~= Tower then
						Tower = Tower
						LocalPlayer["state"]["Cancel"] = true
						LocalPlayer["state"]["Commands"] = true
						TaskTurnPedToFaceEntity(Ped,Tower,5000)
						TriggerEvent("sounds:Private","tow",0.5)
						Entity(Vehicle)["state"]:set("Tow",true,true)
						vRP.playAnim(false,{"mini@repair","fixing_a_player"},true)

						Wait(4500)

						vRP.removeObjects()
						Attached = Tower
						LocalPlayer["state"]["Cancel"] = false
						LocalPlayer["state"]["Commands"] = false
						TriggerServerEvent("inventory:Tow",VehToNet(Vehicle),VehToNet(Tower),"in")
					end
				end
			else
				TriggerEvent("Notify","amarelo","O reboque precisa estar próximo do veículo.",5000,"Aviso")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CLIENTTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:ClientTow")
AddEventHandler("inventory:ClientTow",function(Vehicle,Vehicle02,Mode)
	if NetworkDoesNetworkIdExist(Vehicle) and NetworkDoesNetworkIdExist(Vehicle02) then
		local Vehicle = NetToEnt(Vehicle)
		local Vehicle02 = NetToEnt(Vehicle02)
		if DoesEntityExist(Vehicle) and DoesEntityExist(Vehicle02) then
			if Mode == "in" then
				local Min = GetModelDimensions(GetEntityModel(Vehicle02))
				AttachEntityToEntity(Vehicle02,Vehicle,GetEntityBoneIndexByName(Vehicle,"bodyshell"),0,-2.2,0.2 - Min["z"],0,0,0,true,true,false,true,2,true)
			elseif Mode == "out" then
				DetachEntity(Vehicle02,false,false)

				local Heading = GetEntityHeading(Vehicle)
				local Coords = GetOffsetFromEntityInWorldCoords(Vehicle,0.0,-10.0,0.0)
				SetEntityCoords(Vehicle02,Coords["x"],Coords["y"],Coords["z"],false,false,false,false)
				SetEntityHeading(Vehicle02,Heading)
				SetVehicleOnGroundProperly(Vehicle02)

				if Entity(Vehicle)["state"]["Tow"] then
					Entity(Vehicle)["state"]:set("Tow",nil,true)
				end
			end
		end
	end
end)