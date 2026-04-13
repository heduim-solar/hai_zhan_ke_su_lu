local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 12,["25"] = 12,["26"] = 12,["28"] = 16,["31"] = 21,["32"] = 21,["33"] = 23,["34"] = 25,["35"] = 26,["36"] = 27,["37"] = 28,["38"] = 29,["39"] = 30,["42"] = 33,["43"] = 34,["46"] = 37,["47"] = 39,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 41,["55"] = 41,["56"] = 41,["57"] = 43,["58"] = 43,["59"] = 43,["60"] = 43,["61"] = 44,["62"] = 45,["63"] = 46,["64"] = 48,["65"] = 28,["66"] = 21,["67"] = 21,["68"] = 21,["69"] = 15});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
____exports.default = __TS__Class()
local _____541E_566C_57FA_7840_6253_94B1_8239_957F = ____exports.default
_____541E_566C_57FA_7840_6253_94B1_8239_957F.name = "吞噬基础打钱船长"
function _____541E_566C_57FA_7840_6253_94B1_8239_957F.prototype.____constructor(self)
    if settings.gameMode == MapModel["模式1_普通模式"] then
        return
    end
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            local tsJB = actorType.goldCost * (6 - actorType.index)
            local tsJBCnUnit = TextUtil:toCnUnit(tsJB)
            actorType.describe = ((actorType.describe .. "|n|n|cffcccccc(点击消耗") .. tsJBCnUnit) .. "金币吞噬此装备)|r|n"
            actorType.passive = false
            actorType.onAction = function(____, actor, x, y, targetUnit)
                if ActorBuffUtil:isUnitHasActorBuff(actor.unit, actor.tsJB) then
                    MouseFrameUtil:showFailText("你已经吞噬过此物品了!", 1, actor.unitOwner)
                    return
                end
                if not PlayerUtil:hasEnoughState(actor.unitOwner, tsJB) then
                    ActorFrameUtil:showFailText(actor, "金币不足！需要" .. tsJBCnUnit, 1, actor.unitOwner)
                    return
                end
                PlayerUtil:costEnoughState(actor.unitOwner, tsJB)
                local actorItem = actor
                TipFrameUtil:showIconMoveIntoAnimation(
                    actorItem:getIcon(),
                    0.55,
                    0.17,
                    0.08,
                    0.55,
                    0.5,
                    actor.unitOwner
                )
                local actorBuff = ActorBuffUtil:addActorBuff(
                    MapUtil:getHeroByUnit(actor.unit),
                    actorItem.actorTypeId
                )
                actorBuff:set("class", "吞噬")
                actorBuff:set("tag", "进化继承")
                MouseFrameUtil:showTipText("|cff00ff00吞噬成功!", 1, actor.unitOwner)
                actorItem:destroy()
            end
        end,
        "基础船长"
    )
end
return ____exports
