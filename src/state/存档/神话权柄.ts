import ActorTypeUtil from "@/ActorTypeUtil";
import BaseUtil from "@/BaseUtil";
import {d_神话权柄累计解锁} from "../../xlsx/存档/神话权柄累计解锁";
import PlatUtil from "@/PlatUtil";

export default class 神话权柄 {


    constructor() {
        BaseUtil.runLater(1, () => {
            this.init()
        })

    }


    init() {
        //只是做一个提示
        //
        let actorType = ActorTypeUtil.getActorType("神话权柄");
        let count = PlatUtil.getStoreInt(GetLocalPlayer(), "shqb") || 0
        let describe = actorType.describe + "|n|cff00ff00当前数量:" + count + "  累计解锁:|n|r"
        for (let data of d_神话权柄累计解锁) {
            if (count >= data.requireValMin) {
                describe = describe + "|n|cff00ff00" + data.requireValMin + " " + data.describe + "|r"
            } else {
                describe = describe + "|n" + data.requireValMin + " " + data.describe
            }

        }
        actorType.describe = describe;

    }


}