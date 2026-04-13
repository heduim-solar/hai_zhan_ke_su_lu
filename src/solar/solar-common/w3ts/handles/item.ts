/** @noSelfInFile **/

import {Handle} from "./handle";
import {MapPlayer} from "./player";
import {Point} from "./point";
import {Widget} from "./widget";
import DataBase from "../../common/DataBase";

export class Item extends Widget {

    // @ts-ignore
    public readonly handle!: item;

    constructor(itemId: number | string, x: number, y: number) {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateItem(itemId, x, y));
        }
    }

    public get solarData(): AppItemData {
        return DataBase.getItemSolarData(this.handle)
    }

    public set solarData(obj: { [key: string]: any }) {
        DataBase.setDataByHandle("item", this.handle, obj)
    }

    /**
     * 物品的数量
     */
    public get charges() {
        return GetItemCharges(this.handle);
    }

    /**
     * 设置物品数量[使用次数]
     */
    public set charges(value: number) {
        SetItemCharges(this.handle, value);
    }

    /**
     * 设置物品是否无敌的
     */
    public set invulnerable(flag: boolean) {
        SetItemInvulnerable(this.handle, true);
    }

    /**
     * 物品是无敌的
     */
    public get invulnerable() {
        return IsItemInvulnerable(this.handle);
    }

    /**
     * 物品等级
     */
    public get level() {
        return GetItemLevel(this.handle);
    }

    /**
     * 物品名
     */
    get name() {
        return GetItemName(this.handle);
    }

    // set name(value: string) {
    //   BlzSetItemName(this.handle, value);
    // }
    /**
     * 物品可被抵押 [R]
     */
    public get pawnable() {
        return IsItemPawnable(this.handle);
    }

    /**
     * 设置物品能否变卖
     */
    public set pawnable(flag: boolean) {
        SetItemPawnable(this.handle, flag);
    }

    /**
     * 物品的所有者
     */
    public get player() {
        return GetItemPlayer(this.handle);
    }

    /**
     * 获取物品类型
     */
    public get type() {
        return GetItemType(this.handle);
    }

    /**
     * 物品的类别
     */
    public get typeId() {
        return GetItemTypeId(this.handle);
    }

    /**
     * 物品的类别
     */
    public get typeIdString() {
        return id2string(GetItemTypeId(this.handle));
    }

    /**
     * 物品自定义值
     */
    public get userData() {
        return GetItemUserData(this.handle);
    }

    /**
     * 设置物品自定义数据
     */
    public set userData(value: number) {
        SetItemUserData(this.handle, value);
    }

    /**
     * 物品可见 [R]
     */
    public get visible() {
        return IsItemVisible(this.handle);
    }

    /**
     * 显示/隐藏 [R]
     */
    public set visible(flag: boolean) {
        SetItemVisible(this.handle, flag);
    }

    // public get skin() {
    //   return BlzGetItemSkin(this.handle);
    // }
    //
    // public set skin(skinId: number | string) {
    //   BlzSetItemSkin(this.handle, skinId);
    // }
    /**
     * 物品的X轴坐标 [R]
     */
    public get x() {
        return GetItemX(this.handle);
    }

    /**
     * 设置物品坐标x [R]
     */
    public set x(value: number) {
        SetItemPosition(this.handle, value, this.y);
    }

    /**
     * 物品的Y轴坐标 [R]
     */
    public get y() {
        return GetItemY(this.handle);
    }

    /**
     * 设置物品坐标y [R]
     */
    public set y(value: number) {
        SetItemPosition(this.handle, this.x, value);
    }

    /**
     * 移除物品 [R]
     */
    public destroy() {
        DataBase.clearItemSolarData(this.handle)
        RemoveItem(this.handle);
    }

    // public getField(field: itembooleanfield | itemintegerfield | itemrealfield | itemstringfield) {
    //   const fieldType = field.toString().substr(0, field.toString().indexOf(":"));
    //
    //   switch (fieldType) {
    //     case "unitbooleanfield":
    //       return BlzGetItemBooleanField(this.handle, field as itembooleanfield);
    //     case "unitintegerfield":
    //       return BlzGetItemIntegerField(this.handle, field as itemintegerfield);
    //     case "unitrealfield":
    //       return BlzGetItemRealField(this.handle, field as itemrealfield);
    //     case "unitstringfield":
    //       return BlzGetItemStringField(this.handle, field as itemstringfield);
    //     default:
    //       return 0;
    //   }
    // }
    /**
     * 物品被持有 [R]
     */
    public isOwned() {
        return IsItemOwned(this.handle);
    }

    /**
     * 物品可被抵押 [R]
     */
    public isPawnable() {
        return IsItemPawnable(this.handle);
    }

    /**
     * 物品是拾取时自动使用的 [R]
     */
    public isPowerup() {
        return IsItemPowerup(this.handle);
    }

    /**
     * 物品可被市场随机出售 [R]
     */
    public isSellable() {
        return IsItemSellable(this.handle);
    }

    /**
     * 设置重生神符的产生单位类型
     */
    public setDropId(unitId: number | string) {
        SetItemDropID(this.handle, unitId);
    }

    /**
     * 设置物品是否死亡时掉落
     */
    public setDropOnDeath(flag: boolean) {
        SetItemDropOnDeath(this.handle, flag);
    }

    /**
     * 设置物品可以丢弃
     */
    public setDroppable(flag: boolean) {
        SetItemDroppable(this.handle, flag);
    }

    // public setField(field: itembooleanfield | itemintegerfield | itemrealfield | itemstringfield, value: boolean | number | string) {
    //   const fieldType = field.toString().substr(0, field.toString().indexOf(":"));
    //
    //   if (fieldType === "unitbooleanfield" && typeof value === "boolean") {
    //     return BlzSetItemBooleanField(this.handle, field as itembooleanfield, value);
    //   } else if (fieldType === "unitintegerfield" && typeof value === "number") {
    //     return BlzSetItemIntegerField(this.handle, field as itemintegerfield, value);
    //   } else if (fieldType === "unitrealfield" && typeof value === "number") {
    //     return BlzSetItemRealField(this.handle, field as itemrealfield, value);
    //   } else if (fieldType === "unitstringfield" && typeof value === "string") {
    //     return BlzSetItemStringField(this.handle, field as itemstringfield, value);
    //   }
    //
    //   return false;
    // }
    /**
     * 设置物品所属
     */
    public setOwner(whichPlayer: MapPlayer, changeColor: boolean) {
        SetItemPlayer(this.handle, whichPlayer.handle, changeColor);
    }

    /**
     * 移动物品到坐标(立即)(指定坐标) [R]
     */
    public setPoint(whichPoint: Point) {
        SetItemPosition(this.handle, whichPoint.x, whichPoint.y);
    }

    /**
     * 移动物品到坐标(立即)(指定坐标) [R]
     */
    public setPosition(x: number, y: number) {
        SetItemPosition(this.handle, x, y);
    }

    /**
     * 从handle转物品封装类
     */
    public static fromHandle(handle: item): Item {
        return this.getObject(handle);
    }

    /**
     * 物品可以抵押
     */
    public static isIdPawnable(itemId: number | string) {
        return IsItemIdPawnable(itemId);
    }

    /**
     * 物品可以充能
     */
    public static isIdPowerup(itemId: number | string) {
        return IsItemIdPowerup(itemId);
    }

    /**
     * 物品可以销售
     */
    public static isIdSellable(itemId: number | string) {
        return IsItemIdSellable(itemId);
    }

}
