import HeroUtil from "@/HeroUtil";
import SelectUtil from "@/SelectUtil";
import UnitStateUtil from "@/UnitStateUtil";
import PlayerUtil from "@/PlayerUtil";

export default class 英雄属性书 {


    static config: {
        [itemId: string]: {
            type: "STR" | "AGI" | "INT" | "FULLP" | "HP" | "EXP" | "LV" | string
            val: number
        }
    } = {}


    constructor() {
        se.onUnitPickupItem(e => {
            let itemIdStr = e.manipulatedItemTypeIdStr;
            let cData = 英雄属性书.config[itemIdStr];
            if (!cData) {
                return
            }
            let hero = e.trigUnit;
            if (!HeroUtil.isHero(hero)) {
                hero = SelectUtil.getAnHero(e.trigUnitOwnerId)
            }
            if (!IsHandle(hero)) {
                PlayerUtil.text(e.trigUnitOwner, "没有找到英雄!")
                return;
            }

            if (cData.type == "HP") {
                UnitStateUtil.addMaxLifeAndLife(hero, cData.val)
            } else if (cData.type == "LV") {
                SetHeroLevel(hero, GetHeroLevel(hero) + cData.val, true)

            } else if (cData.type == "EXP") {
                SetHeroXP(hero, GetHeroXP(hero) + cData.val, true)
            } else if (cData.type == "FULLP") {//全属性
                HeroUtil.addHeroProperty(hero, cData.val, cData.val, cData.val)
            } else {
                HeroUtil.addHeroPropertyByKey(hero, cData.type as any, cData.val)
            }


        })


    }


}