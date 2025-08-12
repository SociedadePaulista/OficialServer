local rope = nil
local atm = false
local texto = false
local vehicle = nil

Citizen.CreateThread(function()
    loadExistModel("loq_atm_02_console")
    loadExistModel("loq_atm_02_des")
    loadExistModel("loq_atm_03_console")
    loadExistModel("loq_atm_03_des")
    loadExistModel("loq_fleeca_atm_console")
    loadExistModel("loq_fleeca_atm_des")
    local models = {
        GetHashKey("loq_fleeca_atm_console"), 
        GetHashKey("loq_atm_02_console"), 
        GetHashKey("loq_atm_03_console")
    }
    exports["target"]:AddTargetModel(models, {
        options = {
			{
				event = "ad_atmrobbery:crack",
				label = "Crack ATM",
				tunnel = "client"
			}
		},
		Distance = 2.5
    })
end)

Citizen.CreateThread(function()
    while true do
        local vehicle = exports["inventory"]:TowropeAtm()
        if vehicle then
            if IsControlJustPressed(1, 73) then
                TriggerServerEvent("ad_atmrobbery:delesr", rope)
            elseif IsControlJustPressed(1, 38) and vSERVER.rouboatm() then


                local ped = PlayerPedId()
                local obj = GetATM()

                TaskTurnPedToFaceEntity(ped, obj.atmprope, 1000)
                TaskPlayAnim(ped, "mini@repair", "fixing_a_ped", 2.0, 2.0, -1, 1, 0, false, false, false)
                TriggerEvent("Progress",7000)
                SetTimeout(7000,function()
                    ClearPedTasks(ped)
                    local propo1 = nil
                    local propo2 = nil
                    local atmcoords = GetEntityCoords(obj.atmprope)
                    local atmheading = GetEntityHeading(obj.atmprope)
    
                    if obj.type == "prop_atm_02" then
                        propo1 = CreateObject("loq_atm_02_des", vector3(atmcoords.x, atmcoords.y, atmcoords.z + 0.35), true)
                        propo2 = CreateObject("loq_atm_02_console", vector3(atmcoords.x, atmcoords.y, atmcoords.z + 0.55), true)
                        SetEntityHeading(propo1, atmheading)
                        SetEntityHeading(propo2, atmheading)
                        FreezeEntityPosition(propo1, true)
                        FreezeEntityPosition(propo2, true)
                    elseif obj.type == "prop_atm_03" then
                        propo1 = CreateObject("loq_atm_03_des", vector3(atmcoords.x, atmcoords.y, atmcoords.z + 0.35), true)
                        propo2 = CreateObject("loq_atm_03_console", vector3(atmcoords.x, atmcoords.y, atmcoords.z + 0.65), true)
                        SetEntityHeading(propo1, atmheading)
                        SetEntityHeading(propo2, atmheading)
                        FreezeEntityPosition(propo1, true)
                        FreezeEntityPosition(propo2, true)
                    elseif obj.type == "prop_fleeca_atm" then
                        propo1 = CreateObject("loq_fleeca_atm_des", atmcoords.x, atmcoords.y, atmcoords.z + 0.35, true)
                        propo2 = CreateObject("loq_fleeca_atm_console", atmcoords.x, atmcoords.y, atmcoords.z + 0.65, true)
                        SetEntityHeading(propo1, atmheading)
                        SetEntityHeading(propo2, atmheading)
                        FreezeEntityPosition(propo1, true)
                        FreezeEntityPosition(propo2, true)
                    end
                    Citizen.Wait(200)
                    local dpratm = ObjToNet(obj.atmprope)
                    local netveh = VehToNet(vehicle)
                    local propsdad = ObjToNet(propo2)
                    
                    exports["inventory"]:DetachRope()
                    TriggerServerEvent("ad_atmrobbery:attro2", dpratm, atmcoords.x, atmcoords.y, atmcoords.z, netveh, propsdad)
                    SetEntityCoords(obj.atmprope, atmcoords.x, atmcoords.y, atmcoords.z - 10.0)
                    local car = true
                    while car do
                        if IsPedInAnyVehicle(ped) then
                            Citizen.Wait(math.random(5000, 15000))
                            local jksdf = ObjToNet(propo2)
                            TriggerServerEvent("ad_atmrobbery:propas", jksdf)
                            car = false
                        end
                        Citizen.Wait(0)
                    end
                end)
            end
            Citizen.Wait(0)
        else
            Citizen.Wait(500)
        end 
    end
end)

RegisterNetEvent("ad_atmrobbery:userope")
AddEventHandler("ad_atmrobbery:userope", function()
    local ped = PlayerPedId()
    local veh = vRP.ClosestVehicle(5)
    vehicle = veh
    if not IsPedInAnyVehicle(ped, false) then
        TaskTurnPedToFaceEntity(ped, vehicle, 7000)
        loadAnimDict("mini@repair")
        TaskPlayAnim(ped, "mini@repair", "fixing_a_ped", 2.0, 2.0, -1, 1, 0, false, false, false)
        TriggerEvent("Progress",25000)
        SetTimeout(25000,function()
            ClearPedTasks(ped)
            TriggerServerEvent("ad_atmrobbery:clrspawn")
            local networkveh = VehToNet(vehicle)
            local metworkped = PedToNet(ped)
            TriggerServerEvent("ad_atmrobbery:attro1", networkveh, metworkped)
        end)
    end
end)

RegisterNetEvent("ad_atmrobbery:clrspawn")
AddEventHandler("ad_atmrobbery:clrspawn", function()
    RopeLoadTextures()
    rope = AddRope(1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0, 1, 7.0, 1.0, 0, 0, 0, 0, 0, 0)
end)

RegisterNetEvent("ad_atmrobbery:attro1")
AddEventHandler("ad_atmrobbery:attro1", function(obh1, obj1)
    local obo1 = NetToEnt(obh1)
    local obo2 = NetToEnt(obj1)
    local ocoords = GetEntityCoords(obo2)
    AttachEntitiesToRope(rope, obo1, obo2, GetOffsetFromEntityInWorldCoords(obo1, 0, -2.3, 0.5), GetPedBoneCoords(obo2, 6286, 0.0, 0.0, 0.0), 7.0, 0, 0, "rope_attach_a", "rope_attach_b")
    SlideObject(rope, ocoords.x, ocoords.y, ocoords.z, 1.0, 1.0, 1.0, true)
end)

RegisterNetEvent("ad_atmrobbery:attro2")
AddEventHandler("ad_atmrobbery:attro2", function(atmo, atmco1, atmco2, atmco3, obh1, obj1)
    RopeLoadTextures()
    NetworkRequestControlOfEntity(atmo)
    local obo1 = NetToEnt(obh1)
    local obo2 = NetToEnt(obj1)
    local obo3 = NetToEnt(atmo)
    local propocoord = GetEntityCoords(obo2)
    SetEntityCoords(obo3, atmco1, atmco2, atmco3 - 10.0)
    rope = AddRope(1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0, 1, 7.0, 1.0, 0, 0, 0, 0, 0, 0)
    AttachEntitiesToRope(rope, obo1, obo2, GetOffsetFromEntityInWorldCoords(obo1, 0, -2.3, 0.5), propocoord.x, propocoord.y, propocoord.z + 1.0, 7.0, 0, 0, "rope_attach_a", "rope_attach_b")
end)

RegisterNetEvent("ad_atmrobbery:propas")
AddEventHandler("ad_atmrobbery:propas", function(obh)
    local obo = NetToEnt(obh)
    FreezeEntityPosition(obo, false)
    SetObjectPhysicsParams(obo, 170.0, -1.0, 30.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0)
end)

RegisterNetEvent("ad_atmrobbery:crack")
AddEventHandler("ad_atmrobbery:crack", function(teste)
    print(teste)
    print(json.encode(teste))
    loadAnimDict("mini@repair")
    TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_ped", 2.0, 2.0, -1, 1, 0, false, false, false)
    local prosp = GetTasd()
	TriggerEvent("Progress",7000)
    SetTimeout(7000,function()
        local jkdffsdf = ObjToNet(prosp)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent("ad_atmrobbery:deles", jkdffsdf)
        TriggerServerEvent("ad_atmrobbery:delesr", rope)
        TriggerServerEvent("ad_atmrobbery:reward")
    end)
end)

RegisterNetEvent("ad_atmrobbery:deles")
AddEventHandler("ad_atmrobbery:deles", function(obh)
    local obo = NetToEnt(obh)
    DeleteEntity(obo)
end)

RegisterNetEvent("ad_atmrobbery:delesr")
AddEventHandler("ad_atmrobbery:delesr", function(rope)
    DeleteRope(rope)
    rope = nil
end)

function GetATM()
    for k,v in pairs({"prop_atm_02", "prop_atm_03", "prop_fleeca_atm"}) do 
        local obj = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 5.0, GetHashKey(v))
        if DoesEntityExist(obj) then
            local ahio = { atmprope = obj, type = v }
            return ahio
        end
    end
    return nil
end

function GetTasd()
    for k,v in pairs({"loq_fleeca_atm_console", "loq_atm_02_console", "loq_atm_03_console"}) do 
        local obj = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 5.0, GetHashKey(v))
        if DoesEntityExist(obj) then
            return obj
        end
    end
    return nil
end

function loadExistModel(hash)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(1)
        end
    end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end