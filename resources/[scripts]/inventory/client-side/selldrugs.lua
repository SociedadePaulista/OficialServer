-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local bancadas = {}
local bancada
local vendendo = false
---------------------------------
--------- EVENTOS -------------
---------------------------------
AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
        return
    end
    bancadas = vSERVER.getBancadas()
end)
---------------------------------
------- THREAD PRINCIPAL --------
---------------------------------
Citizen.CreateThread(function()
    local idle = 500
    while true do
        if not bancada then
            bancada,index = getNearestBancada()
        else
            idle = 0
            local playercoords = GetEntityCoords(PlayerPedId())
            local coords = bancada.coords
            if (not mesa or coords ~= mesacoords) and not desmontando then
                DrawText3D(coords.x, coords.y, coords.z + 0.5 , "~w~CONTÉM ~g~"..bancada.amount.." ~r~DROGAS", 0.4)
                DrawText3D(coords.x, coords.y, coords.z + 0.35 , "~w~PRESSIONE ~r~E ~w~ PARA DESMONTAR A ~b~BANCADA", 0.4)
            end
            if IsControlJustPressed(0,38) and not tempo and not IsPedInAnyVehicle(PlayerPedId()) then
                local object = GetClosestObjectOfType(coords, 2.0, GetHashKey("prop_table_08"), false, 0, 0)
                if removingBancada(GetEntityHealth(PlayerPedId()), coords) then
                    vSERVER.tryRemoveBancada(index,ObjToNet(object)) 
                end
            end
            local distance = #(playercoords - coords)
            if distance > 1.1 then
                bancada = nil
            end
        end
        Citizen.Wait(idle)
    end
end)



---------------------------------
--------- FUNÇÕES -------------
---------------------------------

function removingBancada(life,coords)
    tempo = 30
    playAnim(PlayerPedId(),"amb@prop_human_bum_bin@enter","enter")
    Wait(4000)
    playAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_a","idle_b")
    showTimer()
    while tempo > 0 do
        Citizen.Wait(1000)
        local playercoords = GetEntityCoords(PlayerPedId())
        local distance = #(playercoords - coords)
        if distance > 2 or life ~= GetEntityHealth(PlayerPedId()) then
            ClearPedTasks(PlayerPedId())
            tempo = nil
            return false
        elseif not IsEntityPlayingAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_a","idle_b", 3) then
            playAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_a","idle_b")
        end
        tempo = tempo - 1
    end
    tempo = nil
    return true
end

function showTimer()
    Citizen.CreateThread(function()
        while tempo and tempo > 0 do
            nation_drawTxt(0.55, 1.44, 1.0,1.0,0.5, "RESTAM ~r~" .. tempo .. "~w~ SEGUNDO(S) PARA DESMONTAR A BANCADA", 255, 255, 255, 255)
            Citizen.Wait(0)
        end
    end)
end


function getNearestBancada()
    local playercoords = GetEntityCoords(PlayerPedId())
    for k in pairs(bancadas) do
        local distance = #(playercoords - bancadas[k].coords)
        if distance < 1.1 then
            if mesa and bancadas[k].coords == mesacoords then
                return false
            end
            return bancadas[k],k
        end
    end
    return false
end

function checkBancada(x,y,z)
    amount = 0
    Citizen.CreateThread(function()
        while mesa and not desmontando do
            local idle = 500
            local playercoords = GetEntityCoords(PlayerPedId())
            local distance = #(playercoords - vec3(x,y,z))
            if distance < 1.1 then
                idle = 0
                DrawText3D(x, y, z + 0.5 , "~w~PRESSIONE ~g~E ~w~ PARA ADICIONAR ~r~DROGAS", 0.4)
                DrawText3D(x, y, z + 0.65 , "~w~CONTÉM ~g~"..amount.." ~r~DROGAS", 0.4)
                if amount > 0 then
                    DrawText3D(x, y, z + 0.35 , "~w~PRESSIONE ~r~F ~w~ PARA RECOLHER ~r~DROGAS", 0.4)
                end
                if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(PlayerPedId()) then
                    local qtd = vSERVER.getDrugs()
                    amount = amount + qtd
                    if qtd > 0 then
                        addDrugs(amount)
                    end
                elseif IsControlJustPressed(0,23) and amount > 0 and not IsPedInAnyVehicle(PlayerPedId()) then
                    local qtd = vSERVER.removeDrugs()
                    if qtd then
                        amount = amount - qtd
                        removeDrugs(amount)
                    end
                end
            elseif not DoesEntityExist(mesa) or IsPedInAnyVehicle(PlayerPedId()) then
                if vSERVER.removeBancada(true) then
                    Creative.forceRemoveBancada()
                end
            end
            Citizen.Wait(idle)
        end
    end)
end

function Creative.updateBancadas(b)
    bancadas = b
    bancada = nil
end


function Creative.forceRemoveBancada()
    if mesa then
        if drugs then
            for i in ipairs(drugs) do
                vSERVER.tryDeleteEntity(drugsnet[i])
            end
        end
        vSERVER.tryDeleteEntity(mesanet)
        mesa = nil
        mesacoords = nil
        drugs = nil
        drugsnet = nil
        desmontando = false
        TriggerEvent("Notify","amarelo","Sua bancada foi desmontada!",5000)
    end
end

function addDrugs(amount)
    if not drugs then
        drugs = {}
        drugsnet = {}
    end
    local qtd = amount
    if qtd > 5 then
        qtd = 5
    end
    playAnim(PlayerPedId(),"amb@world_human_stand_mobile@male@text@enter","enter")
    Wait(1000)
    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.0,-5.0)
    local droga = createEntity("prop_drug_package_02",coords,true)
    AttachEntityToEntity(droga,PlayerPedId(),GetPedBoneIndex(PlayerPedId(),0x2C63),0.1,0.0,-0.05,0.0,0.0,0.0,false,false,true,false,2,true)
    Wait(3000)
    playAnim(PlayerPedId(),"mp_common","givetake1_a")
    Wait(1000)
    vSERVER.tryDeleteEntity(ObjToNet(droga))
    if #drugs < 5 then
        for i = 1, qtd do
            if not drugs[i] then
                local coord = GetOffsetFromEntityInWorldCoords(mesa,-0.6,0.0,0.0)
                if i > 1 then
                    coord = GetOffsetFromEntityInWorldCoords(drugs[i-1],0.3,0.0,0.0)
                end
                drugs[i] = createEntity("prop_drug_package_02",coord,false,true)
                drugsnet[i] = ObjToNet(drugs[i])
            end
        end
    end
end

function removeDrugs(qtd,selling)
    if drugs and #drugs > 0 then
        local qtd = qtd
        local droga
        if not selling then
            playAnim(PlayerPedId(),"amb@prop_human_bbq@male@enter","enter")
            Wait(1500)
            local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.0,-5.0)
            droga = createEntity("prop_drug_package_02",coords,true)
            AttachEntityToEntity(droga,PlayerPedId(),GetPedBoneIndex(PlayerPedId(),0x2C63),0.1,0.0,-0.05,0.0,0.0,0.0,false,false,true,false,2,true)
        end
        if qtd <= #drugs then
            for i = #drugs, qtd+1, -1 do
                if drugs[i] then
                    vSERVER.tryDeleteEntity(drugsnet[i])
                    drugs[i] = nil
                    drugsnet[i] = nil
                end
            end
        end
        if not selling then
            Wait(2000)
            playAnim(PlayerPedId(),"amb@world_human_stand_mobile@male@text@exit","exit")
            Wait(2000)
            vSERVER.tryDeleteEntity(ObjToNet(droga))
        end
    end
end

function playAnim(ped,dict,anim)
	while not HasAnimDictLoaded(dict) do
        Citizen.Wait(1)
        RequestAnimDict(dict)
    end
    TaskPlayAnim(ped,dict,anim,3.0,-3.0,-1,48,0,0,0,0)
end

function createEntity(model,coord,needed,table,h)
    local Progression,Network = vRPS.CreateObject(model,coord[1],coord[2],coord[3],model)
	if Progression then
		local object = LoadNetwork(Network)
        if object then
            SetEntityAsMissionEntity(object,true,true)
            if needed then
                SetEntityAsNoLongerNeeded(object)
            end
            if table then
                local rotation = h
                if not rotation then
                    rotation = GetEntityRotation(mesa)
                end
                PlaceObjectOnGroundProperly(object)
                SetEntityRotation(object,rotation,2,true)
                FreezeEntityPosition(object,true)
            end
            SetEntityAsNoLongerNeeded(object)
            return object, vec3(coord.x,coord.y,coord.z), ObjToNet(object)
        else
            TriggerServerEvent("DeleteObject",0,model)
        end
    end
end

function Creative.deleteEntity(index)
    Citizen.CreateThread(function()
		if NetworkDoesNetworkIdExist(index) then
			SetEntityAsMissionEntity(index,true,true)
			SetEntityAsNoLongerNeeded(index)
			local v = NetToEnt(index)
			if DoesEntityExist(v) then
				DetachEntity(v,false,false)
				PlaceObjectOnGroundProperly(v)
				SetEntityAsNoLongerNeeded(v)
				SetEntityAsMissionEntity(v,true,true)
				DeleteEntity(v)
			end
		end
	end)
end

function canSell()
    local playercoords = GetEntityCoords(PlayerPedId())
    local locais = { -- locais de venda (que o player consegue montar a bancada) --> formato = x,y,z
        vec3(160.22,-1006.15,29.45), 
        vec3(407.76,-1074.88,29.41), 
        vec3(694.00,-264.56,58.22),
        vec3(707.97,-292.99,59.19),
        vec3(1684.98,-71.63,174.69)
    }
    for i in ipairs(locais) do
        local coords = locais[i]
        local distance = #(playercoords - coords)
        if distance <= 100.0 then
            return true
        end
    end
    return false
end

function trySellDrugs()
    
    if not mesa or not amount or not DoesEntityExist(mesa) then
        TriggerEvent("Notify","vermelho","Não há nenhuma bancada montada!",5000)
        return
    elseif amount < 1 then
        TriggerEvent("Notify","vermelho","Não há droga na bancada!",5000)
        return
    elseif amount < 2 then
        TriggerEvent("Notify","vermelho","Não há droga suficiente para uma venda na bancada!",5000)
        return
    elseif vendendo or DoesEntityExist(npc) then
        TriggerEvent("Notify","vermelho","Aguarde a transação já existente.",5000)
        return
    end

    local playercoords = GetEntityCoords(PlayerPedId())
    local distance = #(playercoords - GetEntityCoords(mesa))
    if distance > 5 or IsPedInAnyVehicle(PlayerPedId()) then
        TriggerEvent("Notify","vermelho","Você está muito longe da bancada.",5000)
        return
    end
    vendendo = true
    
    local Cooldown = 0
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(mesa)
	local SpawnX = Coords["x"] + math.random(-15,15)
	local SpawnY = Coords["y"] + math.random(-15,15)
	local HitZ,GroundZ = GetGroundZFor_3dCoord(SpawnX,SpawnY,Coords["z"],true)
	local HitSafe,SafeCoords = GetSafeCoordForPed(SpawnX,SpawnY,GroundZ,false,16)

	repeat
		Cooldown = Cooldown + 1
		SpawnX = Coords["x"] + math.random(-15,15)
		SpawnY = Coords["y"] + math.random(-15,15)
		HitZ,GroundZ = GetGroundZFor_3dCoord(SpawnX,SpawnY,Coords["z"],true)
		HitSafe,SafeCoords = GetSafeCoordForPed(SpawnX,SpawnY,GroundZ,false,16)
	until (HitZ and HitSafe) or Cooldown >= 100

	if HitZ and HitSafe then
        Citizen.CreateThread(function()
            local Application,Network = vRPS.CreatePed("g_m_y_ballaorig_01",SafeCoords["x"],SafeCoords["y"],SafeCoords["z"])
            if Application then
                SetTimeout(1000,function()
                    npc = LoadNetwork(Network)
                    if npc then
                        SetPedCanBeTargetted(npc,false)
                        SetEntityCanBeDamaged(npc,false)
                        SetBlockingOfNonTemporaryEvents(npc,true)
                        CanPedInCombatSeeTarget(PlayerPedId(),false)
                        SetEntityInvincible(npc,true)
                        SetPedCanRagdollFromPlayerImpact(npc,false)
                        SetEntityAsNoLongerNeeded(npc)
                  
    
                        local coordToGo = GetEntityCoords(drugs[#drugs]) 
                        TaskGoStraightToCoord(npc,coordToGo,1.0,-1,GetEntityHeading(mesa)-180.0,1.0)
                        local pedcoords = GetEntityCoords(npc)
                        local distance = #(pedcoords - coordToGo)
                        local timeout = 30000
                        while distance > 2 do
                            if not coordToGo or timeout <= 0 then
                                DeleteEntity(npc)
                                vendendo = false
                                if not coordToGo then
                                    TriggerEvent("Notify","amarelo","Vendas canceladas!",5000)
                                else
                                    TriggerEvent("Notify","amarelo","As vendas foram canceladas porque o local da bancada está inacessível!",5000)
                                end
                                return
                            elseif IsEntityDead(npc) then
                                DeleteEntity(npc)
                                return
                            end
                            pedcoords = GetEntityCoords(npc)
                            distance = #(pedcoords - coordToGo)
                            timeout = timeout - 1
                            Citizen.Wait(0)
                        end
                        TaskTurnPedToFaceCoord(npc,GetEntityCoords(PlayerPedId()),-1)
                        TaskLookAtEntity(npc,PlayerPedId(),-1,2048,3)
                        Wait(1000)
                        local sold
                        if not IsPedInAnyVehicle(PlayerPedId()) and not IsEntityDead(npc) then
                            sold = vSERVER.sellDrug()
                        end
                        if sold then
                            Citizen.CreateThread(function()
                                vSERVER.callPolice()
                            end)
                            playAnim(npc,"amb@prop_human_bbq@male@enter","enter")
                            Wait(1500)
                            amount = amount - sold
                            local coords = GetOffsetFromEntityInWorldCoords(npc,0.0,0.0,-5.0)
                            droganpc = createEntity("prop_drug_package_02",coords,true)
                            AttachEntityToEntity(droganpc,npc,GetPedBoneIndex(npc,28422),0.0,-0.05,-0.05,90.0,90.0,0.0,false,false,true,false,2,true)
                            removeDrugs(amount,true)
                            Wait(3000)
                            playAnim(npc,"amb@world_human_stand_mobile@male@text@exit","exit")
                            Wait(2000)
                            vSERVER.tryDeleteEntity(ObjToNet(droganpc))
                        end
                        if not IsEntityDead(npc) then
                            ClearPedTasks(npc)
                            TaskGoToCoordAnyMeans(npc,vec3(SafeCoords["x"],SafeCoords["y"],SafeCoords["z"]),1.0,0,0,786603,0xbf800000)
                            Wait(6000)
                            DeleteEntity(npc)
                            npc = nil
                            Wait(10000)
                            vendendo = false
                            if stopSelling then
                                stopSelling = false
                                return
                            end
                            trySellDrugs()
                        end
    
                    end
                end)
            end
        end)
    else
        TriggerEvent("Notify","vermelho","Não é possível fazer isso nesse local.",5000)
        vendendo = false
    end
end

Citizen.CreateThread(function()
    while true do
        if npc and vendendo then
            if IsEntityDead(npc) then
                TriggerEvent("Notify","amarelo","O comprador foi morto.",5000)
                vendendo = false
                stopSelling = true
                if DoesEntityExist(npc) then
                    DeleteEntity(npc)
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextFont(4)
	SetTextScale(scale,scale)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/350
	DrawRect(_x,_y+0.015,factor,0.03,0,0,0,80)
end

function ShowAdvancedNotification(icon, sender, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(icon, icon, true, 4, sender, title, text)
    DrawNotification(false, true)
end

function nation_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function Creative.notify(msg)
    ShowAdvancedNotification("CHAR_ARTHUR", "", "~r~Anônimo", msg)
end

---------------------------------
---------------------------------
---------------------------------



---------------------------------
--------- COMANDOS -------------
---------------------------------

RegisterCommand("mesa", function()
    if mesa then
        TriggerEvent("Notify","amarelo","Você já possui uma bancada montada!",5000)
        return
    end
    local perm = vSERVER.getPermission()
    if not perm then
        return
    elseif montando then
        TriggerEvent("Notify","vermelho","Você já está montando uma bancada!",5000)
        return
    elseif not canSell() or IsPedInAnyVehicle(PlayerPedId()) then
        TriggerEvent("Notify","vermelho","Você não pode fazer isso aqui!",5000)
        return
    end
    FreezeEntityPosition(PlayerPedId(),true)
    montando = true
    local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,0.0)
    TriggerEvent("Progress",10 * 1000)
    Citizen.CreateThread(function()
        playAnim(PlayerPedId(),"amb@prop_human_bum_bin@enter","enter")
        Wait(4000)
        playAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_a","idle_b")
        local tempoMesa = 10 - 4
        local tempo = tempoMesa
        local build
        while tempo > 0 do
            Wait(1000)
            if not IsEntityPlayingAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_a","idle_b", 3) then
                playAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_a","idle_b")
            end
            if tempo == parseInt(tempoMesa / 1.05) then
                build = createEntity("prop_fncwood_16d",coord,false,true,GetEntityRotation(PlayerPedId()))
            elseif tempo == parseInt(tempoMesa / 1.5) then

                TriggerServerEvent("DeleteObject",0,"prop_fncwood_16d")

                local p,r,y = table.unpack(GetEntityRotation(PlayerPedId()))
                p = 90.0
                Wait(300)
                build = createEntity("prop_fncwood_16c",coord,false,true,vec3(90.0,r,y-180))
            elseif tempo == parseInt(tempoMesa / 2.5) then
                
                TriggerServerEvent("DeleteObject",0,"prop_fncwood_16c")

                local p,r,y = table.unpack(GetEntityRotation(PlayerPedId()))
                p = 90.0
                Wait(300)
                build = createEntity("prop_fncwood_02b",coord,false,true,vec3(90.0,r,y-180))
            end
            tempo = tempo - 1
        end
        playAnim(PlayerPedId(),"amb@prop_human_bum_bin@exit","exit")
        Wait(500)

        TriggerServerEvent("DeleteObject",0,"prop_fncwood_02b")

        mesa, mesacoords, mesanet = createEntity("prop_table_08",coord,false,true,GetEntityRotation(PlayerPedId()))
        vSERVER.createBancada(mesacoords)
        checkBancada(coord.x,coord.y,coord.z)
        montando = false
        FreezeEntityPosition(PlayerPedId(),false)
    end)
end)

RegisterCommand("delmesa", function()
    if DoesEntityExist(mesa) then
        local playercoords = GetEntityCoords(PlayerPedId())
        local distance = #(playercoords - GetEntityCoords(mesa))
        if distance > 5 or IsPedInAnyVehicle(PlayerPedId()) then
            TriggerEvent("Notify","vermelho","Você está muito longe da bancada.",5000)
            return
        elseif desmontando then
            TriggerEvent("Notify","vermelho","Você já está desmontando uma bancada!",5000)
            return
        elseif not vSERVER.canRemoveBancada() then
            TriggerEvent("Notify","vermelho","Espaço insuficiente",5000)
            return
        end
        FreezeEntityPosition(PlayerPedId(),true)
        desmontando = true
        TriggerEvent("Progress",10 * 1000)
        Citizen.CreateThread(function()
            playAnim(PlayerPedId(),"amb@prop_human_bum_bin@enter","enter")
            Wait(4000)
            if drugs then
                for i in ipairs(drugs) do
                    vSERVER.tryDeleteEntity(drugsnet[i])
                end
            end
            local coord = GetOffsetFromEntityInWorldCoords(mesa,0.0,0.0,0.0)
            vSERVER.tryDeleteEntity(ObjToNet(mesa))
            playAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_a","idle_b")
            local p,r,y = table.unpack(GetEntityRotation(PlayerPedId()))
            p = 90.0
            Wait(300)
            local build = createEntity("prop_fncwood_02b",coord,false,true,vec3(90.0,r,y-180))
            local tempoMesa = 10 - 4
            local tempo = tempoMesa
            while tempo > 0 do
                Wait(1000)
                if not IsEntityPlayingAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_a","idle_b", 3) then
                    playAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_a","idle_b")
                end
                if tempo == parseInt(tempoMesa / 2.5) then
                    vSERVER.tryDeleteEntity(ObjToNet(build))
                    Wait(300)
                    build = createEntity("prop_fncwood_16d",coord,false,true,GetEntityRotation(PlayerPedId()))
                elseif tempo == parseInt(tempoMesa / 1.5) then
                    vSERVER.tryDeleteEntity(ObjToNet(build))
                    local p,r,y = table.unpack(GetEntityRotation(PlayerPedId()))
                    p = 90.0
                    Wait(300)
                    build = createEntity("prop_fncwood_16c",coord,false,true,vec3(90.0,r,y-180))
                end
                tempo = tempo - 1
            end
            playAnim(PlayerPedId(),"amb@prop_human_bum_bin@exit","exit")
            Wait(500)
            vSERVER.tryDeleteEntity(ObjToNet(build))
            mesa = nil
            mesacoords = nil
            drugs = nil
            drugsnet = nil
            vSERVER.removeBancada()
            desmontando = false
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("Notify","azul","Bancada desmontada com sucesso!",5000)
        end)
    else
        mesa = nil
        mesacoords = nil
        drugs = nil
        drugsnet = nil
        vSERVER.removeBancada()
        TriggerEvent("Notify","azul","Bancada desmontada com sucesso!",5000)
	end
end)




RegisterCommand("venderdroga", function()
    if mesa and not vendendo then
        TriggerEvent("Notify","azul","Vendas iniciadas!",5000)
    end
    trySellDrugs()
end)


RegisterCommand("pararvenda", function()
    if vendendo then
        stopSelling = true
        TriggerEvent("Notify","azul","Vendas canceladas!",5000)
    end
end)


function addBlip(x,y,z,idtype,idcolor,text,scale)
	local blip = AddBlipForCoord(x+0.001,y+0.001,z+0.001)
	SetBlipSprite(blip,idtype)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,idcolor)
	SetBlipScale(blip,scale)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
	return blip
end






------ CREDITOS PELO VAZAMENTO -------
--------  discord.gg/dogz1n  ---------

