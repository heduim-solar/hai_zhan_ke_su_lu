import ActorTypeUtil from "@/ActorTypeUtil";
import RandomUtil from "@/RandomUtil";
import BaseUtil from "@/BaseUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";
import ActorUtil from "@/ActorUtil";
import TextTagUtil from "@/TextTagUtil";
import ActorAbility from "@/ActorAbility";
import DamageType from "@/DamageType";
import ActorBuffUtil from "@/ActorBuffUtil";

/**
 魔法船
 主动，对400目标范围随机释放以下法术。
 龙卷风：范围5秒内每0.1秒造成20+智力x0.15的伤害。
 地震：范围减速3秒，每秒造成200+力量x2的伤害。
 星落：敏捷x8的伤害。
 冷却时间5秒。
 */
export default class 魔法船基础技能 {


    constructor() {
        let actorType = ActorTypeUtil.getActorType("魔法船基础技能");
        actorType.onAction = (actor, data) => {
            let randomPercent = RandomUtil.randomPercent();
            if (randomPercent < 0.34) {
                魔法船基础技能.龙卷风(actor as ActorAbility);
            } else if (randomPercent < 0.68) {
                魔法船基础技能.地震(actor as ActorAbility);
            } else {
                魔法船基础技能.星落(actor as ActorAbility);
            }
        }
        //地震buff
        ActorTypeUtil.registerActorType({
            id: "魔法船基础技能_地震_buff",
            name: "地震",
            describe: "减速",
            icon: "ReplaceableTextures\\CommandButtons\\BTNVolcano.blp",
            dur: 2,
            attribute: {move_speed: -150}
        })

    }

    // 龙卷风：范围5秒内每0.1秒造成20+智力x0.15的伤害。
    static 龙卷风(actor: ActorAbility) {
        TextTagUtil.text("龙卷风", actor.unit)
        let x = actor.getSpellTargetX();
        let y = actor.getSpellTargetY();
        let i = 0;
        BaseUtil.runLater(0.1, () => {
            i++;
            let damage = UnitStateUtil.calculateStateFormula({
                base: 20,
                int: 0.15
            }, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 400), damage, DamageType.s_法术, x, y)
            if (i % 10 == 0) {
                EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "model\\基本技能\\龙卷风.mdx"),
                    x, y, actor.get("modelScale", 0.8))
            }
        }, 50, true)

    }

    //地震：范围减速3秒，每秒造成200+力量x2的伤害。
    static 地震(actor: ActorAbility) {
        TextTagUtil.text("地震", actor.unit)
        let x = actor.getSpellTargetX();
        let y = actor.getSpellTargetY();
        BaseUtil.runLater(1, () => {
            let damage = UnitStateUtil.calculateStateFormula({
                base: 200,
                str: 2
            }, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 400), damage, DamageType.s_法术, x, y)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "model\\基本技能\\地震.mdx"),
                x, y, actor.get("modelScale", 1))
            SelectUtil.forEnemyUnitsInRange(actor.unit, 400, u => {
                ActorBuffUtil.addActorBuff(u, "魔法船基础技能_地震_buff")
            }, x, y);
        }, 3, true)
    }

    //星落：敏捷x8的伤害。
    static 星落(actor: ActorAbility) {
        TextTagUtil.text("星落", actor.unit)
        let x = actor.getSpellTargetX();
        let y = actor.getSpellTargetY();
        let damage = UnitStateUtil.calculateStateFormula({
            agi: 8
        }, actor.unit);
        DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 400), damage, DamageType.s_法术, x, y)
        EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "model\\基本技能\\星落.mdx"),
            x, y, actor.get("modelScale", 1))
    }

}

