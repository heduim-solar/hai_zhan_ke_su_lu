import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import BaseUtil from "@/BaseUtil";
import EffectUtil from "@/EffectUtil";
import TargetAttach from "@/TargetAttach";
import CoolDown from "@/CoolDown";
import VestUtil from "@/VestUtil";
import Motion from "@/Motion";
import GameUtil from "@/GameUtil";


export default class 船基础技能2 {


    constructor() {
        let actorType: AppActorType = null;

        /**
         * "毁灭号
         * 主动：对目标800范围造成5次打击。每次伤害为1000+智力x1。
         * 每击杀一个单位该技能伤害+0.1%"
         */
        //one case
        actorType = ActorTypeUtil.getActorType("毁灭号基础技能");
        actorType.targetType = "点";
        actorType.area = actorType.area || 800;
        actorType.range = actorType.range || 1600;
        actorType.onCreated = actor => {
            se.onUnitDeath(e => {
                if (e.killingUnit == actor.unit) {
                    actor.killCount = (actor.killCount || 0) + 1;
                    actor.setDescribe("对目标800范围造成5次打击。每次伤害为1000+智力x5。|n 每击杀一个单位该技能伤害+0.1%|n" +
                        "(当前加成:" + (0.1 * actor.killCount) + "%)")
                }
            })
        }
        actorType.onAction = actor => {
            let targetX = GetSpellTargetX();
            let targetY = GetSpellTargetY();
            let damage = UnitStateUtil.calculateStateFormula({base: 1000, int: 1}, actor.unit);
            damage = damage * (1 + ((actor.killCount || 0) * 0.001));
            BaseUtil.runLater(1, () => {
                EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\eff_002.mdx", targetX, targetY, 1)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 500, damage, DamageType.s_法术, targetX, targetY)
            }, 5, true)
        }


        /**
         * 嗜血号
         * 被攻击时对攻击者造成力量x2的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("嗜血号基础技能");
        actorType.onUnitDamaged = (actor, damageSource) => {
            let damage = UnitStateUtil.calculateStateFormula({str: 2}, actor.unit);
            DamageRecordUtil.damage(actor.getName(), actor.unit, damageSource, damage, DamageType.s_物理)
            EffectUtil.addSpecialEffectTargetAndDestroy("圆形范围伤害特效\\devilslam.mdx", damageSource, TargetAttach.origin,
                actor.get("modelScale", 0.1))
        }
        /**
         * 瘟疫号
         * 每秒对身边150造成300+生命值x10%的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("瘟疫号基础技能");
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 300, hp: 0.1}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 350, damage, DamageType.s_物理, GetUnitX(actor.unit), GetUnitY(actor.unit))
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                GetUnitX(actor.unit), GetUnitY(actor.unit), actor.get("modelScale", 0.3))
        }
        /**
         * 蛮族号
         * 被攻击时20%对范围300造成力量x5的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("蛮族号基础技能");
        actorType.onUnitDamaged = (actor, damageSource) => {
            let damage = UnitStateUtil.calculateStateFormula(actor.get("stateFormula"), actor.unit);
            if (damage > 0) {
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 300, damage)
                EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    GetUnitX(actor.unit), GetUnitY(actor.unit), actor.get("modelScale", 0.3))
            }
        }
        /**
         * 蓝色幻影
         * 主动制造出3个额外的镜像，持续15秒，冷却10秒。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("蓝色幻影基础技能");
        actorType.onAction = (actor) => {
            for (let i = 0; i < 3; i++) {
                VestUtil.createPhantomUnit(actor.unit, 15, 1, 2)
            }
        }
        /**
         * 顽石号
         * 每间隔3秒，下次被攻击时对身边350范围造成500+力量x5的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("顽石号基础技能");
        actorType.onUnitDamaged = (actor, damageSource) => {
            let coolDown: CoolDown = actor.coolDown;
            if (coolDown == null) {
                coolDown = new CoolDown(3);
                actor.coolDown = coolDown;
            }
            coolDown.ifReady(() => {
                let damage = UnitStateUtil.calculateStateFormula(actor.get("stateFormula", {
                    base: 500,
                    str: 5
                }), actor.unit);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 350, damage)
                EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    actor.unitX, actor.unitY, actor.get("modelScale", 0.7))
            })

        }
        /**
         * 巡洋舰
         * 主动：投射一枚导弹，3秒后落下，对500范围造成力量x10的伤害。
         * 冷却5秒。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("巡洋舰基础技能");
        actorType.onAction = (actor, damageSource) => {
            let start = {
                x: actor.unitX,
                y: actor.unitY,
                z: GameUtil.getTerrainHeight(actor.unitX, actor.unitY) + 100
            };
            let effect = EffectUtil.addSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", start.x, start.y, 4);
            // EXEffectMatRotateY(effect, 90);

            let motion = new Motion(3, m => {
                EXSetEffectXY(effect, m.x, m.y);
                EXSetEffectZ(effect, m.z);
            });
            motion.onDone = m => {
                let damage = UnitStateUtil.calculateStateFormula(actor.get("stateFormula", {
                    str: 10
                }), actor.unit);
                DestroyEffect(effect);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 500), damage, DamageType.s_物理, motion.x, motion.y)
                EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\巡洋舰巨石掉落.mdx",
                    motion.x, motion.y, 0.8)
            }
            motion.setPathSplineType("Bezier")

            motion.addPathPoint(start)
            motion.addPathPoint({
                x: start.x,
                y: start.y,
                z: start.z + 1000
            })
            let end = {
                x: actor.getSpellTargetX(),
                y: actor.getSpellTargetY(),
                z: GameUtil.getTerrainHeight(actor.getSpellTargetX(), actor.getSpellTargetY())
            }
            motion.addPathPoint({
                x: end.x,
                y: end.y,
                z: end.z + 800
            })
            motion.addPathPoint(end)
            EXEffectMatRotateZ(effect, motion.getFaceAngle());
            //
            motion.run();

        }


    }


}

