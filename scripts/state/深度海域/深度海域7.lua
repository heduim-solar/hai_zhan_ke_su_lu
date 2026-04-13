local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 13,["29"] = 23,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 25,["34"] = 24,["35"] = 24,["36"] = 22,["37"] = 31,["38"] = 32,["39"] = 33,["40"] = 34,["41"] = 35,["42"] = 36,["46"] = 41,["47"] = 34,["48"] = 44,["49"] = 47,["51"] = 48,["52"] = 48,["53"] = 49,["54"] = 50,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 51,["60"] = 51,["61"] = 52,["62"] = 53,["63"] = 54,["64"] = 54,["65"] = 48,["68"] = 31,["69"] = 61,["70"] = 62,["71"] = 63,["72"] = 61,["73"] = 68,["74"] = 69,["75"] = 70,["76"] = 72,["77"] = 73,["78"] = 74,["79"] = 74,["80"] = 74,["81"] = 74,["82"] = 74,["83"] = 74,["84"] = 68});
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
local _____6DF1_5EA6_6D77_57DF7 = ____exports.default
_____6DF1_5EA6_6D77_57DF7.name = "深度海域7"
function _____6DF1_5EA6_6D77_57DF7.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF7.prototype["刷怪"] = function(self)
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
_____6DF1_5EA6_6D77_57DF7.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["提示聊天信息"](_____6D77_57DF_5DE5_5177, "得小心通过陷阱和机关。")
end
_____6DF1_5EA6_6D77_57DF7.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 14)
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
