import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import UnitRewardUtil from "@/UnitRewardUtil";
import TextTagUtil from "@/TextTagUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import ActorUnit from "@/ActorUnit";
import 主炮基础事件 from "./主炮基础事件";
import GuardUtil from "@/GuardUtil";

export default class 人族兵营号主炮 {


    constructor() {
        let appActorUnitType: AppActorUnitType = null;
        //one case
        appActorUnitType = 人族兵营号主炮.createActorType("骑士", "units\\human\\Knight\\Knight.mdx");
        //骑士：攻击100%眩晕0.4秒，且附带2000额外伤害
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            UnitStateUtil.stunUnit(enemy, 0.4)
            event.resultDamage += 2000
        };
        //one case
        //火枪手：攻击力/攻速+100%。（远1000射程）
        appActorUnitType = 人族兵营号主炮.createActorType("火枪手", "units\\human\\Rifleman\\Rifleman.mdx");
        appActorUnitType.range = 1200
        appActorUnitType.acquireRange = 1200
        appActorUnitType.damageCd = 0.25
        //one case
        appActorUnitType = 人族兵营号主炮.createActorType("兵营号农民", "units\\human\\Peasant\\Peasant.mdx");

        appActorUnitType.interval = 1
        appActorUnitType.onUnitInterval = (actor) => {
            TextTagUtil.textGold("+" + UnitRewardUtil.addGoldWithEarnGoldP(actor.unit, 100), actor.unit)
        };
        /**
         * 射程：200
         * 伤害：攻击力x1
         * 射速：0.5
         * 特殊：召唤3个不可控的无敌单位，分别是
         * 骑士：攻击100%眩晕0.4秒，且附带2000额外伤害
         * 火枪手：攻击力/攻速+100%。（远1000射程）
         * 农民：每秒+100金币。
         */
        let actorType = ActorTypeUtil.getActorType("人族兵营号主炮");
        //召唤物逻辑
        actorType.onCreated = (actor) => {
            let zhws: ActorUnit[] = []
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "骑士", actor.unitX, actor.unitY))
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "火枪手", actor.unitX, actor.unitY));
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "兵营号农民", actor.unitX, actor.unitY));
            for (let zhw of zhws) {
                zhw.set("damage", UnitStateUtil.getDamageMax(actor.unit))
                SetUnitPressUIVisible?.(zhw.unit, false)
                GuardUtil.setGuard(zhw.unit, actor.unit, 3, 600, 800, 1500, 2)
                UnitStateUtil.setDamageBase(zhw.unit, UnitStateUtil.getDamageMax(actor.unit))
            }
            actor.zhws = zhws;
        }
        //同步伤害值
        actorType.interval = 3;
        actorType.onUnitInterval = (actor) => {
            let zhws: ActorUnit[] = actor.zhws
            if (zhws) {
                for (let zhw of zhws) {
                    zhw.set("damage", UnitStateUtil.getDamageMax(actor.unit))
                }
            }
        }
        actorType.onDestroy = (actor) => {
            let zhws: ActorUnit[] = actor.zhws
            if (zhws) {
                for (let zhw of zhws) {
                    zhw.destroy()
                }
            }
            主炮基础事件.onDestroy(actor)
        }
    }


    static createActorType(id: string, model: string): AppActorUnitType {
        let actorUnitType = {
            id: id,
            templateType: "远程单位",
            name: id,
            range: 200,
            damageCd: 0.5,
            acquireRange:1300,
            model: model,
            moveSpeed:522,
            moveType: "两栖",
            abilities: ["Avul", "Aloc"],
        } as AppActorUnitType
        ActorTypeUtil.registerActorType(actorUnitType);
        return actorUnitType;
    }

}