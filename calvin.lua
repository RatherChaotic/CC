utils = require("utils")
interface, interface_type = utils.detectInterface()
chat = peripheral.find("chatBox")
player = peripheral.find("playerDetector")
info = utils.getInfo(interface, interface_type)

function parseCommand()
   local event, username, message, uuid, isHidden = os.pullEvent("chat")
   local parseMessage = utils.stringToTable(message) 
   return parseMessage, username
end

function checkCommand(parseMessage, username)
   if (parseMessage[1] == ".calvin") then
      if (parseMessage[2] == "update") then
         interface, interface_type = utils.detectInterface()
         info = utils.getInfo(interface, interface_type)
      elseif (parseMessage[2] == "debug") then
         chat.sendMessage("Amodnugs:)")
      elseif (parseMessage[2] == "dial") then
         dialCommand(parseMessage, username)
      end
   end
end

function dialCommand(parseMessage, username)
   if (interface) then
      if (parseMessage[4] == nil and utils.checkPlayer(10, player, username)) then
         utils.dialAddress(utils.stringToTable(parseMessage[3], "%-"), interface, interface_type)
      elseif (info[4] ~= nil and parseMessage[3] ~= nil) then
         chat.sendMessage(tostring(utils.tableToString(info[4]) .. "\n" .. utils.tableToString(utils.stringToTable(parseMessage[3], "%-"))))
      end
   end
end
checkCommand(parseCommand())