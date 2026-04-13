/**
 * 获取物遍slk数据
 * （注意：通魔的DataB 目标类型未修改的情况下 在slk后 获取值是null）
 */
export default class ObjectDataUtil {

    /**
     * 字符串id列表 转 id字符串数组
     * @param idsStr
     */
    static idsStr2idsArray(idsStr: string) {
        if (idsStr == null || idsStr.length < 4) {
            return [];
        }
        //
        let result = [];
        let idsTemp = idsStr.split(",");
        for (let id of idsTemp) {
            if (id == null) {
                continue
            }
            id = id.trim();
            if (id.length == 4) {
                result.push(id);
            }
        }
        return result;
    }

    /**
     * 获取单位数字数据
     * @param objIdStr
     * @param property
     */
    static getUnitResearches(objIdStr: string): string[] {
        let idsStr = ObjectDataUtil.getUnitDataString(objIdStr, "Researches")
        return ObjectDataUtil.idsStr2idsArray(idsStr);
    }

    /**
     * 获取单位黄金销毁
     * @param objIdStr
     */
    static getUnitGoldCost(objIdStr: string): number {
        return ObjectDataUtil.getUnitDataNumber(objIdStr, "goldcost")
    }

    /**
     * 获取单位 最大生命值
     * @param objIdStr
     */
    static getUnitHP(objIdStr: string): number {
        return ObjectDataUtil.getUnitDataNumber(objIdStr, "HP")
    }

    /**
     * 获取单位 护甲
     * @param objIdStr
     */
    static getUnitDef(objIdStr: string): number {
        return ObjectDataUtil.getUnitDataNumber(objIdStr, "def")
    }

    /**
     * 获取单位 攻击力1
     * @param objIdStr
     */
    static getUnitDmgplus1(objIdStr: string): number {
        return ObjectDataUtil.getUnitDataNumber(objIdStr, "dmgplus1")
    }

    /**
     * 获取单位名字
     * @param objIdStr
     */
    static getUnitName(objIdStr: string): string {
        return ObjectDataUtil.getUnitDataString(objIdStr, "Name")
    }

    /**
     * 获取科技名字
     * @param objIdStr
     */
    static getUpgradeName(objIdStr: string): string {
        return ObjectDataUtil.getUpgradeDataString(objIdStr, "Name")
    }

    /**
     * 获取单位提示
     * @param objIdStr
     */
    static getUnitTip(objIdStr: string): string {
        return ObjectDataUtil.getUnitDataString(objIdStr, "Tip")
    }

    /**
     * 获取单位图标路径
     * @param objIdStr
     */
    static getUnitArt(objIdStr: string): string {
        return ObjectDataUtil.getUnitDataString(objIdStr, "Art")
    }

    /**
     * 获取单位模型
     * @param objIdStr
     */
    static getUnitFile(objIdStr: string): string {
        return ObjectDataUtil.getUnitDataString(objIdStr, "file")
    }

    /**
     * 获取单位扩展提示
     * @param objIdStr
     */
    static getUnitUbertip(objIdStr: string): string {
        return ObjectDataUtil.getUnitDataString(objIdStr, "Ubertip")
    }

    /**
     * 获取单位数字数据
     * @param objIdStr
     * @param property
     */
    static getUnitDataNumber(objIdStr: string, property: string): number {
        return tonumber(ObjectDataUtil.getUnitDataString(objIdStr, property))
    }

    /**
     * 获取单位字符串数据
     * @param objIdStr
     * @param property
     */
    static getUnitDataString<Key extends keyof uobj>(objIdStr: string, property: Key): string {
        let obj = _g_objs.unit[objIdStr];
        return obj?.[property]
    }

    /**
     * 获取物品数字数据
     * @param objIdStr
     * @param property
     */
    static getItemDataNumber<Key extends keyof iobj>(objIdStr: string, property: Key): number {
        return tonumber(ObjectDataUtil.getItemDataString(objIdStr, property))
    }

    /**
     * 获取物品技能列表
     * @param objIdStr
     */
    static getItemAbilList(objIdStr: string): string {
        return ObjectDataUtil.getItemDataString(objIdStr, "abilList");
    }

    /**
     * 获取物品字符串数据
     * @param objIdStr
     * @param property
     */
    static getItemDataString<Key extends keyof iobj>(objIdStr: string, property: Key): string {
        let obj = _g_objs.item[objIdStr];
        return obj[property + "1"] ?? obj[property]
    }

    /**
     * 获取科技字符串数据
     * @param objIdStr
     * @param property
     */
    static getUpgradeDataString<Key extends keyof upobj>(objIdStr: string, property: Key): string {
        let obj = _g_objs.upgrade[objIdStr];
        return obj[property + "1"] ?? obj[property]
    }

    /**
     * 获取技能按钮位置
     * @param objIdStr
     */
    static getAbilityBtnXY(objIdStr: string): Vector {
        let xyStr: string = ObjectDataUtil.getAbilityDataString(objIdStr, "Buttonpos")
        let xyStrs = xyStr.split(",")
        return {x: tonumber(xyStrs[0]), y: tonumber(xyStrs[1])}
    }

    /**
     * 获取技能数字数据
     * @param objIdStr
     * @param property
     */
    static getAbilityDataNumber(objIdStr: string, property: string): number {
        return tonumber(ObjectDataUtil.getAbilityDataString(objIdStr, property))
    }

    /**
     * 获取技能名字
     * @param objIdStr
     */
    static getAbilityName(objIdStr: string): string {
        return ObjectDataUtil.getAbilityDataString(objIdStr, "Name")
    }

    /**
     * 获取技能图标路径
     * @param objIdStr
     */
    static getAbilityArt(objIdStr: string): string {
        return ObjectDataUtil.getAbilityDataString(objIdStr, "Art")
    }

    /**
     * 获取技能字符串数据
     * @param objIdStr
     * @param property
     */
    static getAbilityDataString<Key extends keyof aobj>(objIdStr: string, property: Key): string {
        let obj = _g_objs.ability[objIdStr];
        if (obj == null) {
            log.errorWithTraceBack("没有发现技能物编:" + tostring(objIdStr))
            return null;
        }
        return obj[property + "1"] ?? obj[property]
    }


    /**
     * 获取标准的模型路径
     * @param path
     */
    static getStandardModelPath(path: string): string {
        if (!path) {
            return ''
        }
        const lenght = path.length
        if (lenght < 4) {
            path += ".mdx"
            return path
        }
        const hsw = path.substring(lenght - 4).toLowerCase()
        if (hsw == '.mdl') {
            path = path.substring(0, lenght - 4) + ".mdx"
            return path
        }
        if (hsw != '.mdx') {
            path += ".mdx"
            return path
        }
        return path
    }

}


