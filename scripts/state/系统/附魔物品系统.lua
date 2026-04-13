local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 12,["25"] = 12,["26"] = 12,["28"] = 35,["31"] = 38,["32"] = 39,["33"] = 39,["34"] = 39,["35"] = 40,["36"] = 39,["37"] = 39,["38"] = 45,["39"] = 45,["40"] = 45,["41"] = 47,["42"] = 45,["43"] = 45,["44"] = 33,["45"] = 54,["46"] = 55,["47"] = 55,["48"] = 56,["49"] = 57,["50"] = 58,["51"] = 57,["52"] = 60,["53"] = 60,["54"] = 63,["55"] = 64,["56"] = 65,["57"] = 66,["58"] = 67,["59"] = 68,["60"] = 69,["63"] = 72,["64"] = 73,["65"] = 74,["66"] = 74,["67"] = 74,["68"] = 74,["69"] = 74,["72"] = 77,["73"] = 78,["74"] = 79,["77"] = 85,["78"] = 86,["79"] = 87,["81"] = 90,["83"] = 93,["84"] = 94,["85"] = 95,["86"] = 96,["87"] = 96,["88"] = 96,["89"] = 96,["90"] = 96,["91"] = 63,["92"] = 55,["93"] = 55,["94"] = 55,["95"] = 54,["96"] = 109,["97"] = 109,["98"] = 109,["100"] = 110,["101"] = 111,["102"] = 112,["103"] = 113,["105"] = 115,["106"] = 116,["109"] = 119,["110"] = 120,["112"] = 122,["113"] = 109,["114"] = 107});
local ____exports = {}
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local _____6F14_5458NPC_521B_5EFA = require("state.物品.演员NPC创建")
local _____6F14_5458NPC_521B_5EFA = _____6F14_5458NPC_521B_5EFA.default
local _____9644_9B54_7269_54C1 = require("xlsx.装备.附魔物品")
local ____d__9644_9B54_7269_54C1 = _____9644_9B54_7269_54C1["d_附魔物品"]
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local _____9644_9B54_7269_54C1_7CFB_7EDF = ____exports.default
_____9644_9B54_7269_54C1_7CFB_7EDF.name = "附魔物品系统"
function _____9644_9B54_7269_54C1_7CFB_7EDF.prototype.____constructor(self)
    if MapUtil:getRealNanduLevel() < 10 then
        return
    end
    ____exports.default["初始化附魔物品效果"](____exports.default)
    BaseUtil.runLater(
        2,
        function()
            ____exports.default:update(true)
        end
    )
    se:on(
        "敌人波数改变",
        function(lv)
            ____exports.default:update(true)
        end
    )
end
_____9644_9B54_7269_54C1_7CFB_7EDF["初始化附魔物品效果"] = function(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.name = "附魔物品:" .. actorType.name
            actorType.onCreated = function(____, actor)
                actor:setExtDescribe("|cffcccccc附魔提示 ", "对物品使用可把此物品所带的效果附加到指定物品上! 一个物品只能附魔一次!且吞噬时附魔效果会丢失！")
            end
            actorType.onBuy = function(____, actor, buyingUnit)
            end
            actorType.onAction = function(____, actor, x, y, targetUnit)
                local actorItem = actor
                local targetItem = GetSpellTargetItem()
                local targetActorItem = ActorItemUtil:getActorItem(targetItem)
                if targetActorItem == nil then
                    actorItem:addUses(1)
                    MouseFrameUtil:showFailText("请选择一个物品!", 1, actor.unitOwner)
                    return
                end
                if targetActorItem["附魔物品"] then
                    actorItem:addUses(1)
                    MouseFrameUtil:showFailText(
                        "你已经附魔过此物品了!" .. tostring(targetActorItem["附魔物品"]),
                        1,
                        actor.unitOwner
                    )
                    return
                end
                if targetActorItem:get("class") == "附魔物品" then
                    actorItem:addUses(1)
                    MouseFrameUtil:showFailText("不能附魔此附魔类型物品!", 1, actor.unitOwner)
                    return
                end
                if actor.attribute then
                    if targetActorItem.attribute == nil then
                        targetActorItem.attribute = {}
                    end
                    AttributeUtil:add(targetActorItem.attribute, actor.attribute)
                end
                actorItem:destroy()
                targetActorItem["附魔物品"] = actorItem.actorTypeId
                targetActorItem:setExtDescribe("|cff00ff00附魔|r ", (actorItem.actorTypeId .. "|n") .. actorItem.actorType.describe)
                MouseFrameUtil:showSuccessText(
                    "附魔成功!" .. tostring(targetActorItem["附魔物品"]),
                    1,
                    actor.unitOwner
                )
            end
        end,
        "附魔物品"
    )
end
function _____9644_9B54_7269_54C1_7CFB_7EDF.update(self, addNew)
    if addNew == nil then
        addNew = true
    end
    local newSellItem = ArrayUtil:randomElement(____d__9644_9B54_7269_54C1).id
    for ____, actorUnit in ipairs(_____6F14_5458NPC_521B_5EFA["深海奇珍演员单位列表"]) do
        if ____exports.default.lastSellItem ~= nil then
            actorUnit:removeSellItem(____exports.default.lastSellItem)
        end
        if addNew then
            actorUnit:addSellItem(newSellItem)
        end
    end
    if addNew then
        print("附魔物品系统 newSellItem=" .. newSellItem)
    end
    ____exports.default.lastSellItem = newSellItem
end
_____9644_9B54_7269_54C1_7CFB_7EDF.lastSellItem = nil
return ____exports
