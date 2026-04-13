/** @noSelf **/
export default class BoolUtil {


    /**
     * 默认为触发单位是玩家1的敌人？
     * @param unit
     * @param player
     * @constructor
     */
    static isUnitEnemy(unit: unit = GetTriggerUnit(), player: player = Player(0)): boolean {
        return IsUnitEnemy(unit, player)
    }


    /**
     * 判断变量是否存在于数组中
     */
    static isValInArray(sz: any[], bl: any): boolean {
        for (const iterator of sz) {
            if (iterator == bl) {
                return true
            }
        }
        return false
    }

}
