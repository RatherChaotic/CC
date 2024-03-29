utils = require("utils")
interface, interface_type = utils.detectInterface()
chat = peripheral.find("chatBox")
player = peripheral.find("playerDetector")
info = utils.getInfo(interface, interface_type)
list = textutils.unserialiseJSON(http.get("https://raw.githubusercontent.com/RatherChaotic/CC/main/thor/list.json").readAll())
function parseCommand()
   local event, username, message, uuid, isHidden = os.pullEvent("chat")
   local parseMessage = utils.stringToTable(message) 
   return parseMessage, username
end

function checkCommand(parseMessage, username)
   if (parseMessage[1] == ".thor") then
      if (parseMessage[2] == "update") then
         interface, interface_type = utils.detectInterface()
         info = utils.getInfo(interface, interface_type)
      elseif (parseMessage[2] == "debug") then
         debug(parseMessage, username)
      elseif (parseMessage[2] == "dial") then
         dialCommand(parseMessage, username)
      elseif (parseMessage[2] == "disconnect" or parseMessage[2] == "disc") then
         discCommand(parseMessage, username)
      end
   end
end

function dialCommand(parseMessage, username)
   if (interface) then
      if (utils.checkPlayer(10, player, username) or parseMessage[3] == tostring(os.getComputerID()) or parseMessage[3] == os.getComputerLabel()) then
         if (parseMessage[4] == nil) then
            if (list[parseMessage[3]] ~= nil) then
               utils.dialAddress(list[parseMessage[3]], interface, interface_type)
            else
               utils.dialAddress(utils.stringToTable(parseMessage[3], "-"), interface, interface_type)
            end
         else
            if (list[parseMessage[4]] ~= nil) then
               utils.dialAddress(list[parseMessage[4]], interface, interface_type)
            else
               utils.dialAddress(utils.stringToTable(parseMessage[4], "-"), interface, interface_type)
            end
         end
      elseif (info[4] ~= nil and parseMessage[4] ~= nil and utils.tableToString(info[4]) == utils.tableToString(utils.stringToTable(parseMessage[3], "-"))) then
         if (list[parseMessage[4]] ~= nil) then
            utils.dialAddress(list[parseMessage[4]], interface, interface_type)
         else
            utils.dialAddress(utils.stringToTable(parseMessage[4], "-"), interface, interface_type)
         end
      end
   end
end

function discCommand(parseMessage, username)
   if (interface) then
      if (utils.checkPlayer(10, player, username) or (parseMessage[3] == tostring(os.getComputerID())) or (parseMessage[3] == os.getComputerLabel())) then
         interface.disconnectStargate()
      elseif (info[4] ~= nil and parseMessage[3] ~= nil and utils.tableToString(info[4]) == utils.tableToString(utils.stringToTable(parseMessage[3], "-")) ) then
         interface.disconnectStargate()
      end
   end
end

function debug(parseMessage, username)
   term.write(os.getComputerID())
end
while (true) do
   checkCommand(parseCommand())
end