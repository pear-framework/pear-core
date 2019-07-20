--[[
	Pear Framework 2019
]]--


resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	
	"server/main.lua",
	"server/functions.lua"
}

client_scripts {
	"client/main.lua",
	"client/functions.lua"
}