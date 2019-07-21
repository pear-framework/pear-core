Citizen.CreateThread(function()
    while true do

        if Config.DisableWantedLevel then
            ClearPlayerWantedLevel(PlayerId())
            SetPlayerWantedLevelNow(PlayerId(), false)
            SetPlayerWantedLevel(PlayerId(), 0)
        end
        Citizen.Wait(5)
    end
end)