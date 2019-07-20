FetchMain = function()
    return Main
end

FetchUser = function()
    return User
end
 
UpdateUser = function(response)
    if response and response["table"] and response["data"] then
        User[response["table"]] = response["data"]
    end
end

Main.TableToString = function(...)
    local text = { ... }

    local msgString = ""

    if type(...) == "table" then
        return ...
    end

    for i = 1, #text do
        msgString = msgString .. (type(text[i]) == "table" and json.encode(text[i]) or tostring(text[i]))
    end

    return msgString
end

Main.RandomString = function(count)
    if count < 1 then return nil end
    local s = ""
    for i = 1, count do
        s = s .. string.char(math.random(32, 126))
    end
    return s 
end