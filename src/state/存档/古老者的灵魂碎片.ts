import ActorTypeUtil from "@/ActorTypeUtil";
import RandomUtil from "@/RandomUtil";
import PlayerUtil from "@/PlayerUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_深度海域存档} from "../../xlsx/存档/深度海域存档";
import ActorBuffUtil from "@/ActorBuffUtil";
import BaseUtil from "@/BaseUtil";
import HeroUtil from "@/HeroUtil";

export default class 古老者的灵魂碎片 {

    /**
     *
     * （集齐25个可解锁古老者的灵魂，杀敌有30%概率全属性+1，每多搜集5个，概率+10%，只有5级）
     *
     *
     */

    constructor() {
        BaseUtil.runLater(1, () => {
            this.init()
        })

    }


    init() {

        let actorType = ActorTypeUtil.registerActorType({
            id: "古老者的灵魂",
            class: "宝物",
            tag: "进化继承",
            icon: "ReplaceableTextures\\CommandButtons\\BTNDestroyer.blp",
            describe: "杀敌有30%概率全属性+1，每多搜集5个，概率+10%，只有5级"
        });
        actorType.onUnitKillEnemy = (actor, enemy) => {
            let c = 0.3 + (0.1 * actor.level)
            if (RandomUtil.isInChance(c)) {
                HeroUtil.addHeroProperty(actor.unit, 1)
            }
        };


        PlayerUtil.forUsers(player => {
            let spCount = ArchiveUtil.get(player, d_深度海域存档[7].requireKey) || 0;
            ActorTypeUtil.setTypeDescribe(d_深度海域存档[7].id, "|cff00ff00当前数量:" + spCount + "|r|n" + d_深度海域存档[7].describe, player)
            if (spCount && spCount >= 25) {
                let hero = PlayerUtil.getHero(player);
                let actorBuff = ActorBuffUtil.addActorBuff(hero, "古老者的灵魂");
                actorBuff.level = Math.floor((spCount - 25) / 5) + 1;
            }
        });


    }


}