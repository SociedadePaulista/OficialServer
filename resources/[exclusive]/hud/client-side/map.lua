-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Offset = 0
local Default = 1920 / 1080
local ResolutionX,ResolutionY = GetActiveScreenResolution()
local AspectRatio = ResolutionX / ResolutionY
local AspectDiff = Default - AspectRatio
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
--[[ CreateThread(function()
	if LoadTexture("circlemap") then
		SetMinimapClipType(1)
		AddReplaceTexture("platform:/textures/graphics","radarmasksm","circlemap","radarmasksm")
		SetBlipAlpha(GetNorthRadarBlip(), 0.0)
		UpdatePosition()
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
function UpdatePosition()

	local miniMapScale = GetminiMapScale()
	local baseMinimap_blur = miniMapScale.minimap_blur
	local baseMinimap_mask = miniMapScale.minimap_mask
	local baseMinimap = miniMapScale.minimap

	SetMinimapComponentPosition("minimap", "L", "B", baseMinimap.x - 0.012, baseMinimap.y - 0.006, baseMinimap.width, baseMinimap.height)
	SetMinimapComponentPosition("minimap_blur", "L", "B",  baseMinimap_blur.x - 0.012, baseMinimap_blur.y - 0.006, baseMinimap_blur.width, baseMinimap_blur.height)
	SetMinimapComponentPosition("minimap_mask", "L", "B", baseMinimap_mask.x - 0.012, baseMinimap_mask.y - 0.006, baseMinimap_mask.width, baseMinimap_mask.height)

	SetBigmapActive(true,false)

	repeat
		Wait(100)
		SetBigmapActive(false,false)
	until not IsBigmapActive()

	SetRadarBigmapEnabled(true, false)
	Citizen.Wait(0)
	SetRadarBigmapEnabled(false, false)
end


function GetminiMapScale()
    local aspect_ratio = GetAspectRatio(0)
	local res_x,res_y = GetActiveScreenResolution()
	local xscale = 1.0 / res_x
	local width =  math.floor(tonumber(xscale * (res_x / (4 * aspect_ratio))) * 10000) / 10000
	local miniMapScale = {
		[0.135] = {
			["minimap_blur"] = { x = -0.01 , y = 0.01 , width = 0.21 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.075, height = -0.195 }, 
			["minimap"] = { x = -0.018 , y = -0.03 , width = 0.158 , height = 0.25 }, 
		},
		[0.138] = {
			["minimap_blur"] = { x = -0.01 , y = 0.01 , width = 0.21 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.075, height = -0.195 }, 
			["minimap"] = { x = -0.018 , y = -0.03 , width = 0.158 , height = 0.25 }, 
		},
		[0.1326] = {
			["minimap_blur"] = { x = -0.02 , y = 0.01 , width = 0.21 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.075, height = -0.195 }, 
			["minimap"] = { x = -0.018 , y = -0.03 , width = 0.158 , height = 0.25 }, 
		},
		[0.1411] = {
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.21 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.075, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.158 , height = 0.25 }, 
		},								
		[0.1666] = { -- 3:2
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.179 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.165 , y = 0.44 , width = 0.06, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.137 , height = 0.25 }, 
		},
		[0.1874] = { -- 4:3
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.155 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.16 , y = 0.44 , width = 0.056, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.124 , height = 0.25 }, 
		},		
		[0.15] = { -- 5:3
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.199 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.07, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.149 , height = 0.25 }, 
		},
		[0.2] = { -- 5:4
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.146 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.16 , y = 0.44 , width = 0.055, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.116 , height = 0.25 }, 
		},
		[0.1406] = { -- 16:9
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.21 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.075, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.158 , height = 0.25 }, 
		},
		[0.1562] = { -- 16:10
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.19 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.068, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.1445 , height = 0.25 }, 
		},		
		[0.1323] = { -- 17:9
			["minimap_blur"] = { x = -0.03 , y = 0.01 , width = 0.22 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.07, height = -0.195 }, 
			["minimap"] = { x = -0.04 , y = -0.03 , width = 0.165 , height = 0.25 }, 
		},
		[0.1071] = { -- 21:9
			["minimap_blur"] = { x = -0.155 , y = 0.01 , width = 0.27 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.01 , y = 0.44 , width = 0.09, height = -0.195 }, 
			["minimap"] = { x = -0.17 , y = -0.03 , width = 0.21 , height = 0.25 }, 
		},
		[0.1405] = { -- automatico
			["minimap_blur"] = { x = 0.0 , y = 0.01 , width = 0.21 , height = 0.30 }, 
			["minimap_mask"] = { x = 0.15 , y = 0.44 , width = 0.075, height = -0.195 }, 
			["minimap"] = { x = -0.01 , y = -0.03 , width = 0.158 , height = 0.25 }, 
		},		
	}

    local minimap_blur,minimap_mask,minimap = miniMapScale[0.1405]["minimap_blur"],miniMapScale[0.1405]["minimap_mask"],miniMapScale[0.1405]["minimap"]
    if miniMapScale[width] ~= nil then
		minimap_blur,minimap_mask,minimap = miniMapScale[width]["minimap_blur"],miniMapScale[width]["minimap_mask"],miniMapScale[width]["minimap"]
	end

    return { minimap_blur = minimap_blur, minimap_mask = minimap_mask, minimap = minimap }
end