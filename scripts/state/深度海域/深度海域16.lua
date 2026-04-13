local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 15,["33"] = 42,["34"] = 43,["35"] = 43,["36"] = 43,["37"] = 44,["38"] = 43,["39"] = 43,["40"] = 41,["41"] = 50,["42"] = 51,["43"] = 52,["44"] = 53,["45"] = 54,["46"] = 55,["50"] = 60,["51"] = 53,["52"] = 63,["53"] = 66,["55"] = 67,["56"] = 67,["57"] = 68,["58"] = 69,["59"] = 70,["60"] = 70,["61"] = 70,["62"] = 70,["63"] = 70,["64"] = 70,["65"] = 71,["66"] = 72,["67"] = 73,["68"] = 73,["69"] = 67,["72"] = 50,["73"] = 80,["74"] = 81,["75"] = 88,["76"] = 88,["77"] = 88,["78"] = 88,["79"] = 88,["80"] = 88,["81"] = 88,["82"] = 88,["83"] = 88,["84"] = 88,["85"] = 88,["86"] = 88,["87"] = 88,["88"] = 88,["89"] = 80,["90"] = 105,["91"] = 106,["92"] = 107,["93"] = 108,["94"] = 109,["95"] = 110,["96"] = 109,["97"] = 113,["98"] = 114,["99"] = 115,["100"] = 115,["101"] = 115,["102"] = 115,["103"] = 115,["104"] = 115,["105"] = 117,["106"] = 105});
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
local ____XlsxDataUtil = require("solar.solar-common.util.system.XlsxDataUtil")
local XlsxDataUtil = ____XlsxDataUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF16 = ____exports.default
_____6DF1_5EA6_6D77_57DF16.name = "深度海域16"
function _____6DF1_5EA6_6D77_57DF16.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF16.prototype["刷怪"] = function(self)
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
_____6DF1_5EA6_6D77_57DF16.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["提示聊天信息"](
        _____6D77_57DF_5DE5_5177,
        "未知的声音：她在引领你们，而你们却毫不知情。",
        name .. "：谁在讲话？",
        "未知的声音：无知的人无法见到我，你们也永远无法离开这里，除非……",
        name .. "：除非？",
        "未知的声音：帮我个忙。",
        "未知的声音：前往深空星海……这对你们有些困难。你们无法呼吸。",
        name .. "你可能在说骚话。",
        "未知的声音：我可以帮你们解决这个问题，并且给予一些奖励，但你们也要帮我解决一个家伙。",
        name .. "：解决谁？",
        "未知的声音：一个邪恶的家伙，比我邪恶无数倍……",
        "(获得了神话权柄+1。获得了在深空星海呼吸的能力。)"
    )
end
_____6DF1_5EA6_6D77_57DF16.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 32)
    local data = XlsxDataUtil:getDataById("神话权柄")
    PlayerUtil:forUsers(function(____, player)
        PlatUtil:addStoreInt(player, data.requireKey, 1)
    end)
    local vectors = MapRectUtil:getLine(gv["深度海域层数"])
    local vector = vectors[#vectors]
    local actorUnit = ActorUnitUtil:createActorUnit(
        Player(4),
        "深海奇珍",
        vector.x,
        vector.y
    )
    PlayerUtil:message("|cffff0000【深海已探索完毕(现版本)】深空星海。。。待续。。。。")
end
return ____exports
