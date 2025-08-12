local Config = {}

Config.CarWashAmounth = 20
Config.Locations = {
    {
        coords = vector3(26.58, -1391.88, 28.37),
    },
    {
        coords = vector3(169.35, -1716.72, 28.30),
    },
    {
        coords = vector3(-699.78, -933.04, 18.02),
    },
    {
        coords = vector3(1361.88, 3592.44, 33.95),
    },
    {
        coords = vector3(1694.55, 3589.8, 34.62),
    }
}

Citizen.CreateThread(function()
    for k, v in pairs(Config.Locations) do
        carWash = AddBlipForCoord(Config.Locations[k]["coords"]["x"], Config.Locations[k]["coords"]["y"], Config.Locations[k]["coords"]["z"])
        SetBlipSprite (carWash, 100)
        SetBlipDisplay(carWash, 4)
        SetBlipScale  (carWash, 0.75)
        SetBlipAsShortRange(carWash, true)
        SetBlipColour(carWash, 37)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Lava Jato")
        EndTextCommandSetBlipName(carWash)
    end
end)

local Wait = false
local moneyismoneylan = false
local yakindakiObjeler = {}

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        local time = 1000
        for k, v in pairs(Config.Locations) do
            local PlayerPed = PlayerPedId()
            local VehicleInPed = GetVehiclePedIsIn(PlayerPed)
            local PlayerCoords = GetEntityCoords(PlayerPed)
            local distance = #(PlayerCoords - vector3(Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z))
            if distance < 50 then 
                time = 1
                DrawMarker(2, Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z+0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 71, 155, 155, 185, false, true, 2, false, false, false, false)
                if distance < 2.5 then
                    DrawText3Dcarwash(Config.Locations[k]['coords'].x, Config.Locations[k]['coords'].y, Config.Locations[k]['coords'].z+1, "~b~[E] ~w~Lava Jato ~g~"..Config.CarWashAmounth.." R$ ~w~.. ")
                    if IsControlJustReleased(0, 38) and not Wait then
                        TriggerServerEvent("magicarrow-carwash:moneycontrol")
                    end
                end
            end
        end
        Citizen.Wait(time)
    end
end)

RegisterNetEvent('magicarrow-carwash:washprop')
AddEventHandler('magicarrow-carwash:washprop', function()
    local playerPed = PlayerPedId()
    yakindakiObjeler[1] = CreateObject("prop_carwash_roller_vert", vector3(26.32478, -1389.74, 29.366), true)
    SetEntityHeading(yakindakiObjeler[1], GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(yakindakiObjeler[1])
    yakindakiObjeler[2] = CreateObject("prop_carwash_roller_vert", vector3(26.23478, -1393.70, 29.314), true)
    SetEntityHeading(yakindakiObjeler[2], GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(yakindakiObjeler[2])
    yakindakiObjeler[3] = CreateObject("prop_carwash_roller_vert", vector3(-697.705, -932.892, 19.013), true)
    SetEntityHeading(yakindakiObjeler[3], GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(yakindakiObjeler[3])
    yakindakiObjeler[4] = CreateObject("prop_carwash_roller_vert", vector3(-702.270, -933.074, 19.013), true)
    SetEntityHeading(yakindakiObjeler[3], GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(yakindakiObjeler[4])
end)
 

RegisterNetEvent('magicarrow-carwash:waterefectstart')
AddEventHandler('magicarrow-carwash:waterefectstart', function()
	local ped = PlayerPedId()
	TriggerServerEvent("magicarrow-carwash-server:watereffect", GetEntityCoords(ped))
    Citizen.Wait(200)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "washingsounds", 0.2)
end)

RegisterNetEvent("magicarrow-carwash:watereffect")
AddEventHandler("magicarrow-carwash:watereffect", function(coords)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
        local Wash = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash, 100.0)
		SetParticleFxLoopedColour(Wash, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:watereffect2")
AddEventHandler("magicarrow-carwash:watereffect2", function(coords)
    Citizen.Wait(1000)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
		local Wash2 = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash2, 1.0)
		SetParticleFxLoopedColour(Wash2, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash2, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:watereffect3")
AddEventHandler("magicarrow-carwash:watereffect3", function(coords)
    Citizen.Wait(2000)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
		local Wash3 = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash3, 1.0)
		SetParticleFxLoopedColour(Wash3, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash3, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:watereffect4")
AddEventHandler("magicarrow-carwash:watereffect4", function(coords)
    Citizen.Wait(3500)
	if #(coords - GetEntityCoords(PlayerPedId())) < 150 then
		SetPtfxAssetNextCall("core")
		local Wash4 = StartParticleFxLoopedAtCoord("water_splash_vehicle", coords.x,coords.y, coords.z+1.0, 10.0, 10.0, 10.0, 15.0, true, false, false, true)
		SetParticleFxLoopedAlpha(Wash4, 1.0)
		SetParticleFxLoopedColour(Wash4, 255.0, 255.0, 255.0, 0)
        Citizen.Wait(1000)
		StopParticleFxLooped(Wash4, 0)
	end
end)

RegisterNetEvent("magicarrow-carwash:moneyisaccepted")
AddEventHandler("magicarrow-carwash:moneyisaccepted", function()
    local PlayerPed = PlayerPedId()
    local VehicleInPed = GetVehiclePedIsIn(PlayerPed)
    local PlayerCoords = GetEntityCoords(PlayerPed)
   
    TriggerEvent("magicarrow-carwash:washprop")
    TriggerEvent("magicarrow-carwash:waterefectstart")
    Wait = true


    TriggerEvent("Progress",6250)
    SetTimeout(6250,function()
        SetVehicleDirtLevel(VehicleInPed)
        SetVehicleUndriveable(VehicleInPed, false)
        WashDecalsFromVehicle(VehicleInPed, 1.0)
        DeleteObject()
        Wait = false
    end)

end)

local TakeObject = {
    {objeAdi = "Wash", hash = -382832258},
}

function DeleteObject()
    for x=1, #yakindakiObjeler do
        local yakinObjeHash = GetEntityModel(yakindakiObjeler[x])
        for i=1, #TakeObject do
            if TakeObject[i].hash == yakinObjeHash then
                DeleteEntity(yakindakiObjeler[x])
                break
            end
        end
    end
end

function DrawText3Dcarwash(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end