import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "./主炮基础事件";
import DamageRecordUtil from "@/DamageRecordUtil";
import UnitStateUtil from "@/UnitStateUtil";
import EffectUtil from "@/EffectUtil";
import VestUtil from "@/VestUtil";
import RandomUtil from "@/RandomUtil";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";
import PlayerUtil from "@/PlayerUtil";
import 魔改道具 from "../商城/魔改道具";

export default class 船基础主炮2 {


    constructor() {
        let actorType: AppActorType = null;

        /**
         * 射程：600
         * 伤害：攻击力x2
         * 射速：0.2
         * 特殊：造成伤害时20%概率目标范围350造成智力x5的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("深海之女");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let damage = UnitStateUtil.calculateStateFormula(actor.get("stateFormula", {
                    chance: 0.2,
                    int: 5
                }), actor.unit);
                if (damage > 0) {
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 300, damage)
                    EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                        GetUnitX(actor.unit), GetUnitY(actor.unit), actor.get("modelScale", 0.5))
                }
            }
        }
        /**
         * 射程：800
         * 伤害：攻击力x1.5
         * 射速：0.2
         * 特殊：该主炮攻击时有5%的概率生成一个持续5秒的，造成自身30%伤害的镜像，最多拥有3个镜像。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("蓝色幻影");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                //蓝色幻影生成镜像的概率+5%
                let c = 魔改道具.主炮是否拥有魔改道具(actor) ? 0.1 : 0.05
                if (RandomUtil.isInChance(c) && (actor.phantomUnit || 0) < 3) {
                    VestUtil.createPhantomUnit(actor.unit, 5, 0.3, 2)
                    actor.phantomUnit = (actor.phantomUnit || 0) + 1;
                    BaseUtil.runLater(5, () => {
                        actor.phantomUnit--;
                    })
                }
            }
        }


        /**
         * 射程：400
         * 伤害：攻击力x1.8
         * 射速：0.2
         * 特殊：任意造成的伤害都会增加10点金币。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("皇家宝藏号");
        actorType.onUnitDamageEnemy = (actor, enemy) => {
            PlayerUtil.addGoldState(GetOwningPlayer(actor.unit), 10)
            TextTagUtil.textGold("+10", enemy)
        }


    }


}