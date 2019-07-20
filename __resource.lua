--[[
	Pear Framework 2019
]]--


resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

server_scripts {
	"config.lua",

	"@mysql-async/lib/MySQL.lua",
	
	"server/main.lua",

	"server/functions/main.lua",

	"server/user/functions.lua",
	"server/user/user.lua"
}

client_scripts {
	"config.lua",

	"client/main.lua",
	"client/functions.lua"
}