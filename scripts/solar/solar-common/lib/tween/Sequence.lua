local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 4,["11"] = 7,["13"] = 8,["14"] = 8,["15"] = 8,["16"] = 7,["17"] = 5});
local ____exports = {}
____exports.default = __TS__Class()
local Sequence = ____exports.default
Sequence.name = "Sequence"
function Sequence.prototype.____constructor(self)
end
function Sequence.nextId(self)
    local ____exports_default_0, ____nextId_1 = ____exports.default, "_nextId"
    local ____exports_default__nextId_2 = ____exports_default_0[____nextId_1]
    ____exports_default_0[____nextId_1] = ____exports_default__nextId_2 + 1
    return ____exports_default__nextId_2
end
Sequence._nextId = 0
return ____exports
