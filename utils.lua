--GENERAL UTILS--

function stringToTable(inputstr, sep)
    if (inputstr ~= nil) then
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        return t
    else
        return nil
    end
end

function tableToString(t)
    if (type(t) == "table") then
        return table.concat(t, '\n')
    else
        return nil
    end
end

---@param o1 any|table First object to compare
---@param o2 any|table Second object to compare
---@param ignore_mt boolean True to ignore metatables (a recursive function to tests tables inside tables)
function tableEquals(o1, o2, ignore_mt)
    if o1 == o2 then return true end
    local o1Type = type(o1)
    local o2Type = type(o2)
    if o1Type ~= o2Type then return false end
    if o1Type ~= 'table' then return false end

    if not ignore_mt then
        local mt1 = getmetatable(o1)
        if mt1 and mt1.__eq then
            --compare using built in method
            return o1 == o2
        end
    end

    local keySet = {}

    for key1, value1 in pairs(o1) do
        local value2 = o2[key1]
        if value2 == nil or tableEquals(value1, value2, ignore_mt) == false then
            return false
        end
        keySet[key1] = true
    end

    for key2, _ in pairs(o2) do
        if not keySet[key2] then return false end
    end
    return true
end

function tableFind(table, object)
    local found, foundKey = false, nil
    for k,v in pairs(table) do
        if (v == object) then
            found = true
            foundKey = k
        end
    end
    return {found, foundKey}
end

--STARGATE RELATED UTILS--

function detectInterface()
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

function getInfo(interface, interface_type)
    if (interface != nil) then
        local SG_generation = interface.getStargateGeneration()
        local SG_type = interface.getStargateType()
        local SG_energy = interface.getStargateEnergy()
    else 
        local SG_generation = nil
        local SG_type = nil
        local SG_energy = nil
    end
    local SG_address = nil
    if (interface_type == "advanced") then
        SG_address = interface.getLocalAddress()
    end
    return { SG_generation, SG_type, SG_energy, SG_address }
end

function dialAddress(targetAddress, interface, interface_type)
    if (targetAddress) then
        local addressLength = #targetAddress

        local start = interface.getChevronsEngaged() + 1

        for chevron = start, addressLength, 1
        do
            local symbol = tonumber(targetAddress[chevron])
            if (interface_type == "basic") then
                if chevron % 2 == 0 then
                    interface.rotateClockwise(symbol)
                else
                    interface.rotateAntiClockwise(symbol)
                end
                while (not interface.isCurrentSymbol(symbol))
                do
                    sleep(0)
                end
                sleep(0.1)
                interface.openChevron()
                interface.encodeChevron()
                sleep(0.1)
                interface.closeChevron()
            else
                if (interface_type ~= "basic") then
                    interface.engageSymbol(symbol)
                end
            end
        end
    end
end

function checkPlayer (range, playerDetector, username)
    return playerDetector.isPlayerInRange(range, username)
end

return {
    stringToTable = stringToTable,
    tableToString = tableToString,
    detectInterface = detectInterface,
    getInfo = getInfo,
    dialAddress = dialAddress,
    checkPlayer = checkPlayer,
    tableEquals = tableEquals,
    tableFind = tableFind
}
