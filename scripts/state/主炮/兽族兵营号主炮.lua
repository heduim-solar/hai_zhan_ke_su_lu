local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 11,["23"] = 11,["24"] = 11,["26"] = 15,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 18,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 25,["39"] = 23,["40"] = 29,["41"] = 30,["42"] = 31,["43"] = 32,["44"] = 33,["45"] = 34,["46"] = 35,["47"] = 36,["49"] = 34,["57"] = 48,["58"] = 50,["59"] = 51,["60"] = 52,["61"] = 53,["62"] = 54,["63"] = 55,["64"] = 56,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 57,["69"] = 57,["71"] = 58,["72"] = 58,["73"] = 58,["74"] = 58,["75"] = 58,["76"] = 58,["77"] = 58,["78"] = 58,["79"] = 58,["80"] = 59,["81"] = 59,["82"] = 59,["83"] = 59,["85"] = 61,["86"] = 50,["87"] = 64,["88"] = 65,["89"] = 66,["90"] = 67,["91"] = 68,["92"] = 69,["93"] = 69,["94"] = 69,["95"] = 69,["98"] = 65,["99"] = 73,["100"] = 74,["101"] = 75,["102"] = 76,["103"] = 77,["106"] = 80,["107"] = 73,["108"] = 14,["109"] = 85,["110"] = 86,["111"] = 86,["112"] = 86,["113"] = 86,["114"] = 86,["115"] = 86,["116"] = 86,["117"] = 86,["118"] = 86,["119"] = 86,["120"] = 86,["121"] = 86,["122"] = 98,["123"] = 99,["124"] = 85});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____GuardUtil = require("solar.solar-common.util.system.GuardUtil")
local GuardUtil = ____GuardUtil.default
____exports.default = __TS__Class()
local _____517D_65CF_5175_8425_53F7_4E3B_70AE = ____exports.default
_____517D_65CF_5175_8425_53F7_4E3B_70AE.name = "兽族兵营号主炮"
function _____517D_65CF_5175_8425_53F7_4E3B_70AE.prototype.____constructor(self)
    local appActorUnitType = nil
    appActorUnitType = ____exports.default:createActorType("狼骑兵", "units\\orc\\WolfRider\\WolfRider.mdx")
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy)
        TextTagUtil.textGold(
            "+" .. tostring(UnitRewardUtil:addGoldWithEarnGoldP(actor.unit, 50)),
            actor.unit
        )
    end
    appActorUnitType = ____exports.default:createActorType("牛头人", "units\\orc\\Tauren\\Tauren.mdx")
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.25) then
            event.resultDamage = event.resultDamage * 3
        end
    end
    appActorUnitType = ____exports.default:createActorType("风骑士", "units\\orc\\WyvernRider\\WyvernRider.mdx")
    appActorUnitType.moveType = "飞行"
    appActorUnitType.flyHeight = 200
    appActorUnitType.range = 800
    appActorUnitType.acquireRange = 800
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.3) then
            event.resultDamage = event.resultDamage * 5
        end
    end
    --- 射程：200
    -- 伤害：攻击力x1
    -- 射速：0.5
    -- 特殊：召唤3个不可控的无敌单位，分别是
    -- 狼骑兵：攻击杀敌+50金币。
    -- 牛头人：攻击时25%概率造成攻击力x3的伤害。
    -- 风骑士：攻击时30%概率5倍伤害。（远600射程）
    local actorType = ActorTypeUtil:getActorType("兽族兵营号主炮")
    actorType.onCreated = function(____, actor)
        local zhws = {}
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "狼骑兵", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "牛头人", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "风骑士", actor.unitX, actor.unitY)
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
function _____517D_65CF_5175_8425_53F7_4E3B_70AE.createActorType(self, id, model)
    local actorUnitType = {
        id = id,
        templateType = "远程单位",
        name = id,
        range = 200,
        damageCd = 0.5,
        model = model,
        moveSpeed = 522,
        acquireRange = 1300,
        moveType = "两栖",
        abilities = {"Avul", "Aloc"}
    }
    ActorTypeUtil:registerActorType(actorUnitType)
    return actorUnitType
end
return ____exports
