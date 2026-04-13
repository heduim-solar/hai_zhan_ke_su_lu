import VectorUtil from "./VectorUtil";

/**
 * 插值工具
 */
export default class InterpolationUtil {


    /**
     * 线性插值
     * @param start
     * @param end
     * @param percent
     */
    static line(start: number, end: number, percent: number): number {
        return start + ((end - start) * percent);
    }


    //两点间 percent 比例的点
    static vecIn2Vectors(start: Vector, end: Vector, percent: number): Vector {
        let vec = VectorUtil.subtract(end, start)
        return VectorUtil.add(start, VectorUtil.multScalar(vec, percent))
    }


    /**
     * 贝塞尔插值
     * @param percent
     * @param controlPoints
     */
    static bezier(percent: number, ...controlPoints: Vector[]) {
        let tempVS: Vector[] = []
        for (let i = 1; i < controlPoints.length; i++) {
            tempVS[i - 1] = InterpolationUtil.vecIn2Vectors(controlPoints[i - 1], controlPoints[i], percent)
        }
        if (tempVS.length == 1) {
            return tempVS[0]
        } else {
            return InterpolationUtil.bezier(percent, ...tempVS)
        }
    }
}