import BaseUtil from "@/BaseUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_击杀BOSS装备存档} from "../../xlsx/存档/击杀BOSS装备存档";
import {d_通关奖励} from "../../xlsx/存档/通关奖励";

export default class 存档分类重组 {


    constructor() {

        BaseUtil.runLater(0.11, () => {
            存档分类重组.重组()
            //
            // let actors = ["忠诚之心", "血色之心", "污染之心", "绝望之心"]
            // for (let actorId of actors) {
            //     let actorType: t_深度海域存档 = ActorTypeUtil.getActorType(actorId);
            //     let archiveVal: number = ArchiveUtil.get(GetLocalPlayer(), actorType.requireKey) || 0;
            //     ActorTypeUtil.setTypeDescribe(actorType.id, "|cff00ff00当前数量:" + archiveVal + "|r|n" + actorType.describe)
            // }
            //
            for (let data of d_击杀BOSS装备存档) {
                if (data.val1 == 1) {
                    let archiveVal: number = ArchiveUtil.get(GetLocalPlayer(), data.requireKey) || 0;
                    ActorTypeUtil.setTypeDescribe(data.id, "|cff00ff00当前数量:" + archiveVal + "|r|n" + data.describe)
                }
            }

        });

        BaseUtil.runLater(5, () => {
            存档分类重组.渐进式显示图标()
        })

    }


    static 重组() {
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "击杀BOSS"
        }, "深度海域")
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "基础礼包"
        }, "地图等级")
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "基础礼包"
        }, "礼包奖励")
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.class = "基础礼包"
        }, "通关奖励")

    }


    static 渐进式显示图标() {
        let lastOpen = true;
        for (let dataType of d_通关奖励) {
            if (dataType.id && ActorTypeUtil.hasActorType(dataType.id)) {
                let actorType = ActorTypeUtil.getActorType(dataType.id)
                if (lastOpen == true && actorType.hide == true) {
                    actorType.hide = false;
                }
                lastOpen = actorType.uiEnable;
            }


        }
    }

}