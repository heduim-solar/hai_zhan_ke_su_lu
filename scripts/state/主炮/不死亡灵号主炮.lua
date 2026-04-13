local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 11,["23"] = 11,["24"] = 11,["26"] = 15,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 23,["43"] = 27,["44"] = 28,["45"] = 30,["46"] = 31,["47"] = 32,["48"] = 33,["49"] = 34,["50"] = 34,["51"] = 34,["52"] = 34,["53"] = 34,["54"] = 34,["55"] = 35,["56"] = 35,["57"] = 35,["58"] = 35,["59"] = 35,["60"] = 35,["61"] = 32,["69"] = 47,["70"] = 49,["71"] = 50,["72"] = 51,["73"] = 52,["74"] = 53,["75"] = 54,["76"] = 55,["77"] = 55,["78"] = 55,["79"] = 55,["80"] = 56,["81"] = 56,["83"] = 57,["84"] = 57,["85"] = 57,["86"] = 57,["87"] = 57,["88"] = 57,["89"] = 57,["90"] = 57,["91"] = 57,["92"] = 58,["93"] = 58,["94"] = 58,["95"] = 58,["97"] = 60,["98"] = 49,["99"] = 63,["100"] = 64,["101"] = 65,["102"] = 66,["103"] = 67,["104"] = 68,["105"] = 68,["106"] = 68,["107"] = 68,["110"] = 64,["111"] = 72,["112"] = 73,["113"] = 74,["114"] = 75,["115"] = 76,["118"] = 79,["119"] = 72,["120"] = 88,["121"] = 89,["122"] = 90,["123"] = 90,["124"] = 90,["125"] = 90,["126"] = 90,["127"] = 90,["128"] = 90,["129"] = 90,["130"] = 90,["131"] = 89,["132"] = 93,["133"] = 95,["134"] = 96,["135"] = 97,["136"] = 98,["137"] = 99,["138"] = 99,["139"] = 99,["140"] = 99,["141"] = 100,["142"] = 100,["144"] = 101,["145"] = 101,["146"] = 101,["147"] = 101,["148"] = 101,["149"] = 101,["150"] = 101,["151"] = 101,["152"] = 101,["153"] = 102,["154"] = 102,["155"] = 102,["156"] = 102,["158"] = 104,["159"] = 95,["160"] = 107,["161"] = 108,["162"] = 109,["163"] = 110,["164"] = 111,["165"] = 112,["166"] = 112,["167"] = 112,["168"] = 112,["171"] = 108,["172"] = 116,["173"] = 117,["174"] = 118,["175"] = 119,["176"] = 120,["179"] = 116,["180"] = 14,["181"] = 128,["182"] = 129,["183"] = 129,["184"] = 129,["185"] = 129,["186"] = 129,["187"] = 129,["188"] = 129,["189"] = 129,["190"] = 129,["191"] = 129,["192"] = 129,["193"] = 129,["194"] = 141,["195"] = 142,["196"] = 128});
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
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
____exports.default = __TS__Class()
local _____4E0D_6B7B_4EA1_7075_53F7_4E3B_70AE = ____exports.default
_____4E0D_6B7B_4EA1_7075_53F7_4E3B_70AE.name = "不死亡灵号主炮"
function _____4E0D_6B7B_4EA1_7075_53F7_4E3B_70AE.prototype.____constructor(self)
    local appActorUnitType = nil
    appActorUnitType = ____exports.default:createActorType("冰霜巨龙", "units\\undead\\FrostWyrm\\FrostWyrm.mdx")
    appActorUnitType.missileModel = "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdx"
    appActorUnitType.moveType = "fly"
    appActorUnitType.flyHeight = 200
    appActorUnitType.acquireRange = 1000
    appActorUnitType.range = 700
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            600,
            event.resultDamage,
            GetUnitX(enemy),
            GetUnitY(enemy)
        )
    end
    appActorUnitType = ____exports.default:createActorType("食尸鬼", "units\\undead\\Ghoul\\Ghoul.mdx")
    appActorUnitType.damageCd = 0.17
    appActorUnitType = ____exports.default:createActorType("憎恶", "units\\undead\\Abomination\\Abomination.mdx")
    appActorUnitType.interval = 1
    appActorUnitType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({attack = 0.5}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            300,
            damage
        )
        EffectUtil:addSpecialEffectAndDestroy(
            "圆形范围伤害特效\\devilslam.mdx",
            GetUnitX(actor.unit),
            GetUnitY(actor.unit),
            0.6
        )
    end
    --- 射程：200
    -- 伤害：攻击力x1
    -- 射速：0.5
    -- 特殊：召唤3个不可控的无敌单位，分别是
    -- 冰霜巨龙：攻击附带50%的600范围溅射。（远500射程）
    -- 食尸鬼：攻速+300%。
    -- 憎恶：每秒对范围300的敌人造成攻击力x0.5的伤害。
    local actorType = ActorTypeUtil:getActorType("不死亡灵号主炮")
    actorType.onCreated = function(____, actor)
        local zhws = {}
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "冰霜巨龙", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "食尸鬼", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "憎恶", actor.unitX, actor.unitY)
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
                50
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
    appActorUnitType = ____exports.default:createActorType("死亡骑士", "units\\undead\\EvilArthas\\UndeadArthas.mdx")
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            300,
            event.resultDamage * 0.5,
            DamageType["s_物理"],
            GetUnitX(enemy),
            GetUnitY(enemy)
        )
    end
    actorType = ActorTypeUtil:getActorType("不死亡灵号基础技能")
    actorType.onCreated = function(____, actor)
        local zhws = {}
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "死亡骑士", actor.unitX, actor.unitY)
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
    end
end
function _____4E0D_6B7B_4EA1_7075_53F7_4E3B_70AE.createActorType(self, id, model)
    local actorUnitType = {
        id = id,
        templateType = "远程单位",
        name = id,
        range = 200,
        damageCd = 0.5,
        moveSpeed = 522,
        acquireRange = 1300,
        model = model,
        moveType = "两栖",
        abilities = {"Avul", "Aloc"}
    }
    ActorTypeUtil:registerActorType(actorUnitType)
    return actorUnitType
end
return ____exports
