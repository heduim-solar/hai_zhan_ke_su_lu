/**
 * 玩家 里的常用函数集合
 */
import {MapPlayer} from "@/player";
import DataBase from "@/DataBase";
import AttributeUtil from "@/AttributeUtil";

export default class PlayerEvent {

    static instance: PlayerEvent = new PlayerEvent();

    protected constructor() {

    }

    /**
     * 触发玩家
     */
    get triggerPlayer(): player {
        return GetTriggerPlayer();
    }

    /**
     * 触发玩家对象
     */
    get triggerPlayerObj(): MapPlayer {
        return MapPlayer.fromHandle(GetTriggerPlayer());
    }

    /**
     * 触发玩家id
     */
    get triggerPlayerId(): number {
        return GetPlayerId(GetTriggerPlayer());
    }

    /**
     * 触发玩家名字
     */
    get triggerPlayerName(): string {
        return GetPlayerName(GetTriggerPlayer());
    }

    /**
     * 触发玩家 聊天信息
     */
    get eventPlayerChatString(): string {
        return GetEventPlayerChatString()
    }

    /**
     * 触发玩家 SolarData
     */
    get triggerPlayerSolarData(): AppUnitData {
        return DataBase.getPlayerSolarData(GetTriggerPlayer());
    }

    /**
     * 触发玩家 Attribute
     */
    get triggerPlayerAttribute(): AppAttribute {
        return AttributeUtil.getPlayerAttribute(GetTriggerPlayer());
    }

}