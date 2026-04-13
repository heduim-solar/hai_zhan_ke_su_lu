local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 11,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["25"] = 20,["26"] = 21,["27"] = 22,["30"] = 27,["31"] = 28,["32"] = 12,["33"] = 9});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
____exports.default = __TS__Class()
local _____5929_5DE5_56FE = ____exports.default
_____5929_5DE5_56FE.name = "天工图"
function _____5929_5DE5_56FE.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("天工图")
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
        targetActorItem.level = targetActorItem.level + 1
        targetActorItem.numberOverlay = targetActorItem.level
    end
end
return ____exports
