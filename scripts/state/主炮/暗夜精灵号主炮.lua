local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 10,["22"] = 10,["23"] = 10,["25"] = 14,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 22,["32"] = 23,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 23,["42"] = 28,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 32,["47"] = 33,["48"] = 34,["49"] = 35,["50"] = 36,["51"] = 37,["52"] = 38,["53"] = 38,["54"] = 39,["55"] = 32,["56"] = 43,["57"] = 44,["58"] = 45,["59"] = 47,["60"] = 47,["68"] = 57,["69"] = 59,["70"] = 60,["71"] = 61,["72"] = 62,["73"] = 63,["74"] = 64,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 66,["80"] = 66,["82"] = 67,["83"] = 67,["84"] = 67,["85"] = 67,["86"] = 67,["87"] = 67,["88"] = 67,["89"] = 67,["90"] = 67,["91"] = 68,["92"] = 68,["93"] = 68,["94"] = 68,["96"] = 70,["97"] = 59,["98"] = 73,["99"] = 74,["100"] = 75,["101"] = 76,["102"] = 77,["103"] = 78,["104"] = 78,["105"] = 78,["106"] = 78,["109"] = 74,["110"] = 82,["111"] = 83,["112"] = 84,["113"] = 85,["114"] = 86,["117"] = 89,["118"] = 82,["119"] = 13,["120"] = 94,["121"] = 95,["122"] = 95,["123"] = 95,["124"] = 95,["125"] = 95,["126"] = 95,["127"] = 95,["128"] = 95,["129"] = 95,["130"] = 95,["131"] = 95,["132"] = 95,["133"] = 107,["134"] = 108,["135"] = 94});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____GuardUtil = require("solar.solar-common.util.system.GuardUtil")
local GuardUtil = ____GuardUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____BounceMissileController = require("solar.solar-common.controller.BounceMissileController")
local BounceMissileController = ____BounceMissileController.default
____exports.default = __TS__Class()
local _____6697_591C_7CBE_7075_53F7_4E3B_70AE = ____exports.default
_____6697_591C_7CBE_7075_53F7_4E3B_70AE.name = "暗夜精灵号主炮"
function _____6697_591C_7CBE_7075_53F7_4E3B_70AE.prototype.____constructor(self)
    local appActorUnitType = nil
    appActorUnitType = ____exports.default:createActorType("奇美拉", "units\\nightelf\\Chimaera\\Chimaera.mdx")
    appActorUnitType.missileModel = "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdx"
    appActorUnitType.moveType = "fly"
    appActorUnitType.flyHeight = 200
    appActorUnitType.acquireRange = 1000
    appActorUnitType.range = 700
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            300,
            event.resultDamage,
            GetUnitX(enemy),
            GetUnitY(enemy)
        )
    end
    appActorUnitType = ____exports.default:createActorType("月骑", "units\\nightelf\\Huntress\\Huntress.mdx")
    appActorUnitType.missileModel = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdx"
    appActorUnitType.acquireRange = 1000
    appActorUnitType.range = 600
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        local bounceMissileController = __TS__New(BounceMissileController, actor.unit)
        bounceMissileController.loopCount = 7
        bounceMissileController.projectileModelPath = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdx"
        bounceMissileController.range = 600
        bounceMissileController.damageStateFormula = {attack = 1}
        local ____bounceMissileController_hitUnitList_0 = bounceMissileController.hitUnitList
        ____bounceMissileController_hitUnitList_0[#____bounceMissileController_hitUnitList_0 + 1] = enemy
        bounceMissileController:launch()
    end
    appActorUnitType = ____exports.default:createActorType("弓箭手", "units\\nightelf\\Archer\\Archer.mdx")
    appActorUnitType.acquireRange = 800
    appActorUnitType.range = 800
    local ____appActorUnitType_abilities_1 = appActorUnitType.abilities
    ____appActorUnitType_abilities_1[#____appActorUnitType_abilities_1 + 1] = "a44u"
    --- 射程：200
    -- 伤害：攻击力x1
    -- 射速：0.5
    -- 特殊：召唤3个不可控的无敌单位，分别是
    -- 奇美拉：攻击附带100%的300范围溅射。（远500射程）
    -- 月骑：攻击弹射7次。（远400射程）
    -- 弓箭手：可攻击7个单位（远600射程）。
    local actorType = ActorTypeUtil:getActorType("暗夜精灵号主炮")
    actorType.onCreated = function(____, actor)
        local zhws = {}
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "奇美拉", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "月骑", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "弓箭手", actor.unitX, actor.unitY)
        for ____, zhw in ipairs(zhws) do
            zhw:set(
                "damage",
                UnitStateUtil:getDamageMax(actor.unit)
            )
            if SetUnitPressUIVisible ~= nil then
                SetUnitPressUIVisible(zhw.unit, false)
            end
            GuardUtil:setGuard(
                zhw.unit,
                actor.unit,
                3,
                600,
                800,
                1500,
                2
            )
            UnitStateUtil:setDamageBase(
                zhw.unit,
                UnitStateUtil:getDamageMax(actor.unit)
            )
        end
        actor.zhws = zhws
    end
    actorType.interval = 3
    actorType.onUnitInterval = function(____, actor)
        local zhws = actor.zhws
        if zhws then
            for ____, zhw in ipairs(zhws) do
                zhw:set(
                    "damage",
                    UnitStateUtil:getDamageMax(actor.unit)
                )
            end
        end
    end
    actorType.onDestroy = function(____, actor)
        local zhws = actor.zhws
        if zhws then
            for ____, zhw in ipairs(zhws) do
                zhw:destroy()
            end
        end
        _____4E3B_70AE_57FA_7840_4E8B_4EF6:onDestroy(actor)
    end
end
function _____6697_591C_7CBE_7075_53F7_4E3B_70AE.createActorType(self, id, model)
    local actorUnitType = {
        id = id,
        templateType = "远程单位",
        name = id,
        range = 200,
        damageCd = 0.5,
        acquireRange = 1300,
        moveSpeed = 522,
        model = model,
        moveType = "两栖",
        abilities = {"Avul", "Aloc"}
    }
    ActorTypeUtil:registerActorType(actorUnitType)
    return actorUnitType
end
return ____exports
