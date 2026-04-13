import ActorAbility from "@/ActorAbility";
import ObjectDataUtil from "@/ObjectDataUtil";
import BaseUtil from "@/BaseUtil";
import ObjectTemplateUtil from "@/ObjectTemplateUtil";
import ColorUtil from "@/ColorUtil";
import DataBase from "@/DataBase";

/**
 * 注意物品不应该被单位A死 否则事件回调去销毁物品对应的关联数据
 *
 * 优先保证写法兼容ActorBuff 这样吞噬后才有效果（既不要过多使用此子类中的具体功能 比如使用次数）
 *
 */
export default class ActorItem extends ActorAbility {
    itemId?: string
    item: item

    constructor(actorTypeId: string, x: number = 0, y: number = 0) {
        super(actorTypeId)
        //
        let templateType = this.getTemplateType()
        if (templateType == null) {
            templateType = "主动物品"
        }
        this.itemId = ObjectTemplateUtil.borrowTemplate(templateType);
        this.templateId = this.itemId;
        this.abilityId = ObjectDataUtil.getItemAbilList(this.itemId);
        if (this.abilityId != null && this.abilityId.length != 4) {
            this.abilityId = null;//被动物品
        }
        this.item = CreateItem(this.itemId, x, y)
        DataBase.getItemSolarData(this.item, true)._SL_solarActorItem = this;
        //
        if (this.abilityId != null) {
            //物品模板id 与技能模板id 都指向此演员物品实例对象 （演员物品本身也是继承演员技能）
            DataBase.getAbilityTypeSolarData(this.abilityId, true)._SL_solarActorAbility = this;
        }
        this.set("templateType", templateType)
        this._sl_init()
        this.update()
    }


    /**
     * 获取演员的类型
     */
    get actorType(): AppActorItemType {
        return this._actorType;
    }

    protected _sl_rawset<Key extends keyof AppActorItemType>(key: Key, value: AppActorType[Key]) {
        super._sl_rawset(key, value);
        switch (key) {
            case "id":
                break;
            case "name":
                EXSetItemDataString(this.itemId, 4, value)
                break;
            case "describe":
                EXSetItemDataString(this.itemId, 3, value)
                break;
            case "hide":
                SetItemVisible(this.item, !value)
                break;
            case "pawnable":
                SetItemPawnable(this.item, value)
                break;
            case "droppable":
                SetItemDroppable(this.item, value)
                break;
            case "uses":
                SetItemCharges(this.item, value)
                break;
            case "model":
                //内置的设置单位可以 设置物品的模型
                SetUnitModel?.(this.item as any, value)
                break;
            case "colorR":
                let colorIntByRGB = ColorUtil.getColorIntByRGB(value || 255,
                    this.get("colorG", 255), this.get("colorB", 255));
                EXSetItemColor?.(this.item as any, colorIntByRGB)
                break;
            case "colorG":
                let colorIntByRGB2 = ColorUtil.getColorIntByRGB(this.get("colorR", 255),
                    value || 255, this.get("colorB", 255));
                EXSetItemColor?.(this.item as any, colorIntByRGB2)
                break;
            case "colorB":
                let colorIntByRGB3 = ColorUtil.getColorIntByRGB(this.get("colorR", 255),
                    this.get("colorG", 255), value || 255);
                EXSetItemColor?.(this.item as any, colorIntByRGB3)
                break;
            case "disable":
                if (this.get("disable")) {
                    this.getRootFrameControl().getDisableFrame().visible = true;
                } else {
                    let disableFrame = this.getRootFrameControl(false)?.getDisableFrame(false);
                    if (disableFrame) {
                        disableFrame.visible = false;
                    }
                }
                break;
            case "icon":
                this.refreshIcon()
                break;

        }
    }

    get<Key extends keyof AppActorItemType>(key: Key, defaultValue?: AppActorItemType[Key]): AppActorItemType[Key] {
        return super.get(key, defaultValue);
    }


    /**
     * 获取物品技能Handle
     */
    getAbility(): ability | null {
        if (GetItemAbility) {
            return GetItemAbility(this.item, 0);
        } else {
            return super.getAbility()
        }
    }

    /**
     * 设置是否可抵押 卖给商店
     * @param pawnable
     */
    setPawnable(pawnable: boolean) {
        this.set("pawnable", pawnable)
    }

    /**
     * 设置是否可丢弃
     * @param droppable
     */
    setDroppable(droppable: boolean) {
        this.set("droppable", droppable)
    }

    /**
     * 仅物品才拥有的使用次数 在使用此函数时请慎重考虑你做的功能逻辑 真的仅是物品吗(并且未来策划玩法不会更改这个功能可以吞噬吗？)
     * 增加使用次数。负数则为减少
     * @param add
     */
    addUses(add: number): number {
        let newUses = Math.max(GetItemCharges(this.item), 1) + add;
        this.setUses(newUses);
        return newUses;
    }

    /**
     * 仅物品才拥有的使用次数 在使用此函数时请慎重考虑你做的功能逻辑 真的仅是物品吗(并且未来策划玩法不会更改这个功能可以吞噬吗？)
     * 设置使用次数
     * @param newUses
     */
    setUses(newUses: number): void {
        this.set("uses", newUses)
        if (newUses <= 0 && this.get("destroyOnNoUses") == true) {
            this.destroy();
        }
    }

    /**
     * 仅物品才拥有的使用次数 在使用此函数时请慎重考虑你做的功能逻辑 真的仅是物品吗(并且未来策划玩法不会更改这个功能可以吞噬吗？)
     * 获得使用次数 最低为1
     * @param add
     */
    getUses(): number {
        return Math.max(GetItemCharges(this.item), 1)
    }


    setXY(x: number, y: number) {
        this.set("x", x)
        this.set("y", y)
        SetItemPosition(this.item, x, y)
    }


    update() {
        if (this._sl_isDestroyed) {
            return
        }
        this.updating = true;
        super.update();
        //
        if (this.unit != null) {

            //鼠标指到物品的情况 重选单位以刷新文本
            if (selection() == this.unit) {
                SelectUnit(this.unit, true);
            }
        }
        this.updating = false;
    }

    /**
     * 刷新图标
     */
    refreshIcon() {
        this.updating = true;
        EXSetItemDataString(this.itemId, 1, this.get("icon"))
        //延迟一下 触发某些事件如拾取时 装备可能不在单位身上
        BaseUtil.runLater(0.01, () => {
            //移动位置以刷新图标 和文本
            if (this.unit == null) {
                this.updating = false;
                return;
            }
            for (let i = 0; i < 6; i++) {
                if (UnitItemInSlot(this.unit, i) == this.item) {
                    let tempSlot = 5;
                    if (i == 5) {
                        tempSlot = 4;
                    }
                    let tempSlotItem = UnitItemInSlot(this.unit, tempSlot);
                    UnitDropItemSlot(this.unit, this.item, tempSlot);
                    UnitDropItemSlot(this.unit, this.item, i);
                    UnitDropItemSlot(this.unit, tempSlotItem, tempSlot);
                    this.updating = false;
                    return;
                }
            }
            //物品未被此单位持有 则重设单位
            this.unit = null;
            this.updating = false;
        })

    }

    action(x: number, y: number, targetUnit?: unit) {
        super.action(x, y, targetUnit);
        if (this.get("destroyOnNoUses") == true) {
            //同步物品使用次数 到自定义变量uses
            BaseUtil.runLater(0.05, () => {
                if (IsHandle(this.item)) {
                    this.setUses(GetItemCharges(this.item));
                }
            })
        }
    }


    destroy() {
        let item = this.item
        super.destroy();
        if (this.abilityId != null) {
            DataBase.getAbilityTypeSolarData(this.abilityId, true)._SL_solarActorAbility = null;
        }
        this.item = null;
        if (IsHandle(item)) {
            RemoveItem(item)
        }
    }


}