import BaseUtil from "@/BaseUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import PlayerUtil from "@/PlayerUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_深度海域存档} from "../../xlsx/存档/深度海域存档";
import ActorBuffUtil from "@/ActorBuffUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import EffectUtil from "@/EffectUtil";

export default class 深海巨兽的灵魂碎片 {

    /**
     * "（集齐15个可解锁光环，深海巨兽，每5秒，对周围400范围释放一次毁灭，造成攻击力x0.5的伤害，通用）
     * 每多搜集5个，毁灭的伤害+20%，最大10级"
     */

    constructor() {
        BaseUtil.runLater(1, () => {
            this.init()
        })

    }

    init() {

        let actorType = ActorTypeUtil.registerActorType({
            id: "深海巨兽的灵魂",
            class: "宝物",
            tag: "进化继承",
            icon: "ReplaceableTextures\\CommandButtons\\BTNCrushingWave.blp",
            describe: "每5秒，对周围400范围释放一次毁灭，造成攻击力x0.5的伤害 每多搜集5个，毁灭的伤害+20%，最大10级"
        });
        actorType.interval = 5;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({attack: 0.5}, actor.unit);
            damage *= (1 + (0.2 * actor.level))
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 400), damage)
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\海皇波塞冬基础技能.mdx",
                actor.unitX, actor.unitY, 1);
        };


        PlayerUtil.forUsers(player => {
            let spCount = ArchiveUtil.get(player, d_深度海域存档[4].requireKey) || 0;
            ActorTypeUtil.setTypeDescribe(d_深度海域存档[4].id, "|cff00ff00当前数量:" + spCount + "|r|n" + d_深度海域存档[4].describe, player)
            if (spCount && spCount >= 15) {
                let hero = PlayerUtil.getHero(player);
                let actorBuff = ActorBuffUtil.addActorBuff(hero, "深海巨兽的灵魂");
                actorBuff.level = Math.floor((spCount - 15) / 5) + 1
            }
        });


    }


}