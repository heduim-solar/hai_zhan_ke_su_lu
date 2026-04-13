import DataBase from '@/DataBase';
import BaseUtil from '@/BaseUtil';
import {Trigger} from "@/trigger";


/**
 ** 双击传送物品
 ** DataBase.getPlayerSolarData(p).hero = 玩家的第一个英雄
 ** DataBase.getPlayerSolarData(p).assistant = 玩家的第一个宝宝
 */
export default class 类双击物品时英雄宝宝交换该物品 {
    constructor() {
        let trigger = new Trigger();
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
        trigger.addAction(this.action);
    }

    // 双击传送物品动作
    action(this: void) {
        //代码触发的事件不需要 传送
        if (gv.isUnitDropItemSlotExecIng == true) {
            return;
        }
        if (GetIssuedOrderId() >= 852002 && GetIssuedOrderId() <= 852007) {
            DisableTrigger(GetTriggeringTrigger())
            let u = GetTriggerUnit()
            let p = GetOwningPlayer(u)
            // 判断是宝宝，还是英雄
            let collect_item_unit: unit
            if (u == DataBase.getPlayerSolarData(p).hero) {
                if (DataBase.getPlayerSolarData(p).assistant) {
                    collect_item_unit = DataBase.getPlayerSolarData(p).assistant
                } else {
                    EnableTrigger(GetTriggeringTrigger())
                    return
                }
            } else if (u == DataBase.getPlayerSolarData(p).assistant) {
                // 判断有这个单位不
                if (DataBase.getPlayerSolarData(p).hero) {
                    collect_item_unit = DataBase.getPlayerSolarData(p).hero
                } else {
                    EnableTrigger(GetTriggeringTrigger())
                    return
                }
            } else {
                EnableTrigger(GetTriggeringTrigger())
                return
            }
            ;
            let target_item = GetOrderTargetItem();
            let old_coordinate = 7
            let new_coordinate = 8
            for (let i = 0; i < 6; i++) {
                let item = UnitItemInSlot(u, i)
                if (target_item == item) {
                    old_coordinate = i
                    break
                }
                ;
            }
            ;
            // 延迟判断
            handle_ref(u)
            BaseUtil.runLater(0.03, () => {
                handle_unref(u)
                for (let i = 0; i < 6; i++) {
                    let item = UnitItemInSlot(u, i)
                    if (target_item == item) {
                        new_coordinate = i
                        break
                    }
                    ;
                }
                ;
                if (old_coordinate == new_coordinate) {
                    UnitAddItem(collect_item_unit, target_item)
                    // 提示背包爆满！
                    let item = UnitItemInSlot(u, new_coordinate)
                    if (target_item == item) {
                        DisplayTimedTextToPlayer(p, 0, 0, 5, '|cff00ffff传送对象的背包已满！|r');
                    }
                    ;
                }
                ;
            });
            EnableTrigger(GetTriggeringTrigger())
        }
        ;

    }

};