export default class DateUtil {


    /**
     * 传入格式示例：  2023-07-18 15:08:03
     * @param yyyy_mm_dd_H_M_S_DateStr
     * 返回整数为秒单位
     */
    static parseDate(yyyy_mm_dd_H_M_S_DateStr: string): number {
        let yyyy_mm_dd_H_M_S: string = yyyy_mm_dd_H_M_S_DateStr.replaceAll("-", "_")
        yyyy_mm_dd_H_M_S = yyyy_mm_dd_H_M_S.replaceAll(" ", "_")
        yyyy_mm_dd_H_M_S = yyyy_mm_dd_H_M_S.replaceAll(":", "_")
        let yyyy_mm_dd_H_M_SArray: string[] = yyyy_mm_dd_H_M_S.split("_");


        let dataInfo: LuaDateInfo = {
            year: tonumber(yyyy_mm_dd_H_M_SArray[0]),
            month: tonumber(yyyy_mm_dd_H_M_SArray[1]),
            day: tonumber(yyyy_mm_dd_H_M_SArray[2]),
            hour: tonumber(yyyy_mm_dd_H_M_SArray[3]),
            min: tonumber(yyyy_mm_dd_H_M_SArray[4]),
            sec: tonumber(yyyy_mm_dd_H_M_SArray[5]),
        }
        let timeNum = os.time(dataInfo)
        return timeNum
    }

    static toString(dateTime: number) {
        return os.date("%Y-%m-%d %H:%M:%S", dateTime)
    }


    /**
     *返回游戏开始后的分钟数(整数)
     */
    static getGameMinutes(): number {
        return math.floor(_g_time / 60000);
    }

}