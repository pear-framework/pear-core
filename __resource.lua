--[[
	Pear Framework 2019
]]--


resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

server_scripts {
	"config.lua",

	"@mysql-async/lib/MySQL.lua",
	
	"server/main.lua",

	"server/functions/main.lua",

	"shared/main.lua",

	"server/user/user.lua",
	"server/user/functions.lua"
}

client_scripts {
	"config.lua",

	
	"client/main.lua",
	"client/functions/main.lua",
	"client/functions/user.lua",

	"shared/main.lua"
}

exports {
	"UpdateUser",
	"FetchUser",
	"FetchMain"
}

server_exports {
	"UpdateUser",
	"FetchUser",
	"FetchMain"
}