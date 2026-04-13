import AttributeUtil from '@/AttributeUtil';
import UnitStateUtil from '@/UnitStateUtil';
import PlayerUtil from "@/PlayerUtil";
import DataBase from "@/DataBase";

/**
 * 自定义的杀敌加生命
 * 杀敌加生命增幅
 */
declare global {
    interface AppAttribute {
        /**杀敌加生命*/
        /**杀敌时恢复当前生命值*/
        reply_life_on_kill?: number
        /**单位每击杀一个敌人增加生命值上限的量。不受杀敌倍率的影响，初始值为0*/
        add_max_life_on_kill?: number
        /**杀敌加生命增幅*/
        /**按比例增幅单位的杀敌加生命值上限数值，初始值为0%。当不为0时，以(+XX%)的方式现在在属性面板的对应属性后面*/
        add_max_life_on_kill_p?: number
        /**攻击*/
        add_attack_on_kill?: number
        add_attack_on_kill_p?: number

        /**护甲*/
        add_def_on_kill?: number
        add_def_on_kill_p?: number

        /**力量*/
        add_strength_on_kill?: number
        add_strength_on_kill_p?: number

        /**敏捷*/
        add_agility_on_kill?: number
        add_agility_on_kill_p?: number

        /**智力*/
        add_intelligence_on_kill?: number
        add_intelligence_on_kill_p?: number


        /**杀敌金币*/
        add_gold_on_kill?: number
        /**杀敌加额外的杀敌数*/
        add_killCount_on_kill?: number


    }
}
export default class 杀敌加属性 {
    constructor() {
        se.onUnitDeath((e) => {
            if (!e.hasKillingUnit) {
                return
            }
            let triggerunit = e.trigUnit;
            let killunit = e.killingUnit;

            let attribute: AppAttribute = AttributeUtil.getUnitAttribute(killunit);
            if (IsUnitEnemy(triggerunit, GetOwningPlayer(killunit)) && IsHandle(killunit) && attribute) {
                if (attribute.reply_life_on_kill) {
                    UnitStateUtil.addLife(killunit, attribute.reply_life_on_kill)
                }
                //获得初始的
                let add_max_life = attribute.add_max_life_on_kill || 0
                let add_max_life_on_kill_p = attribute.add_max_life_on_kill_p || 0
                //如果单位的杀敌加生命增幅存在,则修改储存的基础杀敌加生命以及刷新生命增幅
                if (add_max_life_on_kill_p != 0) {
                    add_max_life = add_max_life * (add_max_life_on_kill_p + 1)
                }
                // print("增加生命上限"+add_max_life)
                if (add_max_life > 0) {
                    UnitStateUtil.addMaxLifeAndLife(killunit, add_max_life)
                }

                //杀敌加攻击
                let add_attack_on_kill = attribute.add_attack_on_kill || 0
                let add_attack_on_kill_p = attribute.add_attack_on_kill_p || 0
                if (add_attack_on_kill_p != 0) {
                    add_attack_on_kill = add_attack_on_kill * (add_attack_on_kill_p + 1)
                }
                if (add_attack_on_kill > 0) {
                    let attack = GetUnitState(killunit, ConvertUnitState(0x12))
                    UnitStateUtil.setDamageBase(killunit, (add_attack_on_kill + attack))
                    // AttributeUtil.getUnitAttribute(killunit).add_attack_on_kill
                }

                //杀敌加护甲
                let add_def_on_kill = attribute.add_def_on_kill || 0
                let add_def_on_kill_p = attribute.add_def_on_kill_p || 0
                if (add_def_on_kill_p != 0) {
                    add_def_on_kill = add_def_on_kill * (add_def_on_kill_p + 1)
                }
                if (add_def_on_kill > 0) {
                    let def = GetUnitState(killunit, ConvertUnitState(0x20))
                    UnitStateUtil.setArmor(killunit, (add_def_on_kill + def))
                    // AttributeUtil.getUnitAttribute(killunit).add_attack_on_kill
                }

                //杀敌加力量
                let add_strength_on_kill = attribute.add_strength_on_kill || 0
                let add_strength_on_kill_p = attribute.add_strength_on_kill_p || 0
                if (add_strength_on_kill_p != 0) {
                    add_strength_on_kill = add_strength_on_kill * (add_strength_on_kill_p + 1)
                }
                if (add_strength_on_kill > 0) {
                    SetHeroStr(killunit, (GetHeroStr(killunit, false) + add_strength_on_kill), true)
                }


                //杀敌加敏捷
                let add_agility_on_kill = attribute.add_agility_on_kill || 0
                let add_agility_on_kill_p = attribute.add_agility_on_kill_p || 0
                if (add_agility_on_kill_p != 0) {
                    add_agility_on_kill = add_agility_on_kill * (add_agility_on_kill_p + 1)
                }
                if (add_agility_on_kill > 0) {
                    SetHeroAgi(killunit, (GetHeroAgi(killunit, false) + add_agility_on_kill), true)
                }

                //杀敌加智力
                let add_intelligence_on_kill = attribute.add_intelligence_on_kill || 0
                let add_intelligence_on_kill_p = attribute.add_intelligence_on_kill_p || 0
                if (add_intelligence_on_kill_p != 0) {
                    add_intelligence_on_kill = add_intelligence_on_kill * (add_intelligence_on_kill_p + 1)
                }
                if (add_intelligence_on_kill > 0) {
                    SetHeroInt(killunit, (GetHeroInt(killunit, false) + add_intelligence_on_kill), true)
                }

                if (attribute.add_killCount_on_kill && attribute.add_killCount_on_kill > 0) {
                    let solarData = DataBase.getPlayerSolarData(GetOwningPlayer(killunit), true);
                    solarData.killCount = (solarData.killCount || 0) + attribute.add_killCount_on_kill
                }

                let gold = attribute.add_gold_on_kill || 0
                let basics_gold = attribute.earn_gold_p || 0
                if (gold != 0 && basics_gold != 0) {
                    gold = gold * (basics_gold + 1)
                }
                if (gold > 0) {
                    PlayerUtil.addGoldState(GetOwningPlayer(killunit), gold)
                }


            }
        })

    }
}