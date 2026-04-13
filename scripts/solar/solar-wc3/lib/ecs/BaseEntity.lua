local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 4,["16"] = 7,["17"] = 4,["18"] = 9,["19"] = 10,["21"] = 7});
local ____exports = {}
local ____Ecs = require("solar.solar-wc3.lib.ecs.Ecs")
local Entity = ____Ecs.Entity
local ____EntityDecayCom = require("solar.solar-wc3.lib.ecs.EntityDecayCom")
local EntityDecayCom = ____EntityDecayCom.default
____exports.default = __TS__Class()
local BaseEntity = ____exports.default
BaseEntity.name = "BaseEntity"
__TS__ClassExtends(BaseEntity, Entity)
function BaseEntity.prototype.____constructor(self, lifeTime)
    Entity.prototype.____constructor(self)
    if lifeTime then
        self:add(__TS__New(EntityDecayCom, {lifeTime = lifeTime}))
    end
end
return ____exports
