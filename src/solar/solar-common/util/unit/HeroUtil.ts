declare type HeroPropertyKey = "STR" | "AGI" | "INT"

export default class HeroUtil {

    /**
     * 是英雄
     */
    static isHero(handle: unit) {
        return IsHeroUnitId(GetUnitTypeId(handle));
    }


    /**
     * 获取英雄主属性
     */
    static getHeroPrimary(handle: unit): HeroPropertyKey {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = _g_objs.unit[objIdStr];
        return obj.Primary
    }

    /**
     * 获取英雄主属性 成长
     * 每等级提升
     */
    static getHeroPrimaryPlus(handle: unit): number {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = _g_objs.unit[objIdStr];
        let primaryPlus = obj[obj.Primary + "plus"];
        return Number(primaryPlus ?? '0');
    }

    /**
     * 获取英雄属性 成长
     * 每等级提升
     * 返回 力量 敏捷 智力的 每级成长值
     */
    static getHeroPlus(handle: unit): number[] {
        let objIdStr = id2string(GetUnitTypeId(handle));
        let obj = _g_objs.unit[objIdStr];
        return [Number(obj["STRplus"]), Number(obj["AGIplus"]), Number(obj["INTplus"])];
    }


    /**
     * 增加三维属性
     * @param handle
     * @param addStrAgiInt
     */
    static addHeroProperty(handle: unit, addStrAgiInt: number): void ;
    /**
     * 增加三维属性
     * @param handle
     * @param addStr
     * @param addAgi
     * @param addInt
     */
    static addHeroProperty(handle: unit, addStr: number, addAgi: number, addInt: number): void ;
    static addHeroProperty(handle: unit, addStr: number, addAgi: number = addStr, addInt: number = addStr): void {
        if (addStr != 0) {
            SetHeroStr(handle, (GetHeroStr(handle, false) + addStr), true)
        }
        if (addAgi != 0) {
            SetHeroAgi(handle, (GetHeroAgi(handle, false) + addAgi), true)
        }
        if (addInt != 0) {
            SetHeroInt(handle, (GetHeroInt(handle, false) + addInt), true)
        }

    }

    /**
     * 增加三维属性 通过自身比例
     * @param handle
     * @param includeBonuses
     * @param addStrAgiIntP
     */

    static addHeroPropertyP(handle: unit, includeBonuses: boolean, addStrAgiIntP: number): void ;
    /**
     * 增加三维属性 通过自身比例
     * @param handle
     * @param includeBonuses
     * @param addStrP
     * @param addAgiP
     * @param addIntP
     */
    static addHeroPropertyP(handle: unit, includeBonuses: boolean, addStrP: number, addAgiP: number, addIntP: number): void ;
    static addHeroPropertyP(handle: unit, includeBonuses: boolean, addStrP: number, addAgiP: number = addStrP, addIntP: number = addStrP): void {
        if (addStrP != 0) {
            SetHeroStr(handle, (GetHeroStr(handle, includeBonuses) * (1 + addStrP)), true)
        }
        if (addAgiP != 0) {
            SetHeroAgi(handle, (GetHeroAgi(handle, includeBonuses) * (1 + addAgiP)), true)
        }
        if (addIntP != 0) {
            SetHeroInt(handle, (GetHeroInt(handle, includeBonuses) * (1 + addIntP)), true)
        }

    }

    /**
     * 设置三维属性
     * @param handle
     * @param newStr
     * @param newAgi
     * @param newInt
     */
    static setHeroProperty(handle: unit, newStr: number, newAgi: number, newInt): void {
        SetHeroStr(handle, newStr, true)
        SetHeroAgi(handle, newAgi, true)
        SetHeroInt(handle, newInt, true)
    }

    /**
     * 增加属性
     * @param handle
     * @param key
     * @param addVal
     */
    static addHeroPropertyByKey(handle: unit, key: HeroPropertyKey, addVal: number): void {

        if (key == "STR") {
            SetHeroStr(handle, (GetHeroStr(handle, false) + addVal), true)
        } else if (key == "AGI") {
            SetHeroAgi(handle, (GetHeroAgi(handle, false) + addVal), true)
        } else if (key == "INT") {
            SetHeroInt(handle, (GetHeroInt(handle, false) + addVal), true)
        }
    }

    /**
     * 增加力量
     * @param handle
     * @param addVal
     */
    static addStr(handle: unit, addVal: number): void {
        SetHeroStr(handle, (GetHeroStr(handle, false) + addVal), true)
    }

    /**
     * 增加敏捷
     * @param handle
     * @param addVal
     */
    static addAgi(handle: unit, addVal: number): void {
        SetHeroAgi(handle, (GetHeroAgi(handle, false) + addVal), true)
    }

    /**
     * 增加智力
     * @param handle
     * @param addVal
     */
    static addInt(handle: unit, addVal: number): void {
        SetHeroInt(handle, (GetHeroInt(handle, false) + addVal), true)
    }

    /**
     * 获取英雄主属性的属性值
     * includeBonuses (默认 白字加绿字奖励)
     */
    static getHeroPrimaryValue(handle: unit, includeBonuses = true): number {
        let Primary = HeroUtil.getHeroPrimary(handle);
        if (Primary == "STR") {
            return GetHeroStr(handle, includeBonuses)
        } else if (Primary == "AGI") {
            return GetHeroAgi(handle, includeBonuses)
        } else if (Primary == "INT") {
            return GetHeroInt(handle, includeBonuses)
        }
        return 0;
    }

    /**
     * 添加英雄主属性的属性值
     * 白字
     */
    static addHeroPrimary(handle: unit, addVal: number): number {
        let Primary = HeroUtil.getHeroPrimary(handle);
        HeroUtil.addHeroPropertyByKey(handle, Primary, addVal)
        return 0;
    }

    /**
     * 获取英雄绿字主属性
     * @param handle
     */
    static getHeroPrimaryBonusValue(handle: unit): number {
        let Primary = HeroUtil.getHeroPrimary(handle);
        if (Primary == "STR") {
            return GetHeroStr(handle, true) - GetHeroStr(handle, false)
        } else if (Primary == "AGI") {
            return GetHeroAgi(handle, true) - GetHeroAgi(handle, false)
        } else if (Primary == "INT") {
            return GetHeroInt(handle, true) - GetHeroInt(handle, false)
        }
        return 0;
    }

    /**
     * 获取英雄全属性属性
     * @param handle
     * @param includeBonuses
     */
    static getFullProperty(handle: unit, includeBonuses: boolean = true): number {
        let fullProperty = GetHeroStr(handle, includeBonuses)
        fullProperty = fullProperty + GetHeroAgi(handle, includeBonuses)
        fullProperty = fullProperty + GetHeroInt(handle, includeBonuses)
        return fullProperty;
    }

    /**
     * 获取英雄全属性属性 的比例
     * @param handle
     * @param strScale
     * @param agiScale
     * @param intScale
     */
    static getPropertyWithScale(handle: unit, strScale: number = 0, agiScale: number = 0, intScale: number = 0): number {
        let fullProperty = 0;
        if (strScale != 0) {
            fullProperty = fullProperty + (GetHeroStr(handle, true) * strScale)
        }
        if (agiScale != 0) {
            fullProperty = fullProperty + (GetHeroAgi(handle, true) * agiScale)
        }
        if (intScale != 0) {
            fullProperty = fullProperty + (GetHeroInt(handle, true) * intScale)
        }
        return fullProperty;
    }


}