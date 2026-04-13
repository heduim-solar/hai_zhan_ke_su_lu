/**
 * 可以根据此类方式 对太阳基础属性与伤害系统 进行扩展 以达到自己的要求
 */

import SolarDamageState from '@/SolarDamageState';
import SelectUtil from '@/SelectUtil';
import DamageUtil from '@/DamageUtil';
import TextTagUtil from '@/TextTagUtil';
import ColorStr from '@/ColorStr';
import TextUtil from '@/TextUtil';
import CoolDown from '@/CoolDown';

/**
 * 自定义的分裂伤害
 */
declare global {
    interface AppAttribute {
        split_damage?: number
        split_damage_range?: number
    }
}
export default class AA_split_damage {
    static coolDown: CoolDown = new CoolDown(1);

    constructor() {
        SolarDamageState.config.damageEventHandlers.push(this.damageEventHandler)
    }

    damageEventHandler(event) {
        //split_damage 自定义的分裂伤害
        if (event.isAttack && event.isPhysical && event.u1sa?.split_damage) {
            SelectUtil.forEnemyUnitsInRange(event.unit1, event.u1sa.split_damage_range ?? 300, enemyUnit => {
                if (enemyUnit == event.unit0) {
                    return
                }
                let flsh = event.resultDamage * event.u1sa?.split_damage;
                DamageUtil.damage(event.unit1, enemyUnit, flsh)
                AA_split_damage.coolDown.ifReady(() => {
                    let texttag = TextTagUtil.text(ColorStr.red + "分裂:" + TextUtil.toCnUnit(flsh), enemyUnit);
                    TextTagUtil.setRandomVelocity(texttag)
                });
            })

        }
    }


}