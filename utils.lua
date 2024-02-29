--GENERAL UTILS--

function stringToTable (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function tableToString(t)
    return table.concat(t, '\n')
end


--STARGATE RELATED UTILS--

function detectInterface ()
    
    if (peripheral.find("advanced_crystal_interface") ~= nil) then
        advanced = peripheral.find("advanced_crystal_interface")
        return advanced, "advanced"
    elseif (peripheral.find("crystal_interface") ~= nil) then
        crystal = peripheral.find("crystal_interface")
        return crystal, "crystal"
    elseif (peripheral.find("basic_interface") ~= nil) then
        basic = peripheral.find("basic_interface")
        return basic, "basic"
    else
        return nil, nil
    end
end

function getInfo (interface, interface_type)
    local SG_generation = interface.getStargateGeneration()
    local SG_type = interface.getStargateType()
    local SG_energy = interface.getStargateEnergy()
    local SG_address = nil
    if (interface_type == "advanced") then
        SG_address = interface.getLocalAddress()
    end
    return {SG_generation, SG_type, SG_energy, SG_address}
end

function dialAddress(targetAddress, interface, interface_type)
    if (targetAddress) then
        
        local addressLength = #targetAddress
        
        local start = interface.getChevronsEngaged() + 1
        
        for chevron = start,addressLength,1
        do
            
            local symbol = tonumber(targetAddress[chevron])
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
                sleep(0.1)
                interface.openChevron()
                interface.encodeChevron()
                sleep(0.1)
                interface.closeChevron()
            else if (interface_type ~= "basic") then
                interface.engageSymbol(symbol)
            end
        end
    end
    end
end
return {stringToTable = stringToTable,
tableToString = tableToString,
detectInterface = detectInterface,
getInfo = getInfo,
dialAddress = dialAddress}
