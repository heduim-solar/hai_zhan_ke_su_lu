/**
 * 单位死亡时间 记录工具
 * 主要用于单位handle 重用 清理等相关判断
 * 保证所有单位死亡或移除时一定要设置死亡时间。
 */
export default class UnitDeathTimeUtil {
    private static _sl_deathTimeData: { [hid: number]: number } = {}


    /**
     * 设置死亡时间 (毫秒单位)
     * @param deathUnit
     * @param deathTime
     */
    static setDeathTime(deathUnit: unit, deathTime: number = time) {
        UnitDeathTimeUtil._sl_deathTimeData[GetHandleId(deathUnit)] = deathTime;
    }

    /**
     * 不要依靠清除死亡时间。因为没有完善的清除逻辑(主要是英雄死亡后可复活 单位死亡后也可被复活技能复活)。只能允许新的重用单位 继承  旧死亡单位的死亡时间。但使用时保证单位是死亡的再使用就对了。
     */
    /**
     * 清除单位handle死亡时间 (以减少重用后的handle获得旧handle数据)
     * @param deathUnit
     * @param deathTime
     */
    static clearDeathTime(deathUnit: unit) {
        let hid = GetHandleId(deathUnit);
        if (UnitDeathTimeUtil._sl_deathTimeData[hid] || UnitDeathTimeUtil._sl_deathTimeData[hid] == 0) {
            UnitDeathTimeUtil._sl_deathTimeData[hid] = null;
        }
    }

    /**
     * 是否拥有死亡时间
     * @param deathUnit
     */
    static hasDeathTime(deathUnit: unit): boolean {
        if (UnitAlive(deathUnit)) {
            //还是活着的单位 没有死亡时间
            return false;
        }
        let d = UnitDeathTimeUtil._sl_deathTimeData[GetHandleId(deathUnit)];
        if (d == null) {
            return false;
        }
        return true;
    }

    /**
     * 获取死亡时间 (毫秒单位) 必须单位是死亡的 才能获取正确的死亡时间，活着的单位可能获取继承的旧单位死亡时间。
     * @param deathUnit
     */
    static getDeathTime(deathUnit: unit): number {
        return UnitDeathTimeUtil._sl_deathTimeData[GetHandleId(deathUnit)];
    }

    /**
     * 判断单位死亡是否已经过了（>=）指定时间 （ 必须对已经设置过死亡时间的单位进行判断
     * (在SolarDataClearState中已经对死亡单位时和移除单位时调用了setDeathTime来设置死亡时间)
     * @param deathUnit
     * @param timeSlot (秒单位)
     * @param   如未设定setDeathTime 则默认返回false 且报错
     */
    static isTimeOfDeathExceeded(deathUnit: unit, timeSlot: number = handleReuseMinTime) {
        if (UnitAlive(deathUnit)) {
            //还是活着的单位
            return false;
        }
        let deathTime = UnitDeathTimeUtil.getDeathTime(deathUnit);
        if (deathTime == null || deathTime == 0) {
            log.errorWithTraceBack("正在对一个已死亡但没有设置DeathTime的单位进行死亡时间判断！请先设置死亡单位的死亡时间")
            return false;
        }
        if ((time - deathTime) >= (timeSlot * 1000)) {
            return true;
        }
        return false;
    }


}