local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 17,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["39"] = 32,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 37,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 39,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 39,["56"] = 39,["58"] = 32,["59"] = 27,["60"] = 51,["61"] = 52,["62"] = 53,["63"] = 54,["66"] = 57,["67"] = 59,["68"] = 60,["69"] = 61,["70"] = 62,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 64,["75"] = 63,["76"] = 63,["78"] = 57,["79"] = 52,["80"] = 78,["81"] = 79,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 81,["87"] = 79,["88"] = 16});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____VestUtil = require("solar.solar-common.util.unit.VestUtil")
local VestUtil = ____VestUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_4E3B_70AE2 = ____exports.default
_____8239_57FA_7840_4E3B_70AE2.name = "船基础主炮2"
function _____8239_57FA_7840_4E3B_70AE2.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("深海之女")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local damage = UnitStateUtil:calculateStateFormula(
                actor:get("stateFormula", {chance = 0.2, int = 5}),
                actor.unit
            )
            if damage > 0 then
                DamageRecordUtil:damageEnemyUnitsInRange(
                    actor:getName(),
                    actor.unit,
                    300,
                    damage
                )
                EffectUtil:addSpecialEffectAndDestroy(
                    actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    GetUnitX(actor.unit),
                    GetUnitY(actor.unit),
                    actor:get("modelScale", 0.5)
                )
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("蓝色幻影")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local c = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 0.1 or 0.05
            if RandomUtil.isInChance(c) and (actor.phantomUnit or 0) < 3 then
                VestUtil.createPhantomUnit(actor.unit, 5, 0.3, 2)
                actor.phantomUnit = (actor.phantomUnit or 0) + 1
                BaseUtil.runLater(
                    5,
                    function()
                        actor.phantomUnit = actor.phantomUnit - 1
                    end
                )
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("皇家宝藏号")
    actorType.onUnitDamageEnemy = function(____, actor, enemy)
        PlayerUtil:addGoldState(
            GetOwningPlayer(actor.unit),
            10
        )
        TextTagUtil.textGold("+10", enemy)
    end
end
return ____exports
