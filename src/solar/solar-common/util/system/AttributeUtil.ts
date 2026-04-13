import DataBase from "@/common/DataBase";
import HandleUtil from "@/HandleUtil";
import UnitUtil from "@/UnitUtil";
import PlayerUtil from "@/PlayerUtil";

/**
 * 属性与SolarData的区别为:
 * 属性(Attribute)本质也是存放在SolarData里 属性主要额外提供了可在单位携带物品或buff等时会自动计算总属性值。
 * 通常与战斗相关的伤害词条或携带物品、buff等需要叠加到单位身上的可选择存放在属性里
 *
 * 其他不需要叠加到单位的值可存在SolarData 如玩家杀敌数 单位伤害总计 英雄的职业 物品的归类
 */
export default class AttributeUtil {

    static keyNameMap = {
        attack: "攻击",
        attack_p: "攻击增幅",
        life: "生命",
        life_p: "生命增幅",
        mana: "魔法",
        mana_p: "魔法增幅",
        def: "护甲",
        def_p: "护甲增幅",
        full_property: "全属性",
        full_property_p: "全属性增幅",
        strength: "力量",
        strength_p: "力量增幅",
        agility: "敏捷",
        agility_p: "敏捷增幅",
        intelligence: "智力",
        intelligence_p: "智力增幅",
        attackSpd_p: "攻击速度",
        move_speed: "移动速度",
        damage_cool: "攻击间隔",
        damage_range: "攻击范围",
        attack_damage_increased: "攻击增伤",
        physical_damage_increased: "物理增伤",
        magic_damage_increased: "法术增伤",
        physical_critical_chance: "物理暴击几率",
        physical_critical_damage: "物理暴击伤害",
        magic_critical_chance: "法术暴击几率",
        magic_critical_damage: "法术暴击伤害",
        damage_increased: "全伤害增幅",
        damage_reduction: "伤害减免",
        blood_sucking: "伤害吸血"
    }

    /**
     * 获取属性
     * 如果属性为空则返回null
     * (取值时可使用?.安全访问 与??使用默认值)
     * @param unitHandle
     * @param createDefault 是否在属性对象对象为空时默认创建一个属性对象对象
     */
    static getUnitAttribute(unitHandle: unit, createDefault = false): AppAttribute | null {
        if (isDebug && createDefault && !UnitUtil.isHero(unitHandle)) {
            if (!UnitAlive(unitHandle) || !HandleUtil.isUnitHandle(unitHandle)) {
                log.errorWithTraceBack("警告：你正在给一个死亡的单位创建属性: " + GetUnitName(unitHandle) + " 如果只是查询数据请将createDefault参数传false")
            }
        }
        let solarData = db.getUnitSolarData(unitHandle, createDefault);
        if (createDefault && !solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }
        return solarData?._SL_solarAttribute;
    }

    /**
     * 获取单位类型的属性
     * 如果属性为空则返回null
     * (取值时可使用?.安全访问 与??使用默认值)
     * @param unitTypeId
     * @param createDefault 是否在属性对象对象为空时默认创建一个属性对象对象
     */
    static getUnitTypeAttribute(unitTypeId: string, createDefault = false): AppAttribute | null {
        let solarData = db.getUnitTypeSolarData(unitTypeId, createDefault);
        if (createDefault && !solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }
        return solarData?._SL_solarAttribute;
    }

    /**
     * 添加单位属性
     * @param playerHandle
     * @param addAttribute
     */
    static addUnitAttribute(unitHandle: unit, addAttribute: AppAttribute): void {
        if (!addAttribute) {
            return;
        }
        let baseAttribute = AttributeUtil.getUnitAttribute(unitHandle, true);
        for (let key in addAttribute) {
            if (typeof addAttribute[key] == "number") {
                baseAttribute[key] = (baseAttribute[key] as number ?? 0) + (addAttribute[key] as number)
            } else if (baseAttribute[key] == null) {
                baseAttribute[key] = addAttribute[key]
            } else {
                print("未覆盖单位旧属性值:" + key)
            }
        }
    }

    /**
     * 获取物品的属性
     * @param itemHandle
     * @param createDefault 是否在属性对象对象为空时默认创建一个属性对象对象
     */
    static getItemAttribute(itemHandle: item, createDefault = false): AppAttribute | null {
        let solarData = db.getItemSolarData(itemHandle, createDefault);
        if (createDefault && !solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }
        return solarData?._SL_solarAttribute;
    }

    /**
     * 获取物品类型的属性
     * @param itemTypeId
     * @param createDefault 是否在属性对象对象为空时默认创建一个属性对象对象
     */
    static getItemTypeAttribute(itemTypeId: string, createDefault = false): AppAttribute | null {
        let solarData = db.getItemTypeSolarData(itemTypeId, createDefault);
        if (createDefault && !solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }
        return solarData?._SL_solarAttribute;
    }

    /**
     * 设置物品类型的属性
     * @param itemTypeId 既可以为真实物编id 也可以为模拟的物品id
     * @param attribute
     * @param allowCover 通常为false 除非你确定你自己在干嘛
     */
    static setItemTypeAttribute(itemTypeId: string, attribute: AppAttribute, allowCover = false): AppAttribute {
        let solarData = db.getItemTypeSolarData(itemTypeId);
        let oldAttribute = solarData._SL_solarAttribute;
        if (oldAttribute && !allowCover) {
            log.errorWithTraceBack("此物品类型已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" + itemTypeId)
            return oldAttribute;
        }
        solarData._SL_solarAttribute = attribute;
        return oldAttribute;
    }

    /**
     * 获取玩家属性
     * @param playerHandle
     * @param createDefault
     */
    static getPlayerAttribute(playerHandle: player, createDefault = false): AppPlayerAttribute | null {
        let solarData = db.getPlayerSolarData(playerHandle, createDefault);
        if (createDefault && !solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }
        return solarData?._SL_solarAttribute;
    }

    /**
     * 添加玩家属性
     * @param playerHandle
     * @param addAttribute
     */
    static addPlayerAttribute(playerHandle: player, addAttribute: AppAttribute): void {
        if (!addAttribute) {
            return;
        }
        let basePlayerAttribute = AttributeUtil.getPlayerAttribute(playerHandle, true);
        for (let key in addAttribute) {
            if (typeof addAttribute[key] == "number") {
                basePlayerAttribute[key] = (basePlayerAttribute[key] as number ?? 0) + (addAttribute[key] as number)
            } else if (basePlayerAttribute[key] == null) {
                basePlayerAttribute[key] = addAttribute[key]
            } else {
                print("未覆盖玩家旧属性值:" + key)
            }
        }
    }


    /**
     * 设置所有属性
     * @param playerHandle
     * @param attribute
     * @param allowCover = 允许覆盖旧的属性 (不确定的时候不要覆盖旧属性 以免引起属性增减出错)
     */
    static setPlayerAttribute(playerHandle: player, attribute: AppAttribute, allowCover = false): AppPlayerAttribute {
        let solarData = db.getPlayerSolarData(playerHandle);
        let oldAttribute = solarData._SL_solarAttribute;
        if (oldAttribute && !allowCover) {
            log.errorWithTraceBack("此玩家已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" + GetPlayerId(playerHandle))
            return oldAttribute;
        }
        solarData._SL_solarAttribute = attribute;
        return oldAttribute;
    }

    /**
     * 设置单位所有属性
     * @param unitHandle
     * @param attribute
     * @param allowCover 是否允许覆盖 若为false时 则不能为一个已有属性的单位重新设置全部属性  通常为false 除非你确定你自己在干嘛
     */
    static setUnitAttribute(unitHandle: unit, attribute: AppAttribute, allowCover = false): AppAttribute {
        let unitSolarData = db.getUnitSolarData(unitHandle);
        let oldAttribute = unitSolarData._SL_solarAttribute;
        if (oldAttribute && !allowCover) {
            log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" + GetUnitName(unitHandle))
            return oldAttribute;
        }
        unitSolarData._SL_solarAttribute = attribute;
        return oldAttribute;
    }

    /**
     * 设置单位类型所有属性
     * @param unitTypeId
     * @param attribute
     * @param allowCover 是否允许覆盖 若为false时 则不能为一个已有属性的单位重新设置全部属性  通常为false 除非你确定你自己在干嘛
     */
    static setUnitTypeAttribute(unitTypeId: string, attribute: AppAttribute, allowCover = false): AppAttribute {
        let solarData = db.getUnitTypeSolarData(unitTypeId, true);
        let oldAttribute = solarData._SL_solarAttribute;
        if (oldAttribute && !allowCover) {
            log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" + unitTypeId)
            return oldAttribute;
        }
        solarData._SL_solarAttribute = attribute;
        return oldAttribute;
    }

    /**
     * 设置物品所有属性
     * @param itemHandle
     * @param attribute
     * @param allowCover
     */
    static setItemAttribute(itemHandle: item, attribute: AppAttribute, allowCover = false): AppAttribute {
        let solarData = db.getItemSolarData(itemHandle);
        let oldAttribute = solarData._SL_solarAttribute;
        if (oldAttribute && !allowCover) {
            log.errorWithTraceBack("此物品已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" + GetItemName(itemHandle))
            return oldAttribute;
        }
        solarData._SL_solarAttribute = attribute;
        return oldAttribute;
    }

    /**
     * 循环地图上 所有有属性的单位
     */
    static forAllUnitsAttribute(callback: (unitHandle: unit, attribute: AppAttribute) => void): void {
        DataBase.forUnitSolarDatas((u, solarData) => {
            let solarAttribute = solarData?._SL_solarAttribute;
            if (solarAttribute) {
                callback(u, solarAttribute)
            }
        });
    }

    /**
     * 循环所有玩家属性
     */
    static forAllPlayerAttribute(callback: (player: player, playerAttribute: AppPlayerAttribute) => void): void {
        PlayerUtil.forPlayingPlayers(player => {
            let playerAttribute = AttributeUtil.getPlayerAttribute(player, false);
            if (playerAttribute) {
                callback(player, playerAttribute)
            }
        });
    }

    /**
     * 统计属性集合的总值属性集合
     * @param attributes
     */
    static sumAttributes(attributes: SolarAttribute[]): AppAttribute {
        let result: SolarAttribute = {}
        if (attributes == null) {
            return result
        }
        for (let attribute of attributes) {
            for (let key in attribute) {
                if (typeof attribute[key] != "number") {
                    continue
                }
                if (!result[key]) {
                    result[key] = 0
                }
                result[key] = (result[key] as number) + (attribute[key] as number)
            }

        }
        return result;
    }

    /**
     *  属性对象相加
     *  attribute1 + attribute2
     */
    static add(attribute: SolarAttribute, _attribute: SolarAttribute): void {
        if (!_attribute) {
            return
        }
        for (let key in _attribute) {
            if (typeof _attribute[key] == "number") {
                attribute[key] = (attribute[key] as number ?? 0) + (_attribute[key] as number)
            }
        }
    }

    /**
     *  属性对象相减
     *  attribute1 - attribute2
     */
    static subtract(attribute: SolarAttribute, _attribute: SolarAttribute): void {
        if (!_attribute) {
            return
        }
        for (let key in _attribute) {
            if (typeof _attribute[key] == "number") {
                attribute[key] = (attribute[key] as number ?? 0) - (_attribute[key] as number)
            }
        }
    }

    /**
     *  属性对象缩放
     *  attribute * scale
     */
    static multiply(attribute: SolarAttribute, scale: number, store?: SolarAttribute): AppAttribute {
        if (!attribute) {
            return
        }
        if (scale == 0) {
            return {}
        }
        if (store == null) {
            store = {...attribute}
        }
        for (let key in attribute) {
            if (typeof attribute[key] == "number") {
                store[key] = (attribute[key] as number ?? 0) * scale;
            }
        }
        return store;
    }

    /**
     *  属性值是否相等
     */
    static isEquals(attribute: SolarAttribute, otherAttribute?: SolarAttribute): boolean {
        if (attribute == otherAttribute) {
            return true;
        }
        if (attribute == null || otherAttribute == null) {
            return false;
        }
        let keys1: string[] = Object.keys(attribute);
        let keys2: string[] = Object.keys(otherAttribute);
        if (keys1.length != keys2.length) {
            return false;
        }
        for (let key of keys1) {
            if (attribute[key] != otherAttribute[key]) {
                return false;
            }
        }
        return true;
    }


    /**
     * addons
     */

    /**
     * 获取 技能cd 比例 -0.1为降低10%冷却时间
     * (比如某个装备会减少某个技能的cd)
     * @param unitHandle
     * @param abilityIdStr
     */
    static getAbilityCDP(unitHandle: unit, abilityIdStr: string): number {
        let attribute = AttributeUtil.getUnitAttribute(unitHandle, false);
        return (attribute?.["ability_cd_p_" + abilityIdStr] as number) || 0
    }

    /**
     * 设置技能cd 比例
     * @param unitHandle
     * @param abilityIdStr
     * @param val
     */
    static setAbilityCDP(unitHandle: unit, abilityIdStr: string, val: number): void {
        let attribute = AttributeUtil.getUnitAttribute(unitHandle, true);
        attribute["ability_cd_p_" + abilityIdStr] = val;
    }

    /**
     * 增加技能cd 比例
     * @param unitHandle
     * @param abilityIdStr
     * @param val
     */
    static addAbilityCDP(unitHandle: unit, abilityIdStr: string, val: number): void {
        let attribute = AttributeUtil.getUnitAttribute(unitHandle, true);
        let key = "ability_cd_p_" + abilityIdStr;
        attribute[key] = (attribute[key] as number || 0) + val;
    }

    /**
     * 获取 技能cd 附加(单位秒) -0.1为降低 0.1秒 冷却时间
     * (比如某个装备会减少某个技能的cd)
     * @param unitHandle
     * @param abilityIdStr
     */
    static getAbilityCD(unitHandle: unit, abilityIdStr: string): number {
        let attribute = AttributeUtil.getUnitAttribute(unitHandle, false);
        return (attribute?.["ability_cd_" + abilityIdStr] as number) || 0
    }

    /**
     * 设置技能cd 附加 -0.1为降低 0.1秒 冷却时间
     * @param unitHandle
     * @param abilityIdStr
     * @param val
     */
    static setAbilityCD(unitHandle: unit, abilityIdStr: string, val: number): void {
        let attribute = AttributeUtil.getUnitAttribute(unitHandle, true);
        attribute["ability_cd_" + abilityIdStr] = val;
    }

    /**
     * 增加技能cd 附加
     * @param unitHandle
     * @param abilityIdStr
     * @param val
     */
    static addAbilityCD(unitHandle: unit, abilityIdStr: string, val: number): void {
        let attribute = AttributeUtil.getUnitAttribute(unitHandle, true);
        let key = "ability_cd_" + abilityIdStr;
        attribute[key] = (attribute[key] as number || 0) + val;
    }

}