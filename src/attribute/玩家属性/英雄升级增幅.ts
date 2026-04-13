import AttributeUtil from "@/AttributeUtil";

declare global {
    interface AppPlayerAttribute {
        英雄升级增幅?: number
    }

    interface AppUnitData {
        _sl_英雄升级增幅_last_lv?: number
    }
}
export default class 英雄升级增幅 {

    constructor() {
        let flag = false;
        se.onHeroLevelUp(e => {
            if (flag) {
                return;
            }
            let hero = e.trigUnit;
            let playerAttribute = AttributeUtil.getPlayerAttribute(e.trigUnitOwner);
            if (playerAttribute?.英雄升级增幅 == null) {
                return
            }

            let solarData = db.getUnitSolarData(hero);
            let lastLv = solarData._sl_英雄升级增幅_last_lv || 1
            let addLv = GetHeroLevel(hero) - lastLv;
            let shopExtAddLv = addLv * playerAttribute.英雄升级增幅

            //额外增加等级
            flag = true;
            SetHeroLevel(hero, GetHeroLevel(hero) + shopExtAddLv, true)
            flag = false;//不要死循环了
            solarData._sl_英雄升级增幅_last_lv = GetHeroLevel(hero)

        })

    }


}