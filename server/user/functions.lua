RegisterServerEvent("playerJoined")

AddEventHandler("playerConnecting", playerConnecting)
AddEventHandler("playerJoined", function()
    playerJoined(source)
end)
AddEventHandler("playerDropped", playerDropped)