local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 13,["29"] = 35,["30"] = 36,["31"] = 36,["32"] = 36,["33"] = 37,["34"] = 36,["35"] = 36,["36"] = 34,["37"] = 43,["38"] = 44,["39"] = 45,["40"] = 46,["41"] = 47,["42"] = 48,["46"] = 53,["47"] = 46,["48"] = 56,["49"] = 59,["51"] = 60,["52"] = 60,["53"] = 61,["54"] = 62,["55"] = 63,["56"] = 63,["57"] = 63,["58"] = 63,["59"] = 63,["60"] = 63,["61"] = 64,["62"] = 65,["63"] = 66,["64"] = 66,["65"] = 60,["68"] = 43,["69"] = 73,["70"] = 74,["71"] = 82,["72"] = 82,["73"] = 82,["74"] = 82,["75"] = 82,["76"] = 82,["77"] = 82,["78"] = 82,["79"] = 73,["80"] = 93,["81"] = 94,["82"] = 95,["83"] = 97,["84"] = 98,["85"] = 99,["86"] = 99,["87"] = 99,["88"] = 99,["89"] = 99,["90"] = 99,["91"] = 93});
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
local _____6DF1_5EA6_6D77_57DF11 = ____exports.default
_____6DF1_5EA6_6D77_57DF11.name = "深度海域11"
function _____6DF1_5EA6_6D77_57DF11.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF11.prototype["刷怪"] = function(self)
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
_____6DF1_5EA6_6D77_57DF11.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["提示聊天信息"](
        _____6D77_57DF_5DE5_5177,
        name .. "：这里……我是在做梦吗？",
        name .. "：我们要怎样才能离开这里。",
        "女人的声音：你相信光吗？",
        name .. "：迪迦？",
        "女人：……这并不好笑，我意思是，如果能够重来一次，你还会敲碎那个东西吗？现在，做选择吧。"
    )
end
_____6DF1_5EA6_6D77_57DF11.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 22)
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
