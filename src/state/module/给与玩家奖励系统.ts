/** @noSelf **/

import PlayerUtil from "@/PlayerUtil";
import AttributeUtil from "@/AttributeUtil";
import SelectUtil from "@/SelectUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorItemUtil from "@/ActorItemUtil";
import ActorBuffUtil from "@/ActorBuffUtil";

/**
 * 玩家奖励工具
 */
export default class 给与玩家奖励系统 {


    constructor() {
        se.on("给与玩家奖励", e => {
            let player = Player(e.p);
            let rewardName = e.key
            let rewardVal = e.val
            if (rewardVal == null) {
                return
            }
            if (rewardName == "加金币") {
                PlayerUtil.addGoldState(player, rewardVal)
            } else if (rewardName == "加木材") {
                PlayerUtil.addLumberState(player, rewardVal)
            } else if (rewardName == "加人口") {
                PlayerUtil.addFoodCapState(player, rewardVal)
            } else if (rewardName == "加属性") {
                AttributeUtil.addPlayerAttribute(player, rewardVal)
            } else if (rewardName == "给buff") {
                this.给buff(player, rewardVal)
            } else if (rewardName == "给物品") {
                this.给物品(player, rewardVal)
            } else if (rewardName == "给英雄物品") {
                this.给英雄物品(player, rewardVal)
            } else if (rewardName == "加科技") {
                AddPlayerTechResearched(player, rewardVal, 1)
            } else if (rewardName == "地图全亮") {
                CreateFogModifierRectBJ(true, player, FOG_OF_WAR_VISIBLE, GetPlayableMapRect());
            } else if (rewardName == "增加单位建造数量") {
                /**
                 * rewardVal:{[uid:string]:number}
                 */
                for (let unitId in rewardVal) {
                    let maxAllowed = GetPlayerTechMaxAllowed(player, unitId);
                    SetPlayerTechMaxAllowed(player, unitId, maxAllowed + rewardVal[unitId]);
                }
            }
        });

    }

    给buff(player: player, rewardVal: string) {
        let hero = SelectUtil.getAnHero(GetPlayerId(player));
        if (IsHandle(hero)) {
            ActorBuffUtil.addActorBuff(hero, rewardVal);
        }
    }

    给物品(player: player, rewardVal: string) {
        let whichStartLocation = GetPlayerStartLocation(player);
        let startLocX = GetStartLocationX(whichStartLocation)
        let startLocY = GetStartLocationY(whichStartLocation)
        let item: item = null;
        if (ActorTypeUtil.hasActorType(rewardVal)) {
            item = ActorItemUtil.createActorItem(rewardVal, startLocX, startLocY).item;
        } else {
            item = CreateItem(rewardVal, startLocX, startLocY);
        }
        SetItemPlayer(item, player, false)
        //查找一个带有物品栏的单位
        let hero = SelectUtil.getAnHero(GetPlayerId(player));
        if (IsHandle(hero)) {
            UnitAddItem(hero, item)
        } else {
            let playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player));
            if (playerUnits.length > 0) {
                //给玩家的第一个单位 比如生存图开局只有一个农民
                UnitAddItem(playerUnits[0], item)
            }
        }
    }

    给英雄物品(player: player, rewardVal: string) {
        se.on("选择英雄", (hero) => {
            if (GetOwningPlayer(hero) == player) {
                let whichStartLocation = GetPlayerStartLocation(player);
                let startLocX = GetStartLocationX(whichStartLocation)
                let startLocY = GetStartLocationY(whichStartLocation)
                let item = CreateItem(rewardVal, startLocX, startLocY);
                SetItemPlayer(item, player, false)
                //查找一个带有物品栏的单位
                UnitAddItem(hero, item)
            }

        })
    }
}
