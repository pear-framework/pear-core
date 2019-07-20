Main.Log = function(...)
    if not Config.Debug then
        return
    end
    
    local resource = GetInvokingResource()

    local logLine = os.date('%Y-%m-%d %H:%M:%S', os.time()) .. " [" .. (resource or "LOG") .. "] "
    local logString = { ... }

    for i = 1, #logString do
        logLine = logLine .. tostring(logString[i]) .. " "
    end

    print(logLine)
end

Main.Log("Initiated.")

Main.Notify = function(...)
    local args = { ... }
    local source = args[1]
    table.remove(args, 1)
    TriggerClientEvent("pear-core:notify", source, args)
end