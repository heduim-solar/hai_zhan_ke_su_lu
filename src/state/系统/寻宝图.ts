import {l_水手寻宝图} from "../../_sl_editor/l_水手寻宝图";
import {d_藏宝图} from "../../xlsx/装备/藏宝图";
import BaseUtil from "@/BaseUtil";
import RandomUtil from "@/RandomUtil";
import {l_冰霜寻宝图} from "../../_sl_editor/l_冰霜寻宝图";
import {l_黄金寻宝图} from "../../_sl_editor/l_黄金寻宝图";
import {l_黑色寻宝图} from "../../_sl_editor/l_黑色寻宝图";
import PlayerUtil from "@/PlayerUtil";
import MapHeroUtil from "../../util/MapHeroUtil";
import UnitUtil from "@/UnitUtil";
import {l_起始点} from "../../_sl_editor/l_起始点";

export default class 寻宝图 {


    constructor() {

        //随机刷新16本寻宝图
        BaseUtil.runLater(120, () => {
            for (let i = 0; i < 1; i++) {
                let nextInt = RandomUtil.nextInt(0, 4);
                if (nextInt == 0) {
                    寻宝图.createItem(l_水手寻宝图, d_藏宝图[0].id)
                } else if (nextInt == 1) {
                    寻宝图.createItem(l_冰霜寻宝图, d_藏宝图[1].id)
                } else if (nextInt == 2) {
                    寻宝图.createItem(l_黑色寻宝图, d_藏宝图[2].id)
                } else {
                    寻宝图.createItem(l_黄金寻宝图, d_藏宝图[3].id)
                }
            }
        }, 16, false);
        //寻宝图进阶
        se.onUnitPickupItem((e,solarTrigger) => {
            let itemTypeIdStr = e.manipulatedItemTypeIdStr;
            let unitTypeIdStr = e.trigUnitTypeIdStr;
            let trigUnitOwner = e.trigUnitOwner;
            solarTrigger.enable = false;
            if (itemTypeIdStr == d_藏宝图[0].id) {
                if (unitTypeIdStr == "A400") {
                    // MapHeroUtil.do进化ByType(trigUnitOwner, 2, "A401")
                    RemoveItem(e.manipulatedItem)
                    MapHeroUtil.do进化ByTypeAndKeepAbility(trigUnitOwner, 2, "A401", false, false)
                } else {
                    PlayerUtil.text(trigUnitOwner, "只有水手号才能拾取此藏宝图进阶!")
                }
            } else if (itemTypeIdStr == d_藏宝图[1].id) {
                if (unitTypeIdStr == "A402") {
                    // MapHeroUtil.do进化ByType(trigUnitOwner, 2, "A403")
                    RemoveItem(e.manipulatedItem)
                    MapHeroUtil.do进化ByTypeAndKeepAbility(trigUnitOwner, 2, "A403", false, false)
                } else {
                    PlayerUtil.text(trigUnitOwner, "只有铁达尼号才能拾取此藏宝图进阶!")
                }
            } else if (itemTypeIdStr == d_藏宝图[2].id) {
                if (unitTypeIdStr == "A404") {
                    // MapHeroUtil.do进化ByType(trigUnitOwner, 2, "A405")
                    RemoveItem(e.manipulatedItem)
                    UnitUtil.transfer(e.trigUnit, l_起始点[0].x, l_起始点[0].y)
                    MapHeroUtil.do进化ByTypeAndKeepAbility(trigUnitOwner, 2, "A405", false, false)
                } else {
                    PlayerUtil.text(trigUnitOwner, "只有黑珍珠号才能拾取此藏宝图进阶!")
                }
            } else if (itemTypeIdStr == d_藏宝图[3].id) {
                if (unitTypeIdStr == "A406") {
                    // MapHeroUtil.do进化ByType(trigUnitOwner, 2, "A407")
                    RemoveItem(e.manipulatedItem)
                    MapHeroUtil.do进化ByTypeAndKeepAbility(trigUnitOwner, 2, "A407", false, false)
                } else {
                    PlayerUtil.text(trigUnitOwner, "只有桑尼号才能拾取此藏宝图进阶!")
                }
            }
            solarTrigger.enable = true;
        });


    }


    static createItem(vectors: Vector[], itemType: string) {
        let d = vectors[RandomUtil.nextInt(0, vectors.length - 1)]
        let item = CreateItem(itemType, d.x, d.y)
        PlayerUtil.text(GetLocalPlayer(), "藏宝图出现在地图中了,快去寻找吧!:" + GetItemName(item))

        print(GetItemName(item) + " => " + d.x + "," + d.y + " -> " + GetItemX(item) + "," + GetItemY(item))


    }


}