Main.Connected = function()
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    
    while true do
        Citizen.Wait(5)
        
        if NetworkIsSessionStarted() then
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