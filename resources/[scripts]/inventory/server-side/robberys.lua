-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Cooldown = {
	["weaponshop"] = {},
	["tattooshop"] = {},
	["fleecas"] = {},
	["departmentshop"] = {},
	["clotheshop"] = {},
	["barbershop"] = {},
	["banks"] = {},
	["jewelry"] = {},
	["eletronics"] = {},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS
-----------------------------------------------------------------------------------------------------------------------------------------
local Robberys = {
    ["weaponshop"] = {
        ["Cops"] = 2,
        ["Radio"] = 101,
        ["Duration"] = 300,
        ["Name"] = "Loja de Armas",
        ["Cooldown"] = 3600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 50000,
            ["Max"] = 75000
        }
    },
    ["tattooshop"] = {
        ["Cops"] = 2,
        ["Radio"] = 201,
        ["Duration"] = 300,
        ["Name"] = "Loja de Tatuagem",
        ["Cooldown"] = 3600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 50000,
            ["Max"] = 75000
        }
    },
    ["fleecas"] = {
        ["Cops"] = 6,
        ["Radio"] = 301,
        ["Duration"] = 600,
        ["Name"] = "Banco Fleeca",
        ["Cooldown"] = 21600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 125000,
            ["Max"] = 150000
        }
    },
    ["departmentshop"] = {
        ["Cops"] = 4,
        ["Radio"] = 401,
        ["Duration"] = 300,
        ["Name"] = "Loja de Departamento",
        ["Cooldown"] = 3600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 75000,
            ["Max"] = 100000
        }
    },
    ["clotheshop"] = {
        ["Cops"] = 2,
        ["Radio"] = 501,
        ["Duration"] = 300,
        ["Name"] = "Loja de Roupas",
        ["Cooldown"] = 3600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 50000,
            ["Max"] = 75000
        }
    },
    ["barbershop"] = {
        ["Cops"] = 4,
        ["Radio"] = 601,
        ["Duration"] = 300,
        ["Name"] = "Barbearia",
        ["Cooldown"] = 3600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 25000,
            ["Max"] = 30000
        }
    },
    ["banks"] = {
        ["Cops"] = 0,
        ["Radio"] = 701,
        ["Duration"] = 600,
        ["Name"] = "Banco",
        ["Cooldown"] = 21600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 225000,
            ["Max"] = 250000
        }
    },
    ["jewelry"] = {
        ["Cops"] = 8,
        ["Radio"] = 801,
        ["Duration"] = 600,
        ["Name"] = "Joalheria",
        ["Cooldown"] = 21600,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 100000,
            ["Max"] = 125000
        }
    },
    ["eletronics"] = {
        ["Cops"] = 2,
        ["Duration"] = 600,
        ["Name"] = "Caixa Eletrônico",
        ["Cooldown"] = 1000,
        ["Payment"] = {
            ["Item"] = "dollars2",
            ["Min"] = 4725,
            ["Max"] = 5725
        }
    }  
}
local Objects = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:ROBBERYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Robberys")
AddEventHandler("inventory:Robberys",function(Crime,Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Robberys[Crime] then
        local Item = nil
        
        if Crime == "departmentshop" then
            Item = "card01"
        elseif Crime == "weaponshop" then
            Item = "card02"
        elseif Crime == "fleecas" then
            Item = "card03"
        elseif Crime == "barbershop" then
            Item = "card04"
        elseif Crime == "banks" then
            Item = "card05"
        elseif Crime == "eletronics" then
            if vRP.ConsultItem(Passport,"c4",1) then
                if not Cooldown[Crime][Number] or os.time() > Cooldown[Crime][Number] then
                    local Total = 0
                    local Groups = vRP.Groups()
                    for key,Value in pairs(Groups) do
                        if Value["Type"] == "Policia" then
                            local Service,Amount = vRP.NumPermission(key)
                            Total = Total + Amount
                        end
                    end
                    if Total >= Robberys[Crime]["Cops"] then
                        if vTASKBAR.Task(source,10,10000) then
                            local Hash = "ch_prop_ch_ld_bomb_01a"
                            local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
                            if Application then
                                Cooldown[Crime][Number] = os.time() + Robberys[Crime]["Cooldown"]

                                if vRP.TakeItem(Passport,"c4",1,true) then
                                    local Number = 0
                                
                                    repeat
                                        Number = Number + 1
                                    until not Objects[tostring(Number)]
                                
                                    Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100 }
                                    TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
        
                                    local Groups = vRP.Groups()
                                    for key,Value in pairs(Groups) do
                                        if Value["Type"] == "Policia" then
                                            local Service,Amount = vRP.NumPermission(key)
                                            for Passports,Sources in pairs(Service) do
                                                async(function()
                                                    TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
                                                    if Robberys[Crime]["Radio"] then
                                                        TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a "..Robberys[Crime]["Name"], x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Rádio da Negociação: "..Robberys[Crime]["Radio"], color = 22 })
                                                    else
                                                        TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a "..Robberys[Crime]["Name"], x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 22 })
                                                    end
                                                end)
                                            end
                                        end
                                    end

                                    Player(source)["state"]["Handcuff"] = false
                                    Player(source)["state"]["Commands"] = false
                                    Player(source)["state"]["Buttons"] = false
                                    TriggerClientEvent("Progress",source,30000)
                                    Active[Passport] = os.time() + 30
                                
                                    repeat
                                        if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
                                            vRPC.removeObjects(source)
                                            Active[Passport] = nil
                                        end
                                        Wait(100)
                                    until not Active[Passport]
                                    Player(source)["state"]["Handcuff"] = false
                                    Player(source)["state"]["Commands"] = false
                                    Player(source)["state"]["Buttons"] = false
                                    TriggerClientEvent("vRP:Explosion",source,Coords)
                                    TriggerClientEvent("objects:Remover",-1,tostring(Number))
                                    TriggerEvent("Wanted",source,Passport,Robberys[Crime]["Duration"])
        
                                    Active[Passport] = os.time() + 15
                                    local Ped = GetPlayerPed(source)
                             
                             
                                    repeat
                                        if Active[Passport] then
                                            if os.time() >= parseInt(Active[Passport]) then
                                                Active[Passport] = nil
                                            else
                                                if #(Coords - GetEntityCoords(Ped)) <= 2.0 then
                                                    vRP.GenerateItem(Passport,Robberys[Crime]["Payment"]["Item"],math.random(Robberys[Crime]["Payment"]["Min"],Robberys[Crime]["Payment"]["Max"]),true)
                                                    Active[Passport] = nil
                                                end
                                            end
                                        end
                                        Wait(1000)
                                    until not Active[Passport]

                                end
                            end
                        end
                    else
                        TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000,"Atenção")
                    end
                else
                    TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Cooldown[Crime][Number] - os.time().."</b> segundos.",5000,"Atenção")
                end
            else
                TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("c4").."</b>.",5000)
            end
            return
        end

        local Inventory = vRP.Inventory(Passport)
		for Slot,Value in pairs(Inventory) do
			if SplitOne(Value["item"]) == Item then
                if vRP.TakeItem(Passport,Value["item"],1,true) then
                    if not Cooldown[Crime][Number] or os.time() > Cooldown[Crime][Number] then
                        local Total = 0
                        local Groups = vRP.Groups()
                        for key,Value in pairs(Groups) do
                            if Value["Type"] == "Policia" then
                                local Service,Amount = vRP.NumPermission(key)
                                Total = Total + Amount
                            end
                        end
                        if Total >= Robberys[Crime]["Cops"] then
            
                            vRP.FreezePlayer(source,true)
                            
                            Cooldown[Crime][Number] = os.time() + Robberys[Crime]["Cooldown"]

                            if Robberys[Crime]["Radio"] then
                                TriggerClientEvent("Notify",source,"azul","Rádio da Negociação: <b>"..Robberys[Crime]["Radio"].."</b>",10000,"Atenção")
                            end

                            local Coords = vRP.GetEntityCoords(source)
                            for key,Value in pairs(Groups) do
                                if Value["Type"] == "Policia" then
                                    local Service,Amount = vRP.NumPermission(key)
                                    for Passports,Sources in pairs(Service) do
                                        async(function()
                                            TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
                                            if Robberys[Crime]["Radio"] then
                                                TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a "..Robberys[Crime]["Name"], x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Rádio da Negociação: "..Robberys[Crime]["Radio"], color = 22 })
                                            else
                                                TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a "..Robberys[Crime]["Name"], x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 22 })
                                            end
                                        end)
                                    end
                                end
                            end

                            if Crime == "fleecas" then
                                if not vMEMORY.Memory(source) then
                                    return
                                end
                            end
            

                            vRPC.AnimActive(source)
                            Player(source)["state"]["Buttons"] = true
                            Active[Passport] = os.time() + Robberys[Crime]["Duration"]
                            TriggerEvent("Wanted",source,Passport,Robberys[Crime]["Duration"])
                            vRPC.playAnim(source,false,{"oddjobs@shop_robbery@rob_till","loop"},true)
                            TriggerClientEvent("Progress",source,Robberys[Crime]["Duration"] * 1000)
            
                            repeat
                                if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
                                    vRPC.removeObjects(source)
                                    Active[Passport] = nil
                                    vRP.FreezePlayer(source,false)
                                    Player(source)["state"]["Buttons"] = false
                                    vRP.GenerateItem(Passport,Robberys[Crime]["Payment"]["Item"],math.random(Robberys[Crime]["Payment"]["Min"],Robberys[Crime]["Payment"]["Max"]),true)
                                end
                                Wait(100)
                            until not Active[Passport]
        
                        else
                            TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000,"Atenção")
                        end
                    else
                        TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Cooldown[Crime][Number] - os.time().."</b> segundos.",5000,"Atenção")
                    end
                end
                return
            end
        end

        TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName(Item).."</b>.",5000,"Atenção")
	end
end)