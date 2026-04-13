import ActorTypeUtil from "@/ActorTypeUtil";
import BaseUtil from "@/BaseUtil";
import PlatUtil from "@/PlatUtil";
import {d_地图等级奖励} from "../../xlsx/存档/地图等级奖励";

export default class 地图等级奖励提示 {


    constructor() {
        BaseUtil.runLater(1, () => {
            this.init()
        })

    }


    init() {
        //只是做一个提示
        //
        let actorType = ActorTypeUtil.getActorType("地图等级");
        let count = PlatUtil.getMapLevel(GetLocalPlayer()) || 0
        let describe = actorType.describe + "|n|cff00ff00当前等级:" + count + "  累计解锁:|n|r";
        for (let data of d_地图等级奖励) {
            if (data.requireValMin < 1) {
                continue;
            }
            if (count >= data.requireValMin) {
                describe = describe + "|n|cff00ff00" + data.requireValMin + " " + data.describe + "|r"
                actorType.uiEnable = true;
            } else {
                describe = describe + "|n" + data.requireValMin + " " + data.describe
            }

        }
        actorType.describe = describe;

    }


}