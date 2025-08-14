local xmas1 = false
local normal1 = false
local xmas2 = false
local normal2 = false

local interior_coords1 = vector3(-1232.25, -1180.17, 7.66)
local interior_coords2 = vector3(1886.32, 3911.78, 36.844)

local function getInteriorWithRetries(coords, maxAttempts, delay)
    local attempts = 0
    local interior = GetInteriorAtCoords(coords.x, coords.y, coords.z)
    while interior == 0 and attempts < maxAttempts do
        Citizen.Wait(delay)
        interior = GetInteriorAtCoords(coords.x, coords.y, coords.z)
        attempts = attempts + 1
    end
    return interior
end

Citizen.CreateThread(function()
    local maxAttempts = 10
    local delay = 100
    
    local interior1 = getInteriorWithRetries(interior_coords1, maxAttempts, delay)
    local interior2 = getInteriorWithRetries(interior_coords2, maxAttempts, delay)
    
    if interior1 ~= 0 then
        DisableInteriorProp(interior1, "xmas")
        EnableInteriorProp(interior1, "normal")
        RefreshInterior(interior1)
    end
    
    if interior2 ~= 0 then
        DisableInteriorProp(interior2, "xmas")
        EnableInteriorProp(interior2, "normal")
        RefreshInterior(interior2)
    end
end)

local function toggleInterior(eventName, coords, prop)
    RegisterNetEvent(eventName, function()
        local interior = GetInteriorAtCoords(coords.x, coords.y, coords.z)
        if interior == 0 then return end
        
        if prop == "xmas" then
            xmas1 = not xmas1
            EnableInteriorProp(interior, "xmas")
            DisableInteriorProp(interior, "normal")
        elseif prop == "normal" then
            normal1 = not normal1
            EnableInteriorProp(interior, "normal")
            DisableInteriorProp(interior, "xmas")
        end
        RefreshInterior(interior)
    end)
end

if GetInteriorAtCoords(interior_coords1.x, interior_coords1.y, interior_coords1.z) ~= 0 then
    toggleInterior("rdzk:xmas1", interior_coords1, "xmas")
    toggleInterior("rdzk:normal1", interior_coords1, "normal")
end

if GetInteriorAtCoords(interior_coords2.x, interior_coords2.y, interior_coords2.z) ~= 0 then
    toggleInterior("rdzk:xmas2", interior_coords2, "xmas")
    toggleInterior("rdzk:normal2", interior_coords2, "normal")
end

--[[
RegisterCommand("rdzk_ipl_xmas1", function()
    TriggerServerEvent("rdzk:xmas1")
end, false)

RegisterCommand("rdzk_ipl_normal1", function()
    TriggerServerEvent("rdzk:normal1")
end, false)

RegisterCommand("rdzk_ipl_xmas2", function()
    TriggerServerEvent("rdzk:xmas2")
end, false)

RegisterCommand("rdzk_ipl_normal2", function()
    TriggerServerEvent("rdzk:normal2")
end, false)
]]