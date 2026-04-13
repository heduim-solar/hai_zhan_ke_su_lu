import {Trigger} from "@/w3ts/handles/trigger";
import BaseUtil from "@/util/BaseUtil";
import DataBase from "../common/DataBase";
import AttributeUtil from "@/util/system/AttributeUtil";
import UnitAttributeState from "./UnitAttributeState";
import SelectUtil from "@/util/unit/SelectUtil";
import SingletonUtil from "../util/lang/SingletonUtil";

/**
 * 物品属性系统
 *
 * 将物品的属性附加到单位身上
 */
export default class ItemAttributeState {
    //推荐使用  AttributeUtil.setItemTypeAttribute
    static config: { [id: string]: SolarAttribute } = {}

    constructor() {
        if (SingletonUtil.notFirstTime(ItemAttributeState)) {
            print("不能重复new ItemAttributeState()")
            return;
        }
        BaseUtil.runLater(0.1, () => {
            for (let configKey in ItemAttributeState.config) {
                SingletonUtil.executeOnce("ItemAttributeState.config:警告", () => {
                    print("不推荐在ItemAttributeState.config设置属性," +
                        "请直接使用AttributeUtil.setItemTypeAttribute设置属性。这个方式将在未来移除!")
                });
                AttributeUtil.setItemTypeAttribute(configKey, ItemAttributeState.config[configKey]);
            }
        });
        //根据实时事件 及时刷新
        let trigger = new Trigger()
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM)
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM)
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_PAWN_ITEM)
        trigger.addAction(() => {
            let unitHandle = GetTriggerUnit()
            //不要在此触发直接判断 因为丢弃物品触发执行时 物品还在物品栏里
            BaseUtil.runLater(0.1, () => {
                ItemAttributeState.refreshItemAttributes2UnitSolarAttribute(unitHandle)
            })
        })
        //循环 对每个单位 进行刷新属性
        let triggerTimer = new Trigger()
        //5秒刷新一次
        triggerTimer.registerTimerEvent(5.89, true)
        triggerTimer.addAction(() => {
            SelectUtil.forAllUnits(u => {
                ItemAttributeState.refreshItemAttributes2UnitSolarAttribute(u);
            })
        })
        se.on("属性刷新", () => {
            SelectUtil.forAllUnits(u => {
                ItemAttributeState.refreshItemAttributes2UnitSolarAttribute(u);
            })
        })
    }


    /**
     * 统计单位携带的物品的 总属性值
     * @param unitHandle
     */
    static getItemsAttributes(unitHandle: unit): SolarAttribute[] {
        //统计装备总计数值
        let itemAttributes: SolarAttribute[] = null;
        for (let i = 0; i < 6; i++) {
            let itemHandle = UnitItemInSlot(unitHandle, i);
            if (!IsHandle(itemHandle)) {
                continue
            }
            if (!itemAttributes) {
                itemAttributes = [];
            }
            let itemTypeId = GetItemTypeId(itemHandle)
            let itemTypeIdStr = id2string(itemTypeId);
            //solarData 数据
            let itemAttribute: SolarAttribute = AttributeUtil.getItemAttribute(itemHandle);
            if (itemAttribute) {
                itemAttributes.push(itemAttribute)
            }
            //type 数据
            let configItemAttribute = AttributeUtil.getItemTypeAttribute(itemTypeIdStr);
            if (configItemAttribute) {
                itemAttributes.push(configItemAttribute)
            }
        }
        //计算数值

        return itemAttributes;
    }

    /**
     * 刷新单位携带的物品的属性值 附加到 单位属性中
     * @param unitHandle
     */
    static refreshItemAttributes2UnitSolarAttribute(unitHandle: unit) {
        let itemAttributes: AppAttribute[] = ItemAttributeState.getItemsAttributes(unitHandle);
        let unitOldItemSAttr: AppAttribute = DataBase.getUnitSolarData(unitHandle, false)?._SL_totalItemsSolarAttribute;
        if (unitOldItemSAttr == null) {//如果之前没有旧物品属性 则退出后续逻辑  否则还需将之前的旧属性 移除
            if (itemAttributes == null || itemAttributes.length == 0) {
                return
            }
        }
        let totalAttribute: SolarAttribute = AttributeUtil.sumAttributes(itemAttributes);

        /**
         dmg system
         */
        let solarData = DataBase.getUnitSolarData(unitHandle);
        if (!solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }

        AttributeUtil.subtract(solarData._SL_solarAttribute, unitOldItemSAttr);
        AttributeUtil.add(solarData._SL_solarAttribute, totalAttribute);

        solarData._SL_totalItemsSolarAttribute = totalAttribute;
        //发送属性改变事件
        UnitAttributeState.refreshUnitSolarAttribute(unitHandle)
    }


}
