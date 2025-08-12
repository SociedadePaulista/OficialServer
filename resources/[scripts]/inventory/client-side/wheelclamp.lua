-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- 
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("AttachEntityToWheelClamp")
-- AddEventHandler("AttachEntityToWheelClamp",function(WheelClamp, Vehicle)

--     local Vehicle = LoadNetwork(Vehicle)
--     local WheelClamp = LoadNetwork(WheelClamp)
--     local Bone = GetEntityBoneIndexByName(Vehicle,"wheel_lf")
--     local Rotation = GetEntityBoneRotation(Vehicle, Bone)
--     local Heading = GetEntityHeading(Vehicle) 
--     local isNegativeX = Rotation.x < 0
--     local isNegativeZ = Rotation.z < 0
--     local WheelRotation = 0
--     if Heading > 180 then
--         WheelRotation = isNegativeX and (isNegativeZ and -(Rotation.x + 180) or Rotation.x) or (isNegativeZ and (90 - Rotation.x) + 90 or Rotation.x)
--     else
--         WheelRotation = isNegativeX and (isNegativeZ and Rotation.x or -(Rotation.x + 180)) or (isNegativeZ and Rotation.x or (90 - Rotation.x) + 90)
--     end
    
--     WheelRotation = (WheelRotation < 0 and WheelRotation + 360 or WheelRotation) + 180
    
--     local AngleRad = WheelRotation * math.pi / 180.0
--     local offsetX = math.sin(-AngleRad) * -0.15 - math.cos(AngleRad) * -0.20
--     local offsetY = math.cos(-AngleRad) * -0.15 - math.sin(AngleRad) * -0.20

--     AttachEntityToEntity(WheelClamp, Vehicle, Bone, 0.0, offsetX, offsetY, WheelRotation, 0.0, 0.0, false, false, false, false, 2, true)


--     --[[ local WheelRotation = 0
--     local Rotation = GetEntityBoneRotation(LoadNetwork(Vehicle), Bone)
--     local Heading = GetEntityHeading(LoadNetwork(Vehicle)) 
--     if Heading > 180 then
--         if Rotation.x < 0 then
--             if Rotation.z < 0 then
--                 WheelRotation = -(Rotation.x + 180)
--             else
--                 WheelRotation = Rotation.x
--             end
--         else
--             if Rotation.z < 0 then
--                 WheelRotation = (90 - Rotation.x) + 90
--             else
--                 WheelRotation = Rotation.x
--             end
--         end
--     else
--         if Rotation.x < 0 then
--             if Rotation.z < 0 then
--                 WheelRotation = Rotation.x
--             else
--                 WheelRotation = -(Rotation.x + 180)
--             end
--         else
--             if Rotation.z < 0 then
--                 WheelRotation = Rotation.x
--             else
--                 WheelRotation = (90-Rotation.x) + 90
--             end
--         end
--     end
  
--     WheelRotation = WheelRotation < 0 and WheelRotation + 360 or WheelRotation
--     WheelRotation = WheelRotation + 180

--     local AngleRad = math.rad(WheelRotation)
--     local offsetX = (math.sin(-AngleRad) * -0.15) - (math.cos(AngleRad) * -0.2)
--     local offsetY = (math.cos(-AngleRad) * -0.15) - (math.sin(AngleRad) * -0.2)


--     AttachEntityToEntity(LoadNetwork(WheelClamp), LoadNetwork(Vehicle), Bone, 0.0, offsetX or 0, offsetY or 0, WheelRotation, 0.0, 0.0, false, false, false, false, 2, true); ]]
-- end)


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- ADDSTATEBAGCHANGEHANDLER
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- AddStateBagChangeHandler("WheelClamp",nil,function(Name,Key,Value)
--     if Displayed[Number] then
--         if DoesEntityExist(Displayed[Number]) then
--             DeleteEntity(Displayed[Number])
--         end
--         exports["target"]:RemCircleZone("Farmer:"..Number)
--         Displayed[Number] = nil
--     end
-- end)

-- -- CreateThread(function()
-- --     while true do
-- --         local Ped = PlayerPedId()
-- --         local TimeDistance = IsPedInAnyVehicle(Ped) and 0 or 999
-- --         if TimeDistance == 0 then
-- --             local vehicle = GetVehiclePedIsUsing(Ped)
-- --             local minDim, maxDim = GetModelDimensions(GetEntityModel(vehicle))
-- --             local forwardVector, rightVector, upVector, position = GetEntityMatrix(vehicle)        
-- --             local wheelCenter = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "wheel_lf")) -- cordenada da roda


-- --             local deslocamentoX = (wheelCenter.x - position.x) -- deslocamento x para chega a roda
-- --             local deslocamentoY = (wheelCenter.y - position.y)  -- deslocamento y para chega a roda
-- --             local deslocamentoZ = (wheelCenter.z - position.z) -- deslocamento z para chega a roda
    

-- --             DrawText3D(vec3(position.x + deslocamentoX, position.y + deslocamentoY, position.z + deslocamentoZ), "Centro") -- cria o texto no centro da roda
-- --             DrawText3D(vec3(position.x + deslocamentoX, position.y + deslocamentoY,  position.z + minDim.z), "Borda") -- deveria ser o chao da roda - porem varia de acordo a rotação e isso e um problema


-- --             --[[ local rearLeftBottom = GetOffsetFromEntityInWorldCoords(vehicle, deslocamentoX, deslocamentoY, minDim.z)
-- --             DrawText3D(vector3(rearLeftBottom.x, rearLeftBottom.y, rearLeftBottom.z), "34234") ]]

-- --             print(forwardVector, "1")
-- --             print(rightVector, "2")
-- --             print(upVector, "3")


-- --             -- Cálculo da posição da borda considerando todas as rotações
-- --             local bordaX = position.x + (minDim.x * rightVector.x) + (maxDim.y * forwardVector.x) + (minDim.z * upVector.x)
-- --             local bordaY = position.y + (minDim.x * rightVector.y) + (maxDim.y * forwardVector.y) + (minDim.z * upVector.y)
-- --             local bordaZ = position.z + (minDim.x * rightVector.z) + (maxDim.y * forwardVector.z) + (minDim.z * upVector.z)
-- --             DrawText3D(vec3(bordaX, bordaY, bordaZ), "Canto")
        

-- --         end
-- --         Wait(TimeDistance)
-- --     end
-- -- end)


-- local rotatingX, rotatingY, rotatingZ = 0.0, 0.0, 0.0
-- local isRotationActive = false

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)

--         if IsControlJustPressed(0, 38) then -- Tecla 'E' para ativar/desativar a rotação (19 é o código da tecla R)

--             isRotationActive = not isRotationActive

--             if isRotationActive then
--                 FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
--             else
--                 FreezeEntityPosition(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
--             end

--         end

--         if isRotationActive then
--             if IsControlJustPressed(0, 173) then -- Tecla seta para baixo para o eixo Y (173 é o código da seta para baixo)
--                 rotatingY = (rotatingY + 1.0) % 360.0
--                 RotateVehicle()
--             elseif IsControlJustPressed(0, 174) then -- Tecla seta para esquerda para o eixo Z (174 é o código da seta para esquerda)
--                 rotatingZ = (rotatingZ + 1.0) % 360.0
--                 RotateVehicle()
--             elseif IsControlJustPressed(0, 175) then -- Tecla seta para direita para o eixo X (175 é o código da seta para direita)
--                 rotatingX = (rotatingX + 1.0) % 360.0
--                 RotateVehicle()
--             end
--         end
--     end
-- end)

-- function RotateVehicle()
--     local player = GetPlayerPed(-1)
--     local vehicle = GetVehiclePedIsIn(player, false)

--     if DoesEntityExist(vehicle) then
--         SetEntityRotation(vehicle, rotatingX, rotatingY, rotatingZ, 2, true)
--         TriggerEvent("chatMessage", "Sistema", {255, 0, 0}, "Veículo rotacionado - X: " .. rotatingX .. " Y: " .. rotatingY .. " Z: " .. rotatingZ)
--     else
--         TriggerEvent("chatMessage", "Sistema", {255, 0, 0}, "Você precisa estar em um veículo para usar este comando.")
--     end
-- end

-- function DrawText3D(Coords,Text)
-- 	local onScreen,x,y = World3dToScreen2d(Coords["x"],Coords["y"],Coords["z"])
-- 	if onScreen then
-- 		SetTextFont(4)
-- 		SetTextCentre(true)
-- 		SetTextProportional(1)
-- 		SetTextScale(0.35,0.35)
-- 		SetTextColour(255,255,255,150)
-- 		SetTextEntry("STRING")
-- 		AddTextComponentString(Text)
-- 		EndTextCommandDisplayText(x,y)
-- 		local Width = string.len(Text) / 160 * 0.45
-- 		DrawRect(x,y + 0.0125,Width,0.03,15,15,15,175)
-- 	end
-- end 

-- -- CreateThread(function()
-- --     while true do
-- --         local TimeDistance = 999
-- --         local Ped = PlayerPedId()

-- --         if IsPedInAnyVehicle(Ped) then
-- --             TimeDistance = 0
-- --             local vehicle = GetVehiclePedIsUsing(Ped)
-- --             local Rotation = GetEntityRotation(vehicle)
-- --             local vehModel = GetEntityModel(vehicle)
-- --             local minDim, maxDim = GetModelDimensions(vehModel)
          
-- --             local CoordsWheel = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "wheel_lf"))
-- --             DrawText3D(CoordsWheel, "Wheel")
            


-- --             local minDimZFromWheel = (minDim.z - (CoordsWheel.z - GetEntityCoords(vehicle).z))
-- --             DrawText3D(vec3(CoordsWheel.x, CoordsWheel.y, (CoordsWheel.z + minDimZFromWheel)), "Wheel-2")



            
-- --             local pos = GetEntityCoords(vehicle)
-- --             local rearLeftBottom = getOffsetFromEntityInWorldCoords(vehicle, minDim.x, maxDim.y, minDim.z)
-- --             DrawText3D(vector3(rearLeftBottom.x, rearLeftBottom.y, rearLeftBottom.z), "bottom")


-- --             local AngleRad = math.rad(Rotation.x)
-- --             local newX = CoordsWheel.y + ((math.sin(-AngleRad) * minDim.z) - (math.cos(AngleRad) * -minDim.z))
-- --             local newY = CoordsWheel.z + ((math.cos(-AngleRad) * minDim.z) - (math.sin(AngleRad) * -minDim.z))
-- --             --[[ DrawText3D(vector3(CoordsWheel.x, newX, newY), "Wheel-3") ]]


-- --             --[[ local AngleRad = math.rad(Rotation.x)
-- --             local newX = CoordsWheel.y + ((math.sin(-AngleRad) * minDimZFromWheel) - (math.cos(AngleRad) * -minDimZFromWheel))
-- --             local newY = CoordsWheel.z + ((math.cos(-AngleRad) * minDimZFromWheel) - (math.sin(AngleRad) * -minDimZFromWheel))
-- --             DrawText3D(vector3(CoordsWheel.x, newX, newY), "Wheel-4")
        
-- --             local minDimZFromWheel = (minDim.z - (CoordsWheel.z - GetEntityCoords(vehicle).z))
-- --             DrawText3D(vec3(CoordsWheel.x, CoordsWheel.y, (CoordsWheel.z + minDimZFromWheel)), "Wheel-2") ]]
-- --         end

-- --         Wait(TimeDistance)
-- --     end
-- -- end)
