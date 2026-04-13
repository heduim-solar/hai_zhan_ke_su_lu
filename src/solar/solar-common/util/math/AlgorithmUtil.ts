/**
 * @brief  数学计算工具
 */


export default class AlgorithmUtil {

    /**检测数组中是否包含元素*/
    public static contains<T>(item: T, arr: T[]): boolean {
        for (const i of arr) {
            if (i == item) return true;
        }
        return false;
    }

    /**
     * @brief 获取位于同一个圆上的数个点的坐标组
     * @param radius 圆的半径
     * @param x 圆心的x坐标
     * @param y 圆心的y坐标
     * @param count 点的数量
     * @param isRandom 是否随机点在圆上的位置
     * @returns 位于同一个圆上的数个点的坐标组
     */
    public static getPointsOnCircle(radius: number, x: number, y: number, count: number, isRandom: boolean = true): { x: number, y: number }[] {
        let points: { x: number, y: number }[] = [];
        for (let index: number = 0; index < count; index++) {
            let angle: number = isRandom ? GetRandomReal(0, 360) : index * (360.0 / count);
            let xx: number = x + radius * CosBJ(angle);
            let yy: number = y + radius * SinBJ(angle);
            points.push({ x: xx, y: yy });
        }
        return points;
    }

    /**
     * @brief 获取圆内随机一个点的坐标
     * @param radius 圆的半径
     * @param x 圆心的x坐标
     * @param y 圆心的y坐标
     * @returns 圆内随机一个点的坐标
     */
    public static getRandomPointInsideCircle(radius: number, x: number, y: number): { x: number, y: number } {
        let angle: number = GetRandomReal(0.0, 360.0);
        let distance: number = GetRandomReal(0.0, radius);
        let point: { x: number, y: number } = { x: 0, y: 0 };;
        point.x = x + distance * CosBJ(angle);
        point.y = y + distance * SinBJ(angle);
        return point;
    }

    /**
     * @brief 获取大圆圆内随机多个不重合小圆的圆心坐标
     * @param R 大圆的半径
     * @param x 大圆圆心的x坐标
     * @param y 大圆圆心的y坐标
     * @param r 小圆的半径
     * @returns 圆内随机一个点的坐标
     */
    public static getRandomPointsInsideCircle(R: number, x: number, y: number, r: number, count: number): { x: number, y: number }[] {
        let points: { x: number, y: number }[] = [];
        for (let index: number = 0; index < 1000000; index++) {
            let point: { x: number, y: number } = this.getRandomPointInsideCircle(R, x, y);
            let intersect: boolean = false;
            if (points.length > 0) {
                for (let p of points) {
                    let dx = point.x - p.x;
                    let dy = point.y - p.y;
                    let distance: number = math.sqrt(dx * dx + dy * dy);
                    if(distance < 2 * r) {
                        intersect = true;
                        break;
                    }
                }
            }
            if (!intersect) {
                points.push(point);
            }
            if (points.length >= count) break;
        }

        return points;
    }


    /**
     * @brief 获取矩形区域内尽可能多的不相交圆的中心坐标
     * @param radius 圆的半径
     * @param whichRect 哪一个矩形区域
     * @returns 
     */
    public static getCircleCenterPointsInsideRect(radius: number, whichRect: rect): { x: number, y: number }[] {
        let points: { x: number, y: number }[] = [];
        let minX: number = GetRectMinX(whichRect);
        let minY: number = GetRectMinY(whichRect);
        let maxX: number = GetRectMaxX(whichRect);
        let maxY: number = GetRectMaxY(whichRect);
        for (let x: number = minX + radius; x <= maxX - radius; x += 2 * radius) {
            for (let y: number = minY + radius; x <= maxY - radius; y += 2 * radius) {
                points.push({ x: x, y: y });
            }
        }
        return points;
    }
}