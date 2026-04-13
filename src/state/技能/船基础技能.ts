import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import SingletonUtil from "@/SingletonUtil";
import BaseUtil from "@/BaseUtil";
import MathUtil from "@/MathUtil";
import EffectUtil from "@/EffectUtil";
import DamageType from "@/DamageType";
import SelectUtil from "@/SelectUtil";
import TargetAttach from "@/TargetAttach";
import ActorUtil from "@/ActorUtil";
import ActorBuffUtil from "@/ActorBuffUtil";


export default class 船基础技能 {


    constructor() {
        let actorType: AppActorType = null;

        /**
         * 铁达尼号
         * 生命值+50%
         * 每4秒，对周围500范围造成生命值x40%的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("铁达尼号基础技能");
        actorType.attribute = {life_p: 0.5}
        actorType.interval = 4
        actorType.onUnitInterval = actor => {
            let damage = UnitStateUtil.calculateStateFormula({hp: 0.4}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 500, damage)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "model\\基本技能\\铁达尼号基础技能.mdx"),
                actor.unitX, actor.unitY, actor.get("modelScale", 1))
        }
        /**
         * 泰坦尼克号
         * 生命值+100%
         * 每4秒，对周围500范围造成生命值x50%的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("泰坦尼克号基础技能");
        actorType.interval = 4
        actorType.onUnitInterval = actor => {
            let damage = UnitStateUtil.calculateStateFormula({hp: 0.5}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 500, damage)
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\铁达尼号基础技能.mdx",
                actor.unitX, actor.unitY, actor.get("modelScale", 1))
        }
        /**
         * 黑珍珠号
         * 敏捷+50%
         * 主动：隐身10秒
         * 冷却：15
         */
        //one case
        actorType = ActorTypeUtil.getActorType("黑珍珠号基础技能");
        actorType.onCreated = () => {
            SingletonUtil.executeOnce(actorType, () => {
                se.onUnitAttacked(e => {
                    if (GetUnitAbilityLevel(e.attacker, 'Apiv')) {
                        UnitRemoveAbility(e.attacker, 'Apiv')
                    }
                })
            });
        }
        actorType.onAction = actor => {
            let unit = actor.unit;
            UnitAddAbility(unit, 'Apiv')
            BaseUtil.runLater(15, () => {
                UnitRemoveAbility(unit, 'Apiv')
            });
        }
        /**
         * 黑色幽灵号
         * 敏捷+50%
         * 黑色幽灵号每1秒会对900范围造成1000+敏捷x1的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("黑色幽灵号基础技能");
        actorType.interval = 1
        actorType.onUnitInterval = actor => {
            let damage = UnitStateUtil.calculateStateFormula({base: 1000, agi: 1}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 900, damage)
        }
        /**
         * 桑尼号
         * 允许上岸
         * 每5秒对背后造成一次范围600x200的1000+智力x10的伤害。
         */

        //one case
        actorType = ActorTypeUtil.getActorType("桑尼号基础技能");
        actorType.interval = 5
        actorType.onUnitInterval = actor => {
            let damage = UnitStateUtil.calculateStateFormula({base: 1000, int: 10}, actor.unit);
            let projection = MathUtil.polarProjection(GetUnitX(actor.unit), GetUnitY(actor.unit), 300, GetUnitFacing(actor.unit) + 180);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 350, damage, DamageType.s_物理, projection.x, projection.y)
            EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\eff_002.mdx", projection.x, projection.y, 0.4)
        }
        /**
         * 阳光桑尼号基础技能
         * 允许上岸
         * 每3秒对背后造成一次范围600x200的1000+智力x10的伤害。
         */

        //one case
        actorType = ActorTypeUtil.getActorType("阳光桑尼号基础技能");
        actorType.interval = 3
        actorType.onUnitInterval = actor => {
            let damage = UnitStateUtil.calculateStateFormula({base: 1000, int: 10}, actor.unit);
            let projection = MathUtil.polarProjection(GetUnitX(actor.unit), GetUnitY(actor.unit), 300, GetUnitFacing(actor.unit) + 180);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 350, damage, DamageType.s_物理, projection.x, projection.y)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\eff_002.mdx"), projection.x, projection.y,
                actor.get("modelScale", 0.4))
        }

        /**
         * 死神号
         * 攻击力+35%
         * 600范围内护甲-50
         */
        ActorTypeUtil.registerActorType({
            id: "死神号技能护甲Buff",
            name: "死神号-50护甲",
            attribute: {def: -50},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 3,
            levelMax: 1,
        })
        //one case
        actorType = ActorTypeUtil.getActorType("死神号基础技能");
        actorType.interval = 2
        actorType.onUnitInterval = actor => {
            let enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600);
            if (enemyUnitsInRange == null || enemyUnitsInRange.length == 0) {
                return
            }
            for (let unit of enemyUnitsInRange) {
                ActorBuffUtil.addActorBuff(unit, "死神号技能护甲Buff")
            }
        }


        /**
         * 歼星号
         * 每0.3秒对周围一个敌人造成500+力量x3的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("歼星号基础技能");
        actorType.interval = actorType.interval || 0.3
        actorType.onUnitInterval = actor => {
            let enemyInRange = SelectUtil.getRandomEnemyInRange(actor.unit, 300);
            if (!IsHandle(enemyInRange)) {
                return
            }
            let damage = UnitStateUtil.calculateStateFormula({base: 500, str: 3}, actor.unit);
            DamageRecordUtil.damage(actor.getName(), actor.unit, enemyInRange, damage, DamageType.s_物理)
            EffectUtil.addSpecialEffectTargetAndDestroy("圆形范围伤害特效\\devilslam.mdx", enemyInRange, TargetAttach.origin, 0.1)
        }
    }

}

