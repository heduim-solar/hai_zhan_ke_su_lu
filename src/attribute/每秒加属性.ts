import AttributeUtil from '@/AttributeUtil';
import UnitStateUtil from '@/UnitStateUtil';
import {Trigger} from '@/trigger';
import PlayerUtil from "@/PlayerUtil";

/**
 * 自定义的杀敌加生命
 * 杀敌加生命增幅
 */
declare global {
    interface AppAttribute {
        /**每秒加生命*/
        add_max_life_on_pers?: number
        /**每秒加生命增幅*/
        add_max_life_on_pers_p?: number


        /**每秒加攻击力*/
        add_attack_on_pers?: number
        /**每秒加攻击增幅*/
        add_attack_on_pers_p?: number

        /**每秒加护甲*/
        add_def_on_pers?: number
        /**每秒加护甲增幅*/
        add_def_on_pers_p?: number

        /**每秒加力量*/
        add_strength_on_pers?: number
        /**每秒加力量增幅 */
        add_strength_on_pers_p?: number

        /**每秒加敏捷*/
        add_agility_on_pers?: number
        /**每秒加敏捷增幅 */
        add_agility_on_pers_p?: number

        /**每秒加智力*/
        add_intelligence_on_pers?: number
        /**每秒加智力增幅 */
        add_intelligence_on_pers_p?: number

        /**金币效率 */
        earn_gold_p?: number
        /**每秒金币*/
        add_gold_on_pers?: number
    }
}

export default class 每秒加属性 {
    constructor() {
        let t = new Trigger();
        t.registerTimerEvent(1, true)
        t.addAction(() => {
            每秒加属性.doAllUnitsAttribute();
        })
    }


    static doAllUnitsAttribute() {
        AttributeUtil.forAllUnitsAttribute((unitHandle, attribute) => {
            if (attribute.add_max_life_on_pers) {
                let add = attribute.add_max_life_on_pers
                if (attribute.add_max_life_on_pers_p) {
                    add = attribute.add_max_life_on_pers * (attribute.add_max_life_on_pers_p + 1)
                }
                UnitStateUtil.addMaxLifeAndLife(unitHandle, attribute.add_max_life_on_pers)
            }
            //每秒加攻击力
            if (attribute.add_attack_on_pers) {
                let add = attribute.add_attack_on_pers
                if (attribute.add_attack_on_pers_p) {
                    add = attribute.add_attack_on_pers * (attribute.add_attack_on_pers_p + 1)
                }
                let attack = GetUnitState(unitHandle, ConvertUnitState(0x12))
                UnitStateUtil.setDamageBase(unitHandle, (add + attack))
            }
            //每秒加护甲
            if (attribute.add_def_on_pers) {
                let add = attribute.add_def_on_pers
                if (attribute.add_def_on_pers_p) {
                    add = attribute.add_def_on_pers * (attribute.add_def_on_pers_p + 1)
                }
                let def = GetUnitState(unitHandle, ConvertUnitState(0x20))
                UnitStateUtil.setArmor(unitHandle, (add + def))
            }
            //每秒加力量
            if (attribute.add_strength_on_pers) {
                let add = attribute.add_strength_on_pers
                if (attribute.add_strength_on_pers_p) {
                    add = attribute.add_strength_on_pers * (attribute.add_strength_on_pers_p + 1)
                }
                // print("力量"+GetHeroStr(unitHandle, true))
                SetHeroStr(unitHandle, (GetHeroStr(unitHandle, false) + add), true)
            }

            //每秒加敏捷
            if (attribute.add_agility_on_pers) {
                let add = attribute.add_agility_on_pers
                if (attribute.add_agility_on_pers_p) {
                    add = attribute.add_agility_on_pers * (attribute.add_agility_on_pers_p + 1)
                }
                SetHeroAgi(unitHandle, (GetHeroAgi(unitHandle, false) + add), true)
            }
            //每秒加智力
            if (attribute.add_intelligence_on_pers) {
                let add = attribute.add_intelligence_on_pers
                if (attribute.add_intelligence_on_pers_p) {
                    add = attribute.add_intelligence_on_pers * (attribute.add_intelligence_on_pers_p + 1)
                }
                SetHeroInt(unitHandle, (GetHeroInt(unitHandle, false) + add), true)
            }

            if (attribute.add_gold_on_pers) {
                let basics_gold = attribute.add_gold_on_pers
                if (attribute.earn_gold_p) {
                    basics_gold = basics_gold * (attribute.earn_gold_p + 1)
                }
                if (basics_gold > 0) {
                    PlayerUtil.addGoldState(GetOwningPlayer(unitHandle), basics_gold)
                }
            }
        })
    }


}