import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import UnitRewardUtil from "@/UnitRewardUtil";
import TextTagUtil from "@/TextTagUtil";
import RandomUtil from "@/RandomUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import ActorUnit from "@/ActorUnit";
import 主炮基础事件 from "./主炮基础事件";
import GuardUtil from "@/GuardUtil";

export default class 兽族兵营号主炮 {


    constructor() {
        let appActorUnitType: AppActorUnitType = null;
        //one case
        appActorUnitType = 兽族兵营号主炮.createActorType("狼骑兵", "units\\orc\\WolfRider\\WolfRider.mdx");
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy) => {
            TextTagUtil.textGold("+" + UnitRewardUtil.addGoldWithEarnGoldP(actor.unit, 50), actor.unit)
        };
        //one case
        appActorUnitType = 兽族兵营号主炮.createActorType("牛头人", "units\\orc\\Tauren\\Tauren.mdx");
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.25)) {
                event.resultDamage *= 3;
            }
        };
        //one case
        appActorUnitType = 兽族兵营号主炮.createActorType("风骑士", "units\\orc\\WyvernRider\\WyvernRider.mdx");
        appActorUnitType.moveType = "飞行"
        appActorUnitType.flyHeight = 200
        appActorUnitType.range = 800
        appActorUnitType.acquireRange = 800
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.3)) {
                event.resultDamage *= 5;
            }
        };
        /**
         * 射程：200
         * 伤害：攻击力x1
         * 射速：0.5
         * 特殊：召唤3个不可控的无敌单位，分别是
         * 狼骑兵：攻击杀敌+50金币。
         * 牛头人：攻击时25%概率造成攻击力x3的伤害。
         * 风骑士：攻击时30%概率5倍伤害。（远600射程）
         */
        let actorType = ActorTypeUtil.getActorType("兽族兵营号主炮");
        //召唤物逻辑
        actorType.onCreated = (actor) => {
            let zhws: ActorUnit[] = []
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "狼骑兵", actor.unitX, actor.unitY))
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "牛头人", actor.unitX, actor.unitY));
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "风骑士", actor.unitX, actor.unitY));
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
            model: model,
            moveSpeed:522,
            acquireRange:1300,
            moveType: "两栖",
            abilities: ["Avul", "Aloc"],
        } as AppActorUnitType
        ActorTypeUtil.registerActorType(actorUnitType);
        return actorUnitType;
    }

}