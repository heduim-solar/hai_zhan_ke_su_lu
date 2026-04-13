import ActorTypeUtil from "@/ActorTypeUtil";
import {d_秃鹫} from "../../xlsx/单位/秃鹫";
import GuardUtil from "@/GuardUtil";
import Actor from "@/Actor";
import BaseUtil from "@/BaseUtil";
import UnitStateUtil from "@/UnitStateUtil";
import TextTagUtil from "@/TextTagUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import ActorUtil from "@/ActorUtil";
import 魔改道具 from "../商城/魔改道具";

export default class 秃鹫王主炮 {


    constructor() {
        /**
         * 射程：200
         * 伤害：攻击力x1（2）
         * 射速：0.5
         * 特殊：秃鹫会自动索敌，但离开秃鹫1000范围会被召回。
         */

        let actorType = ActorTypeUtil.getActorType("秃鹫王");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.damageStateFormula = {attack: 2};
                } else {
                    aController.damageStateFormula = {attack: 1};
                }
            }
        }
        /**
         * 秃鹫王主炮 技能A
         * 秃鹫王
         * 每3分钟额外召唤一个秃鹫。至多拥有12个秃鹫。
         * 允许上岸
         */
        actorType = ActorTypeUtil.getActorType("秃鹫王基础技能");
        actorType.onCreated = (actor) => {
            actor.秃鹫数量 = 魔改道具.主炮是否拥有魔改道具(actor) ? 6 : 4;
            for (let i = 0; i < actor.秃鹫数量; i++) {
                秃鹫王主炮.创建秃鹫(actor.unit, actor)
            }

            actor.秃鹫攻击刷新计时器 = BaseUtil.onTimer(5, count => {
                let us: unit[] = actor.秃鹫数组
                for (let u of us) {
                    UnitStateUtil.setDamageBase(u, UnitStateUtil.getDamageMax(actor.unit))
                }
                return true;
            });
        }
        actorType.interval = 180;
        actorType.onUnitInterval = actor => {
            if (actor.秃鹫数量 >= 12) {
                actor.sTimer?.destroy()
                return
            }
            TextTagUtil.text("秃鹫来了", actor.unit)
            秃鹫王主炮.创建秃鹫(actor.unit, actor)
            actor.秃鹫数量++;
        }
        actorType.onDestroy = actor => {
            actor.秃鹫攻击刷新计时器?.destroy()
            let us: unit[] = actor.秃鹫数组
            for (let u of us) {
                RemoveUnit(u)
            }
            actor.秃鹫数组 = null;
        }
    }


    static 创建秃鹫(u: unit, actor: Actor) {
        let pet = CreateUnit(GetOwningPlayer(u), d_秃鹫[0].id, GetUnitX(u), GetUnitY(u), 0);
        // UnitAddAbility(pet, "Awan")
        UnitAddAbility(pet, "Avul")
        UnitAddAbility(pet, "Aloc")
        UnitStateUtil.setDamageRange(pet, 200)
        SetUnitPressUIVisible?.(pet, false)
        // SetUnitAcquireRange(pet,1200)
        GuardUtil.setGuard(pet, u, 3, 600, 800, 1500, 5)
        UnitStateUtil.setDamageBase(pet, UnitStateUtil.getDamageMax(actor.unit))
        if (actor.秃鹫数组 == null) {
            actor.秃鹫数组 = []
        }
        let us: unit[] = actor.秃鹫数组
        us.push(pet)
        return pet;
    }


}