/** @noSelf **/
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorItemUtil from "@/ActorItemUtil";

export default class ItemUtil {
    private static _temp_onlyAlive = true;
    private static _temp_callBack: (this: void, item: item) => void = null;
    private static _SL_EnumItemsInRectFunc = function (this: void) {
        let item = GetEnumItem();
        if (ItemUtil._temp_onlyAlive) {
            //只遍历活着的 物品
            //很多消耗物品 使用后会继续在地面上 生命为0
            if (GetWidgetLife(item) >= 1 && IsItemVisible(item)) {
                ItemUtil._temp_callBack(item);
            }
        } else {
            ItemUtil._temp_callBack(item);
        }

    }

    /**
     * 创建多个物品
     * 并设置所有者
     */
    static createItems(itemid: number | string, x: number, y: number, count: number = 1, owningPlayerId: number = PLAYER_NEUTRAL_PASSIVE): item {
        let p = Player(owningPlayerId);
        let item = null;
        for (let i = 0; i < count; i++) {
            item = CreateItem(itemid, x, y);
            SetItemPlayer(item, p, true)
        }
        return item
    }

    /**
     * 选取矩形区域内的物品做动作
     * @param r
     * @param callBack
     * @param onlyAlive
     */
    static forItemsInRect(r: rect, callBack: (this: void, item: item) => void, onlyAlive: boolean = true) {
        if (ItemUtil._temp_callBack != null) {//已在使用中
            log.errorWithTraceBack("不能在此函数回调参数里 再使用此函数!")
            return
        }
        ItemUtil._temp_onlyAlive = onlyAlive;
        ItemUtil._temp_callBack = callBack;
        //使用命名函数 减少闭包交互
        EnumItemsInRect(r, null, ItemUtil._SL_EnumItemsInRectFunc)
        ItemUtil._temp_callBack = null;//空闲状态
    }

    /**
     * 设置物品提示
     * @param itemcode
     * @param value
     */
    static setItemTip(itemcode: number | string, value: string) {
        EXSetItemDataString(itemcode, 4, value)
        if (isEmbedJapi) {
            //设置名字
            EXSetItemDataString(itemcode, 2, value)
        }

    }

    /**
     * 设置物品扩展提示
     * @param itemcode
     * @param value
     */
    static setItemUbertip(itemcode: number | string, value: string) {
        EXSetItemDataString(itemcode, 3, value)
        if (isEmbedJapi) {
            //设置物品描述
            EXSetItemDataString(itemcode, 5, value)
        }
    }

    /**
     * 设置物品图标
     * @param itemcode
     * @param value
     */
    static setItemArt(itemcode: number | string, value: string) {
        EXSetItemDataString(itemcode, 1, value)
    }

    /**
     * 单位是否拥有装备
     */
    static getItemOfTypeFromUnit(udw: unit, otid: number | string): item {
        if (typeof otid === 'string') {
            otid = FourCC(otid)
        }
        for (let index = 0; index < 6; index++) {
            let item = UnitItemInSlot(udw, index);
            if (GetItemTypeId(item) == otid) {
                return item
            }
        }
        return null;
    }


    /**
     * 单位拥有物品的数量. 使用次数也算数量
     */
    static getItemCountOfTypeFromUnit(udw: unit, itemIdStr: string): number {
        if (itemIdStr == null) {
            return 0;
        }
        if (ActorTypeUtil.hasActorType(itemIdStr)) {
            //走演员物品逻辑
            let count = 0;
            for (let index = 0; index < 6; index++) {
                let item = UnitItemInSlot(udw, index);
                if (ActorItemUtil.getActorItemTypeId(item) == itemIdStr) {
                    count = count + (Math.max(GetItemCharges(item), 1))
                }
            }
            return count;
        } else {
            let otid = FourCC(itemIdStr)
            let count = 0;
            for (let index = 0; index < 6; index++) {
                let item = UnitItemInSlot(udw, index);
                if (GetItemTypeId(item) == otid) {
                    count = count + (Math.max(GetItemCharges(item), 1))
                }
            }
            return count;
        }

    }


    /**
     * 单位是否拥有装备
     */
    static isUnitHasItem(udw: unit, otid: number | string): boolean {
        if (typeof otid === 'string') {
            otid = FourCC(otid)
        }
        for (let index = 0; index < 6; index++) {
            let wpid = GetItemTypeId(UnitItemInSlot(udw, index))
            if (wpid == otid) {
                return true
            }
        }
        return false
    }

    /**
     * 单位是否拥有物品数组中所有物品
     */
    static isUnitHasItems(udw: unit, itAy: number[] | string[]): boolean {
        for (const iterator of itAy) {
            if (!ItemUtil.isUnitHasItem(udw, iterator)) {
                return false
            }
        }
        return true
    }

    /**
     * 获取物品栏首个物品
     * @param callback
     */
    static getFirstItemFromUnit(unit: unit): item {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i)
            if (IsHandle(item)) {
                return item;
            }
        }
        return null;
    }

    /**
     * 获取所有物品
     * @param callback
     */
    static getAllItemFromUnit(unit: unit): item[] {
        let items: item[] = []
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i)
            if (IsHandle(item)) {
                items.push(item);
            }
        }
        return items;
    }

    /**
     *  获得物品和使用次数
     * @param unit
     */
    static getItemAndChargesFromUnit(unit: unit): { [id: string]: number } {
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
            let oldCharges = items[itemTypeStr]
            if (!oldCharges) {
                oldCharges = 0;
            }
            items[itemTypeStr] = oldCharges + itemCharges
        }
        return items;
    }

    /**
     * 消耗玩家拥有的物品类型的物品使用次数
     * @param unit
     * @param itemId
     * @param charges
     */
    static costItemChargesFromUnit(unit: unit, itemId: number, charges: number): number {
        let costCharges = 0//已经消耗的次数
        let needCostCharges = 0 //还需要消耗的次数
        for (let i = 0; i < 6; i++) {
            needCostCharges = charges - costCharges
            if (costCharges >= charges) {
                return costCharges
            }
            let item = UnitItemInSlot(unit, i)
            if (GetItemTypeId(item) != itemId) {
                continue
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


    /**
     * 根据屏幕点获得点击的物品栏位置
     * @param sceneX
     * @param sceneY
     */
    static getItemSlotBySceneXY(sceneX: number, sceneY: number): number {
        let rX = Math.floor((sceneX - 0.515) / 0.036);
        if (rX < 0 || rX > 1) {
            return null;
        }
        let rY = 2 - Math.floor((sceneY - 0.001) / 0.037);
        if (rY < 0 || rY > 2) {
            return null;
        }
        return rY * 2 + rX;
    }


    /**
     * 是否用空闲的物品栏格子
     * @param unit
     */
    static hasIdleItemGrid(unit: unit): boolean {
        let inventorySize = UnitInventorySize(unit);
        for (let i = 0; i < inventorySize; i++) {
            let item = UnitItemInSlot(unit, i);
            if (!IsHandle(item)) {
                return true
            }
        }
        return false;
    }


    /**
     * 移除一个单位的所有物品
     * @param unit
     */
    static removeUnitItems(unit: unit) {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                RemoveItem(item);
            }
        }
    }

    /**
     * 将一个单位的所有物品转移到另一个单位上
     * @param srcUnit
     * @param toUnit
     */
    static transferItems(srcUnit: unit, toUnit: unit) {
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(srcUnit, i);
            if (IsHandle(item)) {
                UnitAddItem(toUnit, item);
                UnitDropItemSlot(toUnit, item, i)
            }
        }
    }


}
