local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 18,["25"] = 18,["26"] = 18,["29"] = 25,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 32,["39"] = 35,["40"] = 36,["41"] = 37,["42"] = 38,["45"] = 41,["46"] = 42,["47"] = 43,["50"] = 46,["51"] = 47,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 51,["59"] = 52,["62"] = 55,["63"] = 56,["64"] = 56,["65"] = 57,["66"] = 58,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 36,["71"] = 62,["72"] = 63,["73"] = 64,["74"] = 62,["75"] = 21});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____8FDB_5316_7CFB_7EDF = require("state.系统.进化系统")
local _____8FDB_5316_7CFB_7EDF = _____8FDB_5316_7CFB_7EDF.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
____exports.default = __TS__Class()
local _____5427_5527_6362_8239_8239_957F = ____exports.default
_____5427_5527_6362_8239_8239_957F.name = "吧唧换船船长"
function _____5427_5527_6362_8239_8239_957F.prototype.____constructor(self)
    --- 点击使用，消耗该道具，可以强行更换一次船只（默认不保留当前船只的主炮）。每次购买价格翻倍
    local sellingAbility = ActorTypeShopUtil:warpActorItem2SellingAbility("吧唧")
    sellingAbility.goldCost = 0
    sellingAbility.tooltipLabel1 = "2000"
    if settings.gameDifficulty < 5 and settings.gameMode == MapModel["模式1_普通模式"] then
        sellingAbility.requiredTip = "难5"
        sellingAbility.disable = true
        if settings.gameDifficulty < 4 then
            sellingAbility.hide = true
        end
    end
    local actorType = ActorTypeUtil:getActorType("吧唧")
    actorType.onBuy = function(____, actor, buyingUnit)
        local player = GetOwningPlayer(buyingUnit)
        if not IsHandle(player) then
            return
        end
        if GetUnitLevel(buyingUnit) < 2 then
            MouseFrameUtil:showTipText("|cffff0000初始小木船不能购买此船长换船!", 1, player)
            actor:destroy()
            return
        end
        local pData = DataBase:getPlayerSolarData(player, true)
        local needGold = 2000 * 2 ^ (pData["购买吧唧次数"] or 0)
        needGold = math.min(needGold, 1000000)
        if not PlayerUtil:costEnoughState(player, needGold) then
            MouseFrameUtil:showTipText(
                "|cffff0000金币不足!需要:" .. tostring(math.floor(needGold)),
                1,
                player
            )
            actor:destroy()
            return
        end
        pData["购买吧唧次数"] = (pData["购买吧唧次数"] or 0) + 1
        AsyncUtil:run(
            function()
                local nextText = math.min(needGold * 2, 1000000)
                ActorTypeShopUtil:warpActorItem2SellingAbility("吧唧").tooltipLabel1 = TextUtil:toCnUnit(nextText)
            end,
            player
        )
    end
    actorType.onAction = function(____, actor, x, y, targetUnit)
        _____8FDB_5316_7CFB_7EDF["do进化"](_____8FDB_5316_7CFB_7EDF, actor.unitOwner, 1)
        actor:destroy()
    end
end
return ____exports
