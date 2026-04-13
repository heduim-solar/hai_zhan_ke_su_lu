import {MapPlayer} from "@/player";
import DataBase from "@/DataBase";
import AttributeUtil from "@/AttributeUtil";

export default class UIFrameEvent {


    static instance: UIFrameEvent = new UIFrameEvent();

    protected constructor() {

    }

    /**
     * 触发玩家
     */
    get triggerFrame(): number {
        return DzGetTriggerUIEventFrame();
    }

    /**
     * 触发玩家
     */
    get triggerPlayer(): player {
        //应该是本地玩家
        return DzGetTriggerUIEventPlayer();
    }

    /**
     * 触发玩家对象
     */
    get triggerPlayerObj(): MapPlayer {
        return MapPlayer.fromHandle(DzGetTriggerUIEventPlayer());
    }

    /**
     * 触发玩家id
     */
    get triggerPlayerId(): number {
        return GetPlayerId(DzGetTriggerUIEventPlayer());
    }

    /**
     * 触发玩家名字
     */
    get triggerPlayerName(): string {
        return GetPlayerName(DzGetTriggerUIEventPlayer());
    }


    /**
     * 触发玩家 SolarData
     */
    get triggerPlayerSolarData(): AppUnitData {
        return DataBase.getPlayerSolarData(DzGetTriggerUIEventPlayer(), false);
    }

    /**
     * 触发玩家 Attribute
     */
    get triggerPlayerAttribute(): AppAttribute {
        return AttributeUtil.getPlayerAttribute(DzGetTriggerUIEventPlayer(), false);
    }

}