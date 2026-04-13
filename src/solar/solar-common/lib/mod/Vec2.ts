/**
 * @brief 坐标
 */

export default class Vec2 {

    public x: number;
    public y: number;
    private static readonly EPSILON: number = 0.000001;

    constructor(x: number = 0.0, y: number = 0.0) {
        this.set(x, y);
    }

    public static fromLocation(location: location): Vec2 {
        let x: number = GetLocationX(location);
        let y: number = GetLocationY(location);
        return new Vec2(x, y);
    }


    public static clamp(value: number, from: number, to: number): number {
        if (from > to) {
            from = from + to;
            to = from - to;
            from = from - to;
        }
        return value < from ? from : value < to ? value : to;
    }

    /**
     * @brief 转换坐标到点
     * @returns 
     */
    public toLocation(): location {
        return Location(this.x, this.y);
    }

    /**
     * @brief 计算两个坐标的距离
     * @param another 另一个坐标
     * @returns 
     */
    public distance(another: Vec2): number {
        let dx: number = another.x - this.x;
        let dy: number = another.x - this.x;
        return math.sqrt(dx * dx + dy * dy);
    }

    /**
     * @brief 计算到另一个坐标的角度
     * @param another 另一个坐标
     * @returns 
     */
    public angle(another: Vec2): number {
        return math.deg(math.atan2(another.y - this.y, another.x - this.x));
    }

    /**
     * @brief 极坐标位移点
     * @param distance 距离
     * @param angle 角度
     * @returns 
     */
    public polarProjection(distance: number, angle: number): Vec2 {
        let x = this.x + distance * math.cos(angle);
        let y = this.y + distance * math.sin(angle);
        return new Vec2(x, y);
    }

    public equals(another: Vec2): boolean {
        return math.abs(this.x - another.x) < Vec2.EPSILON && math.abs(this.y - another.y) < Vec2.EPSILON;
    }

    public normalize() {
        let n = this.x * this.x + this.y * this.y;
        if (n == 1.0) return;
        n = math.sqrt(n);
        n = 1.0 / n;
        this.x *= n;
        this.y *= n;
    }

    public smooth(target: Vec2, elapsedTime: number, responseTime: number): void {
        if (elapsedTime > 0) {
            this.x += (target.x - this.x) * (elapsedTime / (elapsedTime + responseTime));
            this.y += (target.y - this.y) * (elapsedTime / (elapsedTime + responseTime));
        }
    }

    /**
     * @brief 计算两个坐标的叉积
     * @param another 另一个坐标
     * @returns 
     */
    public cross(another: Vec2): number {
        return this.x * another.y - this.y * another.x;
    }

    /**
     * @brief 计算坐标的垂线,逆时针旋转90度
     * @returns 
     */
    public perp(): Vec2 {
        return new Vec2(-this.y, this.x);
    }

    /**
     * @brief 计算坐标的垂线,顺时针旋转90度
     * @returns 
     */
    public rPerp(): Vec2 {
        return new Vec2(this.y, -this.x);
    }

    /**
     * @brief 计算两个坐标的中点
     * @param another 另一个坐标
     * @returns 
     */
    public midpoint(another: Vec2): Vec2 {
        return new Vec2((this.x + another.x) / 2.0, (this.y + another.y) / 2.0);
    }

    public compOp(func: (param: number) => number): Vec2 {
        return new Vec2(func(this.x), func(this.y));
    }

    /**
     * 将坐标夹在两坐标之间
     * @param from 
     * @param to 
     * @returns 
     */
    public clampPoint(from: Vec2, to: Vec2): Vec2 {
        return new Vec2(Vec2.clamp(this.x, from.x, to.x), Vec2.clamp(this.y, from.y, to.y));
    }

    public set(x: number, y: number): void {
        this.x = x;
        this.y = y;
    }

    public setVec2(point: Vec2): void {
        this.x = point.x;
        this.y = point.y;
    }

    public static readonly ZERO: Vec2 = new Vec2(0, 0);
    public static readonly ONE: Vec2 = new Vec2(1, 1);
    public static readonly UNIT_X: Vec2 = new Vec2(1, 0);
    public static readonly UNIT_Y: Vec2 = new Vec2(0, 1);
}