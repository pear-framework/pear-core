Main.Connected = function()
    SetManualShutdownLoadingScreenNui(true)

    while true do
        Citizen.Wait(5)

        if NetworkIsSessionStarted() then
            TriggerServerEvent("playerJoined")

            exports["spawnmanager"]:spawnPlayer()
            break
        end
    end
end

Main.Notify = function(...)
    local message = Main.TableToString(...)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(message)
    DrawNotification(false, true)
end

Main.Log = function(...)
    TriggerServerEvent("pear-core:log", ...)
end

Main.Callback = function(...)
    local args = { ... }
    local name = args[1]
    local callback = args[2]
    table.remove(args, 1)
    
    local uniqueId = Main.GetRandomString(32)

    Main["Callbacks"][uniqueId] = callback

    TriggerServerEvent("pear-core:callback", name, uniqueId)
end