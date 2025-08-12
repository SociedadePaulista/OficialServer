


fx_version 'bodacious'
game 'common'
lua54 "yes"

ui_page "web-side/index.html"

shared_script {
	"shared-side/*"
}

client_scripts {
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

server_scripts {
	"@vrp/lib/Utils.lua",
	"server-side/*"
}

files {
	"web-side/index.html",
	"web-side/assets/*"
}              