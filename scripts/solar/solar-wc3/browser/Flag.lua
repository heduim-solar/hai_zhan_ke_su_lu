local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 11,["16"] = 12});
local ____exports = {}
____exports.default = __TS__Class()
local Flag = ____exports.default
Flag.name = "Flag"
function Flag.prototype.____constructor(self)
end
Flag.ENGINE_DISABLE_GPU = 1 << 0
Flag.ENGINE_ENABLE_GPU_WEBGL = 1 << 1
Flag.ENGINE_SINGLE_PROCESS = 1 << 2
Flag.ENGINE_ENABLE_COOKIES = 1 << 3
Flag.VIEW_NEW_WINDOW = 1 << 0
Flag.VIEW_DISABLE_TRANSPARENT = 1 << 1
return ____exports
