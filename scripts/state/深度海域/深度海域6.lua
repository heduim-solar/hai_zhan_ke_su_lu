local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 15,["33"] = 36,["34"] = 37,["35"] = 37,["36"] = 37,["37"] = 38,["38"] = 37,["39"] = 37,["40"] = 35,["41"] = 44,["42"] = 45,["43"] = 46,["44"] = 47,["45"] = 48,["46"] = 49,["47"] = 50,["49"] = 52,["50"] = 53,["54"] = 58,["55"] = 47,["56"] = 60,["57"] = 61,["58"] = 62,["59"] = 60,["60"] = 65,["61"] = 68,["63"] = 69,["64"] = 69,["65"] = 70,["66"] = 71,["67"] = 72,["68"] = 72,["69"] = 72,["70"] = 72,["71"] = 72,["72"] = 72,["73"] = 73,["74"] = 74,["75"] = 75,["76"] = 75,["77"] = 69,["80"] = 44,["81"] = 82,["82"] = 83,["83"] = 84,["84"] = 87,["85"] = 87,["86"] = 87,["87"] = 88,["88"] = 87,["89"] = 87,["90"] = 90,["91"] = 90,["92"] = 90,["93"] = 93,["94"] = 94,["95"] = 95,["96"] = 96,["97"] = 90,["98"] = 90,["99"] = 82,["100"] = 102,["101"] = 103,["102"] = 104,["103"] = 106,["104"] = 107,["105"] = 108,["106"] = 108,["107"] = 108,["108"] = 108,["109"] = 108,["110"] = 108,["111"] = 102});
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
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____XlsxDataUtil = require("solar.solar-common.util.system.XlsxDataUtil")
local XlsxDataUtil = ____XlsxDataUtil.default
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF6 = ____exports.default
_____6DF1_5EA6_6D77_57DF6.name = "深度海域6"
function _____6DF1_5EA6_6D77_57DF6.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF6.prototype["刷怪"] = function(self)
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[gv["深度海域层数"]].id
    local actorType = ActorTypeUtil:getActorType(actorUnitTypeId)
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if RandomUtil.isInChance(0.02) then
            local data = XlsxDataUtil:getDataById("污染之心")
            MapUtil:addUsersArchive(1, data.requireKey, data.name)
        end
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
_____6DF1_5EA6_6D77_57DF6.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message(((name .. ":原来这里的一切都是假的吗\r\n") .. "女人的声音：不，不全是，比如……\r\n") .. "女人的声音：我就是真的。", 20)
    BaseUtil.runLater(
        3,
        function()
            PlayerUtil:message(name .. "：你想干什么！", 20)
        end
    )
    BaseUtil.runLater(
        6,
        function()
            PlayerUtil:message("女人：我们已经见过面了，我指的是，在你来到这片海域之前。", 20)
            PlayerUtil:message(name .. "：这里到底是哪里。", 20)
            PlayerUtil:message("女人：哪里都不是，去找一些悲怆的记忆吧，带着它们，离开这里。", 20)
            PlayerUtil:message("(从这里的怪物身上搜集悲怆记忆吧，站远些就没关系)", 20)
        end
    )
end
_____6DF1_5EA6_6D77_57DF6.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 12)
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
