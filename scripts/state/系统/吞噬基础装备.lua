local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 12,["23"] = 12,["24"] = 12,["26"] = 18,["27"] = 18,["28"] = 19,["31"] = 22,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 26,["37"] = 28,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 35,["44"] = 36,["45"] = 37,["48"] = 40,["49"] = 41,["52"] = 44,["53"] = 46,["54"] = 48,["55"] = 48,["56"] = 48,["57"] = 48,["58"] = 48,["59"] = 48,["60"] = 48,["61"] = 48,["62"] = 48,["63"] = 50,["64"] = 50,["65"] = 50,["66"] = 50,["67"] = 51,["68"] = 52,["69"] = 53,["70"] = 55,["71"] = 35,["72"] = 18,["73"] = 18,["74"] = 18,["75"] = 15});
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
____exports.default = __TS__Class()
local _____541E_566C_57FA_7840_88C5_5907 = ____exports.default
_____541E_566C_57FA_7840_88C5_5907.name = "吞噬基础装备"
function _____541E_566C_57FA_7840_88C5_5907.prototype.____constructor(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if (string.find(actorType.name, "修理工", nil, true) or 0) - 1 >= 0 then
                return
            end
            local tsJB = 0
            if (string.find(actorType.name, "Lv10", nil, true) or 0) - 1 >= 0 then
                tsJB = 100000
            elseif (string.find(actorType.name, "Lv9", nil, true) or 0) - 1 >= 0 then
                tsJB = 30000
            end
            if tsJB < 1 then
                return
            end
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
        "基础属性装备"
    )
end
return ____exports
