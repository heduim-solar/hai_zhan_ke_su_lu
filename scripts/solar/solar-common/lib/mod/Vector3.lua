local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 7,["10"] = 8,["11"] = 9,["12"] = 10,["13"] = 7});
local ____exports = {}
____exports.default = __TS__Class()
local Vector3 = ____exports.default
Vector3.name = "Vector3"
function Vector3.prototype.____constructor(self, x, y, z)
    self.x = x
    self.y = y
    self.z = z
end
return ____exports
