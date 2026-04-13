/**
 * @brief 位运算工具
 */


export default class BitUtil {

    /**
     * @brief 在标识值中添加位
     * @param flag 标识值
     * @param bit 位
     * @returns 
     */
    public static add(flag: number, bit: number): number {
        return flag | bit;
    }

    /**
     * @brief 从标识值中删除位
     * @param flag 标识值
     * @param bit 位
     * @returns 
     */
    public static sub(flag: number, bit: number): number {
        return flag & ~bit;
    }

    /**
     * @brief 获取包含x个位的标识值
     * @param x 位数量
     * @returns 
     */
    public static enum(x: number): number {
        return (1 << x) - 1;
    }

    /**
     * @brief 检测标识值中是否包含位
     * @param flag 标识值
     * @param bit 位
     * @returns 
     */
    public static contains(flag: number, bit: number): boolean {
        return ((flag & bit) == bit);
    }

    /**
     * @brief 转换索引为掩码
     * @param index 索引
     * @returns 
     */
    public static toBit(index: number) {
        assert(0 <= index && index < 32, 'out of range');
        return 1 << index;
    }

    /**
     * @brief 获取标识值中的1的数量
     * @param flag 标识值
     * @returns 
     */
    public static size(flag: number) {
        let ret: number = 0;
        let temp: number = 0;
        while (0 != flag) {
            temp = flag & 1;
            if (1 == temp) {
                ret++;
            }
            flag = flag >>> 1;
        }
        return ret;
    }

    /**检测x是否为偶数 */
    public static isEven(x: number) {
        return 0 == (x & 1);
    }

    /**检测x是否为奇数 */
    public static isOdd(x: number) {
        return 1 == (x & 1);
    }
}