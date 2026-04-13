import BaseUtil from "@/BaseUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import PlayerUtil from "@/PlayerUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_深度海域存档} from "../../xlsx/存档/深度海域存档";
import ActorUnitUtil from "@/ActorUnitUtil";
import GuardUtil from "@/GuardUtil";

export default class 大副的灵魂碎片 {

    /**
     * "（集齐20个可解锁大副的灵魂，初始召唤一个继承自己攻击力100%的大副灵魂，攻速为每秒1次）
     * 每多搜集5个，大副的攻速+20%，最大10级。"
     */

    constructor() {
        BaseUtil.runLater(1, () => {
            this.init()
        })

    }

    init() {

        let actorType = ActorTypeUtil.registerActorType({
            id: "大副的灵魂",
            class: "基础",
            templateType: "远程单位",
            icon: "ReplaceableTextures\\CommandButtons\\BTNKelThuzad.blp",
            model: "units\\undead\\Kelthuzad\\Kelthuzad.mdx",
            colorR: 100,
            colorG: 100,
            colorB: 100,
            damageCd: 1,
        } as AppActorUnitType);
        actorType.interval = 5;
        actorType.onUnitInterval = (actor) => {
            let hero = PlayerUtil.getHero(actor.unitOwner);
            if (IsHandle(hero)) {
                UnitStateUtil.setDamageBase(actor.unit, UnitStateUtil.getDamageMax(hero));
                GuardUtil.resetGuard(actor.unit, hero, 3, 600, 800, 1500, 5);
            }
        };


        PlayerUtil.forUsers(player => {
            let spCount = ArchiveUtil.get(player, d_深度海域存档[6].requireKey) || 0;
            ActorTypeUtil.setTypeDescribe(d_深度海域存档[6].id, "|cff00ff00当前数量:" + spCount + "|r|n" + d_深度海域存档[6].describe, player)
            if (spCount && spCount >= 20) {
                let hero = PlayerUtil.getHero(player);
                let actorUnit = ActorUnitUtil.createActorUnit(player, "大副的灵魂", GetUnitX(hero), GetUnitY(hero));
                let cd = 0.2 * Math.floor((spCount - 20) / 5);
                cd = (1 - cd);
                cd = Math.max(0.3, cd);
                actorUnit.set("damageCd", cd);
                UnitAddAbility(actorUnit.unit, "Avul")
                UnitAddAbility(actorUnit.unit, "Aloc")
                UnitStateUtil.setDamageRange(actorUnit.unit, 200)
                SetUnitPressUIVisible?.(actorUnit.unit, false);
                GuardUtil.setGuard(actorUnit.unit, hero, 3, 600, 800, 1500, 5)
            }
        });


    }


}