import Actor from "@/Actor";
import DataBase from "@/DataBase";

/**
 * 演员通常最终作用于单位身上。（事实上所有游戏 所有数据 所有逻辑 最终的表现几乎都是在单位身上）
 * 优先使用此演员工具 不要把演员局限到技能或物品上 这样会导致演员不够统一 也不利于转换结构 比如吞噬这些 要保证无论是演员技能还是演员物品 都应该是一样的 所以优先考虑把逻辑代码写到演员基类里
 */
export default class ActorUtil {


    /**
     * 返回一个单位包含的所有演员  数据
     * 包括 演员单位 演员技能 演员物品 演员buff
     * 可以用来执行跟单位相关的通用逻辑  比如销毁单位时 或单位触发基础事件时 通用分发
     * @param unit
     */
    static getUnitAllActorList(unit: unit): Actor[] {
        if (!IsHandle(unit)) {
            return null;
        }
        let actorList: Actor[] = null;
        let solarData = DataBase.getUnitSolarData(unit, false);
        if (solarData != null) {
            //单位
            let actor = solarData._SL_solarActorUnit;
            if (actor != null) {
                actorList = [actor];
            }
            //技能
            let abilityTemplate = solarData._SL_abilityTemplate;
            if (abilityTemplate != null) {
                if (actorList == null) {
                    actorList = [];
                }
                for (let abilityTemplateKey in abilityTemplate) {
                    let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
                    if (actor != null) {
                        actorList.push(actor)
                    }
                }
            }
            //演员buff
            let _SL_solarActorBuffSet = solarData._SL_solarActorBuffSet;
            if (_SL_solarActorBuffSet) {
                for (let actorBuffSetKey in _SL_solarActorBuffSet) {
                    let actor = _SL_solarActorBuffSet[actorBuffSetKey]
                    if (actor != null) {
                        if (actorList == null) {
                            actorList = [];
                        }
                        actorList.push(actor)
                    }
                }
            }
        }
        let invSize = UnitInventorySize(unit)
        for (let i = 0; i < invSize; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let actor = DataBase.getItemSolarData(item, false)?._SL_solarActorItem;
                if (actor != null) {
                    if (actorList == null) {
                        actorList = [];
                    }
                    actorList.push(actor)
                }
            }
        }
        return actorList;
    }

    /**
     * 遍历单位身上的所有演员
     * @param unit
     * @param callback
     * @param clazz
     */
    static forUnitAllActorList(unit: unit, callback: (actor: Actor) => void, clazz?: string): void {
        let actorList = ActorUtil.getUnitAllActorList(unit);
        if (actorList == null) {
            return
        }
        for (let actor of actorList) {
            if (clazz == null || clazz == actor.get("class")) {
                callback(actor);
            }
        }
    }

    /**
     * 获取单位身上的所有演员 (指定演员类型 Class)
     * @param unit
     * @param clazz 同Class
     */
    static getUnitAllActorListByClass(unit: unit, clazz: string): Actor[] {
        let actorList = ActorUtil.getUnitAllActorList(unit);
        if (actorList == null) {
            return
        }
        let result: Actor[] = []
        for (let actor of actorList) {
            if (clazz == null || clazz == actor.get("class")) {
                result.push(actor);
            }
        }
        return result;
    }

    /**
     * 获取单位身上的所有演员 (指定演员类型 Class)
     * @param unit
     * @param clazz 同Class
     * @param kind
     * @param tag
     */
    static getUnitAllActorListAndWhere(unit: unit, clazz?: string, kind?: string, tag?: string): Actor[] {
        let actorList = ActorUtil.getUnitAllActorList(unit);
        if (actorList == null) {
            return
        }
        let result: Actor[] = []
        for (let actor of actorList) {
            if (clazz != null && clazz != actor.get("class")) {
                continue
            }
            if (kind != null && kind != actor.get("kind")) {
                continue
            }
            if (tag != null && tag != actor.get("tag")) {
                continue
            }
            result.push(actor);
        }
        return result;
    }

    /**
     * 获取单位身上所有buff 的属性值
     * @param unit
     */
    static getUnitAllActorAttributes(unit: unit): AppAttribute[] {
        let attributeArray: AppAttribute[] = null;
        let solarData = DataBase.getUnitSolarData(unit, false);
        if (solarData != null) {
            //单位
            let attribute: AppAttribute = solarData._SL_solarActorUnit?.attribute;
            if (attribute != null) {
                attributeArray = [attribute];
            }
            //技能
            let abilityTemplate = solarData._SL_abilityTemplate;
            if (abilityTemplate != null) {
                if (attributeArray == null) {
                    attributeArray = [];
                }
                for (let abilityTemplateKey in abilityTemplate) {
                    let attribute = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility?.attribute;
                    if (attribute != null) {
                        attributeArray.push(attribute)
                    }
                }
            }
            //演员buff
            let _SL_solarActorBuffSet = solarData._SL_solarActorBuffSet;
            if (_SL_solarActorBuffSet) {
                for (let actorBuffSetKey in _SL_solarActorBuffSet) {
                    let attribute = _SL_solarActorBuffSet[actorBuffSetKey]?.attribute
                    if (attribute != null) {
                        if (attributeArray == null) {
                            attributeArray = [];
                        }
                        attributeArray.push(attribute)
                    }
                }
            }
        }
        let invSize = UnitInventorySize(unit)
        for (let i = 0; i < invSize; i++) {
            let item = UnitItemInSlot(unit, i);
            if (IsHandle(item)) {
                let attribute = DataBase.getItemSolarData(item, false)?._SL_solarActorItem?.attribute;
                if (attribute != null) {
                    if (attributeArray == null) {
                        attributeArray = [];
                    }
                    attributeArray.push(attribute)
                }
            }
        }
        return attributeArray;
    }

    /**
     * 如果单位是否持有某个类型的演员
     * @param unit
     * @param callBack
     * @param actorTypeId
     */
    static ifUnitHasActor(unit: unit, actorTypeId: string, callBack: (actor: Actor) => void): void {
        let unitAllActorList = ActorUtil.getUnitAllActorList(unit);
        if (unitAllActorList == null) {
            return;
        }
        for (let actor of unitAllActorList) {
            if (actor.actorTypeId == actorTypeId) {
                callBack(actor);
                return;
            }
        }
    }

    /**
     * 判断单位是否持有某个类型的演员(物品 技能 buff)
     * @param unit
     * @param actorTypeId
     */
    static isUnitHasActor(unit: unit, actorTypeId: string): boolean {
        let unitAllActorList = ActorUtil.getUnitAllActorList(unit);
        if (unitAllActorList == null) {
            return false;
        }
        for (let actor of unitAllActorList) {
            if (actor.actorTypeId == actorTypeId) {
                return true;
            }
        }
        return false
    }

    /**
     * 添加任意演员创建事件 监听回调
     */
    static addAnyActorCreatedListener(onActorCreatedListener: (buff: Actor) => void) {
        Actor._sl_anyActorCreatedListeners.push(onActorCreatedListener);
    }

    /**
     * 添加任意演员叠加层数改变事件 监听回调
     */
    static addAnyActorLevelChangeListener(onActorLevelChangeListener: (buff: Actor, stackAdd: number) => void) {
        Actor._sl_anyActorLevelChangeListeners.push(onActorLevelChangeListener);
    }

    /**
     * 添加任意演员销毁事件 监听回调
     */
    static addAnyActorDestroyListener(onActorDestroyListener: (buff: Actor) => void) {
        Actor._sl_anyActorDestroyListeners.push(onActorDestroyListener);
    }

}