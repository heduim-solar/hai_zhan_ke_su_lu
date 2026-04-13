local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["16"] = 4,["17"] = 6,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 16,["24"] = 12});
local ____exports = {}
local ____Ecs = require("solar.solar-wc3.lib.ecs.Ecs")
local System = ____Ecs.System
local ____EntityDecayCom = require("solar.solar-wc3.lib.ecs.EntityDecayCom")
local EntityDecayCom = ____EntityDecayCom.default
____exports.default = __TS__Class()
local EntityDecaySystem = ____exports.default
EntityDecaySystem.name = "EntityDecaySystem"
__TS__ClassExtends(EntityDecaySystem, System)
function EntityDecaySystem.prototype.____constructor(self)
    System.prototype.____constructor(self, {EntityDecayCom.type})
end
function EntityDecaySystem.prototype.update(self, time, delta, entity)
    local entityDecayCom = EntityDecayCom:oneFrom(entity)
    entityDecayCom.data.lifeTime = entityDecayCom.data.lifeTime - delta
    if entityDecayCom.data.lifeTime <= 0 then
        self.world:removeEntity(entity)
    end
end
return ____exports
