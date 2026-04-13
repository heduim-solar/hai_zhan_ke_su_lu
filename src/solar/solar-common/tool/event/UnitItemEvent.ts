/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import AttributeUtil from "../../util/system/AttributeUtil";
import {Item} from "../../w3ts/handles/item";

export default class UnitItemEvent extends UnitEvent {

    static instance = new UnitItemEvent();

    protected constructor() {
        super();
    }


    /**
     * 被操作的物品(handle)
     * （使用/得到/丢弃）
     */
    get manipulatedItem(): item {
        return GetManipulatedItem();
    }

    /**
     * 被操作的物品名字
     */
    get manipulatedItemName(): string {
        return GetItemName(GetManipulatedItem());
    }

    /**
     * 被操作的物品类型 id字符串
     */
    get manipulatedItemTypeIdStr(): string {
        return id2string(GetItemTypeId(GetManipulatedItem()));
    }

    /**
     * 被操作的物品(包装对象)
     */
    get manipulatedItemObj(): Item {
        return Item.fromHandle(GetManipulatedItem());
    }


    /**
     * 被出售的物品名字
     */
    get soldItemName(): string {
        return GetItemName(GetSoldItem());
    }

    /**
     * 在购买的单位
     */
    get buyingUnit(): unit {
        return GetBuyingUnit()
    }

    /**
     * 贩卖者
     */
    get sellingUnit(): unit {
        return GetSellingUnit()
    }

    /**
     * 被出售的物品
     * (响应出售物品/抵押物品)
     */
    get soldItem(): item {
        return GetSoldItem();
    }

    /**
     * 被出售的物品类型 id字符串
     */
    get soldItemTypeIdStr(): string {
        return id2string(GetItemTypeId(GetSoldItem()));
    }

    /**
     * 被操作的物品
     */
    get manipulatedItemSolarData(): AppItemData {
        return DataBase.getItemSolarData(GetManipulatedItem());
    }

    get manipulatedItemTypeSolarData(): AppItemTypeData {
        return DataBase.getItemTypeSolarData(id2string(GetItemTypeId(GetManipulatedItem())));
    }

    get manipulatedItemAttribute(): AppAttribute {
        return AttributeUtil.getItemAttribute(GetManipulatedItem());
    }


}