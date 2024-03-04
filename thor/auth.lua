function authorize(list, interface, interface_type)
    local accepted = false
    if (os.pullEvent("stargate_incoming_wormhole") ~= nil) then
        if (interface.isStargateConnected()) then
            address = interface.getConnectedAddress()
            for k,v in pairs(list) do
                if (address == v) then
                    accepted = true
                end
            end
            if (not accepted) then
                sleep(2)
                interface.disconnectStargate()
            end
        end
    end
end

return {authorize = authorize}