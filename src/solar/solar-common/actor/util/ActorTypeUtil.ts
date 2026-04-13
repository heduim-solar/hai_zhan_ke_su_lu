import DataBase from "@/DataBase";
import ActorItem from "@/ActorItem";

/**
 * 演员类型相关工具
 */


export default class ActorTypeUtil {
    /**这里也保存一下 以保证遍历顺序跟注册顺序一致*/
    private static actorTypes: AppActorType[] = []

    /**
     * 注册演员类型
     * @param actorTypeID
     */
    static registerActorType(actorTypeID: string): AppActorType ;
    static registerActorType(actorType: AppActorType): AppActorType ;
    static registerActorType(actorTypeIdOrActorType: AppActorType | string): AppActorType {
        let actorType = null;
        if (typeof actorTypeIdOrActorType == "string") {
            actorType = {id: actorTypeIdOrActorType}
        } else {
            actorType = actorTypeIdOrActorType;
        }
        if (actorType.id == null || actorType.id.length == 0) {
            print_r(actorType)
            log.errorWithTraceBack("ActorType id必须赋值！")
            return
        }
        //这里保存一下保证读取时快速根据ID读取
        if (DataBase.getSolarActorType(actorType.id) == null) {
            DataBase.setSolarActorType(actorType.id, actorType);
            ActorTypeUtil.actorTypes.push(actorType)
        } else {
            log.errorWithTraceBack("不能重复注册ActorType:" + actorType.id + " -> " + tostring(actorType.name))
        }
        return actorType;
    }

    /**
     * 是否拥有指定的演员类型
     * @param actorTypeId 类型id
     */
    static hasActorType(actorTypeId: string): boolean {
        //这里保存一下保证读取时快速根据ID读取
        if (actorTypeId == null || actorTypeId.length == 0) {
            return false;
        }
        if (DataBase.getSolarActorType(actorTypeId) == null) {
            return false;
        }
        return true;
    }


    /**
     * 根据actorTypeId返回Actor类型
     * @param actorTypeId
     */
    static getActorType(actorTypeId: string): AppActorType {
        if (actorTypeId == null) {
            log.errorWithTraceBack("actorTypeId不能为null!")
            return null;
        }
        let actorType = DataBase.getSolarActorType(actorTypeId);
        if (actorType == null) {
            log.errorWithTraceBack("不存在此演员类型id:" + actorTypeId + " 请在获取时刻之前注册此id,当前获取时刻是:" + (_g_time / 1000) + "秒")
        }

        return actorType;
    }

    /**
     * 遍历所有Actor类型
     * @param callback 遍历回调函数
     * @param actorTypeClass ActorType的类别 Class
     */
    static forAllActorTypes(callback: (actorType: AppActorType, index: number) => void, ...actorTypeClass: string[]): void {
        //
        let index = 0;
        if (actorTypeClass && actorTypeClass.length > 0) {
            for (let actorType of ActorTypeUtil.actorTypes) {
                if (actorTypeClass.includes(actorType.class)) {
                    callback(actorType, index);
                    index++;
                }
            }
        } else {
            for (let actorType of ActorTypeUtil.actorTypes) {
                callback(actorType, index);
                index++;
            }

        }

    }


    /**
     *
     * @param actorTypeId 增益效果类型id
     * @param uiEnable 是否启用
     * @param player 改变指定玩家的图标禁用状态 不填则给所有玩家修改
     * （示例 商城道具跟存档这些也是演员类型 默认都是禁用的 可以使用此方法对玩家启用此类型  数值计算还是同步计算 这个类型就是作为ui显示数据而已 ）
     */
    static setUiEnable(actorTypeId: string, uiEnable: boolean, player?: player): void {
        if (player != null && GetLocalPlayer() != player) {//异步给指定的玩家改
            return;
        }
        let actorType = ActorTypeUtil.getActorType(actorTypeId)
        if (actorType == null) {
            print("设置未注册的Actor图标:" + actorTypeId)
            return;
        }
        actorType.uiEnable = uiEnable;
    }


    /**
     * 可以改变演员类型 的扩展提示信息
     * @param actorTypeId
     * @param describe
     * @param player 为指定玩家异步修改
     */
    static setTypeDescribe(actorTypeId: string, describe: string, player?: player): void {
        if (player != null && GetLocalPlayer() != player) {//异步给指定的玩家改
            return;
        }
        let actorType = ActorTypeUtil.getActorType(actorTypeId)
        if (actorType == null) {
            print("设置未注册的Actor提示:" + actorTypeId)
            return;
        }
        actorType.describe = describe;
    }


    /**
     * 从基础物品物编注册 演员类型
     *  (将一个原始物品类型包装到一个演员物品 以方便使用演员物编的事件等api)
     * （使用举例: 部分需要原始物品的效果 比如市场(随机)售卖的物品 获得后又需要演员物品的事件效果）
     * @param itemTypeIdStr
     * @param baseData
     * @param bindItemAndActor
     */
    static registerActorTypeFromBaseItemType(itemTypeIdStr: string, baseData: AppActorType = {}, bindItemAndActor: boolean = false): AppActorType {
        let itemObjInfo: iobj = _g_objs.item[itemTypeIdStr];
        if (itemObjInfo == null) {
            log.errorWithTraceBack("不存在此物品id:" + itemTypeIdStr)
            return null;
        }
        baseData.id = itemTypeIdStr
        baseData.name = itemObjInfo.Tip
        baseData.icon = itemObjInfo.Art
        baseData.describe = itemObjInfo.Ubertip
        if (itemObjInfo.file) {
            baseData.model = itemObjInfo.file
        }
        if (itemObjInfo.pawnable) {
            baseData.pawnable = itemObjInfo.pawnable == "1"
        }
        if (itemObjInfo.droppable) {
            baseData.droppable = itemObjInfo.droppable == "1"
        }
        if (itemObjInfo.goldcost) {
            baseData.goldCost = Math.floor(tonumber(itemObjInfo.goldcost));
        }
        if (itemObjInfo.lumbercost) {
            baseData.lumberCost = Math.floor(tonumber(itemObjInfo.lumbercost));
        }
        ActorTypeUtil.registerActorType(baseData);
        if (bindItemAndActor) {
            se.onUnitPickupItem(e => {
                if (e.manipulatedItemTypeIdStr == itemTypeIdStr) {
                    RemoveItem(e.manipulatedItem);
                    let actorItem = new ActorItem(itemTypeIdStr);
                    UnitAddItem(e.trigUnit, actorItem.item)
                }
            })
        }
        return baseData;
    }


}