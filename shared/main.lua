FetchMain = function()
    return Main
end

FetchUser = function()
    return User
end

Main.TableToString = function(...)
    local text = { ... }

    local msgString = ""

    if type(...) == "table" then
        return ...
    end

    for i = 1, #text do
        msgString = msgString .. (type(text[i]) == "table" and json.encode(text[i]) or tostring(text[i])) .. " "
    end

    return msgString
end
