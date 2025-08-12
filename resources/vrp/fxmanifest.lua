fx_version "bodacious"
game "gta5"
lua54 "yes"
version "1.6.1"
author "ImagicTheCat"
CreativeNetwork "yes"


client_scripts {
	"config/*",
	"lib/Utils.lua",
	"client/*"
}

server_scripts {
	"config/*",
	"lib/Utils.lua",
	"modules/vrp.lua",
	"modules/base.lua",
	"modules/money.lua",
	"modules/prepare.lua",
	"modules/inventory.lua",
	"modules/server.lua",
	"modules/vehicles.lua",
}

files {
	"lib/*"
}              