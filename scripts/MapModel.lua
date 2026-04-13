local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 12});
local ____exports = {}
local MapModel = MapModel or ({})
MapModel["模式0_教学模式"] = "教学模式"
MapModel["模式1_普通模式"] = "普通模式"
MapModel["模式2_寄生模式"] = "寄生模式"
MapModel["模式3_献祭模式"] = "献祭模式"
MapModel["模式4_真实难度"] = "真实难度"
____exports.default = MapModel
return ____exports
