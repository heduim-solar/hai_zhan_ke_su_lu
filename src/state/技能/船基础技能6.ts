import ActorTypeUtil from "@/ActorTypeUtil";
import SelectUtil from "@/SelectUtil";
import DamageUtil from "@/DamageUtil";
import UnitStateUtil from "@/UnitStateUtil";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";
import EffectUtil from "@/EffectUtil";
import MathUtil from "@/MathUtil";
import GameUtil from "@/GameUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import RandomUtil from "@/RandomUtil";
import AttributeUtil from "@/AttributeUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorUnitUtil from "@/ActorUnitUtil";


export default class 船基础技能6 {


    constructor() {
        let actorType: AppActorType = null;

        /**
         * 吞噬目标点1200范围内的敌人，造成攻击力x5的伤害，被吞掉的单位还会提供5点全属性。冷却20s
         */
        actorType = ActorTypeUtil.getActorType("吞吞号基础技能");
        actorType.onAction = (actor, x, y, targetUnit) => {
            let killCount = 0;
            SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                DamageUtil.damage(actor.unit, u, actor.actorType.stateFormula);
                if (!UnitStateUtil.isAlive(u)) {
                    killCount++;
                }
            }, x, y);
            EffectUtil.addSpecialEffectAndDestroy("单位\\新加英雄2\\模型\\吞吞号\\b4af6d0980ce3ecf.mdx", x, y)
            let addVal = 5 * killCount;
            HeroUtil.addHeroProperty(actor.unit, addVal);
            TextTagUtil.textSuccess("吞噬+" + addVal + "全属性", actor.unit)
        }

        /**
         * 身边始终环绕绝世好剑，对触碰到的敌人造成攻击力x3的伤害并眩晕1s
         */
        actorType = ActorTypeUtil.getActorType("步惊云号基础技能");
        actorType.interval = 0.05
        actorType.onUnitChange = (actor, unit) => {
            if (IsHandle(unit)) {
                let modelPath = "单位\\新加英雄2\\模型\\步惊云号\\特效\\b08ce72dbe36f791.mdx"
                actor.effect = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY)
                actor.effect2 = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY)
                actor.effect3 = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY)
            } else {
                if (actor.effect != null) {
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect)
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect2)
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect3)
                    actor.effect = null;
                }
            }
        }
        actorType.onUnitInterval = (actor) => {
            actor.aface = (actor.aface || 0) + 8;
            if (actor.aface <= -360) {
                actor.aface = 0;
            }
            if (actor.effect) {
                //
                let damage = UnitStateUtil.calculateStateFormula({attack: 3}, actor.unit);
                //
                let loc: Vector = null;

                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 400, actor.aface)
                EXSetEffectXY(actor.effect, loc.x, loc.y);
                let gd = GameUtil.getTerrainHeight(loc.x, loc.y) + 50
                EXSetEffectZ(actor.effect, gd);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                SelectUtil.forEnemyUnitsInRange(actor.unit, 200, (u) => {
                    UnitStateUtil.stunUnit(u, 1)
                }, loc.x, loc.y);
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 400, actor.aface + 120)
                EXSetEffectXY(actor.effect2, loc.x, loc.y);
                EXSetEffectZ(actor.effect2, gd);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                SelectUtil.forEnemyUnitsInRange(actor.unit, 200, (u) => {
                    UnitStateUtil.stunUnit(u, 1)
                }, loc.x, loc.y);
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 400, actor.aface + 240)
                EXSetEffectXY(actor.effect3, loc.x, loc.y)
                EXSetEffectZ(actor.effect3, gd);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                SelectUtil.forEnemyUnitsInRange(actor.unit, 200, (u) => {
                    UnitStateUtil.stunUnit(u, 1)
                }, loc.x, loc.y);

            }
        }
        /**
         * 每击杀200个敌人，获得以下随机属性：
         *
         *
         * 10%全主炮攻速
         *
         * 15%力量强化
         * 15%敏捷强化
         * 15%智力强化
         * 15%攻击力强化
         * 50全主炮射程
         *
         * 10%伤害增幅
         */
        actorType = ActorTypeUtil.getActorType("以杀证道号基础技能");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            actor.numberOverlay = (actor.numberOverlay || 1000) - 1;
            if (actor.numberOverlay <= 0) {
                let ri = RandomUtil.nextInt(0, 10);
                let attribute: AppAttribute = AttributeUtil.getPlayerAttribute(actor.unitOwner, true);
                if (ri == 1) {
                    attribute.autoMissileAttackSpeed = (attribute.autoMissileAttackSpeed || 0) + 0.1
                    TextTagUtil.textSuccess("获得10%全主炮攻速", actor.unit)
                } else if (ri == 2) {
                    HeroUtil.addHeroPropertyP(actor.unit, false, 0.15, 0, 0)
                    TextTagUtil.textSuccess("|cff00ff00获得当前15%力量", actor.unit)
                } else if (ri == 3) {
                    HeroUtil.addHeroPropertyP(actor.unit, false, 0, 0.15, 0)
                    TextTagUtil.textSuccess("|cff00ff00获得当前15%敏捷", actor.unit)
                } else if (ri == 4) {
                    HeroUtil.addHeroPropertyP(actor.unit, false, 0, 0, 0.15)
                    TextTagUtil.textSuccess("|cff00ff00获得当前15%智力", actor.unit)
                } else if (ri == 5) {
                    UnitStateUtil.addDamageBase(actor.unit, UnitStateUtil.getDamageBase(actor.unit) * 0.15)
                    TextTagUtil.textSuccess("|cff00ff00获得当前15%攻击力", actor.unit)
                } else if (ri == 6) {
                    attribute.autoMissileAttackRange = (attribute.autoMissileAttackRange || 0) + 50;
                    TextTagUtil.textSuccess("获得50全主炮射程", actor.unit)
                } else {
                    attribute.damage_increased = (attribute.damage_increased || 0) + 0.1;
                    TextTagUtil.textSuccess("获得10%伤害增幅", actor.unit)

                }
                se.emit("属性刷新")
                actor.numberOverlay = 1000;
            }
        };
        //减少300范围内单位80%攻击力
        ActorTypeUtil.registerActorType({
            id: "烧起来了号减攻击力",
            icon: "ReplaceableTextures\\CommandButtons\\BTNAnimateDead.blp",
            describe: "减少300范围内单位80%攻击力",
            attribute: {
                attack_p: -0.8,
            },
            dur: 3,
        })
        actorType = ActorTypeUtil.getActorType("烧起来了号基础技能");
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            SelectUtil.forEnemyUnitsInRange(actor.unit, 300, u => {
                ActorBuffUtil.addActorBuff(u, "烧起来了号减攻击力")
            });
        }
        //在触手旁边800码时，增加触手100%攻击力和攻速
        //减少300范围内单位80%攻击力
        ActorTypeUtil.registerActorType({
            id: "克苏鲁号加强触手",
            icon: "ReplaceableTextures\\CommandButtons\\BTNAnimateDead.blp",
            describe: "增加触手100%攻击力和攻速",
            attribute: {
                attack_p: 1,
                attackSpd_p: 1,
            },
            dur: 3,
        })
        actorType = ActorTypeUtil.getActorType("克苏鲁号基础技能");
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            SelectUtil.forAllyUnitsInRange(actor.unit, 800, u => {
                if (ActorUnitUtil.isActorUnitType(u, "跟踪小触手单位")) {
                    ActorBuffUtil.addActorBuff(u, "克苏鲁号加强触手")
                }

            });
        }
        //免疫从背后的伤害
        actorType = ActorTypeUtil.getActorType("无始大帝号基础技能");
        actorType.interval = 2
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            let jd = MathUtil.distanceBetweenUnits(damageSource, actor.unit);
            if (MathUtil.isBackAngle(jd, actor.unitFacing)) {
                event.resultDamage = 0;
                EXSetEventDamage(0)
                event.consumed = true;
            }
        }


    }


}