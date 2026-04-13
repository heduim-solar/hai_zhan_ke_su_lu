local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 1,["8"] = 6});
local ____exports = {}
local function now(self)
    return _g_time
end
____exports.default = now
return ____exports
