/** @noSelfInFile **/

import {Handle} from "./handle";
import {Point} from "./point";

export class Rectangle extends Handle<rect> {

    constructor(minX: number, minY: number, maxX: number, maxY: number) {
        let mapMinX = GetRectMinX(bj_mapInitialPlayableArea);
        let mapMinY = GetRectMinY(bj_mapInitialPlayableArea);
        let mapMaxX = GetRectMaxX(bj_mapInitialPlayableArea);
        let mapMaxY = GetRectMaxY(bj_mapInitialPlayableArea);

        minX = math.max(minX, mapMinX);
        minY = math.max(minY, mapMinY);
        maxX = math.min(maxX, mapMaxX);
        maxY = math.min(maxY, mapMaxY);

        if (Handle.initFromHandle()) {
            super();
        } else {
            super(Rect(minX, minY, maxX, maxY));
        }
    }

    /**
     * 区域中心的 X 坐标
     */
    public get centerX() {
        return GetRectCenterX(this.handle);
    }

    /**
     * 区域中心的 Y 坐标
     */
    public get centerY() {
        return GetRectCenterY(this.handle);
    }

    /**
     * 区域最大 X 坐标
     */
    public get maxX() {
        return GetRectMaxX(this.handle);
    }

    /**
     * 区域最大 Y 坐标
     */
    public get maxY() {
        return GetRectMaxY(this.handle);
    }

    /**
     * 区域最小 X 坐标
     */
    public get minX() {
        return GetRectMinX(this.handle);
    }

    /**
     * 区域最小 Y 坐标
     */
    public get minY() {
        return GetRectMinY(this.handle);
    }

    /**
     * 删除矩形区域 [R]
     */
    public destroy() {
        RemoveRect(this.handle);
    }

    /**
     * 遍历区域内的可破坏物
     * @param filter
     * @param actionFunc
     */
    public enumDestructables(filter: boolexpr, actionFunc: () => void) {
        EnumDestructablesInRect(this.handle, filter, actionFunc);
    }

    /**
     * 遍历区域内的物品
     * @param filter
     * @param actionFunc
     */
    public enumItems(filter: boolexpr, actionFunc: () => void) {
        EnumItemsInRect(this.handle, filter, actionFunc);
    }

    /**
     * 移动
     */
    public move(newCenterX: number, newCenterY: number) {
        MoveRectTo(this.handle, newCenterX, newCenterY);
    }

    /**
     * 移动到点
     */
    public movePoint(newCenterPoint: Point) {
        MoveRectToLoc(this.handle, newCenterPoint.handle);
    }

    /**
     * 设置矩形区域(指定坐标) [R]
     */
    public setRect(minX: number, minY: number, maxX: number, maxY: number) {
        SetRect(this.handle, minX, minY, maxX, maxY);
    }

    /**
     * 设置矩形区域(指定点) [R]
     */
    public setRectFromPoint(min: Point, max: Point) {
        SetRectFromLoc(this.handle, min.handle, max.handle);
    }

    /**
     * 此方法会停止执行
     */
    // public static fromHandle(handle: rect): Rectangle {
    //   return this.getObject(handle);
    // }

    // public static fromPoint(min: Point, max: Point) {
    //   return this.fromHandle(RectFromLoc(min.handle, max.handle));
    // }
    //
    // // Returns full map bounds, including unplayable borders, in world coordinates
    // public static getWorldBounds() {
    //   return Rectangle.fromHandle(GetWorldBounds());
    // }

}
