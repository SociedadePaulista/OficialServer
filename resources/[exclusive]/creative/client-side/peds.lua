-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local localPeds = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ -- 
		Distance = 100,
		Coords = { 2455.75,4979.53,51.56,133.23 },
		Model = "s_m_y_construct_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- 
		Distance = 100,
		Coords = { -286.25,2838.74,54.95,147.41 },
		Model = "s_m_y_construct_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- 
		Distance = 100,
		Coords = { -1505.78,1526.09,115.25,79.38 },
		Model = "s_m_y_construct_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- 
		Distance = 100,
		Coords = { 3452.73,3646.45,42.6,170.08 },
		Model = "s_m_y_construct_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Prisao
		Distance = 100,
		Coords = { 1775.73,2553.63,45.56,110.56 },
		Model = "s_m_m_prisguard_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Hospital
		Distance = 100,
		Coords = { 301.73,-591.11,43.27,337.33 },
		Model = "s_m_m_doctor_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Hospital
		Distance = 100,
		Coords = { 324.37,-583.76,43.27,161.58 },
		Model = "s_f_y_scrubs_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Scrap
		Distance = 100,
		Coords = { 3809.16,4489.51,6.39,300.48 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},{ -- Scrap
		Distance = 100,
		Coords = { -2017.88,3383.98,31.24,45.36 },
		Model = "g_m_y_salvagoon_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Concessionária
		Distance = 20,
		Coords = { -57.29,-1097.35,26.42,215.44 },
		Model = "player_zero",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Foundry
		Distance = 20,
		Coords = { 1084.82,-2002.8,31.37,51.03 },
		Model = "ig_chef",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Foundry 2
		Distance = 20,
		Coords = { 1085.83,-2001.74,31.41,48.19 },
		Model = "mp_m_counterfeit_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Keychain
		Distance = 20,
		Coords = { 166.73,-1803.23,29.32,320.32 },
		Model = "s_m_m_autoshop_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Brewery Market
		Distance = 20,
		Coords = { -1271.89,-1418.5,4.36,34.02 },
		Model = "a_f_y_business_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Brewery Market
		Distance = 20,
		Coords = { -1225.06,-1439.93,4.36,121.89 },
		Model = "a_f_y_business_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Brewery Market
		Distance = 20,
		Coords = { -1208.13,-1509.62,4.36,34.02 },
		Model = "a_f_y_business_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- PRO Bikes Market
		Distance = 20,
		Coords = { -1266.68,-1418.66,4.36,124.73 },
		Model = "a_m_y_cyclist_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- PRO Bikes Market
		Distance = 20,
		Coords = { -1225.04,-1434.83,4.36,221.11 },
		Model = "a_m_y_cyclist_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- PRO Bikes Market
		Distance = 20,
		Coords = { -1203.0,-1509.59,4.36,124.73 },
		Model = "a_m_y_cyclist_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Masquerade Market
		Distance = 20,
		Coords = { -1263.09,-1423.88,4.36,130.4 },
		Model = "u_m_m_streetart_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Masquerade Market
		Distance = 20,
		Coords = { -1219.72,-1431.09,4.36,221.11 },
		Model = "u_m_m_streetart_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Masquerade Market
		Distance = 20,
		Coords = { -1199.24,-1514.95,4.38,127.56 },
		Model = "u_m_m_streetart_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Digital Den
		Distance = 20,
		Coords = { 1132.37,-474.31,66.71,343.0 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills Market
		Distance = 20,
		Coords = { -1253.68,-1437.09,4.36,124.73 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills Market
		Distance = 20,
		Coords = { -1255.58,-1434.39,4.36,124.73 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills Market
		Distance = 20,
		Coords = { -1195.99,-1458.47,4.38,34.02 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills Market
		Distance = 20,
		Coords = { -1198.76,-1460.3,4.36,36.86 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills Market
		Distance = 20,
		Coords = { -1225.6,-1477.02,4.36,127.56 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pop's Pills Market
		Distance = 20,
		Coords = { -1227.28,-1474.8,4.36,124.73 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Truthorganic Market
		Distance = 20,
		Coords = { -1253.94,-1444.82,4.36,34.02 },
		Model = "s_m_m_cntrybar_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Truthorganic Market
		Distance = 20,
		Coords = { -1206.44,-1460.05,4.36,308.98 },
		Model = "s_m_m_cntrybar_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Truthorganic Market
		Distance = 20,
		Coords = { -1225.76,-1485.01,4.36,34.02 },
		Model = "s_m_m_cntrybar_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- LD Organies Market
		Distance = 20,
		Coords = { -1249.01,-1449.3,4.36,36.86 },
		Model = "ig_lamardavis",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- LD Organies Market
		Distance = 20,
		Coords = { -1211.01,-1464.93,4.36,308.98 },
		Model = "ig_lamardavis",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- LD Organies Market
		Distance = 20,
		Coords = { -1220.88,-1489.58,4.36,36.86 },
		Model = "ig_lamardavis",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cool Beans
		Distance = 20,
		Coords = { -1245.36,-1454.24,4.36,34.02 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cool Beans
		Distance = 20,
		Coords = { -1215.81,-1468.6,4.36,306.15 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cool Beans
		Distance = 20,
		Coords = { -1217.2,-1494.39,4.36,31.19 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Caminhoneiro
		Distance = 20,
		Coords = { 1239.87,-3257.2,7.09,274.97 },
		Model = "s_m_m_trucker_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ballas
		Distance = 20,
		Coords = { 95.58,-1985.56,20.44,317.49 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Families
		Distance = 20,
		Coords = { -31.47,-1434.84,31.49,0.0 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Vagos
		Distance = 20,
		Coords = { 347.45,-2069.06,20.89,320.32 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Aztecas
		Distance = 20,
		Coords = { 512.29,-1803.52,28.51,246.62 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Bloods
		Distance = 20,
		Coords = { 230.55,-1753.35,28.98,232.45 },
		Model = "ig_g",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino
		Distance = 20,
		Coords = { 988.37,43.06,71.3,170.08 },
		Model = "s_f_y_casino_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Coveiro
		Distance = 20,
		Coords = { -1745.92,-204.83,57.39,320.32 },
		Model = "g_m_m_armboss_01",
		anim = { "timetable@trevor@smoking_meth@base","base" }
	},
	{ -- Animal Ark
		Distance = 100,
		Coords = { 563.07,2753.0,42.87,187.09 },
		Model = "a_f_m_ktown_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Leiteiro
		Distance = 50,
		Coords = { 2313.76,4888.19,41.8,53.86 },
		Model = "a_m_m_hillbilly_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2266.83,4892.59,40.89,317.49 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2256.55,4902.48,40.78,311.82 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2248.82,4910.18,40.73,311.82 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2240.87,4918.91,40.76,311.82 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2232.99,4926.0,40.83,323.15 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2224.58,4934.4,40.88,314.65 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2203.05,4914.07,40.57,311.82 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2211.45,4905.68,40.81,306.15 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2217.82,4897.23,40.76,311.82 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2227.2,4889.42,40.71,314.65 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2235.72,4881.53,40.96,311.82 },
		Model = "a_c_cow"
	},
	{ -- Leiteiro
		Distance = 100,
		Coords = { 2243.74,4872.59,40.81,317.49 },
		Model = "a_c_cow"
	},
	{ -- Prefeitura
		Distance = 100,
		Coords = { 262.94,-418.69,45.29,257.96 },
		Model = "ig_barry",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Prefeitura
		Distance = 100,
		Coords = { -544.76,-185.81,52.2,303.31 },
		Model = "ig_barry",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Black Market
		Distance = 100,
		Coords = { 2431.86,4967.66,42.34,133.23 },
		Model = "g_m_y_ballaeast_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Black Market
		Distance = 100,
		Coords = { 2431.09,4970.72,42.34,42.52 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		Distance = 100,
		Coords = { 2436.08,4965.39,42.34,226.78 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2434.4,4963.8,42.34,229.61 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2432.44,4964.06,42.34,178.59 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@world_human_bum_wash@male@high@base","base" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2431.57,4965.22,42.34,124.73 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@world_human_bum_wash@male@high@base","base" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2428.67,4969.51,42.34,133.23 },
		Model = "g_f_y_ballas_01",
		anim = { "anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2437.05,4967.61,42.34,317.49 },
		Model = "g_f_y_ballas_01",
		anim = { "anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2433.09,4971.51,42.34,320.32 },
		Model = "g_f_y_ballas_01",
		anim = { "anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2432.67,4970.29,42.34,226.78 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { 2435.28,4969.27,42.34,317.49 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		Distance = 20,
		Coords = { -1234.4,6937.65,20.67,170.08 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Weeds
		Distance = 20,
		Coords = { -1171.26,-1571.15,4.67,127.56 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 301.4,-195.29,61.57,158.75 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 169.28,-1536.23,29.25,311.82 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 487.56,-1456.11,29.28,272.13 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 154.66,-1472.9,29.35,325.99 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 389.69,-942.1,29.42,175.75 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 475.1,3555.28,33.23,263.63 },
		Model = "g_f_y_ballas_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 112.41,3373.68,35.25,59.53 },
		Model = "g_m_y_ballaeast_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 2013.95,4990.88,41.21,133.23 },
		Model = "g_m_y_ballasout_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		Distance = 20,
		Coords = { 186.9,6374.75,32.33,206.93 },
		Model = "g_m_y_famca_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},

	{ -- Departament Store
		Distance = 20,
		Coords = { 24.49,-1346.08,29.49,272.13 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 2556.04,380.89,108.61,0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1164.82,-323.63,69.2,99.22 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -706.16,-914.55,19.21,90.71 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -47.39,-1758.63,29.42,51.03 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 372.86,327.53,103.56,257.96 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -3243.38,1000.11,12.82,0.0 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1728.39,6416.21,35.03,246.62 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 549.2,2670.22,42.16,96.38 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1959.54,3741.01,32.33,303.31 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 2677.07,3279.95,55.23,334.49 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1697.35,4923.46,42.06,328.82 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -1819.55,793.51,138.08,133.23 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1392.03,3606.1,34.98,204.1 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -2966.41,391.59,15.05,85.04 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -3040.04,584.22,7.9,19.85 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1134.33,-983.09,46.4,277.8 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { 1165.26,2710.79,38.15,178.59 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -1486.77,-377.56,40.15,133.23 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store
		Distance = 20,
		Coords = { -1221.42,-907.91,12.32,31.19 },
		Model = "mp_m_shopkeep_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { 1692.28,3760.94,34.69,229.61 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { 253.79,-50.5,69.94,68.04 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { 842.41,-1035.28,28.19,0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { -331.62,6084.93,31.46,226.78 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { -662.29,-933.62,21.82,181.42 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { -1304.17,-394.62,36.7,73.71 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { -1118.95,2699.73,18.55,223.94 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { 2567.98,292.65,108.73,0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { -3173.51,1088.38,20.84,249.45 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { 22.59,-1105.54,29.79,155.91 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store
		Distance = 20,
		Coords = { 810.22,-2158.99,29.62,0.0 },
		Model = "ig_dale",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	-- { -- Life Invader
	-- 	Distance = 20,
	-- 	Coords = { -1083.15,-245.88,37.76,209.77 },
	-- 	Model = "ig_barry",
	-- 	anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	-- },
	{ -- Pharmacy Store
		Distance = 20,
		Coords = { -171.46,6386.75,31.49,133.23 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store
		Distance = 20,
		Coords = { 318.23,-1078.4,29.47,351.5 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store
		Distance = 20,
		Coords = { 92.04,-231.03,54.66,337.33 },
		Model = "u_m_y_baygor",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central
		Distance = 20,
		Coords = { 2736.91,3462.28,55.69,334.49 },
		Model = "ig_cletus",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central
		Distance = 20,
		Coords = { 2741.5,3464.06,55.69,79.38 },
		Model = "g_m_y_salvagoon_02",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lixeiro
		Distance = 20,
		Coords = { -355.75,-1555.85,25.17,181.42 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lixeiro
		Distance = 20,
		Coords = { 287.77,2843.9,44.7,121.89 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lixeiro
		Distance = 20,
		Coords = { -413.97,6171.58,31.48,320.32 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Recycling Sell
		Distance = 50,
		Coords = { -428.54,-1728.29,19.78,70.87 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Recycling Sell
		Distance = 50,
		Coords = { 180.07,2793.29,45.65,283.47 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Recycling Sell
		Distance = 50,
		Coords = { -195.42,6264.62,31.49,42.52 },
		Model = "s_m_y_garbage",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Jewelry
		Distance = 20,
		Coords = { -628.79,-238.7,38.05,311.82 },
		Model = "cs_gurk",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Oxy Store
		Distance = 20,
		Coords = { -1636.74,-1092.17,13.08,320.32 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Transporter
		Distance = 20,
		Coords = { 882.39,-2264.3,32.44,354.34 },
		Model = "ig_casey",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Carteiro
		Distance = 20,
		Coords = { 78.93,112.45,81.16,158.75 },
		Model = "s_m_m_postal_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lenhador
		Distance = 50,
		Coords = { 2433.45,5013.46,46.99,314.65 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Motorista
		Distance = 20,
		Coords = { -200.3,6234.62,31.49,223.94 },
		Model = "u_m_m_edtoh",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Motorista
		Distance = 20,
		Coords = { 452.97,-607.75,28.59,266.46 },
		Model = "u_m_m_edtoh",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -709.23,-151.35,37.41,119.06 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -165.08,-303.46,39.73,249.45 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -823.16,-1072.39,11.32,212.6 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -1194.6,-767.56,17.3,215.44 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -1448.61,-237.61,49.81,51.03 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 5.87,6511.4,31.88,45.36 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 1695.37,4823.17,42.06,96.38 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 127.23,-223.39,54.56,65.2 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 613.09,2761.8,42.09,274.97 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 1196.55,2711.64,38.22,184.26 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -3169.1,1044.04,20.86,65.2 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { -1102.41,2711.57,19.11,221.11 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 427.02,-806.21,29.49,87.88 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas
		Distance = 20,
		Coords = { 73.93,-1392.9,29.37,277.8 },
		Model = "a_f_y_epsilon_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},


	{ -- Loja de Tatuagem
		Distance = 20,
		Coords = { 1326.43,-1651.63,52.27,39.69 },
		Model = "a_f_y_hippie_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		Distance = 20,
		Coords = { -1150.39,-1425.4,4.95,34.02 },
		Model = "a_f_y_hippie_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		Distance = 20,
		Coords = { 320.05,183.3,103.59,161.58 },
		Model = "a_f_y_hippie_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		Distance = 20,
		Coords = { -3172.82,1073.41,20.83,249.45 },
		Model = "a_f_y_hippie_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		Distance = 20,
		Coords = { 1863.42,3751.76,33.03,119.06 },
		Model = "a_f_y_hippie_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		Distance = 20,
		Coords = { -292.11,6196.32,31.49,314.65 },
		Model = "a_f_y_hippie_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Taxista
		Distance = 20,
		Coords = { 894.9,-179.15,74.7,240.95 },
		Model = "a_m_y_stlat_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Taxista
		Distance = 20,
		Coords = { 1696.19,4785.25,42.02,93.55 },
		Model = "a_m_y_stlat_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Caçador
		Distance = 20,
		Coords = { -775.96,5602.95,33.73,269.3 },
		Model = "ig_hunter",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Caçador
		Distance = 20,
		Coords = { 568.96,2796.64,42.01,272.13 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Agricultor
		Distance = 20,
		Coords = { 68.14,-1743.21,29.28,51.03 },
		Model = "a_m_o_ktown_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ingrediente
		Distance = 20,
		Coords = { 70.36,-1758.03,29.28,59.53 },
		Model = "csb_ortega",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pescador
		Distance = 20,
		Coords = { 78.15,-1748.45,29.28,48.19 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pescador
		Distance = 20,
		Coords = { 1522.17,3783.13,34.47,218.27 },
		Model = "a_f_y_eastsa_03",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { -821.82,-183.36,37.56,212.6 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { 137.12,-1710.54,29.28,138.9 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { -1284.59,-1118.98,6.99,90.71 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { 1934.17,3729.63,32.84,212.6 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { 1210.2,-474.01,66.2,73.71 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { -34.04,-150.15,57.07,340.16 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barbearia
		Distance = 20,
		Coords = { -280.72,6228.2,31.69,42.52 },
		Model = "a_f_y_hipster_04",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- McDonalds
		Distance = 20,
		Coords = { 87.51,292.53,110.2,246.62 },
		Model = "u_m_y_burgerdrug_01",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- McDonalds
		Distance = 20,
		Coords = { 94.26,285.3,110.21,73.71 },
		Model = "u_m_y_burgerdrug_01",
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- CluckinBell
		Distance = 20,
		Coords = { -510.34,-702.67,33.16,31.19 },
		Model = "IVcluckin_f",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- CluckinBell
		Distance = 20,
		Coords = { -510.13,-696.63,33.16,45.36 },
		Model = "IVcluckin_m",
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDPED
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddPed", function(Data)
	for Number = 1,#List do
		local Distance = #(vec3(Data.Coords[1],Data.Coords[2],Data.Coords[3]) - vec3(List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3]))
		if Distance <= 1.0 then
			return
		end
	end
	table.insert(List,Data)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADLIST
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)
		for Number = 1,#List do
			local Distance = #(Coords - vec3(List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3]))
			if Distance <= List[Number]["Distance"] then
				if not localPeds[Number] and LocalPlayer["state"]["Route"] < 900000 then
					if LoadModel(List[Number]["Model"]) then
						localPeds[Number] = CreatePed(4,List[Number]["Model"],List[Number]["Coords"][1],List[Number]["Coords"][2],List[Number]["Coords"][3] - 1,List[Number]["Coords"][4],false,false)
						SetPedArmour(localPeds[Number],99)
						SetEntityInvincible(localPeds[Number],true)
						FreezeEntityPosition(localPeds[Number],true)
						SetBlockingOfNonTemporaryEvents(localPeds[Number],true)
						SetModelAsNoLongerNeeded(List[Number]["Model"])
						if List[Number]["Model"] == "s_f_y_casino_01" then
							SetPedDefaultComponentVariation(localPeds[Number])
							SetPedComponentVariation(localPeds[Number],0,3,0,0)
							SetPedComponentVariation(localPeds[Number],1,0,0,0)
							SetPedComponentVariation(localPeds[Number],2,3,0,0)
							SetPedComponentVariation(localPeds[Number],3,0,1,0)
							SetPedComponentVariation(localPeds[Number],4,1,0,0)
							SetPedComponentVariation(localPeds[Number],6,1,0,0)
							SetPedComponentVariation(localPeds[Number],7,1,0,0)
							SetPedComponentVariation(localPeds[Number],8,0,0,0)
							SetPedComponentVariation(localPeds[Number],10,0,0,0)
							SetPedComponentVariation(localPeds[Number],11,0,0,0)
							SetPedPropIndex(localPeds[Number],1,0,0,false)
						end

						if List[Number]["anim"] ~= nil then
							if LoadAnim(List[Number]["anim"][1]) then
								TaskPlayAnim(localPeds[Number],List[Number]["anim"][1],List[Number]["anim"][2],8.0,8.0,-1,1,0,0,0,0)
							end
						end
					end
				end
			else
				if localPeds[Number] then
					if DoesEntityExist(localPeds[Number]) then
						DeleteEntity(localPeds[Number])
					end
					localPeds[Number] = nil
				end
			end
		end
		Wait(1000)
	end
end)