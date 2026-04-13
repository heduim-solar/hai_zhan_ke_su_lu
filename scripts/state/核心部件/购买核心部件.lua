local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 11,["23"] = 11,["24"] = 11,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 22,["31"] = 22,["32"] = 21,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 27,["39"] = 30,["41"] = 32,["42"] = 33,["43"] = 35,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 37,["55"] = 43,["56"] = 44,["57"] = 32,["58"] = 15,["59"] = 13});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____6838_5FC3_90E8_4EF6 = require("xlsx.装备.核心部件")
local ____d__6838_5FC3_90E8_4EF6 = _____6838_5FC3_90E8_4EF6["d_核心部件"]
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
____exports.default = __TS__Class()
local _____8D2D_4E70_6838_5FC3_90E8_4EF6 = ____exports.default
_____8D2D_4E70_6838_5FC3_90E8_4EF6.name = "购买核心部件"
function _____8D2D_4E70_6838_5FC3_90E8_4EF6.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("核心部件")
    local actorAbilityType = ActorTypeShopUtil:warpActorItem2SellingAbility(actorType.id)
    actorAbilityType.disable = true
    actorAbilityType.onCreated = function(____, actor)
        local ____exports_default_gmhxbjs_0 = ____exports.default.gmhxbjs
        ____exports_default_gmhxbjs_0[#____exports_default_gmhxbjs_0 + 1] = actor
    end
    if settings.gameDifficulty < 4 and settings.gameMode == MapModel["模式1_普通模式"] then
        actorAbilityType.requiredTip = "难4"
        if settings.gameDifficulty < 3 then
            actorAbilityType.hide = true
        end
    else
        actorAbilityType.requiredTip = "击杀第一个boss后"
    end
    actorType.onBuy = function(____, actor, buyingUnit)
        actor:destroy()
        if GetUnitLevel(buyingUnit) < 5 then
            MouseFrameUtil:showFailText(
                "需要至少5级才能购买此物品!",
                1,
                GetOwningPlayer(buyingUnit)
            )
            PlayerUtil:addLumberState(
                GetOwningPlayer(buyingUnit),
                1
            )
            return
        end
        local randomElement = ArrayUtil:randomElement(____d__6838_5FC3_90E8_4EF6)
        ActorItemUtil:addActorItemForUnit(randomElement.id, buyingUnit)
    end
end
_____8D2D_4E70_6838_5FC3_90E8_4EF6.gmhxbjs = {}
return ____exports
