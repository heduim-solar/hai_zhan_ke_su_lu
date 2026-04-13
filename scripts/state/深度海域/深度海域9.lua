local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 15,["33"] = 37,["34"] = 38,["35"] = 38,["36"] = 38,["37"] = 39,["38"] = 38,["39"] = 38,["40"] = 36,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 48,["45"] = 49,["46"] = 50,["47"] = 51,["48"] = 52,["52"] = 57,["53"] = 48,["54"] = 60,["55"] = 63,["56"] = 64,["57"] = 65,["58"] = 66,["59"] = 66,["60"] = 66,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 67,["65"] = 68,["66"] = 69,["67"] = 69,["68"] = 45,["69"] = 75,["70"] = 76,["71"] = 78,["72"] = 78,["73"] = 78,["74"] = 78,["75"] = 78,["76"] = 78,["77"] = 78,["78"] = 75,["79"] = 87,["80"] = 88,["81"] = 89,["82"] = 90,["83"] = 94,["84"] = 95,["85"] = 96,["87"] = 100,["88"] = 101,["89"] = 102,["90"] = 102,["91"] = 102,["92"] = 102,["93"] = 102,["94"] = 102,["95"] = 87});
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
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF9 = ____exports.default
_____6DF1_5EA6_6D77_57DF9.name = "深度海域9"
function _____6DF1_5EA6_6D77_57DF9.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF9.prototype["刷怪"] = function(self)
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[gv["深度海域层数"]].id
    local actorType = ActorTypeUtil:getActorType(actorUnitTypeId)
    actorType.onUnitDeath = function(____, actor, killingUnit)
        local data = XlsxDataUtil:getDataById("深海巨兽的灵魂碎片")
        MapUtil:addUsersArchive(1, data.requireKey, data.name)
        for ____, unit in ipairs(self.units) do
            if UnitStateUtil:isAlive(unit) then
                return
            end
        end
        self["击杀完毕"](self)
    end
    local _____5E73_5747_653B_51FB = MapUtil:getPlayerAllHeroStateVal({attack = 1})
    local line = MapRectUtil:getLine(gv["深度海域层数"])
    local v = line[5]
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
_____6DF1_5EA6_6D77_57DF9.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["提示聊天信息"](
        _____6D77_57DF_5DE5_5177,
        name .. "：这里……充斥着让人不爽的气息。",
        "未知的声音：啊……好难受……",
        name .. "：！！！",
        "绝望的深海巨兽：你们……变得和我一样吧！"
    )
end
_____6DF1_5EA6_6D77_57DF9.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 18)
    PlayerUtil:message("深海巨兽：谢谢……", 20)
    if RandomUtil.isInChance(0.1) then
        local data = XlsxDataUtil:getDataById("绝望之心")
        MapUtil:addUsersArchive(1, data.requireKey, data.name)
    end
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
