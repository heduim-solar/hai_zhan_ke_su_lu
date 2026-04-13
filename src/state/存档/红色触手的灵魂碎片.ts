import ActorTypeUtil from "@/ActorTypeUtil";
import RandomUtil from "@/RandomUtil";
import UnitStateUtil from "@/UnitStateUtil";
import TextTagUtil from "@/TextTagUtil";
import PlayerUtil from "@/PlayerUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_深度海域存档} from "../../xlsx/存档/深度海域存档";
import ActorBuffUtil from "@/ActorBuffUtil";
import BaseUtil from "@/BaseUtil";

export default class 红色触手的灵魂碎片 {


    constructor() {
        BaseUtil.runLater(1, () => {
            this.init()
        })

    }

    init() {

        let actorType = ActorTypeUtil.registerActorType({
            id: "红色触手的灵魂",
            class: "宝物",
            tag: "进化继承",
            icon: "ReplaceableTextures\\CommandButtons\\BTNTentacle.blp",
            describe: "全属性+20，主炮造成伤害时有30%的概率使用触手击晕目标1秒并且造成10000的额外伤害(内置15秒cd)"
        });
        actorType.attribute = {
            full_property: 20
        }
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.3)) {
                actor.ifReady(15, () => {
                    UnitStateUtil.stunUnit(enemy, 1);
                    event.resultDamage += 10000;
                    TextTagUtil.textWarn("红色触手", enemy)
                });
            }
        };


        PlayerUtil.forUsers(player => {
            let spCount = ArchiveUtil.get(player, d_深度海域存档[0].requireKey) || 0;
            ActorTypeUtil.setTypeDescribe(d_深度海域存档[0].id, "|cff00ff00当前数量:" + spCount + "|r|n" + d_深度海域存档[0].describe, player)
            if (spCount && spCount >= 10) {
                let hero = PlayerUtil.getHero(player);
                let actorBuff = ActorBuffUtil.addActorBuff(hero, "红色触手的灵魂");
            }
        });


    }


}