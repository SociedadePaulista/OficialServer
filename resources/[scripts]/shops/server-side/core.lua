-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("shops",Creative)
vCLIENT = Tunnel.getInterface("shops")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
local List = {
	["Mecanica"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "advtoolbox", price = 1000, amount = 1 },
			["2"] = { item = "toolbox", price = 700, amount = 1 },
			["3"] = { item = "tyres", price = 500, amount = 1},
			["4"] = { item = "plate", price = 300, amount = 1 },
			["5"] = { item = "nitro", price = 300, amount = 1 },
			["6"] = { item = "WEAPON_WRENCH", price = 300, amount = 1 },
			["7"] = { item = "pliers", price = 300, amount = 1 },
			["8"] = { item = "screwdriver", price = 300, amount = 1 },
		}
	},
	["Prision"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "jailfood", price = 20, amount = 1 },
			["2"] = { item = "water", price = 15, amount = 1 },
		}
	},
	["Drinks"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "absolut", price = 15, amount = 1 },
			["2"] = { item = "chandon", price = 15, amount = 1 },
			["3"] = { item = "dewars", price = 15, amount = 1},
			["4"] = { item = "hennessy", price = 15, amount = 1 },
			["5"] = { item = "cola", price = 15, amount = 1 },
			["6"] = { item = "soda", price = 15, amount = 1 },
			["7"] = { item = "fries", price = 15, amount = 1 },
		}
	},
	["Departament"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "water", price = 15, amount = 1 },
			["2"] = { item = "cannedsoup", price = 30, amount = 1 },
			["3"] = { item = "spaghetti", price = 30, amount = 1},
			["4"] = { item = "canofbeans", price = 30, amount = 1 },
			["5"] = { item = "canofcorn", price = 30, amount = 1 },
			["6"] = { item = "spoon", price = 165, amount = 1 },
			["7"] = { item = "canopener", price = 135, amount = 1 },
			["8"] = { item = "cigar", price = 30, amount = 1 },
			["9"] = { item = "cigarette", price = 10, amount = 1 },
			["10"] = { item = "ciggypack", price = 150, amount = 1 },
			["11"] = { item = "lighter", price = 175, amount = 1 },
			["12"] = { item = "vape", price = 4750, amount = 1 },
			["13"] = { item = "sugar", price = 5, amount = 1 },
			["14"] = { item = "ollyrancherbag", price = 15, amount = 1 },
			["15"] = { item = "postit", price = 20, amount = 1 },
			["16"] = { item = "notepad", price = 10, amount = 1 },
			["17"] = { item = "rose", price = 25, amount = 1 },
		}
	},
	["Fuel"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "WEAPON_PETROLCAN", price = 250, amount = 1 },
		}
	},
	["Pharmacy"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "medkit", price = 575, amount = 1 },
			["2"] = { item = "bandage", price = 225, amount = 1 },
			["3"] = { item = "gauze", price = 100, amount = 1},
			["4"] = { item = "analgesic", price = 125, amount = 1 },
			["5"] = { item = "adrenaline", price = 2000, amount = 1 },
		}
	},
	["Paramedic"] = {
		["Mode"] = "Buy",
		["Permission"] = "Hospital",
		["List"] = {
			["1"] = { item = "adrenaline", price = 2, amount = 1 },
			["2"] = { item = "bandage", price = 115, amount = 1 },
			["3"] = { item = "gauze", price = 50, amount = 1 },
			["4"] = { item = "gdtkit", price = 20, amount = 1 },
			["5"] = { item = "medkit", price = 285, amount = 1 },
			["10"] = { item = "sinkalmy", price = 185, amount = 1 },
			["11"] = { item = "analgesic", price = 65, amount = 1 },
			["12"] = { item = "ritmoneury", price = 235, amount = 1 },
			["13"] = { item = "defibrillator", price = 325, amount = 1 },
			["14"] = { item = "medicbag", price = 425, amount = 1 },
		}
	},
	["Animals"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "shepherd", price = 25000, amount = 1 },
			["2"] = { item = "husky", price = 25000, amount = 1 },
			["3"] = { item = "poodle", price = 25000, amount = 1 },
			["4"] = { item = "westy", price = 25000, amount = 1 },
			["5"] = { item = "cat", price = 25000, amount = 1 },
			["6"] = { item = "pug", price = 25000, amount = 1 },
			["7"] = { item = "rottweiler", price = 25000, amount = 1 },
			["8"] = { item = "retriever", price = 25000, amount = 1 },
		}
	},
	["Weapons"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "smgbody", price = 525, amount = 1 },
			["2"] = { item = "riflebody", price = 625, amount = 1 },
			["3"] = { item = "pistolbody", price = 425, amount = 1 },
		}
	},
	["Coffee"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "coffee", price = 20, amount = 1 },
		}
	},
	["Ammunation"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "WEAPON_SNSPISTOL", price = 5975, amount = 1 },
			["2"] = { item = "WEAPON_SNSPISTOL_MK2", price = 8975, amount = 1 },
			["3"] = { item = "WEAPON_VINTAGEPISTOL", price = 3975, amount = 1 },
			["4"] = { item = "ammo9box", price = 575, amount = 1 },
			["5"] = { item = "WEAPON_GOLFCLUB", price = 975, amount = 1 },
			["6"] = { item = "WEAPON_BAT", price = 975, amount = 1 },
			["7"] = { item = "WEAPON_KNUCKLE", price = 975, amount = 1 },
			["8"] = { item = "WEAPON_POOLCUE", price = 975, amount = 1 },
		}
	},
	["Hamburger"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "hamburger", price = 25, amount = 1 },
		}
	},
	["Chihuahua"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "cola", price = 15, amount = 1 },
			["2"] = { item = "soda", price = 15, amount = 1 },
			["3"] = { item = "hamburger", price = 25, amount = 1 },
			["4"] = { item = "hotdog", price = 15, amount = 1 },
		}
	},
	["Weeds"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "tablecoke", price = 1005, amount = 1 },
			["2"] = { item = "tablemeth", price = 1005, amount = 1 },
			["3"] = { item = "tableweed", price = 1005, amount = 1 },
		}
	},
	["Criminal4"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "pager", price = 125, amount = 1 },
			["2"] = { item = "card05", price = 425, amount = 1 },
			["3"] = { item = "goldbar", price = 525, amount = 1 },
			["4"] = { item = "card02", price = 325, amount = 1 },
			["5"] = { item = "card01", price = 325, amount = 1 },
			["6"] = { item = "pliers", price = 55, amount = 1 },
			["7"] = { item = "card04", price = 275, amount = 1 },
			["8"] = { item = "card03", price = 375, amount = 1 },
			["9"] = { item = "pendrive", price = 325, amount = 1 },
		}
	},
	["Tools"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "pickaxe", price = 525, amount = 1 },
			["2"] = { item = "WEAPON_WRENCH", price = 1725, amount = 1 },
			["3"] = { item = "repairkit01", price = 525, amount = 1 },
			["4"] = { item = "repairkit02", price = 3225, amount = 1 },
			["5"] = { item = "toolbox", price = 1625, amount = 1 },
			["6"] = { item = "drillbit", price = 75, amount = 1 },
			["7"] = { item = "rope", price = 875, amount = 1 },
			["8"] = { item = "jackham", price = 3450, amount = 1 },
			["9"] = { item = "glassbottle", price = 30, amount = 1 },
			["10"] = { item = "plasticbottle", price = 30, amount = 1 },
			["11"] = { item = "tyres", price = 1225, amount = 1 },
			["12"] = { item = "advtoolbox", price = 2525, amount = 1 },
			["13"] = { item = "lockcore", price = 375, amount = 1 },
			["14"] = { item = "screwdriver", price = 225, amount = 1 },
			["15"] = { item = "firecracker", price = 100, amount = 1 },
			["16"] = { item = "WEAPON_HAMMER", price = 975, amount = 1 },
			["17"] = { item = "WEAPON_HATCHET", price = 975, amount = 1 },
			["18"] = { item = "WEAPON_STONE_HATCHET", price = 975, amount = 1 },
			["19"] = { item = "WEAPON_MACHETE", price = 975, amount = 1 },
			["20"] = { item = "WEAPON_FLASHLIGHT", price = 975, amount = 1 },
			["21"] = { item = "WEAPON_BATTLEAXE", price = 975, amount = 1 },
			["22"] = { item = "WEAPON_BRICK", price = 25, amount = 1 },
			["23"] = { item = "miningpan", price = 825, amount = 1 },
			["24"] = { item = "sieve", price = 515, amount = 1 },
			["25"] = { item = "WEAPON_CROWBAR", price = 1532, amount = 1 },
		}
	},
	["Criminal3"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "domino", price = 45, amount = 1 },
			["2"] = { item = "legos", price = 75, amount = 1 },
			["3"] = { item = "dices", price = 45, amount = 1 },
			["4"] = { item = "eraser", price = 75, amount = 1 },
			["5"] = { item = "ominitrix", price = 75, amount = 1 },
			["6"] = { item = "floppy", price = 45, amount = 1 },
			["7"] = { item = "deck", price = 75, amount = 1 },
			["8"] = { item = "horseshoe", price = 75, amount = 1 },
		}
	},
	["Criminal2"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "brush", price = 75, amount = 1 },
			["2"] = { item = "dildo", price = 75, amount = 1 },
			["3"] = { item = "spray01", price = 75, amount = 1 },
			["4"] = { item = "watch", price = 75, amount = 1 },
			["5"] = { item = "bracelet", price = 75, amount = 1 },
			["6"] = { item = "spray02", price = 75, amount = 1 },
			["7"] = { item = "soap", price = 75, amount = 1 },
			["8"] = { item = "spray03", price = 75, amount = 1 },
			["9"] = { item = "spray04", price = 75, amount = 1 },
			["10"] = { item = "rimel", price = 75, amount = 1 },
			["11"] = { item = "slipper", price = 75, amount = 1 },
		}
	},
	["Digital"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "binoculars", price = 275, amount = 1 },
			["2"] = { item = "camera", price = 485, amount = 1 },
			["3"] = { item = "camera2", price = 355, amount = 1 },
			["4"] = { item = "cellphone", price = 575, amount = 1 },
			["5"] = { item = "radio", price = 975, amount = 1 },
			["6"] = { item = "nintendo", price = 975, amount = 1 },
			["7"] = { item = "drone", price = 975, amount = 1 },
			["8"] = { item = "dronecontrol", price = 975, amount = 1 },
			["9"] = { item = "skateboard", price = 975, amount = 1 },
			["10"] = { item = "paymentterminal", price = 975, amount = 1 },
		}
	},
	["Fruit"] = {
        ["Mode"] = "Sell",
        ["List"] = {
            ["1"] = { item = "acerola", price = 15, amount = 1 },
            ["2"] = { item = "orange", price = 15, amount = 1 },
            ["3"] = { item = "grape", price = 15, amount = 1 },
            ["4"] = { item = "strawberry", price = 15, amount = 1 },
            ["5"] = { item = "apple", price = 15, amount = 1 },
            ["6"] = { item = "guarana", price = 15, amount = 1 },
            ["7"] = { item = "passion", price = 15, amount = 1 },
            ["8"] = { item = "coffee2", price = 10, amount = 1 },
            ["9"] = { item = "tange", price = 15, amount = 1 },
            ["10"] = { item = "tomato", price = 15, amount = 1 },
            ["11"] = { item = "banana", price = 15, amount = 1 },
        }
    }, 
	["Ingredient"] = {
        ["Mode"] = "Buy",
        ["List"] = {
            ["1"] = { item = "hamburgerbuns", price = 25, amount = 1 },
			["2"] = { item = "rawchickenthighs", price = 25, amount = 1 },
			["3"] = { item = "cheese", price = 25, amount = 1 },
			["4"] = { item = "lettuce", price = 25, amount = 1 },
			["5"] = { item = "foodingredient", price = 25, amount = 1 },
			["6"] = { item = "tomato", price = 25, amount = 1 },
			["7"] = { item = "onion", price = 25, amount = 1 },
			["8"] = { item = "grape", price = 25, amount = 1 },
			["9"] = { item = "potato", price = 25, amount = 1 },
			["10"] = { item = "milk", price = 25, amount = 1 },
			["11"] = { item = "coffeebeans", price = 25, amount = 1 },
			["12"] = { item = "cucumber", price = 25, amount = 1 },
			["13"] = { item = "carrot", price = 25, amount = 1 },
			["14"] = { item = "radish", price = 25, amount = 1 },
			["15"] = { item = "beetroot", price = 25, amount = 1 },
			["16"] = { item = "cabbage", price = 25, amount = 1 },
			["17"] = { item = "chives", price = 25, amount = 1 },
			["18"] = { item = "pumpkin", price = 25, amount = 1 },
			["19"] = { item = "corn", price = 25, amount = 1 },
			["20"] = { item = "oregano", price = 25, amount = 1 },
			["21"] = { item = "garlic", price = 25, amount = 1 },
			["22"] = { item = "styrofoamcup", price = 25, amount = 1 },
			["23"] = { item = "hfcs", price = 25, amount = 1 },
			["24"] = { item = "hamburgermeat", price = 25, amount = 1 },
			["25"] = { item = "icecreamingred", price = 25, amount = 1 },
        }
    }, 
	["Hunting"] = {
        ["Mode"] = "Sell",
        ["List"] = {
			["1"] = { item = "deerpelt", price = 25, amount = 1 },
            ["2"] = { item = "deerpelt2", price = 50, amount = 1 },
			["3"] = { item = "deerpelt3", price = 100, amount = 1 },
			["4"] = { item = "deerpelt4", price = 200, amount = 1 },
			["5"] = { item = "deerpelt5", price = 400, amount = 1 },
			["6"] = { item = "deermeat", price = 16, amount = 1 },
			["7"] = { item = "deermeat2", price = 32, amount = 1 },
			["8"] = { item = "deermeat3", price = 64, amount = 1 },
			["9"] = { item = "deermeat4", price = 128, amount = 1 },
			["10"] = { item = "deermeat5", price = 256, amount = 1 },
			["11"] = { item = "deerantlers", price = 30, amount = 1 },
        }
    }, 

	["Exercito"] = {
		["Mode"] = "Buy",
		["Permission"] = "Exercito",
		["List"] = {
			["1"] = { item = "WEAPON_MSN", price = 1000, amount = 1 },
			["2"] = { item = "WEAPON_GLOCK22", price = 500, amount = 1 },
			["3"] = { item = "WEAPON_PARAFAL", price = 1000, amount = 1 },
			["4"] = { item = "WEAPON_FNFAL", price = 1000, amount = 1 },
			["5"] = { item = "WEAPON_FNL1A1", price = 1000, amount = 1 },
			["6"] = { item = "WEAPON_PUMPSHOTGUN", price = 1000, amount = 1 },
			["7"] = { item = "WEAPON_HUNTINGRIFLE", price = 1000, amount = 1 },
			["8"] = { item = "AMMO_9", price = 4, amount = 1 },
			["9"] = { item = "AMMO_556", price = 6, amount = 1 },
			["10"] = { item = "radio", price = 250, amount = 1 },
		}
	},
	
	["Armory"] = {
		["Mode"] = "Buy",
		["Permission"] = "Policia",
		["List"] = {
			["1"] = { item = "WEAPON_COMBATPISTOL", price = 500, amount = 1 },
			["2"] = { item = "WEAPON_HEAVYPISTOL", price = 500, amount = 1 },
			["3"] = { item = "WEAPON_GLOCK22", price = 500, amount = 1 },
			["5"] = { item = "WEAPON_STUNGUN", price = 500, amount = 1 },
		}
	},
	["Armory2"] = {
		["Mode"] = "Buy",
		["Permission"] = "Policia",
		["List"] = {
			["1"] = { item = "WEAPON_CARBINERIFLE", price = 1000, amount = 1 },
			["2"] = { item = "WEAPON_CARBINERIFLE_MK2", price = 1000, amount = 1 },
			["3"] = { item = "WEAPON_PARAFAL", price = 1000, amount = 1 },
			["4"] = { item = "WEAPON_FNFAL", price = 1000, amount = 1 },
			["5"] = { item = "WEAPON_FNL1A1", price = 1000, amount = 1 },
			["6"] = { item = "WEAPON_SMG", price = 1000, amount = 1 },
			["7"] = { item = "WEAPON_PUMPSHOTGUN", price = 1000, amount = 1 },
		}
	},
	["Armory3"] = {
		["Mode"] = "Buy",
		["Permission"] = "Policia",
		["List"] = {
			["1"] = { item = "AMMO_9", price = 4, amount = 1 },
			["2"] = { item = "AMMO_45", price = 5, amount = 1 },
			["3"] = { item = "AMMO_556", price = 6, amount = 1 },
			["4"] = { item = "AMMO_12", price = 5, amount = 1 },
		}
	},
	["Armory4"] = {
		["Mode"] = "Buy",
		["Permission"] = "Policia",
		["List"] = {
			["1"] = { item = "vest", price = 175, amount = 1 },
			["3"] = { item = "handcuff", price = 425, amount = 1 },
			["4"] = { item = "gsrkit", price = 425, amount = 1 },
			["4"] = { item = "gdtkit", price = 425, amount = 1 },
			["6"] = { item = "barrier", price = 5, amount = 1 },
			["7"] = { item = "radio", price = 250, amount = 1 },
			["8"] = { item = "WEAPON_NIGHTSTICK", price = 865, amount = 1 },
			["9"] = { item = "WEAPON_SMOKEGRENADE", price = 75, amount = 1 },
			["10"] = { item = "laptop", price = 75, amount = 1 },
		}
	},
	["ArmoryAll"] = {
		["Mode"] = "Buy",
		["Permission"] = "Policia",
		["List"] = {
			["1"] = { item = "WEAPON_COMBATPISTOL", price = 500, amount = 1 },
			["2"] = { item = "WEAPON_HEAVYPISTOL", price = 500, amount = 1 },
			["3"] = { item = "WEAPON_GLOCK22", price = 500, amount = 1 },
			["5"] = { item = "WEAPON_STUNGUN", price = 500, amount = 1 },
			["6"] = { item = "WEAPON_CARBINERIFLE", price = 1000, amount = 1 },
			["7"] = { item = "WEAPON_CARBINERIFLE_MK2", price = 1000, amount = 1 },
			["8"] = { item = "WEAPON_PARAFAL", price = 1000, amount = 1 },
			["9"] = { item = "WEAPON_FNFAL", price = 1000, amount = 1 },
			["10"] = { item = "WEAPON_FNL1A1", price = 1000, amount = 1 },
			["11"] = { item = "WEAPON_SMG", price = 1000, amount = 1 },
			["12"] = { item = "WEAPON_PUMPSHOTGUN", price = 1000, amount = 1 },
			["13"] = { item = "AMMO_9", price = 4, amount = 1 },
			["14"] = { item = "AMMO_45", price = 5, amount = 1 },
			["15"] = { item = "AMMO_556", price = 6, amount = 1 },
			["16"] = { item = "AMMO_12", price = 5, amount = 1 },
			["17"] = { item = "vest", price = 175, amount = 1 },
			["18"] = { item = "handcuff", price = 425, amount = 1 },
			["19"] = { item = "gsrkit", price = 425, amount = 1 },
			["20"] = { item = "gdtkit", price = 425, amount = 1 },
			["21"] = { item = "barrier", price = 5, amount = 1 },
			["22"] = { item = "radio", price = 250, amount = 1 },
			["23"] = { item = "WEAPON_NIGHTSTICK", price = 865, amount = 1 },
			["24"] = { item = "WEAPON_SMOKEGRENADE", price = 75, amount = 1 },
			["25"] = { item = "laptop", price = 75, amount = 1 },
		}
	},
	["Hunting2"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "WEAPON_MUSKET_AMMO", price = 7, amount = 1 },
			["2"] = { item = "WEAPON_MUSKET", price = 3250, amount = 1 },
			["3"] = { item = "WEAPON_SWITCHBLADE", price = 525, amount = 1 },
			["4"] = { item = "deerration", price = 25, amount = 1 },
		}
	},
	["Water"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "water", price = 30, amount = 1 },
		}
	},
	["Cigarette"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "cigarette", price = 10, amount = 1 },
			["2"] = { item = "lighter", price = 175, amount = 1 },
		}
	},
	["Foundry"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "stone", price = 20, amount = 1 },
			["2"] = { item = "diamondore", price = 95, amount = 1 },
			["3"] = { item = "sapphireore", price = 45, amount = 1 },
			["4"] = { item = "emeraldore", price = 85, amount = 1 },
			["5"] = { item = "goldore", price = 75, amount = 1 },
			["6"] = { item = "geode", price = 25, amount = 1 },
			["7"] = { item = "copperore", price = 30, amount = 1 },
			["8"] = { item = "ironore", price = 35, amount = 1 },
			["9"] = { item = "rubyore", price = 55, amount = 1 },
			["10"] = { item = "coal", price = 28, amount = 1 },
			["11"] = { item = "leadore", price = 28, amount = 1 },
			["12"] = { item = "gravel", price = 5, amount = 1 },
			["13"] = { item = "goldnugget", price = 45, amount = 1 },
		}
	},
	["Oxy"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "oxy", price = 35, amount = 1 },
		}
	},
	["MegaMall"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "chair8", price = 120, amount = 1 },
			["2"] = { item = "chair16", price = 101, amount = 1 },
			["3"] = { item = "chair18", price = 112, amount = 1 },
			["4"] = { item = "chair58", price = 131, amount = 1 },
			["5"] = { item = "chair110", price = 83, amount = 1 },
			["6"] = { item = "chair38", price = 108, amount = 1 },
			["7"] = { item = "chair45", price = 114, amount = 1 },
			["8"] = { item = "chair107", price = 120, amount = 1 },
			["9"] = { item = "chair10", price = 144, amount = 1 },
			["10"] = { item = "chair77", price = 86, amount = 1 },
			["11"] = { item = "chair67", price = 140, amount = 1 },
			["12"] = { item = "chair109", price = 99, amount = 1 },
			["13"] = { item = "chair21", price = 134, amount = 1 },
			["14"] = { item = "chair105", price = 113, amount = 1 },
			["15"] = { item = "chair108", price = 148, amount = 1 },
			["16"] = { item = "chair56", price = 119, amount = 1 },
			["17"] = { item = "chair90", price = 139, amount = 1 },
			["18"] = { item = "chair88", price = 89, amount = 1 },
			["19"] = { item = "chair31", price = 117, amount = 1 },
			["20"] = { item = "chair4", price = 141, amount = 1 },
			["21"] = { item = "chair64", price = 134, amount = 1 },
			["22"] = { item = "chair71", price = 119, amount = 1 },
			["23"] = { item = "chair97", price = 127, amount = 1 },
			["24"] = { item = "chair74", price = 108, amount = 1 },
			["25"] = { item = "chair33", price = 119, amount = 1 },
			["26"] = { item = "chair26", price = 116, amount = 1 },
			["27"] = { item = "chair52", price = 106, amount = 1 },
			["28"] = { item = "chair20", price = 99, amount = 1 },
			["29"] = { item = "chair63", price = 128, amount = 1 },
			["30"] = { item = "chair44", price = 121, amount = 1 },
			["31"] = { item = "chair82", price = 90, amount = 1 },
			["32"] = { item = "chair35", price = 146, amount = 1 },
			["33"] = { item = "chair41", price = 97, amount = 1 },
			["34"] = { item = "chair103", price = 94, amount = 1 },
			["35"] = { item = "chair59", price = 106, amount = 1 },
			["36"] = { item = "chair48", price = 80, amount = 1 },
			["37"] = { item = "chair95", price = 92, amount = 1 },
			["38"] = { item = "chair22", price = 131, amount = 1 },
			["39"] = { item = "chair39", price = 103, amount = 1 },
			["40"] = { item = "chair53", price = 146, amount = 1 },
			["41"] = { item = "chair5", price = 96, amount = 1 },
			["42"] = { item = "chair25", price = 80, amount = 1 },
			["43"] = { item = "chair2", price = 127, amount = 1 },
			["44"] = { item = "chair6", price = 82, amount = 1 },
			["45"] = { item = "chair86", price = 125, amount = 1 },
			["46"] = { item = "chair13", price = 93, amount = 1 },
			["47"] = { item = "chair1", price = 84, amount = 1 },
			["48"] = { item = "chair89", price = 137, amount = 1 },
			["49"] = { item = "chair11", price = 137, amount = 1 },
			["50"] = { item = "chair27", price = 134, amount = 1 },
			["51"] = { item = "chair32", price = 89, amount = 1 },
			["52"] = { item = "chair70", price = 133, amount = 1 },
			["53"] = { item = "chair85", price = 99, amount = 1 },
			["54"] = { item = "chair15", price = 149, amount = 1 },
			["55"] = { item = "chair34", price = 140, amount = 1 },
			["56"] = { item = "chair42", price = 139, amount = 1 },
			["57"] = { item = "chair55", price = 102, amount = 1 },
			["58"] = { item = "chair75", price = 146, amount = 1 },
			["59"] = { item = "chair80", price = 136, amount = 1 },
			["60"] = { item = "chair73", price = 121, amount = 1 },
			["61"] = { item = "chair81", price = 123, amount = 1 },
			["62"] = { item = "chair3", price = 145, amount = 1 },
			["63"] = { item = "chair72", price = 108, amount = 1 },
			["64"] = { item = "chair19", price = 108, amount = 1 },
			["65"] = { item = "chair68", price = 84, amount = 1 },
			["66"] = { item = "chair40", price = 134, amount = 1 },
			["67"] = { item = "chair76", price = 85, amount = 1 },
			["68"] = { item = "chair104", price = 142, amount = 1 },
			["69"] = { item = "chair106", price = 130, amount = 1 },
			["70"] = { item = "chair102", price = 83, amount = 1 },
			["71"] = { item = "chair29", price = 106, amount = 1 },
			["72"] = { item = "chair30", price = 106, amount = 1 },
			["73"] = { item = "chair54", price = 104, amount = 1 },
			["74"] = { item = "chair60", price = 85, amount = 1 },
			["75"] = { item = "chair100", price = 107, amount = 1 },
			["76"] = { item = "chair62", price = 85, amount = 1 },
			["77"] = { item = "chair78", price = 94, amount = 1 },
			["78"] = { item = "chair79", price = 117, amount = 1 },
			["79"] = { item = "chair23", price = 131, amount = 1 },
			["80"] = { item = "chair65", price = 107, amount = 1 },
			["81"] = { item = "chair14", price = 103, amount = 1 },
			["82"] = { item = "chair7", price = 121, amount = 1 },
			["83"] = { item = "chair51", price = 140, amount = 1 },
			["84"] = { item = "chair87", price = 118, amount = 1 },
			["85"] = { item = "chair92", price = 126, amount = 1 },
			["86"] = { item = "chair17", price = 95, amount = 1 },
			["87"] = { item = "chair9", price = 94, amount = 1 },
			["88"] = { item = "chair57", price = 87, amount = 1 },
			["89"] = { item = "chair12", price = 87, amount = 1 },
			["90"] = { item = "chair91", price = 149, amount = 1 },
			["91"] = { item = "chair84", price = 87, amount = 1 },
			["92"] = { item = "chair43", price = 82, amount = 1 },
			["93"] = { item = "chair36", price = 130, amount = 1 },
			["94"] = { item = "chair28", price = 88, amount = 1 },
			["95"] = { item = "chair96", price = 121, amount = 1 },
			["96"] = { item = "chair99", price = 134, amount = 1 },
			["97"] = { item = "chair37", price = 111, amount = 1 },
			["98"] = { item = "chair49", price = 146, amount = 1 },
			["99"] = { item = "chair61", price = 124, amount = 1 },
			["100"] = { item = "chair93", price = 142, amount = 1 },
			["101"] = { item = "chair66", price = 99, amount = 1 },
			["102"] = { item = "chair83", price = 115, amount = 1 },
			["103"] = { item = "chair98", price = 114, amount = 1 },
			["104"] = { item = "chair24", price = 110, amount = 1 },
			["105"] = { item = "chair101", price = 83, amount = 1 },
			["106"] = { item = "chair46", price = 114, amount = 1 },
			["107"] = { item = "chair50", price = 107, amount = 1 },
			["108"] = { item = "chair47", price = 119, amount = 1 },
			["109"] = { item = "chair94", price = 136, amount = 1 },
			["110"] = { item = "chair69", price = 127, amount = 1 },
		}
	},
	["Soda"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "cola", price = 15, amount = 1 },
			["2"] = { item = "soda", price = 15, amount = 1 },
		}
	},
	["Hotdog"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "hotdog", price = 15, amount = 1 },
		}
	},
	["Recycle"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "homekey", price = 115, amount = 1 },
			["2"] = { item = "lighter", price = 75, amount = 1 },
			["3"] = { item = "notepad", price = 5, amount = 1 },
			["4"] = { item = "bait", price = 2, amount = 1 },
			["5"] = { item = "rubber", price = 10, amount = 1 },
			["6"] = { item = "rose", price = 15, amount = 1 },
			["7"] = { item = "copper", price = 15, amount = 1 },
			["8"] = { item = "camera", price = 135, amount = 1 },
			["9"] = { item = "roadsigns", price = 20, amount = 1 },
			["10"] = { item = "techtrash", price = 60, amount = 1 },
			["11"] = { item = "explosives", price = 30, amount = 1 },
			["12"] = { item = "plasticbottle", price = 5, amount = 1 },
			["13"] = { item = "vape", price = 2375, amount = 1 },
			["14"] = { item = "amphetamine", price = 20, amount = 1 },
			["15"] = { item = "aluminum", price = 15, amount = 1 },
			["16"] = { item = "firecracker", price = 50, amount = 1 },
			["17"] = { item = "goldcoin", price = 20, amount = 1 },
			["18"] = { item = "teddy", price = 35, amount = 1 },
			["19"] = { item = "glass", price = 10, amount = 1 },
			["20"] = { item = "sheetmetal", price = 20, amount = 1 },
			["21"] = { item = "codeine", price = 15, amount = 1 },
			["22"] = { item = "scuba", price = 485, amount = 1 },
			["23"] = { item = "alcohol", price = 15, amount = 1 },
			["24"] = { item = "cellphone", price = 325, amount = 1 },
			["25"] = { item = "sulfuric", price = 12, amount = 1 },
			["26"] = { item = "acetone", price = 15, amount = 1 },
			["27"] = { item = "cotton", price = 20, amount = 1 },
			["28"] = { item = "plaster", price = 15, amount = 1 },
			["29"] = { item = "radio", price = 485, amount = 1 },
			["30"] = { item = "rope", price = 435, amount = 1 },
			["31"] = { item = "fishingrod", price = 365, amount = 1 },
			["32"] = { item = "binoculars", price = 135, amount = 1 },
			["33"] = { item = "WEAPON_SWITCHBLADE", price = 215, amount = 1 },
			["34"] = { item = "tarp", price = 20, amount = 1 },
			["35"] = { item = "tyres", price = 100, amount = 1 },
			["36"] = { item = "silvercoin", price = 10, amount = 1 },
			["37"] = { item = "saline", price = 20, amount = 1 },
			["38"] = { item = "pile", price = 10, amount = 1 },
			["39"] = { item = "cellbattery", price = 10, amount = 1 },
			["40"] = { item = "carbattery", price = 10, amount = 1 },
			["41"] = { item = "metalscrap", price = 10, amount = 1 },
		}
	},
	["Miners"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "ruby", price = 65, amount = 1 },
			["2"] = { item = "sapphire", price = 55, amount = 1 },
			["3"] = { item = "emerald", price = 95, amount = 1 },
			["4"] = { item = "diamond", price = 105, amount = 1 },
			["5"] = { item = "jadeite", price = 35, amount = 1 },
		}
	},
	["Donut"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "donut", price = 15, amount = 1 },
			["2"] = { item = "chocolate", price = 15, amount = 1 },
		}
	},
	["Fishing"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "catfish", price = 16, amount = 1 },
			["2"] = { item = "shrimp", price = 14, amount = 1 },
			["3"] = { item = "codfish", price = 16, amount = 1 },
			["4"] = { item = "goldenfish", price = 30, amount = 1 },
			["5"] = { item = "tambaqui", price = 28, amount = 1 },
			["6"] = { item = "carp", price = 12, amount = 1 },
			["7"] = { item = "pacu", price = 24, amount = 1 },
			["8"] = { item = "octopus", price = 14, amount = 1 },
			["9"] = { item = "pirarucu", price = 26, amount = 1 },
			["10"] = { item = "tilapia", price = 14, amount = 1 },
			["11"] = { item = "horsefish", price = 12, amount = 1 },
		}
	},
	["Fishing2"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "fishingrod", price = 725, amount = 1 },
			["2"] = { item = "scuba", price = 975, amount = 1 },
			["3"] = { item = "bait", price = 5, amount = 1 },
		}
	},
	["Criminal"] = {
		["Mode"] = "Sell",
		["List"] = {
			["1"] = { item = "switch", price = 45, amount = 1 },
			["2"] = { item = "blender", price = 75, amount = 1 },
			["3"] = { item = "keyboard", price = 75, amount = 1 },
			["4"] = { item = "dish", price = 75, amount = 1 },
			["5"] = { item = "playstation", price = 75, amount = 1 },
			["6"] = { item = "lampshade", price = 75, amount = 1 },
			["7"] = { item = "pan", price = 100, amount = 1 },
			["8"] = { item = "cup", price = 100, amount = 1 },
			["9"] = { item = "xbox", price = 75, amount = 1 },
			["10"] = { item = "fan", price = 75, amount = 1 },
			["11"] = { item = "mouse", price = 75, amount = 1 },
		}
	},
	["Clothes"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "WEAPON_SHOES", price = 25, amount = 1 },
			["2"] = { item = "WEAPON_CASH", price = 25, amount = 1 },
			["3"] = { item = "teddy", price = 75, amount = 1 },
			["4"] = { item = "suitcase", price = 275, amount = 1 },
			["5"] = { item = "wallet", price = 1000, amount = 1 },
			["6"] = { item = "GADGET_PARACHUTE", price = 475, amount = 1 },
		}
	},
	["Materials"] = {
		["Mode"] = "Buy",
		["List"] = {
			["1"] = { item = "plastic", price = 36, amount = 1 },
			["2"] = { item = "glass", price = 36, amount = 1 },
			["3"] = { item = "rubber", price = 36, amount = 1 },
			["4"] = { item = "aluminum", price = 36, amount = 1 },
			["5"] = { item = "copper", price = 36, amount = 1 },
			["6"] = { item = "sheetmetal", price = 90, amount = 1 },
			["7"] = { item = "roadsigns", price = 90, amount = 1 },
			["8"] = { item = "tarp", price = 90, amount = 1 },
			["9"] = { item = "techtrash", price = 225, amount = 1 },
			["10"] = { item = "explosives", price = 135, amount = 1 },
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Permission(Type,Permission)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and List[Type] then
		if Permission and vRP.HasPermission(Passport,Permission) and vRP.HasService(Passport,Permission) then
			return true
		else
			if not List[Type]["Permission"] or (vRP.HasPermission(Passport,List[Type]["Permission"]) and vRP.HasService(Passport,List[Type]["Permission"])) then
				return true
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Request(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and List[Name] then
		
		local Shop = {}
		local Inventory = {}
		local Inv = vRP.Inventory(Passport)
		local Identity = vRP.Identity(Passport)
		for Index,v in pairs(Inv) do
			if (parseInt(v["amount"]) <= 0 or not itemBody(v["item"])) then
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


				if itemChest(v["item"]) and v["data"] then
					for Slot,Value in pairs(v["data"]) do
						v["peso"] = v["peso"] + (itemWeight(Value["item"]) * parseInt(Value["amount"]))
					end
				end

				local Split = splitString(v["item"])
				local Description = itemDescription(v["item"])
				if Description then
					v["desc"] = v["desc"].."<br><description>"..Description.."</description>"				
				end
	
				if Split[1] == "identity" or Split[1] == "fidentity" or string.sub(v["item"],1,5) == "badge" then
					local Number = parseInt(Split[2])
					local Identity = vRP.Identity(Number)
					if Split[1] == "fidentity" then
						Identity = vRP.FalseIdentity(Number)
					end
					v["desc"] = v["desc"].."<br><legenda>Nome: <r>"..(Identity["name"].." "..Identity["name2"]).."</r></legenda>"
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

		local Slots = 0
		for Index,v in pairs(List[Name]["List"]) do
			Slots = Slots + 1
			Shop[Index] = {
				["slot"] = Index,
				["key"] = v["item"],
				["price"] = parseInt(v["price"]),
				["name"] = itemName(v["item"]),
				["index"] = itemIndex(v["item"]),
				["peso"] = itemWeight(v["item"]),
				["amount"] = parseInt(v["amount"]),
				["desc"] = "<item>" .. ((List[Name]["Mode"] == "Sell" and "<b>R$" .. parseFormat(v["price"]) .. "</b> por ") or "") .. v["amount"] .. " " ..  itemName(v["item"]) .. ((List[Name]["Mode"] == "Buy" and " por <b>R$" .. parseFormat(v["price"]) .. "</b>") or "") .. "</item>" .. (itemDescription(v["item"]) and "<br><description>" .. itemDescription(v["item"]) .. "</description>" or "")

			}
		end
		return Shop,Inventory,vRP.InventoryWeight(Passport),vRP.GetWeight(Passport),(Slots > 20) and Slots or 20
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.ShopType(Shop)
	if List[Shop] and List[Shop]["Mode"] then
		return List[Shop]["Mode"]
	end
	return "Buy"
end
---------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.functionShops(Shop,Item,Amount,Slot,Target)
	local source = source
	local Slot = tostring(Slot)
	local Target = tostring(Target)
	local Amount = parseInt(Amount)
	local Passport = vRP.Passport(source)
	if Passport and List[Shop] then
		if List[Shop]["Mode"] == "Buy" then
			if not itemAmmo(Item) and string.find(Item, "ammo") == nil and itemType(Item) ~= "Munição" or Shop ~= "Ammunation" or vRP.ConsultItem(Passport,"weaponlicense",1) then
				if vRP.MaxItens(Passport,Item,Amount) then
					TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",5000,"Aviso") return true
				else
					if (vRP.InventoryWeight(Passport) + itemWeight(Item) * Amount) <= vRP.GetWeight(Passport) then
						if vRP.PaymentFull(Passport,List[Shop]["List"][Slot]["price"] * Amount, Amount.."x("..itemName(Item)..")") then
							if Shop == "Pmesp" and Item == "WEAPON_PISTOL" then
								local Keyboard = vKEYBOARD.Primary(source,"Passaporte")
								if Keyboard and parseInt(Keyboard[1]) > 0 then
									vRP.GiveItem(Passport,"WEAPON_PISTOL-"..os.time().."-1-"..Keyboard[1],1,false,Target)
								end
							else
								vRP.GenerateItem(Passport,Item,Amount,false,Target)
								if Item == "WEAPON_PETROLCAN" then
									vRP.GenerateItem(Passport,"WEAPON_PETROLCAN_AMMO",4500,false)
								end
							end
							TriggerClientEvent("sounds:Private",source,"cash",0.1)
						else
							return true
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Mochila cheia.",5000,"Aviso") return true
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("weaponlicense").."</b>.",5000) return true
			end
		elseif List[Shop]["Mode"] == "Sell" then
			for Index,Value in pairs(List[Shop]["List"]) do
				if SplitOne(Item,"-") == Value["item"] then
					if vRP.TakeItem(Passport,Item,Amount,true,Slot) then
						vRP.GenerateItem(Passport,"dollars",parseInt(Value["price"] * Amount),false)
						TriggerClientEvent("sounds:Private",source,"cash",0.1) break
					end
				end
			end
		end
		TriggerClientEvent("shops:Update",source,"Request")
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
		vRP.UpdateShop(Passport, Slot, Target, Amount)
		Active[Passport] = false
	end
end