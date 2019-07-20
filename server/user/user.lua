playerConnecting = function(playerName, kick, deferral)
    Main.Log(playerName, "is now connecting!")
end

playerJoined = function(source)
    Main.Log(GetPlayerName(source), "just joined!")

    local playerData = {
        ["name"] = GetPlayerName(source)
    }

    for identifierIndex, identifier in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(identifier, "steam:") then
            playerData["identifier"] = identifier
        elseif string.match(identifier, "license:") then
            playerData["license"] = identifier
        elseif string.match(identifier, "ip:") then
            playerData["ip"] = identifier
        elseif string.match(identifier, "discord:") then
            playerData["discord"] = identifier 
        end
    end

    local query = [[
        INSERT
            INTO
        users
            (name, identifier, license, ip, discord)
        VALUES
            (@name, @identifier, @license, @ip, @discord)
        ON DUPLICATE KEY UPDATE
            name = name, license = @license, ip = @ip, discord = @discord, lastLogin = @lastLogin
    ]]

    MySQL.Async.execute(query, {
        ["@name"] = playerData["name"] or "not authenticated",
        ["@identifier"] = playerData["identifier"] or "not authenticated",
        ["@license"] = playerData["license"] or "not authenticated",
        ["@ip"] = playerData["ip"] or "not authenticated",
        ["@discord"] = playerData["discord"] or "not authenticated",
        ["@lastLogin"] = os.date('%Y-%m-%d %H:%M:%S', os.time())
    }, function(rowsChanged)
        if rowsChanged > 0 then
            Main.Log("Successfully updated player", playerData["name"], "with data", json.encode(playerData))

            Main.Users[source] = playerData

            TriggerClientEvent("pear-core:userLoaded", source, playerData)
        end
    end)
end

playerDropped = function(source, reason)
    Main.Log(GetPlayerName(source), "Just dropped because of", reason)

    if Main.Users[source] then
        Main.Users[source] = nil
    end
end