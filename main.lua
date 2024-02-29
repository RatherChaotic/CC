function loop ()
    local chatbox = peripheral.find("chatBox")
    local detector = peripheral.find("playerDetector")
    local interface, interface_type = detectInterface()
    local info = getInfo(interface)

    while ( true )
    do
        local event, username, message, uuid, isHidden = os.pullEvent("chat")
        message_parts = mysplit(message)
        if (message_parts[1] == ".companion") then
            if (message_parts[2] == "print") then
                message_parts[3] = message_parts[3]:gsub("_", " ")
                chatbox.sendMessage(message_parts[3])
            else if (message_parts[2] == "disconnect") then
                if (interface) then
                    if (message_parts[3] == nil and checkPlayer(detector, username)) then
                        if (interface.isStargateConnected()) then
                            interface.disconnectStargate()
                        end
                    else if (message_parts[3] == interface.addressToString(info[4])) then
                        if (interface.isStargateConnected()) then
                            interface.disconnectStargate()
                        end
                    end
                    end
                end
            else if (message_parts[2] == "dial") then
                if (interface) then
                    if (info[4] ~= nil and message_parts[3] == interface.addressToString(info[4]) and message_parts[4] ~= nil) then
                        address = mysplit(message_parts[4], "%-")
                        dial(address, interface, interface_type)
                    else if (message_parts[4] == nil and checkPlayer(detector, username)) then
                        address = mysplit(message_parts[3], "%-")
                        dial(address, interface, interface_type)
                    end
                end
            end
            end
                end
            end
        end
    end
end


function dial(address, interface, interface_type)
    if (address) then
        
        local addressLength = #address
        
        local start = interface.getChevronsEngaged() + 1
        
        for chevron = start,addressLength,1
        do
            
            local symbol = tonumber(address[chevron])
            if (interface_type == "basic") then
                if chevron % 2 == 0 then
                    interface.rotateClockwise(symbol)
                else
                    interface.rotateAntiClockwise(symbol)
                end
                while(not interface.isCurrentSymbol(symbol))
                do
                    sleep(0)
                end
                sleep(1)
                interface.openChevron()
                interface.encodeChevron()
                sleep(1)
                interface.closeChevron()
            else if (interface_type ~= "basic") then
                interface.engageSymbol(symbol)
            end
        end
    end
    end
end

    
function closeLoop ()
    local interface, interface_type = detectInterface()
    if (interface.getOpenTime) then
        while(true)
        do
            sleep(1)
            if (interface.getOpenTime() == 1) then
                interface.disconnectStargate()
            end
        end
    end
end

function checkPlayer (detector, username)
    players = detector.getPlayersInRange(5)
    for k, v in pairs(players)
    do
        if (v == username) then
            return true
        else
            return false
        end
    end
end

function mysplit (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function detectInterface ()
    local basic = peripheral.find("basic_interface")
    local crystal = peripheral.find("crystal_interface")
    local advanced = peripheral.find("advanced_crystal_interface")
    local type = nil
    if advanced then
        active = advanced
        type = "advanced"
    elseif crystal then
        active = crystal
        type = "crystal"
    elseif basic then
        active = basic
        type = "basic"
    else
        active = nil
    end
    return active, type
end

function getInfo (interface, interface_type)
    local SG_generation = interface.getStargateGeneration()
    local SG_type = interface.getStargateType()
    local SG_energy = interface.getStargateEnergy()
    if (interface_type == "advanced") then
        local SG_address = interface.getLocalAddress()
    else
        local SG_address = nil
    end
    return {SG_generation, SG_type, SG_energy, SG_address}
end

loop()