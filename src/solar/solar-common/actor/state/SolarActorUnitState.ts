import ActorUnitUtil from "@/ActorUnitUtil";
import UnitRewardUtil from "@/UnitRewardUtil";
import TextTagUtil from "@/TextTagUtil";
import RandomUtil from "@/RandomUtil";
import DataBase from "@/DataBase";
import ItemUtil from "@/ItemUtil";
import ActorItemUtil from "@/ActorItemUtil";
import UnitUtil from "@/UnitUtil";
import BaseUtil from "@/BaseUtil";
import SingletonUtil from "@/SingletonUtil";

export default class SolarActorUnitState {
    static config = {
        /** 启用演员单位击杀奖励金币 */
        openBounty: true,
        /** 启用演员单位击杀奖励物品 */
        openBountyItems: true,
        /** 启用演员单位击杀后诞生的单位 */
        openAfterDeathBirthUnits: true
    }

    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorUnitState)) {
            print("不能重复new SolarActorUnitState()")
            return;
        }
        //演员携带的属性加成
        BaseUtil.runLater(2, () => {
            SolarActorUnitState.openBounty();
        })

    }

    /**
     * 开启奖励 （作者可以重写此方法实现自己的词条逻辑）
     */
    static openBounty() {
        se.onUnitDeath(e => {
            if (!e.hasKillingUnit) {
                return;
            }
            let actorUnit = ActorUnitUtil.getActorUnit(e.trigUnit);
            if (actorUnit == null) {
                return
            }
            //one case
            if (SolarActorUnitState.config.openBounty) {
                let bounty = actorUnit.get("bounty");
                if (bounty && bounty > 0) {
                    let earnGold = UnitRewardUtil.addGoldWithEarnGoldP(e.killingUnit, bounty);
                    TextTagUtil.textGold("+" + earnGold, e.trigUnit)
                }
            }
            //one case
            if (SolarActorUnitState.config.openBountyItems) {
                let bountyItems = actorUnit.get("bountyItems");
                if (bountyItems) {
                    for (let itemId in bountyItems) {
                        if (RandomUtil.isInChance(bountyItems[itemId])) {
                            if (DataBase.getSolarActorType(itemId) == null) {
                                ItemUtil.createItems(itemId, e.trigUnitX, e.trigUnitY, 1, e.killingUnitOwnerId)
                            } else {
                                ActorItemUtil.createActorItem(itemId, e.trigUnitX, e.trigUnitY, e.killingUnitOwner)
                            }
                        }
                    }
                }
            }
            //one case
            if (SolarActorUnitState.config.openAfterDeathBirthUnits) {
                let afterDeathBirthUnits = actorUnit.get("afterDeathBirthUnits");
                if (afterDeathBirthUnits) {
                    for (let unitId in afterDeathBirthUnits) {
                        if (RandomUtil.isInChance(afterDeathBirthUnits[unitId])) {
                            let count = Math.max(Math.floor(afterDeathBirthUnits[unitId]), 1)
                            if (DataBase.getSolarActorType(unitId) == null) {
                                UnitUtil.createUnit(e.trigUnitOwner, unitId, e.trigUnitX, e.trigUnitY, 0, count)
                            } else {
                                ActorUnitUtil.createActorUnit(e.trigUnitOwner, unitId, e.trigUnitX, e.trigUnitY, 0, count)
                            }
                        }
                    }
                }
            }

        });
    }
}