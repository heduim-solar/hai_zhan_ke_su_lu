import BaseUtil from "@/BaseUtil";
import DataBase from "@/DataBase";
import MoveType from "@/MoveType";

/**
 * 单位状态值工具
 */
export default class UnitStateUtil {


    /**
     * 最大生命值
     * @param unitHandle
     */
    static getMaxLife(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE)
    }

    /**
     * 设置最大生命值
     * @param unitHandle
     * @param newVal
     */
    static setMaxLife(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_MAX_LIFE, newVal)
    }

    /**
     * 添加最大生命值
     * @param unitHandle
     * @param addVal
     */
    static addMaxLife(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal);
    }

    /**
     * 增加最大生命值与当前生命值
     * @param unitHandle
     */
    static addMaxLifeAndLife(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_LIFE, addVal);
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, addVal);
    }

    /**
     * 是否是活着的单位
     * @param unitHandle
     */
    static isAlive(unitHandle: unit): boolean {
        return UnitAlive(unitHandle)
    }

    /**
     * 生命值
     * @param unitHandle
     */
    static getLife(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_LIFE)
    }

    /**
     * 设置当前生命值
     * @param unitHandle
     * @param newVal
     */
    static setLife(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_LIFE, newVal)
    }

    /**
     * 添加当前生命值 回血
     * @param unitHandle
     * @param addVal
     */
    static addLife(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, addVal);
    }

    /**
     * 增加单位当前生命值 （按最大生命的比例）
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static addUnitLifeByMaxLifeP(unitHandle: unit, proportion: number): void {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_LIFE, GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * proportion);
    }

    /**
     * 最大魔法值
     * @param unitHandle
     */
    static getMaxMana(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MAX_MANA)
    }

    /**
     * 设置最大魔法值
     * @param unitHandle
     * @param newVal
     */
    static setMaxMana(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_MAX_MANA, newVal)
    }

    /**
     * 添加最大魔法值
     * @param unitHandle
     * @param addVal
     */
    static addMaxMana(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal);
    }

    /**
     * 增加最大魔法值与当前魔法值
     * @param unitHandle
     */
    static addMaxManaAndMana(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MAX_MANA, addVal);
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, addVal);
    }

    /**
     * 魔法值
     * @param unitHandle
     */
    static getMana(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MANA)
    }

    /**
     * 设置当前魔法值
     * @param unitHandle
     * @param newVal
     */
    static setMana(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UNIT_STATE_MANA, newVal)
    }

    /**
     * 添加当前魔法值
     * @param unitHandle
     * @param addVal
     */
    static addMana(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, addVal);
    }

    /**
     * 增加单位当前魔法值 （按最大魔法值的比例）
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static addUnitManaByMaxManaP(unitHandle: unit, proportion: number): void {
        UnitStateUtil.addUnitState(unitHandle, UNIT_STATE_MANA, GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) * proportion);
    }

    /**
     *  获取最大伤害
     */
    static getDamageMax(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageMax)
    }

    /**
     *   基础伤害 （白字攻击+英雄主属性奖励的绿字攻击值）
     */
    static getDamageBase(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageBase)
    }

    /**
     *  白字攻击
     */
    static setDamageBase(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateDamageBase, newVal)
    }

    /**
     * 添加白字攻击
     * @param unitHandle
     * @param addVal
     */
    static addDamageBase(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateDamageBase, addVal);
    }

    /**
     *  获取攻击范围
     */
    static getDamageRange(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageRange)
    }

    /**
     * 设置攻击范围
     * @param unitHandle
     * @param newVal
     */
    static setDamageRange(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateDamageRange, newVal)
    }

    /**
     * 添加攻击范围
     * @param unitHandle
     * @param addVal
     */
    static addDamageRange(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateDamageRange, addVal);
    }

    /**
     *  获取攻击间隔
     */
    static getDamageCool(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateDamageCool)
    }

    /**
     * 设置攻击间隔
     * @param unitHandle
     * @param newVal
     */
    static setDamageCool(unitHandle: unit, newVal: number) {
        if (newVal < 0.001) {
            newVal = 0.001
        }
        SetUnitState(unitHandle, UnitStateDamageCool, newVal)
    }

    /**
     *  增加攻击间隔(传入负数可减少攻击间隔 以提高攻击频率)
     */
    static addDamageCool(unitHandle: unit, addVal: number) {
        let newVal = GetUnitState(unitHandle, UnitStateDamageCool) + addVal;
        if (newVal < 0.001) {
            newVal = 0.001
        }
        SetUnitState(unitHandle, UnitStateDamageCool, newVal)
    }

    /**
     *  获取攻击速度  默认为1
     *  (ps: +1 = +100%攻击速度)
     */
    static getAttackSpeed(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateAttackSpeed)
    }

    /**
     * 设置攻击速度
     * @param unitHandle
     * @param newVal
     */
    static setAttackSpeed(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateAttackSpeed, newVal)
    }

    /**
     * 添加攻击速度 1= 100%
     * @param unitHandle
     * @param addVal
     */
    static addAttackSpeed(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateAttackSpeed, addVal);
    }

    /**
     *  获取总护甲
     */
    static getArmor(unitHandle: unit): number {
        return GetUnitState(unitHandle, UnitStateArmor)
    }

    /**
     * 设置总护甲 （修改白字护甲为 总护甲-绿字护甲）
     * @param unitHandle
     * @param newVal
     */
    static setArmor(unitHandle: unit, newVal: number) {
        SetUnitState(unitHandle, UnitStateArmor, newVal)
    }

    /**
     * 添加白字护甲
     * @param unitHandle
     * @param addVal
     */
    static addArmor(unitHandle: unit, addVal: number) {
        UnitStateUtil.addUnitState(unitHandle, UnitStateArmor, addVal);
    }

    /**
     * 添加单位状态值
     * @param unitHandle
     * @param whichUnitState
     * @param addVal
     */
    static addUnitState(unitHandle: unit, whichUnitState: unitstate, addVal: number): number {
        let newVal = GetUnitState(unitHandle, whichUnitState) + addVal;
        SetUnitState(unitHandle, whichUnitState, newVal)
        return newVal;
    }

    /**
     * 获取移动速度
     */
    static getMoveSpeed(unitHandle: unit): number {
        return GetUnitMoveSpeed(unitHandle);

    }

    /**
     * 设置移动速度
     * @param unitHandle
     * @param newSpeed
     */
    static setMoveSpeed(unitHandle: unit, newSpeed: number) {
        SetUnitMoveSpeed(unitHandle, newSpeed);
    }


    /**
     * 添加移动速度
     * @param unitHandle
     * @param addSpeed
     */
    static addMoveSpeed(unitHandle: unit, addSpeed: number): number {
        let newVal = GetUnitMoveSpeed(unitHandle) + addSpeed;
        SetUnitMoveSpeed(unitHandle, newVal)
        return newVal;
    }

    /**
     * 设置移动类型
     * @param unitHandle
     * @param moveType
     */
    static setMoveType(unitHandle: unit, moveType: string) {
        let moveTypeElement = MoveType[moveType];
        EXSetUnitMoveType(unitHandle, moveTypeElement)
        if (SetUnitMoveType == null) {
            return
        }
        if (moveTypeElement == 0x00) {
            SetUnitMoveType(unitHandle, "none");
        } else if (moveTypeElement == 0x01) {
            SetUnitMoveType(unitHandle, "nomove");
        } else if (moveTypeElement == 0x02) {
            SetUnitMoveType(unitHandle, "foot");
        } else if (moveTypeElement == 0x04) {
            SetUnitMoveType(unitHandle, "fly");
        } else if (moveTypeElement == 0x40) {
            SetUnitMoveType(unitHandle, "float");
        } else if (moveTypeElement == 0x08) {
            SetUnitMoveType(unitHandle, "hover");
        } else if (moveTypeElement == 0x80) {
            SetUnitMoveType(unitHandle, "amph");
        } else if (moveTypeElement == 0x20) {
            SetUnitMoveType(unitHandle, "unbuild");
        }
    }

    /**
     * 获取单位当前生命占最大生命的比例
     * p proportion 比例
     * @param unitHandle
     */
    static getUnitLifeP(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_LIFE) / GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE);
    }

    /**
     * 设置单位当前生命占最大生命的比例
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static setUnitLifeP(unitHandle: unit, proportion: number): void {
        return SetUnitState(unitHandle, UNIT_STATE_LIFE, GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * proportion);
    }

    /**
     * 获取单位当前生命占最大生命的比例
     * p proportion 比例
     * @param unitHandle
     */
    static getUnitManaP(unitHandle: unit): number {
        return GetUnitState(unitHandle, UNIT_STATE_MANA) / GetUnitState(unitHandle, UNIT_STATE_MAX_MANA);
    }

    /**
     * 设置单位当前生命占最大魔法的比例
     * p proportion 比例
     * @param unitHandle
     * @param proportion
     */
    static setUnitManaP(unitHandle: unit, proportion: number): void {
        return SetUnitState(unitHandle, UNIT_STATE_MANA, GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) * proportion);
    }

    /**
     * 是否无敌
     * */
    static isInvulnerable(unitHandle: unit) {
        if (GetUnitAbilityLevel(unitHandle, "Avul") > 0) {
            return true;
        }
        return false;
    }

    /**
     * 设置无敌
     * */
    static setInvulnerable(unitHandle: unit, isInvulnerable: boolean) {
        //用这个设置 游戏底层也是添加移除 Avul技能
        SetUnitInvulnerable(unitHandle, isInvulnerable);
    }

    /**
     * 给不是无敌的单位 添加指定持续时间的无敌效果
     * (比如防止给本就是无敌的单位 移除了无敌)
     * */
    static addInvulnerableIfNot(unitHandle: unit, dur: number): boolean {
        if (GetUnitAbilityLevel(unitHandle, "Avul") > 0) {
            return false;
        }
        //用这个设置 游戏底层也是添加移除 Avul技能
        SetUnitInvulnerable(unitHandle, true);
        BaseUtil.runLater(dur, () => {
            SetUnitInvulnerable(unitHandle, false);
        })
    }

    /**
     * 设置单位生命周期 (默认水元素)
     * @param unitHandle
     * @param duration
     * @param buffid
     */

    static applyTimedLife(unitHandle: unit, duration: number, buffid: number | string = 'BHwe') {
        UnitApplyTimedLife(unitHandle, buffid, duration)
    }

    /**
     * 命令巡逻到指定点
     */
    static orderPatrol(unitHandle: unit, x: number, y: number) {
        IssuePointOrder(unitHandle, "patrol", x, y);
    }

    /**
     * 命令攻击到指定点
     */
    static orderAttack(unitHandle: unit, x: number, y: number) {
        IssuePointOrder(unitHandle, "attack", x, y);
    }

    /**
     * 命令攻击到指定单位
     */
    static orderAttackTarget(unitHandle: unit, target: unit) {
        IssueTargetOrder(unitHandle, "attack", target);
    }

    /**
     * 命令移到到指定点
     */
    static orderMove(unitHandle: unit, x: number, y: number) {
        IssuePointOrder(unitHandle, "move", x, y);
    }

    /**
     * 击晕指定单位
     */
    static stunUnit(unitHandle: unit, dur: number, effectPath = "Abilities\\Spells\\Human\\Thunderclap\\ThunderclapTarget.mdx") {
        EXPauseUnit(unitHandle, true);
        let effect = AddSpecialEffectTarget(effectPath, unitHandle, "head");
        BaseUtil.runLater(dur, () => {
            EXPauseUnit(unitHandle, false);
            DestroyEffect(effect);
        })
    }

    /**
     * 启用可以设置飞行高度
     * @param unitHandle
     */
    static enableFlyHeight(unitHandle: unit) {
        UnitAddAbility(unitHandle, FourCC('Amrf'));
        UnitRemoveAbility(unitHandle, FourCC('Amrf'));
    }


    /**
     * 计算单位属性值公式
     */
    static calculateStateFormula(formula: StateFormula, srcUnit: unit, targetUnit?: unit): number {
        if (formula == null) {
            return 0;
        }

        if (formula.chance != null && GetRandomReal(0, 1) > formula.chance) {
            return 0;
        }
        let value = formula.base || 0;

        if (srcUnit != null) {
            if (formula.attack) {
                value += GetUnitState(srcUnit, UnitStateDamageMax) * formula.attack
            }
            if (formula.def) {
                value += GetUnitState(srcUnit, UnitStateArmor) * formula.def
            }
            if (formula.fullPros) {
                value += (GetHeroStr(srcUnit, true) + GetHeroAgi(srcUnit, true) +
                    GetHeroInt(srcUnit, true)) * formula.fullPros
            }
            if (formula.str) {
                value += GetHeroStr(srcUnit, true) * formula.str
            }
            if (formula.agi) {
                value += GetHeroAgi(srcUnit, true) * formula.agi
            }
            if (formula.int) {
                value += GetHeroInt(srcUnit, true) * formula.int
            }
            if (formula.hp) {
                value += GetUnitState(srcUnit, UNIT_STATE_LIFE) * formula.hp
            }
            if (formula.mana) {
                value += GetUnitState(srcUnit, UNIT_STATE_MANA) * formula.mana
            }
            if (formula.maxHp) {
                value += GetUnitState(srcUnit, UNIT_STATE_MAX_LIFE) * formula.maxHp
            }
            if (formula.maxMana) {
                value += GetUnitState(srcUnit, UNIT_STATE_MAX_MANA) * formula.maxMana
            }
            if (formula.loseHp) {
                value += (GetUnitState(srcUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(srcUnit, UNIT_STATE_LIFE)) * formula.loseHp
            }
            if (formula.loseMana) {
                value += (GetUnitState(srcUnit, UNIT_STATE_MAX_MANA) - GetUnitState(srcUnit, UNIT_STATE_MANA)) * formula.loseHp
            }
        }

        //目标单位
        if (targetUnit != null) {
            if (formula.target_attack) {
                value += GetUnitState(targetUnit, UnitStateDamageMax) * formula.target_attack
            }
            if (formula.target_def) {
                value += GetUnitState(targetUnit, UnitStateArmor) * formula.target_def
            }
            if (formula.target_fullPros) {
                value += (GetHeroStr(targetUnit, true) + GetHeroAgi(targetUnit, true) +
                    GetHeroInt(targetUnit, true)) * formula.target_fullPros
            }
            if (formula.target_str) {
                value += GetHeroStr(targetUnit, true) * formula.target_str
            }
            if (formula.target_agi) {
                value += GetHeroAgi(targetUnit, true) * formula.target_agi
            }
            if (formula.target_int) {
                value += GetHeroInt(targetUnit, true) * formula.target_int
            }
            if (formula.target_hp) {
                value += GetUnitState(targetUnit, UNIT_STATE_LIFE) * formula.target_hp
            }
            if (formula.target_mana) {
                value += GetUnitState(targetUnit, UNIT_STATE_MANA) * formula.target_mana
            }
            if (formula.target_maxHp) {
                value += GetUnitState(targetUnit, UNIT_STATE_MAX_LIFE) * formula.target_maxHp
            }
            if (formula.target_maxMana) {
                value += GetUnitState(targetUnit, UNIT_STATE_MAX_MANA) * formula.target_maxMana
            }
            if (formula.target_loseHp) {
                value += (GetUnitState(targetUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(targetUnit, UNIT_STATE_LIFE)) * formula.target_loseHp
            }
            if (formula.target_loseMana) {
                value += (GetUnitState(targetUnit, UNIT_STATE_MAX_MANA) - GetUnitState(targetUnit, UNIT_STATE_MANA)) * formula.target_loseHp
            }
        }

        //玩家相关
        let player = GetOwningPlayer(srcUnit);
        if (IsHandle(player)) {
            if (formula.gold) {
                value += GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) * formula.gold
            }
            if (formula.lumber) {
                value += GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER) * formula.lumber
            }
            if (formula.food) {
                value += GetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_USED) * formula.food
            }
            if (formula.kills) {
                value += (DataBase.getPlayerSolarData(player, false)?.killCount || 0) * formula.kills
            }
        }
        //最终数值增幅
        if (formula.increased) {
            value *= (1 + formula.increased);
        }

        return value;
    }
}