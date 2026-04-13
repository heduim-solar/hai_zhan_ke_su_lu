import BaseUtil from "@/BaseUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ArchiveUtil from "@/ArchiveUtil";
import PlatUtil from "@/PlatUtil";
import {d_主炮存档A} from "../../xlsx/存档/主炮存档A";
import {d_主炮存档B} from "../../xlsx/存档/主炮存档B";
import {d_主炮存档C} from "../../xlsx/存档/主炮存档C";

/**
 * 主炮序号当做id
 */
export default class 主炮存档ABC {


    constructor() {
        BaseUtil.runLater(1.1, () => {
            主炮存档ABC.init()
        })


    }

    static 获取激活的存档设计图数量(player: player, 包括重复的数量: boolean = false) {
        let count = 0;
        for (let i = 0; i < d_主炮存档A.length; i++) {
            let cdVal = ArchiveUtil.get(player, "_zp_a_" + i);
            if (cdVal && cdVal > 0) {
                if (包括重复的数量) {
                    count += cdVal;
                } else {
                    count++;
                }
            }
            //
            cdVal = ArchiveUtil.get(player, "_zp_b_" + i);
            if (cdVal && cdVal > 0) {
                if (包括重复的数量) {
                    count += cdVal;
                } else {
                    count++;
                }
            }
            //
            cdVal = ArchiveUtil.get(player, "_zp_c_" + i);
            if (cdVal && cdVal > 0) {
                if (包括重复的数量) {
                    count += cdVal;
                } else {
                    count++;
                }
            }
        }
        return count;

    }

    static init() {
        let zpTipsActorType = ActorTypeUtil.registerActorType({
            id: "主炮存档提示",
            name: "主炮存档提示",
            class: "主炮存档",
            uiShowType: "通用图标面板",
            uiEnable: true,
            icon: "图标\\存档\\主炮存档.blp",
            describe: "通关后随机获得主炮加强存档。\n" +
                "主炮存档可以叠加，每个数量提升原本的10%，到达5个数量的时候额外获得本效果+100%，到达10个数量时增加三维100，到达15个数量时增加20%全属性加成\n" +
                "存档数量最大生效数量=地图等级",
        });

        for (let i = 0; i < d_主炮存档A.length; i++) {
            let data = d_主炮存档A[i];
            ActorTypeUtil.registerActorType(data as any);
            data = d_主炮存档B[i];
            ActorTypeUtil.registerActorType(data as any);
            data = d_主炮存档C[i];
            ActorTypeUtil.registerActorType(data as any);
        }


        let index = 0;
        //只是异步做展示使用
        let mapLevel = PlatUtil.getMapLevel(GetLocalPlayer());
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "主炮存档"
            actorType.hide = true
            let cdVal = ArchiveUtil.get(GetLocalPlayer(), "_zp_a_" + index);
            if (cdVal && cdVal > 0) {
                actorType.uiEnable = true;
                if (cdVal > mapLevel) {
                    actorType.describe = "|cff00ff00当前数量*" + cdVal + "(受到地图等级最大限制:" + mapLevel + ")|r|n" + actorType.describe;
                } else {
                    actorType.describe = "|cff00ff00当前数量*" + cdVal + "|r|n" + actorType.describe;
                }

            }
            index++;
        }, "主炮存档A");
        index = 0;
        //只是异步做展示使用
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "主炮存档"
            actorType.hide = true
            let cdVal = ArchiveUtil.get(GetLocalPlayer(), "_zp_b_" + index);
            if (cdVal && cdVal > 0) {
                actorType.uiEnable = true;
                if (cdVal > mapLevel) {
                    actorType.describe = "|cff00ff00当前数量*" + cdVal + "(受到地图等级最大限制:" + mapLevel + ")|r|n" + actorType.describe;
                } else {
                    actorType.describe = "|cff00ff00当前数量*" + cdVal + "|r|n" + actorType.describe;
                }
            }
            index++;
        }, "主炮存档B")
        index = 0;
        //只是异步做展示使用
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "主炮存档"
            actorType.hide = true
            let cdVal = ArchiveUtil.get(GetLocalPlayer(), "_zp_c_" + index);
            if (cdVal && cdVal > 0) {
                actorType.uiEnable = true;
                if (cdVal > mapLevel) {
                    actorType.describe = "|cff00ff00当前数量*" + cdVal + "(受到地图等级最大限制:" + mapLevel + ")|r|n" + actorType.describe;
                } else {
                    actorType.describe = "|cff00ff00当前数量*" + cdVal + "|r|n" + actorType.describe;
                }
            }
            index++;
        }, "主炮存档C")


    }

}