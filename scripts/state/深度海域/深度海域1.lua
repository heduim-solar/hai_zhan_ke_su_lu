local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 15,["33"] = 15,["34"] = 15,["36"] = 17,["37"] = 37,["38"] = 38,["39"] = 38,["40"] = 38,["41"] = 39,["42"] = 38,["43"] = 38,["44"] = 36,["45"] = 45,["46"] = 46,["47"] = 47,["48"] = 48,["49"] = 49,["50"] = 50,["51"] = 52,["52"] = 57,["53"] = 58,["54"] = 59,["55"] = 60,["56"] = 61,["57"] = 62,["59"] = 59,["60"] = 65,["62"] = 69,["63"] = 70,["67"] = 75,["68"] = 50,["69"] = 80,["71"] = 84,["72"] = 84,["73"] = 85,["74"] = 86,["75"] = 86,["76"] = 86,["77"] = 86,["78"] = 86,["79"] = 86,["80"] = 87,["81"] = 88,["82"] = 88,["83"] = 89,["84"] = 84,["87"] = 45,["88"] = 96,["89"] = 97,["90"] = 98,["91"] = 99,["92"] = 96,["93"] = 103,["94"] = 104,["95"] = 105,["96"] = 105,["97"] = 105,["98"] = 105,["99"] = 107,["100"] = 108,["101"] = 108,["102"] = 108,["103"] = 108,["104"] = 108,["105"] = 108,["106"] = 103});
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
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF1 = ____exports.default
_____6DF1_5EA6_6D77_57DF1.name = "深度海域1"
function _____6DF1_5EA6_6D77_57DF1.prototype.____constructor(self)
    self.units = {}
    self["对话"](self)
    BaseUtil.runLater(
        3,
        function()
            self["刷怪"](self)
        end
    )
end
_____6DF1_5EA6_6D77_57DF1.prototype["刷怪"] = function(self)
    local rect = MapRectUtil:getRect(gv["深度海域层数"])
    local actorUnitTypeId = ____d__6DF1_5EA6_6D77_57DF_602A[1].id
    local actorType = ActorTypeUtil:getActorType(actorUnitTypeId)
    local _____5DF2_6389_6570_91CF = 0
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if RandomUtil.isInChance(0.15) or settings.gameMode == MapModel["模式2_寄生模式"] and _____5DF2_6389_6570_91CF < 1 or settings.gameMode == MapModel["模式3_献祭模式"] and _____5DF2_6389_6570_91CF < 2 or settings.gameMode == MapModel["模式4_真实难度"] and _____5DF2_6389_6570_91CF < 3 then
            local data = XlsxDataUtil:getDataById("历史中的战舰碎片")
            _____5DF2_6389_6570_91CF = _____5DF2_6389_6570_91CF + 1
            PlayerUtil:forUsers(function(____, player)
                local flag = PlatUtil:addStoreInt(player, data.requireKey, 1)
                if flag == false then
                    PlayerUtil:message("|cffffff00【存档规则提示】每局战舰碎片最多5！每天战舰碎片最多50。超过会保存失败！", 10, player)
                end
            end)
            PlayerUtil:message((("|cff00ff00【存档】获得" .. data.name) .. "+") .. 1)
        end
        for ____, unit in ipairs(self.units) do
            if UnitStateUtil:isAlive(unit) then
                return
            end
        end
        self["击杀完毕"](self)
    end
    local _____5E73_5747_653B_51FB = MapUtil:getPlayerAllHeroStateVal({attack = 1})
    do
        local i = 0
        while i < 12 do
            local oneLoc = MapUtil:getOneWaterLoc(rect)
            local actorUnit = ActorUnitUtil:createActorUnit(
                Player(11),
                actorUnitTypeId,
                oneLoc.x,
                oneLoc.y
            )
            MapUtil["根据难度数值加强怪物"](MapUtil, actorUnit.unit)
            local ____self_units_0 = self.units
            ____self_units_0[#____self_units_0 + 1] = actorUnit.unit
            UnitStateUtil:addMaxLifeAndLife(actorUnit.unit, _____5E73_5747_653B_51FB * 10 * gv["深度海域层数"])
            i = i + 1
        end
    end
end
_____6DF1_5EA6_6D77_57DF1.prototype["对话"] = function(self)
    PlayerUtil:message("破碎的木船：你……怎么也到这里来了？", 20)
    PlayerUtil:message("破碎的木船：！！！", 20)
    PlayerUtil:message("破碎的木船：快走啊！", 20)
end
_____6DF1_5EA6_6D77_57DF1.prototype["击杀完毕"] = function(self)
    _____6D77_57DF_5DE5_5177["增加玩家探索积分"](_____6D77_57DF_5DE5_5177, 2)
    PlayerUtil:message(
        GetPlayerName(PlayerUtil:firstOfUsers()) .. "：他们莫非是……此前到过这里的船长们？如果不小心，我们也会成为他们的一员吧。",
        20
    )
    local vectors = MapRectUtil:getLine(gv["深度海域层数"])
    local actorUnit = ActorUnitUtil:createActorUnit(
        Player(4),
        "深海奇珍",
        vectors[3].x,
        vectors[3].y
    )
end
return ____exports
