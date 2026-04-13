/**
 * @brief 范围
 */

import Size from "./Size";
import Vec2 from "./Vec2";


export default class Range {

    /**原点(左下角)坐标*/
    public origin: Vec2;

    /**尺寸*/
    public size: Size;

    constructor(x: number = 0.0, y: number = 0.0, w: number = 0.0, h: number = 0.0) {
        this.set(x, y, w, h);
    }

    /**
     * @brief 将区域转化为范围
     * @param whichRect 哪一个区域
     * @returns 
     */
    public static fromRect(whichRect: rect): Range {
        let minX: number = GetRectMinX(whichRect);
        let minY: number = GetRectMinY(whichRect);
        let maxX: number = GetRectMaxX(whichRect);
        let maxY: number = GetRectMaxY(whichRect);
        let x: number = minX;
        let y: number = minY;
        let width: number = maxX - minX;
        let height: number = maxY - minY;
        return new Range(x, y, width, height);
    }

    public equals(another: Range): boolean {
        return this.origin.equals(another.origin) && this.size.equals(another.size);
    }

    public maxX(): number {
        return this.origin.x + this.size.width;
    }

    public midX(): number {
        return this.origin.x + this.size.width / 2.0;
    }

    public minX(): number {
        return this.origin.x;
    }

    public maxY(): number {
        return this.origin.y + this.size.height;
    }

    public midY(): number {
        return this.origin.y + this.size.height / 2.0;
    }

    public minY(): number {
        return this.origin.y;
    }

    public containsPoint(point: Vec2): boolean {
        return (point.x >= this.minX() && point.x <= this.maxX() && point.y >= this.minY() && point.y <= this.maxY());
    }

    public intersectsRange(another: Range): boolean {
        return !(this.maxX() < another.minX() || another.maxX() < this.minX() || this.maxY() < another.minY() || another.maxY() < this.minY());
    }

    public intersectsCircle(center: Vec2, radius: number): boolean {
        let rectangleCenter: Vec2 = new Vec2(this.midX(), this.midY());
        let w: number = this.size.width / 2;
        let h: number = this.size.height / 2;
        let dx: number = math.abs(center.x - rectangleCenter.x);
        let dy: number = math.abs(center.y - rectangleCenter.y);
        if (dx > (radius + w) || dy > (radius + h)) return false;
        let circleDistance: Vec2 = new Vec2(math.abs(center.x - this.origin.x - w), math.abs(center.y - this.origin.y - h));
        if (circleDistance.x <= (w)) return true;
        if (circleDistance.y <= (h)) return true;
        let cornerDistanceSq: number = math.pow(circleDistance.x - w, 2) + math.pow(circleDistance.y - h, 2);
        return (cornerDistanceSq <= (math.pow(radius, 2)));
    }

    public merge(another: Range) {
        let minX: number = math.min(this.minX(), another.minX());
        let minY: number = math.min(this.minY(), another.minY());
        let maxX: number = math.max(this.maxX(), another.maxX());
        let maxY: number = math.max(this.maxY(), another.maxY());
        this.set(minX, minY, maxX - minX, maxY - minY);
    }

    public set(x: number, y: number, w: number, h: number): void {
        this.origin.x = x;
        this.origin.y = y;
        this.size.width = w;
        this.size.height = h;
    }

    public setRange(range: Range): void {
        this.origin.x = range.origin.x;
        this.origin.y = range.origin.y;
        this.size.width = range.size.width;
        this.size.height = range.size.height;
    }

    public static readonly ZERO: Range = new Range(0, 0, 0, 0);
}