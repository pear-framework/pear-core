Main = {}
Main.Callbacks = {}
Main.Users = {}

RegisterServerEvent("pear-core:log")
AddEventHandler("pear-core:log", function(...)
    Main.Log(...)
end)

RegisterServerEvent("pear-core:fetchMain")
AddEventHandler("pear-core:fetchMain", function(callback)
    callback(Main)
end)

Main.Callback = function(name, id, source, callback, ...)
    if Main.Callbacks[name] then
        Main["Callbacks"][name](source, callback, ...)
    else
        Main.Log("The callback:", name, "does not exist!")
    end
end

RegisterServerEvent("pear-core:callback")
AddEventHandler("pear-core:callback", function(name, id, ...)
    local src = source

    Main.Callback(name, id, src, function(...)
        TriggerClientEvent("pear-core:callback", src, id, ...)
    end, ...)
end)

