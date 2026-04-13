local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 16,["17"] = 16,["18"] = 16,["19"] = 16,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 16,["25"] = 16,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 30,["32"] = 33,["33"] = 34,["34"] = 33,["35"] = 28,["36"] = 44,["37"] = 44,["38"] = 44,["39"] = 44,["40"] = 44,["41"] = 44,["42"] = 44,["43"] = 44,["44"] = 44,["45"] = 44,["46"] = 55,["47"] = 56,["48"] = 57,["49"] = 58,["52"] = 61,["53"] = 62,["54"] = 61,["55"] = 56,["56"] = 8});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
____exports.default = __TS__Class()
local _____8239_957F_5C0F_4E11 = ____exports.default
_____8239_957F_5C0F_4E11.name = "船长小丑"
function _____8239_957F_5C0F_4E11.prototype.____constructor(self)
    ActorTypeUtil:registerActorType({
        id = "小丑Buff",
        name = "小丑-护甲",
        describe = "削弱目标护甲",
        attribute = {def = -1},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 5,
        levelMax = 200,
        levelDurMode = false
    })
    local actorType = ActorTypeUtil:getActorType("小丑")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            ActorBuffUtil:addActorBuff(projectile.target, "小丑Buff")
        end
    end
    ActorTypeUtil:registerActorType({
        id = "小丑皇Buff",
        name = "小丑皇-护甲",
        describe = "削弱目标护甲",
        attribute = {def = -1},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 5,
        levelMax = 100,
        levelDurMode = false
    })
    actorType = ActorTypeUtil:getActorType("小丑皇")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            ActorBuffUtil:addActorBuff(projectile.target, "小丑皇Buff")
        end
    end
end
return ____exports
