local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 12,["25"] = 12,["26"] = 12,["28"] = 17,["29"] = 18,["30"] = 19,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 23,["37"] = 26,["38"] = 27,["39"] = 28,["40"] = 29,["41"] = 30,["42"] = 31,["43"] = 32,["46"] = 35,["47"] = 36,["48"] = 37,["51"] = 40,["52"] = 41,["53"] = 42,["56"] = 46,["57"] = 46,["58"] = 47,["59"] = 48,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 49,["67"] = 52,["68"] = 53,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 53,["74"] = 53,["75"] = 53,["76"] = 53,["77"] = 55,["78"] = 58,["79"] = 58,["80"] = 58,["81"] = 58,["82"] = 59,["83"] = 60,["84"] = 61,["85"] = 62,["86"] = 26,["87"] = 15});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____8239_957F_4FE1_4EF6 = ____exports.default
_____8239_957F_4FE1_4EF6.name = "船长信件"
function _____8239_957F_4FE1_4EF6.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("船长信件")
    if settings.gameDifficulty < 3 and settings.gameMode == MapModel["模式1_普通模式"] then
        local actorAbilityType = ActorTypeShopUtil:warpActorItem2SellingAbility(actorType.id)
        actorAbilityType.disable = true
        actorAbilityType.requiredTip = "难3"
        if settings.gameDifficulty < 2 then
            actorAbilityType.hide = true
        end
    end
    actorType.onAction = function(____, actor, x, y, targetUnit)
        local actorItem = actor
        local targetItem = GetSpellTargetItem()
        local targetActorItem = ActorItemUtil:getActorItem(targetItem)
        if targetActorItem == nil then
            actorItem:addUses(1)
            MouseFrameUtil:showFailText("请选择一个船长物品!", 1, actor.unitOwner)
            return
        end
        if targetActorItem.actorType.class ~= "基础船长" and targetActorItem.actorType.class ~= "船长（高级）" and targetActorItem.actorType.class ~= "船长（顶级）" then
            actorItem:addUses(1)
            MouseFrameUtil:showFailText("请选择一个船长物品!", 1, actor.unitOwner)
            return
        end
        if ActorBuffUtil:isUnitHasActorBuff(actor.unit, targetActorItem.actorTypeId) then
            actorItem:addUses(1)
            MouseFrameUtil:showFailText("你已经吞噬过此船长了!", 1, actor.unitOwner)
            return
        end
        local ____opt_0 = AttributeUtil:getPlayerAttribute(actor.unitOwner, false)
        local _____6700_5927_541E_566C_6570_91CF = 2 + (____opt_0 and ____opt_0["吞噬船长上限"] or 0)
        if (sd(nil, actor.unitOwner)["船长信件吞噬数量"] or 0) >= _____6700_5927_541E_566C_6570_91CF then
            actorItem:addUses(1)
            MouseFrameUtil:showFailText(
                ("你已经吞噬了" .. tostring(_____6700_5927_541E_566C_6570_91CF)) .. "个船长了!不能再吞噬了!",
                1,
                actor.unitOwner
            )
            return
        end
        sd(nil, actor.unitOwner)["船长信件吞噬数量"] = (sd(nil, actor.unitOwner)["船长信件吞噬数量"] or 0) + 1
        TipFrameUtil:showIconMoveIntoAnimation(
            actor:getIcon(),
            0.55,
            0.17,
            0.08,
            0.55,
            0.5,
            actor.unitOwner
        )
        targetActorItem:destroy()
        local actorBuff = ActorBuffUtil:addActorBuff(
            MapUtil:getHeroByUnit(actor.unit),
            targetActorItem.actorTypeId
        )
        actorBuff:set("class", "吞噬")
        actorBuff:set("kind", "船长信件吞噬")
        actorBuff:set("tag", "进化继承")
        MouseFrameUtil:showTipText("|cff00ff00吞噬成功!", 1, actor.unitOwner)
    end
end
return ____exports
