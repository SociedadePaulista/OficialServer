

fx_version "bodacious"
game "gta5"
lua54 "yes"


client_scripts {
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	'shared-side/*', 
	"client-side/*"
}

server_scripts {
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	'shared-side/*',
	"server-side/*"
}
