-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local WheelClamps = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:WheelClamps
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:WheelClamps")
AddEventHandler("inventory:WheelClamps",function(Entity, Model)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
        Player(source)["state"]["Cancel"] = true
        Player(source)["state"]["Buttons"] = true
        TriggerClientEvent("Progress",source,3500)
        vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},false)
        SetTimeout(3500,function()

            local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
            local Coords = GetEntityCoords(Vehicle)
            if WheelClamps[Vehicle] ~= nil then
                DeleteEntity(WheelClamps[Vehicle])
                WheelClamps[Vehicle] = nil
            else
                WheelClamps[Vehicle] = CreateObject(GetHashKey(Model), vec3(Coords.x,Coords.y,Coords.z-2), true, true, false)
                while not DoesEntityExist(WheelClamps[Vehicle]) do Wait(0) end
                TriggerClientEvent("AttachEntityToWheelClamp",-1, NetworkGetNetworkIdFromEntity(WheelClamps[Vehicle]), NetworkGetNetworkIdFromEntity(Vehicle))
            end
            
            vRPC.removeObjects(source)
            Player(source)["state"]["Cancel"] = false
            Player(source)["state"]["Buttons"] = false
        end)
	end
end)