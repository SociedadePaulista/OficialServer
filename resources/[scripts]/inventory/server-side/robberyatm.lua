function Creative.rouboatm()
    local Service,Total = vRP.NumPermission("Policia")
    if Total >= 0 then
        local Coords = vRP.GetEntityCoords(source)
        for Passports,Sources in pairs(Service) do
            async(function()
                TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
                TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Caixa Eletronico", x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 22 })
            end)
        end
        return true
    else
        TriggerClientEvent("Notify",source,"amarelo","Contingente indisponível.",5000,"Atenção")
    end
    return false
end

RegisterServerEvent("ad_atmrobbery:reward")
AddEventHandler("ad_atmrobbery:reward", function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.GenerateItem(Passport,"dollars2",math.random(5000, 10000),true)
	end
end)

RegisterServerEvent("ad_atmrobbery:clrspawn")
AddEventHandler("ad_atmrobbery:clrspawn", function()
	local source = source
    local Coords = vRP.GetEntityCoords(source)
    local Service,Total = vRP.NumPermission("Lspd")
    for Passports,Sources in pairs(Service) do
        async(function()
            TriggerClientEvent("sounds:Private",Sources,"crime",0.5)
            TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a Caixa Eletronico", x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 22 })
        end)
    end
    TriggerClientEvent("ad_atmrobbery:clrspawn", -1)
end)

RegisterServerEvent("ad_atmrobbery:attro1")
AddEventHandler("ad_atmrobbery:attro1", function(pr1, pr2)
    TriggerClientEvent("ad_atmrobbery:attro1", -1, pr1, pr2)
end)

RegisterServerEvent("ad_atmrobbery:attro2")
AddEventHandler("ad_atmrobbery:attro2", function(dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
    TriggerClientEvent("ad_atmrobbery:attro2", -1, dpratm, atmco1, atmco2, atmco3, netveh, propsdad)
end)

RegisterServerEvent("ad_atmrobbery:propas")
AddEventHandler("ad_atmrobbery:propas", function(psa)
    TriggerClientEvent("ad_atmrobbery:propas", -1, psa)
end)

RegisterServerEvent("ad_atmrobbery:deles")
AddEventHandler("ad_atmrobbery:deles", function(sda)
    TriggerClientEvent("ad_atmrobbery:deles", -1, sda)
end)

RegisterServerEvent("ad_atmrobbery:delesr")
AddEventHandler("ad_atmrobbery:delesr", function(rope)
    TriggerClientEvent("ad_atmrobbery:delesr", -1, rope)
end)