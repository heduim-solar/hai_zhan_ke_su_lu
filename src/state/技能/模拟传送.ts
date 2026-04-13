import ActorTypeUtil from "@/ActorTypeUtil";
import UnitUtil from "@/UnitUtil";
import {d_传送} from "../../xlsx/技能/传送";
import TerrainUtil from "@sl-wc3/TerrainUtil";
import RectUtil from "@/RectUtil";
import BaseUtil from "@/BaseUtil";
import AttributeUtil from "@/AttributeUtil";
import AbilityUtil from "@/AbilityUtil";

export default class 模拟传送 {


    constructor() {

        // let actorType = ActorTypeUtil.getActorType("传送");
        // actorType.onAction = (actor, data) => {
        //     let unit = GetSpellTargetUnit();
        //     UnitUtil.transfer(actor.unit, GetUnitX(unit), GetUnitY(unit))
        // }


        se.onUnitSpellEffect(e => {
            let x = e.spellTargetX;
            let y = e.spellTargetY
            if (TerrainUtil.isTerrainLand(x, y)) {
                for (let i = 0; i < 10000; i++) {
                    x = x + GetRandomInt(-500, 500);
                    y = y + GetRandomInt(-500, 500);
                    if (!TerrainUtil.isTerrainLand(x, y) && RectUtil.isContainsCoords(bj_mapInitialPlayableArea, x, y)) {
                        break;
                    }
                }
            }
            let trigUnit = e.trigUnit;
            BaseUtil.runLater(0.1, () => {
                UnitUtil.transfer(trigUnit, x, y);
                let attribute = AttributeUtil.getUnitAttribute(trigUnit, false);
                AbilityUtil.setUnitAbilityStateCooldown(trigUnit, d_传送[0].id, 15 + (attribute?.传送冷却 || 0))
            })

        }, d_传送[0].id)


    }


}