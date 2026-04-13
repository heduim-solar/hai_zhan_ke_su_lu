import {Unit} from "@/w3ts/handles/unit";
import DataBase from "@/common/DataBase";
import MathUtil from "@/MathUtil";
import UnitStateUtil from "@/UnitStateUtil";
import HandleUtil from "@/HandleUtil";
import LangUtil from "@/LangUtil";
import SelectUtil from "@/SelectUtil";
import BaseUtil from "@/BaseUtil";

const BaseAttributeMax = 10000000;
/** @noSelf **/
export default class UnitUtil {

    /**
     * 计算单位的 属性伤害值
     * @param unitHandle
     * @param dmgPropertySet
     * @deprecated see UnitStateUtil.calculateStateFormula
     */
    static calculateDamageByPropertySet(unitHandle: unit, dmgPropertySet: {
        strDamageRate?: number,
        agiDamageRate?: number,
        intDamageRate?: number,
        hpDamageRate?: number,
        manaDamageRate?: number,
    }): number {
        let damage = 0;
        if (dmgPropertySet.strDamageRate) {
            damage = GetHeroStr(unitHandle, true) * dmgPropertySet.strDamageRate + damage;
        }
        if (dmgPropertySet.agiDamageRate) {
            damage = GetHeroAgi(unitHandle, true) * dmgPropertySet.agiDamageRate + damage;
        }
        if (dmgPropertySet.intDamageRate) {
            damage = GetHeroInt(unitHandle, true) * dmgPropertySet.intDamageRate + damage;
        }
        if (dmgPropertySet.hpDamageRate) {
            damage = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * dmgPropertySet.hpDamageRate + damage;
        }
        if (dmgPropertySet.manaDamageRate) {
            damage = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) * dmgPropertySet.manaDamageRate + damage;
        }
        return damage;
    }


    /**
     * 获取物品类型所在物品栏的序号 1-6
     * @param unitHandle
     * @param id
     * @constructor
     */
    static GetInventoryIndexOfItemType(unitHandle: unit, id: string): number {
        let idint = FourCC(id);

        for (let i = 0; i < 6; i++) {
            let indexItem = UnitItemInSlot(unitHandle, i)
            if (IsHandle(indexItem) && GetItemTypeId(indexItem) == idint) {
                return i + 1
            }
        }
        return 0
    }

    /**
     * 获取单位物品栏里的指定物品类型的物品
     * @param unitHandle
     * @param idint
     * @constructor
     */
    static GetInventoryOfItemType(unitHandle: unit, idint: number): item {
        for (let i = 0; i < 6; i++) {
            let indexItem = UnitItemInSlot(unitHandle, i)
            if (IsHandle(indexItem) && GetItemTypeId(indexItem) == idint) {
                return indexItem
            }
        }
        return null
    }


    /**
     * 白字属性
     * 为英雄添加全属性 根据key（如果相同的key则会自动减去之前添加的对应key的值）
     * @param unit
     * @param key
     * @param addNum
     */
    static addHeroProperty(unit: Unit, key: string, addNum: number) {
        if (!unit.isHero()) {
            return
        }
        //力量
        let baseStr = unit.strength;
        if (unit.solarData['UnitUtil_addHeroProperty_strength_' + key]) {
            baseStr = baseStr - unit.solarData['UnitUtil_addHeroProperty_strength_' + key];
        }
        unit.solarData['UnitUtil_addHeroProperty_strength_' + key] = addNum
        unit.strength = baseStr + addNum
        //敏捷
        let baseAgi = unit.agility;
        if (unit.solarData['UnitUtil_addHeroProperty_agility_' + key]) {
            baseAgi = baseAgi - unit.solarData['UnitUtil_addHeroProperty_agility_' + key];
        }
        unit.solarData['UnitUtil_addHeroProperty_agility_' + key] = addNum
        unit.agility = baseAgi + addNum
        //智力
        let baseInt = unit.intelligence;
        if (unit.solarData['UnitUtil_addHeroProperty_intelligence_' + key]) {
            baseInt = baseInt - unit.solarData['UnitUtil_addHeroProperty_intelligence_' + key];
        }
        unit.solarData['UnitUtil_addHeroProperty_intelligence_' + key] = addNum
        unit.intelligence = baseInt + addNum
        //
    }

    /**
     * 白字属性
     * 为英雄按比例添加全属性 根据key（如果相同的key则会自动减去之前添加的对应key的值）
     * @param unit
     * @param key
     * @param addNum
     */
    static addHeroPropertyByRate(unit: Unit, key: string, addRate: number) {
        if (!unit.isHero()) {
            return
        }
        let addNum = 0
        //力量
        let baseStr = unit.strength;
        if (unit.solarData['UnitUtil_addHeroPropertyByRate_strength_' + key]) {
            baseStr = baseStr - unit.solarData['UnitUtil_addHeroPropertyByRate_strength_' + key];
        }
        addNum = baseStr * addRate
        unit.solarData['UnitUtil_addHeroPropertyByRate_strength_' + key] = addNum
        unit.strength = baseStr + addNum
        //敏捷
        let baseAgi = unit.agility;
        if (unit.solarData['UnitUtil_addHeroPropertyByRate_agility_' + key]) {
            baseAgi = baseAgi - unit.solarData['UnitUtil_addHeroPropertyByRate_agility_' + key];
        }
        addNum = baseAgi * addRate
        unit.solarData['UnitUtil_addHeroPropertyByRate_agility_' + key] = addNum
        unit.agility = baseAgi + addNum
        //智力
        let baseInt = unit.intelligence;
        if (unit.solarData['UnitUtil_addHeroPropertyByRate_intelligence_' + key]) {
            baseInt = baseInt - unit.solarData['UnitUtil_addHeroPropertyByRate_intelligence_' + key];
        }
        addNum = baseInt * addRate
        unit.solarData['UnitUtil_addHeroPropertyByRate_intelligence_' + key] = addNum
        unit.intelligence = baseInt + addNum
        //
    }

    /**
     *
     * @param unitHandle 单位
     * @param rect 传送到的区域
     * @param faceNearestEnemy
     * @param effectPath 目标点特效
     */
    static transfer2Rect(unitHandle: unit, rect: rect, faceNearestEnemy = true, effectPath = "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdx") {
        UnitUtil.transfer(unitHandle, GetRectCenterX(rect), GetRectCenterY(rect), faceNearestEnemy, effectPath)
    }

    /**
     *
     * @param unitHandle 单位
     * @param x 传送到位置x
     * @param y 传送到位置y
     * @param faceNearestEnemy
     * @param effectPath 目标点特效
     */
    static transfer(unitHandle: unit, x: number, y: number, faceNearestEnemy = true, effectPath = "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdx") {

        BaseUtil.runLater(0.01, () => {
            // IssueImmediateOrder(unitHandle, "stop")
            SetUnitPosition(unitHandle, x, y);
            PanCameraToTimedForPlayer(GetOwningPlayer(unitHandle), x, y, 0.1)
            DestroyEffect(AddSpecialEffect(effectPath, x, y))  //移动单位
            if (faceNearestEnemy) {
                UnitUtil.faceNearestEnemy(unitHandle);
            }

        });
    }

    /**
     * 面向最近的敌人
     */
    static faceNearestEnemy(unitHandle: unit, maxRange: number = 2000): unit {
        let nearestEnemy = SelectUtil.getNearestEnemyInRange(unitHandle, maxRange);
        if (!IsHandle(nearestEnemy)) {
            return nearestEnemy
        }
        let angle = MathUtil.angleBetweenCoords(GetUnitX(unitHandle), GetUnitY(unitHandle), GetUnitX(nearestEnemy), GetUnitY(nearestEnemy));
        SetUnitFacing(unitHandle, angle);
        return nearestEnemy;
    }


    /**
     * 发布停止命令
     * @param unitHandle
     */
    static order_stop(unitHandle: unit) {
        IssueImmediateOrder(unitHandle, "stop")
    }


    /**
     * 单位的类型是英雄单位
     */
    static isHero(unitHandle: unit) {
        return IsHeroUnitId(GetUnitTypeId(unitHandle))
    }

    /**
     * 单位的类型是指定类型
     */
    static isType(unitType: string | number, unitHandle: unit) {
        return GetUnitTypeId(unitHandle) == LangUtil.getIntId(unitType);
    }

    /**
     * 单位的类型是建筑
     */
    static isStructure(unitHandle: unit) {
        return IsUnitType(unitHandle, UNIT_TYPE_STRUCTURE);
    }

    /**
     * 单位的类型是镜像(召唤单位)
     */
    static isSummoned(unitHandle: unit) {
        return IsUnitType(unitHandle, UNIT_TYPE_SUMMONED);
    }

    /**
     * 是中立敌对单位
     */
    static isNeutralAggressive(unitHandle: unit) {
        return GetPlayerId(GetOwningPlayer(unitHandle)) == PLAYER_NEUTRAL_AGGRESSIVE;
    }

    /**
     * 是中立被动单位
     */
    static isNeutralPassive(unitHandle: unit) {
        return GetPlayerId(GetOwningPlayer(unitHandle)) == PLAYER_NEUTRAL_PASSIVE;
    }

    /**
     * 创建单位
     * @param player
     * @param unitTypeId
     * @param x
     * @param y
     * @param face
     * @param count 创建数量 默认为1
     * 返回最后一个创建的演员单位
     */
    static createUnit(player: player, unitTypeId: string, x: number, y: number, face: number = 0, count: number = 1): unit {
        let unit = null;
        for (let i = 0; i < count; i++) {
            unit = CreateUnit(player, unitTypeId, x, y, face)
        }
        return unit
    }

    /**
     * @brief 检测是不是在背后（如是否背后攻击）
     * @param attackedUnit 被攻击单位
     * @param attacker 攻击单位
     * @returns 背后攻击返回true,反之返回false
     */
    static isBack(attackedUnit: unit, attacker: unit): boolean {
        let targetLoc = GetUnitLoc(attackedUnit);
        let triggerLoc = GetUnitLoc(attacker);
        let angle: number = AngleBetweenPoints(triggerLoc, targetLoc);
        let facing: number = GetUnitFacing(attackedUnit);
        RemoveLocation(targetLoc);
        RemoveLocation(triggerLoc);
        if (angle <= 0.00) {
            angle += 360.00;
        }
        if (facing < 90.00) {
            return (angle >= 360.00 - (facing - 90.00) && angle <= 360.00) || (angle >= 0.00 && angle <= facing + 90.00);
        } else {
            if (facing > 270.00) {
                return (angle >= facing - 90.00 && angle <= 360.00) || (angle >= 0.00 && angle <= (facing + 90.00) - 360.00);
            } else {
                return angle >= facing - 90.00 && angle <= facing + 90.00;
            }
        }
    }

    /**
     *设置附加魔法值
     */
    static setExtraMana(unitHandle: unit, val: number, key: string = "base") {
        let nowValue = GetUnitState(unitHandle, UNIT_STATE_MANA)
        let maxValue = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA)//可能为0
        let bfp = 1;
        if (maxValue > 0) {
            bfp = nowValue / maxValue;
        }
        let oldExtra = UnitUtil.getExtraMana(unitHandle);
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Mana', val, key);
        let add = val - oldExtra
        maxValue += add;
        nowValue = bfp * maxValue;
        SetUnitState(unitHandle, UNIT_STATE_MAX_MANA, maxValue)
        SetUnitState(unitHandle, UNIT_STATE_MANA, nowValue)
    }

    static getExtraMana(unitHandle: unit, key?: string): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Mana', key);
    }

    /**
     *设置附加生命值
     */
    static setExtraHp(unitHandle: unit, val: number, key: string = "base") {
        let nowValue = GetUnitState(unitHandle, UNIT_STATE_LIFE)
        let maxValue = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE)
        let bfp = nowValue / maxValue;
        let oldExtra = UnitUtil.getExtraHp(unitHandle);
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Hp', val, key);
        let add = val - oldExtra
        maxValue += add;
        nowValue = bfp * maxValue;
        SetUnitState(unitHandle, UNIT_STATE_MAX_LIFE, maxValue)
        SetUnitState(unitHandle, UNIT_STATE_LIFE, nowValue)
    }

    static getExtraHp(unitHandle: unit, key?: string): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Hp', key);
    }

    /**
     *设置附加的攻击间隔 负数为减少攻击间隔
     */
    static setExtraDamageCool(unitHandle: unit, val: number, key: string = "base") {
        let oldExtra = UnitUtil.getExtraValue(unitHandle, '_SLExt_DamageCool');
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_DamageCool', val, key);
        let add = val - oldExtra
        UnitStateUtil.addDamageCool(unitHandle, add)
    }

    /**
     *设置附加的攻击范围
     */
    static setExtraDamageRange(unitHandle: unit, val: number, key: string = "base") {
        let oldExtra = UnitUtil.getExtraValue(unitHandle, '_SLExt_DamageRange');
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_DamageRange', val, key);
        let add = val - oldExtra
        UnitStateUtil.addDamageRange(unitHandle, add)
    }

    /**
     *设置附加的移动速度
     */
    static setExtraMoveSpeed(unitHandle: unit, val: number, key: string = "base") {
        let oldExtra = UnitUtil.getExtraValue(unitHandle, '_SLExt_MoveSpeed');
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_MoveSpeed', val, key);
        let add = val - oldExtra;
        let solarData = DataBase.getUnitSolarData(unitHandle);
        let _sl_logical_MoveSpeed = (solarData._sl_logical_MoveSpeed || UnitStateUtil.getMoveSpeed(unitHandle)) + add;
        SetUnitMoveSpeed(unitHandle, _sl_logical_MoveSpeed)
        solarData._sl_logical_MoveSpeed = _sl_logical_MoveSpeed;
    }

    /**
     *设置攻击速度 0.5 = 50%
     */
    static setExtraAttackSpd(unitHandle: unit, val: number, key: string = "base") {
        //AIs2 = 能提高进攻速度的物品
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_AttackSpd', val, key);
        if (val == 0) {
            UnitRemoveAbility(unitHandle, FourCC("AIs2"))
        } else {
            UnitUtil.refreshUnitAbilityData(unitHandle, FourCC("AIs2"), ABILITY_DATA_DATA_A, val)
        }

    }

    /**
     * 注意：只获取由 setExtraAttack  设置的值
     * @param unitHandle
     */
    static getExtraAttackSpd(unitHandle: unit): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_AttackSpd');
    }

    /**
     *设置附加攻击 (即绿字攻击力)
     */
    static setExtraAttack(unitHandle: unit, val: number, key: string = "base") {
        //AItg = 攻击之爪+1
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Attack', val, key);
        if (isBigAttributeMode) {
            val = MathUtil.min(val, BaseAttributeMax);
        }
        UnitUtil.refreshUnitAbilityData(unitHandle, FourCC("AItg"), 108, val)
    }

    /**
     * 注意：只获取由 setExtraAttack  设置的值
     * @param unitHandle
     */
    static getExtraAttack(unitHandle: unit): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Attack');
    }

    /**
     *设置附加护甲 (即绿字护甲)
     */
    static setExtraDef(unitHandle: unit, val: number, key: string = "base") {
        //AId1 = 能提高护甲的物品(1)
        val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Def', val, key);
        if (isBigAttributeMode) {
            //1e
            val = MathUtil.min(val, BaseAttributeMax);
        }
        if (val == 0) {
            UnitRemoveAbility(unitHandle, FourCC("AId1"))
        } else {
            UnitUtil.refreshUnitAbilityData(unitHandle, FourCC("AId1"), 108, val)
        }
    }

    /**
     * 注意：只获取由 setExtraDef  设置的值
     * @param unitHandle
     */
    static getExtraDef(unitHandle: unit, key?: string): number {
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Def', key);
    }

    /**
     * 同时设置3维属性
     * @param unitHandle
     * @param val
     * @param key
     */
    static setExtraStrAgiInt(unitHandle: unit, key: string, str: number, agi: number, int: number) {
        let str_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Str', str, key);
        let agi_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Agi', agi, key);
        let int_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Int', int, key);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val);
    }

    /**
     *设置附加力量 (即绿字力量)
     */
    static setExtraStr(unitHandle: unit, val: number, key: string = "base") {
        let str_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Str', val, key);
        let agi_val = UnitUtil.getExtraAgi(unitHandle);
        let int_val = UnitUtil.getExtraInt(unitHandle);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val)
    }

    /**
     * 注意：只获取由 setExtraStr  设置的值
     * @param unitHandle
     */
    static getExtraStr(unitHandle: unit, key?: string): number {
        if (key) {
            return UnitUtil.getExtraValue(unitHandle, '_SLExt_Str', key);
        }
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Str');
    }

    /**
     *设置附加敏捷 (即绿字敏捷)
     */
    static setExtraAgi(unitHandle: unit, val: number, key: string = "base") {
        let str_val = UnitUtil.getExtraStr(unitHandle);
        let agi_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Agi', val, key);
        let int_val = UnitUtil.getExtraInt(unitHandle);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val)
    }

    /**
     * 注意：只获取由 setExtraAgi  设置的值
     * @param unitHandle
     */
    static getExtraAgi(unitHandle: unit, key?: string): number {
        if (key) {
            return UnitUtil.getExtraValue(unitHandle, '_SLExt_Agi', key);
        }
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Agi');
    }

    /**
     *设置附加智力 (即绿字智力)
     */
    static setExtraInt(unitHandle: unit, val: number, key: string = "base") {
        let str_val = UnitUtil.getExtraStr(unitHandle);
        let agi_val = UnitUtil.getExtraAgi(unitHandle);
        let int_val = UnitUtil.extraValueSum(unitHandle, '_SLExt_Int', val, key);
        UnitUtil.refreshUnitAamkData(unitHandle, str_val, agi_val, int_val)
    }

    /**
     * 注意：只获取由 setExtraInt  设置的值
     * @param unitHandle
     */
    static getExtraInt(unitHandle: unit, key?: string): number {
        if (key) {
            return UnitUtil.getExtraValue(unitHandle, '_SLExt_Int', key);
        }
        return UnitUtil.getExtraValue(unitHandle, '_SLExt_Int');
    }


    /**
     * 获取扩展属性 (即绿字)
     * type = 扩展的属性类型 (如 攻击力/力量/暴击率等等)
     * 返回这个type类型的总和
     * @param unitHandle
     * @param type
     * @param val
     * @param key
     */
    static extraValueSum(unitHandle: unit, type: string, val: number, key: string = "base"): number {
        let solarData = DataBase.getUnitSolarData(unitHandle);
        let extraData: { [key: string]: number } = solarData[type];
        if (val) {
            if (!extraData) {
                extraData = {};
                solarData[type] = extraData
            }
            extraData[key] = val;
        }
        let count = MathUtil.sum(extraData);
        return count;
    }

    /**
     * 获取单位扩展值
     * @param unitHandle
     * @param type
     * @param key 不传key 则返回此type类型的所有key值的合计值
     */
    static getExtraValue(unitHandle: unit, type: string, key?: string): number {
        let solarData = DataBase.getUnitSolarData(unitHandle, false);
        if (!solarData) {
            return 0;
        }
        let extraData: { [key: string]: number } = solarData[type];
        if (key) {
            return extraData?.[key] ?? 0;
        }
        return MathUtil.sum(extraData);
    }


    /**
     * 刷新 单位技能的 数据值
     * 如果单位没有当前技能则会自动添加
     * @param unitHandle
     * @param abilcode
     * @param data_type
     * @param value
     */
    static refreshUnitAbilityData(unitHandle: unit, abilcode: number, data_type: number, value: number) {
        //开发环境 校验一下handle类型 以提前告知地图发生了 地图脚本使用了 错误的重用handle
        if (isDebug && !HandleUtil.isUnitHandle(unitHandle)) {
            print_r(handledef(unitHandle));
            log.errorWithTraceBack("你传的单位handle 有误。可能已被其它类型的handle对象重用")
            return
        }

        if (GetUnitAbilityLevel(unitHandle, abilcode) <= 0) {
            UnitAddAbility(unitHandle, abilcode)
        }
        let ability = EXGetUnitAbility(unitHandle, abilcode)
        IncUnitAbilityLevel(unitHandle, abilcode)
        EXSetAbilityDataReal(ability, 1, data_type, value)
        DecUnitAbilityLevel(unitHandle, abilcode)
    }

    /**
     * 刷新单位属性附加的数值
     * (PS:这个技能超过1kw的属性附加绿字 会导致敏捷英雄白字攻击增长。超过1kw可走太阳大数值兼容模式)
     * @param unitHandle
     * @param str
     * @param agi
     * @param int
     */
    private static refreshUnitAamkData(unitHandle: unit, str: number, agi: number, int: number) {
        if (!IsHandle(unitHandle)) {
            return;
        }
        if (GetWidgetLife(unitHandle) < 0.4) {
            return;
        }
        if (!IsHeroUnitId(GetUnitTypeId(unitHandle))) {
            return;
        }
        let abilcode = FourCC("Aamk")
        if (GetUnitAbilityLevel(unitHandle, abilcode) <= 0) {
            UnitAddAbility(unitHandle, abilcode)
            let ability = EXGetUnitAbility(unitHandle, abilcode)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_D, 1)//dataD 隐藏图标
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, 0)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 0)
        }
        let ability = EXGetUnitAbility(unitHandle, abilcode)
        IncUnitAbilityLevel(unitHandle, abilcode)

        if (isBigAttributeMode) {
            //10e
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, MathUtil.min(agi, BaseAttributeMax));
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, MathUtil.min(int, BaseAttributeMax));
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, MathUtil.min(str, BaseAttributeMax));
            //力量奖励生命值
            if (StrHpBonus > 0 && str > BaseAttributeMax) {
                UnitUtil.setExtraHp(unitHandle, (str - BaseAttributeMax) * StrHpBonus, "_SL_refreshUnitAamkData") //将没有走原生力量的 力量 手动转换到生命值上去
            }
            //敏捷在获取护甲处计算
            //智力奖励魔法
            if (IntManaBonus > 0 && int > BaseAttributeMax) {
                UnitUtil.setExtraMana(unitHandle, (int - BaseAttributeMax) * IntManaBonus, "_SL_refreshUnitAamkData") //将没有走原生智力的 智力 手动转换到魔法值上去
            }


        } else {
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, agi)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, int)
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, str)
        }
        DecUnitAbilityLevel(unitHandle, abilcode)
    }
}
