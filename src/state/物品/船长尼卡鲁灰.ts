import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";

export default class 船长尼卡鲁灰 {


    /**
     * "1、不死之驱，阵亡后3秒复活，复活无敌时间3秒。
     * 2、每3秒敲响解放之鼓，眩晕1200范围内所有单位1秒，并造成1000+全属性x1.5的伤害。"
     */

    constructor() {

        //one case
        let actorType = ActorTypeUtil.getActorType("尼卡·鲁灰");
        actorType.interval = actorType.interval || 3
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 1000, fullPros: 1.5}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 1200, damage, DamageType.s_真实伤害)
            SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                UnitStateUtil.stunUnit(u, 1)
            })
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\阳光桑尼号基础技能.mdx",
                actor.unitX, actor.unitY, actor.get("modelScale", 2))
        }

    }


}