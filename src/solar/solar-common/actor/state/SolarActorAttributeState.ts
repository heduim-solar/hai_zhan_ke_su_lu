import {Trigger} from "@/trigger";
import Actor from "@/Actor";
import DataBase from "@/DataBase";
import ActorBuffUtil from "@/ActorBuffUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUtil from "@/ActorUtil";
import AttributeUtil from "@/AttributeUtil";
import UnitAttributeState from "@/UnitAttributeState";
import SingletonUtil from "@/SingletonUtil";
import BaseUtil from "@/BaseUtil";

export default class SolarActorAttributeState {


    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorAttributeState)) {
            print("不能重复new SolarActorAttributeState()")
            return;
        }
        /**buff 属性更新到单位属性*/
        let trigger2 = new Trigger();
        let noUpdateAttributeTime = 0;
        trigger2.registerTimerEvent(0.99, true)
        trigger2.addAction(() => {
            //每秒定时更新  超过5秒没更新时 强制更新 保底机制可以提高框架鲁棒性
            if (Actor._sl_needUpdateAttribute == false && noUpdateAttributeTime < 5) {
                noUpdateAttributeTime++;
                return
            }
            Actor._sl_needUpdateAttribute = false;
            noUpdateAttributeTime = 0;
            //遍历所有
            DataBase.forUnitSolarDatas((u, solarData: AppData) => {
                SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(u)
            })

        });
        //实时刷新
        se.on("属性刷新", () => {
            //遍历所有
            DataBase.forUnitSolarDatas((u, solarData: AppData) => {
                SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(u)
            })
        })
        //实时刷新
        ActorBuffUtil.addAnyActorBuffCreatedListener(buff => {
            if (buff.attribute) {
                SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(buff.unit)
            }
        });
        se.onUnitPickupItem(e => {
            let trigUnit = e.trigUnit;
            BaseUtil.runLater(0.1, () => {
                SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(trigUnit);
            });
        });
        se.onUnitDropItem(e => {
            //延迟 刷新 此时可能装备还在身上 或其他物品修改逻辑
            let trigUnit = e.trigUnit;
            BaseUtil.runLater(0.1, () => {
                SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(trigUnit);
            });
        });

    }

    static refreshActorAttributes2UnitSolarAttribute(unitHandle: unit) {
        //死亡单位不刷新
        if (!UnitStateUtil.isAlive(unitHandle)) {
            return;
        }
        let attributes: AppAttribute[] = ActorUtil.getUnitAllActorAttributes(unitHandle);
        let oldAttr: AppAttribute = DataBase.getUnitSolarData(unitHandle, false)?._SL_totalActorsSolarAttribute;
        if (oldAttr == null) {//如果之前没有旧buff属性 则退出后续逻辑  否则还需将之前的旧属性 移除
            if (attributes == null || attributes.length == 0) {
                return
            }
        }
        let totalAttribute: SolarAttribute = AttributeUtil.sumAttributes(attributes);

        /**
         属性 系统
         */
        let solarData = DataBase.getUnitSolarData(unitHandle);
        if (!solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }

        AttributeUtil.subtract(solarData._SL_solarAttribute, oldAttr);
        AttributeUtil.add(solarData._SL_solarAttribute, totalAttribute);

        solarData._SL_totalActorsSolarAttribute = totalAttribute;
        //发送属性改变事件
        UnitAttributeState.refreshUnitSolarAttribute(unitHandle)
    }

}