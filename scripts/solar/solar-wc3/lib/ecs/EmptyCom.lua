local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 4});
local ____exports = {}
local ____Ecs = require("solar.solar-wc3.lib.ecs.Ecs")
local Component = ____Ecs.Component
____exports.default = Component:register()
return ____exports
