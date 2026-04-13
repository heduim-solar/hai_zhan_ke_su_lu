import ActorTypeUtil from "@/ActorTypeUtil";
import RandomUtil from "@/RandomUtil";
import ActorItemUtil from "@/ActorItemUtil";
import ActorItem from "@/ActorItem";
import ActorUnitUtil from "@/ActorUnitUtil";

export default class 船长进阶 {

    constructor() {
        let actorType: AppActorType = null;
        //击杀任意单位0.1%概率升级
        actorType = ActorTypeUtil.getActorType("黑胡子");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            if (RandomUtil.isInChance(0.001)) {
                //进阶黑胡子
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("暗·黑胡子", unit)
            }
        }
        //携带白胡子，等级达到15级或更高。
        actorType = ActorTypeUtil.getActorType("白胡子");
        actorType.onUnitLevelChange = (actor, delta) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            if (actor.unitLevel >= 15) {
                //进阶黑胡子
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("年轻·白胡子", unit)
            }
        }
        //携带雷霆支配者杀敌800。
        actorType = ActorTypeUtil.getActorType("雷霆支配者");
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(800)
        }
        actorType.onUnitKillEnemy = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            if (actorItem.addUses(-1) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("雷霆毁灭者", unit)
            }
        }
        //携带艾尼路杀敌600。
        actorType = ActorTypeUtil.getActorType("艾尼路");
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(600)
        }
        actorType.onUnitKillEnemy = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            if (actorItem.addUses(-1) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("神·艾尼路", unit)
            }
        }
        //小丑。 携带小丑，击杀20根触手升级到【小丑皇】|r
        actorType = ActorTypeUtil.getActorType("小丑");
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(20)
        }
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            if (ActorUnitUtil.isActorUnitType(deathEnemy, "进攻怪-触手") && actorItem.addUses(-1) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("小丑皇", unit)
            }
        }
        //携带两仪式升级，有10%概率进化。。
        actorType = ActorTypeUtil.getActorType("两仪式");
        actorType.onUnitLevelChange = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            if (RandomUtil.isInChance(0.1)) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("两仪织", unit)
            }
        }
        //激光炮LV5攻击次数达到3000次升级
        actorType = ActorTypeUtil.getActorType("激光炮lv5");
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(3000)
        }
        actorType.onUnitDamageEnemy = (actor) => {
            if (!(actor instanceof ActorItem)){
                return
            }
            let actorItem = actor as ActorItem
            if (actorItem.addUses(-1) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("炮姐", unit)
            }
        }


    }

}