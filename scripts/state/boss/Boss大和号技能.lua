local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 15,["22"] = 15,["23"] = 15,["34"] = 32,["35"] = 35,["36"] = 35,["37"] = 35,["38"] = 35,["39"] = 35,["40"] = 43,["41"] = 44,["42"] = 35,["43"] = 46,["44"] = 47,["45"] = 35,["46"] = 35,["47"] = 53,["48"] = 54,["49"] = 55,["50"] = 55,["51"] = 55,["52"] = 56,["53"] = 57,["54"] = 58,["55"] = 59,["56"] = 63,["57"] = 64,["58"] = 65,["59"] = 55,["60"] = 55,["61"] = 55,["63"] = 69,["64"] = 70,["65"] = 70,["66"] = 70,["67"] = 71,["68"] = 71,["69"] = 71,["70"] = 71,["71"] = 72,["72"] = 73,["73"] = 74,["74"] = 78,["75"] = 71,["76"] = 71,["77"] = 81,["78"] = 70,["79"] = 70,["80"] = 70,["82"] = 85,["83"] = 86,["84"] = 87,["85"] = 87,["86"] = 87,["87"] = 88,["88"] = 88,["89"] = 88,["90"] = 88,["91"] = 89,["92"] = 90,["93"] = 87,["94"] = 87,["95"] = 87,["98"] = 53,["99"] = 18});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____Projectile = require("solar.solar-common.tool.Projectile")
local Projectile = ____Projectile.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____UnitRegenLifeUtil = require("solar.solar-common.util.unit.UnitRegenLifeUtil")
local UnitRegenLifeUtil = ____UnitRegenLifeUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
____exports.default = __TS__Class()
local ____Boss_5927_548C_53F7_6280_80FD = ____exports.default
____Boss_5927_548C_53F7_6280_80FD.name = "Boss大和号技能"
function ____Boss_5927_548C_53F7_6280_80FD.prototype.____constructor(self)
    --- "第一波BOSS，
    --     主炮：
    --     射程：600
    --     伤害：攻击力x1
    --     射速：0.8
    --     特殊：无
    --     技能1：跟踪导弹，发射一枚速度为500的跟踪导弹，造成1000+攻击力x2的伤害并眩晕5秒。导弹最多飞行6秒。（冷却20）
    --     技能2：分散导弹，对800范围内的所有单位造成2000+攻击力x5的伤害。（冷却10）
    --     技能3：自我修复，当血量低于20%时，无敌并且恢复30%的生命值，获得10秒的100%攻击力，移速加成。"
    local actorType = ActorTypeUtil:getActorType("大和号")
    ActorTypeUtil:registerActorType({
        id = "大和号自我修复Buff",
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
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        if gv.bossAbilityLimit >= 1 then
            actor:ifReady(
                20,
                function()
                    local projectile = __TS__New(Projectile, actor.unit, damageSource)
                    projectile.speed = 200
                    projectile.projectileModelScale = 2
                    projectile.damage = UnitStateUtil:calculateStateFormula({base = 1000, attack = 2}, actor.unit)
                    projectile.lifeTimeMax = 6
                    projectile:start()
                    TextTagUtil.textWarn("跟踪导弹", actor.unit, 15, 6)
                end,
                "跟踪导弹"
            )
        end
        if gv.bossAbilityLimit >= 2 then
            actor:ifReady(
                10,
                function()
                    SelectUtil.forEnemyUnitsInRange(
                        actor.unit,
                        800,
                        function(____, unit)
                            local projectile = __TS__New(Projectile, actor.unit, damageSource)
                            projectile.speed = 1000
                            projectile.damage = UnitStateUtil:calculateStateFormula({base = 2000, attack = 5}, actor.unit)
                            projectile:start()
                        end
                    )
                    TextTagUtil.textWarn("分散导弹", actor.unit)
                end,
                "分散导弹"
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
                        ActorBuffUtil:addActorBuff(actor.unit, "大和号自我修复Buff")
                        TextTagUtil.textWarn("自我修复", actor.unit)
                    end,
                    "自我修复"
                )
            end
        end
    end
end
return ____exports
