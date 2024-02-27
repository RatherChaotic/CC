function detectInterface ()
    local basic = peripheral.find("basic_interface")
    local crystal = peripheral.find("crystal_interface")
    local advanced = peripheral.find("advanced_crystal_interface")
    if advanced then
        active = advanced
    elseif crystal then
        active = crystal
    elseif basic then
        active = basic
    else
        active = nil
    end
    return active
end

function getInfo (interface)
    local SG_generation = interface.getStargateGeneration()
    local SG_type = interface.getStargateType()
    local SG_energy = interface.getStargateEnergy()
    local SG_address = interface.getLocalAddress()

    return {SG_generation, SG_type, SG_energy, SG_address}
end
return {detectInterface = detectInterface, getInfo = getInfo}