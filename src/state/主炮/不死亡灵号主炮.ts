import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import ActorUnit from "@/ActorUnit";
import 主炮基础事件 from "./主炮基础事件";
import GuardUtil from "@/GuardUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import EffectUtil from "@/EffectUtil";
import DamageType from "@/DamageType";

export default class 不死亡灵号主炮 {


    constructor() {
        let appActorUnitType: AppActorUnitType = null;
        //one case
        appActorUnitType = 不死亡灵号主炮.createActorType("冰霜巨龙", "units\\undead\\FrostWyrm\\FrostWyrm.mdx");
        appActorUnitType.missileModel = "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdx"
        appActorUnitType.moveType = "fly"
        appActorUnitType.flyHeight = 200
        appActorUnitType.acquireRange = 1000
        appActorUnitType.range = 700
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, event.resultDamage, GetUnitX(enemy), GetUnitY(enemy))
        };
        //one case
        appActorUnitType = 不死亡灵号主炮.createActorType("食尸鬼", "units\\undead\\Ghoul\\Ghoul.mdx");
        appActorUnitType.damageCd = 0.17
        //one case
        appActorUnitType = 不死亡灵号主炮.createActorType("憎恶", "units\\undead\\Abomination\\Abomination.mdx");
        appActorUnitType.interval = 1
        appActorUnitType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({attack: 0.5}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(),actor.unit, 300, damage)
            EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx",
                GetUnitX(actor.unit), GetUnitY(actor.unit), 0.6)
        };
        /**
         * 射程：200
         * 伤害：攻击力x1
         * 射速：0.5
         * 特殊：召唤3个不可控的无敌单位，分别是
         * 冰霜巨龙：攻击附带50%的600范围溅射。（远500射程）
         * 食尸鬼：攻速+300%。
         * 憎恶：每秒对范围300的敌人造成攻击力x0.5的伤害。
         */
        let actorType = ActorTypeUtil.getActorType("不死亡灵号主炮");
        //召唤物逻辑
        actorType.onCreated = (actor) => {
            let zhws: ActorUnit[] = []
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "冰霜巨龙", actor.unitX, actor.unitY))
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "食尸鬼", actor.unitX, actor.unitY));
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "憎恶", actor.unitX, actor.unitY));
            for (let zhw of zhws) {
                zhw.set("damage", UnitStateUtil.getDamageMax(actor.unit))
                SetUnitPressUIVisible?.(zhw.unit, false)
                GuardUtil.setGuard(zhw.unit, actor.unit, 3, 600, 800, 1500, 50)
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

        //
        /**
         * 不死亡灵号
         * 额外拥有一个死亡骑士，死亡骑士拥有50%的分裂攻击。
         */
        //one case
        appActorUnitType = 不死亡灵号主炮.createActorType("死亡骑士", "units\\undead\\EvilArthas\\UndeadArthas.mdx");
        appActorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(),actor.unit, 300, event.resultDamage * 0.5, DamageType.s_物理,
                GetUnitX(enemy), GetUnitY(enemy));
        };
        actorType = ActorTypeUtil.getActorType("不死亡灵号基础技能");
        //召唤物逻辑
        actorType.onCreated = (actor) => {
            let zhws: ActorUnit[] = []
            zhws.push(ActorUnitUtil.createActorUnit(actor.unitOwner, "死亡骑士", actor.unitX, actor.unitY))
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
        }

    }


    static createActorType(id: string, model: string): AppActorUnitType {
        let actorUnitType = {
            id: id,
            templateType: "远程单位",
            name: id,
            range: 200,
            damageCd: 0.5,
            moveSpeed:522,
            acquireRange:1300,
            model: model,
            moveType: "两栖",
            abilities: ["Avul", "Aloc"],
        } as AppActorUnitType
        ActorTypeUtil.registerActorType(actorUnitType);
        return actorUnitType;
    }

}