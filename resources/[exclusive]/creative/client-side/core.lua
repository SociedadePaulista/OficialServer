-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIFTENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function driftEnable()
	-- if not IsPauseMenuActive() then
	-- 	local Ped = PlayerPedId()
	-- 	if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) and not IsPedInAnyHeli(Ped) and not IsPedInAnyBoat(Ped) and not IsPedInAnyPlane(Ped) then
	-- 		local Vehicle = GetVehiclePedIsIn(Ped)
	-- 		if GetPedInVehicleSeat(Vehicle,-1) == Ped then
	-- 			local speed = GetEntitySpeed(Vehicle) * 3.6
	-- 			if speed <= 100.0 and speed >= 5.0 then
	-- 				SetVehicleReduceGrip(Vehicle,true)

	-- 				if not GetDriftTyresEnabled(Vehicle) then
	-- 					SetDriftTyresEnabled(Vehicle,true)
	-- 					SetReduceDriftVehicleSuspension(Vehicle,true)
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIFTDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function driftDisable()
	--[[ local Ped = PlayerPedId()
	if IsPedInAnyVehicle(Ped) then
		local Vehicle = GetLastDrivenVehicle()

		if GetDriftTyresEnabled(Vehicle) then
			SetVehicleReduceGrip(Vehicle,false)
			SetDriftTyresEnabled(Vehicle,false)
			SetReduceDriftVehicleSuspension(Vehicle,false)
		end
	end ]]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEDRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("+activeDrift",driftEnable)
RegisterCommand("-activeDrift",driftDisable)
RegisterKeyMapping("+activeDrift","Ativação do drift.","keyboard","LSHIFT")
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()

        SetCreateRandomCops(false)
        CancelCurrentPoliceReport()
        SetCreateRandomCopsOnScenarios(false)
        SetCreateRandomCopsNotOnScenarios(false)

        SetPedInfiniteAmmoClip(PlayerPedId(),false)

        SetVehicleModelIsSuppressed(GetHashKey("jet"),true)
        SetVehicleModelIsSuppressed(GetHashKey("besra"),true)
        SetVehicleModelIsSuppressed(GetHashKey("luxor"),true)
        SetVehicleModelIsSuppressed(GetHashKey("blimp"),true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp2"),true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp3"),true)
        SetVehicleModelIsSuppressed(GetHashKey("polmav"),true)
        SetVehicleModelIsSuppressed(GetHashKey("buzzard2"),true)
        SetVehicleModelIsSuppressed(GetHashKey("mammatus"),true)
		SetVehicleModelIsSuppressed(GetHashKey("ambulance"),true)
        SetVehicleModelIsSuppressed(GetHashKey("firetruk"),true)
        SetPedModelIsSuppressed(GetHashKey("s_m_y_prismuscl_01"),true)
        SetPedModelIsSuppressed(GetHashKey("u_m_y_prisoner_01"),true)
        SetPedModelIsSuppressed(GetHashKey("s_m_y_prisoner_01"),true)

        Wait(1000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		SetWeaponDamageModifierThisFrame("WEAPON_BAT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KATANA",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HAMMER",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_WRENCH",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_UNARMED",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_CROWBAR",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_MACHETE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_POOLCUE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KNUCKLE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KARAMBIT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_GOLFCLUB",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_BATTLEAXE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_FLASHLIGHT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_NIGHTSTICK",0.35)
		SetWeaponDamageModifierThisFrame("WEAPON_STONE_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_SMOKEGRENADE",0.0)

		RemoveAllPickupsOfType("PICKUP_WEAPON_KNIFE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PISTOL")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MINISMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MICROSMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PUMPSHOTGUN")
		RemoveAllPickupsOfType("PICKUP_WEAPON_CARBINERIFLE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_SAWNOFFSHOTGUN")
		
		for Number = 1,24 do
			if Number ~= 14 and Number ~= 16 then
				HideHudComponentThisFrame(Number)
			end
		end

		--BlockWeaponWheelThisFrame()
		DisableControlAction(1,37,true)
		DisableControlAction(1,204,true)
		DisableControlAction(1,211,true)
		DisableControlAction(1,349,true)
		DisableControlAction(1,192,true)
		DisableControlAction(1,157,true)
		DisableControlAction(1,158,true)
		DisableControlAction(1,159,true)
		DisableControlAction(1,160,true)
		DisableControlAction(1,161,true)
		DisableControlAction(1,162,true)
		DisableControlAction(1,163,true)
		DisableControlAction(1,164,true)
		DisableControlAction(1,165,true)

		SetVehicleDensityMultiplierThisFrame(0.3)
		SetRandomVehicleDensityMultiplierThisFrame(0)
		SetParkedVehicleDensityMultiplierThisFrame(0.20)
		
		if #(GetEntityCoords(PlayerPedId()) - vec3(-838.5,4176.4,192.5)) <= 1000 then
			SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
			SetPedDensityMultiplierThisFrame(1.0)

		else
			SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
			SetPedDensityMultiplierThisFrame(1.0)
		end


		if IsPedArmed(PlayerPedId(),6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		if IsPedUsingActionMode(PlayerPedId()) then
			SetPedUsingActionMode(PlayerPedId(),-1,-1,1)
		end

		if IsPedInAnyVehicle(PlayerPedId()) then
			DisableControlAction(0,345,true)
		end

		SetPauseMenuActive(false)
		DisablePlayerVehicleRewards(PlayerId())
		SetPlayerLockonRangeOverride(PlayerId(),0.0)

		if IsPlayerWantedLevelGreater(PlayerId(),0) then
            ClearPlayerWantedLevel(PlayerId())
        end

		DisablePlayerVehicleRewards(PlayerId())

		SetWeatherTypeNow(GlobalState["Weather"])
		SetWeatherTypePersist(GlobalState["Weather"])
		SetWeatherTypeNowPersist(GlobalState["Weather"])
		SetArtificialLightsState(GlobalState["Blackout"])
		SetArtificialLightsStateAffectsVehicles(false)
		NetworkOverrideClockTime(GlobalState["Hours"],GlobalState["Minutes"],00)

		Wait(0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {
	["Doors"] = {
		{ 
			{-741.07,5593.13,41.66}, 
			{446.19,5568.79,781.19} 
		},
		{ 
			{-740.78,5597.04,41.66}, 
			{446.37,5575.02,781.19} 
		},
		{ 
			{-71.05,-801.01,44.23}, 
			{-75.0,-824.54,321.29} 
		},
		{ 
			{254.06,225.28,101.87},
			{252.32,220.21,101.67} 
		},
		{ 
			{444.62,-978.52,29.52,87.88},
			{444.56,-978.38,37.39,93.55} 
		},
	},
	["Elevator"] = {
		{
			{ Title = "Terceiro Andar.", Coords = {610.66,-16.54,91.53,348.67} },
			{ Title = "Segundo Andar.", Coords = {612.23,-12.01,87.05,348.67} },
			{ Title = "Recepção.", Coords = {611.82,-13.22,82.77,340.16} },
			{ Title = "Estacionamento.", Coords = {540.14,25.67,69.51,124.73} },
		},
		{
			{ Title = "Terceiro Andar.", Coords = {613.55,-17.52,91.53,354.34} },
			{ Title = "Segundo Andar.", Coords = {615.01,-13.23,87.05,343.0} },
			{ Title = "Recepção.", Coords = {614.54,-14.41,82.77,345.83} },
		},
		{
			{ Title = "Heliponto.", Coords = {338.75,-583.63,74.16,354.34} },
			{ Title = "Leitos.", Coords = {327.02,-571.21,48.21,170.08} },
			{ Title = "Recepção.", Coords = {316.03,-579.78,43.27,164.41} },
		},
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		if LocalPlayer["state"]["Route"] < 900000 then
			local Ped = PlayerPedId()
			if not IsPedInAnyVehicle(Ped) then
				local Coords = GetEntityCoords(Ped)
				for Type in pairs(Teleport) do
					for Number in pairs(Teleport[Type]) do
						if Type == "Doors" then
							local IsPlayerNearCoords = (#(Coords - vec3(Teleport[Type][Number][1][1],Teleport[Type][Number][1][2],Teleport[Type][Number][1][3])) <= 1.75 and 2) or (#(Coords - vec3(Teleport[Type][Number][2][1],Teleport[Type][Number][2][2],Teleport[Type][Number][2][3])) <= 1.75 and 1)
							if IsPlayerNearCoords then
								TimeDistance = 1
								if IsControlJustPressed(1,38) then
									SetEntityHeading(Ped,Teleport[Type][Number][IsPlayerNearCoords][4] or 0.0)
									SetEntityCoords(Ped,vec3(Teleport[Type][Number][IsPlayerNearCoords][1],Teleport[Type][Number][IsPlayerNearCoords][2],Teleport[Type][Number][IsPlayerNearCoords][3]-1))
								end
							end	
						else
							for Key,Value in pairs(Teleport[Type][Number]) do
								if #(Coords - vec3(Value.Coords[1],Value.Coords[2],Value.Coords[3])) <= 1.75 then
									TimeDistance = 1
									if IsControlJustPressed(1,38) then
										for Index in pairs(Teleport[Type][Number]) do
											exports["dynamic"]:AddButton(Teleport[Type][Number][Index].Title,false,"creative:Elevator",Number.."-"..Index,false,false)
										end
										exports["dynamic"]:openMenu()
									end
								end
							end
						end
					end
				end
			end
		end
		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ELEVATOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("creative:Elevator")
AddEventHandler("creative:Elevator",function(Data)
	local Ped = PlayerPedId()
	local Number = parseInt(SplitOne(Data,"-"))
	local Index = parseInt(SplitTwo(Data,"-"))
	local Coords = Teleport["Elevator"][Number][Index].Coords
	TriggerEvent("sounds:Private","elevator",0.25)
	TriggerEvent("dynamic:closeSystem")
	Wait(500)
	SetEntityHeading(Ped,Coords[4] or 0.0)
 	SetEntityCoords(Ped,vec3(Coords[1],Coords[2],Coords[3]-1))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {
	{ 55.43,-876.19,30.66,357,3,"Garagem",0.65 },
	{ 598.04,2741.27,42.07,357,3,"Garagem",0.65 },
	{ -136.36,6357.03,31.49,357,3,"Garagem",0.65 },
	{ 275.23,-345.54,45.17,357,3,"Garagem",0.65 },
	{ 596.40,90.65,93.12,357,3,"Garagem",0.65 },
	{ -340.76,265.97,85.67,357,3,"Garagem",0.65 },
	{ -2030.01,-465.97,11.60,357,3,"Garagem",0.65 },
	{ -1184.92,-1510.00,4.64,357,3,"Garagem",0.65 },
	{ 214.02,-808.44,31.01,357,3,"Garagem",0.65 },
	{ -348.88,-874.02,31.31,357,3,"Garagem",0.65 },
	{ 67.74,12.27,69.21,357,3,"Garagem",0.65 },
	{ 361.90,297.81,103.88,357,3,"Garagem",0.65 },
	{ 1035.89,-763.89,57.99,357,3,"Garagem",0.65 },
	{ -796.63,-2022.77,9.16,357,3,"Garagem",0.6 },
	{ 453.27,-1146.76,29.52,357,3,"Garagem",0.65 },
	{ 528.66,-146.3,58.38,357,3,"Garagem",0.65 },
	{ -1159.48,-739.32,19.89,357,3,"Garagem",0.65 },
	{ 101.22,-1073.68,29.38,357,3,"Garagem",0.65 },
	{ 1725.21,4711.77,42.11,357,3,"Garagem",0.65 },
	{ 1624.05,3566.14,35.15,357,3,"Garagem",0.65 },
	{ -73.35,-2004.6,18.27,357,3,"Garagem",0.65 },
	{ 1200.52,-1276.06,35.22,357,3,"Garagem",0.65 },


	{ 2593.86,5338.04,47.68,60,5,"Policia Rodoviaria",0.7 },
	{ 629.21,-6.43,85.85,58,0,"Policia Militar",0.7 },
	{ 418.88,-985.3,29.42,60,0,"Policia Civil",0.7 },
	{ 369.63,-1582.07,29.28,176,5,"Batalhão Rota",0.5 },
	-- { -622.73,-2316.72,13.9,176,8,"Batalhão Anchieta",0.5 },
	-- { 1024.61,-2324.21,30.55,176,18,"Batalhão Humaitá",0.6 },
	-- { -358.12,-247.87,36.06,176,18,"Batalhão Coe",0.6 },

	{ 29.2,-1351.89,29.34,52,36,"Loja de Departamento",0.5 },
	{ 2561.74,385.22,108.61,52,36,"Loja de Departamento",0.5 },
	{ 1160.21,-329.4,69.03,52,36,"Loja de Departamento",0.5 },
	{ -711.99,-919.96,19.01,52,36,"Loja de Departamento",0.5 },
	{ -54.56,-1758.56,29.05,52,36,"Loja de Departamento",0.5 },
	{ 375.87,320.04,103.42,52,36,"Loja de Departamento",0.5 },
	{ -3237.48,1004.72,12.45,52,36,"Loja de Departamento",0.5 },
	{ 1730.64,6409.67,35.0,52,36,"Loja de Departamento",0.5 },
	{ 543.51,2676.85,42.14,52,36,"Loja de Departamento",0.5 },
	{ 1966.53,3737.95,32.18,52,36,"Loja de Departamento",0.5 },
	{ 2684.73,3281.2,55.23,52,36,"Loja de Departamento",0.5 },
	{ 1696.12,4931.56,42.07,52,36,"Loja de Departamento",0.5 },
	{ -1820.18,785.69,137.98,52,36,"Loja de Departamento",0.5 },
	{ 1395.35,3596.6,34.86,52,36,"Loja de Departamento",0.5 },
	{ -2977.14,391.22,15.03,52,36,"Loja de Departamento",0.5 },
	{ -3034.99,590.77,7.8,52,36,"Loja de Departamento",0.5 },
	{ 1144.46,-980.74,46.19,52,36,"Loja de Departamento",0.5 },
	{ 1166.06,2698.17,37.95,52,36,"Loja de Departamento",0.5 },
	{ -1493.12,-385.55,39.87,52,36,"Loja de Departamento",0.5 },
	{ -1228.6,-899.7,12.27,52,36,"Loja de Departamento",0.5 },
	{ 157.82,6631.8,31.68,52,36,"Loja de Departamento",0.5 },
	{ 1702.78,3748.82,34.05,110,1,"Loja de Armas",0.7 },
	{ 240.06,-43.74,69.71,110,1,"Loja de Armas",0.7 },
	{ 843.95,-1020.43,27.53,110,1,"Loja de Armas",0.7 },
	{ -322.19,6072.86,31.27,110,1,"Loja de Armas",0.7 },
	{ -664.03,-949.22,21.53,110,1,"Loja de Armas",0.7 },
	{ -1318.83,-389.19,36.43,110,1,"Loja de Armas",0.7 },
	{ -1110.11,2687.5,18.62,110,1,"Loja de Armas",0.7 },
	{ 2569.23,309.46,108.46,110,1,"Loja de Armas",0.7 },
	{ -3159.91,1080.64,20.69,110,1,"Loja de Armas",0.7 },
	{ 15.42,-1120.47,28.81,110,1,"Loja de Armas",0.7 },
	{ 811.81,-2145.58,29.34,110,1,"Loja de Armas",0.7 },
	{ -815.12,-184.15,37.57,71,62,"Barbearia",0.5 },
	{ 138.13,-1706.46,29.3,71,62,"Barbearia",0.5 },
	{ -1280.92,-1117.07,7.0,71,62,"Barbearia",0.5 },
	{ 1930.54,3732.06,32.85,71,62,"Barbearia",0.5 },
	{ 1214.2,-473.18,66.21,71,62,"Barbearia",0.5 },
	{ -33.61,-154.52,57.08,71,62,"Barbearia",0.5 },
	{ -276.65,6226.76,31.7,71,62,"Barbearia",0.5 },
	{ -1117.26,-1438.74,5.11,73,3,"Loja de Roupas",0.6 },
	{ 86.06,-1391.64,29.23,73,3,"Loja de Roupas",0.6 },
	{ -719.94,-158.18,37.0,73,3,"Loja de Roupas",0.6 },
	{ -152.79,-306.79,38.67,73,3,"Loja de Roupas",0.6 },
	{ -816.39,-1081.22,11.12,73,3,"Loja de Roupas",0.6 },
	{ -1206.51,-781.5,17.12,73,3,"Loja de Roupas",0.6 },
	{ -1458.26,-229.79,49.2,73,3,"Loja de Roupas",0.6 },
	{ -2.41,6518.29,31.48,73,3,"Loja de Roupas",0.6 },
	{ 1682.59,4819.98,42.04,73,3,"Loja de Roupas",0.6 },
	{ 129.46,-205.18,54.51,73,3,"Loja de Roupas",0.6 },
	{ 618.49,2745.54,42.01,73,3,"Loja de Roupas",0.6 },
	{ 1197.93,2698.21,37.96,73,3,"Loja de Roupas",0.6 },
	{ -3165.74,1061.29,20.84,73,3,"Loja de Roupas",0.6 },
	{ -1093.76,2703.99,19.04,73,3,"Loja de Roupas",0.6 },
	{ 414.86,-807.57,29.34,73,3,"Loja de Roupas",0.6 },
	--[[ { -1082.22,-247.54,37.77,439,73,"Life Invader",0.6 }, ]]
	{ -1728.06,-1050.69,1.71,356,0,"Embarcações",0.7 },
	{ 1966.36,3975.86,31.51,356,0,"Embarcações",0.7 },
	{ -776.72,-1495.02,2.29,356,0,"Embarcações",0.7 },
	{ -893.97,5687.78,3.29,356,0,"Embarcações",0.7 },
	{ 4952.76,-5163.6,-0.3,356,0,"Embarcações",0.7 },
	{ 452.99,-607.74,28.59,513,62,"Motorista",0.5 },
	{ -200.3,6234.62,31.49,513,62,"Motorista",0.5 },
	{ 881.95,-2256.79,32.45,67,38,"Transportador",0.5 },
	{ 2435.52,5014.07,46.89,560,62,"Lenhador",0.5 },
	{ -172.21,6385.85,31.49,403,5,"Farmácia",0.7 },
	{ 315.12,-1068.58,29.39,403,5,"Farmácia",0.7 },
	{ 94.79,-228.67,54.67,403,5,"Farmácia",0.7 },
	{ -355.7,-1555.81,25.17,318,62,"Lixeiro",0.6 },
	{ 287.36,2843.6,44.7,318,62,"Lixeiro",0.6 },
	{ -413.97,6171.58,31.48,318,62,"Lixeiro",0.6 },
	{ -428.56,-1728.33,19.79,467,11,"Reciclagem",0.6 },
	{ 180.07,2793.29,45.65,467,11,"Reciclagem",0.6 },
	{ -195.42,6264.62,31.49,467,11,"Reciclagem",0.6 },
	{ 2953.93,2787.49,41.5,618,62,"Garimpo",0.7 },
	{ 562.3,2741.61,42.87,273,10,"Animal Ark",0.6 },
	{ 1322.93,-1652.29,52.27,75,13,"Loja de Tatuagem",0.5 },
	{ -1154.42,-1425.9,4.95,75,13,"Loja de Tatuagem",0.5 },
	{ 322.84,180.16,103.58,75,13,"Loja de Tatuagem",0.5 },
	{ -3169.62,1075.8,20.83,75,13,"Loja de Tatuagem",0.5 },
	{ 1864.07,3747.9,33.03,75,13,"Loja de Tatuagem",0.5 },
	{ -293.57,6199.85,31.48,75,13,"Loja de Tatuagem",0.5 },
	{ 1525.07,3784.92,34.49,68,47,"Pescador",0.7 },
	{ 81.42,275.07,110.21,124,1,"McDonalds",0.6 },
	{ 2057.89,5109.83,46.34,85,62,"Agricultor",0.6 },
	{ 110.67,-152.59,54.86,225,62,"Concessionária",0.5 },
	{ -773.05,5599.48,33.75,141,3,"Esporte & Sobrevivência",0.7 },
	{ -838.5,4176.4,192.5,141,3,"Área de Caça Legal",0.9 },
	{ 236.06,-410.48,48.12,304,25,"Prefeitura",0.6 },
	{ 919.38,-182.83,74.02,198,5,"Taxista",0.5 },
	{ 1696.19,4785.25,42.02,198,5,"Taxista",0.5 },
	{ 918.69,50.33,80.9,207,5,"Casino Resort",0.6 },
	{ 1136.88,-474.85,66.44,619,26,"Eletronicos",0.6 },
	{ -698.65,271.18,83.1,375,0,"Imobiliária",0.6 },
	{ 1679.04,2513.71,45.56,189,0,"Penitenciária",0.7 },
	{ 1085.03,-2002.53,31.37,653,5,"Usina de Fundição",0.7 },
	{ 170.01,-1799.44,29.32,186,5,"Chaveiro",0.7 },
	{ 1239.87,-3257.2,7.09,477,62,"Caminhoneiro",0.5 },
	
	--{ 305.46,-588.63,43.29,61,2,"Hospital",0.75 },
	{ 305.46,-588.63,43.29,153,1,"Hospital",0.9 },

	{ -623.84,-234.35,38.05,617,53,"Joalheria",0.5 },
	{ 46.66,-1749.79,29.64,78,0,"Mercardo",0.7 },
	{ 2747.28,3473.04,55.67,566,4,"Loja de Ferramentas",0.6 },
	{ -1745.31,-205.22,57.37,310,0,"Cemitério",0.7 },
	--[[ { 20.51,-1505.36,31.85,305,5,"Igreja",0.7 }, ]]
	--[[ { -773.61,-10.21,41.32,305,5,"Igreja",0.7 }, ]]

	{ -703.75,-1668.02,25.0,498,4,"Departamento Trânsito",0.6 },

	{ -741.05,5593.12,41.65,36,4,"Teleférico",0.6 },
	{ -1297.3,-319.76,36.75,446,17,"Mecânica",0.6 },
	{ 899.04,-2118.79,31.76,446,17,"Mecânica",0.6 },


	{ 2310.44,4884.82,41.8,636,4,"Leiteiro",0.6 },
	{ 2251.68,5155.38,57.88,479,4,"Tratorista",0.6 },
	
	{ -1896.42,-3032.01,13.93,557,62,"Aviação",0.7 },
	{ 69.03,127.35,79.21,501,4,"Correios",0.6 },
	{ -555.95,285.58,82.18,93,4,"Tequi-La-La",0.6 },
	{ 121.81,-1289.29,35.01,121,4,"Vanilla Unicorn",0.6 },
	{ -596.08,2089.32,131.42,486,0,"Mina de Carvão",0.65 },

	{ -1648.45, 2078.34, 86.12,685,33,"Turistico",0.6 },
	{ -536.38, 4421.0, 34.19,685,33,"Turistico",0.6 },
	{ -1448.09, 2101.44, 51.54,685,33,"Turistico",0.6 },
	{ 3079.44, 2082.27, 4.5,685,33,"Turistico",0.6 },
	{ 766.04, 7395.54, -112.12,685,33,"Turistico",0.6 },
	
	{ -1337.61,-3041.4,13.93,307,0,"Aeroporto",0.5 },
	-- { 2133.24,4784.35,40.96,251,0,"Aeródromo",0.7 },

	{ 4891.85, -4925.34, 3.12,489,48,"Praia do Amor",0.5 },
	{ -2043.71, -1031.93, 11.98,455,32,"Iate",0.5 },
	{ -1389.28, 6742.24, 11.98,455,32,"Iate",0.5 },


	--[[ { 4.78,-706.0,45.97,642,5,"Reserva Federal",0.6}, ]]
	{ 241.72,220.70,106.28,434,43,"Banco Central",0.7},
	{ 150.26,-1040.20,29.37,431,43,"Banco",0.6},
	{ -1212.98,-330.84,37.78,431,43,"Banco",0.6},
	{ -2962.58,482.62,15.70,431,43,"Banco",0.6},
	{ 314.18,-278.62,54.17,431,43,"Banco",0.6},
	{ -351.53,-49.52,49.04,431,43,"Banco",0.6},
	{ 1176.08,2706.33,38.15,431,43,"Banco",0.6},
	{ -112.09,6470.12,31.63,431,43,"Banco",0.6},

	{ 265.09,-1258.94,29.13,361,35,"Posto de Gasolina",0.4 },
	{ -2097.61,-320.57,13.16,361,35,"Posto de Gasolina",0.4 },
	{ -2555.19,2334.31,33.08,361,35,"Posto de Gasolina",0.4 },
	{ 179.99,6602.84,31.86,361,35,"Posto de Gasolina",0.4 },
	{ 818.92,-1028.65,26.89,361,35,"Posto de Gasolina",0.4 },
	{ 1207.05,-1403.68,36.26,361,35,"Posto de Gasolina",0.4 },
	{ 1181.61,-330.8,69.78,361,35,"Posto de Gasolina",0.4 },
	{ 619.47,270.18,103.26,361,35,"Posto de Gasolina",0.4 },
	{ 2581.01,362.42,108.88,361,35,"Posto de Gasolina",0.4 },
	{ 174.86,-1562.55,29.87,361,35,"Posto de Gasolina",0.4 },
	{ -319.25,-1470.23,30.5,361,35,"Posto de Gasolina",0.4 },
	{ 1786.08,3329.86,40.42,361,35,"Posto de Gasolina",0.4 },
	{ 48.92,2779.59,57.05,361,35,"Posto de Gasolina",0.4 },
	{ 264.98,2607.18,43.99,361,35,"Posto de Gasolina",0.4 },
	{ 1039.9,2671.05,39.53,361,35,"Posto de Gasolina",0.4 },
	{ 1208.52,2659.43,36.9,361,35,"Posto de Gasolina",0.4 },
	{ 2539.8,2594.81,36.96,361,35,"Posto de Gasolina",0.4 },
	{ 2006.21,3774.96,31.4,361,35,"Posto de Gasolina",0.4 },
	{ 1690.1,4927.81,41.23,361,35,"Posto de Gasolina",0.4 },
	{ 1701.73,6416.49,31.77,361,35,"Posto de Gasolina",0.4 },
	{ -91.29,6422.54,30.65,361,35,"Posto de Gasolina",0.4 },
	{ -1797.22,800.56,137.66,361,35,"Posto de Gasolina",0.4 },
	{ -1435.5,-284.68,45.41,361,35,"Posto de Gasolina",0.4 },
	{ -732.64,-939.32,18.22,361,35,"Posto de Gasolina",0.4 },
	{ -524.92,-1216.15,17.33,361,35,"Posto de Gasolina",0.4 },
	{ -69.45,-1758.01,28.55,361,35,"Posto de Gasolina",0.4 },
	{ -1200.95,-1568.93,4.61,311,0,"Academia",0.6 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALPHAS
-----------------------------------------------------------------------------------------------------------------------------------------
local Alphas = {
	{ vec3(-838.5,4176.4,192.5),80,0--[[ 30 ]],1000.0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number = 1,#Alphas do
		local Blip = AddBlipForRadius(Alphas[Number][1]["x"],Alphas[Number][1]["y"],Alphas[Number][1]["z"],Alphas[Number][4])
		SetBlipAlpha(Blip,Alphas[Number][2])
		SetBlipColour(Blip,Alphas[Number][3])
		Wait(10)
	end

	for Number = 1,#Blips do
		local Blip = AddBlipForCoord(Blips[Number][1],Blips[Number][2],Blips[Number][3])
		SetBlipSprite(Blip,Blips[Number][4])
		SetBlipDisplay(Blip,4)
		SetBlipAsShortRange(Blip,true)
		SetBlipColour(Blip,Blips[Number][5])
		SetBlipScale(Blip,Blips[Number][7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Blips[Number][6])
		EndTextCommandSetBlipName(Blip)
		Wait(10)
	end

	local Tables = {}
	for Type in pairs(Teleport) do
		for Number in pairs(Teleport[Type]) do
			if Type == "Doors" then
				Tables[#Tables + 1] = { Teleport[Type][Number][1][1],Teleport[Type][Number][1][2],Teleport[Type][Number][1][3],2.5,"E","Porta de Acesso","Pressione para acessar" }
				Tables[#Tables + 1] = { Teleport[Type][Number][2][1],Teleport[Type][Number][2][2],Teleport[Type][Number][2][3],2.5,"E","Porta de Acesso","Pressione para acessar" }
			else
				for Key,Value in pairs(Teleport[Type][Number]) do
					Tables[#Tables + 1] = { Value.Coords[1],Value.Coords[2],Value.Coords[3],2.5,"E","Elevador de Acesso","Pressione para acessar" }
				end
			end
		end
	end
	TriggerEvent("hoverfy:Insert",Tables)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ISLAND
-----------------------------------------------------------------------------------------------------------------------------------------
local Island = {
	"h4_islandairstrip",
	"h4_islandairstrip_props",
	"h4_islandx_mansion",
	"h4_islandx_mansion_props",
	"h4_islandx_props",
	"h4_islandxdock",
	"h4_islandxdock_props",
	"h4_islandxdock_props_2",
	"h4_islandxtower",
	"h4_islandx_maindock",
	"h4_islandx_maindock_props",
	"h4_islandx_maindock_props_2",
	"h4_IslandX_Mansion_Vault",
	"h4_islandairstrip_propsb",
	"h4_beach",
	"h4_beach_props",
	"h4_beach_bar_props",
	"h4_islandx_barrack_props",
	"h4_islandx_checkpoint",
	"h4_islandx_checkpoint_props",
	"h4_islandx_Mansion_Office",
	"h4_islandx_Mansion_LockUp_01",
	"h4_islandx_Mansion_LockUp_02",
	"h4_islandx_Mansion_LockUp_03",
	"h4_islandairstrip_hangar_props",
	"h4_IslandX_Mansion_B",
	"h4_islandairstrip_doorsclosed",
	"h4_Underwater_Gate_Closed",
	"h4_mansion_gate_closed",
	"h4_aa_guns",
	"h4_IslandX_Mansion_GuardFence",
	"h4_IslandX_Mansion_Entrance_Fence",
	"h4_IslandX_Mansion_B_Side_Fence",
	"h4_IslandX_Mansion_Lights",
	"h4_islandxcanal_props",
	"h4_beach_props_party",
	"h4_islandX_Terrain_props_06_a",
	"h4_islandX_Terrain_props_06_b",
	"h4_islandX_Terrain_props_06_c",
	"h4_islandX_Terrain_props_05_a",
	"h4_islandX_Terrain_props_05_b",
	"h4_islandX_Terrain_props_05_c",
	"h4_islandX_Terrain_props_05_d",
	"h4_islandX_Terrain_props_05_e",
	"h4_islandX_Terrain_props_05_f",
	"h4_islandx_terrain_01",
	"h4_islandx_terrain_02",
	"h4_islandx_terrain_03",
	"h4_islandx_terrain_04",
	"h4_islandx_terrain_05",
	"h4_islandx_terrain_06",
	"h4_ne_ipl_00",
	"h4_ne_ipl_01",
	"h4_ne_ipl_02",
	"h4_ne_ipl_03",
	"h4_ne_ipl_04",
	"h4_ne_ipl_05",
	"h4_ne_ipl_06",
	"h4_ne_ipl_07",
	"h4_ne_ipl_08",
	"h4_ne_ipl_09",
	"h4_nw_ipl_00",
	"h4_nw_ipl_01",
	"h4_nw_ipl_02",
	"h4_nw_ipl_03",
	"h4_nw_ipl_04",
	"h4_nw_ipl_05",
	"h4_nw_ipl_06",
	"h4_nw_ipl_07",
	"h4_nw_ipl_08",
	"h4_nw_ipl_09",
	"h4_se_ipl_00",
	"h4_se_ipl_01",
	"h4_se_ipl_02",
	"h4_se_ipl_03",
	"h4_se_ipl_04",
	"h4_se_ipl_05",
	"h4_se_ipl_06",
	"h4_se_ipl_07",
	"h4_se_ipl_08",
	"h4_se_ipl_09",
	"h4_sw_ipl_00",
	"h4_sw_ipl_01",
	"h4_sw_ipl_02",
	"h4_sw_ipl_03",
	"h4_sw_ipl_04",
	"h4_sw_ipl_05",
	"h4_sw_ipl_06",
	"h4_sw_ipl_07",
	"h4_sw_ipl_08",
	"h4_sw_ipl_09",
	"h4_islandx_mansion",
	"h4_islandxtower_veg",
	"h4_islandx_sea_mines",
	"h4_islandx",
	"h4_islandx_barrack_hatch",
	"h4_islandxdock_water_hatch",
	"h4_beach_party"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAYO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local CayoPerico = false

	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		if #(Coords - vec3(4840.57,-5174.42,2.0)) <= 2000 then
			if not CayoPerico then
				for _,v in pairs(Island) do
					RequestIpl(v)
				end

				SetIslandHopperEnabled("HeistIsland",true)
				SetAiGlobalPathNodesType(1)
				SetDeepOceanScaler(0.0)
				LoadGlobalWaterType(1)
				CayoPerico = true
			end
		else
			if CayoPerico then
				for _,v in pairs(Island) do
					RemoveIpl(v)
				end

				SetIslandHopperEnabled("HeistIsland",false)
				SetAiGlobalPathNodesType(0)
				SetDeepOceanScaler(1.0)
				LoadGlobalWaterType(0)
				CayoPerico = false
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADRAPPEL
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if IsPedInAnyHeli(Ped) then
			TimeDistance = 1

			local Vehicle = GetVehiclePedIsUsing(Ped)
			if IsControlJustPressed(1,154) and not IsAnyPedRappellingFromHeli(Vehicle) and (GetPedInVehicleSeat(Vehicle,1) == Ped or GetPedInVehicleSeat(Vehicle,2) == Ped) then
				TaskRappelFromHeli(Ped,1)
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
local InfoList = {
	{
		["Props"] = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		["Coords"] = vec3(-1150.70,-1520.70,10.60)
	},{
		["Props"] = {
			"csr_beforeMission",
			"csr_inMission"
		},
		["Coords"] = vec3(-47.10,-1115.30,26.50)
	},{
		["Props"] = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		["Coords"] = vec3(-802.30,175.00,72.80)
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADIPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(InfoList) do
		local Interior = GetInteriorAtCoords(v["Coords"])
		LoadInterior(Interior)
		if v["Props"] then
			for _,i in pairs(v["Props"]) do
				EnableInteriorProp(Interior,i)
			end
		end
		RefreshInterior(Interior)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for _,Entity in pairs(GetGamePool("CPed")) do
			if (NetworkGetEntityOwner(Entity) == -1 or NetworkGetEntityOwner(Entity) == PlayerId()) and GetPedArmour(Entity) <= 0 and not NetworkGetEntityIsNetworked(Entity) then
				if IsPedInAnyVehicle(Entity) then
					local Vehicle = GetVehiclePedIsUsing(Entity)
					if NetworkGetEntityIsNetworked(Vehicle) then
						TriggerServerEvent("garages:Delete",NetworkGetNetworkIdFromEntity(Vehicle),GetVehicleNumberPlateText(Vehicle))
					else
						DeleteEntity(Vehicle)
					end
				else
					DeleteEntity(Entity)
				end
			end
		end
		for _,Vehicle in pairs(GetGamePool("CVehicle")) do
			if GetEntityModel(Vehicle) ~= GetHashKey("metrotrain") then
				if (NetworkGetEntityOwner(Vehicle) == -1 or NetworkGetEntityOwner(Vehicle) == PlayerId()) and not NetworkGetEntityIsNetworked(Vehicle) and GetVehicleNumberPlateText(Vehicle) ~= "PDMSPORT" then
					DeleteEntity(Vehicle)
				end
			end
		end
		Wait(5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETIRARSOMAMBIENTE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
        SetAudioFlag("PoliceScannerDisabled",true);
        Wait(0)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_max = 80.0
local fov_min = 10.0
local speed_ud = 3.0
local zoomspeed = 2.0
local vehCamera = false
local fov = (fov_max + fov_min) * 0.5
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local waitPacket = 500
		local Ped = PlayerPedId()
		if IsPedInAnyHeli(Ped) then
			waitPacket = 4

			local veh = GetVehiclePedIsUsing(Ped)
			SetVehicleRadioEnabled(veh,false)

			if IsControlJustPressed(1,51) then
				TriggerEvent("hud:Active",false)
				vehCamera = true
			end

			if IsControlJustPressed(1,154) then
				if GetPedInVehicleSeat(veh,1) == Ped or GetPedInVehicleSeat(veh,2) == Ped then
					TaskRappelFromHeli(Ped,1)
				end
			end

			if vehCamera then
				SetTimecycleModifierStrength(0.3)
				SetTimecycleModifier("heliGunCam")

				local scaleform = RequestScaleformMovie("HELI_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Wait(1)
				end

				local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
				AttachCamToEntity(cam,veh,0.0,0.0,-1.5,true)
				SetCamRot(cam,0.0,0.0,GetEntityHeading(veh))
				SetCamFov(cam,fov)
				RenderScriptCams(true,false,0,1,0)
				PushScaleformMovieFunction(scaleform,"SET_CAM_LOGO")
				PushScaleformMovieFunctionParameterInt(0)
				PopScaleformMovieFunctionVoid()

				while vehCamera do
					if IsControlJustPressed(1,51) then
						TriggerEvent("hud:Active",true)
						vehCamera = false
					end

					local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
					CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					HideHudAndRadarThisFrame()
					HideHudComponentThisFrame(19)
					PushScaleformMovieFunction(scaleform,"SET_ALT_FOV_HEADING")
					PushScaleformMovieFunctionParameterFloat(GetEntityCoords(veh).z)
					PushScaleformMovieFunctionParameterFloat(zoomvalue)
					PushScaleformMovieFunctionParameterFloat(GetCamRot(cam,2).z)
					PopScaleformMovieFunctionVoid()
					DrawScaleformMovieFullscreen(scaleform,255,255,255,255)

					Wait(1)
				end

				ClearTimecycleModifier()
				fov = (fov_max + fov_min) * 0.5
				RenderScriptCams(false,false,0,1,0)
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				DestroyCam(cam,false)
				SetNightvision(false)
				SetSeethrough(false)
			end
		end

		Wait(waitPacket)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINPUTROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0,rotation.x + rightAxisY * -1.0 * (3.0) * (zoomvalue + 0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLEZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
function HandleZoom(cam)
	if IsControlJustPressed(1,241) then
		fov = math.max(fov - zoomspeed,fov_min)
	end

	if IsControlJustPressed(1,242) then
		fov = math.min(fov + zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov - current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov + (fov - current_fov) * 0.05)
end