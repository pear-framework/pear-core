Main = {}
Main.callbacks = {}

RegisterNetEvent("pear-core:userLoaded")
AddEventHandler("pear-core:userLoaded", function(data)
    User = data
    User.Loaded = true
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
end)

Citizen.CreateThread(function()
    Main.Connected()
end)

RegisterNetEvent("pear-core:notify")
AddEventHandler("pear-core:notify", function(...)
    Main.Notify(...)
end)

RegisterNetEvent("pear-core:callback")
AddEventHandler("pear-core:callback", function(uniqueId, ...)
    Main["callbacks"][uniqueId](...)
    Main["callbacks"][uniqueId] = nil
end)