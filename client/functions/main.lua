Main.Connected = function()
    SetManualShutdownLoadingScreenNui(true)

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

Main.Log = function(...)
    TriggerServerEvent("pear-core:log", ...)
end

Main.Callback = function(...)
    local args = { ... }
    local name = args[1]
    local callback = args[2]
    table.remove(args, 1)
    
    local uniqueId = Main.GetRandomString(32)

    Main["Callbacks"][uniqueId] = callback

    TriggerServerEvent("pear-core:callback", name, uniqueId)
end

Main.Draw3DText = function(coords, text)
    local onScreen,_x,_y=World3dToScreen2d(coords.x,coords.y,coords.z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

Main.DrawMarker = function(hint, type, x, y, z, r, g, b, sx, sy, sz)
    if sx == nil then sx = 2.5 end
    if sy == nil then sy = 2.5 end
    if sz == nil then sz = 2.5 end
    if r == nil then r = 0 end
    if g == nil then g = 255 end
    if b == nil then b = 0 end
  
    if hint ~= "none" then
      ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
    end
  
    DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, (type == 6 and -90.0) or 0.0, 0.0, 0.0, sx, sy, sz, r, g, b, 100, false, true, 2, false, false, false, false)
end