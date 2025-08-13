Proxy = module("vrp","lib/Proxy")
Tunnel = module("vrp","lib/Tunnel")
vRP = Proxy.getInterface("vRP")

---###############---
---##[ License ]##---
---###############---

exports("license", function()
    return '72c6b97f-90c3-4d6d-a81d-aa72a9dd7e60'
end)

---###############---
---##[ Configs ]##---
---###############---

Config = {}

Config.base = "summerz"                                        -- 'vrpex' / 'creative' / 'summerz'

Config.imgDiret = "http://income.ind.br/images/"       -- Diretorio das imagens dos veiculos
--[[
 Caso não tenho um diretorio, há a opçao de baixar imagens dos veiculos pelo link:
 https://drive.google.com/file/d/1d2TfMHP5YfUMe6R2YczXICEYWKLyUM8B/view?usp=sharing

 Apos baixar, colocar a pasta images dentro da pasta web-side, e usar o diretorio:
 nui://will_ficha_v3/web-side/images/
]]

Config.vehicle_db = "vehicles"                              -- Banco de dados de veiculos
Config.differentPlate = false

Config.debug = false

Config.openPainel = "mdt"

Config.permissions = {                                          -- Permissões padrão e para o gerenciamento
    ['Police'] = "Policia",
    ['Administration'] = {
        ['Perm'] = "Policia",
        ['Acesso'] = { 1, 2 }
    }
}

Config.hierarquia = {                                           -- Hierarquia da Policia (A ordem é IMPORTANTE!)
    [1] = "Coronel",
    [2] = "Capitao",
    [3] = "Major",
    [4] = "Tenente",
    [5] = "Sub.Tenente",
    [6] = "Sargento",
    [7] = "2Sargento",
    [8] = "3Sargento",
    [9] = "Cabo",
    [10] = "Soldado",
    [11] = "Recruta"
}

Config.coords_prison = {                                        -- Coordenadas ao ser preso e ao ser solto
    ['Preso'] = vector3(1680.1,2513.0,45.5),
    ['Solto'] = vector3(1850.5,2604.0,45.5),
}

Config.fugaPrisao = true

Config.serviceTime = {                                          -- Configuração para reduzir o tempo de prisão
    ['Time_cooldown'] = 60,                                     -- Tempo para reduzir a quantidade de meses presos (60 segundos)
    ['Tempo'] = 1,                                              -- A cada 'Time_cooldown' segundos, diminui 1
    ['Reduzir'] = 4,                                            -- Reduzir pena por serviço
    ['Limite'] = -1,                                             -- Limite para parar de trabalhar
    ['Caixa'] = {                                               -- Configuração do emprego de carregar caixa
        ['Pegar'] = vector3(1691.59,2566.05,45.56),
        ['Entregar'] = vector3(1669.51,2487.71,45.82),
        
    }
}

----################----
----##[ Webhooks ]##----
----################----

Config.hookManagment = ""                                       -- Webhook para o gerenciamento dos policias

Config.hookPrisao = ""                                          -- Webhook ao prender alguem

Config.hookMulta = ""                                           -- Webhook ao multar alguem

Config.post_photo = ""                                          -- Webhook para registrar a foto

----#######################----
--##[ Codigo serviceTimel ]##--
----#######################----

Config.timeReductionList = {                                    -- Porcentagem para reduzir os meses de prisão
    0,
	10,
	20,
	30,
	40,
	50,
}

Config.vehicleStatusList = {                                    -- Status dos veiculos
    'Regular',
	'Detido',
	'Roubado',
}

Config.codigo_penal = {
    [1] = {
        name = "Homicídio",
        serviceTime = 10,
        taxValue = 1000,
    },
    [2] = {
        name = "Roubo ao Banco Central",
        serviceTime = 100,
        taxValue = 30000,
    },  
    [3] = {
        name = "Roubo a Lojinha",
        serviceTime = 20,
        taxValue = 5000,
    },
    [4] = {
        name = "Tentativa de Homicídio",
        serviceTime = 50,
        taxValue = 10000,
    },
    [5] = {
        name = "Tráfico de Armas",
        serviceTime = 55,
        taxValue = 50000,
    },
    [6] = {
        name = "Desobediência",
        serviceTime = 10,
        taxValue = 5000,
    },
    [7] = {
        name = "Posse de algema, capuz, C4 ou lockpick",
        serviceTime = 35,
        taxValue = 20000,
    },
    [8] = {
        name = "Ocultação Facial",
        serviceTime = 0,
        taxValue = 7500,
    },
}

----################----
--##[  FUNCTIONS  ]##--
----################----

Config.notification = function(source,msg,variable1,variable2)
    if variable1 == nil then variable1 = "" end
    if variable2 == nil then variable2 = "" end
    local Notifys = {
        ['Applied_prison'] = {
            Type = "sucesso",
            Msg = "Detenção aplicada com sucesso."
        },
        ['Receive_prison'] = {
            Type = "importante",
            Msg = "Você foi preso por <b>"..variable1.."</b> meses. Motivo: "..variable2.."."
        },
        ['Receive_fine'] = {
            Type = "importante",
            Msg = "Você recebeu uma multa de <b>R$"..variable1.."</b>"
        },
        ['Rest_prison'] = {
            Type = "aviso",
            Msg = "Você ainda tem <b>"..variable1.." meses</b> restantes."
        },
        ['Limit_work'] = {
            Type = "negado",
            Msg = "Atingiu o limite da redução de pena, não precisa mais trabalhar."
        },
    }
    TriggerClientEvent("Notify",source,Notifys[msg].Type,Notifys[msg].Msg,5000)
end

Config.drawMark = function(x,y,z)
    DrawMarker(21,x,y,z - 0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,240,202,87,150,0,0,0,1)
end

Config.drawText = function(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end
