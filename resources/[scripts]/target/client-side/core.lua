-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("target")
vPLAYER = Tunnel.getInterface("player")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Zones = {}
local Models = {}
local Selected = {}
local Sucess = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOWS
-----------------------------------------------------------------------------------------------------------------------------------------
local Tows = PolyZone:Create({
	vector2(-723.09,-1687.29),
	vector2(-740.2,-1692.85),
	vector2(-737.85,-1665.82),
	vector2(-722.25,-1664.28)
},{ name = "Impound" })
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
local Dismantler = 1
local FreezeDismantle = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
local Dismantle = {
	vec3(943.23,-1497.87,30.11),
	vec3(-1172.57,-2037.65,13.75),
	vec3(-524.94,-1680.63,19.21),
	vec3(1358.14,-2095.41,52.0),
	vec3(602.47,-437.82,24.75),
	vec3(-413.86,-2179.29,10.31),
	vec3(146.51,320.62,112.14),
	vec3(520.91,169.14,99.36),
	vec3(1137.99,-794.32,57.59),
	vec3(-93.07,-2549.6,6.0),
	vec3(820.07,-488.43,30.46),
	vec3(1078.62,-2325.56,30.25),
	vec3(1204.69,-3116.71,5.50)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:DISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Dismantle")
AddEventHandler("target:Dismantle",function(Model)
	if not FreezeDismantle then
		FreezeDismantle = true
		Dismantler = math.random(#Dismantle)
		TriggerEvent("NotifyPush",{ code = 20, title = "Localização do Desmanche", x = Dismantle[Dismantler]["x"], y = Dismantle[Dismantler]["y"], z = Dismantle[Dismantler]["z"], vehicle = VehicleName(Model), color = 60 })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISMANTLE:RESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dismantle:Reset")
AddEventHandler("dismantle:Reset",function()
	FreezeDismantle = false
	local Backup = Dismantler
	repeat
		Dismantler = math.random(#Dismantle)
	until Backup ~= Dismantler
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRELIST
-----------------------------------------------------------------------------------------------------------------------------------------
local tyreList = {
	["wheel_lf"] = 0,
	["wheel_rf"] = 1,
	["wheel_lm"] = 2,
	["wheel_rm"] = 3,
	["wheel_lr"] = 4,
	["wheel_rr"] = 5
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Fuels = {
	{ 273.83,-1253.46,28.29,2.5 },
	{ 273.83,-1261.29,28.29,2.5 },
	{ 273.83,-1268.63,28.29,2.5 },
	{ 265.06,-1253.46,28.29,2.5 },
	{ 265.06,-1261.29,28.29,2.5 },
	{ 265.06,-1268.63,28.29,2.5 },
	{ 256.43,-1253.46,28.29,2.5 },
	{ 256.43,-1261.29,28.29,2.5 },
	{ 256.43,-1268.63,28.29,2.5 },
	{ 2680.90,3266.40,54.39,2.5 },
	{ 2678.51,3262.33,54.39,2.5 },
	{ -2104.53,-311.01,12.16,2.5 },
	{ -2105.39,-319.21,12.16,2.5 },
	{ -2106.06,-325.57,12.16,2.5 },
	{ -2097.48,-326.48,12.16,2.5 },
	{ -2096.81,-320.11,12.16,2.5 },
	{ -2096.09,-311.90,12.16,2.5 },
	{ -2087.21,-312.81,12.16,2.5 },
	{ -2088.08,-321.03,12.16,2.5 },
	{ -2088.75,-327.39,12.16,2.5 },
	{ -2551.39,2327.11,32.24,2.5 },
	{ -2558.02,2326.70,32.24,2.5 },
	{ -2558.48,2334.13,32.24,2.5 },
	{ -2552.60,2334.46,32.24,2.5 },
	{ -2558.77,2341.48,32.24,2.5 },
	{ -2552.39,2341.89,32.24,2.5 },
	{ 186.97,6606.21,31.06,2.5 },
	{ 179.67,6604.93,31.06,2.5 },
	{ 172.33,6603.63,31.06,2.5 },
	{ 818.99,-1026.24,25.44,2.5 },
	{ 810.7,-1026.24,25.44,2.5 },
	{ 810.7,-1030.94,25.44,2.5 },
	{ 818.99,-1030.94,25.44,2.5 },
	{ 818.99,-1026.24,25.44,2.5 },
	{ 827.3,-1026.24,25.64,2.5 },
	{ 827.3,-1030.94,25.64,2.5 },
	{ 1207.07,-1398.16,34.39,2.5 },
	{ 1204.2,-1401.03,34.39,2.5 },
	{ 1210.07,-1406.9,34.39,2.5 },
	{ 1212.94,-1404.03,34.39,2.5 },
	{ 1178.97,-339.54,68.37,2.5 },
	{ 1186.4,-338.23,68.36,2.5 },
	{ 1184.89,-329.7,68.31,2.5 },
	{ 1177.46,-331.01,68.32,2.5 },
	{ 1175.71,-322.3,68.36,2.5 },
	{ 1183.13,-320.99,68.36,2.5 },
	{ 629.64,263.84,102.27,2.5 },
	{ 629.64,273.97,102.27,2.5 },
	{ 620.99,273.97,102.27,2.5 },
	{ 621.0,263.84,102.27,2.5 },
	{ 612.44,263.84,102.27,2.5 },
	{ 612.43,273.96,102.27,2.5 },
	{ 2588.41,358.56,107.66,2.5 },
	{ 2588.65,364.06,107.66,2.5 },
	{ 2581.18,364.39,107.66,2.5 },
	{ 2580.94,358.89,107.66,2.5 },
	{ 2573.55,359.21,107.66,2.5 },
	{ 2573.79,364.71,107.66,2.5 },
	{ 174.99,-1568.44,28.33,2.5 },
	{ 181.81,-1561.96,28.33,2.5 },
	{ 176.03,-1555.91,28.33,2.5 },
	{ 169.3,-1562.26,28.33,2.5 },
	{ -329.81,-1471.63,29.73,2.5 },
	{ -324.74,-1480.41,29.73,2.5 },
	{ -317.26,-1476.09,29.73,2.5 },
	{ -322.33,-1467.31,29.73,2.5 },
	{ -314.92,-1463.03,29.73,2.5 },
	{ -309.85,-1471.79,29.73,2.5 },
	{ 1786.08,3329.86,40.42,2.5 },
	{ 1785.04,3331.48,40.35,2.5 },
	{ 50.31,2778.54,57.05,2.5 },
	{ 48.92,2779.59,57.05,2.5 },
	{ 264.98,2607.18,43.99,2.5 },
	{ 263.09,2606.8,43.99,2.5 },
	{ 1035.45,2674.44,38.71,2.5 },
	{ 1043.22,2674.45,38.71,2.5 },
	{ 1043.22,2667.92,38.71,2.5 },
	{ 1035.45,2667.91,38.71,2.5 },
	{ 1209.59,2658.36,36.9,2.5 },
	{ 1208.52,2659.43,36.9,2.5 },
	{ 1205.91,2662.05,36.9,2.5 },
	{ 2539.8,2594.81,36.96,2.5 },
	{ 2001.55,3772.21,31.4,2.5 },
	{ 2003.92,3773.48,31.4,2.5 },
	{ 2006.21,3774.96,31.4,2.5 },
	{ 2009.26,3776.78,31.4,2.5 },
	{ 1684.6,4931.66,41.23,2.5 },
	{ 1690.1,4927.81,41.23,2.5 },
	{ 1705.74,6414.61,31.77,2.5 },
	{ 1701.73,6416.49,31.77,2.5 },
	{ 1697.76,6418.35,31.77,2.5 },
	{ -97.06,6416.77,30.65,2.5 },
	{ -91.29,6422.54,30.65,2.5 },
	{ -1808.71,799.96,137.69,2.5 },
	{ -1803.62,794.4,137.69,2.5 },
	{ -1797.22,800.56,137.66,2.5 },
	{ -1802.31,806.12,137.66,2.5 },
	{ -1795.93,811.97,137.7,2.5 },
	{ -1790.83,806.41,137.7,2.5 },
	{ -1438.07,-268.69,45.41,2.5 },
	{ -1444.5,-274.23,45.41,2.5 },
	{ -1435.5,-284.68,45.41,2.5 },
	{ -1429.07,-279.15,45.41,2.5 },
	{ -732.64,-932.51,18.22,2.5 },
	{ -732.64,-939.32,18.22,2.5 },
	{ -724.0,-939.32,18.22,2.5 },
	{ -724.0,-932.51,18.22,2.5 },
	{ -715.43,-932.51,18.22,2.5 },
	{ -715.43,-939.32,18.22,2.5 },
	{ -532.28,-1212.71,17.33,2.5 },
	{ -529.51,-1213.96,17.33,2.5 },
	{ -524.92,-1216.15,17.33,2.5 },
	{ -522.23,-1217.42,17.33,2.5 },
	{ -518.52,-1209.5,17.33,2.5 },
	{ -521.21,-1208.23,17.33,2.5 },
	{ -525.8,-1206.04,17.33,2.5 },
	{ -528.57,-1204.8,17.33,2.5 },
	{ -72.03,-1765.1,28.53,2.5 },
	{ -69.45,-1758.01,28.55,2.5 },
	{ -77.59,-1755.05,28.81,2.5 },
	{ -80.17,-1762.14,28.8,2.5 },
	{ -63.61,-1767.93,28.27,2.5 },
	{ -61.03,-1760.85,28.31,2.5 },
	{ 814.53,-789.63,25.251,2.5 },
	{ 812.96,-789.63,25.251,2.5 },
	{ 807.00,-789.63,25.251,2.5 },
	{ 805.42,-789.63,25.251,2.5 },
	{ 442.83,-985.87,42.69,10.0 },
	{ -697.93,319.61,139.14,10.0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:ANIMDEITAR
-----------------------------------------------------------------------------------------------------------------------------------------
local beds = {
	[-1498379115] = { 1.0,90.0 },
	[-1519439119] = { 1.0,0.0 },
	[-289946279] = { 1.0,0.0 }
}

RegisterNetEvent("target:animDeitar")
AddEventHandler("target:animDeitar",function()
	if not Previous then
		local Ped = PlayerPedId()
		Previous = GetEntityCoords(Ped)
		local objCoords = GetEntityCoords(Selected[1])
		SetEntityCoords(Ped,objCoords["x"],objCoords["y"],objCoords["z"] + beds[Selected[2]][1],false,false,false,false)
		vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
		SetEntityHeading(Ped,GetEntityHeading(Selected[1]) + beds[Selected[2]][2] - 180.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPBED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpBed")
AddEventHandler("target:UpBed",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:SENTAR
-----------------------------------------------------------------------------------------------------------------------------------------
local Previous = nil
local chairs = {
	[-171943901] = 0.0,
	[-109356459] = 0.5,
	[1805980844] = 0.5,
	[-99500382] = 0.3,
	[1262298127] = 0.0,
	[1737474779] = 0.5,
	[2040839490] = 0.0,
	[1037469683] = 0.4,
	[867556671] = 0.4,
	[-1521264200] = 0.0,
	[-741944541] = 0.4,
	[-591349326] = 0.5,
	[-293380809] = 0.5,
	[-628719744] = 0.5,
	[-1317098115] = 0.5,
	[1630899471] = 0.5,
	[38932324] = 0.5,
	[-523951410] = 0.5,
	[725259233] = 0.5,
	[764848282] = 0.5,
	[2064599526] = 0.5,
	[536071214] = 0.5,
	[589738836] = 0.5,
	[146905321] = 0.5,
	[47332588] = 0.5,
	[-1118419705] = 0.5,
	[538002882] = -0.1,
	[-377849416] = 0.5,
	[96868307] = 0.5,
	[-1195678770] = 0.7,
	[-853526657] = -0.1,
	[652816835] = 0.8,
	[-1086524442] = 0.8,
	[-1222451822] = 0.5,
	[-399437949] = 0.5,
	[-992710074] = 0.69,
	[1816935351] = 0.5,
	[1889748069] = 0.5,
	[-1692811878] = 0.5,
	[1577885496] = 0.5,
	[2129125614] = 0.5,
	[736919402] = 0.5,
	[444105316] = 0.5,
	[448106647] = 0.5,
}

RegisterNetEvent("target:animSentar")
AddEventHandler("target:animSentar",function()
	if not Previous then
		local Ped = PlayerPedId()
		local objCoords = GetEntityCoords(Selected[1])
		FreezeEntityPosition(Selected[1],true)

		local Heading = GetEntityHeading(Selected[1])
		if chairs[Selected[2]] ~= 0.7 then
			Heading = GetEntityHeading(Selected[1]) - 180.0
		end

		TaskStartScenarioAtPosition(Ped,"PROP_HUMAN_SEAT_CHAIR_UPRIGHT",objCoords["x"],objCoords["y"],objCoords["z"] + chairs[Selected[2]],Heading,-1,true,true)

		Previous = GetEntityCoords(Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:UPCHAIR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:UpChair")
AddEventHandler("target:UpChair",function()
	if Previous then
		local Ped = PlayerPedId()
		SetEntityCoords(Ped,Previous["x"],Previous["y"],Previous["z"] - 1,false,false,false,false)
		Previous = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	RegisterCommand("+entityTarget",TargetEnable)
	RegisterCommand("-entityTarget",TargetDisable)
	RegisterKeyMapping("+entityTarget","Interação auricular.","keyboard","LMENU")

	AddCircleZone("CallMcDonalds",vec3(87.5,292.53,110.2),0.5,{
		name = "CallMcDonalds",
	},{
		shop = "McDonalds",
		Distance = 1.0,
		options = {
			{
				event = "target:CallWorks",
				label = "Buscar Entregadores",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("TrayMcDonalds",vec3(78.24,279.88,110.18),0.5,{
		name = "TrayMcDonalds",
	},{
		shop = "TrayMcDonalds",
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "shop",
				service = "Tray"
			}
		},
		Distance = 1.25
	})

	AddCircleZone("TrayMcDonalds2",vec3(87.45,277.57,110.18),0.5,{
		name = "TrayMcDonalds2",
	},{
		shop = "TrayMcDonalds",
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "shop",
				service = "Tray"
			}
		},
		Distance = 1.25
	})

	AddCircleZone("TrayMcDonalds3",vec3(79.84,283.56,110.18),0.5,{
		name = "TrayMcDonalds3",
	},{
		shop = "TrayMcDonalds",
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "shop",
				service = "Tray"
			}
		},
		Distance = 1.25
	})


	AddCircleZone("CallCluckinBell",vec3(-510.34,-702.67,33.16),0.5,{
		name = "CallCluckinBell",
	},{
		shop = "CluckinBell",
		Distance = 1.0,
		options = {
			{
				event = "target:CallWorks",
				label = "Buscar Entregadores",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("TrayCluckinBell",vec3(-517.87,-697.62,33.16),0.5,{
		name = "TrayCluckinBell",
	},{
		shop = "TrayCluckinBell",
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "shop",
				service = "Tray"
			}
		},
		Distance = 1.25
	})

	AddCircleZone("TrayCluckinBell2",vec3(-516.06,-697.63,33.16),0.5,{
		name = "TrayCluckinBell:2",
	},{
		shop = "TrayCluckinBell2",
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "shop",
				service = "Tray"
			}
		},
		Distance = 1.25
	})

	AddCircleZone("TrayCluckinBell3",vec3(-519.52,-697.58,33.16),0.5,{
		name = "TrayCluckinBell3",
	},{
		shop = "TrayCluckinBell3",
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "shop",
				service = "Tray"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 1089807209,1098122770 },{
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "entity",
				service = "Safe"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ 1363150739 },{
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "entity",
				service = "Postal"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ 1437508529,1329570871,1614656839,-130812911,-93819890,1143474856,-228596739,-468629664,-1830793175,-329415894,1919238784 },{
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "entity",
				service = "Trash"
			}
		},
		Distance = 0.75
	})
	
	AddTargetModel({ -1186769817,1211559620,-377891123,1375076930,720581693,917457845,261193082,-756152956,-1383056703,-838860344,1287257122 },{
		options = {
			--[[ {
				event = "inventory:VerifyObjects",
				label = "Reabastecer Estoque",
				tunnel = "shop",
				service = "News"
			}, ]]
			{
				event = "target:newspaper",
				label = "Comprar Jornal",
				tunnel = "server"
			}
		},
		Distance = 0.75
	})

	AddCircleZone("CityHall",vec3(262.94,-418.69,45.29),0.5,{
		name = "CityHall",
	},{
		Distance = 1.75,
		options = {
			{
				event = "inventory:Identity",
				label = "Identidade",
				tunnel = "server",
			},
			{
				event = "inventory:Propertys",
				label = "Propriedades",
				tunnel = "client",
			},
		}
	})

	AddCircleZone("Keychain",vec3(166.73,-1803.23,29.32),0.5,{
		name = "Keychain",
	},{
		Distance = 1.75,
		options = {
			{
				event = "inventory:Key",
				label = "Criar Chave Cópia",
				tunnel = "client",
			}
		}
	})

	AddCircleZone("Desmanche",vec3(116.31,-1088.94,29.23),0.5,{
        name = "Desmanche",
        heading = 155.91
    },{
        shop = "Santos",
        Distance = 1.0,
        options = {
            {
                event = "Desmanche:Iniciar",
                label = "Iniciar o Desmanche",
                tunnel = "shop"
            }
        }
    })

	AddCircleZone("Electricity", vec3(2101.75, 2322.74, 94.53), 0.5, {
		name = "Electricity",
		heading = 0.0
	}, {
		Distance = 0.75,
		options = {
			{
				event = "inventory:Electricity",
				label = "Sabotar",
				tunnel = "server"
			}
		}
	})

	AddTargetModel({ -2007231801,1339433404,1694452750,1933174915,-462817101,-469694731,-164877493,486135101 },{
		options = {
			{
				event = "shops:Fuel",
				label = "Combustível",
				tunnel = "client"
			}
		},
		Distance = 0.75
	})

	AddCircleZone("makePaper",vec3(-533.18,5292.15,74.17),0.5,{
		name = "makePaper",
		heading = 3374176
	},{
		Distance = 0.75,
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Produzir",
				tunnel = "proserver",
				service = "paper"
			}
		}
	})

	AddCircleZone("Yoga01",vec3(-492.83,-217.31,35.61),0.5,{
		name = "Yoga01",
		heading = 3374176
	},{
		Distance = 1.25,
		options = {
			{
				event = "player:Yoga",
				label = "Yoga",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("Yoga02",vec3(-492.87,-219.03,36.55),0.5,{
		name = "Yoga02",
		heading = 3374176
	},{
		Distance = 1.25,
		options = {
			{
				event = "player:Yoga",
				label = "Yoga",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("Yoga03",vec3(-492.89,-220.68,36.51),0.5,{
		name = "Yoga03",
		heading = 3374176
	},{
		Distance = 1.25,
		options = {
			{
				event = "player:Yoga",
				label = "Yoga",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("Yoga04",vec3(-490.21,-220.91,36.51),0.5,{
		name = "Yoga04",
		heading = 3374176
	},{
		Distance = 1.25,
		options = {
			{
				event = "player:Yoga",
				label = "Yoga",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("Yoga05",vec3(-490.18,-219.24,36.58),0.5,{
		name = "Yoga05",
		heading = 3374176
	},{
		Distance = 1.25,
		options = {
			{
				event = "player:Yoga",
				label = "Yoga",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("Yoga06",vec3(-490.16,-217.33,36.63),0.5,{
		name = "Yoga06",
		heading = 3374176
	},{
		Distance = 1.25,
		options = {
			{
				event = "player:Yoga",
				label = "Yoga",
				tunnel = "client"
			}
		}
	})

	AddTargetModel({ 654385216,161343630,-430989390,1096374064,-1519644200,-1932041857,207578973,-487222358 },{
		options = {
			{
				event = "slotmachine:Init",
				label = "Caça-Níqueis",
				tunnel = "client"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -1691644768,-742198632 },{
		options = {
			{
				event = "inventory:MakeProducts",
				label = "Encher",
				tunnel = "proserver",
				service = "plasticbottle"
			},
			{
				event = "inventory:Drink",
				label = "Beber",
				tunnel = "server"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -935625561 },{
		options = {
			{
				event = "target:BedDeitar",
				label = "Deitar",
				tunnel = "client"
			},{
				event = "target:BedPickup",
				label = "Pegar",
				tunnel = "client"
			},{
				event = "target:BedDestroy",
				label = "Destruir",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ -1498379115,-1519439119,-289946279 },{
		options = {
			{
				event = "target:animDeitar",
				label = "Deitar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ -171943901,-109356459,1805980844,-99500382,1262298127,1737474779,2040839490,1037469683,867556671,-1521264200,-741944541,-591349326,-293380809,-628719744,-1317098115,1630899471,38932324,-523951410,725259233,764848282,2064599526,536071214,589738836,146905321,47332588,-1118419705,538002882,-377849416,96868307,-1195678770,-853526657,652816835,-1086524442,-1222451822,-399437949,-992710074,1816935351,1889748069,-1692811878,1577885496,2129125614,736919402,444105316 },{
		options = {
			{
				event = "target:animSentar",
				label = "Sentar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ 690372739 },{
		options = {
			{
				event = "shops:Coffee",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ -654402915,1421582485 },{
		options = {
			{
				event = "shops:Donut",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 992069095,1114264700 },{
		options = {
			{
				event = "shops:Soda",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 1129053052 },{
		options = {
			{
				event = "shops:Hamburger",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ -1581502570 },{
		options = {
			{
				event = "shops:Hotdog",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 73774428 },{
		options = {
			{
				event = "shops:Cigarette",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ -272361894 },{
		options = {
			{
				event = "shops:Chihuahua",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})

	AddTargetModel({ 1099892058 },{
		options = {
			{
				event = "shops:Water",
				label = "Comprar",
				tunnel = "client"
			}
		},
		Distance = 1.0
	})
	
	AddTargetModel({ -832573324,-1430839454,1457690978,1682622302,402729631,-664053099,1794449327,307287994,-1323586730,111281960,-541762431,-745300483,-417505688 },{
		options = {
			{
				event = "inventory:Animals",
				label = "Esfolar",
				tunnel = "server"
			}
		},
		Distance = 1.25
	})

	AddTargetModel({ 1281992692,1158960338,1511539537,-78626473,-429560270 },{
		options = {
			{
				event = "target:callPhone",
				label = "Ligar Paramédico",
				tunnel = "police",
				service = "Hospital"
			},
			{
				event = "target:callPhone",
				label = "Ligar Mecânico",
				tunnel = "police",
				service = "Mechanic"
			},
			{
				event = "target:callPhone",
				label = "Ligar Policia",
				tunnel = "police",
				service = "Policia"
			},
		},
		Distance = 1.0
	})

	AddTargetModel({ -1207886863, 568309711, 200010599, 1888301071, 1677473970, 323971301 }, {
		options = {
			{
				event = "inventory:Pumpjack",
				label = "Procurar Petróleo",
				tunnel = "server"
			}
		},
		Distance = 2.5
	})

	AddTargetModel({ 684586828,577432224,-1587184881,-1426008804,-1096777189,-2096124444,-115771139 },{
		options = {
			{
				event = "inventory:Trasher",
				label = "Abrir",
				tunnel = "server"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -206690185,666561306,218085040,-58485588,1511880420,682791951 },{
		options = {
			{
				event = "player:enterTrash",
				label = "Esconder",
				tunnel = "client"
			},{
				event = "player:checkTrash",
				label = "Verificar",
				tunnel = "server"
			},{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "entity",
				service = "Trash"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -329415894 },{
		options = {
			{
				event = "chest:Open",
				label = "Abrir",
				tunnel = "entity",
				service = "Custom"
			}
		},
		Distance = 0.75
	})

	AddTargetModel({ -1940238623,2108567945 },{
		options = {
			{
				event = "inventory:ParkingMeter",
				label = "Roubar",
				tunnel = "server"
			}
		},
		Distance = 0.75
	})

	AddCircleZone("Pdm",vec3(-57.29,-1097.35,26.42),0.75,{
		name = "Pdm",
		heading = 0.0
	},{
		Distance = 2.0,
		options = {
			{
				event = "pdm:Open",
				label = "Abrir",
				tunnel = "shop"
			}
		}
	})

	AddCircleZone("cemiteryMan",vec3(-1745.57,-205.19,57.37),0.5,{
		name = "cemiteryMan",
		heading = 3374176
	},{
		Distance = 1.0,
		options = {
			{
				event = "cemitery:initBody",
				label = "Conversar",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("CassinoWheel",vec3(988.37,43.06,71.3),0.5,{
		name = "CassinoWheel",
		heading = 3374176
	},{
		Distance = 1.5,
		options = {
			{
				event = "luckywheel:Target",
				label = "Roda da Fortuna",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("Medicplan",vec3(301.73,-591.11,43.27),0.5,{
		name = "Medicplan",
		heading = 62.37
	},{
		Distance = 2.5,
		options = {
			{
				event = "target:Medicplan",
				label = "Plano de Saúde",
				tunnel = "server"
			}
		}
	})

	AddTargetModel({ -870868698 },{
		options = {
			{
				event = "Atm",
				label = "Abrir",
				tunnel = "client"
			}
		},
		Distance = 0.75
	})

end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRELIST
-----------------------------------------------------------------------------------------------------------------------------------------
local tyreList = {
	["wheel_lf"] = 0,
	["wheel_rf"] = 1,
	["wheel_lm"] = 2,
	["wheel_rm"] = 3,
	["wheel_lr"] = 4,
	["wheel_rr"] = 5
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYRES
-----------------------------------------------------------------------------------------------------------------------------------------
local Tyres = {
	["wheel_lf"] = 0,
	["wheel_rf"] = 1,
	["wheel_lm"] = 2,
	["wheel_rm"] = 3,
	["wheel_lr"] = 4,
	["wheel_rr"] = 5
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Fuels = {
	vec3(273.83,-1253.46,28.29),
	vec3(273.83,-1261.29,28.29),
	vec3(273.83,-1268.63,28.29),
	vec3(265.06,-1253.46,28.29),
	vec3(265.06,-1261.29,28.29),
	vec3(265.06,-1268.63,28.29),
	vec3(256.43,-1253.46,28.29),
	vec3(256.43,-1261.29,28.29),
	vec3(256.43,-1268.63,28.29),
	vec3(2680.90,3266.40,54.39),
	vec3(2678.51,3262.33,54.39),
	vec3(-2104.53,-311.01,12.16),
	vec3(-2105.39,-319.21,12.16),
	vec3(-2106.06,-325.57,12.16),
	vec3(-2097.48,-326.48,12.16),
	vec3(-2096.81,-320.11,12.16),
	vec3(-2096.09,-311.90,12.16),
	vec3(-2087.21,-312.81,12.16),
	vec3(-2088.08,-321.03,12.16),
	vec3(-2088.75,-327.39,12.16),
	vec3(-2551.39,2327.11,32.24),
	vec3(-2558.02,2326.70,32.24),
	vec3(-2558.48,2334.13,32.24),
	vec3(-2552.60,2334.46,32.24),
	vec3(-2558.77,2341.48,32.24),
	vec3(-2552.39,2341.89,32.24),
	vec3(186.97,6606.21,31.06),
	vec3(179.67,6604.93,31.06),
	vec3(172.33,6603.63,31.06),
	vec3(818.99,-1026.24,25.44),
	vec3(810.7,-1026.24,25.44),
	vec3(810.7,-1030.94,25.44),
	vec3(818.99,-1030.94,25.44),
	vec3(818.99,-1026.24,25.44),
	vec3(827.3,-1026.24,25.64),
	vec3(827.3,-1030.94,25.64),
	vec3(1207.07,-1398.16,34.39),
	vec3(1204.2,-1401.03,34.39),
	vec3(1210.07,-1406.9,34.39),
	vec3(1212.94,-1404.03,34.39),
	vec3(1178.97,-339.54,68.37),
	vec3(1186.4,-338.23,68.36),
	vec3(1184.89,-329.7,68.31),
	vec3(1177.46,-331.01,68.32),
	vec3(1175.71,-322.3,68.36),
	vec3(1183.13,-320.99,68.36),
	vec3(629.64,263.84,102.27),
	vec3(629.64,273.97,102.27),
	vec3(620.99,273.97,102.27),
	vec3(621.0,263.84,102.27),
	vec3(612.44,263.84,102.27),
	vec3(612.43,273.96,102.27),
	vec3(2588.41,358.56,107.66),
	vec3(2588.65,364.06,107.66),
	vec3(2581.18,364.39,107.66),
	vec3(2580.94,358.89,107.66),
	vec3(2573.55,359.21,107.66),
	vec3(2573.79,364.71,107.66),
	vec3(174.99,-1568.44,28.33),
	vec3(181.81,-1561.96,28.33),
	vec3(176.03,-1555.91,28.33),
	vec3(169.3,-1562.26,28.33),
	vec3(-329.81,-1471.63,29.73),
	vec3(-324.74,-1480.41,29.73),
	vec3(-317.26,-1476.09,29.73),
	vec3(-322.33,-1467.31,29.73),
	vec3(-314.92,-1463.03,29.73),
	vec3(-309.85,-1471.79,29.73),
	vec3(1786.08,3329.86,40.42),
	vec3(1785.04,3331.48,40.35),
	vec3(50.31,2778.54,57.05),
	vec3(48.92,2779.59,57.05),
	vec3(264.98,2607.18,43.99),
	vec3(263.09,2606.8,43.99),
	vec3(1035.45,2674.44,38.71),
	vec3(1043.22,2674.45,38.71),
	vec3(1043.22,2667.92,38.71),
	vec3(1035.45,2667.91,38.71),
	vec3(1209.59,2658.36,36.9),
	vec3(1208.52,2659.43,36.9),
	vec3(1205.91,2662.05,36.9),
	vec3(2539.8,2594.81,36.96),
	vec3(2001.55,3772.21,31.4),
	vec3(2003.92,3773.48,31.4),
	vec3(2006.21,3774.96,31.4),
	vec3(2009.26,3776.78,31.4),
	vec3(1684.6,4931.66,41.23),
	vec3(1690.1,4927.81,41.23),
	vec3(1705.74,6414.61,31.77),
	vec3(1701.73,6416.49,31.77),
	vec3(1697.76,6418.35,31.77),
	vec3(-97.06,6416.77,30.65),
	vec3(-91.29,6422.54,30.65),
	vec3(-1808.71,799.96,137.69),
	vec3(-1803.62,794.4,137.69),
	vec3(-1797.22,800.56,137.66),
	vec3(-1802.31,806.12,137.66),
	vec3(-1795.93,811.97,137.7),
	vec3(-1790.83,806.41,137.7),
	vec3(-1438.07,-268.69,45.41),
	vec3(-1444.5,-274.23,45.41),
	vec3(-1435.5,-284.68,45.41),
	vec3(-1429.07,-279.15,45.41),
	vec3(-732.64,-932.51,18.22),
	vec3(-732.64,-939.32,18.22),
	vec3(-724.0,-939.32,18.22),
	vec3(-724.0,-932.51,18.22),
	vec3(-715.43,-932.51,18.22),
	vec3(-715.43,-939.32,18.22),
	vec3(-532.28,-1212.71,17.33),
	vec3(-529.51,-1213.96,17.33),
	vec3(-524.92,-1216.15,17.33),
	vec3(-522.23,-1217.42,17.33),
	vec3(-518.52,-1209.5,17.33),
	vec3(-521.21,-1208.23,17.33),
	vec3(-525.8,-1206.04,17.33),
	vec3(-528.57,-1204.8,17.33),
	vec3(-72.03,-1765.1,28.53),
	vec3(-69.45,-1758.01,28.55),
	vec3(-77.59,-1755.05,28.81),
	vec3(-80.17,-1762.14,28.8),
	vec3(-63.61,-1767.93,28.27),
	vec3(-61.03,-1760.85,28.31),
	vec3(814.53,-789.63,25.251),
	vec3(812.96,-789.63,25.251),
	vec3(807.00,-789.63,25.251),
	vec3(805.42,-789.63,25.251)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGETENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function TargetEnable()
	local Ped = PlayerPedId()
	local Coords = GetEntityCoords(Ped)
	if LocalPlayer["state"]["Active"] and not IsPauseMenuActive() then
		local Ped = PlayerPedId()
		if LocalPlayer["state"]["Invisible"] or LocalPlayer["state"]["Camera"] or LocalPlayer["state"]["Phone"] or LocalPlayer["state"]["usingPhone"] or LocalPlayer["state"]["Rope"] or not MumbleIsConnected() or LocalPlayer["state"]["Buttons"] or LocalPlayer["state"]["Commands"] or LocalPlayer["state"]["Handcuff"] or Sucess or IsPedArmed(Ped,6) or IsPedInAnyVehicle(Ped) or LocalPlayer["state"]["Route"] > 900000 then
			return
		end

		SendNUIMessage({ Action = "Open" })
		LocalPlayer["state"]:set("Target",true,false)

		local rgbBlue, rgbWhite = {65, 130, 226}, {255, 255, 255}
        local previousZones = {}
        local drawingZones = {}
        local lastUpdate = GetGameTimer()
		RequestStreamedTextureDict("shared")

		while LocalPlayer["state"]["Target"] do
			DisablePlayerFiring(PlayerPedId(), true)
			local hitZone,entCoords,entityHit = RayCastGamePlayCamera()
			local activeZones, nearZoneLookup = {}, {}
		
			for k,zone in pairs(Zones) do
				nearZoneLookup[zone.name] = true
				if Zones[k]:isPointInside(entCoords) and #(Coords - Zones[k]["center"]) <= zone["targetoptions"]["Distance"]+2 then 
					activeZones[zone.name] = true 
				end
				if not drawingZones[zone.name] and #(Coords - Zones[k]["center"]) <= zone["targetoptions"]["Distance"]+2 then
					drawingZones[zone.name] = { zone = zone, type = "in", fade = 0 }
				end
			end

			for _, zone in ipairs(previousZones) do
				local inNear = nearZoneLookup[zone.name]
				if not inNear and (not drawingZones[zone.name] or drawingZones[zone.name].type == "in") then
					drawingZones[zone.name] = { zone = zone, type = "out", fade = 100 }
				end
			end

			local currentTime = GetGameTimer()
			for name, fz in pairs(drawingZones) do
				local isActive = activeZones[fz.zone.name] ~= nil
				local opacity = map_range(fz.fade, 0, 100, 0, isActive and 255 or 200)
				if fz.type == "in" then
					fz.fade = math.min(fz.fade + 0.15 * (currentTime - lastUpdate), 100)
				elseif fz.type == "out" then
					fz.fade = math.max(fz.fade - 0.15 * (currentTime - lastUpdate), 0)
					if fz.fade == 0 then drawingZones[name] = nil end
				end
				SetDrawOrigin(fz.zone.center, 0)
				local rgb = isActive and rgbBlue or rgbWhite
				DrawSprite("shared", "emptydot_32", 0, 0, 0.02, 0.035, 0, rgb[1], rgb[2], rgb[3], math.floor(opacity + 0.5))
				ClearDrawOrigin()
			end
			lastUpdate = currentTime
			previousZones = {table.unpack(Zones)}
		
			if hitZone == 1 then
				for k,v in pairs(Zones) do
					if Zones[k]:isPointInside(entCoords) then
						if #(Coords - Zones[k]["center"]) <= v["targetoptions"]["Distance"] then

							if v["targetoptions"]["shop"] ~= nil then
								Selected = v["targetoptions"]["shop"]
							end

							SendNUIMessage({ Action = "Valid", data = Zones[k]["targetoptions"]["options"] })

							Sucess = true
							while Sucess do
								local _,entCoords = RayCastGamePlayCamera()

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if not Zones[k]:isPointInside(entCoords) or #(Coords - Zones[k]["center"]) > v["targetoptions"]["Distance"] then
									Sucess = false
								end

								Wait(0)
							end

							SendNUIMessage({ Action = "Left" })
						end
					end
				end
				if GetEntityType(entityHit) ~= 0 then
					if IsEntityAVehicle(entityHit) then
						print(vRP.IsPlayerACop())
						local Plate = GetVehicleNumberPlateText(entityHit)
						if #(Coords - entCoords) <= 1.0 and Plate ~= "PDMSPORT" then
							local Network = nil
							local Combustivel = false
							local vehModel = GetEntityModel(entityHit)
							SetEntityAsMissionEntity(entityHit,true,true)

							if NetworkGetEntityIsNetworked(entityHit) then
								Network = VehToNet(entityHit)
							end

							Selected = { Plate,GetEntityArchetypeName(entityHit),entityHit,Network }

							local Menu = {}

							for k,v in pairs(Fuels) do
								local Distance = #(Coords - vec3(v[1],v[2],v[3]))
								if Distance <= 5 then
									Combustivel = true
									break
								end
							end

							if not Combustivel then
								if GetSelectedPedWeapon(Ped) == 883325847 and GetVehicleFuelLevel(entityHit) < 99.0 then
									Selected[5] = true
									Menu[#Menu + 1] = { event = "engine:Supply", label = "Abastecer", tunnel = "client" }
								else
									if not IsThisModelABike(vehModel) then
										local Rolling = GetEntityRoll(entityHit)
										if Rolling > 75.0 or Rolling < -75.0 then
											Menu[#Menu + 1] = { event = "player:RollVehicle", label = "Desvirar", tunnel = "server" }
										else
											local trunkCoords = nil
											local minDim, maxDim = GetModelDimensions(vehModel)
											local frontCoords = GetOffsetFromEntityInWorldCoords(entityHit, maxDim[1] / 2, maxDim[2], 0.0)
											local engineCoords = GetWorldPositionOfEntityBone(entityHit, GetEntityBoneIndexByName(entityHit, "engine"))
											local overheatCoords = GetWorldPositionOfEntityBone(entityHit, GetEntityBoneIndexByName(entityHit, "overheat"))
											local frontDist = math.sqrt(math.pow(frontCoords[1] - engineCoords[1], 2) + math.pow(frontCoords[2] - engineCoords[2], 2) + math.pow(frontCoords[3] - engineCoords[3], 2))
											local overHeatDist = math.sqrt(math.pow(frontCoords[1] - overheatCoords[1], 2) + math.pow(frontCoords[2] - overheatCoords[2], 2) + math.pow(frontCoords[3] - overheatCoords[3], 2))
											local halfCar = math.abs(maxDim[2] - minDim[2]) / 2
											if frontDist <= halfCar or overHeatDist <= halfCar then
												trunkCoords = GetOffsetFromEntityInWorldCoords(entityHit, 0.0, minDim[2] - 0.5, 0.0), false
											else
												trunkCoords = GetOffsetFromEntityInWorldCoords(entityHit, 0.0, maxDim[2] + 0.5, 0.0), true
											end

											for Index,Tyre in pairs(Tyres) do
												local Wheel = GetEntityBoneIndexByName(entityHit,Index)
												if Wheel ~= -1 then
													local CoordsWheel = GetWorldPositionOfEntityBone(entityHit,Wheel)
													if #(Coords - CoordsWheel) <= 1.0 then
														Selected[5] = Tyre
														Menu[#Menu + 1] = { event = "inventory:RemoveTyres", label = "Retirar Pneu", tunnel = "server" }
														if Index == "wheel_lf" and vSERVER.ConsultItem("carwheelclamp",1) then

															local Prop = nil
													
															local Min, Max = GetModelDimensions(GetHashKey("baspel_wheelclamp_normal"))

															if (#(CoordsWheel - vec3(CoordsWheel.x, CoordsWheel.y, CoordsWheel.z + (minDim.z - (CoordsWheel.z - GetEntityCoords(entityHit).z)))) * 2) <= #(Min - Max) then
																print((#(CoordsWheel - vec3(CoordsWheel.x, CoordsWheel.y, CoordsWheel.z + (minDim.z - (CoordsWheel.z - GetEntityCoords(entityHit).z)))) * 2) , #(Min - Max))
																Prop = "baspel_wheelclamp_normal"
															else
																local Min, Max = GetModelDimensions(GetHashKey("baspel_wheelclamp_suv"))
																if (#(CoordsWheel - vec3(CoordsWheel.x, CoordsWheel.y, CoordsWheel.z + (minDim.z - (CoordsWheel.z - GetEntityCoords(entityHit).z)))) * 2) <= #(Min - Max) then
																	print((#(CoordsWheel - vec3(CoordsWheel.x, CoordsWheel.y, CoordsWheel.z + (minDim.z - (CoordsWheel.z - GetEntityCoords(entityHit).z)))) * 2) , #(Min - Max))
																	Prop = "baspel_wheelclamp_suv"
																end
															end

															if Prop then
																Menu[#Menu + 1] = { event = "inventory:WheelClamps", label = "Roda de fixação", tunnel = "police", service = Prop }
															end
															
														end
													end
												end
											end

											if (#(Coords - trunkCoords) < 1.25) then
												if not GlobalState["Plates"][Plate] then
													Menu[#Menu + 1] = { event = "inventory:StealTrunk", label = "Arrombar Porta-Malas", tunnel = "server" }
												else
													local Lock = GetVehicleDoorLockStatus(entityHit)
													if (Lock == 0 or Lock == 1 or Lock == 7 or Lock == 8) then
														Menu[#Menu + 1] = { event = "chest:openTrunk", label = "Abrir Porta-Malas", tunnel = "client" }
														Menu[#Menu + 1] = { event = "player:checkTrunk", label = "Checar Porta-Malas", tunnel = "server" }
														Menu[#Menu + 1] = { event = "player:enterTrunk", label = "Entrar no Porta-Malas", tunnel = "client" }
														if vSERVER.ConsultItem("plate",1) then
															Menu[#Menu + 1] = { event = "inventory:applyPlate", label = "Trocar Placa", tunnel = "server" }
														end

														if exports["inventory"]:Towrope(entityHit,"Rear") then
															Menu[#Menu + 1] = { event = "inventory:Towrope", label = "Soltar", tunnel = "entity", service = "Rear" }
														else
															if vSERVER.ConsultItem("rope",1) then
																Menu[#Menu + 1] = { event = "inventory:Towrope", label = "Rebocar", tunnel = "entity", service = "Rear" }
															end
														end

													end
												end
											end
										end
									end
									
									if vRP.IsPlayerACop() then
										Menu[#Menu + 1] = { event = "police:Plate", label = "Verificar Placa", tunnel = "police" }
										if GlobalState["Plates"][Plate] then
											Menu[#Menu + 1] = { event = "police:Arrest", label = "Apreender Veículo", tunnel = "police" }
										end
									else
										if #(Coords - Dismantle[Dismantler]) <= 15 then
											Menu[#Menu + 1] = { event = "inventory:Dismantle", label = "Desmanchar", tunnel = "server" }
										end
									end

									if Entity(entityHit)["state"]["Tow"] then
										Menu[#Menu + 1] = { event = "inventory:Tow", label = "Retirar", tunnel = "client" }
									else
										local Tower = GetLastDrivenVehicle()
										if GetEntityModel(Tower) == GetHashKey("bennysscania") and vehModel ~= GetHashKey("flatbed") then
											if #(GetEntityCoords(entityHit) - GetEntityCoords(Tower)) <= 15 then
												Menu[#Menu + 1] = { event = "inventory:Tow", label = "Rebocar", tunnel = "client" }
											end
										end
									end
									
									if Tows:isPointInside(Coords) then
										Menu[#Menu + 1] = { event = "inventory:Impound", label = "Pátio", tunnel = "police" }
									end

									if (#(Coords - GetWorldPositionOfEntityBone(entityHit, GetEntityBoneIndexByName(entityHit, "engine"))) < 1.5) then
										Menu[#Menu + 1] = { event = "engine:Vehrify", label = "Verificar", tunnel = "client" }
										local Lock = GetVehicleDoorLockStatus(entityHit)
										if (Lock == 0 or Lock == 1 or Lock == 7 or Lock == 8) then
											if vSERVER.ConsultItem("plate",1) then
												Menu[#Menu + 1] = { event = "inventory:applyPlate", label = "Trocar Placa", tunnel = "server" }
											end
											if exports["inventory"]:Towrope(entityHit,"Front") then
												Menu[#Menu + 1] = { event = "inventory:Towrope", label = "Soltar", tunnel = "entity", service = "Front" }
											else
												if vSERVER.ConsultItem("rope",1) then
													Menu[#Menu + 1] = { event = "inventory:Towrope", label = "Rebocar", tunnel = "entity", service = "Front" }
												end
											end
										end
									end		
								end
							else
								Selected[5] = false
								if GetVehicleFuelLevel(entityHit) < 99.0 then
									Menu[#Menu + 1] = { event = "engine:Supply", label = "Abastecer", tunnel = "client" }
								end
							end

							if Menu[1] then
								SendNUIMessage({ Action = "Valid", data = Menu })
								Sucess = true
								while Sucess do
									local Ped = PlayerPedId()
									local Coords = GetEntityCoords(Ped)
									local _,entCoords,entityHit = RayCastGamePlayCamera()
	
									if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
										SetCursorLocation(0.5,0.5)
										SetNuiFocus(true,true)
									end
	
									if GetEntityType(entityHit) == 0 or #(Coords - entCoords) > 1.0 then
										Sucess = false
									end
	
									Wait(1)
								end
								SendNUIMessage({ Action = "Left" })
							end
						end
					elseif IsPedAPlayer(entityHit) then
						if #(Coords - entCoords) <= 1.0 then
							local index = NetworkGetPlayerIndexFromPed(entityHit)
							local source = GetPlayerServerId(index)
							local Menu = {}

							Selected = { source }

						
							if LocalPlayer["state"]["Hospital"] then
								if GetEntityHealth(entityHit) <= 100 then
									Menu[#Menu + 1] = { event = "paramedic:Revive", label = "Reanimar", tunnel = "paramedic" }
								else
									if IsEntityPlayingAnim(entityHit,"anim@gangops@morgue@table@","body_search",3) then
										Menu[#Menu + 1] = { event = "paramedic:Treatment", label = "Tratamento", tunnel = "paramedic" }
									end
									Menu[#Menu + 1] = { event = "paramedic:Bandage", label = "Passar Ataduras", tunnel = "paramedic" }
									--[[ Menu[#Menu + 1] = { event = "paramedic:Reposed", label = "Colocar de Repouso", tunnel = "paramedic" } ]]
									--[[ Menu[#Menu + 1] = { event = "paramedic:presetBurn", label = "Roupa de Queimadura", tunnel = "paramedic" } ]]
									--[[ Menu[#Menu + 1] = { event = "paramedic:presetPlaster", label = "Colocar Gesso", tunnel = "paramedic" } ]]
									--[[ Menu[#Menu + 1] = { event = "paramedic:extractBlood", label = "Extrair Sangue", tunnel = "paramedic" } ]]
								end
								Menu[#Menu + 1] = { event = "paramedic:Diagnostic", label = "Informações", tunnel = "paramedic" }
							end
							
							if GetEntityHealth(entityHit) <= 100 then
                                Menu[#Menu + 1] = { event = "police:Inspect", label = "Saquear", tunnel = "paramedic" }
							else
								if IsEntityPlayingAnim(entityHit,"random@mugging3","handsup_standing_base",3) or IsEntityPlayingAnim(entityHit,"mp_arresting","idle",3) then
									Menu[#Menu + 1] = { event = "police:Inspect", label = "Revistar", tunnel = "paramedic" }
									-- Menu[#Menu + 1] = { event = "player:checkShoes", label = "Tirar Sapatos", tunnel = "paramedic" }
								else
									Menu[#Menu + 1] = { event = "target:Jokenpo", label = "Jokenpô", tunnel = "server" }
								end
                            end

							if Menu[1] then
								SendNUIMessage({ Action = "Valid", data = Menu })
								Sucess = true
								while Sucess do
									local Ped = PlayerPedId()
									local Coords = GetEntityCoords(Ped)
									local _,entCoords,entityHit = RayCastGamePlayCamera()
									if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
										SetCursorLocation(0.5,0.5)
										SetNuiFocus(true,true)
									end
									if GetEntityType(entityHit) == 0 or #(Coords - entCoords) > 1.0 then
										Sucess = false
									end
									Wait(1)
								end
								SendNUIMessage({ Action = "Left" })
							end
						end
					else
						for Index,v in pairs(Models) do
							if DoesEntityExist(entityHit) then
								if Index == GetEntityModel(entityHit) then
									if #(Coords - entCoords) <= Models[Index]["Distance"] then

										local Network = nil
										if NetworkGetEntityIsNetworked(entityHit) then
											Network = NetworkGetNetworkIdFromEntity(entityHit)
										end

										Selected = { entityHit,Index,Network,GetEntityCoords(entityHit),IsEntityDead(entityHit) }

										SendNUIMessage({ Action = "Valid", data = Models[Index]["options"] })

										Sucess = true
										while Sucess do
											local Ped = PlayerPedId()
											local Coords = GetEntityCoords(Ped)
											local _,entCoords,entityHit = RayCastGamePlayCamera()

											if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
												SetCursorLocation(0.5,0.5)
												SetNuiFocus(true,true)
											end

											if GetEntityType(entityHit) == 0 or #(Coords - entCoords) > Models[Index]["Distance"] then
												Sucess = false
											end

											Wait(1)
										end

										SendNUIMessage({ Action = "Left" })
									end
								end
							end
						end
					end
				end
			end
			Wait(0)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:ROLLVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:RollVehicle")
AddEventHandler("target:RollVehicle",function(Network)
	if NetworkDoesNetworkIdExist(Network) then
		local Vehicle = NetToEnt(Network)
		if DoesEntityExist(Vehicle) then
			SetVehicleOnGroundProperly(Vehicle)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGETDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function TargetDisable()
	if Sucess or not LocalPlayer["state"]["Target"] then
		return
	end
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]["Target"] = false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Select",function(Data,Callback)
	Sucess = false
	SetNuiFocus(false,false)
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]["Target"] = false
	if Data["tunnel"] == "client" then
		TriggerEvent(Data["event"],Selected)
	elseif Data["tunnel"] == "shop" then
		TriggerEvent(Data["event"],Selected,Data["service"])
	elseif Data["tunnel"] == "entity" then
		TriggerEvent(Data["event"],Selected,Data["service"])
	elseif Data["tunnel"] == "server" then
		TriggerServerEvent(Data["event"],Selected)
	elseif Data["tunnel"] == "police" then
		TriggerServerEvent(Data["event"],Selected,Data["service"])
	elseif Data["tunnel"] == "teleport" then
		TriggerEvent(Data["event"],Data["service"],Data["teleport"])
	elseif Data["tunnel"] == "paramedic" then
		TriggerServerEvent(Data["event"],Selected[1],Data["service"])
	elseif Data["tunnel"] == "proserver" then
		TriggerServerEvent(Data["event"],Data["service"])
	end
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------

function map_range(s, a1, a2, b1, b2)
    return b1 + (s - a1) * (b2 - b1) / (a2 - a1)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	Sucess = false
	SetNuiFocus(false,false)
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]["Target"] = false
	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:Debug")
AddEventHandler("target:Debug",function()
	Sucess = false
	SetNuiFocus(false,false)
	SendNUIMessage({ Action = "Close" })
	LocalPlayer["state"]["Target"] = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETCOORDSFROMCAM
-----------------------------------------------------------------------------------------------------------------------------------------
function GetCoordsFromCam(Distance,Coords)
	local Rotation = GetGameplayCamRot()
	local Adjuste = vec3((math.pi / 180) * Rotation["x"],(math.pi / 180) * Rotation["y"],(math.pi / 180) * Rotation["z"])
	local direction = vec3(-math.sin(Adjuste[3]) * math.abs(math.cos(Adjuste[1])),math.cos(Adjuste[3]) * math.abs(math.cos(Adjuste[1])),math.sin(Adjuste[1]))
	return vec3(Coords[1] + direction[1] * Distance, Coords[2] + direction[2] * Distance, Coords[3] + direction[3] * Distance)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RAYCASTGAMEPLAYCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
function RayCastGamePlayCamera()
	local Ped = PlayerPedId()
	local Cam = GetGameplayCamCoord()
	local Cam2 = GetCoordsFromCam(10.0,Cam)
	local Handle = StartExpensiveSynchronousShapeTestLosProbe(Cam,Cam2,-1,Ped,4)
	local a,Hit,Coords,b,entityHit = GetShapeTestResult(Handle)
	return Hit,Coords,entityHit
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddCircleZone(Name,Center,Radius,Options,Target)
	if Zones[Name] then
		Zones[Name]:destroy()
	end
	Zones[Name] = CircleZone:Create(Center,Radius,Options)
	Zones[Name]["targetoptions"] = Target
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function RemCircleZone(Name)
	if Zones[Name] then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		local hitZone,entCoords,entityHit = RayCastGamePlayCamera()
		if hitZone == 1 then
			if Zones[Name]:isPointInside(entCoords) then
				if #(Coords - Zones[Name]["center"]) <= Zones[Name]["targetoptions"]["Distance"] then
					Sucess = false
				end
			end
		end

		Zones[Name]:destroy()
		Zones[Name] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function AddTargetModel(Model,Options)
	for _,v in pairs(Model) do
		Models[v] = Options
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMTARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function RemTargetModel(Model)
	for _,v in pairs(Model) do
		if Models[v] then
			Models[v] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function LabelText(Name,Text)
	if Zones[Name] then
		Zones[Name]["targetoptions"]["options"][1]["label"] = Text
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBOXZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddBoxZone(Name,Center,Length,Width,Options,Target)
	if Zones[Name] then
		Zones[Name]:destroy()
	end
    Zones[Name] = BoxZone:Create(Center,Length,Width,Options)
    Zones[Name]["targetoptions"] = Target
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMBOXZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function RemBoxZone(Name)
	if Zones[Name] then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		local hitZone,entCoords,entityHit = RayCastGamePlayCamera()
		if hitZone == 1 then
			if Zones[Name]:isPointInside(entCoords) then
				if #(Coords - Zones[Name]["center"]) <= Zones[Name]["targetoptions"]["Distance"] then
					Sucess = false
				end
			end
		end

		Zones[Name]:destroy()
		Zones[Name] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("LabelText",LabelText)
exports("AddBoxZone",AddBoxZone)
exports("RemCircleZone",RemCircleZone)
exports("AddCircleZone",AddCircleZone)
exports("RemBoxZone",RemBoxZone)
exports("AddTargetModel",AddTargetModel)
exports("RemTargetModel",RemTargetModel)