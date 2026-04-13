local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 10,["10"] = 10,["11"] = 10,["12"] = 10,["13"] = 10,["14"] = 11,["15"] = 10,["16"] = 10});
local ____exports = {}
local ____Group = require("solar.solar-common.lib.tween.Group")
local Group = ____Group.default
____exports.mainGroup = __TS__New(Group)
TimerStart(
    CreateTimer(),
    0.03,
    true,
    function()
        ____exports.mainGroup:update()
    end
)
return ____exports
