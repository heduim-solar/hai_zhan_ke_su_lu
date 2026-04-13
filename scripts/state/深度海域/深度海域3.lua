local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 15,["33"] = 31,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 33,["38"] = 32,["39"] = 32,["40"] = 30,["41"] = 39,["42"] = 40,["43"] = 41,["44"] = 42,["45"] = 43,["46"] = 44,["47"] = 45,["51"] = 50,["52"] = 43,["53"] = 52,["54"] = 53,["55"] = 54,["56"] = 52,["57"] = 57,["59"] = 60,["60"] = 60,["61"] = 61,["62"] = 62,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 63,["69"] = 64,["70"] = 65,["71"] = 65,["72"] = 60,["75"] = 39,["76"] = 72,["77"] = 73,["78"] = 74,["79"] = 72,["80"] = 80,["81"] = 81,["82"] = 83,["83"] = 84,["84"] = 85,["85"] = 86,["86"] = 87,["87"] = 88,["89"] = 90,["90"] = 91,["91"] = 92,["92"] = 92,["93"] = 92,["94"] = 92,["95"] = 92,["96"] = 92,["97"] = 80});
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
local _____6DF1_5EA6_6D77_57DF3 = ____exports.default
_____6DF1_5EA6_6D77_57DF3.name = "深度海域3"
function _____6DF1_5EA6_6D77_57DF3.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF3.prototype["刷怪"] = function(self)
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
    do
        local i = 0
        while i < 1 do
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
_____6DF1_5EA6_6D77_57DF3.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message("祂的宠物哀嚎了，祂有些烦躁。", 20)
end
_____6DF1_5EA6_6D77_57DF3.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 6)
    local data = XlsxDataUtil:getDataById("红色触手的灵魂碎片")
    MapUtil:addUsersArchive(1, data.requireKey, data.name)
    if RandomUtil.isInChance(0.1) then
        local data = XlsxDataUtil:getDataById("忠诚之心")
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
