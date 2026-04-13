import ActorUnitUtil from "@/ActorUnitUtil";
import DamageUtil from "@/DamageUtil";
import DamageType from "@/DamageType";
import SolarDamageState from "@/SolarDamageState";

export default class 造成伤害时附带目标最大生命值比例的伤害 {

    //示例 进攻怪Lv1:0.03 每次攻击会额外造成目标3%生命值伤害
    static config: {
        [单位类型: string]: number
    } = {}


    constructor() {

        SolarDamageState.addEventHandler(e => {
            let configElement = 造成伤害时附带目标最大生命值比例的伤害.config[id2string(GetUnitTypeId(e.unit1))];
            if (configElement == null) {
                let actorUnitTypeId = ActorUnitUtil.getActorUnitTypeId(e.unit1);
                if (actorUnitTypeId != null) {
                    configElement = 造成伤害时附带目标最大生命值比例的伤害.config[actorUnitTypeId];
                }
            }
            if (configElement == null || configElement == 0) {
                return
            }
            DamageUtil.damage(e.unit1, e.unit0, {target_maxHp: configElement}, DamageType.s_真实伤害)
        })
    }


}