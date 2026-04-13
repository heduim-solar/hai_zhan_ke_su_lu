import SolarDamageState from "@/SolarDamageState";
import UnitUtil from "@/UnitUtil";

/**
 * 自定义的英雄（boss）增伤
 */
declare global {
    interface AppAttribute {
        对英雄增加伤害?: number
        受到英雄伤害减免?: number
    }
}
export default class 英雄增伤 {


    constructor() {

        SolarDamageState.addEventHandlerLast(event => {
            //获取受伤单位的 伤害忽略
            let 对英雄增加伤害 = event.u1sa?.对英雄增加伤害;
            if (对英雄增加伤害 && UnitUtil.isHero(event.unit0)) {
                event.resultDamage *= (1 + 对英雄增加伤害)
            }
            //获取受伤单位的 伤害忽略
            let 受到英雄伤害减免 = event.u0sa?.受到英雄伤害减免;
            if (受到英雄伤害减免 && UnitUtil.isHero(event.unit1)) {
                event.resultDamage *= (1 - 受到英雄伤害减免)
            }
        })


    }

}