export default class MapMathUtil {


    static 获得当前等级需要的总资源(第一级基础资源需求: number, 当前等级: number): number {
        let count = 0;
        for (let i = 1; i <= 当前等级; i++) {
            count += (第一级基础资源需求 * i);
        }
        return count;
    }


}