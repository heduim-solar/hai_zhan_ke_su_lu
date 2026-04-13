local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["16"] = 4,["17"] = 6,["18"] = 12,["19"] = 16,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 16,["25"] = 16,["26"] = 12});
local ____exports = {}
local ____EcsComponents = require("solar.solar-wc3.lib.ecs.EcsComponents")
local EcsComponents = ____EcsComponents.EcsComponents
local ____Ecs = require("solar.solar-wc3.lib.ecs.Ecs")
local System = ____Ecs.System
____exports.default = __TS__Class()
local TestSystem = ____exports.default
TestSystem.name = "TestSystem"
__TS__ClassExtends(TestSystem, System)
function TestSystem.prototype.____constructor(self)
    System.prototype.____constructor(self, {EcsComponents.type})
end
function TestSystem.prototype.update(self, time, delta, entity)
    DisplayTimedTextToPlayer(
        Player(0),
        0,
        0,
        60,
        (("TestSystem_update()！！！time=+" .. tostring(time)) .. " delta=") .. tostring(delta)
    )
end
return ____exports
