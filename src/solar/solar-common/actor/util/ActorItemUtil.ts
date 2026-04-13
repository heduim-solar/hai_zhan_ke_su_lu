import Actor from "@/Actor";
import ActorItem from "@/ActorItem";
import DataBase from "@/DataBase";

/**
 * see ActorUtil 优先使用演员通用工具 不要把演员局限到技能或物品或buff上 这样会导致演员不够通用切换形态
 */
export default class ActorItemUtil {

    /**
     * 创建一个演员物品
     * @param itemActorTypeId
     * @param player
     * @param x
     * @param y
     */
    static createActorItem(itemActorTypeId: string, x: number, y: number, player?: player) {
        let actorItem = new ActorItem(itemActorTypeId, x, y);
        if (IsHandle(player)) {
            SetItemPlayer(actorItem.item, player, true)
        }
        return actorItem;
    }

    /**
     * 创建一个演员物品给单位
     * @param itemActorTypeId
     * @param unit
     * @param uses 使用次数
     */
    static addActorItemForUnit(itemActorTypeId: string, unit: unit, uses?: number): ActorItem {
        if (itemActorTypeId == null || !IsHandle(unit)) {
            log.errorWithTraceBack("错误的参数:" + tostring(itemActorTypeId) + " unit=" + tostring(unit))
            return;
        }
        let actor = new ActorItem(itemActorTypeId, GetUnitX(unit), GetUnitY(unit));
        if (uses) {
            actor.setUses(uses);
        }
        UnitAddItem(unit, actor.item);
        return actor;
    }

    /**
     *
     * 如果有演员物品数据
     * @param item
     * @param callBack
     * @param actorTypeId
     */
    static ifHasActorItem(item: item, callBack: (actor: ActorItem) => void, actorTypeId?: string) {
        let actor: ActorItem = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
        if (actor == null) {
            return
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return;
        }
        callBack(actor);
    }

    /**
     * 根据物品 获得对应的演员物品数据
     * @param item
     * @param actorTypeId
     */
    static getActorItem(item: item, actorTypeId?: string): ActorItem {
        if (!IsHandle(item)) {
            return null;
        }
        let actor: ActorItem = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
        if (actor == null) {
            return null;
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return null;
        }
        return actor
    }

    /**
     * 根据物品 获得对应的演员物品类型id
     * @param item 物品
     */
    static getActorItemTypeId(item: item): string {
        let actor: ActorItem = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
        if (actor == null) {
            return null
        }
        return actor.actorTypeId
    }

    /**
     * 获取一个单位身上的所有 演员物品
     * @param unit
     * @param actorTypeId
     */
    static getUnitActorItemList(unit: unit, actorTypeId?: string): ActorItem[] {
        let actorList: ActorItem[] = null
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor != null) {
                    if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
                        continue;
                    }
                    if (actorList == null) {
                        actorList = [];
                    }
                    actorList.push(actor as ActorItem)
                }
            }
        }
        return actorList;
    }

    /**
     * 获取一个单位身上的所有 演员物品
     * @param unit
     * @param kind
     */
    static getUnitActorItemListByKind(unit: unit, kind: string): ActorItem[] {
        let actorList: ActorItem[] = null
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor != null) {
                    if (kind != actor.get("kind")) {
                        continue;
                    }
                    if (actorList == null) {
                        actorList = [];
                    }
                    actorList.push(actor as ActorItem)
                }
            }
        }
        return actorList;
    }


    /**
     * 获取一个单位身上的第一个指定演员类型的演员物品
     * @param unit
     * @param actorTypeId
     */
    static getUnitActorItem(unit: unit, actorTypeId: string): ActorItem {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor != null && actorTypeId == actor.actorTypeId) {
                    return actor as ActorItem;
                }
            }
        }
        return null;
    }


    /**
     * 使用此函数前请优先考虑使用ActorUtil.ifUnitHasActor（那样吞噬为buff等也有效，游戏代码写灵活点才能应对随时可能改变的玩法）
     * 如果单位是否持有某个类型的演员物品
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifUnitHasActorItem(unit: unit, callBack: (actor: ActorItem) => void, actorTypeId: string) {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor != null && actor.actorTypeId == actorTypeId) {
                    callBack(actor as ActorItem)
                }
            }
        }
    }

    /**
     * 使用此函数前请优先考虑使用ActorUtil.isUnitHasActor 以尽量保证演员的功能不局限于某一种演员类型 方便吞噬等转换
     * 判断单位是否持有某个类型的演员物品
     * @param unit
     * @param actorTypeId
     */
    static isUnitHasActorItem(unit: unit, actorTypeId: string): boolean {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor != null && actor.actorTypeId == actorTypeId) {
                    return true;
                }
            }
        }
        return false
    }

    /**
     *  获得物品和使用次数
     * @param unit
     */
    static getItemAndActorItemAndChargesFromUnit(unit: unit): { [id: string]: number } {
        let items: { [id: string]: number } = {}
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i)
            if (!IsHandle(item)) {
                continue
            }
            let itemTypeStr = id2string(GetItemTypeId(item))
            let itemCharges = GetItemCharges(item);
            if (!itemCharges || itemCharges < 1) {
                itemCharges = 1;
            }
            //添加值
            items[itemTypeStr] = (items[itemTypeStr] || 0) + itemCharges
            let actor: ActorItem = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
            if (actor != null) {
                items[actor.actorType.id] = (items[actor.actorType.id] || 0) + itemCharges
            }

        }
        return items;
    }

    /**
     * 消耗玩家拥有的物品类型（或者演员物品类型） 的物品使用次数
     * @param unit
     * @param itemIdOrActorTypeId 物品4字符串id 或者演员物品字符串id
     * @param charges
     */
    static costItemAndActorItemChargesFromUnit(unit: unit, itemIdOrActorTypeId: string, charges: number): number {
        let costCharges = 0//已经消耗的次数
        let needCostCharges = 0 //还需要消耗的次数
        for (let i = 0; i < 6; i++) {
            needCostCharges = charges - costCharges
            if (costCharges >= charges) {
                return costCharges
            }
            let item = UnitItemInSlot(unit, i)
            //
            if (id2string(GetItemTypeId(item)) != itemIdOrActorTypeId) {
                //判断是否演员物品类型
                let actor: Actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor == null || itemIdOrActorTypeId != actor.actorType.id) {
                    continue
                }
            }
            let itemCharges = GetItemCharges(item);
            if (!itemCharges || itemCharges < 1) {
                itemCharges = 1;
            }
            //消耗值
            if (itemCharges <= needCostCharges) {
                costCharges = costCharges + itemCharges
                RemoveItem(item)
            } else if (itemCharges > needCostCharges) {
                costCharges = costCharges + needCostCharges
                SetItemCharges(item, itemCharges - needCostCharges)
            }
        }
        return costCharges;
    }
}