os.loadAPI("json")

playerDetector = peripheral.find("playerDetector")
monitor = peripheral.find("monitor")
monitor.setTextScale(0.5)
term.clear()
monitor.clear()
local w1, h1 = monitor.getSize()
local w2, h2 = term.getSize()
playerList = {}
infoList = {}

local function centerPad(text, width)
    local text = tostring(text)
    local pad = (width - string.len(text)) / 2
    if pad <= 0 then
        return text
    end
    return string.rep(" ", math.floor(pad))
        .. text
        .. string.rep(' ', math.ceil(pad))
end
local page = "main"

target1 = "RatherChaotic"
target2 = "Kranyolsu"
target3 = "Telemort"
target4 = "CapitalAxe55560"
target5 = "Aspect_Xero"
target6 = "ZyorTaelon"

function awaitInput()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        if x >= 1 and x <= 2 and y == 3 then
            page = target1
            createMonitorDisplay()
            createTermDisplay()
        elseif x >= 1 and x <= 2 and y == 4 then
            page = target2
            createMonitorDisplay()
            createTermDisplay()
        elseif x >= 1 and x <= 2 and y == 5 then
            page = target3
            createMonitorDisplay()
            createTermDisplay()
        elseif x >= 1 and x <= 2 and y == 6 then
            page = target4
            createMonitorDisplay()
            createTermDisplay()
        elseif x >= 1 and x <= 2 and y == 7 then
            page = target5
            createMonitorDisplay()
            createTermDisplay()
        elseif x >= 1 and x <= 2 and y == 8 then
            page = target6
            createMonitorDisplay()
            createTermDisplay()
        elseif x >= 1 and x <= 2 and y == 9 then
            page = "main"
            createMonitorDisplay()
            createTermDisplay()
        end
    end
end


function createTermDisplay()
    term.setCursorPos(1,1)
    term.setTextColor(colors.lightBlue)
    term.write(centerPad("--==[Players]==--", w2))
    term.setCursorPos(1,2)
    term.setTextColor(colors.gray)
    term.write(string.rep("=", w2))

    term.setCursorPos(1,3)
    if page == target1 then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write(target1)

    term.setCursorPos(1,4)
    if page == target2 then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write(target2)

    term.setCursorPos(1,5)
    if page == target3 then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write(target3)

    term.setCursorPos(1,6)
    if page == target4 then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write(target4)

    term.setCursorPos(1,7)
    if page == target5 then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write(target5)

    term.setCursorPos(1,8)
    if page == target6 then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write(target6)

    term.setCursorPos(1,9)
    if page == "main" then
        term.setTextColor(colors.lime)
    else
        term.setTextColor(colors.red)
    end
    term.write("[]")
    term.setTextColor(colors.lightGray)
    term.write("Clear")
end
function createMonitorDisplay()
    if page == "main" then
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.red)
        monitor.write(centerPad("--==[None Selected]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        monitor.setCursorPos(1,4)
        monitor.setTextColor(colors.gray)
        monitor.write(centerPad("..Awaiting Selection..", w1))
    elseif page == target1 then
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.lightBlue)
        monitor.write(centerPad("--==["..target1.."]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        monitor.setCursorPos(1,4)
        monitor.setTextColor(colors.gray)
        monitor.write(centerPad("..Awaiting Selection..", w1))
    elseif page == target2 then
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.lightBlue)
        monitor.write(centerPad("--==["..page.."]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        monitor.setCursorPos(1,4)
        monitor.setTextColor(colors.gray)
        monitor.write(centerPad("..Awaiting Selection..", w1))
    elseif page == target3 then
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.lightBlue)
        monitor.write(centerPad("--==["..page.."]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        monitor.setCursorPos(1,4)
        monitor.setTextColor(colors.gray)
        monitor.write(centerPad("..Awaiting Selection..", w1))
    elseif page == target4 then
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.lightBlue)
        monitor.write(centerPad("--==["..page.."]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        monitor.setCursorPos(1,4)
        monitor.setTextColor(colors.gray)
        monitor.write(centerPad("..Awaiting Selection..", w1))
    elseif page == target5 then
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.lightBlue)
        monitor.write(centerPad("--==["..page.."]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        monitor.setCursorPos(1,4)
        monitor.setTextColor(colors.gray)
        monitor.write(centerPad("..Awaiting Selection..", w1))
    elseif page == target6 then
        local playerOnline = false
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.lightBlue)
        monitor.write(centerPad("--==["..page.."]==--", w1))
        monitor.setCursorPos(1,2)
        monitor.setTextColor(colors.gray)
        monitor.write(string.rep("=", w1))
        if table.find(playerList, target6) == true then
            playerOnline = true
        elseif table.find(playerList, target6) == false then
            playerOnline =  false
        end
        if playerOnline == true then
            monitor.setCursorPos(1,4)
            monitor.setTextColor(colors.lightBlue)
            local pos = playerDetector.getPlayerPos(target6)
            monitor.write(centerPad("Pos: "..pos.x.." "..pos.y.." "..pos.z, w1))
            monitor.setCursorPos(1,5)
            local playerList = playerDetector.getOnlinePlayers()
            monitor.setCursorPos(1,6)
        elseif playerOnline == false then
            monitor.setCursorPos(1,4)
            monitor.setTextColor(colors.red)
            monitor.write(centerPad("Player Offline", w1))
        end
    end
end

createTermDisplay()
createMonitorDisplay()
--print(textutils.formatTime(os.time(),true))

--[[while true do
  local event, button, x, y = os.pullEvent("mouse_click")
  term.setCursorPos(1, 19)
  term.clearLine()
  term.write(("The mouse button %s was pressed at %d, %d"):format(button, x, y))
end]]
parallel.waitForAll(awaitInput)
