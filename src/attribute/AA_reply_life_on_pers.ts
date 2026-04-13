import AttributeUtil from '@/AttributeUtil';
import UnitStateUtil from '@/UnitStateUtil';
import {Trigger} from '@/trigger';

/**
 * 自定义的生命回复
 * 生命回复(比例)
 */
declare global {
    interface AppAttribute {
        /**生命回复*/
        /**每秒恢复生命值的量。初始值为0*/
        reply_life_on_pers?: number
        /**生命回复(比例)*/
        /**每秒根据生命值上限恢复生命值的量。初始值为0%*/
        reply_life_by_p_on_pers?: number
    }
}
export default class AA_reply_life_on_pers {
    constructor() {
        let t = new Trigger();
        t.registerTimerEvent(1, true)
        t.addAction(() => {
            AttributeUtil.forAllUnitsAttribute((unitHandle, attribute) => {
                if (attribute.reply_life_on_pers) {
                    // let reply_life_on_pers=attribute
                    UnitStateUtil.addLife(unitHandle, attribute.reply_life_on_pers)
                }
                if (attribute.reply_life_by_p_on_pers) {
                    let life = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * attribute.reply_life_by_p_on_pers
                    UnitStateUtil.addLife(unitHandle, life)
                }
            })
        })
    }
}