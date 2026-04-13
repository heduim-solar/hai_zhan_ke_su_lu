local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 13,["29"] = 27,["30"] = 28,["31"] = 28,["32"] = 28,["33"] = 29,["34"] = 28,["35"] = 28,["36"] = 26,["37"] = 35,["38"] = 36,["39"] = 37,["40"] = 38,["41"] = 39,["42"] = 40,["43"] = 41,["47"] = 46,["48"] = 39,["49"] = 48,["50"] = 49,["51"] = 50,["52"] = 48,["53"] = 53,["55"] = 56,["56"] = 56,["57"] = 57,["58"] = 58,["59"] = 58,["60"] = 58,["61"] = 58,["62"] = 58,["63"] = 58,["64"] = 59,["65"] = 60,["66"] = 61,["67"] = 61,["68"] = 56,["71"] = 35,["72"] = 68,["73"] = 69,["74"] = 70,["75"] = 72,["76"] = 72,["77"] = 72,["78"] = 73,["79"] = 72,["80"] = 72,["81"] = 68,["82"] = 78,["83"] = 79,["84"] = 80,["85"] = 82,["86"] = 84,["87"] = 85,["88"] = 86,["89"] = 86,["90"] = 86,["91"] = 86,["92"] = 86,["93"] = 86,["94"] = 78});
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
local _____6DF1_5EA6_6D77_57DF2 = ____exports.default
_____6DF1_5EA6_6D77_57DF2.name = "深度海域2"
function _____6DF1_5EA6_6D77_57DF2.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF2.prototype["刷怪"] = function(self)
    local rect = MapRectUtil:getRect(gv["深度海域层数"])
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[2].id
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
    do
        local i = 0
        while i < 6 do
            local oneLoc = MapUtil:getOneWaterLoc(rect)
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
_____6DF1_5EA6_6D77_57DF2.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message(name .. "：这里是什么地方？ ", 20)
    BaseUtil.runLater(
        3,
        function()
            PlayerUtil:message(name .. "：看来得干掉他们了。", 20)
        end
    )
end
_____6DF1_5EA6_6D77_57DF2.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message(name .. "：获得了莫名的关注，感觉有些背脊发凉。", 20)
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 4)
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
