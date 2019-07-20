playerConnecting = function(playerName, kick, deferral)
    Main.Log(playerName, "test", "test 69")
end

playerJoined = function(source)
    Main.Log(GetPlayerName(source), "Just joined!")
end

playerDropped = function(source, reason)
    Main.Log(GetPlayerName(source), "Just dropped because of", reason)
end