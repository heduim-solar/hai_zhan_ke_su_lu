local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 10,["27"] = 10,["28"] = 11,["29"] = 11,["30"] = 12,["31"] = 12,["32"] = 13,["33"] = 13,["34"] = 14,["35"] = 14,["36"] = 15,["37"] = 15,["38"] = 17,["39"] = 17,["40"] = 17,["42"] = 20,["43"] = 31,["44"] = 32,["45"] = 33,["46"] = 34,["48"] = 32,["49"] = 37,["50"] = 38,["51"] = 39,["54"] = 42,["55"] = 43,["56"] = 44,["57"] = 45,["59"] = 47,["60"] = 42,["61"] = 49,["62"] = 50,["63"] = 51,["64"] = 52,["65"] = 53,["66"] = 54,["67"] = 55,["68"] = 56,["69"] = 57,["70"] = 57,["71"] = 58,["73"] = 49,["74"] = 37,["75"] = 70,["76"] = 71,["77"] = 72,["78"] = 73,["79"] = 74,["80"] = 74,["81"] = 74,["82"] = 74,["83"] = 74,["84"] = 74,["85"] = 74,["86"] = 75,["87"] = 72,["88"] = 86,["89"] = 86,["90"] = 86,["91"] = 86,["92"] = 86,["93"] = 86,["94"] = 86,["95"] = 86,["96"] = 86,["97"] = 86,["98"] = 97,["99"] = 98,["100"] = 99,["101"] = 100,["104"] = 103,["105"] = 104,["106"] = 103,["107"] = 98,["108"] = 116,["109"] = 116,["110"] = 116,["111"] = 116,["112"] = 116,["113"] = 116,["114"] = 116,["115"] = 116,["116"] = 116,["117"] = 126,["118"] = 127,["119"] = 128,["120"] = 129,["121"] = 130,["124"] = 133,["125"] = 134,["127"] = 128,["128"] = 149,["129"] = 150,["130"] = 151,["131"] = 152,["134"] = 155,["135"] = 156,["136"] = 157,["137"] = 158,["138"] = 159,["139"] = 159,["140"] = 159,["141"] = 160,["142"] = 160,["143"] = 160,["144"] = 160,["145"] = 160,["146"] = 160,["147"] = 160,["148"] = 161,["149"] = 161,["150"] = 161,["151"] = 161,["152"] = 161,["153"] = 161,["154"] = 159,["155"] = 159,["156"] = 159,["157"] = 159,["158"] = 155,["159"] = 150,["160"] = 174,["161"] = 175,["162"] = 176,["163"] = 177,["166"] = 180,["167"] = 181,["168"] = 182,["169"] = 183,["170"] = 184,["171"] = 185,["172"] = 185,["173"] = 185,["174"] = 185,["175"] = 185,["176"] = 185,["177"] = 185,["178"] = 186,["179"] = 186,["180"] = 186,["181"] = 186,["182"] = 186,["183"] = 186,["184"] = 188,["185"] = 188,["186"] = 188,["187"] = 188,["189"] = 180,["190"] = 175,["191"] = 19});
local ____exports = {}
local ____BounceMissileController = require("solar.solar-common.controller.BounceMissileController")
local BounceMissileController = ____BounceMissileController.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
____exports.default = __TS__Class()
local _____526F_70AE_6548_679C = ____exports.default
_____526F_70AE_6548_679C.name = "副炮效果"
function _____526F_70AE_6548_679C.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("天雷炮")
    actorType.onCreated = function(____, actor)
        if __TS__InstanceOf(actor, ActorItem) then
            actor:setPawnable(true)
        end
    end
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onBeforeLaunchMissile = function(____, c, t)
            if not ActorItemUtil:isUnitHasActorItem(c.unit, "天雷炮") then
                c:destroy()
                return false
            end
            return true
        end
        attackController.onHitTarget = function(____, projectile)
            if RandomUtil.isInChance(0.15) then
                local bounceMissileController = __TS__New(BounceMissileController, attackController.unit)
                bounceMissileController.damageName = actor:getName()
                bounceMissileController.loopCount = 5
                bounceMissileController.projectileModelPath = "Abilities\\Spells\\Orc\\LightningBolt\\LightningBoltMissile.mdx"
                bounceMissileController.range = 600
                bounceMissileController.damageStateFormula = {str = 1, agi = 1, int = 1}
                local ____bounceMissileController_hitUnitList_0 = bounceMissileController.hitUnitList
                ____bounceMissileController_hitUnitList_0[#____bounceMissileController_hitUnitList_0 + 1] = projectile.target
                bounceMissileController:launch()
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("环雷装置")
    actorType.interval = actorType.interval or 1
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 1000, hp = 0.1}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            actor:get("area", 600),
            damage,
            DamageType["s_物理"]
        )
        EffectUtil:addSpecialEffectAndDestroy("model\\特效\\环雷装置.mdx", actor.unitX, actor.unitY, 1.5)
    end
    ActorTypeUtil:registerActorType({
        id = "刮痧装置Buff",
        name = "刮痧装置-护甲",
        describe = "削弱目标护甲",
        attribute = {def = -1},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 5,
        levelMax = 100,
        levelDurMode = false
    })
    actorType = ActorTypeUtil:getActorType("刮痧装置")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            ActorBuffUtil:addActorBuff(projectile.target, "刮痧装置Buff")
        end
    end
    ActorTypeUtil:registerActorType({
        id = "破甲装置Buff",
        name = "破甲装置-30%护甲",
        describe = "护甲-30%",
        attribute = {def_p = -0.3},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 3,
        levelMax = 1
    })
    actorType = ActorTypeUtil:getActorType("破甲装置")
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        local enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600)
        if enemyUnitsInRange == nil or #enemyUnitsInRange == 0 then
            return
        end
        for ____, unit in ipairs(enemyUnitsInRange) do
            ActorBuffUtil:addActorBuff(unit, "破甲装置Buff")
        end
    end
    actorType = ActorTypeUtil:getActorType("刺蛇炮")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local damage = UnitStateUtil:calculateStateFormula({base = 10000}, actor.unit)
            local source = projectile.source
            local t = projectile.target
            BaseUtil.runLater(
                1,
                function()
                    DamageRecordUtil:damage(
                        actor:getName(),
                        source,
                        t,
                        damage,
                        DamageType["s_物理"]
                    )
                    EffectUtil:addSpecialEffectTargetAndDestroy(
                        "圆形范围伤害特效\\devilslam.mdx",
                        t,
                        TargetAttach.origin,
                        actor:get("modelScale", 0.1)
                    )
                end,
                5,
                true
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("致命炮")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            if RandomUtil.isInChance(0.2) then
                local source = projectile.source
                local t = projectile.target
                local newDamage = projectile.damage * 5
                DamageRecordUtil:damage(
                    actor:getName(),
                    source,
                    t,
                    newDamage,
                    DamageType["s_物理"]
                )
                EffectUtil:addSpecialEffectTargetAndDestroy(
                    "圆形范围伤害特效\\devilslam.mdx",
                    t,
                    TargetAttach.origin,
                    actor:get("modelScale", 0.1)
                )
                TextTagUtil.text(
                    "|cffff0000" .. tostring(newDamage),
                    t
                )
            end
        end
    end
end
return ____exports
