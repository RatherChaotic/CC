utils = require("utils")
detector = peripheral.find("playerDetector")

playerList = detector.getOnlinePlayers()
infoList = {}
for k,v in pairs(playerList) do
    infoList[v] = detector.getPlayerPos(v)
end

term.write(infoList["RatherChaotic"]["x"])