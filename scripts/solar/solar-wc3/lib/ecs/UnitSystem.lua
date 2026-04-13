local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["16"] = 4,["17"] = 6,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 16,["24"] = 12});
local ____exports = {}
local ____Ecs = require("solar.solar-wc3.lib.ecs.Ecs")
local System = ____Ecs.System
local ____UnitCom = require("solar.solar-wc3.lib.ecs.UnitCom")
local UnitCom = ____UnitCom.default
____exports.default = __TS__Class()
local UnitSystem = ____exports.default
UnitSystem.name = "UnitSystem"
__TS__ClassExtends(UnitSystem, System)
function UnitSystem.prototype.____constructor(self)
    System.prototype.____constructor(self, {UnitCom.type}, 1000)
end
function UnitSystem.prototype.update(self, time, delta, entity)
    local u = UnitCom:oneFrom(entity).data.value
    if not u:isHero() and not u:isAlive() then
        u:destroy()
        self.world:removeEntity(entity)
    end
end
return ____exports
