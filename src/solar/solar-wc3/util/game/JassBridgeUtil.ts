/** @noSelfInFile */
/**
 * 使用前置条件:
 * 需要在自定义函数加上这些jass声明
 *
 */

/** @noSelf */
export default class JassBridgeUtil {
    static sl_bridge: hashtable = require('jass.globals')["sl_bridge"]

    static getResultAsBoolean(): boolean {
        return LoadBoolean(JassBridgeUtil.sl_bridge, 2, 2);
    }

    static getResultAsInt(): number {
        return LoadInteger(JassBridgeUtil.sl_bridge, 2, 2);
    }

    static getResultAsReal(): number {
        return LoadReal(JassBridgeUtil.sl_bridge, 2, 2);
    }

    static getResultAsStr(): string {
        return LoadStr(JassBridgeUtil.sl_bridge, 2, 2);
    }


}