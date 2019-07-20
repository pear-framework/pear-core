FetchUser = function(source)
    if Main.Users[source] then
        return Main.Users[source]
    end

    return false
end

RegisterServerEvent("playerJoined")

AddEventHandler("playerConnecting", playerConnecting)
AddEventHandler("playerJoined", function()
    playerJoined(source)
end)

AddEventHandler("playerDropped", playerDropped)