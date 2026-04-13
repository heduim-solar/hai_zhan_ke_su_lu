/**
 * 矢量工具
 */
export default class VectorUtil {

    /**
     * 加法
     * @param v1
     * @param v2
     */
    static add(v1: Vector, v2: Vector): Vector {
        let x = v1.x + v2.x
        let y = v1.y + v2.y
        if (v1.z) {
            let z = v1.z + (v2.z ? v2.z : 0)
            return {x, y, z}
        }
        return {x, y}
    }

    /**
     * 减法
     * @param v1
     * @param v2
     */
    static subtract(v1: Vector, v2: Vector): Vector {
        let x = v1.x - v2.x
        let y = v1.y - v2.y
        if (v1.z) {
            let z = v1.z - (v2.z ? v2.z : 0)
            return {x, y, z}
        }
        return {x, y}
    }

    /**
     * 乘法
     * @param v1
     * @param v2
     */
    static mult(v1: Vector, v2: Vector): Vector {
        let x = v1.x * v2.x
        let y = v1.y * v2.y
        if (v1.z) {
            let z = v1.z * (v2.z ? v2.z : 0)
            return {x, y, z}
        }
        return {x, y}
    }

    /**
     * 矢量乘缩放值
     * @param v1
     * @param scalar
     */
    static multScalar(v1: Vector, scalar: number): Vector {
        let x = v1.x * scalar
        let y = v1.y * scalar
        if (v1.z) {
            let z = v1.z * scalar
            return {x, y, z}
        }
        return {x, y}
    }

    /**
     * 矢量xy在范围内随机变化一次
     * @param v1
     * @param bound 半径范围
     */
    static getRandomXY(v1: Vector, bound: number): Vector {
        let x = v1.x + GetRandomInt(-bound, bound)
        let y = v1.y + GetRandomInt(-bound, bound)
        return {x, y}
    }


}