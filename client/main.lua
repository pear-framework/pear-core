Main = {}

RegisterNetEvent("pear-core:userLoaded")
AddEventHandler("pear-core:userLoaded", function(data)
    User = data
    User.Loaded = true
end)

Citizen.CreateThread(Connected)

