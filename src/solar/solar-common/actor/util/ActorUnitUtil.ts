import ActorUnit from "@/ActorUnit";
import DataBase from "@/DataBase";

export default class ActorUnitUtil {


    /**
     * 创建演员单位
     * @param player
     * @param actorUnitTypeId
     * @param x
     * @param y
     * @param face
     * @param count 创建数量 默认为1
     * 返回最后一个创建的演员单位
     * @param callBack 创建单位后的回调
     */
    static createActorUnit(player: player, actorUnitTypeId: string, x: number, y: number, face: number = 0, count: number = 1, callBack?: (actorUnit: ActorUnit) => void): ActorUnit {
        let actorUnit = null;
        for (let i = 0; i < count; i++) {
            actorUnit = new ActorUnit(actorUnitTypeId, player, x, y);
            SetUnitFacing(actorUnit.unit, face);
            callBack?.(actorUnit);
        }
        return actorUnit
    }


    /**
     * 如果单位是一个 演员单位
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifHasActorUnit(unit: unit, callBack: (actor: ActorUnit) => void, actorTypeId?: string) {
        let actor: ActorUnit = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return;
        }
        callBack(actor);
    }

    /**
     * 判断单位是一个 演员单位
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static hasActorUnit(unit: unit, callBack: (actor: ActorUnit) => void, actorTypeId?: string) {
        let actor: ActorUnit = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return false
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return false;
        }
        return true;
    }

    /**
     * 判断单位是一个 演员单位
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static getActorUnit(unit: unit, actorTypeId?: string): ActorUnit {
        let actor: ActorUnit = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return null;
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return null;
        }
        return actor;
    }

    /**
     * 判断单位是一个演员单位类型
     * @param unit
     * @param actorTypeId
     */
    static isActorUnitType(unit: unit, actorTypeId: string): boolean {
        let actor: ActorUnit = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        if (actor == null) {
            return false;
        }
        if (actorTypeId == actor.actorTypeId) {
            return true;
        }
        return false;
    }

    /**
     * 获取单位的演员单位类型id
     * @param unit
     */
    static getActorUnitTypeId(unit: unit): string {
        let actor: ActorUnit = DataBase.getUnitSolarData(unit, false)?._SL_solarActorUnit;
        return actor?.actorTypeId;
    }


    /**
     * 获取单位的名字
     * @param whichUnit
     */
    static getUnitName(whichUnit: unit) {
        let actorUnit = ActorUnitUtil.getActorUnit(whichUnit);
        if (actorUnit != null) {
            return actorUnit.getName();
        }
        return GetUnitName(whichUnit);
    }
}