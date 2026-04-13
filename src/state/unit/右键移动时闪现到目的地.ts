import {Trigger} from "@/trigger";
import PlayerUtil from "@/PlayerUtil";
import MathUtil from "@/MathUtil";
import BaseUtil from "@/BaseUtil";
import ActorUnitUtil from "@/ActorUnitUtil";

export default class 右键移动时闪现到目的地 {

    static cfg = []


    constructor() {


        let tri = new Trigger();
        PlayerUtil.forPlayingPlayers(player => {
            TriggerRegisterPlayerUnitEvent(tri.handle, player, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, null);
        })

        tri.addAction(() => {
            let dw = GetTriggerUnit()
            let x = GetOrderPointX()
            let y = GetOrderPointY()

            if (GetIssuedOrderId() == 851971 && MathUtil.distanceBetweenPoints(x, y, GetUnitX(dw), GetUnitY(dw)) > 500) {//移动命令
                let actorUnitTypeId = ActorUnitUtil.getActorUnitTypeId(dw);
                if (右键移动时闪现到目的地.cfg.includes(id2string(GetUnitTypeId(dw))) ||
                    (actorUnitTypeId != null && 右键移动时闪现到目的地.cfg.includes(actorUnitTypeId))) {//助手的命令
                    let angleBetweenCoords = MathUtil.angleBetweenCoords(GetUnitX(dw), GetUnitY(dw), x, y);
                    SetUnitPosition(dw, x, y)//移动单位
                    BaseUtil.runLater(0.1111, () => {
                        SetUnitFacingTimed(dw, angleBetweenCoords, 0)
                    })

                }
            }
        })
    }

}