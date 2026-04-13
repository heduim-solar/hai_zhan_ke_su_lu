import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import ActorUnit from "@/ActorUnit";
import 主炮基础事件 from "./主炮基础事件";
import GuardUtil from "@/GuardUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import BounceMissileController from "@/BounceMissileController";

export default class 暗夜精灵号主炮 {


    constructor() {
        let appActorUnitType: AppActorUnitType = null;
        //one case
        //奇美拉：攻击附带100%的300范围溅射。（远500射程）
        appActorUnitType = 暗夜精灵号主炮.createActorType("奇美拉", "units\\nightelf\\Chimaera\\Chimaera.mdx");
        appActorUnitType.missileModel = "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdx"
        appActorUnitType.moveType = "fly"
        appActorUnitType.flyHeight = 200
        appActorUnitType.acquireRange = 1000
        appActorUnitType.range = 700
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(),actor.unit, 300, event.resultDamage, GetUnitX(enemy), GetUnitY(enemy))
        };
        //one case
        //月骑：攻击弹射7次。（远400射程）
        appActorUnitType = 暗夜精灵号主炮.createActorType("月骑", "units\\nightelf\\Huntress\\Huntress.mdx");
        appActorUnitType.missileModel = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdx"
        appActorUnitType.acquireRange = 1000
        appActorUnitType.range = 600
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            let bounceMissileController = new BounceMissileController(actor.unit);
            bounceMissileController.loopCount = 7;
            bounceMissileController.projectileModelPath = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdx";
            bounceMissileController.range = 600;
            bounceMissileController.damageStateFormula = {attack: 1};
            bounceMissileController.hitUnitList.push(enemy);
            bounceMissileController.launch();
        };
        //one case
        //弓箭手：可攻击7个单位（远600射程）。
        appActorUnitType = 暗夜精灵号主炮.createActorType("弓箭手", "units\\nightelf\\Archer\\Archer.mdx");
        appActorUnitType.acquireRange = 800
        appActorUnitType.range = 800
        //多重剑7
        appActorUnitType.abilities.push("a44u")
        /**
         * 射程：200
         * 伤害：攻击力x1
         * 射速：0.5
         * 特殊：召唤3个不可控的无敌单位，分别是
         * 奇美拉：攻击附带100%的300范围溅射。（远500射程）
         * 月骑：攻击弹射7次。（远400射程）
         * 弓箭手：可攻击7个单位（远600射程）。
         */
        let actorType = ActorTypeUtil.getActorType("暗夜精灵号主炮");
        //召唤物逻辑
        actorType.onCreated = (actor) => {
            let zhws: ActorUnit[] = []
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "奇美拉", actor.unitX, actor.unitY))
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "月骑", actor.unitX, actor.unitY));
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "弓箭手", actor.unitX, actor.unitY));
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
            moveSpeed:522,
            model: model,
            moveType: "两栖",
            abilities: ["Avul", "Aloc"],
        } as AppActorUnitType
        ActorTypeUtil.registerActorType(actorUnitType);
        return actorUnitType;
    }

}