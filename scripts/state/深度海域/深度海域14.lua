local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 13,["29"] = 37,["30"] = 38,["31"] = 38,["32"] = 38,["33"] = 39,["34"] = 38,["35"] = 38,["36"] = 36,["37"] = 45,["38"] = 46,["39"] = 47,["40"] = 48,["41"] = 49,["42"] = 50,["46"] = 55,["47"] = 48,["48"] = 58,["49"] = 61,["51"] = 62,["52"] = 62,["53"] = 63,["54"] = 64,["55"] = 65,["56"] = 65,["57"] = 65,["58"] = 65,["59"] = 65,["60"] = 65,["61"] = 66,["62"] = 67,["63"] = 68,["64"] = 68,["65"] = 62,["68"] = 45,["69"] = 75,["70"] = 76,["71"] = 79,["72"] = 79,["73"] = 79,["74"] = 79,["75"] = 79,["76"] = 79,["77"] = 79,["78"] = 79,["79"] = 79,["80"] = 79,["81"] = 79,["82"] = 79,["83"] = 79,["84"] = 79,["85"] = 75,["86"] = 96,["87"] = 97,["88"] = 98,["89"] = 100,["90"] = 101,["91"] = 102,["92"] = 102,["93"] = 102,["94"] = 102,["95"] = 102,["96"] = 102,["97"] = 96});
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
local _____6DF1_5EA6_6D77_57DF14 = ____exports.default
_____6DF1_5EA6_6D77_57DF14.name = "深度海域14"
function _____6DF1_5EA6_6D77_57DF14.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF14.prototype["刷怪"] = function(self)
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
_____6DF1_5EA6_6D77_57DF14.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["提示聊天信息"](
        _____6D77_57DF_5DE5_5177,
        "女人：欢迎来到拉莱耶的入口，这次是真的。",
        name .. "：什么意思？",
        "女人：如你所见，你曾经在这里战斗过。只不过此前你进入的地方已经被完全污染了。可惜，那位大副如果能走到这里。",
        name .. "：他是为了给我指引前路。",
        "女人：一条他想都不敢想的前路。",
        name .. "：？",
        "女人：真是冷漠，不过你的确符合成为一个神话生物的潜质。",
        name .. "：什么！神话生物？",
        "女人：无端被卷入神话生物的战场，既是幸运，也是不幸",
        "女人：你永远不知道！也永远不会体会这样的感受！或许大副的死亡能让你有些许涟漪，但！远远不够！",
        "(她似乎对此愤怒又无助。)"
    )
end
_____6DF1_5EA6_6D77_57DF14.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 28)
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
