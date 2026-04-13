local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 12,["27"] = 12,["28"] = 12,["30"] = 14,["31"] = 43,["32"] = 44,["33"] = 44,["34"] = 44,["35"] = 45,["36"] = 44,["37"] = 44,["38"] = 42,["39"] = 51,["40"] = 52,["41"] = 53,["42"] = 54,["43"] = 55,["44"] = 56,["45"] = 57,["46"] = 58,["50"] = 63,["51"] = 54,["52"] = 66,["53"] = 69,["55"] = 70,["56"] = 70,["57"] = 71,["58"] = 72,["59"] = 73,["60"] = 73,["61"] = 73,["62"] = 73,["63"] = 73,["64"] = 73,["65"] = 74,["66"] = 75,["67"] = 76,["68"] = 76,["69"] = 70,["72"] = 51,["73"] = 83,["74"] = 84,["75"] = 85,["76"] = 85,["77"] = 85,["78"] = 85,["79"] = 85,["80"] = 85,["81"] = 85,["82"] = 85,["83"] = 85,["84"] = 85,["85"] = 85,["86"] = 85,["87"] = 85,["88"] = 85,["89"] = 85,["90"] = 85,["91"] = 85,["92"] = 83,["93"] = 106,["94"] = 107,["95"] = 108,["96"] = 110,["97"] = 111,["98"] = 112,["99"] = 112,["100"] = 112,["101"] = 112,["102"] = 112,["103"] = 112,["104"] = 106});
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
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF12 = ____exports.default
_____6DF1_5EA6_6D77_57DF12.name = "深度海域12"
function _____6DF1_5EA6_6D77_57DF12.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF12.prototype["刷怪"] = function(self)
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[gv["深度海域层数"]].id
    local actorType = ActorTypeUtil:getActorType(actorUnitTypeId)
    actorType.onUnitDeath = function(____, actor, killingUnit)
        local data = XlsxDataUtil:getDataById("大副的灵魂碎片")
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
_____6DF1_5EA6_6D77_57DF12.prototype["对话"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["提示聊天信息"](
        _____6D77_57DF_5DE5_5177,
        name .. "：这里……",
        name .. "：这里是我以前呆过的码头！",
        "大副：嗨嗨嗨，那边那个新来的，还不赶紧去砍树，敌人都要打过来了！",
        name .. "：是……大副！天哪，到底怎么回事。",
        "(大副早在二十年前就因为战乱去世了，在这里重逢，本应去问个清楚，但是身体似乎被什么东西给控制住，只得先去砍树了。)",
        "(右键点击树就可以砍树啦，注意找到不合理的地方。\n" .. "砍10次可以得到一捆木头，这一关有一棵树是砍不坏的，然后这棵树后面都是假场景，实际上是一条路，其他树10下就倒了。对着砍不坏的那棵树砍20次。)",
        "这棵树似乎砍不倒……",
        "大副：哪有树是砍不倒的啊……",
        name .. "：大副？",
        "大副：你现在都已经是船长了，很高兴再次见到你。这颗树，我来帮你砍。",
        name .. "：！！！不！",
        "大副：呃……没关系，我是个懦夫，我不敢再往前了……",
        "大副：再会……启航吧！",
        "（顺着大副引领的路前进吧。）"
    )
end
_____6DF1_5EA6_6D77_57DF12.prototype["击杀完毕"] = function(self)
    local name = GetPlayerName(PlayerUtil:firstOfUsers())
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 24)
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
