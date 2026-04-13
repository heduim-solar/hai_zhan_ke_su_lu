import UnitUtil from "@/UnitUtil";
import ActorItemUtil from "@/ActorItemUtil";
import ActorItem from "@/ActorItem";
import TextTagUtil from "@/TextTagUtil";
import PlayerUtil from "@/PlayerUtil";
import SingletonUtil from "@/SingletonUtil";
import BaseUtil from "@/BaseUtil";
import DataBase from "@/DataBase";

export default class SolarActorItemState {


    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorItemState)) {
            print("不能重复new SolarActorItemState()")
            return;
        }
        se.onUnitPickupItem(e => {
            //召唤单位死亡时 会触发丢弃召唤单位的事件
            if (UnitUtil.isSummoned(e.trigUnit)) {
                return
            }
            ActorItemUtil.ifHasActorItem(e.manipulatedItem, (actor) => {
                let stackMax: number = actor.get("stackMax");
                if (stackMax && stackMax > 1) {
                    //叠加层数
                    let actorItems: ActorItem[] = ActorItemUtil.getUnitActorItemList(e.trigUnit, actor.actorTypeId);
                    //旧物品
                    let actorItem: ActorItem = null;
                    if (actorItems != null && actorItems.length > 0) {
                        for (let tempItem of actorItems) {
                            if (tempItem != actor && tempItem.getUses() < stackMax) {
                                actorItem = tempItem;
                                break;
                            }
                        }
                    }
                    if (actorItem != null) {
                        if (actorItem.getUses() <= (stackMax - actor.getUses())) {
                            actorItem.addUses(actor.getUses());
                            //由于堆叠了使用次数 所以销毁这个物品
                            actor.destroy();
                        } else {
                            let moveUse = stackMax - actorItem.getUses();
                            actorItem.addUses(moveUse);
                            actor.addUses(-moveUse);
                        }

                        return
                    }
                }
                //唯一性限制
                if (actor.get("unique") == true) {
                    BaseUtil.runLater(0.1, () => {
                        SolarActorItemState.checkItemUnique(actor);
                    });
                }

                actor.unit = e.trigUnit
                //更新一下 以保证能获取到技能 物品拾取事件时 物品可能还不在单位物品栏上 但是物品拥有的技能却已经在单位身上了
                actor.update();
            })
        })
        se.onUnitDropItem(e => {
            //召唤单位死亡时 会触发丢弃召唤单位的事件
            if (UnitUtil.isSummoned(e.trigUnit)) {
                return
            }
            ActorItemUtil.ifHasActorItem(e.manipulatedItem, (actor) => {
                actor.unit = null;
            })
        })

        //模拟售卖
        se.onUnitPawnItem(e => {
            ActorItemUtil.ifHasActorItem(e.soldItem, (actor) => {
                if (actor.get("pawnable") != false) {
                    if (actor.get("goldCost") != null && actor.get("goldCost") > 0) {
                        let add = Math.floor(actor.get("goldCost") * PawnItemRate)
                        if (add > 0) {
                            if (actor.get("stackMax", 0) > 0) {
                                add *= actor.getUses();
                            }
                            PlayerUtil.addGoldState(actor.unitOwner, add)
                            TextTagUtil.textGold("" + add, actor.unit);
                        }
                    }
                    if (actor.get("lumberCost") != null && actor.get("lumberCost") > 0) {
                        let add = Math.floor(actor.get("lumberCost") * PawnItemRate)
                        if (add > 0) {
                            if (actor.get("stackMax", 0) > 0) {
                                add *= actor.getUses();
                            }
                            let texttag = TextTagUtil.textLumber("" + add, actor.unit);
                            SetTextTagVelocity(texttag, 0.04, 0)
                        }
                    }
                }
                actor.unit = null;
                actor.destroy();
            })
        })


    }


    static checkItemUnique(actor: ActorItem) {
        if (actor.get("unique") == true && IsHandle(actor.unit)) {
            let unit = actor.unit;
            //助手不受限制
            if (DataBase.getPlayerSolarData(actor.unitOwner, false)?.assistant == unit) {
                return;
            }
            let itemList = ActorItemUtil.getUnitActorItemList(unit, actor.actorTypeId);
            if (itemList && itemList.length > 1) {
                TextTagUtil.textWarn("只能携带一个" + actor.getName(), unit)
                // SetItemPosition(actor.item, GetUnitX(unit), GetUnitY(unit))
                UnitRemoveItem(actor.unit, actor.item);
                return;
            }
            let kind = actor.get("kind");
            if (kind != null) {
                let itemList = ActorItemUtil.getUnitActorItemListByKind(unit, kind);
                if (itemList && itemList.length > 1) {
                    TextTagUtil.textWarn("只能携带一种" + kind, unit);
                    // SetItemPosition(actor.item, GetUnitX(unit), GetUnitY(unit));
                    UnitRemoveItem(actor.unit, actor.item);
                    return;
                }
            }
        }
    }
}