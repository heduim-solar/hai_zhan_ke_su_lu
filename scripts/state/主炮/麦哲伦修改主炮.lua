local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 14,["33"] = 14,["34"] = 15,["35"] = 15,["36"] = 16,["37"] = 16,["38"] = 18,["39"] = 18,["40"] = 18,["42"] = 24,["43"] = 31,["44"] = 32,["45"] = 33,["46"] = 35,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 39,["52"] = 41,["53"] = 42,["56"] = 32,["57"] = 52,["58"] = 53,["59"] = 54,["60"] = 55,["61"] = 56,["62"] = 57,["63"] = 58,["64"] = 59,["66"] = 61,["67"] = 62,["70"] = 53,["71"] = 72,["72"] = 73,["73"] = 74,["74"] = 75,["75"] = 76,["77"] = 78,["78"] = 73,["79"] = 88,["80"] = 89,["81"] = 90,["82"] = 91,["85"] = 94,["86"] = 95,["87"] = 96,["88"] = 97,["90"] = 99,["91"] = 99,["92"] = 99,["93"] = 99,["94"] = 100,["97"] = 103,["98"] = 104,["99"] = 104,["100"] = 104,["101"] = 104,["102"] = 104,["103"] = 104,["104"] = 104,["105"] = 99,["106"] = 99,["107"] = 99,["108"] = 99,["109"] = 94,["110"] = 89,["111"] = 115,["112"] = 116,["113"] = 117,["114"] = 118,["115"] = 119,["117"] = 121,["119"] = 116,["120"] = 131,["121"] = 132,["122"] = 133,["123"] = 134,["124"] = 135,["125"] = 136,["127"] = 138,["130"] = 132,["131"] = 150,["132"] = 151,["133"] = 152,["134"] = 153,["135"] = 154,["136"] = 155,["138"] = 157,["141"] = 151,["142"] = 169,["143"] = 170,["144"] = 171,["145"] = 172,["148"] = 175,["149"] = 176,["150"] = 176,["151"] = 176,["152"] = 176,["153"] = 176,["154"] = 176,["155"] = 176,["156"] = 179,["157"] = 179,["158"] = 179,["159"] = 179,["160"] = 179,["161"] = 179,["162"] = 180,["163"] = 180,["164"] = 180,["165"] = 180,["166"] = 180,["167"] = 180,["168"] = 175,["169"] = 170,["170"] = 193,["171"] = 194,["172"] = 195,["173"] = 196,["176"] = 199,["177"] = 200,["178"] = 201,["179"] = 202,["180"] = 202,["181"] = 202,["182"] = 203,["183"] = 203,["184"] = 203,["185"] = 203,["186"] = 206,["187"] = 206,["188"] = 206,["189"] = 206,["190"] = 206,["191"] = 206,["192"] = 206,["193"] = 206,["194"] = 206,["195"] = 207,["196"] = 207,["197"] = 207,["198"] = 207,["199"] = 207,["200"] = 207,["201"] = 202,["202"] = 202,["203"] = 202,["204"] = 202,["205"] = 199,["206"] = 194,["207"] = 219,["208"] = 220,["209"] = 221,["210"] = 222,["211"] = 223,["212"] = 224,["214"] = 226,["217"] = 220,["218"] = 230,["219"] = 231,["220"] = 231,["221"] = 231,["222"] = 231,["223"] = 230,["224"] = 240,["225"] = 241,["226"] = 242,["227"] = 243,["228"] = 244,["229"] = 245,["231"] = 247,["234"] = 241,["235"] = 260,["236"] = 261,["237"] = 262,["238"] = 263,["239"] = 264,["240"] = 265,["242"] = 267,["245"] = 261,["246"] = 271,["247"] = 272,["248"] = 273,["251"] = 276,["252"] = 278,["253"] = 278,["254"] = 278,["255"] = 278,["256"] = 278,["257"] = 278,["258"] = 284,["259"] = 286,["260"] = 287,["261"] = 288,["262"] = 289,["263"] = 290,["265"] = 292,["266"] = 293,["269"] = 296,["270"] = 298,["271"] = 298,["272"] = 298,["273"] = 298,["274"] = 298,["275"] = 298,["276"] = 298,["277"] = 298,["278"] = 298,["279"] = 300,["280"] = 276,["281"] = 271,["282"] = 21});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____AutoMissileAttackController = require("solar.solar-common.controller.AutoMissileAttackController")
local AutoMissileAttackController = ____AutoMissileAttackController.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____LeapUtil = require("solar.solar-common.util.math.LeapUtil")
local LeapUtil = ____LeapUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local _____9EA6_54F2_4F26_4FEE_6539_4E3B_70AE = ____exports.default
_____9EA6_54F2_4F26_4FEE_6539_4E3B_70AE.name = "麦哲伦修改主炮"
function _____9EA6_54F2_4F26_4FEE_6539_4E3B_70AE.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("水手号")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            local add = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 1 or 0
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.targetCount = 3 + add
                aController.damageStateFormula = {attack = 0.8, agi = 0.65}
            else
                aController.targetCount = 2 + add
                aController.damageStateFormula = {attack = 0.8, agi = 0.5}
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("水手号·改")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            local add = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 1 or 0
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.targetCount = 4 + add
                aController.damageStateFormula = {attack = 1, agi = 0.9}
            else
                aController.targetCount = 3 + add
                aController.damageStateFormula = {attack = 1, agi = 0.65}
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("死神号")
    actorType.onUnitKillEnemy = function(____, actor, deathEnemy)
        local add = ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") and 5 or 2
        if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
            add = add + 1
        end
        HeroUtil:addHeroProperty(actor.unit, add)
    end
    actorType = ActorTypeUtil:getActorType("毁灭号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local radius = ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") and 600 or 300
            if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
                radius = radius + 200
            end
            SelectUtil.forEnemyUnitsInRange(
                projectile.source,
                radius,
                function(____, enemyUnit)
                    if enemyUnit == projectile.target then
                        return
                    end
                    local flsh = projectile.damage
                    DamageRecordUtil:damage(
                        actor:getName(),
                        projectile.source,
                        enemyUnit,
                        flsh,
                        DamageType["s_法术"]
                    )
                end,
                projectile.x,
                projectile.y
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("嗜血号")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local add = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 3000 or 0
        if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
            actor.attribute = {strength = 5000 + add, blood_sucking = 0.2}
        else
            actor.attribute = {strength = 2000 + add, blood_sucking = 0.2}
        end
    end
    actorType = ActorTypeUtil:getActorType("蛮族号")
    actorType.onUnitDamageEnemy = function(____, actor, enemy, event)
        local c = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 0.35 or 0.2
        if RandomUtil.isInChance(c) then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                event.resultDamage = event.resultDamage * 3.5
            else
                event.resultDamage = event.resultDamage * 2
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("武装直升机")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.extRange = 400
            else
                aController.extRange = 0
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("顽石号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local damage = UnitStateUtil:calculateStateFormula(
                actor:get(
                    "stateFormula",
                    {str = ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") and 2.5 or 1.5}
                ),
                actor.unit
            )
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                300,
                damage
            )
            EffectUtil:addSpecialEffectAndDestroy(
                "model\\基本技能\\地震.mdx",
                GetUnitX(actor.unit),
                GetUnitY(actor.unit),
                actor:get("modelScale", 0.8)
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("巡洋舰")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local x = GetUnitX(projectile.target)
            local y = GetUnitY(projectile.target)
            BaseUtil.runLater(
                1,
                function()
                    local damage = UnitStateUtil:calculateStateFormula(
                        {str = ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") and 3 or 1},
                        actor.unit
                    )
                    DamageRecordUtil:damageEnemyUnitsInRange(
                        actor:getName(),
                        actor.unit,
                        actor:get("area", 400),
                        damage,
                        DamageType["s_物理"],
                        x,
                        y
                    )
                    EffectUtil:addSpecialEffectAndDestroy(
                        actor:get("model", "model\\基本技能\\地震.mdx"),
                        x,
                        y,
                        actor:get("modelScale", 0.3)
                    )
                end,
                2,
                true
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("猩红之女")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.damageStateFormula = {attack = 10}
            else
                aController.damageStateFormula = {attack = 4}
            end
        end
    end
    actorType.onUnitKillEnemy = function(____, actor)
        UnitStateUtil:addLife(
            actor.unit,
            UnitStateUtil:getLife(actor.unit) * 0.05
        )
    end
    actorType = ActorTypeUtil:getActorType("天使号")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.damageStateFormula = {attack = 0.1, fullPros = 0.5}
            else
                aController.damageStateFormula = {attack = 0.1, fullPros = 0.2}
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("安妮女王复仇号")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.damageStateFormula = {attack = 5}
            else
                aController.damageStateFormula = {attack = 3}
            end
        end
    end
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onBeforeLaunchMissile = function(____, c, target)
            local angle = MathUtil.angleBetweenCoords(
                GetUnitX(c.unit),
                GetUnitY(c.unit),
                GetUnitX(target),
                GetUnitY(target)
            )
            local damage = UnitStateUtil:calculateStateFormula({attack = 3}, c.unit)
            local range = c.range + c.extRange
            local unitAttribute = AttributeUtil:getUnitAttribute(c.unit, false)
            if unitAttribute then
                if unitAttribute.autoMissileAttackRange then
                    range = range + unitAttribute.autoMissileAttackRange
                end
                if unitAttribute.autoMissileAttackRange_p then
                    range = range * (1 + unitAttribute.autoMissileAttackRange_p)
                end
            end
            range = math.min(range, c.rangeMaxLimit or AutoMissileAttackController.defaultRangeMaxLimit)
            LeapUtil.leap(
                c.unit,
                angle,
                range + 100,
                1,
                damage,
                DamageType["s_物理"],
                "Abilities\\Weapons\\KeeperGroveMissile\\KeeperGroveMissile.mdx"
            )
            return false
        end
    end
end
return ____exports
