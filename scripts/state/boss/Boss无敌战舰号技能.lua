local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 12,["30"] = 12,["31"] = 14,["32"] = 14,["33"] = 14,["46"] = 32,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 43,["53"] = 44,["54"] = 35,["55"] = 46,["56"] = 47,["57"] = 35,["58"] = 35,["59"] = 50,["60"] = 51,["61"] = 53,["62"] = 54,["63"] = 55,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 59,["68"] = 60,["69"] = 61,["70"] = 61,["71"] = 61,["72"] = 61,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 62,["80"] = 64,["81"] = 64,["82"] = 64,["83"] = 64,["84"] = 65,["85"] = 58,["86"] = 58,["88"] = 50,["89"] = 71,["90"] = 72,["91"] = 74,["92"] = 74,["93"] = 74,["94"] = 75,["95"] = 75,["96"] = 75,["97"] = 75,["98"] = 75,["99"] = 75,["100"] = 75,["101"] = 76,["102"] = 77,["103"] = 75,["104"] = 75,["105"] = 74,["106"] = 74,["107"] = 74,["109"] = 82,["110"] = 83,["111"] = 84,["112"] = 84,["113"] = 84,["114"] = 85,["115"] = 85,["116"] = 85,["117"] = 85,["118"] = 86,["119"] = 87,["120"] = 84,["121"] = 84,["122"] = 84,["125"] = 92,["126"] = 93,["127"] = 93,["128"] = 93,["129"] = 94,["130"] = 94,["131"] = 94,["132"] = 94,["133"] = 95,["134"] = 96,["135"] = 93,["136"] = 93,["137"] = 93,["139"] = 100,["140"] = 101,["141"] = 101,["142"] = 101,["143"] = 102,["144"] = 102,["145"] = 102,["146"] = 102,["147"] = 103,["148"] = 104,["149"] = 105,["150"] = 109,["151"] = 102,["152"] = 102,["153"] = 112,["154"] = 101,["155"] = 101,["156"] = 101,["158"] = 71,["159"] = 17});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____UnitRegenLifeUtil = require("solar.solar-common.util.unit.UnitRegenLifeUtil")
local UnitRegenLifeUtil = ____UnitRegenLifeUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____Projectile = require("solar.solar-common.tool.Projectile")
local Projectile = ____Projectile.default
____exports.default = __TS__Class()
local ____Boss_65E0_654C_6218_8230_53F7_6280_80FD = ____exports.default
____Boss_65E0_654C_6218_8230_53F7_6280_80FD.name = "Boss无敌战舰号技能"
function ____Boss_65E0_654C_6218_8230_53F7_6280_80FD.prototype.____constructor(self)
    --- 第二波BOSS，
    -- 主炮：
    -- 射程：2000
    -- 伤害：攻击力x10
    -- 射速：3（弹道很慢）
    -- 特殊：会对目标点400范围造成伤害，离中间越近伤害越高。
    -- 技能1：召唤护卫舰，立刻召唤24艘护卫舰在身边，（冷却20）
    -- 技能2：自爆，被摧毁时，倒计时5秒，对1000范围造成攻击力x50的伤害。
    -- 技能3：自我修复，当血量低于20%时，无敌并且恢复30%的生命值，获得10秒的100%攻击力，移速加成。
    -- 技能4：无敌，受到伤害时无敌5秒，冷却20秒。
    -- 技能5：分散导弹，对800范围内的所有单位造成2000+攻击力x1的伤害。（冷却30）
    local actorType = ActorTypeUtil:getActorType("无敌战舰号")
    ActorTypeUtil:registerActorType({
        id = "无敌战舰号自我修复Buff",
        name = "自我修复",
        attribute = {attack_p = 1, move_speed = 200},
        dur = 10,
        onCreated = function(____, actor)
            UnitStateUtil:setInvulnerable(actor.unit, true)
        end,
        onDestroy = function(____, actor)
            UnitStateUtil:setInvulnerable(actor.unit, false)
        end
    })
    actorType.onUnitDeath = function(____, actor)
        if gv.bossAbilityLimit >= 2 then
            local targetX = actor.unitX
            local targetY = actor.unitY
            local damage = UnitStateUtil:calculateStateFormula({attack = 50}, actor.unit)
            BaseUtil.onTimer(
                1,
                function(____, count)
                    if count >= 5 then
                        EffectUtil:addSpecialEffectAndDestroy("圆形范围伤害特效\\eff_002.mdx", targetX, targetY, 2)
                        DamageRecordUtil:damageEnemyUnitsInRange(
                            actor:getName(),
                            actor.unit,
                            1000,
                            damage,
                            DamageType["s_法术"],
                            targetX,
                            targetY
                        )
                        return false
                    end
                    TextTagUtil.textWarn(
                        "自爆" .. tostring(5 - count),
                        actor.unit
                    )
                    return true
                end
            )
        end
    end
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        if gv.bossAbilityLimit >= 1 then
            actor:ifReady(
                20,
                function()
                    ActorUnitUtil:createActorUnit(
                        actor.unitOwner,
                        "无敌战舰号护卫舰",
                        actor.unitX,
                        actor.unitY,
                        0,
                        24,
                        function(____, actorUnit)
                            actorUnit:applyTimedLife(20)
                        end
                    )
                end,
                "召唤护卫舰"
            )
        end
        if gv.bossAbilityLimit >= 3 then
            if UnitStateUtil:getUnitLifeP(actor.unit) < 0.3 then
                actor:ifReady(
                    100,
                    function()
                        UnitRegenLifeUtil:regenUnitLife(
                            actor.unit,
                            UnitStateUtil:getMaxLife(actor.unit) * 0.3
                        )
                        ActorBuffUtil:addActorBuff(actor.unit, "无敌战舰号自我修复Buff")
                        TextTagUtil.textWarn("自我修复", actor.unit)
                    end,
                    "自我修复"
                )
            end
        end
        if gv.bossAbilityLimit >= 4 then
            actor:ifReady(
                20,
                function()
                    UnitRegenLifeUtil:regenUnitLife(
                        actor.unit,
                        UnitStateUtil:getMaxLife(actor.unit) * 0.3
                    )
                    ActorBuffUtil:addActorBuff(actor.unit, "无敌战舰号自我修复Buff")
                    TextTagUtil.textWarn("自我修复", actor.unit)
                end,
                "无敌"
            )
        end
        if gv.bossAbilityLimit >= 5 then
            actor:ifReady(
                30,
                function()
                    SelectUtil.forEnemyUnitsInRange(
                        actor.unit,
                        800,
                        function(____, unit)
                            local projectile = __TS__New(Projectile, actor.unit, damageSource)
                            projectile.speed = 300
                            projectile.damage = UnitStateUtil:calculateStateFormula({base = 2000, attack = 1}, actor.unit)
                            projectile:start()
                        end
                    )
                    TextTagUtil.textWarn("分散导弹", actor.unit)
                end,
                "分散导弹"
            )
        end
    end
end
return ____exports
