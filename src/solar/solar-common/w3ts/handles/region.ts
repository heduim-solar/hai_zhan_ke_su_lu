/** @noSelfInFile **/

import {Handle} from "./handle";
import {Point} from "./point";
import {Rectangle} from "./rect";
import {Unit} from "./unit";

export class Region extends Handle<region> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateRegion());
        }
    }

    /**
     * 添加单元点(指定坐标) [R]
     */
    public addCell(x: number, y: number) {
        RegionAddCell(this.handle, x, y);
    }

    /**
     * 添加单元点(指定点) [R]
     */
    public addCellPoint(whichPoint: Point) {
        RegionAddCellAtLoc(this.handle, whichPoint.handle);
    }

    /**
     * 添加区域 [R]
     */
    public addRect(r: Rectangle) {
        RegionAddRect(this.handle, r.handle);
    }

    /**
     * 移除单元点(指定坐标) [R]
     */
    public clearCell(x: number, y: number) {
        RegionClearCell(this.handle, x, y);
    }

    /**
     * 移除单元点(指定点) [R]
     */
    public clearCellPoint(whichPoint: Point) {
        RegionClearCellAtLoc(this.handle, whichPoint.handle);
    }

    /**
     * 移除区域 [R]
     */
    public clearRect(r: Rectangle) {
        RegionClearRect(this.handle, r.handle);
    }

    /**
     * 包含坐标
     */
    public containsCoords(x: number, y: number) {
        return IsPointInRegion(this.handle, x, y);
    }

    /**
     * 包含点
     */
    public containsPoint(whichPoint: Point) {
        IsLocationInRegion(this.handle, whichPoint.handle);
    }

    /**
     * 单位检查
     */
    public containsUnit(whichUnit: Unit) {
        return IsUnitInRegion(this.handle, whichUnit.handle);
    }

    /**
     * 删除不规则区域 [R]
     */
    public destroy() {
        RemoveRegion(this.handle);
    }

    public static fromHandle(handle: region): Region {
        return this.getObject(handle);
    }

}
