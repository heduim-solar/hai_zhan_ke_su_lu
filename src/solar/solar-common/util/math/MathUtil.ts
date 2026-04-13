const PI: number = 3.14159
const E: number = 2.71828
const CELLWIDTH: number = 128.0
const CLIFFHEIGHT: number = 128.0
const UNIT_FACING: number = 270.0
const RADTODEG: number = 180.0 / PI
const DEGTORAD: number = PI / 180.0
/** @noSelf **/
export default class MathUtil {


    /**
     * 两个单位之间的距离
     * @param x1
     * @param y1
     * @param x2
     * @param y2
     */
    static distanceBetweenUnits(u1: unit, u2: unit): number {
        return MathUtil.distanceBetweenPoints(GetUnitX(u1), GetUnitY(u1), GetUnitX(u2), GetUnitY(u2));
    }

    /**
     * 两点之间的距离
     * @param x1
     * @param y1
     * @param x2
     * @param y2
     */
    static distanceBetweenPoints(x1: number, y1: number, x2: number, y2: number): number {
        let dx = x2 - x1
        let dy = y2 - y1
        return SquareRoot(dx * dx + dy * dy)
    }

    /**
     * 极坐标位移 获得指定方向的x,y
     * @param x1
     * @param y1
     * @param dist
     * @param angle
     */
    static polarProjection(x1: number, y1: number, dist: number, angle: number): Vector {
        let x = x1 + dist * Cos(angle * DEGTORAD)
        let y = y1 + dist * Sin(angle * DEGTORAD)
        return {x: x, y: y}
    }

    /**
     * 与用户交互的 使用角度便于理解和编辑
     * @param x1
     * @param y1
     * @param x2
     * @param y2
     */
    static angleBetweenCoords(x1: number, y1: number, x2: number, y2: number): number {
        return RADTODEG * Atan2(y2 - y1, x2 - x1)
    }

    /**
     * 大多数底层计算函数都是用这个 弧度
     * @param x1
     * @param y1
     * @param x2
     * @param y2
     */
    static radianBetweenCoords(x1: number, y1: number, x2: number, y2: number): number {
        return Atan2(y2 - y1, x2 - x1)
    }

    /**
     * 弧度转角度
     * @param radian
     */
    static radian2angle(radian: number) {
        return RADTODEG * radian
    }

    /**
     * 角度转弧度
     * @param angle
     */
    static angle2radian(angle: number) {
        return DEGTORAD * angle
    }

    /**
     * 判断角度是否在另一角度的背面
     * @param jd0 背部单位到前单位角度
     * @param jd1 前单位面向角度
     */
    static isBackAngle(jd0: number, jd1: number): boolean {
        return CosBJ(jd1 - jd0) >= 0
    }

    /**
     * 统计 一个对象的所有属性的值
     * @param data
     */
    static sum(data: { [key: string]: number }): number {
        if (!data) {
            return 0;
        }
        let count = 0;
        for (let k in data) {
            count = count + data[k];
        }
        return count;
    }


    /**
     * 获取最小值
     */
    static min(...values: number[]): number {
        return Math.min(...values)
    }

    /**
     * 获取最大值
     * @param values
     */
    static max(...values: number[]): number {
        return Math.max(...values)
    }

    /**
     * 将一个数值限制到一个大小范围
     * 低于这个范围最小值 则返回范围最小值
     * 大于这个范围最大值 则返回范围最大值
     * 大于等于范围最小值小于等于范围最大值则返回原值
     * @param value
     * @param min
     * @param max
     */
    static clamp(value: number, min: number, max: number): number {
        if (value > max) {
            return max;
        } else if (value < min) {
            return min;
        }
        return value;
    }

    /**
     * 计算护甲减少伤害比例
     * @param armor 护甲
     * @param ardf 护甲减少伤害因子
     *      负护甲             正护甲
     * 返回  -0.99999... 到 0.999999....
     */
    static armorReduction(armor: number, ardf = ArmorReducesDamageFactor): number {
        if (armor == 0) {
            return 0;
        } else if (armor < 0) {
            armor = -armor;
            return -(armor / (armor + (1 / ardf)));
        }
        return armor / (armor + (1 / ardf));
    }


}

