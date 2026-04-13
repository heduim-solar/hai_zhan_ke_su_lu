local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 13,["29"] = 29,["30"] = 30,["31"] = 30,["32"] = 30,["33"] = 31,["34"] = 30,["35"] = 30,["36"] = 28,["37"] = 37,["38"] = 38,["39"] = 39,["40"] = 40,["41"] = 41,["42"] = 42,["43"] = 43,["47"] = 48,["48"] = 41,["49"] = 50,["50"] = 51,["51"] = 52,["52"] = 50,["53"] = 55,["54"] = 58,["56"] = 59,["57"] = 59,["58"] = 60,["59"] = 61,["60"] = 62,["61"] = 62,["62"] = 62,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 63,["67"] = 64,["68"] = 65,["69"] = 65,["70"] = 59,["73"] = 37,["74"] = 72,["75"] = 73,["76"] = 74,["77"] = 75,["78"] = 76,["79"] = 77,["80"] = 72,["81"] = 81,["82"] = 82,["83"] = 83,["84"] = 84,["85"] = 86,["86"] = 87,["87"] = 88,["88"] = 88,["89"] = 88,["90"] = 88,["91"] = 88,["92"] = 88,["93"] = 81});
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
local _____6DF1_5EA6_6D77_57DF4 = ____exports.default
_____6DF1_5EA6_6D77_57DF4.name = "深度海域4"
function _____6DF1_5EA6_6D77_57DF4.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF4.prototype["刷怪"] = function(self)
    local rect = MapRectUtil:getRect(gv["深度海域层数"])
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
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        UnitStateUtil:addUnitLifeByMaxLifeP(actor.unit, -0.01)
        event.consumed = true
    end
    local _____5E73_5747_653B_51FB = MapUtil:getPlayerAllHeroStateVal({attack = 1})
    local line = MapRectUtil:getLine(gv["深度海域层数"])
    do
        local i = 3
        while i < #line - 1 do
            local v = line[i + 1]
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
            i = i + 1
        end
    end
end
_____6DF1_5EA6_6D77_57DF4.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message("心悸的感觉", 20)
    PlayerUtil:message("混乱的感觉", 20)
    PlayerUtil:message("不安……", 20)
    PlayerUtil:message("总觉得有不好的事情会发生。。", 20)
end
_____6DF1_5EA6_6D77_57DF4.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message("抵达终点，真的还要继续前进吗？", 20)
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 8)
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
