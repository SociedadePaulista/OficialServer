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
Tunnel.bindInterface("washing",Creative)
vSERVER = Tunnel.getInterface("washing")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Button = GetGameTimer()
local List = {
    ["Vanilla"] = vec3(95.75,-1293.2,29.27),
    ["Bahamas"] = vec3(-1365.54,-622.95,30.31),
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			local playerCoords = GetEntityCoords(Ped)
			for Permission,Coords in pairs(List) do
                if LocalPlayer["state"][Permission] then
                    local Distance = #(playerCoords - Coords)
                    if Distance <= 5 then
                        timeDistance = 1
                        DrawText3D(Coords["x"], Coords["y"], Coords["z"], "PRESSIONE [~g~E~w~] PARA LAVAR DINHEIRO")
                        if Distance <= 1.5 then
                            if IsControlJustPressed(1,38) and GetGameTimer() >= Button then
                                Button = GetGameTimer() + 500
                                RequestAnimDict("anim@amb@business@coc@coc_unpack_cut@")
                                while not HasAnimDictLoaded("anim@amb@business@coc@coc_unpack_cut@") do
                                    Wait(500)
                                end
                                TaskPlayAnim(Ped, "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 8.0, -8.0, -1, 0, 0, false, false, false)
                                SetTimeout(10000, function()
                                    StopAnimTask(Ped, "anim@amb@business@coc@coc_unpack_cut@", "fullcut_cycle_v6_cokecutter", 1.0)
                                end)
                                vSERVER.Washing()
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