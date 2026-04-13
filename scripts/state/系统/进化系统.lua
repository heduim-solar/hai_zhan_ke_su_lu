local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 19,["24"] = 19,["25"] = 19,["27"] = 29,["28"] = 30,["29"] = 31,["32"] = 34,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 40,["38"] = 41,["41"] = 45,["42"] = 46,["45"] = 49,["46"] = 51,["49"] = 54,["50"] = 55,["51"] = 40,["52"] = 27,["53"] = 76,["54"] = 77,["55"] = 78,["56"] = 79,["57"] = 80,["60"] = 83,["61"] = 84,["62"] = 85,["63"] = 86,["64"] = 87,["65"] = 88,["66"] = 89,["68"] = 93,["69"] = 94,["70"] = 95,["73"] = 98,["74"] = 99,["75"] = 76,["76"] = 21,["77"] = 22,["78"] = 23,["79"] = 24,["80"] = 25});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local _____73A9_5BB6_82F1_96C4_8239 = require("xlsx.单位.玩家英雄船")
local ____d__73A9_5BB6_82F1_96C4_8239 = _____73A9_5BB6_82F1_96C4_8239["d_玩家英雄船"]
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MapHeroUtil = require("util.MapHeroUtil")
local MapHeroUtil = ____MapHeroUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local _____8FDB_5316_7CFB_7EDF = ____exports.default
_____8FDB_5316_7CFB_7EDF.name = "进化系统"
function _____8FDB_5316_7CFB_7EDF.prototype.____constructor(self)
    ____exports.default["d_随机出现英雄"] = ArrayUtil:selectByWhere(____d__73A9_5BB6_82F1_96C4_8239, "ly_来源", "随机出现")
    for ____, ____d_968F_673A_51FA_73B0_82F1_96C4Element in ipairs(____exports.default["d_随机出现英雄"]) do
        if ____d_968F_673A_51FA_73B0_82F1_96C4Element.index > 55 then
            break
        end
        ____exports.default["d_随机出现英雄权重1"][____d_968F_673A_51FA_73B0_82F1_96C4Element.id] = ____d_968F_673A_51FA_73B0_82F1_96C4Element["sjcxgl_随机出现概率"] or 1
    end
    ____exports.default["d_随机出现英雄权重2"] = __TS__ObjectAssign({}, ____exports.default["d_随机出现英雄权重1"])
    ____exports.default["d_随机出现英雄权重3"] = __TS__ObjectAssign({}, ____exports.default["d_随机出现英雄权重1"])
    ____exports.default["d_随机出现英雄权重4"] = __TS__ObjectAssign({}, ____exports.default["d_随机出现英雄权重1"])
    se:onHeroLevelUp(function(e)
        if e.trigUnitOwnerId > 3 then
            return
        end
        local playerData = DataBase:getPlayerSolarData(e.trigUnitOwner, true)
        if playerData["正在进化"] then
            return
        end
        local unitOwner = e.trigUnitOwner
        if ActorAbilityUtil:getUnitActorAbilityListSize(e.trigUnit, "主炮") >= 4 then
            return
        end
        playerData["jhcs_进化次数"] = (playerData["jhcs_进化次数"] or 0) + 1
        ____exports.default["do进化"](____exports.default, unitOwner, playerData["jhcs_进化次数"])
    end)
end
_____8FDB_5316_7CFB_7EDF["do进化"] = function(self, player, lv)
    local playerId = GetPlayerId(player)
    local oldHero = SelectUtil.getAnHero(playerId)
    if ActorAbilityUtil:getUnitActorAbilityListSize(oldHero, "主炮") >= 4 then
        PlayerUtil:message("你的英雄已经拥有4个主炮了！无法进化!", 10, player)
        return
    end
    local keyW = ____exports.default["d_随机出现英雄权重1"]
    if playerId == 1 then
        keyW = ____exports.default["d_随机出现英雄权重2"]
    elseif playerId == 2 then
        keyW = ____exports.default["d_随机出现英雄权重3"]
    elseif playerId == 3 then
        keyW = ____exports.default["d_随机出现英雄权重4"]
    end
    local randomHeroId = RandomUtil.getRandomKeyByWeight(keyW)
    if randomHeroId == nil then
        PlayerUtil:message("无可用英雄进化了！", 10, player)
        return
    end
    deleteKey(keyW, randomHeroId)
    MapHeroUtil["do进化ByType"](MapHeroUtil, player, lv, randomHeroId)
end
_____8FDB_5316_7CFB_7EDF["d_随机出现英雄"] = nil
_____8FDB_5316_7CFB_7EDF["d_随机出现英雄权重1"] = {}
_____8FDB_5316_7CFB_7EDF["d_随机出现英雄权重2"] = {}
_____8FDB_5316_7CFB_7EDF["d_随机出现英雄权重3"] = {}
_____8FDB_5316_7CFB_7EDF["d_随机出现英雄权重4"] = {}
return ____exports
