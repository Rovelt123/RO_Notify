function Notify(type, text, icon, time, color, speak)
	SendNUIMessage({
        type = type, 
        text = text, 
        icon = icon, 
        time = time, 
        color = color,
        speak = speak,
	})
end

RegisterNetEvent('Rovelt:Notify')
AddEventHandler('Rovelt:Notify', function(type, text, icon, time, color, tts)
	Notify(type, text, icon, time, color, tts)
end)


-- HOW TO USE
-- TYPES (danger, info, success, warning)
-- Icons can be found at https://fontawesome.com/v4/icons/
-- Colors can be found with hexfinder (https://g.co/kgs/GKkSNY)
-- tts is if you want an AI reading the message
-- exports['RO_Notify']:Notify(type, text, icon, time, color, tts (SPEAKING))


-- This is an example:
-- exports['RO_Notify']:Notify("warning", "This is with my own colors, icon, and time", "fa fa-battery-full", 60, "#02152e", false)

-- if you want to use it as an event:
-- TriggerClientEvent("Rovelt:Notify", source, type, text, icon, time, color, tts)
-- TriggerClientEvent("Rovelt:Notify", source, "warning", "This is with my own colors, icon, and time", "fa fa-battery-full", 60, "#02152e", false)

-- THIS IS A UPDATE CHECKER!
Citizen.CreateThread( function()
        updatePath = "/Rovelt123/updatecheck"
        resourceName = "[^2ROVELT SCRIPTS^7] ("..GetCurrentResourceName()..")"
        PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/Notify", checkVersion, "GET")
end)

function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

        if responseText == nil then
                print("^1"..resourceName.." check for updates failed ^7")
                return
        end

        if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                updateavail = true
                print("\n^1----------------------------------------------------------------------------------^7")
                print(resourceName.." is outdated, latest version is: ^2"..responseText.."^7, installed version: ^1"..curVersion.." | DISCORD --> https://discord.gg/s7aqeXK6E4" )
                print("^1----------------------------------------------------------------------------------^7")
        elseif tonumber(curVersion) > tonumber(responseText) then
                print("\n^3----------------------------------------------------------------------------------^7")
                print(resourceName.." version is: ^2"..responseText.."^7, installed version: ^1"..curVersion.."^7!")
                print("^3----------------------------------------------------------------------------------^7")
        else
                print("\n"..resourceName.." is up to date. (^2"..curVersion.."^7)")
        end
end