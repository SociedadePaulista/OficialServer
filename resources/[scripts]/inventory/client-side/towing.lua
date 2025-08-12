local blacklistedClasses = {
    8, -- Motocicletas
    13, -- Ciclos
    14, -- Barcos
    15, -- Helicópteros
    16, -- Aviões
    21, -- Trens
}

local ropeLength = 7.0
local maxTowingSpeed =  50.0

local VehOne = nil
local VehTwo = nil

local ropes = {}
local tempRope = nil
local localRope = nil
local driverPed = nil
local isPlayerInVehicle = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Towrope",function(Vehicle,Connect)
    if Connect ~= "Front" then
        if VehOne == Vehicle then
            return true
        end
    else
        if VehTwo == Vehicle then
            return true
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
exports("TowropeAtm",function()
    if VehOne then
        return VehOne
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
exports("DetachRope",function()
    DetachRope()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('inventory:Towrope')
AddEventHandler('inventory:Towrope', function(Entity,Connect)
    local Vehicle = Entity[3]
    local Class = GetVehicleClass(Vehicle)
    if not Contains(blacklistedClasses, Class) then
        TaskTurnPedToFaceEntity(PlayerPedId(), Vehicle, 1000)
        LoadAnim("mini@repair")
        TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 2.0, 2.0, -1, 1, 0, false, false, false)
        TriggerEvent("Progress",7000)
        SetTimeout(7000,function()
            ClearPedTasks(PlayerPedId())

            if Connect ~= "Front" then
   
                if VehOne == nil then
                    if VehTwo ~= Vehicle then
                        VehOne = Vehicle
                        if (VehOne == nil or VehTwo == nil) then
                            AttachTempRope(VehOne, true)
                        else
                            AttemptAttachRope()
                        end
            
                    else
                        VehOne = nil
                    end
                else
                    DetachRope()
                end
            else
                if VehTwo == nil then
                    if VehOne ~= Vehicle then
                        VehTwo = Vehicle
        
                        if (VehOne == nil or VehTwo == nil) then
                            AttachTempRope(VehTwo, false)
                        else
                            AttemptAttachRope()
                        end
        
               
                    else
                        VehTwo = nil
                    end
                else
                    DetachRope()
                end
               
            end

        end)

    end
end)


function DetachRope()
    if VehOne and VehTwo then
        TriggerServerEvent('towing:stopTow')
        DeleteRope(localRope)
        SetEntityMaxSpeed(VehOne, 99999.0)
        SetEntityMaxSpeed(VehTwo, 99999.0)
        localRope = nil
    elseif tempRope then
        DeleteRope(tempRope)
        tempRope = nil
    end
    if driverPed ~= nil then
        DeletePed(driverPed)
        driverPed = nil
    end
    VehOne = nil
    VehTwo = nil
end

function AttemptAttachRope()
    if VehOne and VehTwo then
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        SetRopesCreateNetworkWorldState(false)
        local veh1 = NetworkGetNetworkIdFromEntity(VehOne)
        local veh2 = NetworkGetNetworkIdFromEntity(VehTwo)
        TriggerServerEvent('towing:tow', veh1, veh2)
        if tempRope ~= nil then
            DeleteRope(tempRope)
            tempRope = nil
        end
    end
end

function AttachTempRope(entity, front)
    local playerPed = PlayerPedId()
    local bone = 'chassis'
    if front then
        bone = GetBoneRear(entity)
    else
        bone = GetBoneFront(entity)
    end
    local pos = GetEntityCoords(playerPed)
    if tempRope ~= nil then
        DeleteRope(tempRope)
        tempRope = nil
    end
    RopeLoadTextures()
    while not RopeAreTexturesLoaded() do
        Citizen.Wait(50)
    end
    local bonePos = GetWorldPositionOfEntityBone(entity, GetEntityBoneIndexByName(entity, bone))
    if GetDistanceBetweenCoords(bonePos, pos, true) <= ropeLength * 1.5 then
        tempRope = AddRope(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, ropeLength * 0.2, 1, ropeLength * 0.75, 0.1, 10.0, true, false, true, 1.0, false)
        AttachEntitiesToRope(tempRope, playerPed, entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, ropeLength - 2.0, true, true, 'IK_R_Hand', bone)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(250)
        local playerPed = PlayerPedId()
        if tempRope ~= nil then
            local speed = 0
            local coords = nil
            if VehOne ~= nil then
                speed = GetEntitySpeed(VehOne)
                coords = GetWorldPositionOfEntityBone(VehOne, GetEntityBoneIndexByName(VehOne, GetBoneRear(VehOne)))
            elseif VehTwo ~= nil then
                speed = GetEntitySpeed(VehTwo)
                coords = GetWorldPositionOfEntityBone(VehTwo, GetEntityBoneIndexByName(VehTwo, GetBoneFront(VehTwo)))
            end
            if coords.x == 0 then
                if VehOne ~= nil then
                    coords = GetEntityCoords(VehOne)
                elseif VehTwo ~= nil then
                    coords = GetEntityCoords(VehTwo)
                end
            end
            local pullingDistance = GetDistanceBetweenCoords(GetWorldPositionOfEntityBone(playerPed, GetEntityBoneIndexByName(playerPed, 'IK_R_Hand')), coords)
            if (speed >= 5.0 and pullingDistance > (ropeLength - 2.1)) or (speed > 20.0) or (pullingDistance > ropeLength * 1.75) then
                local ragdoll = true
                DetachRope()
                Citizen.CreateThread(function()
                    while ragdoll do
                        Citizen.Wait(100)
                        velocity = GetEntityVelocity(playerPed)
                        if VehOne ~= nil then
                            velocity = GetEntityVelocity(VehOne)
                        elseif VehTwo ~= nil then
                            velocity = GetEntityVelocity(VehTwo)
                        end
                        SetEntityVelocity(playerPed, velocity.x * 1.25, velocity.y * 1.25, velocity.z * 1.25)
                        SetPedToRagdoll(playerPed, 1000, 1000, 0, true, true, true)
                    end
                end)
                Citizen.Wait(1000)
                VehOne = nil
                VehTwo = nil
                ragdoll = false
            elseif pullingDistance > (ropeLength * 1.3) and coords.x > 0 then
                DetachRope()
            end
        end
        isPlayerInVehicle = IsPedInAnyVehicle(playerPed)
        local potentialVehicles = {}
        if isPlayerInVehicle or driverPed ~= nil then
            for k, rope in pairs(ropes) do
                if isPlayerInVehicle then
                    table.insert(potentialVehicles, rope['veh2'])
                    local usingVeh = GetVehiclePedIsIn(playerPed, false)
                    if usingVeh == rope['veh1'] then
                        if GetPedInVehicleSeat(rope['veh2'], -1) == 0 then
                            local vehCoords = GetEntityCoords(rope['veh2'])
                            local pos = NetworkGetPlayerCoords(GetNearestPlayerToEntity(rope['veh2']))
                            if driverPed == nil and (GetDistanceBetweenCoords(vehCoords, pos) >= 3.0) then
                                CreateDriverPed(rope['veh1'], rope['veh2'])
                                NetworkRequestControlOfEntity(rope['veh2'])
                            end
                        end
                    end
                end
            end
        end
        if not isPlayerInVehicle then
            if driverPed ~= nil then
                DeletePed(driverPed)
                driverPed = nil
            end
        end
        if driverPed ~= nil then
            if not Contains(potentialVehicles, GetVehiclePedIsIn(driverPed)) then
                DeletePed(driverPed)
                driverPed = nil
            end

            if driverPed ~= nil then
                local npcCoords = GetEntityCoords(driverPed)
                local pos = NetworkGetPlayerCoords(GetNearestPlayerToEntity(driverPed))
                if GetDistanceBetweenCoords(npcCoords, pos) <= 3.0 then
                    DeletePed(driverPed)
                    driverPed = nil
                end
            end
        end
    end
end)

RegisterNetEvent('towing:removeRope')
AddEventHandler('towing:removeRope', function(id, veh1_, veh2_)
    for k, rope in pairs(ropes) do
        if rope.id == id then
            DeleteRope(rope.rope)
            ropes[k] = nil
            if NetworkDoesEntityExistWithNetworkId(veh1_) and NetworkDoesEntityExistWithNetworkId(veh2_) then
                local veh1 = NetworkGetEntityFromNetworkId(veh1_)
                local veh2 = NetworkGetEntityFromNetworkId(veh2_)
                SetEntityMaxSpeed(veh1_, 99999.0)
                SetEntityMaxSpeed(veh2_, 99999.0)
            end
        end
    end
end)

RegisterNetEvent('towing:makeRope')
AddEventHandler('towing:makeRope', function(veh1_, veh2_, id, owner)
    for k, rope in pairs(ropes) do
        if rope.id == id then
            DeleteRope(rope.rope)
            ropes[k] = nil
            if NetworkDoesEntityExistWithNetworkId(veh1_) and NetworkDoesEntityExistWithNetworkId(veh2_) then
                local veh1 = NetworkGetEntityFromNetworkId(veh1_)
                local veh2 = NetworkGetEntityFromNetworkId(veh2_)
                if veh1 ~= 0 then
                    SetEntityMaxSpeed(veh1, 99999.0)
                end
                if veh2 ~= 0 then
                    SetEntityMaxSpeed(veh2, 99999.0)
                end
            end
        end
    end

    if NetworkDoesEntityExistWithNetworkId(veh1_) and NetworkDoesEntityExistWithNetworkId(veh2_) then
        local veh1 = NetworkGetEntityFromNetworkId(veh1_)
        local veh2 = NetworkGetEntityFromNetworkId(veh2_)

        if (veh1 ~= nil and veh1 ~= 0 and veh2 ~= nil and veh2 ~= 0) then
            SetEntityMaxSpeed(veh1, maxTowingSpeed / 2.3)
            SetEntityMaxSpeed(veh2, maxTowingSpeed / 2.3)
            local pos = GetEntityCoords(veh1)
            local coords1 = GetWorldPositionOfEntityBone(veh1, GetEntityBoneIndexByName(veh1, GetBoneRear(veh1)))
            local coords2 = GetWorldPositionOfEntityBone(veh2, GetEntityBoneIndexByName(veh2, GetBoneFront(veh2)))
            local distance = GetDistanceBetweenCoords(coords1, coords2, true)
            if distance <= (ropeLength * 3) then
                local bone1 = GetBoneRear(veh1)
                local bone2 = GetBoneFront(veh2)
                RopeLoadTextures()
                while not RopeAreTexturesLoaded() do
                    Citizen.Wait(50)
                end
                local rope = AddRope(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, ropeLength * 0.3, 1, ropeLength, 0.1, 10.0, true, false, true, 1.0, false)
                AttachEntitiesToRope(rope, veh1, veh2, 0.0, 0.0, 0.1, 0.0, 0.0, 0.1, ropeLength, false, false, bone1, bone2)
                if owner then
                    localRope = rope
                end
                local ropeObject = { rope = rope, id = id, veh1 = veh1, veh2 = veh2 }
                table.insert(ropes, ropeObject)
                SetVehicleBrake(veh2, false)
            else
                if owner then
                    DetachRope()
                end
            end
        end
    else
        if owner then
            DetachRope()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isPlayerInVehicle or driverPed ~= nil then
            for k, rope in pairs(ropes) do
                if driverPed ~= nil then
                    if (not IsPedInAnyVehicle(driverPed) or GetVehiclePedIsIn(driverPed) ~= rope['veh2']) or IsPedBeingJacked(driverPed) then
                        DeletePed(driverPed)
                        driverPed = nil
                    end
                    SetVehicleEngineOn(rope['veh2'], false, true, false)
                    SetVehicleBrake(rope['veh2'], false)
                    SetVehicleHandbrake(rope['veh2'], false)
                end
            end
        end
    end
end)

function GetBoneFront(veh)
    local bones = {
        'attach_male',
        'neon_f',
        'overheat',
        'overheat2',
        'rope_attach_a',
        'rope_attach_b',
        'overheat',
        'engine',
        'bonnet',
        'bumper_f',
        'transmission_f',
        'chassis_dummy',
    }
    for i, bone in pairs(bones) do
        local pos = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, bone))
        if pos.x ~= 0.0 and pos.x ~= 0 and pos.x ~= nil and (pos.x > 20.0 or pos.x < -20 or pos.z > 20 or pos.z < -20) then
            return bone
        end
    end
    return 'chassis_dummy'
end

function GetBoneRear(veh)
    local bones = {
        'attach_female',
        'neon_b',
        'tow_arm',
        'tow_mount_a',
        'tow_mount_b',
        'bumper_r',
        'exhaust',
        'boot',
        'petroltank',
        'chassis_dummy',
    }
    for i, bone in pairs(bones) do
        local pos = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, bone))
        if pos.x ~= 0.0 and pos.x ~= 0 and pos.x ~= nil and (pos.x > 20.0 or pos.x < -20 or pos.z > 20 or pos.z < -20) then
            return bone
        end
    end
    return 'chassis_dummy'
end

function CreateDriverPed(veh1, veh2)
    local npcHash = 'a_c_rabbit_01'
    modelHash = GetHashKey(npcHash)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Citizen.Wait(1)
    end
    if GetPedInVehicleSeat(veh2, -1) == 0 then
        driverPed = CreatePedInsideVehicle(veh2, 4, npcHash, -1, false, false)
        SetModelAsNoLongerNeeded(modelHash)
        SetEntityVisible(driverPed, false, 0)
        SetPedCanRagdoll(driverPed, false)
        SetEntityInvincible(driverPed, true)
        TaskVehicleFollow(driverPed, veh2, veh1, maxTowingSpeed, 786603, 10)
    end
end

function Contains(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
