local functions = require("functions")

term.write(functions.detectInterface().addressToString(functions.getInfo(functions.detectInterface())[4]))