local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
func = Tunnel.getInterface("nation_skinshop")
fclient = {}
Tunnel.bindInterface("nation_skinshop", fclient)
local Spawn = nil

---------------------------------------------------------------------------
-----------------------ANIMAÇÃO DE PARADO---------------------------
---------------------------------------------------------------------------

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

function freezeAnim(dict, anim, flag, keep)
    if not keep then
        ClearPedTasks(PlayerPedId())
    end
    LoadAnim(dict)
    TaskPlayAnim(PlayerPedId(), dict, anim, 2.0, 2.0, -1, flag or 1, 0, false, false, false)
    RemoveAnimDict(dict)
end

handsUp = false
handsup = function()
    handsUp = not handsUp
    if handsUp then
        freezeAnim("random@mugging3", "handsup_standing_base", 49)
    else
        freezeAnim("move_f@multiplayer", "idle")
    end
end



---------------------------------------------------------------------------
-----------------------CÂMERAS--------------------------
---------------------------------------------------------------------------

local cameras = {
    body = { coords = vec3(0.4, 2.1, 0.9), point = vec3(-0.7,-0.1,-0.2) }, 
    head = { coords = vec3(0.0, 0.7, 0.8), point = vec3(-0.1,0.0,0.6) },
    chest = { coords = vec3(0.0, 1.4, 0.7), point = vec3(-0.4,0.0,0.2) },
    legs = { coords = vec3(0.0, 1.3, 0.2), point = vec3(-0.4,0.0,-0.5) },
    feet = { coords = vec3(0.0, 0.8, -0.5), point = vec3(-0.25,0.0,-1.0) }
}


componentCams = {
    ["masks"] = "head",
    ["torsos"] = "chest",
    ["legs"] = "legs",
    ["bags"] = "chest",
    ["shoes"] = "feet",
    ["accessories"] = "body",
    ["undershirts"] = "chest",
    ["bodyArmors"] = "chest",
    ["decals"] = "body",
    ["tops"] = "chest",
    ["hats"] = "head",
    ["glasses"] = "head",
    ["ears"] = "head",
    ["watches"] = "legs",
    ["bracelets"] = "legs",
}

local activeCam

function interpCamera(cameraName)
    if cameras[cameraName] then
        if cameraName == activeCam then return end
        activeCam = cameraName
        local ped = PlayerPedId()
        local cam = cameras[cameraName]
        local coord = GetOffsetFromEntityInWorldCoords(ped,cam.coords)
        local tempCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coord, 0,0,0, 50.0)
        local pointCoords = GetOffsetFromEntityInWorldCoords(ped,cam.point)
        SetCamActive(tempCam, true)
        SetCamActiveWithInterp(tempCam, fixedCam, 600, true, true)
        PointCamAtCoord(tempCam, pointCoords)
        CreateThread(function()
            Wait(600)
            DestroyCam(fixedCam)
            fixedCam = tempCam
        end)
    end
end


function createCamera()
    local ped = PlayerPedId()
    local groundCam = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    if store and store.coords then
        SetEntityCoords(ped, store.coords.x, store.coords.y, store.coords.z-0.97)
        if store.h then
            SetEntityHeading(ped, store.h)
        end
    end
    AttachCamToEntity(groundCam, ped, 0.5, -1.6, 0.0)
    SetCamRot(groundCam, 0, 0.0, 0.0)
    SetCamActive(groundCam, true)
    RenderScriptCams(true, false, 1, true, true)
    activeCam = "body"
    local cam = cameras[activeCam]
    local coord = GetOffsetFromEntityInWorldCoords(ped,cam.coords)
    fixedCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coord, 0,0,0, 50.0)
    local pointCoords = GetOffsetFromEntityInWorldCoords(ped,cam.point)
    PointCamAtCoord(fixedCam, pointCoords)
    SetCamActive(fixedCam, true)
    SetCamActiveWithInterp(fixedCam, groundCam, 1000, true, true)
    CreateThread(function()
        Wait(1000)
        DestroyCam(groundCam)
    end)
end

---------------------------------------------------------------------------
-----------------------DEIXAR OUTROS PLAYERS INVISÍVEIS--------------------------
---------------------------------------------------------------------------

function setPlayersVisible(bool)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, not bool)
    SetEntityInvincible(ped, not bool) -- COMENTAR CASO DE PROBLEMAS COM ANTI CHEAT
    if bool then
        for _, player in ipairs(GetActivePlayers()) do
            local otherPlayer = GetPlayerPed(player)
            if ped ~= otherPlayer then
                SetEntityVisible(otherPlayer, bool)
            end
        end
    else
        CreateThread(function()
            while inMenu do
                for _, player in ipairs(GetActivePlayers()) do
                    local otherPlayer = GetPlayerPed(player)
                    if ped ~= otherPlayer then
                        SetEntityVisible(otherPlayer, bool)
                    end
                end
                InvalidateIdleCam()
                Wait(1)
            end
        end)
    end
end






---------------------------------------------------------------------------
-----------------------LOJAS DE ROUPAS--------------------------
---------------------------------------------------------------------------


defaultPrices = {
    ["masks"] = 50,
    ["torsos"] = 20,
    ["legs"] = 200,
    ["bags"] = 150,
    ["shoes"] = 200,
    ["accessories"] = 90,
    ["undershirts"] = 100,
    ["bodyArmors"] = 300,
    ["decals"] = 50,
    ["tops"] = 300,
    ["hats"] = 120,
    ["glasses"] = 180,
    ["ears"] = 40,
    ["watches"] = 40,
    ["bracelets"] = 35,
}


customClothes = {
    --[[ [1] = preset1,
    [2] = preset1,
    [3] = preset1,
    [4] = preset1, ]]


}


function format(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end


function isCloth(index, value)
    return type(index) == "number" and type(value) == "table" -- verificar se está acessando o indice de uma roupa
end

isComponentBlocked = function(id, component)
    --if component == "bodyArmors" then return true end
    return customClothes[id] and customClothes[id][component] and customClothes[id][component].blocked
end

isClothBlocked = function(id, component, index, gender)
    if customClothes[id] and customClothes[id][component] and customClothes[id][component][gender] then
        local c = customClothes[id][component][gender]
        return (c.type == "insert" and (not c[index] or (type(c[index]) == "table" and c[index].blocked))) or (c.type == "remove" and c[index] and (type(c[index]) == "boolean" or (type(c[index]) == "table" and c[index].blocked)))
    end
    return false
end

getBlockedComponentTextures = function(cloth, id, component, index, gender)
    for i = 0, cloth.textures do
        if not cloth[i] then
            cloth[i] = { blocked = false }
        else
            cloth[i].blocked = false
        end
        if customClothes[id] and customClothes[id][component] and customClothes[id][component][gender] and customClothes[id][component][gender][index] then
            local c = customClothes[id][component][gender][index]
            if type(c) == "table" and c.textures and c.textures[i] then
                cloth[i].blocked =  c.textures[i].blocked
            end
        end
    end
    return cloth
end

getClothPrice = function(id, component, index, gender)
    if id == "nation_creator" then return 0 end
    if customClothes[id] and customClothes[id][component] and customClothes[id][component][gender] then
        local c = customClothes[id][component][gender]
        if c[index] then
            local price = c[index]
            if type(price) == "table" then
                price = price.price or c.defaultPrice or defaultPrices[component]
            elseif type(price) == "boolean" then
                price = c.defaultPrice
            end
            return price
        else 
            return c.defaultPrice or defaultPrices[component]
        end
    end
    return defaultPrices[component]
end



getClothes = function(id)
    local clothes = getAllClothes()
    local gender = getGender()
    for component, v in pairs(clothes) do
        v.blocked = isComponentBlocked(id, component)
        for index, j in pairs(v) do
            if isCloth(index, j) then 
                j.price = getClothPrice(id, component, index, gender)
                j.blocked = isClothBlocked(id, component, index, gender)
                j = getBlockedComponentTextures(j, id, component, index, gender)
            end
        end
    end
    return clothes
end

getCartTotal = function(cart, initialClothes, storeId)
    local total = 0
    local gender = getGender()
    for component, index in pairs(cart) do
        if initialClothes[component] then
            local i = initialClothes[component][1]
            if index >= 0 and index ~= i then
                total = total + getClothPrice(storeId, component, index, gender)
            end
        end
    end
    return math.floor(total)
end


getPopupText = function(total) -- TEXTO QUE VAI APARECER NO POPUP NA HORA DE COMPRAR
    return "você deseja pagar o valor de $ <b>"..format(total or 0).."</b> ?"
end

skinshops = {
    [1] = {
        clothes = getClothes, permission = {"asd.permissao", "Admin"}, coords = vec3(75.43, -1392.83, 29.37), h = 262.86, blip = false
    },
    [2] = {
        clothes = getClothes, permission = nil, coords = vec3(-710.018, -153.072, 37.415), blip = true
    },
    [3] = {
        clothes = getClothes, permission = nil, coords = vec3(-163.261, -302.83, 39.733)
    },
    [4] = {
        clothes = getClothes, permission = nil, coords = vec3(425.51, -806.27, 29.49)
    },
    [5] = {
        clothes = getClothes, permission = nil, coords = vec3(-829.413, -1073.71, 11.5)
    },
    [6] = {
        clothes = getClothes, permission = nil, coords = vec3(-1450.32, -237.514, 49.81)
    },
    [7] = {
        clothes = getClothes, permission = nil, coords = vec3(12.138, 6514.402, 31.877)
    },
    [8] = {
        clothes = getClothes, permission = nil, coords = vec3(125.112, -223.696, 54.557)
    },
    [9] = {
        clothes = getClothes, permission = nil, coords = vec3(-1083.9, -2732.77, 14.6)
    },
    [10] = {
        clothes = getClothes, permission = nil, coords = vec3(-1101.27, 2710.63, 19.1)
    },
    [11] = {
        clothes = getClothes, permission = nil, coords = vec3(-3170.66, 1043.62, 20.86)
    },
    [12] = {
        clothes = getClothes, permission = nil, coords = vec3(1196.81, 2710.16, 38.22)
    },
    [13] = {
        clothes = getClothes, permission = nil, coords = vec3(615.23, 2763.42, 42.08)
    },
    [14] = {
        clothes = getClothes, permission = nil, coords = vec3(1695.65, 4829.36, 41.06)
    },
    [15] = {
        clothes = getClothes, permission = nil, coords = vec3(-1192.61, -768.61, 17.32)
    },
    [16] = {
        clothes = getClothes, permission = nil, coords = vec3(1372.34, -104.4, 124.78)
    },
    [17] = {
        clothes = getClothes, permission = nil, coords = vec3(474.46, -1085.5, 38.7)
    },
    [18] = {
        clothes = getClothes, permission = nil, coords = vec3(452.57, -990.8, 30.68)
    },
    [19] = {
        clothes = getClothes, permission = nil, coords = vec3(-1091.74,-2824.57,21.35)
    },



    ["admin"] = {
        clothes = getClothes
    },

    ["nation_creator"] = {
        clothes = getClothes
    },
}

nearestSkinshops = {}
mainThread = function()
    local getNearestSkinshops = function()
        while true do
            if not inMenu then
                local myCoords = GetEntityCoords(PlayerPedId())
                for k,v in pairs(skinshops) do
                    if v and v.coords then
                        local distance = #(myCoords - v.coords)
                        if nearestSkinshops[k] then
                            if distance > 10 then
                                nearestSkinshops[k] = nil
                            end
                        else
                            if distance <= 10 then
                                nearestSkinshops[k] = v
                            end
                        end
                    end
                end
            end
            Wait(500)
        end
    end

    addBlips()
    CreateThread(getNearestSkinshops)

    while true do
        local idle = 500
        local ped = PlayerPedId()
        local myCoords = GetEntityCoords(ped)
        if not inMenu then
            for skinShopId, v in pairs(nearestSkinshops) do
                if v and v.coords and GetEntityHealth(ped) > 101 then 
                    idle = 0 
                    local coords = v.coords
                    DrawText3D(coords.x, coords.y, coords.z, "~p~[SKIN SHOP]\n~w~~b~[E]~w~ PARA ACESSAR")
                    local distance = #(myCoords - v.coords)
                    if IsControlJustPressed(0,38) and distance < 1.5 then
                        if v.permission then
                            if func.checkPermission(v.permission) then
                                toggleMenu(skinShopId)
                            end
                        else
                            toggleMenu(skinShopId)
                        end
                    end
                end
            end
        end
        Wait(idle)
    end
end



function addBlips()
    for _, v in pairs(skinshops) do
        local coords = v.coords
        if coords and v.blip ~= false then
            local blip = AddBlipForCoord(coords)
            SetBlipSprite(blip, v.id or 73)
            SetBlipColour(blip, v.color or 13)
            SetBlipScale(blip, 0.4)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.name or "Loja de Roupas")
            EndTextCommandSetBlipName(blip)
        end
    end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.45, 0.45)
    SetTextFont(6)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end


RegisterCommand('skinshop',function() -- COMANDO DE ADMIN
    if func.checkPermission({"Admin", "Mod"}) then
        toggleMenu("admin")
    end
end)


RegisterNetEvent("nation_skinshop:toggleMenu")
AddEventHandler("nation_skinshop:toggleMenu", function(menu)
    toggleMenu(menu)
end)




--------- CREATIVE V3 ------------
mySkinData = {}

local skinData = {
	["pants"] = "legs",
	["arms"] = "torsos",
	["tshirt"] = "undershirts",
	["torso"] = "tops",
	["vest"] = "bodyArmors",
	["backpack"] = "bags",
	["shoes"] = "shoes",
	["mask"] = "masks",
	["hat"] = "hats",
	["glass"] = "glasses",
	["ear"] = "ears",
	["watch"] = "watches",
	["bracelet"] = "bracelets",
	["accessory"] = "accessories",
	["decals"] = "decals"
}



function fclient.getCloths()
    local myCloths = getMyClothes()
    local cloths = {}
    for cloth, comp in pairs(skinData) do
        local item = myCloths[comp][1]
        local texture = myCloths[comp][2]
        cloths[cloth] = { item = item, texture = texture }
    end
    mySkinData = cloths
    return cloths
end

CreateThread(function()
    while not getMyClothes do
        Wait(1000)
    end
    fclient.getCloths()
end)

function resetClothing(data)
	local ped = PlayerPedId()

	SetPedComponentVariation(ped,4,data["pants"].item,data["pants"].texture,2)
	SetPedComponentVariation(ped,3,data["arms"].item,data["arms"].texture,2)
	SetPedComponentVariation(ped,8,data["tshirt"].item,data["tshirt"].texture,2)
	SetPedComponentVariation(ped,9,data["vest"].item,data["vest"].texture,2)
	SetPedComponentVariation(ped,11,data["torso"].item,data["torso"].texture,2)
	SetPedComponentVariation(ped,6,data["shoes"].item,data["shoes"].texture,2)
	SetPedComponentVariation(ped,1,data["mask"].item,data["mask"].texture,2)
	SetPedComponentVariation(ped,10,data["decals"].item,data["decals"].texture,2)
	SetPedComponentVariation(ped,7,data["accessory"].item,data["accessory"].texture,2)
	SetPedComponentVariation(ped,5,data["backpack"].item,data["backpack"].texture,2)

	if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
		SetPedPropIndex(ped,0,data["hat"].item,data["hat"].texture,2)
	else
		ClearPedProp(ped,0)
	end

	if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
		SetPedPropIndex(ped,1,data["glass"].item,data["glass"].texture,2)
	else
		ClearPedProp(ped,1)
	end

	if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
		SetPedPropIndex(ped,2,data["ear"].item,data["ear"].texture,2)
	else
		ClearPedProp(ped,2)
	end

	if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
		SetPedPropIndex(ped,6,data["watch"].item,data["watch"].texture,2)
	else
		ClearPedProp(ped,6)
	end

	if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
		SetPedPropIndex(ped,7,data["bracelet"].item,data["bracelet"].texture,2)
	else
		ClearPedProp(ped,7)
	end
    fclient.getCloths()
end


function setSkinData(status)
    if status ~= "clean" then
		resetClothing(status)
	end
end

RegisterNetEvent("vrp_skinshop:skinData")
AddEventHandler("vrp_skinshop:skinData",setSkinData)
RegisterNetEvent("skinshop:skinData")
AddEventHandler("skinshop:skinData",setSkinData)
RegisterNetEvent("skinshop:Apply")
AddEventHandler("skinshop:Apply",setSkinData)

RegisterNetEvent("updateRoupas")
AddEventHandler("updateRoupas",function(status)
    if status == "restore" then
        status = mySkinData
    end
    resetClothing(status)
    func._updateClothes()
end)




-------------------------------- ITENS ITENS -----------------------


-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMASK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setMask")
AddEventHandler("skinshop:setMask",function()
	if GetPedDrawableVariation(PlayerPedId(),1) == mySkinData["mask"]["item"] then
		vRP.playAnim(true,{"missfbi4","takeoff_mask"},true)
		Citizen.Wait(900)
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	else
		vRP.playAnim(true,{"mp_masks@on_foot","put_on_mask"},true)
		Citizen.Wait(700)
		SetPedComponentVariation(PlayerPedId(),1,mySkinData["mask"]["item"],mySkinData["mask"]["texture"],1)
	end

	vRP.removeObjects("one")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETHAT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setHat")
AddEventHandler("skinshop:setHat",function()
	vRP.playAnim(true,{"mp_masks@standard_car@ds@","put_on_mask"},true)

	Citizen.Wait(900)

	if GetPedPropIndex(PlayerPedId(),0) == mySkinData["hat"]["item"] then
		ClearPedProp(PlayerPedId(),0)
	else
		SetPedPropIndex(PlayerPedId(),0,mySkinData["hat"]["item"],mySkinData["hat"]["texture"],1)
	end

	vRP.removeObjects("one")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETGLASSES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setGlasses")
AddEventHandler("skinshop:setGlasses",function()
	vRP.playAnim(true,{"clothingspecs","take_off"},true)

	Citizen.Wait(1000)

	if GetPedPropIndex(PlayerPedId(),1) == mySkinData["glass"]["item"] then
		ClearPedProp(PlayerPedId(),1)
	else
		SetPedPropIndex(PlayerPedId(),1,mySkinData["glass"]["item"],mySkinData["glass"]["texture"],2)
	end

	vRP.removeObjects("one")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:setArms")
AddEventHandler("skinshop:setArms", function()
	if GetPedDrawableVariation(PlayerPedId(),3) == mySkinData["arms"]["item"] then
		SetPedComponentVariation(PlayerPedId(),3,15,0,1)
	else
		SetPedComponentVariation(PlayerPedId(),3,mySkinData["arms"]["item"],mySkinData["arms"]["texture"],1)
	end
end)








--------- NYO GUARDA ROUPAS ------------

--[[ local skinData = {
	["legs"] = 4,
	["torsos"] = 3,
	["undershirts"] = 8,
	["tops"] = 11,
	["bodyArmors"] = 9,
	["bags"] = 5,
	["shoes"] = 6,
	["masks"] = 1,
	["hats"] = "p0",
	["glasses"] = "p1",
	["ears"] = "p2",
	["watches"] = "p7",
	["bracelets"] = "p7",
	["accessories"] = 7,
	["decals"] = 10
}



function fclient.getCloths()
    local myCloths = getMyClothes()
    local cloths = {}
    for cloth, comp in pairs(skinData) do
        local item = myCloths[cloth][1]
        local texture = myCloths[cloth][2]
        cloths[comp] = { item, texture }
    end
    return cloths
end





 ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- TOGGLEBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:toggleBackpack")
AddEventHandler("skinshop:toggleBackpack",function(Infos)
	local splitName = splitString(Infos,"-")
	local Model = parseInt(splitName[1])
	local Texture = parseInt(splitName[2])

	if mySkinData["backpack"]["item"] == Model then
		mySkinData["backpack"]["item"] = 0
		mySkinData["backpack"]["texture"] = 0
	else
		mySkinData["backpack"]["texture"] = Texture
		mySkinData["backpack"]["item"] = Model
	end

	SetPedComponentVariation(PlayerPedId(),5,mySkinData["backpack"]["item"],mySkinData["backpack"]["texture"],1)

	func.updateClothes()
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINSHOP:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("skinshop:Open")
AddEventHandler("skinshop:Open",function(Spawn)
    Spawn = Spawn
	toggleMenu("nation_creator")
end)

RegisterNetEvent("nation_creator:finishClothes")
AddEventHandler("nation_creator:finishClothes",function()
    SetEntityCoordsNoOffset(PlayerPedId(),-1101.48,-2851.54,21.37,true,true,true)
	SetEntityHeading(PlayerPedId(),323.15)
    func.updateClothes(true)
    Wait(100)
    Spawn = nil
end)