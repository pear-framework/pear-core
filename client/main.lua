Main = {}
Main.Callbacks = {}

RegisterNetEvent("pear-core:userLoaded")
AddEventHandler("pear-core:userLoaded", function(data)
    Main.User = data
    Main.User.Loaded = true
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
end)

Citizen.CreateThread(Main.Connected())

RegisterNetEvent("pear-core:notify")
AddEventHandler("pear-core:notify", function(...)
    Main.Notify(...)
end)

RegisterNetEvent("pear-core:callback")
AddEventHandler("pear-core:callback", function(uniqueId, ...)
    Main["Callbacks"][uniqueId](...)
    Main["Callbacks"][uniqueId] = nil
end)