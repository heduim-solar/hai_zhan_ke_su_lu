import ActorAbility from "@/ActorAbility";
import DataBase from "@/DataBase";

/**
 * see ActorUtil 优先使用演员工具 不要把演员局限到技能或物品上 这样会导致演员不够统一
 */
export default class ActorAbilityUtil {


    /**
     * 给单位添加一个演员技能
     * @param actorTypeId
     * @param unit
     * @param startPosNum
     */
    static createActorAbility(actorTypeId: string, unit: unit, startPosNum?: number): ActorAbility {
        return new ActorAbility(actorTypeId, unit, startPosNum);
    }

    /**
     * 移除并销毁单位身上指定演员类型的演员技能
     * @param unit
     * @param actorTypeId
     */
    static destroyUnitAbility(unit: unit, actorTypeId: string,): boolean {
        let actorAbility = ActorAbilityUtil.getUnitActorAbility(unit, actorTypeId);
        if (actorAbility == null) {
            return false
        }
        actorAbility.destroy();
        return true;
    }

    /**
     * 获取单位身上指定演员类型的演员技能
     * @param unit
     * @param actorTypeId
     */
    static getUnitActorAbility(unit: unit, actorTypeId: string): ActorAbility {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null && actor.actorTypeId == actorTypeId) {
                return actor as ActorAbility;
            }
        }
        return null;
    }

    /**
     * 获取单位身上指定位置的演员技能 1=左上角 12=右下角
     * @param unit
     * @param pos
     */
    static getUnitActorAbilityByPos(unit: unit, pos: number): ActorAbility {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[pos], false)?._SL_solarActorAbility;
        if (actor != null) {
            return actor as ActorAbility;
        }
        return null;
    }

    /**
     * 如果有演员技能数据
     * @param abilityId
     * @param callBack
     * @param actorTypeId
     */
    static ifHasActorAbility(abilityId: string, callBack: (actor: ActorAbility) => void, actorTypeId?: string) {
        let actor: ActorAbility = DataBase.getAbilityTypeSolarData(abilityId, false)?._SL_solarActorAbility;
        if (actor == null) {
            return
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return;
        }
        callBack(actor);
    }

    /**
     * 是否有演员技能数据
     * @param abilityId
     * @param callBack
     * @param actorTypeId
     */
    static isHasActorAbility(abilityId: string, actorTypeId?: string): boolean {
        let actor: ActorAbility = DataBase.getAbilityTypeSolarData(abilityId, false)?._SL_solarActorAbility;
        if (actor == null) {
            return false
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return false;
        }
        return true;
    }

    /**
     * 获取演员技能数据
     * @param abilityId
     * @param callBack
     * @param actorTypeId
     */
    static getActorAbility(abilityId: string, actorTypeId?: string): ActorAbility {
        let actor: ActorAbility = DataBase.getAbilityTypeSolarData(abilityId, false)?._SL_solarActorAbility;
        if (actor == null) {
            return null
        }
        if (actorTypeId != null && actorTypeId != actor.actorTypeId) {
            return null;
        }
        return actor;
    }

    /**
     * 获取一个单位身上的所有 演员技能 的数量
     * @param unit
     * @param clazz 同class 类别
     */
    static getUnitActorAbilityListSize(unit: unit, clazz: string): number {
        let abilityList = ActorAbilityUtil.getUnitActorAbilityList(unit, clazz);
        if (abilityList == null) {
            return 0;
        }
        return abilityList.length;
    }

    /**
     * 获取一个单位身上的所有 演员技能
     * @param unit
     * @param clazz 同class 类别
     */
    static getUnitActorAbilityList(unit: unit, clazz?: string): ActorAbility[] {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        let actorList: ActorAbility[] = null
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null) {
                if (clazz != null && clazz != actor.actorType.class) {
                    continue;
                }
                if (actorList == null) {
                    actorList = []
                }
                actorList.push(actor)
            }
        }
        return actorList;
    }

    /**
     * 遍历一个单位身上的所有 演员技能
     * @param unit
     * @param callBack
     * @param clazz 同class 类别
     */
    static forUnitActorAbilityList(unit: unit, callBack: (actor: ActorAbility) => void, clazz?: string): void {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null) {
                if (clazz != null && clazz != actor.actorType.class) {
                    continue;
                }
                callBack(actor);
            }
        }
    }

    /**
     * 使用此函数前请优先考虑使用ActorUtil.ifUnitHasActor 以尽量保证演员的功能不局限于某一种演员类型 方便吞噬等转换
     * 如果单位是有拥有某个类型的 演员技能
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifUnitHasActorAbility(unit: unit, callBack: (actor: ActorAbility) => void, actorTypeId: string): void {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null && actor.actorTypeId == actorTypeId) {
                callBack(actor as ActorAbility)
                return;
            }
        }
        return;
    }

    /**
     * 使用此函数前请优先考虑使用ActorUtil.isUnitHasActor 以尽量保证演员的功能不局限于某一种演员类型 方便吞噬等转换
     * 判断单位是有拥有某个类型的 演员技能
     * @param unit
     * @param actorTypeId
     */
    static isUnitHasActorAbility(unit: unit, actorTypeId: string) {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return false;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null && actor.actorTypeId == actorTypeId) {
                return true;
            }
        }
        return false;
    }

    /**
     * 销毁一个单位身上的所有 演员技能
     * @param unit
     * @param clazz
     */
    static destroyUnitAllActorAbility(unit: unit, clazz?: string): void {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null) {
                if (clazz == null || clazz == actor.actorType.class) {
                    actor.destroy();
                }
            }
        }
    }

}