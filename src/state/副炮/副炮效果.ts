import BounceMissileController from "@/BounceMissileController";
import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "../主炮/主炮基础事件";
import RandomUtil from "@/RandomUtil";
import ActorItem from "@/ActorItem";
import ActorItemUtil from "@/ActorItemUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import SelectUtil from "@/SelectUtil";
import TargetAttach from "@/TargetAttach";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";

export default class 副炮效果 {

    constructor() {
        let actorType: AppActorType = null;
        //天雷炮 a3zx
        /**
         * 射程：600
         * 伤害：攻击力x0.5
         * 射速：0.3
         * 特殊：该伤害造成伤害时有15%概率触发连锁闪电，造成全属性x1的弹射雷霆，可弹跳5次。
         */
        //one case


        actorType = ActorTypeUtil.getActorType("天雷炮");
        actorType.onCreated = (actor) => {
            if(actor instanceof ActorItem){
                (actor as ActorItem).setPawnable(true);
            }
        }
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onBeforeLaunchMissile = (c, t) => {
                if (!ActorItemUtil.isUnitHasActorItem(c.unit, "天雷炮")) {
                    c.destroy();
                    return false;
                }
                return true;
            };
            attackController.onHitTarget = projectile => {
                if (RandomUtil.isInChance(0.15)) {
                    let bounceMissileController = new BounceMissileController(attackController.unit);
                    bounceMissileController.damageName = actor.getName();
                    bounceMissileController.loopCount = 5;
                    bounceMissileController.projectileModelPath = "Abilities\\Spells\\Orc\\LightningBolt\\LightningBoltMissile.mdx";
                    bounceMissileController.range = 600;
                    bounceMissileController.damageStateFormula = {str: 1, agi: 1, int: 1};
                    bounceMissileController.hitUnitList.push(projectile.target);
                    bounceMissileController.launch();
                }

            }
        }


        /**
         * 环雷装置
         * 每秒对身边的敌人造成持续伤害，伤害为1000+10%生命值。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("环雷装置");
        actorType.interval = actorType.interval || 1
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 1000, hp: 0.1}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 600), damage, DamageType.s_物理)
            EffectUtil.addSpecialEffectAndDestroy("model\\特效\\环雷装置.mdx",
                actor.unitX, actor.unitY, 1.5)
        }

        /**
         * 刮痧装置
         * 射程：600
         * 伤害：攻击力x0.1
         * 射速：0.1
         * 特殊：该副炮造成伤害时削弱目标1点护甲，持续5秒，刷新叠加，最多100层。
         */
        ActorTypeUtil.registerActorType({
            id: "刮痧装置Buff",
            name: "刮痧装置-护甲",
            describe: "削弱目标护甲",
            attribute: {def: -1},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 5,
            levelMax: 100,
            levelDurMode: false
        } as AppActorBuffType);
        //one case
        actorType = ActorTypeUtil.getActorType("刮痧装置");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                ActorBuffUtil.addActorBuff(projectile.target, "刮痧装置Buff")
            }
        }


        /**
         * 破甲装置
         * 射程：600
         * 伤害：攻击力x0.1
         * 射速：0.1
         * 特殊：范围600的敌人护甲-30%
         */
        ActorTypeUtil.registerActorType({
            id: "破甲装置Buff",
            name: "破甲装置-30%护甲",
            describe: "护甲-30%",
            attribute: {def_p: -0.3},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 3,
            levelMax: 1,
        })
        //one case
        actorType = ActorTypeUtil.getActorType("破甲装置");
        actorType.interval = 2
        actorType.onUnitInterval = actor => {
            let enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600);
            if (enemyUnitsInRange == null || enemyUnitsInRange.length == 0) {
                return
            }
            for (let unit of enemyUnitsInRange) {
                ActorBuffUtil.addActorBuff(unit, "破甲装置Buff")
            }
        }

        //
        /**
         *
         * 刺蛇炮
         *
         * 射程：600
         * 伤害：攻击力x0.1
         * 射速：1
         * 特殊：该副炮造成伤害时会让目标中毒，每秒受到10000点真实伤害，持续5秒。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("刺蛇炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let damage = UnitStateUtil.calculateStateFormula({base: 10000}, actor.unit);
                let source = projectile.source
                let t = projectile.target
                BaseUtil.runLater(1, () => {
                    DamageRecordUtil.damage(actor.getName(), source, t, damage, DamageType.s_物理)
                    EffectUtil.addSpecialEffectTargetAndDestroy("圆形范围伤害特效\\devilslam.mdx", t, TargetAttach.origin,
                        actor.get("modelScale", 0.1))
                }, 5, true);
            }
        }
        /**
         * 致命炮
         * 射程：800
         * 伤害：1000+攻击力x2
         * 射速：0.35
         * 特殊：该主炮造成伤害时有20%概率x5。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("致命炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                if (RandomUtil.isInChance(0.2)) {
                    let source = projectile.source
                    let t = projectile.target
                    let newDamage = projectile.damage * 5;
                    DamageRecordUtil.damage(actor.getName(), source, t, newDamage, DamageType.s_物理)
                    EffectUtil.addSpecialEffectTargetAndDestroy("圆形范围伤害特效\\devilslam.mdx", t, TargetAttach.origin,
                        actor.get("modelScale", 0.1))
                    TextTagUtil.text("|cffff0000" + newDamage, t)
                }

            }
        }
        //


    }

}