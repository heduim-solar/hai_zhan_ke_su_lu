local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 8,["17"] = 8,["18"] = 8,["20"] = 13,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 19,["29"] = 22,["30"] = 23,["31"] = 24,["34"] = 28,["36"] = 29,["37"] = 29,["38"] = 30,["39"] = 31,["43"] = 29,["46"] = 37,["47"] = 39,["48"] = 14,["49"] = 11});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local _____6838_5FC3_90E8_4EF6 = require("xlsx.装备.核心部件")
local ____d__6838_5FC3_90E8_4EF6 = _____6838_5FC3_90E8_4EF6["d_核心部件"]
____exports.default = __TS__Class()
local _____6539_9020_56FE = ____exports.default
_____6539_9020_56FE.name = "改造图"
function _____6539_9020_56FE.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("改造设计图")
    actorType.onAction = function(____, actor, x, y, targetUnit)
        local targetItem = GetSpellTargetItem()
        local targetActorItem = ActorItemUtil:getActorItem(targetItem)
        if targetActorItem == nil then
            actor:addUses(1)
            MouseFrameUtil:showFailText("请选择一个核心部件!", 1, actor.unitOwner)
            return
        end
        if targetActorItem:get("class") ~= "核心部件" then
            actor:addUses(1)
            MouseFrameUtil:showFailText("请选择一个核心部件!", 1, actor.unitOwner)
            return
        end
        local randomElement = ArrayUtil:randomElement(____d__6838_5FC3_90E8_4EF6)
        do
            local i = 0
            while i < 1000 do
                if randomElement.id == targetActorItem.actorTypeId then
                    randomElement = ArrayUtil:randomElement(____d__6838_5FC3_90E8_4EF6)
                else
                    break
                end
                i = i + 1
            end
        end
        ActorItemUtil:addActorItemForUnit(randomElement.id, actor.unit)
        targetActorItem:destroy()
    end
end
return ____exports
