Main = {}
Main.Callbacks = {}
Main.CharacterData = {}

RegisterNetEvent("pear-core:userLoaded")
AddEventHandler("pear-core:userLoaded", function(data)
    Main.User = data
    Main.User.Loaded = true
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
end)

RegisterNetEvent("pear-character:characterLoaded")
AddEventHandler("pear-character:characterLoaded", function(characterData)
    Main.CharacterData = characterData
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
    Main["Callbacks"][uniqueId](...)
    Main["Callbacks"][uniqueId] = nil
end)