-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("inventory",Creative)
vPLAYER = Tunnel.getInterface("player")
vGARAGE = Tunnel.getInterface("garages")
vINITIAL = Tunnel.getInterface("initial")
vTASKBAR = Tunnel.getInterface("taskbar")
vCLIENT = Tunnel.getInterface("inventory")
vKEYBOARD = Tunnel.getInterface("keyboard")
vPARAMEDIC = Tunnel.getInterface("paramedic")
vSURVIVAL = Tunnel.getInterface("survival")
vMEMORY = Tunnel.getInterface("memory")
vPROPERTY = Tunnel.getInterface("propertys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Drops = {}
Drugs = {}
Carry = {}
Ammos = {}
Active = {}
Armors = {}
Plates = {}
Trunks = {}
Healths = {}
Attachs = {}
Lootsfy = {}
Property = {}
ParkingMeters = {}
ParkingMetersfy = {}
Pumpjacks = {}
Pumpjacksfy = {}
Bancadas = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
Buffs = {
	["Dexterity"] = {},
	["Luck"] = {}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- OBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Objects = {
	["1"] = { x = 594.59, y = 146.52, z = 97.30, h = 70.04, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["2"] = { x = 660.44, y = 268.29, z = 102.04, h = 152.09, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["3"] = { x = 552.54, y = -198.45, z = 53.75, h = 89.32, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["4"] = { x = 339.75, y = -580.95, z = 73.42, h = 67.19, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["5"] = { x = 696.12, y = -965.69, z = 23.26, h = 271.33, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["6"] = { x = -2235.42, y = 363.52, z = 173.91, h = 23.73, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["7"] = { x = 1382.1, y = -2081.97, z = 51.25, h = 220.16, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["8"] = { x = 589.32, y = -2802.73, z = 5.32, h = 328.01, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["9"] = { x = -453.19, y = -2810.47, z = 6.56, h = 225.82, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["10"] = { x = -1007.18, y = -2836.12, z = 13.20, h = 149.3, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["11"] = { x = -2018.21, y = -361.03, z = 47.36, h = 324.55, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["12"] = { x = -1727.77, y = 250.26, z = 61.65, h = 24.7, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["13"] = { x = -1089.6, y = 2717.05, z = 18.33, h = 40.52, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["14"] = { x = 321.27, y = 2874.98, z = 42.71, h = 27.62, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["15"] = { x = 1163.47, y = 2722.09, z = 37.26, h = 179.11, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["16"] = { x = 1745.86, y = 3326.69, z = 40.30, h = 115.55, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["17"] = { x = 2013.4, y = 3934.36, z = 31.65, h = 236.38, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["18"] = { x = 2526.3, y = 4191.6, z = 44.53, h = 236.44, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["19"] = { x = 2874.05, y = 4861.57, z = 61.35, h = 87.57, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["20"] = { x = 1985.16, y = 6200.39, z = 41.33, h = 330.21, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["21"] = { x = 1552.97, y = 6610.24, z = 2.12, h = 145.64, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["22"] = { x = -298.32, y = 6392.66, z = 29.87, h = 302.99, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["23"] = { x = -813.88, y = 5384.45, z = 33.77, h = 356.87, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["24"] = { x = -1606.5, y = 5259.26, z = 1.35, h = 114.45, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["25"] = { x = -199.22, y = 3638.8, z = 63.70, h = 39.84, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["26"] = { x = -1487.45, y = 2688.99, z = 2.94, h = 317.89, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["27"] = { x = -3266.12, y = 1139.82, z = 1.91, h = 249.17, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["28"] = { x = 170.71, y = -1070.94, z = 28.5, h = 339.6, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["29"] = { x = 487.23, y = -1093.93, z = 28.71, h = 0.74, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["30"] = { x = 584.63, y = -1419.69, z = 18.52, h = 180.41, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["31"] = { x = 694.07, y = -1453.5, z = 19.03, h = 0.45, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["32"] = { x = 892.49, y = -2490.3, z = 28.88, h = 175.48, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["33"] = { x = 1463.09, y = -2613.91, z = 48.17, h = 76.65, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["34"] = { x = 1877.42, y = -1065.71, z = 80.22, h = 97.79, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["35"] = { x = 2557.67, y = -598.5, z = 64.23, h = 12.71, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["36"] = { x = 2546.8, y = 395.31, z = 107.92, h = 268.3, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["37"] = { x = 2074.59, y = 1403.29, z = 74.88, h = 300.3, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["38"] = { x = 2405.44, y = 2903.85, z = 39.67, h = 217.41, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["39"] = { x = 2895.84, y = 3735.4, z = 43.5, h = 289.37, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["40"] = { x = 1677.25, y = 4882.36, z = 46.62, h = 59.7, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["41"] = { x = -437.08, y = 6339.84, z = 12.06, h = 216.59, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["42"] = { x = 431.15, y = 6472.57, z = 28.08, h = 140.5, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["43"] = { x = -2303.74, y = 3389.16, z = 30.56, h = 324.26, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["44"] = { x = -2096.92, y = 3258.17, z = 32.12, h = 239.97, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["45"] = { x = -1773.55, y = 2995.46, z = 32.11, h = 330.02, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["46"] = { x = -2086.61, y = 2816.89, z = 32.27, h = 354.52, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },
	["47"] = { x = -1511.83, y = 1520.27, z = 114.59, h = 255.31, object = "sm_prop_smug_crate_s_medical", item = "", Distance = 50, mode = "Medic" },

	["48"] = { x = 574.01, y = 132.56, z = 98.48, h = 70.99, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["49"] = { x = 344.79, y = 929.2, z = 202.44, h = 268.09, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["50"] = { x = -123.8, y = 1896.67, z = 196.34, h = 358.95, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["51"] = { x = -1099.85, y = 2703.51, z = 21.99, h = 221.35, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["52"] = { x = -2198.91, y = 4243.21, z = 46.92, h = 128.84, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["53"] = { x = -1487.02, y = 4983.14, z = 62.67, h = 174.11, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["54"] = { x = 1346.49, y = 6396.73, z = 32.42, h = 90.94, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["55"] = { x = 2535.72, y = 4661.39, z = 33.08, h = 316.4, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["56"] = { x = 1155.62, y = -1334.48, z = 33.72, h = 174.97, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["57"] = { x = 1116.06, y = -2498.07, z = 32.37, h = 193.39, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["58"] = { x = 261.06, y = -3135.82, z = 4.8, h = 88.83, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["59"] = { x = -1619.81, y = -1035.0, z = 12.16, h = 50.84, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["60"] = { x = -3420.87, y = 977.0, z = 10.91, h = 226.29, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["61"] = { x = -1909.53, y = 4624.93, z = 56.07, h = 135.57, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["62"] = { x = 894.51, y = 3211.45, z = 38.09, h = 273.04, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["63"] = { x = 1791.71, y = 4602.84, z = 36.69, h = 185.86, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["64"] = { x = 464.8, y = 6462.03, z = 28.76, h = 334.71, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["65"] = { x = 63.22, y = 6323.67, z = 37.87, h = 301.22, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["66"] = { x = -736.64, y = 5594.98, z = 40.66, h = 268.78, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["67"] = { x = 720.76, y = 2330.87, z = 50.76, h = 179.99, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["68"] = { x = 1909.47, y = 611.47, z = 177.41, h = 65.57, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["69"] = { x = 1796.6, y = -1350.06, z = 98.75, h = 61.5, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["70"] = { x = 955.32, y = -3101.26, z = 4.91, h = 266.38, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["71"] = { x = -1306.41, y = -3387.9, z = 12.95, h = 59.92, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["72"] = { x = -1219.66, y = -2079.82, z = 13.16, h = 351.04, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["73"] = { x = -1203.53, y = -1804.25, z = 2.91, h = 245.4, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["74"] = { x = -720.47, y = -399.49, z = 33.9, h = 351.27, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["75"] = { x = -503.39, y = -1438.17, z = 13.16, h = 346.71, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["76"] = { x = 1398.24, y = 2117.57, z = 104.02, h = 131.36, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["77"] = { x = -1811.62, y = 3104.09, z = 31.85, h = 60.36, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["78"] = { x = -1812.86, y = 3101.95, z = 31.85, h = 62.1, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["79"] = { x = -1850.29, y = 3156.66, z = 31.82, h = 150.22, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["80"] = { x = -2052.86, y = 3173.31, z = 31.82, h = 240.03, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["81"] = { x = -2409.94, y = 3355.95, z = 31.83, h = 61.29, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },
	["82"] = { x = -2450.39, y = 2946.63, z = 31.97, h = 330.0, object = "prop_mb_crate_01a", item = "", Distance = 50, mode = "Weapons" },

	["83"] = { x = -257.5, y = -966.54, z = 30.22, h = 26.06, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["84"] = { x = -2682.86, y = 2304.87, z = 20.85, h = 164.19, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["85"] = { x = -1282.33, y = 2559.98, z = 17.4, h = 148.06, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["86"] = { x = 159.65, y = 3118.8, z = 42.44, h = 16.37, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["87"] = { x = 1061.43, y = 3527.62, z = 33.15, h = 255.93, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["88"] = { x = 2370.22, y = 3156.55, z = 47.21, h = 221.77, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["89"] = { x = 2520.51, y = 2637.83, z = 36.95, h = 314.33, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["90"] = { x = 2572.37, y = 477.44, z = 107.68, h = 269.49, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["91"] = { x = 1223.15, y = -1079.56, z = 37.53, h = 123.38, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["92"] = { x = 1048.49, y = -247.53, z = 68.66, h = 149.33, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["93"] = { x = 499.41, y = -529.38, z = 23.76, h = 262.13, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["94"] = { x = 592.53, y = -2115.87, z = 4.76, h = 100.96, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["95"] = { x = 523.43, y = -2578.67, z = 13.82, h = 318.38, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["96"] = { x = -2.98, y = -1299.67, z = 28.28, h = 359.37, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["97"] = { x = 183.11, y = -1086.93, z = 28.28, h = 348.57, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["98"] = { x = 713.88, y = -850.95, z = 23.3, h = 271.63, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["99"] = { x = -2438.82, y = 2999.82, z = 32.07, h = 194.35, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["100"] = { x = -2440.04, y = 2999.46, z = 32.07, h = 194.41, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["101"] = { x = -2092.59, y = 3113.14, z = 31.82, h = 240.25, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["102"] = { x = -1824.95, y = 3016.0, z = 31.82, h = 329.62, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["103"] = { x = -202.03, y = 3651.99, z = 50.74, h = 192.39, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["104"] = { x = -203.41, y = 3651.71, z = 50.74, h = 192.96, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["105"] = { x = 2007.81, y = 4964.86, z = 40.71, h = 158.28, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["106"] = { x = 1904.26, y = 4930.73, z = 47.97, h = 156.61, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["107"] = { x = 1702.14, y = 4819.3, z = 40.96, h = 97.05, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["108"] = { x = 2030.66, y = 4727.43, z = 40.61, h = 294.35, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["109"] = { x = 2122.12, y = 4784.69, z = 39.98, h = 116.71, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["110"] = { x = 2177.23, y = 2169.39, z = 116.31, h = 229.64, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["111"] = { x = 2395.2, y = 2032.72, z = 90.35, h = 318.06, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["112"] = { x = 2619.31, y = 1691.36, z = 26.6, h = 270.01, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["113"] = { x = 1454.52, y = -1680.69, z = 65.03, h = 25.31, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["114"] = { x = 1453.05, y = -1681.37, z = 64.96, h = 24.93, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["115"] = { x = 240.42, y = -1864.8, z = 25.82, h = 49.31, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["116"] = { x = -139.01, y = -1995.56, z = 21.81, h = 181.56, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["117"] = { x = -343.54, y = -1333.09, z = 36.31, h = 89.4, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["118"] = { x = -350.99, y = -1333.15, z = 36.31, h = 269.98, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["119"] = { x = -346.45, y = -1337.38, z = 36.31, h = 359.9, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },
	["120"] = { x = -267.45, y = -971.56, z = 30.22, h = 25.86, object = "gr_prop_gr_rsply_crate03a", item = "", Distance = 50, mode = "Supplies" },

	-- ROBBERY CLOTHESHOP
	["121"] = { x = 70.27, y = -1389.11, z = 29.13, h = 90.28, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["122"] = { x = -706.01, y = -150.49, z = 37.17, h = 28.61, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["123"] = { x = -167.66, y = -301.67, z = 39.49, h = 161.34, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["124"] = { x = -821.69, y = -1067.22, z = 11.08, h = 31.23, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["125"] = { x = -1186.62, y = -772.55, z = 17.09, h = 215.93, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["126"] = { x = -1446.85, y = -240.38, z = 49.57, h = 316.88, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["127"] = { x = 5.53, y = 6506.07, z = 31.63, h = 222.68, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["128"] = { x = 1699.51, y = 4819.72, z = 41.82, h = 277.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["129"] = { x = 117.83, y = -223.56, z = 54.31, h = 70.89, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["130"] = { x = 621.58, y = 2765.81, z = 41.84, h = 275.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["131"] = { x = 1200.46, y = 2715.37, z = 37.98, h = 0.24, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["132"] = { x = -3178.48, y = 1044.46, z = 20.62, h = 66.61, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["133"] = { x = -1102.05, y = 2716.93, z = 18.86, h = 40.85, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["134"] = { x = 430.72, y = -810.01, z = 29.25, h = 270.35, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY WEAPONSSHOP
	["135"] = { x = 1688.78, y = 3759.13, z = 34.46, h = 47.5, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["136"] = { x = 256.35, y = -47.51, z = 69.7, h = 249.76, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["137"] = { x = 846.13, y = -1036.62, z = 27.95, h = 178.74, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["138"] = { x = -335.18, y = 6083.29, z = 31.21, h = 45.57, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["139"] = { x = -665.98, y = -932.24, z = 21.58, h = 358.38, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["140"] = { x = -1301.93, y = -391.36, z = 36.45, h = 255.85, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["141"] = { x = -1122.59, y = 2698.25, z = 18.31, h = 42.82, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["142"] = { x = 2571.67, y = 291.28, z = 108.49, h = 180.02, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["143"] = { x = 2571.66, y = 291.29, z = 108.49, h = 181.06, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["144"] = { x = 19.57, y = -1103.0, z = 29.55, h = 339.07, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["145"] = { x = 813.92, y = -2160.34, z = 29.37, h = 179.33, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY BARBERSHOP
	["146"] = { x = -807.9, y = -180.83, z = 37.32, h = 299.3, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["147"] = { x = 139.56, y = -1704.12, z = 29.05, h = 320.25, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["148"] = { x = -1278.11, y = -1116.66, z = 6.75, h = 270.07, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["149"] = { x = 1928.89, y = 3734.04, z = 32.6, h = 29.2, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["150"] = { x = 1217.05, y = -473.45, z = 65.96, h = 255.89, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["151"] = { x = -34.08, y = -157.01, z = 56.83, h = 159.63, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["152"] = { x = -274.5, y = 6225.27, z = 31.45, h = 225.27, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- ROBBERY TATTOOSHOP
	["153"] = { x = 1327.98, y = -1654.78, z = 52.03, h = 218.71, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["154"] = { x = -1149.04, y = -1428.64, z = 4.71, h = 215.2, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["155"] = { x = 322.01, y = 186.24, z = 103.34, h = 339.28, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["156"] = { x = -3175.64, y = 1075.54, z = 20.58, h = 65.96, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["157"] = { x = 1866.01, y = 3748.07, z = 32.79, h = 299.38, object = "p_v_43_safe_s", item = "", Distance = 50 },
	["158"] = { x = -295.51, y = 6199.21, z = 31.24, h = 133.05, object = "p_v_43_safe_s", item = "", Distance = 50 },

	-- OTHER OBJECTS
	["9998"] = { x = -584.12, y = -1062.95, z = 22.38, h = 33.14, object = "bkr_prop_fakeid_clipboard_01a", item = "", Distance = 15 },
	["9999"] = { x = -1188.9, y = -897.82, z = 13.95, h = 130.04, object = "bkr_prop_fakeid_clipboard_01a", item = "", Distance = 15 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRODUCTS
-----------------------------------------------------------------------------------------------------------------------------------------
Products = {
	["foodjuice"] = {
		{ ["timer"] = 10, ["item"] = "foodjuice", ["itemAmount"] = 1 }
	},
	["foodburger"] = {
		{ ["timer"] = 10, ["item"] = "foodburger", ["itemAmount"] = 1 }
	},
	["foodbox"] = {
		{ ["timer"] = 10, ["need"] = {
			{ ["item"] = "foodburger", ["amount"] = 1 },
			{ ["item"] = "foodjuice", ["amount"] = 1 }
		}, ["needAmount"] = 1, ["item"] = "foodbox", ["itemAmount"] = 1 }
	},
	["cemitery"] = {
		{ ["timer"] = 5, ["item"] = "silk", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "cotton", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "plaster", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "pouch", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "WEAPON_SWITCHBLADE", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "joint", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "acetone", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "slipper", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "water", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "copper", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "cigarette", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "lighter", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "elastic", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "rose", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "teddy", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "binoculars", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "camera", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "silvercoin", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "goldcoin", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "watch", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "bracelet", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "WEAPON_BRICK", ["itemAmount"] = 3 },
		{ ["timer"] = 5, ["item"] = "WEAPON_SHOES", ["itemAmount"] = 2 },
		{ ["timer"] = 5, ["item"] = "dices", ["itemAmount"] = 1 },
		{ ["timer"] = 5, ["item"] = "cup", ["itemAmount"] = 1 }
	},
	["milkBottle"] = {
		{ ["timer"] = 10, ["need"] = "glassbottle", ["needAmount"] = 1, ["item"] = "milkbottle", ["itemAmount"] = 1 }
	},
	["plasticbottle"] = {
		{ ["timer"] = 2, ["need"] = "plasticbottle", ["needAmount"] = 1, ["item"] = "water", ["itemAmount"] = 1 }
	},
	["tablecoke"] = {
		{ ["timer"] = 20, ["need"] = {
			{ ["item"] = "sulfuric", ["amount"] = 1 },
			{ ["item"] = "cokeleaf", ["amount"] = 1 }
		}, ["needAmount"] = 1, ["item"] = "cocaine", ["itemAmount"] = 3 }
	},
	["tablemeth"] = {
		{ ["timer"] = 20, ["need"] = {
			{ ["item"] = "saline", ["amount"] = 1 },
			{ ["item"] = "acetone", ["amount"] = 1 }
		}, ["needAmount"] = 1, ["item"] = "meth", ["itemAmount"] = 3 }
	},
	["tableweed"] = {
		{ ["timer"] = 20, ["need"] = {
			{ ["item"] = "silk", ["amount"] = 1 },
			{ ["item"] = "weedleaf", ["amount"] = 1 }
		}, ["needAmount"] = 1, ["item"] = "joint", ["itemAmount"] = 1 }
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
StealPeds = {
	{ ["Item"] = "pendrive", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "slipper", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "soap", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "pliers", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "deck", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "floppy", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "domino", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "brush", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "rimel", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "WEAPON_SHOES", ["Min"] = 2, ["Max"] = 2 },
	{ ["Item"] = "dices", ["Min"] = 2, ["Max"] = 3 },
	{ ["Item"] = "spray04", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "spray03", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "spray02", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "spray01", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "bracelet", ["Min"] = 2, ["Max"] = 3 },
	{ ["Item"] = "watch", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "goldcoin", ["Min"] = 3, ["Max"] = 5 },
	{ ["Item"] = "silvercoin", ["Min"] = 4, ["Max"] = 6 },
	{ ["Item"] = "oxy", ["Min"] = 1, ["Max"] = 3 },
	{ ["Item"] = "analgesic", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "pager", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "camera", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "binoculars", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "hennessy", ["Min"] = 1, ["Max"] = 3 },
	{ ["Item"] = "dewars", ["Min"] = 1, ["Max"] = 3 },
	{ ["Item"] = "teddy", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "chocolate", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "notepad", ["Min"] = 1, ["Max"] = 3 },
	{ ["Item"] = "plasticbottle", ["Min"] = 1, ["Max"] = 2 },
	{ ["Item"] = "card01", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "card02", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "card03", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "card04", ["Min"] = 1, ["Max"] = 1 },
	{ ["Item"] = "card05", ["Min"] = 1, ["Max"] = 1 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALITENS
-----------------------------------------------------------------------------------------------------------------------------------------
StealItens = {
	{ ["Item"] = "pendrive", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 150 },
	{ ["Item"] = "slipper", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "soap", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "pliers", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "deck", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "floppy", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "domino", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "brush", ["Min"] = 1, ["Max"] = 4, ["Rand"] = 225 },
	{ ["Item"] = "rimel", ["Min"] = 2, ["Max"] = 4, ["Rand"] = 225 },
	{ ["Item"] = "WEAPON_SHOES", ["Min"] = 2, ["Max"] = 2, ["Rand"] = 225 },
	{ ["Item"] = "dices", ["Min"] = 2, ["Max"] = 4, ["Rand"] = 225 },
	{ ["Item"] = "spray04", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "spray03", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "spray02", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "spray01", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "bracelet", ["Min"] = 2, ["Max"] = 4, ["Rand"] = 200 },
	{ ["Item"] = "xbox", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "playstation", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "watch", ["Min"] = 2, ["Max"] = 3, ["Rand"] = 200 },
	{ ["Item"] = "goldcoin", ["Min"] = 4, ["Max"] = 6, ["Rand"] = 175 },
	{ ["Item"] = "silvercoin", ["Min"] = 4, ["Max"] = 8, ["Rand"] = 175 },
	{ ["Item"] = "oxy", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "analgesic", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "firecracker", ["Min"] = 1, ["Max"] = 2, ["Rand"] = 200 },
	{ ["Item"] = "pager", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 150 },
	{ ["Item"] = "GADGET_PARACHUTE", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "WEAPON_SNSPISTOL", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 50 },
	{ ["Item"] = "lockpick", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 50 },
	{ ["Item"] = "WEAPON_WRENCH", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 125 },
	{ ["Item"] = "WEAPON_POOLCUE", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 125 },
	{ ["Item"] = "WEAPON_BAT", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 125 },
	{ ["Item"] = "card02", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "camera", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "binoculars", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "hennessy", ["Min"] = 1, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "dewars", ["Min"] = 1, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "teddy", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 225 },
	{ ["Item"] = "chocolate", ["Min"] = 1, ["Max"] = 3, ["Rand"] = 225 },
	{ ["Item"] = "lighter", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 225 },
	{ ["Item"] = "cellphone", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 150 },
	{ ["Item"] = "tyres", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "notepad", ["Min"] = 1, ["Max"] = 5, ["Rand"] = 225 },
	{ ["Item"] = "plate", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "plasticbottle", ["Min"] = 2, ["Max"] = 5, ["Rand"] = 225 },
	{ ["Item"] = "bait", ["Min"] = 1, ["Max"] = 6, ["Rand"] = 225 },
	{ ["Item"] = "WEAPON_SWITCHBLADE", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 175 },
	{ ["Item"] = "card01", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card02", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card03", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card04", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 },
	{ ["Item"] = "card05", ["Min"] = 1, ["Max"] = 1, ["Rand"] = 200 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOTS
-----------------------------------------------------------------------------------------------------------------------------------------
Loots = {
	["Medic"] = {
		["Players"] = {},
		["Cooldown"] = 3600,
		["List"] = {
			{ ["item"] = "alcohol", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "codeine", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "amphetamine", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "acetone", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "saline", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sulfuric", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "syringe", ["min"] = 2, ["max"] = 4 }
		}
	},
	["Weapons"] = {
		["Players"] = {},
		["Cooldown"] = 3600,
		["List"] = {
			{ ["item"] = "roadsigns", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "techtrash", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sheetmetal", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "explosives", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "aluminum", ["min"] = 6, ["max"] = 8 },
			{ ["item"] = "copper", ["min"] = 6, ["max"] = 8 }
		}
	},
	["Supplies"] = {
		["Players"] = {},
		["Cooldown"] = 3600,
		["List"] = {
			{ ["item"] = "tarp", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "techtrash", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sheetmetal", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "roadsigns", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "sulfuric", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "saline", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "alcohol", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "explosives", ["min"] = 2, ["max"] = 4 },
			{ ["item"] = "aluminum", ["min"] = 4, ["max"] = 8 },
			{ ["item"] = "copper", ["min"] = 4, ["max"] = 8 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Inventory()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		local Identity = vRP.Identity(Passport)
		for Index,v in pairs(Inv) do
			if not v["item"] or (parseInt(v["amount"]) <= 0 or not itemBody(v["item"])) then
				vRP.RemoveItem(Passport,v["item"],parseInt(v["amount"]),false)
			else
	
				v["amount"] = parseInt(v["amount"])
				v["peso"] = itemWeight(v["item"])
				v["stack"] = itemStack(v["item"])
				v["index"] = itemIndex(v["item"])
				v["name"] = itemName(v["item"])
				v["key"] = v["item"]
				v["slot"] = Index
				v["desc"] = "<item>"..v["name"].."</item>"


				local Description = itemDescription(v["item"])
				if Description then
					v["desc"] = v["desc"].."<br><description>"..Description.."</description>"				
				end
	
				local Split = splitString(v["item"])
				if Split[1] == "identity" or Split[1] == "fidentity" or string.sub(v["item"],1,5) == "badge" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					if Split[1] == "fidentity" then
						Identity = vRP.FalseIdentity(Number)
					end
					v["desc"] = v["desc"].."<br><legenda>Passaporte: <r>"..Number.."</r> <br>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "vehkey" then
					v["desc"] = v["desc"].."<br><legenda>Placa do Veículo: <r>"..(Split[2]).."</r></legenda>"
				elseif Split[1] == "homekey" then
					v["desc"] = v["desc"].."<br><legenda>Numeração: <r>"..(Split[3]).."</r></legenda>"
				elseif Split[1] == "creditcard" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "debitcard"  then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
				elseif Split[1] == "driverlicense" then
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..json.decode(Split[3])["name"].."</r> <br>Emissão: <r>"..os.date("%d/%m/%Y", json.decode(Split[3])["issued"]).."</r><br>Validity: <r>"..os.date("%d/%m/%Y", json.decode(Split[3])["expiration"]).."</r><br>Categoria: <r>"..string.gsub(json.encode(json.decode(Split[3])["categories"]), '[^%a,]', '').."</r></legenda>"
				elseif Split[1] == "dmvdocs" then
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..vRP.Identity(parseInt(Split[2]))["name"].." "..vRP.Identity(parseInt(Split[2]))["name2"].."</r> <br>Prática: <r>"..string.gsub(Split[5], '[^%a,]', '').."</r><br>Teórica: <r>"..string.gsub(Split[4], '[^%a,]', '').."</r><br>Categoria: <r>"..string.gsub(Split[3], '[^%a,]', '').."</r></legenda>"
				elseif Split[3] and itemType(v["item"]) == "Armamento" then
					v["desc"] = v["desc"].."<br><legenda>Número de série: <r>"..Split[3].."</r></legenda>"
				elseif Split[1] == "receipt" then
					v["desc"] = v["desc"].."<br><legenda>Data: <r>"..os.date("%Y-%m-%d %H:%M:%S", Split[3]).."</r> <br>Nome: <r>"..vRP.Identity(parseInt(Split[2]))["name"].." "..vRP.Identity(parseInt(Split[2]))["name2"].."</r><br>Valor: <r>"..parseFormat(Split[4]).."</r><br>Descrição: <r>"..Split[5].."</r></legenda>"
				end
				
				if Split[2] then
					if itemCharges(v["item"]) then
						v["charges"] = parseInt(Split[2] * 33)
					end
					if itemDurability(v["item"]) then
						v["durability"] = parseInt(os.time() - Split[2])
						v["days"] = itemDurability(v["item"])
					end
				end

				Inventory[Index] = v
			end
		end
		return Inventory,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEND
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Send(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and not exports["hud"]:Wanted(Passport)  and Amount > 0 then
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			local OtherPassport = vRP.Passport(ClosestPed)
			if OtherPassport then
				Active[Passport] = true

				Player(source)["state"]["Cancel"] = true
				Player(source)["state"]["Buttons"] = true
				Player(ClosestPed)["state"]["Cancel"] = true
				Player(ClosestPed)["state"]["Buttons"] = true

				local AmountAut = vRP.SendInventory(Passport, OtherPassport, Amount, Slot)
				if AmountAut ~= Amount and type(AmountAut) == "number" then
					vRPC.createObjects(source,"mp_safehouselost@","package_dropoff","prop_paper_bag_small",16,28422,0.0,-0.05,0.05,180.0,0.0,0.0)
					TriggerClientEvent("inventory:Update",source,"Backpack")
					TriggerClientEvent("inventory:Update",ClosestPed,"Backpack")
					SetTimeout(3000,function()
						vRPC.removeObjects(source)
					end)
				end

				Player(source)["state"]["Cancel"] = false
				Player(source)["state"]["Buttons"] = false
				Player(ClosestPed)["state"]["Cancel"] = false
				Player(ClosestPed)["state"]["Buttons"] = false

				Active[Passport] = nil
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Update(Slot, Target, Amount)
	local source = source
	local Passport = vRP.Passport(source)
	if not Active[Passport] and Passport then
		Active[Passport] = true
		vRP.UpdateInventory(Passport, Slot, Target, Amount)
		Active[Passport] = false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WATERS
-----------------------------------------------------------------------------------------------------------------------------------------
local Waters = {
	["soap"] = true,
	["scuba"] = true,
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Use(Slot,Amount)
	local source = source
	local Slot = tostring(Slot)
	local Amount = parseInt(Amount,true)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then

		local Inv = vRP.Inventory(Passport)
		if not Inv[Slot] or not Inv[Slot]["item"] then
			return
		end

		local Split = splitString(Inv[Slot]["item"])
		local Full = Inv[Slot]["item"] 
		local Item = Split[1]

		if Player(source)["state"]["Handcuff"] and Item ~= "lockpick" then
			return
		end

		if itemDurability(Full) and vRP.CheckDamaged(Full) then
			TriggerClientEvent("Notify",source,"amarelo","<b>"..itemName(Item).."</b> danificado.",5000,"Atenção")
			return
		end

		if Item ~= "rope" and Item ~= "fishingrod" and Item ~= "miningpan" then
			if (Waters[Item] and not vCLIENT.Water(source)) or (not Waters[Item] and vCLIENT.Water(source)) then
				return
			end
		end

		if itemType(Full) == "Armamento" and parseInt(Slot) <= 5 then
			if not Player(source)["state"]["Safezone"] then
			
				if vCLIENT.ReturnWeapon(source) then
				local Check,AmmoClip,Weapon = vCLIENT.StoreWeapon(source)
				if Check then
					local Ammunation = itemAmmo(Weapon)
					if Ammunation then
						if AmmoClip > 0 then
							if not Ammos[Passport] then
								Ammos[Passport] = {}
							end
							Ammos[Passport][Ammunation] = AmmoClip
						else
							if Ammos[Passport] and Ammos[Passport][Ammunation] then
								Ammos[Passport][Ammunation] = nil
							end
						end
					end
					TriggerClientEvent("NotifyItens",source,{ "-",itemIndex(Weapon),1,itemName(Weapon) })
					exports["inventory"]:CleanWeapons(Passport,false)
				end
				else
				local Attach = {}
				local AmmoClip = 0
				local Ammunation = itemAmmo(Item)
				if Ammunation then
					if Ammos[Passport] and Ammos[Passport][Ammunation] then
						AmmoClip = Ammos[Passport][Ammunation]
					end
				end

				if vCLIENT.ExistAttachs(source,Item) then
					if Attachs[Passport] and Attachs[Passport][Item] then
						Attach = Attachs[Passport][Item]
					end
				end

				if vCLIENT.TakeWeapon(source,Item,AmmoClip,Attach) then
					TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),1,itemName(Full) })
				end
				end

			else
				TriggerClientEvent("Notify",source,"amarelo","O armamento não pode ser usado na safezone.",5000,"Atenção")
			end
		elseif itemType(Full) == "Munição" then
			local Check,AmmoClip,Weapon = vCLIENT.InfoWeapon(source,Item)
			if Check then
	
				if Weapon == "WEAPON_PETROLCAN" then
					if (AmmoClip + Amount) > 4500 then
						Amount = 4500 - AmmoClip
					end
				else
					if (AmmoClip + Amount) > 250 then
						Amount = 250 - AmmoClip
					end
				end

				if Item ~= itemAmmo(Weapon) or Amount <= 0 then
					return
				end
		

				if vRP.TakeItem(Passport,Full,Amount,false,Slot) then

					if Weapon == "WEAPON_FLAMETHROWER" then
						Amount = 5000
						if (AmmoClip + Amount) > 5000 then
							Amount = 5000 - AmmoClip
						end
					end

					if not Ammos[Passport] then
						Ammos[Passport] = {}
					end

					Ammos[Passport][Item] = AmmoClip + Amount

					TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),Amount,itemName(Full) })
					TriggerClientEvent("inventory:Update",source,"Backpack")
					vCLIENT.Reloading(source,Weapon,Amount)
				end
			end

		elseif itemType(Full) == "Throwing" then
			if vCLIENT.ReturnWeapon(source) then
				local Check,AmmoClip,Weapon = vCLIENT.StoreWeapon(source)

				if Check then
					local Amunnation = itemAmmo(Weapon)
					if Amunnation then
						if AmmoClip > 0 then
							if not Ammos[Passport] then
								Ammos[Passport] = {}
							end

							Ammos[Passport][Amunnation] = AmmoClip
						else
							if Ammos[Passport] and Ammos[Passport][Amunnation] then
								Ammos[Passport][Amunnation] = nil
							end
						end
					end

					TriggerClientEvent("NotifyItens",source,{ "-",itemIndex(Weapon),1,itemName(Weapon) })
					exports["inventory"]:CleanWeapons(Passport,false)
				end
			else
				if vCLIENT.TakeWeapon(source,Item,1,nil,Full) then
					TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),1,itemName(Full) })
				end
			end
		elseif Item == "ATTACH_FLASHLIGHT" or Item == "ATTACH_CROSSHAIR" or Item == "ATTACH_SILENCER" or Item == "ATTACH_MAGAZINE" or Item == "ATTACH_GRIP" then
			local Weapon = vCLIENT.ReturnWeapon(source)
			if Weapon then
				if vCLIENT.CheckAttachs(source,Item,Weapon) then
					if not Attachs[Passport] then
						Attachs[Passport] = {}
					end

					if not Attachs[Passport][Weapon] then
						Attachs[Passport][Weapon] = {}
					end

					if not Attachs[Passport][Weapon][Item] then
						if vRP.TakeItem(Passport,Full,1,false,Slot) then
							TriggerClientEvent("NotifyItens",source,{ "+",itemIndex(Full),1,itemName(Full) })
							TriggerClientEvent("inventory:Update",source,"Backpack")
							Attachs[Passport][Weapon][Item] = true
							vCLIENT.Attachs(source,Item,Weapon)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","O armamento já possui um componente equipado.",5000,"Atenção")
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O armamento não possui suporte ao componente.",5000,"Atenção")
				end
			end
		elseif itemChest(Full) then
			local Ped = GetPlayerPed(source)
			if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
				return
			end
			TriggerClientEvent("inventory:Close",source)
			if Item == "suitcase" then
				vRPC.createObjects(source,"anim@heists@box_carry@","idle","p_sec_case_02_s",49,28422,  0.0, -0.08, -0.08, 0.0, 0.0, 180.0)
			elseif Item == "ciggypack" then
				vRPC.createObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop", "ng_proc_cigpak01b",49,18905, 0.14, 0.0, 0.04, -50.0 , 290.0, 00.0)
			elseif Item == "wallet" then
				vRPC.createObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop", "prop_ld_wallet_02",49,18905, 0.11, 0.0, 0.08, 55.0 , 280.0, 0.0)
			end
			TriggerClientEvent("sounds:Private",source,"Stash",0.04)
			TriggerClientEvent("chest:Open",source,Full,"Item")
		elseif Use[Item] then
			Use[Item](source,Passport,Amount,Slot,Full,Item,Split)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Cancel")
AddEventHandler("inventory:Cancel",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Active[Passport] then
			vGARAGE.UpdateHotwired(source,false)
			Player(source)["state"]["Buttons"] = false
			TriggerClientEvent("Progress",source,1000)

			if Lootsfy[Passport] then
				local Box = Lootsfy[Passport]["Box"]
				local Number = Lootsfy[Passport]["Number"]
				Loots[Box]["Players"][Number][Passport] = os.time()
				Lootsfy[Passport] = nil
			end

			if ParkingMetersfy[Passport] then
				local Number = ParkingMetersfy[Passport]
				ParkingMeters[Number]["Timer"] = os.time()
				ParkingMetersfy[Passport] = nil
			end

			if Pumpjacksfy[Passport] then
				local Number = Pumpjacksfy[Passport]
				Pumpjacks[Number]["Timer"] = os.time()
				Pumpjacksfy[Passport] = nil
			end

			Active[Passport] = nil
		end

		if Carry[Passport] then
			if vRP.Passport(Carry[Passport]) then
				TriggerClientEvent("inventory:Carry",Carry[Passport],source,"Detach")
				Player(Carry[Passport])["state"]["Carry"] = false
				vRPC.removeObjects(Carry[Passport])
			end
			Carry[Passport] = nil
		end

		if Player(source)["state"]["Camera"] then
			TriggerClientEvent("inventory:Camera",source)
		end

		vRP.FreezePlayer(source,false)
		vRPC.removeObjects(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFYWEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.VerifyWeapon(Item,Ammo)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not vRP.ConsultItem(Passport,Item,1) then
		local Ammunation = itemAmmo(Item)
		if Ammunation and Ammos[Passport] and Ammos[Passport][Ammunation] then
			if Ammo and Ammo > 0 then
				Ammos[Passport][Ammunation] = Ammo
			end

			if Ammos[Passport][Ammunation] > 0 then
				vRP.GenerateItem(Passport,Ammunation,Ammos[Passport][Ammunation])
				Ammos[Passport][Ammunation] = nil
			end
		end

		if Attachs[Passport] and Attachs[Passport][Item] then
			for Component,_ in pairs(Attachs[Passport][Item]) do
				vRP.GenerateItem(Passport,Component,1)
			end

			Attachs[Passport][Item] = nil
		end

		TriggerClientEvent("inventory:Update",source,"Backpack")
		exports["inventory"]:CleanWeapons(Passport,false)

		return false
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKEXISTWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.CheckExistWeapons(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Item ~= "" and Item and not vRP.ConsultItem(Passport,Item,1) then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETHROWING
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.RemoveThrowing(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Item ~= "" and Item ~= nil then
		vRP.TakeItem(Passport,Item,1)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREVENTWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.PreventWeapons(Item,Ammo)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Ammos[Passport] then
		local Ammunation = itemAmmo(Item)
		if Ammunation and Ammos[Passport][Ammunation] then
			if Ammo > 0 then
				Ammos[Passport][Ammunation] = Ammo
			else
				Ammos[Passport][Ammunation] = nil
				exports["inventory"]:CleanWeapons(Passport,false)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:PARKINGMETER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:ParkingMeter")
AddEventHandler("inventory:ParkingMeter",function(Entity)
	local source = source
	local Coords = Entity[4]
	local Number = parseInt(#ParkingMeters + 1)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Coords then

		for Index = 1,#ParkingMeters do
			if #(ParkingMeters[Index]["Coords"] - Coords) <= 0.75 then
				if os.time() <= ParkingMeters[Index]["Timer"] then
					TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..ParkingMeters[Index]["Timer"] - os.time().."</b> segundos.",5000,"Atenção")
					return
				else
					Number = Index
					break
				end
			end
		end

		ParkingMetersfy[Passport] = Number
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,10000)
		vRPC.playAnim(source,false,{"amb@prop_human_bum_bin@base","base"},true)
		ParkingMeters[Number] = { ["Coords"] = Coords, ["Timer"] = os.time() + 1800, ["Passport"] = Passport }

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				ParkingMetersfy[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				if ParkingMeters[Number]["Passport"] == Passport then

					local ped = GetPlayerPed(source)
					local coords = GetEntityCoords(ped)
					local Groups = vRP.Groups()
					for key,Value in pairs(Groups) do
						if Value["Type"] == "Policia" then
							local Grupo = vRP.NumPermission(key)
							for Passport,Sources in pairs(Grupo) do
								async(function()
									vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
									TriggerClientEvent("NotifyPush",Sources,{ code = "192",title = "Assalto ao Parquimetro !!!", x = coords["x"], y = coords["y"], z = coords["z"], criminal = "EMERGENCIA", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
								end)
							end
						end
					end

					local Valuation = math.random(8,12)
					if (vRP.InventoryWeight(Passport) + itemWeight("dollars") * Valuation) <= vRP.GetWeight(Passport) then
						vRP.GenerateItem(Passport,"dollars",Valuation,true)
					else
						TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
						ParkingMeters[Number]["Timer"] = os.time()
					end

				end
			end
			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Loot")
AddEventHandler("inventory:Loot",function(Number,Box)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Loots[Box] then
		if not Loots[Box]["Players"][Number] then
			Loots[Box]["Players"][Number] = {}
		end

		if Loots[Box]["Players"][Number][Passport] then
			if os.time() <= Loots[Box]["Players"][Number][Passport] then
				TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Loots[Box]["Players"][Number][Passport] - os.time().."</b> segundos.",5000,"Atenção")
				return false
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,10000)
		Lootsfy[Passport] = { ["Number"] = Number, ["Box"] = Box }
		Loots[Box]["Players"][Number][Passport] = os.time() + Loots[Box]["Cooldown"]
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Lootsfy[Passport] = nil
				Player(source)["state"]["Buttons"] = false

				local Rand = math.random(#Loots[Box]["List"])
				local Amount = math.random(Loots[Box]["List"][Rand]["min"],Loots[Box]["List"][Rand]["max"])
				local Item = { Loots[Box]["List"][Rand]["item"],Amount }

				if (vRP.InventoryWeight(Passport) + itemWeight(Item[1]) * Item[2]) <= vRP.GetWeight(Passport) then
					vRP.GenerateItem(Passport,Item[1],Item[2],true)
				else
					TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
					Loots[Box]["Players"][Number][Passport] = os.time()
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:CHANGEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:applyPlate")
AddEventHandler("inventory:applyPlate",function(Entitys)
	local source = source
	local ConsultItem = {}
	local Plate = Entitys[1]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not Plates[Plate] then
			ConsultItem = vRP.InventoryItemAmount(Passport,"plate")
			if ConsultItem[1] <= 0 then
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("plate").."</b>.",5000,"Atenção")
				return false
			end
		end

		if Plates[Plate] and Passport ~= Plates[Plate][1] then
			return false
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,10000)
		vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if not Plates[Plate] then
					if vRP.TakeItem(Passport,ConsultItem[2],1,true) then
						local Vehicle = NetworkGetEntityFromNetworkId(Entitys[4])
						if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
							local NewPlate = vRP.GeneratePlate()
							Plates[NewPlate] = { Passport,Plate }
							SetVehicleNumberPlateText(Vehicle,NewPlate)
							if not vRP.PassportPlate(NewPlate) then
								local Plates = GlobalState["Plates"]
								Plates[NewPlate] = Passport
								GlobalState:set("Plates",Plates,true)
								--[[ Entity(Vehicle)["state"]:set("Lockpick",Passport,true) ]]
							else
								local Plates = GlobalState["Plates"]
								Plates[NewPlate] = true
								GlobalState:set("Plates",Plates,true)
								--[[ Entity(Vehicle)["state"]:set("Lockpick",true,true) ]]
							end
						end
					end
				else
					local Vehicle = NetworkGetEntityFromNetworkId(Entitys[4])
					if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
						SetVehicleNumberPlateText(Vehicle,Plates[Plate][2])
					end
					if math.random(100) >= 50 then
						vRP.GenerateItem(Passport,"plate",1,true)
					else
						TriggerClientEvent("Notify",source,"amarelo","Após remove-la a mesma quebrou.",5000,"Atenção")
					end
					Plates[Plate] = nil
				end
			end

			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:StealTrunk")
AddEventHandler("inventory:StealTrunk",function(Entity)
	local source = source
	local Plate = Entity[1]
	local Model = Entity[2]
	local Network = Entity[4]
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		if not vCLIENT.CheckWeapon(source,"WEAPON_CROWBAR") then
			TriggerClientEvent("Notify",source,"amarelo","<b>Pé de Cabra</b> não encontrado.",5000,"Atenção")
			return false
		end
		if not vRP.PassportPlate(Plate) then
			if not Trunks[Plate] or os.time() >= Trunks[Plate] then
				vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
				Active[Passport] = os.time() + 100

				if vTASKBAR.Task(source,5,7500) then
					
					Active[Passport] = os.time() + 20
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("Progress",source,20000)
					TriggerClientEvent("player:Residuals",source,"Resíduo de Ferro.")

					local Players = vRPC.Players(source)
					for _,v in pairs(Players) do
						async(function()
							TriggerClientEvent("player:VehicleDoors",v,Network,"open")
						end)
					end

					repeat
						if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
							Active[Passport] = nil
							vRPC.stopAnim(source,false)
							Player(source)["state"]["Buttons"] = false

							for _,v in pairs(Players) do
								async(function()
									TriggerClientEvent("player:VehicleDoors",v,Network,"close")
								end)
							end

							if not Trunks[Plate] or os.time() >= Trunks[Plate] then
								local Rand = math.random(#StealItens)
								local Amount = math.random(StealItens[Rand]["Min"],StealItens[Rand]["Max"])
								if (vRP.InventoryWeight(Passport) + itemWeight(StealItens[Rand]["Item"]) * Amount) <= vRP.GetWeight(Passport) then
									vRP.GenerateItem(Passport,StealItens[Rand]["Item"],Amount,true)
									Trunks[Plate] = os.time() + 3600
									vRP.UpgradeStress(Passport,2)
								else
									TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
								end
							end
						end

						Wait(100)
					until not Active[Passport]
				else
					TriggerEvent("Wanted",source,Passport,30)
					vRPC.stopAnim(source,false)
					Active[Passport] = nil

					local Coords = vRP.GetEntityCoords(source)

					local Groups = vRP.Groups()
					for key,Value in pairs(Groups) do
						if Value["Type"] == "Policia" then
							local Service = vRP.NumPermission(key)
							for Passports,Sources in pairs(Service) do
								async(function()
									vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
									TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(Model).." - "..Plate, color = 44 })
								end)
							end
						end
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Veículo protegido pela seguradora.",1000,"amarelo")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Pumpjack
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Pumpjack")
AddEventHandler("inventory:Pumpjack",function(Entity)
	local source = source
	local Coords = Entity[4]
	local Number = parseInt(#Pumpjacks + 1)
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Coords then

		for Index = 1,#Pumpjacks do
			if #(Pumpjacks[Index]["Coords"] - Coords) <= 0.75 then
				if os.time() <= Pumpjacks[Index]["Timer"] then
					TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Pumpjacks[Index]["Timer"] - os.time().."</b> segundos.",5000,"Atenção")
					return
				else
					Number = Index
					break
				end
			end
		end

		if not vCLIENT.CheckWeapon(source,"WEAPON_CROWBAR") then
			TriggerClientEvent("Notify",source,"amarelo","Você precisa colocar o <b>" .. itemName("WEAPON_CROWBAR") .. "</b> em mãos.",5000,"Atenção")
			return 
		end


		Pumpjacksfy[Passport] = Number
		Active[Passport] = os.time() + 60
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,60000)
		vRPC.playAnim(source, false,{ "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer" }, true)
		Pumpjacks[Number] = { ["Coords"] = Coords, ["Timer"] = os.time() + 1800, ["Passport"] = Passport }

		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Pumpjacksfy[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				if Pumpjacks[Number]["Passport"] == Passport then
					local Valuation = math.random(2)
					if (vRP.InventoryWeight(Passport) + itemWeight("oilgallon") * Valuation) <= vRP.GetWeight(Passport) then
						vRP.GenerateItem(Passport,"oilgallon",Valuation,true)
						vRP.UpgradeStress(Passport, 5)
					else
						TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
						Pumpjacks[Number]["Timer"] = os.time()
					end

				end
			end
			Wait(100)
		until not Active[Passport]
	end


end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMALS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Animals")
AddEventHandler("inventory:Animals",function(Entity)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and not Active[Passport] then
        if vCLIENT.CheckWeapon(source,"WEAPON_SWITCHBLADE") then
            Active[Passport] = os.time() + 30
            Player(source)["state"]["Buttons"] = true
            TriggerClientEvent("Progress",source,30000)
            vRPC.playAnim(source,false,{"amb@medic@standing@kneel@base","base"},true)
            vRPC.playAnim(source,true,{"anim@gangops@facility@servers@bodysearch@","player_search"},true)
            repeat
                if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
                    vRPC.removeObjects(source)
                    Active[Passport] = nil
                    Player(source)["state"]["Buttons"] = false
                    vRP.UpgradeStress(Passport,1)
                    TriggerEvent("DeletePed",Entity[3])
                    vRP.PutExperience(Passport,"Hunting",1)
                    vRP.GenerateItem(Passport,"deerantlers",1,true)
                    if math.random(100) <= 30 then
                        vRP.GenerateItem(Passport,"deerpelt"..math.random(2,5),1,true)
                        vRP.GenerateItem(Passport,"deermeat"..math.random(2,5),1,true)
                    else
                        vRP.GenerateItem(Passport,"deerpelt",1,true)
                        vRP.GenerateItem(Passport,"deermeat",1,true)
                    end
                end
                Wait(100)
            until not Active[Passport]
        else
            TriggerClientEvent("Notify",source,"amarelo","Você precisa colocar o <b>Canivete</b> em mãos.",5000,"Atenção")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:StoreObjects")
AddEventHandler("inventory:StoreObjects",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Objects[Number] then
		if (vRP.InventoryWeight(Passport) + itemWeight(Objects[Number]["item"])) <= vRP.GetWeight(Passport) then
			vRP.GiveItem(Passport,Objects[Number]["item"],1,true)
			TriggerClientEvent("objects:Remover",-1,Number)
			Objects[Number] = nil
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEPRODUCTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:MakeProducts")
AddEventHandler("inventory:MakeProducts",function(Table)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		local Selected = SplitOne(Table)

		if Products[Selected] then

			if Selected == "foodjuice" or Selected == "foodburger" or Selected == "foodbox" then
				if not vRP.HasGroup(Passport,"Restaurantes") then
					return
				end
			end

			if Selected == "cemitery" and math.random(100) >= 25 then
				TriggerEvent("Wanted",source,Passport,60)
				local Coords = vRP.GetEntityCoords(source)

				local Groups = vRP.Groups()
				for key,Value in pairs(Groups) do
					if Value["Type"] == "Policia" then
						local Service = vRP.NumPermission(key)
						for Passports,Sources in pairs(Service) do
							async(function()
								vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
								TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Roubo de Pertences", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", color = 16 })
							end)
						end
					end
				end

			end

			local Need = {}
			local Consult = {}
			local Number = math.random(#Products[Selected])

			if Products[Selected][Number]["item"] then
				if vRP.MaxItens(Passport,Products[Selected][Number]["item"],Products[Selected][Number]["itemAmount"]) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000,"Aviso")
					return
				end
				if (vRP.InventoryWeight(Passport) + itemWeight(Products[Selected][Number]["item"]) * Products[Selected][Number]["itemAmount"]) > vRP.GetWeight(Passport) then
					TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
					return
				end
			end

			if Products[Selected][Number]["need"] then
				local NeedLess = Products[Selected][Number]["need"]
				if type(NeedLess) == "table" then
					for Index,v in pairs(NeedLess) do
						Consult = vRP.InventoryItemAmount(Passport,v["item"])
						if Consult[1] < v["amount"] then
							TriggerClientEvent("Notify",source,"amarelo","Necessário possuir <b>"..v["amount"].."x "..itemName(v["item"]).."</b>.",5000,"Atenção")
							return
						end
						Need[Index] = { Consult[2],v["amount"] }
					end
				else
					needAmount = Products[Selected][Number]["needAmount"]
					Consult = vRP.InventoryItemAmount(Passport,NeedLess)
					if Consult[1] < needAmount then
						TriggerClientEvent("Notify",source,"amarelo","Necessário possuir <b>"..needAmount.."x "..itemName(NeedLess).."</b>.",5000,"Atenção")
						return
					end
				end
			end

			Player(source)["state"]["Buttons"] = true
			Active[Passport] = os.time() + Products[Selected][Number]["timer"]
			TriggerClientEvent("Progress",source,Products[Selected][Number]["timer"] * 1000)

			if Selected == "foodjuice" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "foodburger" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "foodbox" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "cemitery" then
				vRPC.playAnim(source,false,{"amb@medic@standing@tendtodead@idle_a","idle_a"},true)
			elseif Selected == "milkBottle" then
				vRPC.playAnim(source,false,{"amb@medic@standing@tendtodead@base","base"},true)
			elseif Selected == "plasticbottle" then
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Selected == "tablecoke" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "paper" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "tablemeth" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			elseif Selected == "tableweed" then
				vRPC.playAnim(source,false,{"anim@amb@business@coc@coc_unpack_cut@","fullcut_cycle_v6_cokecutter"},true)
			else
				vRPC.playAnim(source,false,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			end

			repeat
				if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
					Player(source)["state"]["Buttons"] = false
					vRPC.removeObjects(source,"two")
					Active[Passport] = nil

					if Products[Selected][Number]["need"] then
						if type(Products[Selected][Number]["need"]) == "table" then
							for _,v in pairs(Need) do
								vRP.RemoveItem(Passport,v[1],v[2],false)
							end
						else
							vRP.RemoveItem(Passport,Consult[2],needAmount,false)
						end
					end

					if Products[Selected][Number]["item"] then
						vRP.GenerateItem(Passport,Products[Selected][Number]["item"],Products[Selected][Number]["itemAmount"],true)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETYRES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:RemoveTyres")
AddEventHandler("inventory:RemoveTyres",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Entity[2] ~= "veto" and Entity[2] ~= "veto2" then

		if not vCLIENT.CheckWeapon(source,"WEAPON_WRENCH") then
			TriggerClientEvent("Notify",source,"amarelo","<b>Chave Inglesa</b> não encontrada.",5000,"Atenção")
			return false
		end

		local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
		if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then

			if vCLIENT.tyreHealth(source,Entity[4],Entity[5]) == 1000.0 then

				if vRP.MaxItens(Passport,"tyres",1) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000,"Atenção")
					return false
				end

				if vRP.PassportPlate(Entity[1]) then

					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)
					vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

					if vTASKBAR.Task(source,3,5000) then
						Active[Passport] = os.time() + 10
						TriggerClientEvent("Progress",source,10000)
						repeat
							if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
								Active[Passport] = nil
								local Vehicle = NetworkGetEntityFromNetworkId(Entity[4])
								if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
									if vCLIENT.tyreHealth(source,Entity[4],Entity[5]) == 1000.0 then
										local Players = vRPC.Players(source)
										for _,v in pairs(Players) do
											async(function()
												TriggerClientEvent("inventory:explodeTyres",v,Entity[4],Entity[1],Entity[5])
											end)
										end
										vRP.GenerateItem(Passport,"tyres",1,true)
									end
								end
							end
							Wait(100)
						until not Active[Passport]
					end

					Player(source)["state"]["Buttons"] = false
					vRPC.removeObjects(source)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:DRINK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Drink")
AddEventHandler("inventory:Drink",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,5000)
		vRPC.createObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_plastic_cup_02",49,28422)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.removeObjects(source,"one")
				vRP.UpgradeThirst(Passport,15)
				Player(source)["state"]["Buttons"] = false
			end
			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:ROLLVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:RollVehicle")
AddEventHandler("player:RollVehicle",function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 60
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,60000)
		vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)
		repeat
			if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
				vRPC.removeObjects(source)
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				local Players = vRPC.Players(source)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("target:RollVehicle",v,Entity[4])
					end)
				end
			end
			Wait(100)
		until not Active[Passport]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEALARM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("inventory:vehicleAlarm")
AddEventHandler("inventory:vehicleAlarm",function(Index,Plate)
	if NetworkDoesNetworkIdExist(Index) then
		local Vehicle = NetToEnt(Index)
		if DoesEntityExist(Vehicle) then
			if GetVehicleNumberPlateText(Vehicle) == Plate then
				SetVehicleAlarm(Vehicle,true)
				StartVehicleAlarm(Vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:BUFFSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("inventory:BuffServer",function(source,Passport,Name,Amount)
	if not Buffs[Name][Passport] then
		Buffs[Name][Passport] = 0
	end
	if os.time() >= Buffs[Name][Passport] then
		Buffs[Name][Passport] = os.time() + Amount
	else
		Buffs[Name][Passport] = Buffs[Name][Passport] + Amount
		if (Buffs[Name][Passport] - os.time()) >= 3600 then
			Buffs[Name][Passport] = os.time() + 3600
		end
	end
	TriggerClientEvent("hud:"..Name,source,Buffs[Name][Passport] - os.time())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUFFS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Buffs",function(Mode,Passport)
	return Buffs[Mode][Passport]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVESERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("SaveServer",function(Silenced)
	local List = vRP.Players()
	for Passport,_ in pairs(List) do
		if Ammos[Passport] then
			vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Ammos", dvalue = json.encode(Ammos[Passport]) })
		end
		if Attachs[Passport] then
			vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Attachs", dvalue = json.encode(Attachs[Passport]) })
			Attachs[Passport] = nil
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport,Source)

	local content = ''
	local Inv = vRP.Inventory(Passport)
	for k,v in pairs(Inv) do
		content = content .. v.amount .. 'x '..itemName(v["item"])..'\n'    
	end
	local Ped = GetPlayerPed(Source)
	local Coords = GetEntityCoords(Ped)
	TriggerEvent("Discord","logInvDisConnnect","**SAIDA\nPassaporte:** "..Passport.."\n**Cds:** "..mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]).."\n"..content,3553599)

	if Ammos[Passport] then
		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Ammos", dvalue = json.encode(Ammos[Passport]) })
		Ammos[Passport] = nil
	end
	
	if Attachs[Passport] then
		vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Attachs", dvalue = json.encode(Attachs[Passport]) })
		Attachs[Passport] = nil
	end

	if Lootsfy[Passport] then
		local Box = Lootsfy[Passport]["Box"]
		local Number = Lootsfy[Passport]["Number"]
		Loots[Box]["Players"][Number][Passport] = os.time()
		Lootsfy[Passport] = nil
	end

	if ParkingMetersfy[Passport] then
		local Number = ParkingMetersfy[Passport]
		ParkingMeters[Number]["Timer"] = os.time()
		ParkingMetersfy[Passport] = nil
	end

	if Pumpjacksfy[Passport] then
		local Number = Pumpjacksfy[Passport]
		Pumpjacks[Number]["Timer"] = os.time()
		Pumpjacksfy[Passport] = nil
	end

	if Active[Passport] then
		Active[Passport] = nil
	end

	if Healths[Passport] then
		Healths[Passport] = nil
	end

	if Armors[Passport] then
		Armors[Passport] = nil
	end

	if Drugs[Passport] then
		Drugs[Passport] = nil
	end

	if Carry[Passport] then
		if vRP.Passport(Carry[Passport]) then
			TriggerClientEvent("inventory:Carry",Carry[Passport],Source,"Detach")
			Player(Carry[Passport])["state"]["Carry"] = false
			vRPC.removeObjects(Carry[Passport])
		end
		Carry[Passport] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,Source)

	if vRP.HasGroup(Passport, "ArmasGold") then
		if not vRP.ConsultItem(Passport,"WEAPON_FALGOLDNM",1) then
			vRP.GenerateItem(Passport, "WEAPON_FALGOLDNM",1,true)
		end
		if not vRP.ConsultItem(Passport,"WEAPON_ARTIC",1) then
			vRP.GenerateItem(Passport, "WEAPON_ARTIC",1,true)
		end
	else
		if vRP.ConsultItem(Passport,"WEAPON_FALGOLDNM",1) then
			vRP.RemoveItem(Passport,"WEAPON_FALGOLDNM",1,true)
		end
		if vRP.ConsultItem(Passport,"WEAPON_ARTIC",1) then
			vRP.RemoveItem(Passport,"WEAPON_ARTIC",1,true)
		end
	end

	local content = ''
	local Inv = vRP.Inventory(Passport)
	for k,v in pairs(Inv) do
		content = content .. v.amount .. 'x '..itemName(v["item"])..'\n'    
	end
	local Ped = GetPlayerPed(Source)
	local Coords = GetEntityCoords(Ped)
	TriggerEvent("Discord","logInvConnnect","**ENTRADA\nPassaporte:** "..Passport.."\n**Cds:** "..mathLength(Coords["x"])..","..mathLength(Coords["y"])..","..mathLength(Coords["z"]).."\n"..content,3553599)

	Ammos[Passport] = vRP.UserData(Passport,"Ammos")
	Attachs[Passport] = vRP.UserData(Passport,"Attachs")

	TriggerClientEvent("objects:Table",Source,Objects)
	
	local Data = vRP.UserData(Passport,"Backpack")
	for Key,Value in pairs(Data) do
		if os.time() > tonumber(Value) then
			Data[Key] = nil
		end
	end
	vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Backpack", dvalue = json.encode(Data) })

	for Name,_ in pairs(Buffs) do
		if Buffs[Name] and Buffs[Name][Passport] and os.time() < Buffs[Name][Passport] then
			TriggerClientEvent("hud:"..Name,Source,Buffs[Name][Passport] - os.time())
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("CleanWeapons",function(Passport,Clean)
	local source = vRP.Source(Passport)
	if source then
		if DoesPlayerExist(source) then
			local Ped = GetPlayerPed(source)
			local Weapon = GetSelectedPedWeapon(Ped)

			RemoveWeaponFromPed(Ped,Weapon)
			RemoveAllPedWeapons(Ped,true)
			SetPedAmmo(Ped,Weapon,0)
		end

		--[[ if Clean then
			Attachs[Passport] = {}
			Ammos[Passport] = {}
		end ]]
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STEALPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.StealPeds()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then

		local Rand = math.random(#StealPeds)
		local Amount = math.random(StealPeds[Rand]["Min"],StealPeds[Rand]["Max"])

		if vRP.MaxItens(Passport,StealPeds[Rand]["Item"],Amount) then
			TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000,"Atenção")
			return true
		end

		if (vRP.InventoryWeight(Passport) + itemWeight(StealPeds[Rand]["Item"]) * Amount) <= vRP.GetWeight(Passport) then
			vRP.GenerateItem(Passport,StealPeds[Rand]["Item"],Amount,true)

			if math.random(100) >= 75 and DoesPlayerExist(source) then
				TriggerEvent("Wanted",source,Passport,60)

				local Coords = vRP.GetEntityCoords(source)
				local Groups = vRP.Groups()
				for key,Value in pairs(Groups) do
					if Value["Type"] == "Policia" then
						local Service = vRP.NumPermission(key)
						for Passports,Sources in pairs(Service) do
							async(function()
								vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
								TriggerClientEvent("NotifyPush",Sources,{ code = 32, title = "Assalto a mão armada", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Ligação Anônima", color = 16 })
							end)
						end
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso")
		end

		
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOTSFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.ShotsFired(Vehicle)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Vehicle then
			Vehicle = "Disparos de um veículo"
		else
			Vehicle = "Disparos com arma de fogo"
		end

		if DoesPlayerExist(source) then
			local Coords = vRP.GetEntityCoords(source)
			local Groups = vRP.Groups()
			for key,Value in pairs(Groups) do
				if Value["Type"] == "Policia" then
					local Service = vRP.NumPermission(key)
					for Passports,Sources in pairs(Service) do
						async(function()
							vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
							TriggerClientEvent("NotifyPush",Sources,{ code = 10, title = Vehicle, x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 6 })
						end)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
local Delay = {}
function Creative.CheckHouseDelay(Number)
    local source = source
    if not Delay[Number] or Delay[Number] <= os.time() then
        Delay[Number] = os.time() + (15 * 60) --15 minutos 
        return true
    else
        TriggerClientEvent("Notify", source, "amarelo", "Aguarde "..CompleteTimers(tonumber(Delay[Number]) - tonumber(os.time()))..".",5000,"Atenção")
        return false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.FinishHouseService(WorkingAtHome, ServicesDone)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local Completed = true
        for k,v in pairs(ServicesDone) do
            if not v then
                Completed = false
                break
            end
        end
        if Completed then
            vRP.GiveItem(Passport, "dollars", #ServicesDone * math.random(90, 110), true)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:KEY
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.UserKeys()
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
		return { 
			["Vehicles"] = exports["oxmysql"]:query_async("SELECT * FROM vehicles WHERE work = 'false' AND Passport = @Passport;",{ Passport = Passport }),
			["Propertys"] = vRP.Query("propertys/AllUser",{ Passport = Passport }),
		}
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:KEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Key")
AddEventHandler("inventory:Key",function(Item)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Split = splitString(Item,"-")
		if vRP.PaymentFull(Passport,tonumber(Split[1]),"Keychain") then
			vRP.GiveItem(Passport, Split[2] == "homekey" and (Split[2].."-"..Split[3].."-"..Split[4]) or (Split[2].."-"..Split[3]), 1, true, false)
			TriggerClientEvent("dynamic:closeSystem",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:IDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Identity")
AddEventHandler("inventory:Identity",function()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.Request(source,"Identidade","Deseja tirar segunda via? No valor de <b>R$" .. parseFormat(500) .. "</b> reais.") then
			if vRP.PaymentFull(Passport,500,"identity","Identidade") then
				vRP.GiveItem(Passport,"identity-"..Passport,1,true)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:IDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Inspect")
AddEventHandler("inventory:Inspect",function(Weapon,Passport,OtherPassport)
	local Ammunation = itemAmmo(Weapon)
	if Ammunation then

		if not Ammos[Passport] then
			Ammos[Passport] = {}
		end

		if not Ammos[Passport][Ammunation] then
			Ammos[Passport][Ammunation] = 0
		end

		if not Ammos[OtherPassport] then
			Ammos[OtherPassport] = {}
		end

		if not Ammos[OtherPassport][Ammunation] then
			Ammos[OtherPassport][Ammunation] = 0
		end

		Ammos[Passport][Ammunation] = Ammos[Passport][Ammunation] + Ammos[OtherPassport][Ammunation]
		Ammos[OtherPassport][Ammunation] = nil
		
		exports["inventory"]:CleanWeapons(OtherPassport,false)
	end
end)