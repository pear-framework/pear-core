Main = {}
Main.Callbacks = {}
Main.Users = {}

RegisterServerEvent("pear-core:log")
AddEventHandler("pear-core:log", function(...)
    Main.Log(...)
end)

RegisterServerEvent("playerJoined")

AddEventHandler("playerConnecting", playerConnecting)
AddEventHandler("playerJoined", function()
    playerJoined(source)
end)

AddEventHandler("playerDropped", playerDropped)

Main.Callback = function(name, id, source, callback, ...)
    if Main.Callbacks[name] then
        Main["callbacks"][name](source, callback, ...)
    else
        Main.Log("The callback: ", name, " does not exist!")
    end
end

RegisterServerEvent("pear-core:callback")
AddEventHandler("pear-core:callback", function(name, id, ...)
    Main.Callback(name, id, source, function(...)
        TriggerClientEvent("pear-core:callback", source, id, ...)
    end, ...)
end)

