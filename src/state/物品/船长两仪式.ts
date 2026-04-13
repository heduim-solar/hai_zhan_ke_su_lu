import ActorTypeUtil from "@/ActorTypeUtil";
import SelectUtil from "@/SelectUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import RandomUtil from "@/RandomUtil";
import TextTagUtil from "@/TextTagUtil";
import UnitUtil from "@/UnitUtil";
import UnitStateUtil from "@/UnitStateUtil";

export default class 船长两仪式 {


    constructor() {


        /**
         * 攻击力+6666
         * 射程：800
         * 伤害：2000+攻击力x2.5
         * 射速：0.35
         * 特殊：
         * 1、任意伤害有20%概率x3。
         * 2、范围600的敌人护甲-30%
         */
        //one case
        ActorTypeUtil.registerActorType({
            id: "两仪式Buff",
            name: "两仪式-30%护甲",
            describe: "护甲-30%",
            attribute: {def_p: -0.3},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 3,
            levelMax: 1,
        })
        //one case
        let actorType = ActorTypeUtil.getActorType("两仪式");
        actorType.interval = 2
        actorType.onUnitInterval = actor => {
            let enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600);
            if (enemyUnitsInRange == null || enemyUnitsInRange.length == 0) {
                return
            }
            for (let unit of enemyUnitsInRange) {
                ActorBuffUtil.addActorBuff(unit, "两仪式Buff")
            }
        }
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.2)) {
                TextTagUtil.text("|cffff0000两仪式x3", enemy);
                event.resultDamage *= 3;
            }
        }

        /**
         * 攻击力+8888
         * 射程：800
         * 伤害：2000+攻击力x3
         * 射速：0.3
         * 特殊：
         * 1、任意伤害有30%概率x3。
         * 2、范围600的敌人护甲-35%
         * 3、该伤害有10%概率秒杀普通单位（非英雄单位）。
         */
        //one case
        ActorTypeUtil.registerActorType({
            id: "两仪织Buff",
            name: "两仪织-35%护甲",
            describe: "护甲-35%",
            attribute: {def_p: -0.35},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 3,
            levelMax: 1,
        })
        //one case
        actorType = ActorTypeUtil.getActorType("两仪织");
        actorType.interval = 2
        actorType.onUnitInterval = actor => {
            let enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600);
            if (enemyUnitsInRange == null || enemyUnitsInRange.length == 0) {
                return
            }
            for (let unit of enemyUnitsInRange) {
                ActorBuffUtil.addActorBuff(unit, "两仪式Buff")
            }
        }
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.05) && !UnitUtil.isHero(enemy)) {
                if (gv.深度海域层数 && gv.深度海域层数 > 0) {
                    return
                }
                actor.ifReady(30, () => {
                    TextTagUtil.text("|cffff0000两仪织秒杀", enemy);
                    event.resultDamage = UnitStateUtil.getMaxLife(enemy);
                    EXSetEventDamage(event.resultDamage);
                    event.consumed = true;//不要再走后面的事件了
                }, "秒杀");
            } else if (RandomUtil.isInChance(0.2)) {
                TextTagUtil.text("|cffff0000两仪式x3", enemy);
                event.resultDamage *= 3;
            }
        }

    }


}