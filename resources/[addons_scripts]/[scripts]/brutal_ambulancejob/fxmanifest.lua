

fx_version 'adamant'
games { 'gta5' }


author 'Keres & Dév'
description 'Brutal Ambulance Job - store.brutalscripts.com'
version '1.2.2'

client_scripts { 
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	'config.lua',
	'core/client-core.lua',
	'cl_utils.lua',
	'client/*.lua'
}

server_scripts { 
	"@vrp/lib/Utils.lua",
	'@mysql-async/lib/MySQL.lua', 
	'config.lua',
	'core/server-core.lua',
	'sv_utils.lua',
	'server/*.lua'
}

shared_script {
	'@ox_lib/init.lua'
}

lua54 'yes'


export 'getAvailableDoctorsCount'
export 'IsDead'

ui_page "html/index.html"
files {
	"html/index.html",
	"html/style.css",
	"html/script.js",
	"html/assets/*.png",
}

provides { 'esx_ambulancejob', 'qb-ambulancejob' }


escrow_ignore {
	'config.lua',
	'sv_utils.lua',
	'cl_utils.lua',
	'core/client-core.lua',
	'core/server-core.lua',
}