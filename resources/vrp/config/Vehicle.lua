-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	-- Boats
		["dinghy"] = {
			["Name"] = "Dinghy",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["dinghy2"] = {
			["Name"] = "Dinghy 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},	
		["dinghy3"] = {
			["Name"] = "Dinghy 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["dinghy4"] = {
			["Name"] = "Dinghy 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["jetmax"] = {
			["Name"] = "Jetmax",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["marquis"] = {
			["Name"] = "Marquis",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["seashark"] = {
			["Name"] = "Seashark",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["seashark2"] = {
			["Name"] = "Seashark 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["seashark3"] = {
			["Name"] = "Seashark 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["speeder"] = {
			["Name"] = "Speeder",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["speeder2"] = {
			["Name"] = "Speeder 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["squalo"] = {
			["Name"] = "Squalo",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["submersible"] = {
			["Name"] = "Submersible",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["submersible2"] = {
			["Name"] = "Submersible 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["suntrap"] = {
			["Name"] = "Suntrap",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["toro"] = {
			["Name"] = "Toro",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["toro2"] = {
			["Name"] = "Toro 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["tropic"] = {
			["Name"] = "Tropic",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["tropic2"] = {
			["Name"] = "Tropic 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["tug"] = {
			["Name"] = "Tug",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["avisa"] = {
			["Name"] = "Avisa",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["dinghy5"] = {
			["Name"] = "Dinghy 5",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["kosatka"] = {
			["Name"] = "Kosatka",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["longfin"] = {
			["Name"] = "Longfin",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["patrolboat"] = {
			["Name"] = "Patrolboat",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
	
	-- Commercials
		["benson"] = {
			["Name"] = "Benson",
			["Weight"] = 160,
			["Price"] = 100000,
			["Mode"] = "Rental",
			["Gemstone"] = 5000,
			["Class"] = "Caminhões"
		},
		["biff"] = {
			["Name"] = "Biff",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["cerberus"] = {
			["Name"] = "Cerberus",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["cerberus2"] = {
			["Name"] = "Cerberus 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["cerberus3"] = {
			["Name"] = "Cerberus 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["hauler"] = {
			["Name"] = "Hauler",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["hauler2"] = {
			["Name"] = "Hauler 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["mule"] = {
			["Name"] = "Mule",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["mule2"] = {
			["Name"] = "Mule 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["mule3"] = {
			["Name"] = "Mule 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["mule4"] = {
			["Name"] = "Mule 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["packer"] = {
			["Name"] = "Packer",
			["Weight"] = 0,
			["Price"] = 500,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["phantom"] = {
			["Name"] = "Phantom",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["phantom2"] = {
			["Name"] = "Phantom 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["phantom3"] = {
			["Name"] = "Phantom 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["pounder"] = {
			["Name"] = "Pounder",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["pounder2"] = {
			["Name"] = "Pounder 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["stockade"] = {
			["Name"] = "Stockade",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["stockade3"] = {
			["Name"] = "Stockade 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
		["terbyte"] = {
			["Name"] = "Terbyte",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Caminhões"
		},
	
	-- Compacts
		["asbo"] = {
			["Name"] = "Asbo",
			["Weight"] = 20,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["blista"] = {
			["Name"] = "Blista",
			["Weight"] = 20,
			["Price"] = 40000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["brioso"] = {
			["Name"] = "Brioso",
			["Weight"] = 20,
			["Price"] = 30000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["club"] = {
			["Name"] = "Club",
			["Weight"] = 20,
			["Price"] = 65000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["dilettante"] = {
			["Name"] = "Dilettante",
			["Weight"] = 30,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["dilettante2"] = {
			["Name"] = "Dilettante 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["kanjo"] = {
			["Name"] = "Kanjo",
			["Weight"] = 30,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["issi2"] = {
			["Name"] = "Issi 2",
			["Weight"] = 25,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["issi3"] = {
			["Name"] = "Issi 3",
			["Weight"] = 35,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["issi4"] = {
			["Name"] = "Issi 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["issi5"] = {
			["Name"] = "Issi 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["issi6"] = {
			["Name"] = "Issi 6",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["panto"] = {
			["Name"] = "Panto",
			["Weight"] = 20,
			["Price"] = 15000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["prairie"] = {
			["Name"] = "Prairie",
			["Weight"] = 15,
			["Price"] = 15000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["rhapsody"] = {
			["Name"] = "Rhapsody",
			["Weight"] = 15,
			["Price"] = 10000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["brioso2"] = {
			["Name"] = "Brioso 2",
			["Weight"] = 20,
			["Price"] = 40000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["weevil"] = {
			["Name"] = "Weevil",
			["Weight"] = 35,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
	
	-- Coupes
		["cogcabrio"] = {
			["Name"] = "Cogcabrio",
			["Weight"] = 30,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["exemplar"] = {
			["Name"] = "Exemplar",
			["Weight"] = 20,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["f620"] = {
			["Name"] = "F620",
			["Weight"] = 30,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["felon"] = {
			["Name"] = "Felon",
			["Weight"] = 30,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["felon2"] = {
			["Name"] = "Felon 2",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["jackal"] = {
			["Name"] = "Jackal",
			["Weight"] = 30,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["oracle"] = {
			["Name"] = "Oracle",
			["Weight"] = 30,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["oracle2"] = {
			["Name"] = "Oracle 2",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["sentinel"] = {
			["Name"] = "Sentinel",
			["Weight"] = 30,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["sentinel2"] = {
			["Name"] = "Sentinel 2",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["windsor"] = {
			["Name"] = "Windsor",
			["Weight"] = 30,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["windsor2"] = {
			["Name"] = "Windsor 2",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["zion"] = {
			["Name"] = "Zion",
			["Weight"] = 30,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["zion2"] = {
			["Name"] = "Zion 2",
			["Weight"] = 35,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
		["previon"] = {
			["Name"] = "Previon",
			["Weight"] = 30,
			["Price"] = 170000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Cupês"
		},
	
	-- Cycles
		["bmx"] = {
			["Name"] = "Bmx",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},	
		["cruiser"] = {
			["Name"] = "Cruiser",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},
		["fixter"] = {
			["Name"] = "Fixter",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},
		["scorcher"] = {
			["Name"] = "Scorcher",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},
		["tribike"] = {
			["Name"] = "Tribike",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},
		["tribike2"] = {
			["Name"] = "Tribike 2",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},
		["tribike3"] = {
			["Name"] = "Tribike 3",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Bicicletas"
		},
	
	-- Emergency
		["ambulance"] = {
			["Name"] = "Ambulance",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["fbi"] = {
			["Name"] = "Fbi",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["fbi2"] = {
			["Name"] = "Fbi 2",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["firetruk"] = {
			["Name"] = "Firetruk",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},	
		["lguard"] = {
			["Name"] = "Lguard",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["pbus"] = {
			["Name"] = "Pbus",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["police"] = {
			["Name"] = "Police",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["police2"] = {
			["Name"] = "Police 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["police3"] = {
			["Name"] = "Police 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["police4"] = {
			["Name"] = "Police 4",
			["Weight"] = 20,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["policeb"] = {
			["Name"] = "Harley FLH1200",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["polmav"] = {
			["Name"] = "Polmav",
			["Weight"] = 40,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["policeold1"] = {
			["Name"] = "Policeold 1",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["policeold2"] = {
			["Name"] = "Policeold 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["policet"] = {
			["Name"] = "Police T",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["pranger"] = {
			["Name"] = "Pranger",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["predator"] = {
			["Name"] = "Predator",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["riot"] = {
			["Name"] = "Riot",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["riot2"] = {
			["Name"] = "Riot 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sheriff"] = {
			["Name"] = "Sheriff",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sheriff2"] = {
			["Name"] = "Sheriff 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
	-- Helicopters
		["akula"] = {
			["Name"] = "Akula",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["annihilator"] = {
			["Name"] = "Annihilator",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["buzzard"] = {
			["Name"] = "Buzzard",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["buzzard2"] = {
			["Name"] = "Buzzard 2",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["cargobob"] = {
			["Name"] = "Cargobob",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["cargobob2"] = {
			["Name"] = "Cargobob 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["cargobob3"] = {
			["Name"] = "Cargobob 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["cargobob4"] = {
			["Name"] = "Cargobob 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["frogger"] = {
			["Name"] = "Frogger",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["frogger2"] = {
			["Name"] = "Frogger 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["havok"] = {
			["Name"] = "Havok",
			["Weight"] = 100,
			["Price"] = 262500,
			["Mode"] = "Work",
			["Gemstone"] = 7500,
			["Class"] = "Helicópteros"
		},
		["hunter"] = {
			["Name"] = "Hunter",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["maverick"] = {
			["Name"] = "Maverick",
			["Weight"] = 100,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["savage"] = {
			["Name"] = "Savage",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["seasparrow"] = {
			["Name"] = "Seasparrow",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["skylift"] = {
			["Name"] = "Skylift",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["supervolito"] = {
			["Name"] = "Supervolito",
			["Weight"] = 100,
			["Price"] = 437500,
			["Mode"] = "Work",
			["Gemstone"] = 12500,
			["Class"] = "Helicópteros"
		},
		["supervolito2"] = {
			["Name"] = "Supervolito 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["swift"] = {
			["Name"] = "Swift",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["swift2"] = {
			["Name"] = "Swift 2",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["valkyrie"] = {
			["Name"] = "Valkyrie",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["valkyrie2"] = {
			["Name"] = "Valkyrie 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["volatus"] = {
			["Name"] = "Volatus",
			["Weight"] = 100,
			["Price"] = 437500,
			["Mode"] = "Work",
			["Gemstone"] = 12500,
			["Class"] = "Helicópteros"
		},
		["annihilator2"] = {
			["Name"] = "Annihilator 2",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["seasparrow2"] = {
			["Name"] = "Seasparrow 2",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
		["seasparrow3"] = {
			["Name"] = "Seasparrow 3",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Helicópteros"
		},
	
	-- Industrial	
		["bulldozer"] = {
			["Name"] = "Bulldozer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["cutter"] = {
			["Name"] = "Cutter",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["dump"] = {
			["Name"] = "Dump",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["flatbed"] = {
			["Name"] = "Flatbed",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["guardian"] = {
			["Name"] = "Guardian",
			["Weight"] = 50,
			["Price"] = 160000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["handler"] = {
			["Name"] = "Handler",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["mixer"] = {
			["Name"] = "Mixer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["mixer2"] = {
			["Name"] = "Mixer 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["rubble"] = {
			["Name"] = "Rubble",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["tiptruck"] = {
			["Name"] = "Tiptruck",
			["Weight"] = 80,
			["Price"] = 500,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
		["tiptruck2"] = {
			["Name"] = "Tiptruck 2",
			["Weight"] = 160,
			["Price"] = 5000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Industriais"
		},
	
	-- Military
		["apc"] = {
			["Name"] = "Apc",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["barracks"] = {
			["Name"] = "Barracks",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["barracks2"] = {
			["Name"] = "Barracks 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["barracks3"] = {
			["Name"] = "Barracks 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["barrage"] = {
			["Name"] = "Barrage",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["chernobog"] = {
			["Name"] = "Chernobog",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["crusader"] = {
			["Name"] = "Crusader",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["halftrack"] = {
			["Name"] = "Halftrack",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["khanjali"] = {
			["Name"] = "Khanjali",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["minitank"] = {
			["Name"] = "Minitank",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["rhino"] = {
			["Name"] = "Rhino",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["scarab"] = {
			["Name"] = "Scarab",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["scarab2"] = {
			["Name"] = "Scarab 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["scarab3"] = {
			["Name"] = "Scarab 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["thruster"] = {
			["Name"] = "Thruster",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["trailersmall2"] = {
			["Name"] = "Trailersmall 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["vetir"] = {
			["Name"] = "Vetir",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
	
	-- Motorcycles
		["akuma"] = {
			["Name"] = "Akuma",
			["Weight"] = 20,
			["Price"] = 240000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["avarus"] = {
			["Name"] = "Avarus",
			["Weight"] = 20,
			["Price"] = 5000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["bagger"] = {
			["Name"] = "Bagger",
			["Weight"] = 20,
			["Price"] = 160000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["bati"] = {
			["Name"] = "Bati",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["bati2"] = {
			["Name"] = "Bati 2",
			["Weight"] = 20,
			["Price"] = 240000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["bf400"] = {
			["Name"] = "Bf400",
			["Weight"] = 20,
			["Price"] = 200000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["carbonrs"] = {
			["Name"] = "Carbon RS",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["chimera"] = {
			["Name"] = "Chimera",
			["Weight"] = 20,
			["Price"] = 130000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["cliffhanger"] = {
			["Name"] = "Cliffhanger",
			["Weight"] = 20,
			["Price"] = 200000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["daemon"] = {
			["Name"] = "Daemon",
			["Weight"] = 20,
			["Price"] = 140000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["daemon2"] = {
			["Name"] = "Daemon 2",
			["Weight"] = 20,
			["Price"] = 160000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["defiler"] = {
			["Name"] = "Defiler",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["deathbike"] = {
			["Name"] = "Deathbike",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["deathbike2"] = {
			["Name"] = "Deathbike 2",
			["Weight"] = 20,
			["Price"] = 65000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["deathbike3"] = {
			["Name"] = "Deathbike 3",
			["Weight"] = 20,
			["Price"] = 65000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["diablous"] = {
			["Name"] = "Diablous",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["diablous2"] = {
			["Name"] = "Diablous 2",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["double"] = {
			["Name"] = "Double",
			["Weight"] = 20,
			["Price"] = 200000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["enduro"] = {
			["Name"] = "Enduro",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["esskey"] = {
			["Name"] = "Esskey",
			["Weight"] = 20,
			["Price"] = 160000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["faggio"] = {
			["Name"] = "Faggio",
			["Weight"] = 10,
			["Price"] = 2000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["faggio2"] = {
			["Name"] = "Faggio 2",
			["Weight"] = 10,
			["Price"] = 2000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["faggio3"] = {
			["Name"] = "Faggio 3",
			["Weight"] = 10,
			["Price"] = 2000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["fcr"] = {
			["Name"] = "Fcr",
			["Weight"] = 20,
			["Price"] = 160000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["fcr2"] = {
			["Name"] = "Fcr 2",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["gargoyle"] = {
			["Name"] = "Gargoyle",
			["Weight"] = 20,
			["Price"] = 230000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["hakuchou"] = {
			["Name"] = "Hakuchou",
			["Weight"] = 20,
			["Price"] = 240000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["hakuchou2"] = {
			["Name"] = "Hakuchou 2",
			["Weight"] = 20,
			["Price"] = 270000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["hexer"] = {
			["Name"] = "Hexer",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["innovation"] = {
			["Name"] = "Innovation",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["lectro"] = {
			["Name"] = "Lectro",
			["Weight"] = 20,
			["Price"] = 5000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["manchez"] = {
			["Name"] = "Manchez",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["manchez3"] = {
			["Name"] = "manchez3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["nemesis"] = {
			["Name"] = "Nemesis",
			["Weight"] = 20,
			["Price"] = 140000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["nightblade"] = {
			["Name"] = "Nightblade",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["oppressor"] = {
			["Name"] = "Oppressor",
			["Weight"] = 20,
			["Price"] = 130000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["oppressor2"] = {
			["Name"] = "Oppressor 2",
			["Weight"] = 20,
			["Price"] = 130000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["pcj"] = {
			["Name"] = "Pcj",
			["Weight"] = 20,
			["Price"] = 100000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["powersurge"] = {
			["Name"] = "powersurge",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["ratbike"] = {
			["Name"] = "Ratbike",
			["Weight"] = 20,
			["Price"] = 110000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["ruffian"] = {
			["Name"] = "Ruffian",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["rrocket"] = {
			["Name"] = "Rrocket",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["sanchez"] = {
			["Name"] = "Sanchez",
			["Weight"] = 15,
			["Price"] = 140000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["sanchez2"] = {
			["Name"] = "Sanchez 2",
			["Weight"] = 15,
			["Price"] = 150000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["sanctus"] = {
			["Name"] = "Sanctus",
			["Weight"] = 20,
			["Price"] = 190000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["shotaro"] = {
			["Name"] = "Shotaro",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["sovereign"] = {
			["Name"] = "Sovereign",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["stryder"] = {
			["Name"] = "Stryder",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["thrust"] = {
			["Name"] = "Thrust",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["vader"] = {
			["Name"] = "Vader",
			["Weight"] = 20,
			["Price"] = 160000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["vindicator"] = {
			["Name"] = "Vindicator",
			["Weight"] = 20,
			["Price"] = 160000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["vortex"] = {
			["Name"] = "Vortex",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["wolfsbane"] = {
			["Name"] = "Wolfsbane",
			["Weight"] = 20,
			["Price"] = 100000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["zombiea"] = {
			["Name"] = "Zombie A",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["zombieb"] = {
			["Name"] = "Zombie B",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = "Bikes",
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
		["manchez2"] = {
			["Name"] = "Manchez 2",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Motocicletas"
		},
	
	-- Muscle
		["blade"] = {
			["Name"] = "Blade",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["broadway"] = {
			["Name"] = "broadway",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["buccaneer"] = {
			["Name"] = "Buccaneer",
			["Weight"] = 30,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["buccaneer2"] = {
			["Name"] = "Buccaneer 2",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["chino"] = {
			["Name"] = "Chino",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["chino2"] = {
			["Name"] = "Chino 2",
			["Weight"] = 45,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["clique"] = {
			["Name"] = "Clique",
			["Weight"] = 35,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["coquette3"] = {
			["Name"] = "Coquette 3",
			["Weight"] = 40,
			["Price"] = 160000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["deviant"] = {
			["Name"] = "Deviant",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dominator"] = {
			["Name"] = "Dominator",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dominator2"] = {
			["Name"] = "Dominator 2",
			["Weight"] = 50,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dominator3"] = {
			["Name"] = "Dominator 3",
			["Weight"] = 30,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},	
		["dominator4"] = {
			["Name"] = "Dominator 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dominator5"] = {
			["Name"] = "Dominator 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dominator6"] = {
			["Name"] = "Dominator 6",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dukes"] = {
			["Name"] = "Dukes",
			["Weight"] = 40,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dukes2"] = {
			["Name"] = "Dukes 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dukes3"] = {
			["Name"] = "Dukes 3",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["faction"] = {
			["Name"] = "Faction",
			["Weight"] = 50,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["faction2"] = {
			["Name"] = "Faction 2",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["faction3"] = {
			["Name"] = "Faction 3",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["ellie"] = {
			["Name"] = "Ellie",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["eudora"] = {
			["Name"] = "eudora",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["gauntlet"] = {
			["Name"] = "Gauntlet",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["gauntlet2"] = {
			["Name"] = "Gauntlet 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["gauntlet3"] = {
			["Name"] = "Gauntlet 3",
			["Weight"] = 40,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["gauntlet4"] = {
			["Name"] = "Gauntlet 4",
			["Weight"] = 40,
			["Price"] = 180000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["gauntlet5"] = {
			["Name"] = "Gauntlet 5",
			["Weight"] = 40,
			["Price"] = 180000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["hermes"] = {
			["Name"] = "Hermes",
			["Weight"] = 40,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["hotknife"] = {
			["Name"] = "Hotknife",
			["Weight"] = 30,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["hustler"] = {
			["Name"] = "Hustler",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["impaler"] = {
			["Name"] = "Impaler",
			["Weight"] = 50,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["impaler2"] = {
			["Name"] = "Impaler 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["impaler3"] = {
			["Name"] = "Impaler 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["impaler4"] = {
			["Name"] = "Impaler 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["imperator"] = {
			["Name"] = "Imperator",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["imperator2"] = {
			["Name"] = "Imperator 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["imperator3"] = {
			["Name"] = "Imperator 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["lurcher"] = {
			["Name"] = "Lurcher",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["moonbeam"] = {
			["Name"] = "Moonbeam",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["moonbeam2"] = {
			["Name"] = "Moonbeam 2",
			["Weight"] = 40,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["nightshade"] = {
			["Name"] = "Nightshade",
			["Weight"] = 30,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["peyote2"] = {
			["Name"] = "Peyote 2",
			["Weight"] = 45,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["phoenix"] = {
			["Name"] = "Phoenix",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["picador"] = {
			["Name"] = "Picador",
			["Weight"] = 60,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["ratloader"] = {
			["Name"] = "Ratloader",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["ratloader2"] = {
			["Name"] = "Ratloader 2",
			["Weight"] = 40,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["ruiner"] = {
			["Name"] = "Ruiner",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["ruiner2"] = {
			["Name"] = "Ruiner 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["ruiner3"] = {
			["Name"] = "Ruiner 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["sabregt"] = {
			["Name"] = "Sabre GT",
			["Weight"] = 45,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["sabregt2"] = {
			["Name"] = "Sabregt 2",
			["Weight"] = 50,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["slamvan"] = {
			["Name"] = "Slamvan",
			["Weight"] = 50,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["slamvan2"] = {
			["Name"] = "Slamvan 2",
			["Weight"] = 50,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["slamvan3"] = {
			["Name"] = "Slamvan 3",
			["Weight"] = 40,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["slamvan4"] = {
			["Name"] = "Slamvan 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["slamvan5"] = {
			["Name"] = "Slamvan 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["slamvan6"] = {
			["Name"] = "Slamvan 6",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["stalion"] = {
			["Name"] = "Stalion",
			["Weight"] = 30,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["stalion2"] = {
			["Name"] = "Stalion 2",
			["Weight"] = 30,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["tahoma"] = {
			["Name"] = "tahoma",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["tampa"] = {
			["Name"] = "Tampa",
			["Weight"] = 40,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["tampa3"] = {
			["Name"] = "Tampa 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["tulip"] = {
			["Name"] = "Tulip",
			["Weight"] = 50,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["tulip2"] = {
			["Name"] = "tulip2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["vamos"] = {
			["Name"] = "Vamos",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["vigero"] = {
			["Name"] = "Vigero",
			["Weight"] = 30,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["virgo"] = {
			["Name"] = "Virgo",
			["Weight"] = 25,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["virgo2"] = {
			["Name"] = "Virgo 2",
			["Weight"] = 50,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["virgo3"] = {
			["Name"] = "Virgo 3",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["voodoo"] = {
			["Name"] = "Voodoo",
			["Weight"] = 45,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["voodoo2"] = {
			["Name"] = "Voodoo 2",
			["Weight"] = 25,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["yosemite"] = {
			["Name"] = "Yosemite",
			["Weight"] = 50,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["yosemite2"] = {
			["Name"] = "Yosemite 2",
			["Weight"] = 50,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["yosemite3"] = {
			["Name"] = "Yosemite 3",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
		["dominator7"] = {
			["Name"] = "Dominator 7",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Muscles"
		},
	
	-- Off-Road
		["bfinjection"] = {
			["Name"] = "Bfinjection",
			["Weight"] = 20,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["bifta"] = {
			["Name"] = "Bifta",
			["Weight"] = 20,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["blazer"] = {
			["Name"] = "Blazer",
			["Weight"] = 10,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["blazer2"] = {
			["Name"] = "Blazer 2",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["blazer3"] = {
			["Name"] = "Blazer 3",
			["Weight"] = 10,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["blazer4"] = {
			["Name"] = "Blazer 4",
			["Weight"] = 10,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["blazer5"] = {
			["Name"] = "Blazer 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["bodhi2"] = {
			["Name"] = "Bodhi 2",
			["Weight"] = 30,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["brawler"] = {
			["Name"] = "Brawler",
			["Weight"] = 40,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["bruiser"] = {
			["Name"] = "Bruiser",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["bruiser2"] = {
			["Name"] = "Bruiser 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["bruiser3"] = {
			["Name"] = "Bruiser 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["brutus"] = {
			["Name"] = "Brutus",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["brutus2"] = {
			["Name"] = "Brutus 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["brutus3"] = {
			["Name"] = "Brutus 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["caracara"] = {
			["Name"] = "Caracara",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["caracara2"] = {
			["Name"] = "Caracara 2",
			["Weight"] = 50,
			["Price"] = 180000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dloader"] = {
			["Name"] = "Dloader",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dubsta3"] = {
			["Name"] = "Dubsta 3",
			["Weight"] = 55,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dune"] = {
			["Name"] = "Dune",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dune2"] = {
			["Name"] = "Dune 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dune3"] = {
			["Name"] = "Dune 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dune4"] = {
			["Name"] = "Dune 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["dune5"] = {
			["Name"] = "Dune 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["everon"] = {
			["Name"] = "Everon",
			["Weight"] = 50,
			["Price"] = 180000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["freecrawler"] = {
			["Name"] = "Freecrawler",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["hellion"] = {
			["Name"] = "Hellion",
			["Weight"] = 50,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["insurgent"] = {
			["Name"] = "Insurgent",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["insurgent2"] = {
			["Name"] = "Insurgent 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["insurgent3"] = {
			["Name"] = "Insurgent 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["kalahari"] = {
			["Name"] = "Kalahari",
			["Weight"] = 30,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["kamacho"] = {
			["Name"] = "Kamacho",
			["Weight"] = 50,
			["Price"] = 300000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["marshall"] = {
			["Name"] = "Marshall",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["mesa3"] = {
			["Name"] = "Mesa 3",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["monster"] = {
			["Name"] = "Monster",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["monster3"] = {
			["Name"] = "Monster 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["monster4"] = {
			["Name"] = "Monster 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["monster5"] = {
			["Name"] = "Monster 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["menacer"] = {
			["Name"] = "Menacer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["outlaw"] = {
			["Name"] = "Outlaw",
			["Weight"] = 20,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["nightshark"] = {
			["Name"] = "Nightshark",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},	
		["rancherxl"] = {
			["Name"] = "Rancher XL",
			["Weight"] = 40,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["rancherxl2"] = {
			["Name"] = "Rancher XL2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["rebel"] = {
			["Name"] = "Rebel",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["rebel2"] = {
			["Name"] = "Rebel 2",
			["Weight"] = 45,
			["Price"] = 85000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["rcbandito"] = {
			["Name"] = "RC Bandito",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["riata"] = {
			["Name"] = "Riata",
			["Weight"] = 45,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["sandking"] = {
			["Name"] = "Sandking",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["sandking2"] = {
			["Name"] = "Sandking 2",
			["Weight"] = 55,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["technical"] = {
			["Name"] = "Technical",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["technical2"] = {
			["Name"] = "Technical 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["technical3"] = {
			["Name"] = "Technical 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["trophytruck"] = {
			["Name"] = "Trophytruck",
			["Weight"] = 20,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["trophytruck2"] = {
			["Name"] = "Trophytruck 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["vagrant"] = {
			["Name"] = "Vagrant",
			["Weight"] = 30,
			["Price"] = 210000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["zhaba"] = {
			["Name"] = "Zhaba",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["verus"] = {
			["Name"] = "Verus",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
		["winky"] = {
			["Name"] = "Winky",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Off-Roads"
		},
	-- Open Wheel
		["formula"] = {
			["Name"] = "Formula",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Formula 1"
		},
		["formula2"] = {
			["Name"] = "Formula 2",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Formula 1"
		},
		["openwheel1"] = {
			["Name"] = "Openwheel 1",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Formula 1"
		},
		["openwheel2"] = {
			["Name"] = "Openwheel 2",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Formula 1"
		},
	
	-- Planes
		["alphaz1"] = {
			["Name"] = "Alphaz 1",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["avenger"] = {
			["Name"] = "Avenger",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["avenger2"] = {
			["Name"] = "Avenger 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["besra"] = {
			["Name"] = "Besra",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["blimp"] = {
			["Name"] = "Blimp",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["blimp2"] = {
			["Name"] = "Blimp 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["blimp3"] = {
			["Name"] = "Blimp 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["bombushka"] = {
			["Name"] = "Bombushka",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["cargoplane"] = {
			["Name"] = "Cargoplane",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["cargoplane2"] = {
			["Name"] = "cargoplane2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["cuban800"] = {
			["Name"] = "Cuban800",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["dodo"] = {
			["Name"] = "Dodo",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["duster"] = {
			["Name"] = "Duster",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["howard"] = {
			["Name"] = "Howard",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["hydra"] = {
			["Name"] = "Hydra",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["jet"] = {
			["Name"] = "Jet",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["lazer"] = {
			["Name"] = "Lazer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["luxor"] = {
			["Name"] = "Luxor",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["luxor2"] = {
			["Name"] = "Luxor 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["mammatus"] = {
			["Name"] = "Mammatus",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["microlight"] = {
			["Name"] = "Microlight",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["miljet"] = {
			["Name"] = "Miljet",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["mogul"] = {
			["Name"] = "Mogul",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["molotok"] = {
			["Name"] = "Molotok",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["nimbus"] = {
			["Name"] = "Nimbus",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["nokota"] = {
			["Name"] = "Nokota",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["pyro"] = {
			["Name"] = "Pyro",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["rogue"] = {
			["Name"] = "Rogue",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["seabreeze"] = {
			["Name"] = "Seabreeze",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["shamal"] = {
			["Name"] = "Shamal",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["starling"] = {
			["Name"] = "Starling",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["strikeforce"] = {
			["Name"] = "Strikeforce",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["stunt"] = {
			["Name"] = "Stunt",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["titan"] = {
			["Name"] = "Titan",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["tula"] = {
			["Name"] = "Tula",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["velum"] = {
			["Name"] = "Velum",
			["Weight"] = 0,
			["Price"] = 2000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["velum2"] = {
			["Name"] = "Velum 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["vestra"] = {
			["Name"] = "Vestra",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["volatol"] = {
			["Name"] = "Volatol",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
		["alkonost"] = {
			["Name"] = "Alkonost",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Aviões"
		},
	
	-- SUVs
		["baller"] = {
			["Name"] = "Baller",
			["Weight"] = 50,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["baller2"] = {
			["Name"] = "Baller 2",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["baller3"] = {
			["Name"] = "Baller 3",
			["Weight"] = 50,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["baller4"] = {
			["Name"] = "Baller 4",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["baller5"] = {
			["Name"] = "Baller 5",
			["Weight"] = 50,
			["Price"] = 400000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["baller6"] = {
			["Name"] = "Baller 6",
			["Weight"] = 50,
			["Price"] = 410000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["bjxl"] = {
			["Name"] = "Bjxl",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["cavalcade"] = {
			["Name"] = "Cavalcade",
			["Weight"] = 30,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["cavalcade2"] = {
			["Name"] = "Cavalcade 2",
			["Weight"] = 45,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["contender"] = {
			["Name"] = "Contender",
			["Weight"] = 40,
			["Price"] = 180000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["dubsta"] = {
			["Name"] = "Dubsta",
			["Weight"] = 50,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["dubsta2"] = {
			["Name"] = "Dubsta 2",
			["Weight"] = 55,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["fq2"] = {
			["Name"] = "Fq2",
			["Weight"] = 40,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["granger"] = {
			["Name"] = "Granger",
			["Weight"] = 65,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["gresley"] = {
			["Name"] = "Gresley",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["habanero"] = {
			["Name"] = "Habanero",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["huntley"] = {
			["Name"] = "Huntley",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["issi8"] = {
			["Name"] = "issi8",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["landstalker"] = {
			["Name"] = "Landstalker",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["landstalker2"] = {
			["Name"] = "Landstalker 2",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["mesa"] = {
			["Name"] = "Mesa",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["mesa2"] = {
			["Name"] = "Mesa 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["novak"] = {
			["Name"] = "Novak",
			["Weight"] = 40,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["patriot"] = {
			["Name"] = "Patriot",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["patriot2"] = {
			["Name"] = "Patriot 2",
			["Weight"] = 50,
			["Price"] = 170000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["radi"] = {
			["Name"] = "Radi",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["rebla"] = {
			["Name"] = "Rebla",
			["Weight"] = 40,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["rocoto"] = {
			["Name"] = "Rocoto",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["seminole"] = {
			["Name"] = "Seminole",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["seminole2"] = {
			["Name"] = "Seminole 2",
			["Weight"] = 45,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["serrano"] = {
			["Name"] = "Serrano",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["toros"] = {
			["Name"] = "Toros",
			["Weight"] = 50,
			["Price"] = 160000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["xls"] = {
			["Name"] = "Xls",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["xls2"] = {
			["Name"] = "Xls 2",
			["Weight"] = 50,
			["Price"] = 410000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
		["squaddie"] = {
			["Name"] = "Squaddie",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "SUVs"
		},
	
	-- Sedans
		["asea"] = {
			["Name"] = "Asea",
			["Weight"] = 30,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["asea2"] = {
			["Name"] = "Asea 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["asterope"] = {
			["Name"] = "Asterope",
			["Weight"] = 20,
			["Price"] = 30000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["cog55"] = {
			["Name"] = "Cog55",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["cog552"] = {
			["Name"] = "Cog55 2",
			["Weight"] = 50,
			["Price"] = 410000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["cognoscenti"] = {
			["Name"] = "Cognoscenti",
			["Weight"] = 50,
			["Price"] = 130000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["cognoscenti2"] = {
			["Name"] = "Cognoscenti 2",
			["Weight"] = 50,
			["Price"] = 400000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["emperor"] = {
			["Name"] = "Emperor",
			["Weight"] = 25,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["emperor2"] = {
			["Name"] = "Emperor 2",
			["Weight"] = 20,
			["Price"] = 2000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["emperor3"] = {
			["Name"] = "Emperor 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["fugitive"] = {
			["Name"] = "Fugitive",
			["Weight"] = 60,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["glendale"] = {
			["Name"] = "Glendale",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["glendale2"] = {
			["Name"] = "Glendale 2",
			["Weight"] = 50,
			["Price"] = 5000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["ingot"] = {
			["Name"] = "Ingot",
			["Weight"] = 40,
			["Price"] = 15000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["intruder"] = {
			["Name"] = "Intruder",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["limo2"] = {
			["Name"] = "Limo 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["premier"] = {
			["Name"] = "Premier",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["primo"] = {
			["Name"] = "Primo",
			["Weight"] = 30,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["primo2"] = {
			["Name"] = "Primo 2",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["regina"] = {
			["Name"] = "Regina",
			["Weight"] = 40,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["romero"] = {
			["Name"] = "Romero",
			["Weight"] = 25,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["stafford"] = {
			["Name"] = "Stafford",
			["Weight"] = 40,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["stanier"] = {
			["Name"] = "Stanier",
			["Weight"] = 25,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["stratum"] = {
			["Name"] = "Stratum",
			["Weight"] = 40,
			["Price"] = 40000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["stretch"] = {
			["Name"] = "Stretch",
			["Weight"] = 40,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["superd"] = {
			["Name"] = "Superd",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["surge"] = {
			["Name"] = "Surge",
			["Weight"] = 40,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["tailgater"] = {
			["Name"] = "Tailgater",
			["Weight"] = 40,
			["Price"] = 110000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["warrener"] = {
			["Name"] = "Warrener",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["washington"] = {
			["Name"] = "Washington",
			["Weight"] = 40,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["tailgater2"] = {
			["Name"] = "Tailgater 2",
			["Weight"] = 40,
			["Price"] = 170000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Sedans"
		},
		["airbus"] = {
			["Name"] = "Airbus",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["brickade"] = {
			["Name"] = "Brickade",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["bus"] = {
			["Name"] = "Bus",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["coach"] = {
			["Name"] = "Coach",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["pbus2"] = {
			["Name"] = "Pbus 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["rallytruck"] = {
			["Name"] = "Rally Truck",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["rentalbus"] = {
			["Name"] = "Rental Bus",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["taxi2"] = {
			["Name"] = "Taxi",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["vovotaxi"] = {
			["Name"] = "Taxi",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["tourbus"] = {
			["Name"] = "Tour Bus",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["trash"] = {
			["Name"] = "Trash",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["trash2"] = {
			["Name"] = "Trash 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["wastelander"] = {
			["Name"] = "Wastelander",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
	-- Trailer
		["armytanker"] = {
			["Name"] = "Armytanker",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["armytrailer"] = {
			["Name"] = "Armytrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["armytrailer2"] = {
			["Name"] = "Armytrailer 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["baletrailer"] = {
			["Name"] = "Baletrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["boattrailer"] = {
			["Name"] = "Boattrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["cablecar"] = {
			["Name"] = "Cablecar",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["docktrailer"] = {
			["Name"] = "Docktrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["freighttrailer"] = {
			["Name"] = "Freighttrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["graintrailer"] = {
			["Name"] = "Graintrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["proptrailer"] = {
			["Name"] = "Proptrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["raketrailer"] = {
			["Name"] = "Raketrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["tr2"] = {
			["Name"] = "Tr2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["tr3"] = {
			["Name"] = "Tr3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["tr4"] = {
			["Name"] = "Tr4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trflat"] = {
			["Name"] = "Trflat",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["tvtrailer"] = {
			["Name"] = "Tvtrailer",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["tanker"] = {
			["Name"] = "Tanker",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["tanker2"] = {
			["Name"] = "Tanker 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trailerlarge"] = {
			["Name"] = "Trailerlarge",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trailerlogs"] = {
			["Name"] = "Trailerlogs",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trailers"] = {
			["Name"] = "Trailers",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trailers2"] = {
			["Name"] = "Trailers 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trailers3"] = {
			["Name"] = "Trailers 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
		["trailers4"] = {
			["Name"] = "Trailers 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trailers"
		},
	
	-- Trains
		["freight"] = {
			["Name"] = "Freight",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
		["freightcar"] = {
			["Name"] = "Freightcar",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
		["freightcont1"] = {
			["Name"] = "Freightcont 1",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
		["freightcont2"] = {
			["Name"] = "Freightcont 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
		["freightgrain"] = {
			["Name"] = "Freightgrain",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
		["metrotrain"] = {
			["Name"] = "Metrotrain",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
		["tankercar"] = {
			["Name"] = "Rankercar",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Trens"
		},
	
	-- Utility
		["airtug"] = {
			["Name"] = "Airtug",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["caddy"] = {
			["Name"] = "Caddy",
			["Weight"] = 10,
			["Price"] = 30000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["caddy2"] = {
			["Name"] = "Caddy 2",
			["Weight"] = 10,
			["Price"] = 25000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["caddy3"] = {
			["Name"] = "Caddy 3",
			["Weight"] = 10,
			["Price"] = 20000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["docktug"] = {
			["Name"] = "Docktug",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["forklift"] = {
			["Name"] = "Forklift",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["mower"] = {
			["Name"] = "Mower",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["ripley"] = {
			["Name"] = "Ripley",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["sadler"] = {
			["Name"] = "Sadler",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["sadler2"] = {
			["Name"] = "Sadler 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["scrap"] = {
			["Name"] = "Scrap",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["towtruck"] = {
			["Name"] = "Towtruck",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["towtruck2"] = {
			["Name"] = "Towtruck 2",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["tractor"] = {
			["Name"] = "Tractor",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["tractor2"] = {
			["Name"] = "Tractor 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["tractor3"] = {
			["Name"] = "Tractor 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["utillitruck"] = {
			["Name"] = "Utillitruck",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["utillitruck2"] = {
			["Name"] = "Utillitruck 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["utillitruck3"] = {
			["Name"] = "Utillitruck 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
		["slamtruck"] = {
			["Name"] = "Slamtruck",
			["Weight"] = 20,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Utilitários"
		},
	
	-- Vans
		["bison"] = {
			["Name"] = "Bison",
			["Weight"] = 30,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["bison2"] = {
			["Name"] = "Bison 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["bison3"] = {
			["Name"] = "Bison 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["bobcatxl"] = {
			["Name"] = "Bobcat XL",
			["Weight"] = 45,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["boxville"] = {
			["Name"] = "Boxville",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["boxville2"] = {
			["Name"] = "Boxville 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["boxville3"] = {
			["Name"] = "Boxville 3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["boxville4"] = {
			["Name"] = "Boxville",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["boxville5"] = {
			["Name"] = "Boxville 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["burrito"] = {
			["Name"] = "Burrito",
			["Weight"] = 35,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["burrito2"] = {
			["Name"] = "Burrito 2",
			["Weight"] = 40,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["burrito3"] = {
			["Name"] = "Burrito 3",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["burrito4"] = {
			["Name"] = "Burrito 4",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["burrito5"] = {
			["Name"] = "Burrito 5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["camper"] = {
			["Name"] = "Camper",
			["Weight"] = 50,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["gburrito"] = {
			["Name"] = "Gburrito",
			["Weight"] = 50,
			["Price"] = 100000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["gburrito2"] = {
			["Name"] = "Gburrito 2",
			["Weight"] = 10,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["journey"] = {
			["Name"] = "Journey",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["journey2"] = {
			["Name"] = "journey2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["minivan"] = {
			["Name"] = "Minivan",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["minivan2"] = {
			["Name"] = "Minivan 2",
			["Weight"] = 40,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["paradise"] = {
			["Name"] = "Paradise",
			["Weight"] = 50,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["pony"] = {
			["Name"] = "Pony",
			["Weight"] = 40,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["pony2"] = {
			["Name"] = "Pony 2",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["rumpo"] = {
			["Name"] = "Rumpo",
			["Weight"] = 30,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["rumpo2"] = {
			["Name"] = "Rumpo 2",
			["Weight"] = 40,
			["Price"] = 80000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["rumpo3"] = {
			["Name"] = "Rumpo 3",
			["Weight"] = 50,
			["Price"] = 300000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["speedo"] = {
			["Name"] = "Speedo",
			["Weight"] = 50,
			["Price"] = 70000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["speedo2"] = {
			["Name"] = "Speedo 2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["speedo4"] = {
			["Name"] = "Speedo 4",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["surfer"] = {
			["Name"] = "Surfer",
			["Weight"] = 40,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["surfer2"] = {
			["Name"] = "Surfer 2",
			["Weight"] = 40,
			["Price"] = 40000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["surfer3"] = {
			["Name"] = "surfer3",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["taco"] = {
			["Name"] = "Taco",
			["Weight"] = 15,
			["Price"] = 2000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["youga"] = {
			["Name"] = "Youga",
			["Weight"] = 70,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["youga2"] = {
			["Name"] = "Youga 2",
			["Weight"] = 70,
			["Price"] = 1000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},
		["youga3"] = {
			["Name"] = "Youga 3",
			["Weight"] = 70,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Vans"
		},

	-- Public Service
		["polas350"] = {
			["Name"] = "Polaris 350",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["ambulance2"] = {
			["Name"] = "Ambulância",
			["Weight"] = 20,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["ballerpol"] = {
			["Name"] = "Baller",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["elegy2pol"] = {
			["Name"] = "Elegy 2",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["fugitivepol"] = {
			["Name"] = "Fugitive",
			["Weight"] = 60,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["komodapol"] = {
			["Name"] = "Komoda",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["kurumapol"] = {
			["Name"] = "Kuruma",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["maverick2"] = {
			["Name"] = "Maverick 2",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["nc700pol"] = {
			["Name"] = "Honda NC700",
			["Weight"] = 20,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["oracle2pol"] = {
			["Name"] = "Oracle 2",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["polchall"] = {
			["Name"] = "Dodge Challenger",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["polchar"] = {
			["Name"] = "Dodge Charger",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["explorerpol"] = {
			["Name"] = "Ford Explorer",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["guardianpol"] = {
			["Name"] = "Guardian",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["tauruspol"] = {
			["Name"] = "Ford Taurus",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["tahoepol"] = {
			["Name"] = "Chevrolet Tahoe",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["silveradopol"] = {
			["Name"] = "Chevrolet Silverado",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["police3pol"] = {
			["Name"] = "Police 3",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["policepol"] = {
			["Name"] = "Police",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["policetpol"] = {
			["Name"] = "Police T",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["poltang"] = {
			["Name"] = "Ford Mustang",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["polvic"] = {
			["Name"] = "Crown Victoria",
			["Weight"] = 50,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["r1250pol"] = {
			["Name"] = "BMW R1250",
			["Weight"] = 20,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["schafter2pol"] = {
			["Name"] = "Schafter 2",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["sheriff2pol"] = {
			["Name"] = "Sheriff 2",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["sultanrspol"] = {
			["Name"] = "Sultan RS",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},
		["tailgater2pol"] = {
			["Name"] = "Tailgater 2",
			["Weight"] = 40,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Empregos"
		},	

	-- VIPS
		["opala"] = {
			["Name"] = "Chevrolet Opala Antigo",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["c981"] = {
			["Name"] = "porsche 981",
			["Weight"] = 60,
			["Price"] = 0,
			["Gemstone"] = 40,
			["Mode"] = "Rental",
			["Class"] = "vips"
		},
		["s10hc"] = {
			["Name"] = "S10 HC",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 60,
			["Class"] = "vips"
		},
		["trail21"] = {
			["Name"] = "Trailblazer 2021",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["tritonhpe"] = {
			["Name"] = "Mitsubishi Triton",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 80,
			["Class"] = "vips"
		},
		["unoway"] = {
			["Name"] = "Fiat Uno Paredão",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 25,
			["Class"] = "vips"
		},
		["vwgolf2"] = {
			["Name"] = "Golf Paredão",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 25,
			["Class"] = "vips"
		},
		["2016ranger"] = {
			["Name"] = "Ford Ranger 2016",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 80,
			["Class"] = "vips"
		},
		["amarok"] = {
			["Name"] = "Volkswagen Amarok",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 80,
			["Class"] = "vips"
		},
		["chevette"] = {
			["Name"] = "Chevrolet Chevett",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["civic"] = {
			["Name"] = "Honda Civic 2001",
			["Weight"] = 60,
			["Price"] = 90000,
			["Mode"] = "Rental",
			["Gemstone"] = 15,
			["Class"] = "vips"
		},
		["golg9"] = {
			["Name"] = "Gol G9",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 25,
			["Class"] = "vips"
		},
		["jeep"] = {
			["Name"] = "Jeep",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["evo9"] = {
			["Name"] = "Lancer evo9",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 50,
			["Class"] = "vips"
		},
		["f850"] = {
			["Name"] = "BMW f850",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["landvelar"] = {
			["Name"] = "Landvelar",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 50,
			["Class"] = "vips"
		},
		["nissangtr"] = {
			["Name"] = "Nissan R35",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["x6m"] = {
			["Name"] = "bmw x6m",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["audirs6"] = {
			["Name"] = "Audi rs6",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 60,
			["Class"] = "vips"
		},
		["bmwg07"] = {
			["Name"] = "BMW X7",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["bmwm4gts"] = {
			["Name"] = "BMW M4",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},

		["r1"] = {
			["Name"] = "Yamaha R1",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 50,
			["Class"] = "vips"
		},

		["r6"] = {
			["Name"] = "Yamaha R6",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},

		["gs310"] = {
			["Name"] = "BMW GS310",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},

		["motorizadamoto"] = {
			["Name"] = "Motorizada",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 15,
			["Class"] = "vips"
		},

		["gsxr1000"] = {
			["Name"] = "Suzuki GSX-R1000",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 60,
			["Class"] = "vips"
		},

		["tenere1200"] = {
			["Name"] = "Tenere 1200",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 50,
			["Class"] = "vips"
		},

		["tiger1200"] = {
			["Name"] = "Tiger 1200",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 90,
			["Class"] = "vips"
		},

		["tigerse"] = {
			["Name"] = "Triumph Tiger",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},

		["xj6"] = {
			["Name"] = "XJ6",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 50,
			["Class"] = "vips"
		},
		["jester5"] = {
			["Name"] = "Magnus",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 15,
			["Class"] = "vips"
		},
		["roxanne"] = {
			["Name"] = "Roxanne",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 15,
			["Class"] = "vips"
		},
		["sunrise"] = {
			["Name"] = "Sunrise",
			["Weight"] = 60,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 15,
			["Class"] = "vips"
		},
		["teslamodels"] = {
			["Name"] = "Tesla Model S",
			["Weight"] = 80,
			["Price"] = 0,
			["Mode"] = "Rental",
			["Gemstone"] = 60,
			["Class"] = "vips"
		},
		["22m5"] = {
			["Name"] = "BMW M5",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["69charger"] = {
			["Name"] = "Dodge Charger 1969",
			["Weight"] = 45,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},
		["488misha"] = {
			["Name"] = "Ferrari 488",
			["Weight"] = 30,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["675ltsp"] = {
			["Name"] = "McLaren 675",
			["Weight"] = 30,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["a45amg"] = {
			["Name"] = "Mercedes A45",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},
		["a80"] = {
			["Name"] = "Toyota Supra A80",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["acs8"] = {
			["Name"] = "BMW i8",
			["Weight"] = 40,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["bdragon"] = {
			["Name"] = "Bentley Dragon",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},
		["bmwr"] = {
			["Name"] = "BMW R1100",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["bt62r"] = {
			["Name"] = "Brabham BT62",
			["Weight"] = 30,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["chiron17"] = {
			["Name"] = "Bugatti Chiron",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["cp9a"] = {
			["Name"] = "Mitsubishi Lancer Evo 7",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["dc5"] = {
			["Name"] = "Honda Integra",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},
		["demon"] = {
			["Name"] = "Dodge Challenger STR",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},
		["e36prb"] = {
			["Name"] = "BMW M3 E36",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},
		["evo9"] = {
			["Name"] = "Mitsubishi Lancer Evo 9",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["filthynsx"] = {
			["Name"] = "Honda Acura",
			["Weight"] = 40,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["fk8"] = {
			["Name"] = "Honda Civic Type-R",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["skyliner342"] = {
			["Name"] = "Nissan GTR R34",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 100,
			["Class"] = "vips"
		},
		["gt63"] = {
			["Name"] = "Mercedes GT63",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["gt86"] = {
			["Name"] = "Toyota GT86",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 25,
			["Class"] = "vips"
		},
		["lc500"] = {
			["Name"] = "Lexus LC 500",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 20,
			["Class"] = "vips"
		},
		["lp700"] = {
			["Name"] = "Lamborghini LP 700",
			["Weight"] = 30,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["maj350z"] = {
			["Name"] = "Nissan 350z",
			["Weight"] = 40,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["r1"] = {
			["Name"] = "Yamaha R1",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["s1000rr"] = {
			["Name"] = "BMW S 1000 RR",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["m1000rr"] = {
			["Name"] = "BMW M 1000 RR",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["cb500x"] = {
			["Name"] = "CB 500X",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 25,
			["Class"] = "vips"
		},
		["audirs6"] = {
			["Name"] = "Audi RS6",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 45,
			["Class"] = "vips"
		},
		["r32"] = {
			["Name"] = "Nissan GTR R32",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 40,
			["Class"] = "vips"
		},
		["r35"] = {
			["Name"] = "Nissan GTR R35",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 60,
			["Class"] = "vips"
		},
		["rr14"] = {
			["Name"] = "Range Rover Vogue",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 50,
			["Class"] = "vips"
		},
		["senna"] = {
			["Name"] = "McLaren Senna",
			["Weight"] = 30,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 80,
			["Class"] = "vips"
		},
		["tsgr20"] = {
			["Name"] = "Toyota Supra GR",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 70,
			["Class"] = "vips"
		},
		["zx10"] = {
			["Name"] = "Kawasaki Ninja Zx-10r",
			["Weight"] = 20,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["lancerevolutionx"] = {
			["Name"] = "Lancer Evolution X",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["subaruimpreza"] = {
			["Name"] = "Subaru Impreza",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 35,
			["Class"] = "vips"
		},
		["silvias15"] = {
			["Name"] = "Silvia S15",
			["Weight"] = 50,
			["Price"] = 150000,
			["Mode"] = "Rental",
			["Gemstone"] = 30,
			["Class"] = "vips"
		},

		----------------------------------------
		["bimx"] = {
			["Name"] = "BMX",
			["Weight"] = 0,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["unicycle"] = {
			["Name"] = "Monociclo",
			["Weight"] = 0,
			["Price"] = 10000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["brickade2"] = {
			["Name"] = "brickade2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["boor"] = {
			["Name"] = "boor",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["comet7"] = {
			["Name"] = "Comet 7",
			["Weight"] = 20,
			["Price"] = 300000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["patriot3"] = {
			["Name"] = "Patriot 3",
			["Weight"] = 40,
			["Price"] = 320000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["omnisegt"] = {
			["Name"] = "Omni SE GT",
			["Weight"] = 40,
			["Price"] = 250000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Esportivos"
		},
		["tenf2"] = {
			["Name"] = "Tenf 2",
			["Weight"] = 40,
			["Price"] = 190000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Esportivos"
		},
		["sm722"] = {
			["Name"] = "Mm722",
			["Weight"] = 40,
			["Price"] = 170000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Clássicos"
		},
		["brioso3"] = {
			["Name"] = "Brioso 3",
			["Weight"] = 40,
			["Price"] = 50000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		["lm87"] = {
			["Name"] = "Lm87",
			["Weight"] = 40,
			["Price"] = 170000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Clássicos"
		},
		["iwagen"] = {
			["Name"] = "Iwagen",
			["Weight"] = 40,
			["Price"] = 260000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["jubilee"] = {
			["Name"] = "Jubilee",
			["Weight"] = 40,
			["Price"] = 150000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["reever"] = {
			["Name"] = "Reever",
			["Weight"] = 20,
			["Price"] = 170000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["shinobi"] = {
			["Name"] = "Shinobi",
			["Weight"] = 20,
			["Price"] = 180000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["granger2"] = {
			["Name"] = "Granger 2",
			["Weight"] = 65,
			["Price"] = 200000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["buffalo4"] = {
			["Name"] = "Buffalo 4",
			["Weight"] = 30,
			["Price"] = 250000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Esportivos"
		},
		["vigero2"] = {
			["Name"] = "Vigero 2",
			["Weight"] = 40,
			["Price"] = 200000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Clássicos"
		},
		["sentinel4"] = {
			["Name"] = "Sentinel 4",
			["Weight"] = 40,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Esportivos"
		},
		["ignus"] = {
			["Name"] = "Ignus",
			["Weight"] = 20,
			["Price"] = 250000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["youga4"] = {
			["Name"] = "Youga 4",
			["Weight"] = 70,
			["Price"] = 90000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["zeno"] = {
			["Name"] = "Zeno",
			["Weight"] = 20,
			["Price"] = 250000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["deity"] = {
			["Name"] = "Deity",
			["Weight"] = 40,
			["Price"] = 300000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["kanjosj"] = {
			["Name"] = "Kanjo SJ",
			["Weight"] = 40,
			["Price"] = 60000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		-- ["greenwood"] = {
		-- 	["Name"] = "Greenwood",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 60000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Muscles"
		-- },
		-- ["corsita"] = {
		-- 	["Name"] = "Corsita",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 200000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Clássicos"
		-- },
		["cinquemila"] = {
			["Name"] = "Cinquemila",
			["Weight"] = 30,
			["Price"] = 200000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		-- ["rhinehart"] = {
		-- 	["Name"] = "Rhinehart",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 5000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "SUVs"
		-- },
		-- ["tenf"] = {
		-- 	["Name"] = "Tenf",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 180000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Esportivos"
		-- },
		-- ["postlude"] = {
		-- 	["Name"] = "Postlude",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 60000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Esportivos"
		-- },
		["mule5"] = {
			["Name"] = "Mule 5",
			["Weight"] = 0,
			["Price"] = 1000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["baller7"] = {
			["Name"] = "Baller 7",
			["Weight"] = 50,
			["Price"] = 480000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["conada"] = {
			["Name"] = "Conada",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		["champion"] = {
			["Name"] = "Champion",
			["Weight"] = 20,
			["Price"] = 220000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		-- ["draugur"] = {
		-- 	["Name"] = "Draugur",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 320000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Off-Roads"
		-- },
		["astron"] = {
			["Name"] = "Astron",
			["Weight"] = 40,
			["Price"] = 220000,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Embarcações"
		},
		-- ["ruiner4"] = {
		-- 	["Name"] = "Ruiner4",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 110000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Muscles"
		-- },
		["weevil2"] = {
			["Name"] = "weevil2",
			["Weight"] = 40,
			["Price"] = 140000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Compactos"
		},
		-- ["torero2"] = {
		-- 	["Name"] = "Torero 2",
		-- 	["Weight"] = 40,
		-- 	["Price"] = 200000,
		-- 	["Mode"] = "Cars",
		-- 	["Gemstone"] = 0,
		-- 	["Class"] = "Clássicos"
		-- },	
		["trailblazerpc"] = {
			["Name"] = "trailblazerpc",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["as350pm"] = {
			["Name"] = "as350samu",
			["Weight"] = 100,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["f850pm"] = {
			["Name"] = "f850pm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["xre300pm"] = {
			["Name"] = "xre300pm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["golpm"] = {
			["Name"] = "Gol PM",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["spin22pm"] = {
			["Name"] = "spin22pm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["dusterpm"] = {
			["Name"] = "dusterpm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["broncopm"] = {
			["Name"] = "broncopm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["cronospm"] = {
			["Name"] = "cronospm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["corollapm"] = {
			["Name"] = "corollapm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail23pmsp"] = {
			["Name"] = "trail23pmsp",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["corollacrosspm"] = {
			["Name"] = "corollacrosspm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trailblazerrota"] = {
			["Name"] = "trailblazerrota",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},


		["as350samu"] = {
			["Name"] = "as350samu",
			["Weight"] = 100,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["WRsprinter22"] = {
			["Name"] = "sprinter samu",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["WRsw4"] = {
			["Name"] = "sw4 samu",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},

		["trail22bomb2"] = {
			["Name"] = "trail22bomb2",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sw4grau1"] = {
			["Name"] = "sw4grau1",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["samurev"] = {
			["Name"] = "samurev",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sprinterbomb"] = {
			["Name"] = "samurev",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["renaultcbm"] = {
			["Name"] = "renaultcbm",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["scaniabomb"] = {
			["Name"] = "scaniabomb",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["enladder"] = {
			["Name"] = "enladder",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["r1200bomb"] = {
			["Name"] = "r1200bomb",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["xt660cbm"] = {
			["Name"] = "xt660cbm",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},

		
		

	    ["vtrail21"] = {
			["Name"] = "trail pc descaracterizada",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail21dope2"] = {
			["Name"] = "trailblazer dope 21",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail20pcesp1"] = {
			["Name"] = "trailblazer pcesp 20",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["s10iml"] = {
			["Name"] = "S10 IML",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["s10hccivil"] = {
			["Name"] = "S10 High Country",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["rumpobox"] = {
			["Name"] = "Caminhão apreensão",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["riot4"] = {
			["Name"] = "Brindado Operações",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["onipc1"] = {
			["Name"] = "Onibus pcesp",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["as350b3"] = {
			["Name"] = "Helicoptero",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},

		["wrr1200prf"] = {
			["Name"] = "wrr1200prf",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail21federalg2"] = {
			["Name"] = "trail21federalg2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["prfcamaro19"] = {
			["Name"] = "prfcamaro19",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["l200prf"] = {
			["Name"] = "l200prf",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["cruze21prf"] = {
			["Name"] = "cruze21prf",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["as350prf"] = {
			["Name"] = "Helicoptero",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},

		["flatbed3"] = {
			["Name"] = "Guincho",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["lander"] = {
			["Name"] = "Lander",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["s10pm"] = {
			["Name"] = "s10",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["sw4pm"] = {
			["Name"] = "sw4 2013",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["trail15pm"] = {
			["Name"] = "trailblazer 2015",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["trail18pm2"] = {
			["Name"] = "trailblazer 2018",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["trail2022pm"] = {
			["Name"] = "trailblazer 2022",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["trailpm20"] = {
			["Name"] = "trailblazer 2020",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
	
		["as350b3"] = {
			["Name"] = "Helicoptero",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
        ["rmodpassat"] = {
			["Name"] = "PassatNew",
			["Weight"] = 70,
			["Price"] = 150000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Nacional"	
		},	
		["xt2017"] = {
			["Name"] = "XT 2017",
			["Weight"] = 60,
			["Price"] = 20000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["jettagli"] = {
			["Name"] = "Volkswagen Jetta GLI",
			["Weight"] = 60,
			["Price"] = 85000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["saveiro"] = {
			["Name"] = "Saveiro CL 1.6",
			["Weight"] = 60,
			["Price"] = 40000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["tcross"] = {
			["Name"] = "Volkswagen T-Cross",
			["Weight"] = 60,
			["Price"] = 95000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["uno"] = {
			["Name"] = "Fiat Uno 1.3",
			["Weight"] = 60,
			["Price"] = 20000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["up"] = {
			["Name"] = "Volkswagen Up",
			["Weight"] = 60,
			["Price"] = 70000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["vectra"] = {
			["Name"] = "Chevrolet Vectra",
			["Weight"] = 60,
			["Price"] = 35000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["vwgol"] = {
			["Name"] = "Gol Quadrado",
			["Weight"] = 60,
			["Price"] = 26000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["brasilia"] = {
			["Name"] = "Volkswagen Brasília",
			["Weight"] = 60,
			["Price"] = 30000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["checelta"] = {
			["Name"] = "Chevrolet Celta",
			["Weight"] = 60,
			["Price"] = 30000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["civic2010"] = {
			["Name"] = "Honda Civic 2010",
			["Weight"] = 60,
			["Price"] = 40000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["civicsi"] = {
			["Name"] = "Honda Civic",
			["Weight"] = 60,
			["Price"] = 150000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["cruze"] = {
			["Name"] = "Chevrolet Cruze",
			["Weight"] = 60,
			["Price"] = 120000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["focusrs"] = {
			["Name"] = "Ford Focus RS",
			["Weight"] = 60,
			["Price"] = 100000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["gcmcity14"] = {
			["Name"] = "Honda City 2014",
			["Weight"] = 60,
			["Price"] = 60000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["gcmsanderogt"] = {
			["Name"] = "Renault Sandero",
			["Weight"] = 60,
			["Price"] = 35000,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["hondacivic20"] = {
			["Name"] = "Honda civic 2020",
			["Weight"] = 60,
			["Price"] = 190000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["golfgti"] = {
			["Name"] = "Golf GTI",
			["Weight"] = 60,
			["Price"] = 200000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["q820"] = {
			["Name"] = "Audi Q8",
			["Weight"] = 60,
			["Price"] = 300000,
			["Gemstone"] = 0,
			["Mode"] = "Cars",
			["Class"] = "Nacional"
		},
		["pop110i"] = {
			["Name"] = "Honda Pop 110i",
			["Weight"] = 60,
			["Price"] = 10000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["cg160"] = {
			["Name"] = "CG 160",
			["Weight"] = 60,
			["Price"] = 15000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["titan2022"] = {
			["Name"] = "Titan 2022",
			["Weight"] = 60,
			["Price"] = 25000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["hornet2014"] = {
			["Name"] = "Hornet 2014",
			["Weight"] = 60,
			["Price"] = 120000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["2016ranger"] = {
			["Name"] = "2016ranger",
			["Weight"] = 60,
			["Price"] = 180000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["amarok"] = {
			["Name"] = "amarok",
			["Weight"] = 60,
			["Price"] = 170000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["golg9"] = {
			["Name"] = "golg9",
			["Weight"] = 60,
			["Price"] = 30000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["jeep"] = {
			["Name"] = "jeep",
			["Weight"] = 60,
			["Price"] = 90000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["opala"] = {
			["Name"] = "opala",
			["Weight"] = 60,
			["Price"] = 85000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["s10hc"] = {
			["Name"] = "s10hc",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["tritonhpe"] = {
			["Name"] = "tritonhpe",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["tigerse"] = {
			["Name"] = "tigerse",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["jeep"] = {
			["Name"] = "jeep",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},
		["jeep"] = {
			["Name"] = "jeep",
			["Weight"] = 60,
			["Price"] = 150000,
			["Mode"] = "Cars",
			["Gemstone"] = 0,
			["Class"] = "Nacional"
		},

		["5ton"] = {
			["Name"] = "5ton",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["abrams"] = {
			["Name"] = "abrams",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["agrale"] = {
			["Name"] = "agrale",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["as350sp"] = {
			["Name"] = "as350sp",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["br6x6"] = {
			["Name"] = "br6x6",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["f5m"] = {
			["Name"] = "f5m",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["geop"] = {
			["Name"] = "geop",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["guarani"] = {
			["Name"] = "guarani",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["guaranitra"] = {
			["Name"] = "guaranitra",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["hiluxgat"] = {
			["Name"] = "hiluxgat",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["hiluxteste"] = {
			["Name"] = "hiluxteste",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["ItPvS90"] = {
			["Name"] = "ItPvS90",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["l200eb2"] = {
			["Name"] = "l200eb2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["leo1a5"] = {
			["Name"] = "leo1a5",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["m60"] = {
			["Name"] = "m60",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["m109"] = {
			["Name"] = "m109",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["pantera"] = {
			["Name"] = "pantera",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["s10eb"] = {
			["Name"] = "s10eb",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["sherb"] = {
			["Name"] = "sherb",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},
		["vstrompmesp"] = {
			["Name"] = "vstrompmesp",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Militares"
		},

		["as350pm"] = {
			["Name"] = "as350samu",
			["Weight"] = 100,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["f850pm"] = {
			["Name"] = "f850pm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["xre300pm"] = {
			["Name"] = "xre300pm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["golpm"] = {
			["Name"] = "Gol PM",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["spinpm"] = {
			["Name"] = "spinpm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["dusterpm"] = {
			["Name"] = "dusterpm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["broncopm"] = {
			["Name"] = "broncopm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["cronospm"] = {
			["Name"] = "cronospm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["corollapm"] = {
			["Name"] = "corollapm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trailblazerpm"] = {
			["Name"] = "trailblazerpm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["corollacrosspm"] = {
			["Name"] = "corollacrosspm",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trailblazerrota"] = {
			["Name"] = "trailblazerrota",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["as350samu"] = {
			["Name"] = "as350samu",
			["Weight"] = 100,
			["Price"] = 1000,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sprintersamu"] = {
			["Name"] = "sprinter samu",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sw4samu"] = {
			["Name"] = "sw4 samu",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},

		["22sw4rodsp"] = {
			["Name"] = "22sw4rodsp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["as350sp"] = {
			["Name"] = "as350sp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["corollacrosspmesp"] = {
			["Name"] = "corollacrosspmesp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["corollapmesprod"] = {
			["Name"] = "corollapmesprod",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["duster21sp"] = {
			["Name"] = "duster21sp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["duster22pcesp"] = {
			["Name"] = "duster22pcesp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["f850rocam"] = {
			["Name"] = "f850rocam",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["frontier21coe"] = {
			["Name"] = "frontier21coe",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["h135pmesp"] = {
			["Name"] = "h135pmesp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["hiluxspcoe"] = {
			["Name"] = "hiluxspcoe",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["spacef15pm"] = {
			["Name"] = "spacef15pm",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["spin23pmesp"] = {
			["Name"] = "spin23pmesp",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sprinterbomb22"] = {
			["Name"] = "sprinterbomb22",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["sw4spg"] = {
			["Name"] = "sw4spg",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail15pmespg2"] = {
			["Name"] = "trail15pmespg2",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail20pmespg2"] = {
			["Name"] = "trail20pmespg2",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail22pcespg2"] = {
			["Name"] = "trail22pcespg2",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail22pmespg2"] = {
			["Name"] = "trail22pmespg2",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["trail23pmespg3"] = {
			["Name"] = "trail23pmespg3",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["virtuspmesprod"] = {
			["Name"] = "virtuspmesprod",
			["Weight"] = 0,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
		},
		["bennys1200"] = {
			["Name"] = "r1200",
			["Weight"] = 50,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
        },
		["bennysraptor"] = {
			["Name"] = "Fraptor",
			["Weight"] = 70,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"
        },
		["bennysscania"] = {
			["Name"] = "Scania",
			["Weight"] = 70,
			["Price"] = 100,
			["Mode"] = "Work",
			["Gemstone"] = 0,
			["Class"] = "Emergência"			
		},


		["hymn_delivery"] = {
			["Name"] = "Hymn",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		},
		["hymn_delivery2"] = {
			["Name"] = "Hymn2",
			["Weight"] = 40,
			["Price"] = 100,
			["Mode"] = nil,
			["Gemstone"] = 0,
			["Class"] = "Serviços"
		}
	}
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLEGLOBAL
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleGlobal()
		return List
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLEEXIST
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleExist(Name)
		return List[Name] and true or false
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLENAME
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleName(Name)
		if List[Name] and List[Name]["Name"] then
			return List[Name]["Name"]
		end
	
		return false
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLECHEST
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleChest(Name)
		if List[Name] and List[Name]["Weight"] then
			return List[Name]["Weight"]
		end
	
		return 0
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLEPRICE
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehiclePrice(Name)
		if List[Name] and List[Name]["Price"] then
			return List[Name]["Price"]
		end
		return 0
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLEMODE
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleMode(Name)
		if List[Name] and List[Name]["Mode"] then
			return List[Name]["Mode"]
		end
	
		return false
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLEGEMSTONE
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleGemstone(Name)
		if List[Name] and List[Name]["Gemstone"] then
			return List[Name]["Gemstone"]
		end
		return 0
	end
	-----------------------------------------------------------------------------------------------------------------------------------------
	-- VEHICLECLASS
	-----------------------------------------------------------------------------------------------------------------------------------------
	function VehicleClass(Name)
		if List[Name] and List[Name]["Class"] then
			return List[Name]["Class"]
		end
	
		return "Desconhecido"
	end