Main = {}

RegisterNetEvent("pear-core:userLoaded")
AddEventHandler("pear-core:userLoaded", function(data)
    User = data
    User.Loaded = true
end)

Citizen.CreateThread(function()
    Main.Connected()
end)

RegisterNetEvent("pear-core:notify")
AddEventHandler("pear-core:notify", function(...)
    Main.Notify(...)
end)