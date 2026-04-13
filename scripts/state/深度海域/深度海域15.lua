local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 13,["29"] = 24,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 26,["34"] = 25,["35"] = 25,["36"] = 23,["37"] = 32,["38"] = 33,["39"] = 34,["40"] = 35,["41"] = 36,["42"] = 37,["46"] = 42,["47"] = 35,["48"] = 45,["49"] = 48,["50"] = 49,["51"] = 50,["52"] = 51,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 52,["59"] = 53,["60"] = 54,["61"] = 54,["62"] = 32,["63"] = 60,["64"] = 61,["65"] = 60,["66"] = 67,["67"] = 68,["68"] = 69,["69"] = 71,["70"] = 72,["71"] = 73,["72"] = 73,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 67});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MapRectUtil = require("util.MapRectUtil")
local MapRectUtil = ____MapRectUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local _____6DF1_5EA6_6D77_57DF_602A = require("xlsx.单位.深度海域怪")
local ____d__6DF1_5EA6_6D77_57DF_602A = _____6DF1_5EA6_6D77_57DF_602A["d_深度海域怪"]
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local _____6D77_57DF_5DE5_5177 = require("state.深度海域.海域工具")
local _____6D77_57DF_5DE5_5177 = _____6D77_57DF_5DE5_5177.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF15 = ____exports.default
_____6DF1_5EA6_6D77_57DF15.name = "深度海域15"
function _____6DF1_5EA6_6D77_57DF15.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF15.prototype["刷怪"] = function(self)
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[gv["深度海域层数"]].id
    local actorType = ActorTypeUtil:getActorType(actorUnitTypeId)
    actorType.onUnitDeath = function(____, actor, killingUnit)
        for ____, unit in ipairs(self.units) do
            if UnitStateUtil:isAlive(unit) then
                return
            end
        end
        self["击杀完毕"](self)
    end
    local _____5E73_5747_653B_51FB = MapUtil:getPlayerAllHeroStateVal({attack = 1})
    local line = MapRectUtil:getLine(gv["深度海域层数"])
    local v = line[4]
    local oneLoc = MapUtil:getOneWaterLocByXY(v.x, v.y)
    local actorUnit = ActorUnitUtil:createActorUnit(
        Player(11),
        actorUnitTypeId,
        oneLoc.x,
        oneLoc.y
    )
    MapUtil["根据难度数值加强怪物"](MapUtil, actorUnit.unit)
    UnitStateUtil:addMaxLifeAndLife(actorUnit.unit, _____5E73_5747_653B_51FB * 10 * gv["深度海域层数"])
    local ____self_units_0 = self.units
    ____self_units_0[#____self_units_0 + 1] = actorUnit.unit
end
_____6DF1_5EA6_6D77_57DF15.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
end
_____6DF1_5EA6_6D77_57DF15.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 30)
    local vectors = MapRectUtil:getLine(gv["深度海域层数"])
    local vector = vectors[#vectors]
    local actorUnit = ActorUnitUtil:createActorUnit(
        Player(4),
        "深海奇珍",
        vector.x,
        vector.y
    )
end
return ____exports
