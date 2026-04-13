import ActorUnitUtil from "@/ActorUnitUtil";
import SolarDamageState from "@/SolarDamageState";
import UnitStateUtil from "@/UnitStateUtil";

export default class 受到伤害时限制最大伤害值为生命值比例 {

    //示例 进攻怪Lv1:0.03 每次受到伤害最多造成多少生命比例的伤害 防止被秒
    static config: {
        [单位类型: string]: number
    } = {}


    constructor() {


        SolarDamageState.addEventHandlerLast(e => {


            let configElement = 受到伤害时限制最大伤害值为生命值比例.config[id2string(GetUnitTypeId(e.unit0))];
            if (configElement == null) {
                let actorUnitTypeId = ActorUnitUtil.getActorUnitTypeId(e.unit0);
                if (actorUnitTypeId != null) {
                    configElement = 受到伤害时限制最大伤害值为生命值比例.config[actorUnitTypeId];
                }
            }
            if (configElement == null || configElement == 0) {
                return
            }

            e.resultDamage = Math.min(e.resultDamage, UnitStateUtil.calculateStateFormula({
                maxHp: configElement
            }, e.unit0))


        })

    }


}