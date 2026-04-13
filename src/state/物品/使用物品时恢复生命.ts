import UnitStateUtil from "@/UnitStateUtil";
import {d_修理工} from "../../xlsx/装备/修理工";
import ActorItemUtil from "@/ActorItemUtil";

export default class 使用物品时恢复生命 {

    static cfg: {
        [物品类型: string]: {
            base: number,
            life_p: number,
        }
    } = {}


    constructor() {
        for (let data of d_修理工) {
            使用物品时恢复生命.cfg[data.id] = {
                base: data.attribute.reply_life_on_pers,
                life_p: data.reply_life_p,
            }


        }

        se.onUnitUseItem(e => {

            let cfgElement = 使用物品时恢复生命.cfg[ActorItemUtil.getActorItemTypeId(e.manipulatedItem)];
            if (!cfgElement) {
                return
            }
            let unit = e.trigUnit;
            UnitStateUtil.addLife(unit, cfgElement.base * 50)
            UnitStateUtil.addLife(unit, UnitStateUtil.getMaxLife(unit) * cfgElement.life_p)

        })


    }


}