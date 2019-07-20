Main.Connected = function()
    SetManualShutdownLoadingScreenNui(true)

    while true do
        Citizen.Wait(5)
        
        if NetworkIsSessionStarted() then
            print("spawned")
            TriggerServerEvent("playerJoined")
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

