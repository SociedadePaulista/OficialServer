-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPS = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("admin",Creative)
vSERVER = Tunnel.getInterface("ambulancejob")

ReviveEvent = 'hospital:client:Revive'


function GetClosestPlayerFunction()
    local ped = vRP.ClosestPed(2)
    if ped then
        return ped, 2.0
    end
    return -1
end

function GetClosestVehicleFunction(coords, modelFilter)
    return vRP.ClosestVehicle(5)
end


