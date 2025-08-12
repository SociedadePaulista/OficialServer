-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("spawn")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Camera = nil
local Vehicle = nil
local VehicleBack = nil
local isTrainMoving = false
local Characters = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATE
-----------------------------------------------------------------------------------------------------------------------------------------
local Locate = {
	{ ["Coords"] = vec3(272.16, 185.44, 104.67), ["name"] = "Vinewood Blvd Taxi Stand" },
	{ ["Coords"] = vec3(-1833.96, -1223.5, 13.02), ["name"] = "The Boardwalk" },
	{ ["Coords"] = vec3(145.62, 6563.19, 32.0), ["name"] = "Paleto Gas Station" },
	{ ["Coords"] = vec3(-214.24, 6178.87, 31.17), ["name"] = "Paleto Bus Stop" },
	{ ["Coords"] = vec3(1122.11, 2667.24, 38.04), ["name"] = "Harmony Motel" },
	{ ["Coords"] = vec3(453.29, -662.23, 28.01), ["name"] = "LS Bus Station" },
	{ ["Coords"] = vec3(-1266.53, 273.86, 64.66), ["name"] = "The Richman Hotel" },
	{ ["Coords"] = vec3(1642.29, 3581.19, 36.5), ["name"] = "Sandy Shores Motel" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMS
-----------------------------------------------------------------------------------------------------------------------------------------
local Anims = {
    { ["Dict"] = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", ["Name"] = "hi_dance_crowd_17_v2_male^2" },
    { ["Dict"] = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", ["Name"] = "high_center_down" },
    { ["Dict"] = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", ["Name"] = "med_center_up" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN:OPENED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("spawn:Opened",function()
    local Ped = PlayerPedId()
	LocalPlayer["state"]:set("Invincible",true,true)
    LocalPlayer["state"]:set("Invisible",true,true)
    SetEntityVisible(Ped,false,false)
    FreezeEntityPosition(Ped,true)
    SetEntityInvincible(Ped,true)


	DoScreenFadeOut(500)
	Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	SetCamRot(Camera, -14.0, 0.0, 250.0, 2)
	SetCamCoord(Camera, -3968.05, 2015.41, 502.3)
	SetCamActive(Camera,true)
	RenderScriptCams(true, false, 0, true, true)
	SetEntityCoordsNoOffset(Ped, -3971.05, 2015.65, 500.92, false, false, false, true)
	DoScreenFadeIn(2000)
	while IsScreenFadingIn() do Wait(0) end
	while IsScreenblurFadeRunning() do Wait(0) end
	TransitionFromBlurred(1)
	SetEntityCoordsNoOffset(Ped, vector3(-3972.28, 2017.22, 500.92), false, false, false, false)

	while not HasCollisionLoadedAroundEntity(Ped) do
		Wait(0)
	end
	
	while not HasCollisionForModelLoaded(GetHashKey("sp_01_station")) do
		Wait(0)
	end

	while not HasModelLoaded(GetHashKey("sp_01_station")) do
		Wait(100)
	end

    SetEntityCoordsNoOffset(PlayerPedId(), vector3(-3971.05, 2015.65, 500.92 ), false, false, false, false)
	SetCamRot(Camera, -14.0, 0.0, 250.0, 2)
	SetCamCoord(Camera, -3968.05, 2015.41, 502.3)
	StopCamShaking(Camera, true)
	SetCamFov(Camera, 50.0)
	RenderScriptCams(true, false, 0, true, true)
	Wait(200)
	SetEntityCoordsNoOffset(Ped, vector3(-3972.28, 2017.22, 500.92), false, false, false, false)

	TransitionFromBlurred(500)
	CleanUpArea()
	TriggerScreenblurFadeOut(1)
	
	spawnTrain()
	while isTrainMoving do
		Wait(10)
	end

    SetEntityCoords(Ped, -3963.87,2012.35,499.92, false,false,false,false)
    SetEntityHeading(Ped, 64.71)
    SetEntityHealth(Ped, 101)
    SetPedArmour(Ped,0)

    SetCamCoord(Camera, -3968.05, 2015.41, 502.3)
	SetCamFov(Camera, 50.0)
    RenderScriptCams(true,true,0,true,true)
    SetCamRot(Camera, -14.0, 0.0, 250.0, 2)

	Characters = vSERVER.Characters()
    if Characters and parseInt(#Characters) > 0 then
        Customization(Characters[1])
    end

    SendNUIMessage({ Action = "Spawn", Table = Characters })
    SetNuiFocus(true,true)

    if IsScreenFadedOut() then
        DoScreenFadeIn(1000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function spawnTrain()
	local tempmodel = GetHashKey("metrotrain")
	RequestModel(tempmodel)
	while not HasModelLoaded(tempmodel) do
		RequestModel(tempmodel)
		Citizen.Wait(0)
	end
    local coords = vector3(-3948.49,2036.35,499.1)
    vehicle = CreateVehicle(tempmodel, coords, 160.0, false, false)
    FreezeEntityPosition(vehicle, true)
    local heading = GetEntityHeading(vehicle)
    local coords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -11.0, 0.0)
    vehicleBack = CreateVehicle(tempmodel, coords, 158.0, false, false)
    FreezeEntityPosition(vehicleBack, true)
    AttachEntityToEntity(vehicleBack , vehicle , 51 , 0.0, -11.0, 0.0, 180.0, 180.0, 0.0, false, false, false, false, 0, true)
    Citizen.CreateThread(function()
    	isTrainMoving = true
	    for i=1,100 do
	    	local posoffset = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.0, 0.0)
	    	local setpos = VecLerp(-3948.49,2036.35,499.1, -3957.58,2008.75, 499.1, i/100, true)
	    	SetEntityCoords(vehicle,setpos)
	  		Wait(15)
	    end
	    isTrainMoving = false
	end)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function CleanUpArea()
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = #(playerCoords - pos)
        if canPedBeUsed(ped) and distance < 90.0 then
            distanceFrom = distance
            DeleteEntity(ped)

        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function canPedBeUsed(ped)
    if ped == nil then
        return false
    end
    if ped == PlayerPedId() then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function VecLerp(x1, y1, z1, x2, y2, z2, l, clamp)
    if clamp then
        if l < 0.0 then l = 0.0 end
        if l > 1.0 then l = 1.0 end
    end
    local x = Lerp(x1, x2, l)
    local y = Lerp(y1, y2, l)
    local z = Lerp(z1, z2, l)
    return vector3(x, y, z)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Lerp(a, b, t)
    return a + (b - a) * t
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function deleteTrain()
	if Vehicle ~= nil then
		DeleteEntity(Vehicle)
		DeleteEntity(VehicleBack)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("CharacterChosen",function(Data,Callback)
	if vSERVER.CharacterChosen(Data["Passport"]) then
		SendNUIMessage({ Action = "Close" })
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NEWCHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("NewCharacter",function(Data,Callback)
	vSERVER.NewCharacter(Data["name"],Data["lastname"],Data["sex"])
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWITCHCHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("SwitchCharacter",function(Data,Callback)
    if Characters and parseInt(#Characters) > 0 then
		for _,v in pairs(Characters) do
			if v["Passport"] == Data["Passport"] then
				Customization(v,true)
				break
			end
		end
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN:FINISH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("spawn:Finish")
AddEventHandler("spawn:Finish",function(Open,Coords)
	if Open then
		Locate[1] = { ["Coords"] = Coords, ["name"] = "" }
		for Number,v in pairs(Locate) do
			local Road = GetStreetNameAtCoord(v["Coords"]["x"],v["Coords"]["y"],v["Coords"]["z"])
			Locate[Number]["name"] = GetStreetNameFromHashKey(Road)
		end
		SetEntityCoordsNoOffset(PlayerPedId(),Locate[1]["Coords"]["x"],Locate[1]["Coords"]["y"],Locate[1]["Coords"]["z"],true,true,true)
		SetCamCoord(Camera,Locate[1]["Coords"]["x"],Locate[1]["Coords"]["y"],Locate[1]["Coords"]["z"] + 1)
		SendNUIMessage({ Action = "Location", Table = Locate })
		LocalPlayer["state"]:set("Invisible",true,true)
		SetEntityVisible(PlayerPedId(),false,false)
		SetCamRot(Camera,0.0,0.0,0.0,2)
		TriggerEvent("hud:Active",true)
	else
	
		SendNUIMessage({ Action = "Close" })
		SetNuiFocus(false,false)

		if DoesCamExist(Camera) then
			RenderScriptCams(false,false,0,false,false)
			SetCamActive(Camera,false)
			DestroyCam(Camera,false)
			Camera = nil
		end		

		SetEntityVisible(PlayerPedId(),true,false)
		LocalPlayer["state"]:set("Invisible",false,true)
		if Coords then
			TriggerEvent("hud:Active",true)
			SetEntityCoordsNoOffset(PlayerPedId(),Coords["x"],Coords["y"],Coords["z"],true,true,true)
		else
			TriggerServerEvent("vRP:BucketClient","Enter")
			FreezeEntityPosition(PlayerPedId(),true)
			SetEntityCoordsNoOffset(PlayerPedId(),402.55,-996.37,-99.01,true,true,true)
			SetEntityHeading(PlayerPedId(),180.00)
			TriggerEvent("barbershop:Open","spawn")
		end
	end
	deleteTrain()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Spawn",function(Data,Callback)
	if DoesCamExist(Camera) then
		RenderScriptCams(false,false,0,false,false)
		SetCamActive(Camera,false)
		DestroyCam(Camera,false)
		Camera = nil
	end
	SetEntityVisible(PlayerPedId(),true,false)
	LocalPlayer["state"]:set("Invisible",false,true)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chosen",function(Data,Callback)
	local Ped = PlayerPedId()
	local Index = Data["index"]
	SetEntityCoords(Ped,Locate[Index]["Coords"]["x"],Locate[Index]["Coords"]["y"],Locate[Index]["Coords"]["z"] - 1)
	SetCamCoord(Camera,Locate[Index]["Coords"]["x"],Locate[Index]["Coords"]["y"],Locate[Index]["Coords"]["z"] + 1)
	SetCamRot(Camera,0.0,0.0,0.0,2)
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
function Customization(Table,Check)
	if LoadModel(Table["Skin"]) then
		if Check then
			if GetEntityModel(PlayerPedId()) ~= GetHashKey(Table["Skin"]) then
				SetPlayerModel(PlayerId(),Table["Skin"])
				SetPedComponentVariation(PlayerPedId(),5,0,0,1)
			end
		else
			SetPlayerModel(PlayerId(),Table["Skin"])
			SetPedComponentVariation(PlayerPedId(),5,0,0,1)
		end

		local Ped = PlayerPedId()
		local Random = math.random(#Anims)
		if LoadAnim(Anims[Random]["Dict"]) then
			TaskPlayAnim(Ped,Anims[Random]["Dict"],Anims[Random]["Name"],8.0,8.0,-1,1,0,0,0,0)
		end

		-- exports["skinshop"]:Apply(Table["Clothes"],Ped)
		TriggerEvent("updateRoupas", Table["Clothes"])
		exports["barbershop"]:Apply(Table["Barber"],Ped)
		exports["tattooshop"]:Apply(Table["Tattoos"],Ped)

		SetEntityVisible(Ped,true,false)
		LocalPlayer["state"]:set("Invisible",false,true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN:INCREMENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("spawn:Increment")
AddEventHandler("spawn:Increment",function(Tables)
	for _,v in pairs(Tables) do
		Locate[#Locate + 1] = { ["Coords"] = v["Coords"], ["name"] = "" }
	end
end)