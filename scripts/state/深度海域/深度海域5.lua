local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 15,["33"] = 41,["34"] = 42,["35"] = 42,["36"] = 42,["37"] = 43,["38"] = 42,["39"] = 42,["40"] = 40,["41"] = 49,["42"] = 50,["43"] = 51,["44"] = 52,["45"] = 53,["46"] = 54,["47"] = 55,["49"] = 57,["50"] = 58,["54"] = 63,["55"] = 52,["56"] = 65,["57"] = 66,["58"] = 67,["59"] = 65,["60"] = 70,["61"] = 73,["63"] = 74,["64"] = 74,["65"] = 75,["66"] = 76,["67"] = 77,["68"] = 77,["69"] = 77,["70"] = 77,["71"] = 77,["72"] = 77,["73"] = 78,["74"] = 79,["75"] = 80,["76"] = 80,["77"] = 74,["80"] = 49,["81"] = 87,["82"] = 88,["83"] = 89,["84"] = 92,["85"] = 92,["86"] = 92,["87"] = 93,["88"] = 92,["89"] = 92,["90"] = 98,["91"] = 98,["92"] = 98,["93"] = 99,["94"] = 98,["95"] = 98,["96"] = 87,["97"] = 107,["98"] = 108,["99"] = 109,["100"] = 111,["101"] = 112,["102"] = 113,["103"] = 113,["104"] = 113,["105"] = 113,["106"] = 113,["107"] = 113,["108"] = 107});
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
local _____6DF1_5EA6_6D77_57DF5 = ____exports.default
_____6DF1_5EA6_6D77_57DF5.name = "深度海域5"
function _____6DF1_5EA6_6D77_57DF5.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF5.prototype["刷怪"] = function(self)
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[gv["深度海域层数"]].id
    local actorType = ActorTypeUtil:getActorType(actorUnitTypeId)
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if RandomUtil.isInChance(0.01) then
            local data = XlsxDataUtil:getDataById("血色之心")
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
_____6DF1_5EA6_6D77_57DF5.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    PlayerUtil:message(("鸡：嘎嘎！嘎\n" .. "羊：哞哞！\n") .. "狗：喵！喵喵", 20)
    BaseUtil.runLater(
        3,
        function()
            PlayerUtil:message((("小孩：爸爸妈妈真令人操心，以后的日子可怎么办。\n" .. "男人：呜呜呜，日子没法过啦。\n") .. "女人：无聊。\n") .. "老人：桃源村真是太美好了，外地人，你觉得呢？", 20)
        end
    )
    BaseUtil.runLater(
        6,
        function()
            PlayerUtil:message(("女人：……\n" .. "女人：被发现了？你不应该发现的，你不知道你即将面对什么。\n") .. "女人：你会害怕的，不是吗？", 20)
        end
    )
end
_____6DF1_5EA6_6D77_57DF5.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 10)
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
