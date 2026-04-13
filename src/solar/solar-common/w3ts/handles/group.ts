/** @noSelfInFile **/

import {Handle} from "./handle";
import {MapPlayer} from "./player";
import {Point} from "./point";
import {Rectangle} from "./rect";
import {Unit} from "./unit";
import {Widget} from "./widget";
import GroupUtil from "../../util/unit/GroupUtil";

export class Group extends Handle<group> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateGroup());
        }
    }

    // public addGroupFast(addGroup: Group): number {
    //   return BlzGroupAddGroupFast(this.handle, addGroup.handle);
    // }
    /**
     * 添加单位 [R]
     */
    public addUnit(whichUnit: Unit) {
        GroupAddUnit(this.handle, whichUnit.handle);
    }

    /**
     * 清除
     */
    public clear() {
        GroupClear(this.handle);
    }

    /**
     * 删除单位组 [R]
     */
    public destroy() {
        DestroyGroup(this.handle);
    }

    /**
     * 选取单位添加到单位组(坐标)
     */
    public enumUnitsInRange(x: number, y: number, radius: number, filter: boolexpr) {
        GroupEnumUnitsInRange(this.handle, x, y, radius, filter);
    }

    /**
     * 选取单位添加到单位组(坐标)(不建议使用)
     */
    public enumUnitsInRangeCounted(x: number, y: number, radius: number, filter: boolexpr, countLimit: number) {
        GroupEnumUnitsInRangeCounted(this.handle, x, y, radius, filter, countLimit);
    }

    /**
     * 选取单位添加到单位组(点)
     */
    public enumUnitsInRangeOfPoint(whichPoint: Point, radius: number, filter: boolexpr) {
        GroupEnumUnitsInRangeOfLoc(this.handle, whichPoint.handle, radius, filter);
    }

    /**
     * 选取单位添加到单位组(点)(不建议使用)
     */
    public enumUnitsInRangeOfPointCounted(whichPoint: Point, radius: number, filter: boolexpr, countLimit: number) {
        GroupEnumUnitsInRangeOfLocCounted(this.handle, whichPoint.handle, radius, filter, countLimit);
    }

    /**
     * 匹配范围单位
     */
    public enumUnitsInRect(r: rect, filter: boolexpr) {
        GroupEnumUnitsInRect(this.handle, r, filter);
    }

    /**
     * 匹配范围单位 [countLimit 上限]
     */
    public enumUnitsInRectCounted(r: Rectangle, filter: boolexpr, countLimit: number) {
        GroupEnumUnitsInRectCounted(this.handle, r.handle, filter, countLimit);
    }

    /**
     * 通过玩家匹配单位
     */
    public enumUnitsOfPlayer(whichPlayer: MapPlayer, filter: boolexpr) {
        GroupEnumUnitsOfPlayer(this.handle, whichPlayer.handle, filter);
    }

    /**
     * 通过单位类型匹配单位
     */
    public enumUnitsOfType(unitName: string, filter: boolexpr) {
        GroupEnumUnitsOfType(this.handle, unitName, filter);
    }

    /**
     * 通过单位类型匹配单位 [countLimit 上限]
     */
    public enumUnitsOfTypeCounted(unitName: string, filter: boolexpr, countLimit: number) {
        GroupEnumUnitsOfTypeCounted(this.handle, unitName, filter, countLimit);
    }

    /**
     * 选取单位添加到单位组(点)(不建议使用)
     */
    public enumUnitsSelected(whichPlayer: MapPlayer, radius: number, filter: boolexpr) {
        GroupEnumUnitsSelected(this.handle, whichPlayer.handle, filter);
    }


    /**
     * 选取所有单位在单位组做 多动作
     * @deprecated 请使用GroupUtil.for  以减少内存泄漏
     */
    public for(callback: () => void) {
        ForGroup(this.handle, callback);
    }

    /**
     * 太阳for 保留原group 内的单位
     * @param whichGroup
     * @param callback
     */
    public forSL(callback: (this: any, unit: unit) => void) {
        GroupUtil.forSL(this.handle, callback)
    }

    /**
     * 单位组中第一个单位
     */
    public get first() {
        return Unit.fromHandle(FirstOfGroup(this.handle));
    }

    // public get size(): number {
    //   return BlzGroupGetSize(this.handle);
    // }
    //
    // public getUnitAt(index: number): Unit {
    //   return Unit.fromHandle(BlzGroupUnitAt(this.handle, index));
    // }
    /**
     * 单位在 单位组
     */
    public hasUnit(whichUnit: Unit) {
        return IsUnitInGroup(whichUnit.handle, this.handle);
    }

    /**
     * 发布命令(指定坐标) [R]
     */
    public orderCoords(order: string | number, x: number, y: number) {
        if (typeof order === "string") {
            GroupPointOrder(this.handle, order, x, y);
        } else {
            GroupPointOrderById(this.handle, order, x, y);
        }
    }

    /**
     * 发送单位组命令到 没有目标
     */
    public orderImmediate(order: string | number) {
        if (typeof order === "string") {
            GroupImmediateOrder(this.handle, order);
        } else {
            GroupImmediateOrderById(this.handle, order);
        }
    }

    /**
     * 发送单位组命令到 点
     */
    public orderPoint(order: string | number, whichPoint: Point) {
        if (typeof order === "string") {
            GroupPointOrderLoc(this.handle, order, whichPoint.handle);
        } else {
            GroupPointOrderByIdLoc(this.handle, order, whichPoint.handle);
        }
    }

    /**
     * 发送单位组命令到 单位
     */
    public orderTarget(order: string | number, targetWidget: Widget | Unit) {
        if (typeof order === "string") {
            GroupTargetOrder(this.handle, order, targetWidget.handle);
        } else {
            GroupTargetOrderById(this.handle, order, targetWidget.handle);
        }
    }

    // public removeGroupFast(removeGroup: Group): number {
    //   return BlzGroupRemoveGroupFast(this.handle, removeGroup.handle);
    // }
    //
    // public removeUnit(whichUnit: Unit): boolean {
    //   return GroupRemoveUnit(this.handle, whichUnit.handle);
    // }
    /**
     * 从handle获取单位组封装类
     */
    public static fromHandle(handle: group): Group {
        return this.getObject(handle);
    }

    /**
     * 选取的单位
     */
    public static getEnumUnit(): Unit {
        return Unit.fromHandle(GetEnumUnit());
    }

    /**
     * 匹配的单位
     */
    public static getFilterUnit(): Unit {
        return Unit.fromHandle(GetFilterUnit());
    }
}
