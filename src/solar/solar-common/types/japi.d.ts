/** @noSelfInFile */

/**
 * ydwe constant
 */
declare var ABILITY_STATE_COOLDOWN

declare var ABILITY_DATA_TARGS: number // integer
declare var ABILITY_DATA_CAST: number // real
declare var ABILITY_DATA_DUR: number // real
declare var ABILITY_DATA_HERODUR: number // real
declare var ABILITY_DATA_COST: number // integer
declare var ABILITY_DATA_COOL: number // real
declare var ABILITY_DATA_AREA: number // real
declare var ABILITY_DATA_RNG: number // real
declare var ABILITY_DATA_DATA_A: number // real 108
declare var ABILITY_DATA_DATA_B: number // real 109
declare var ABILITY_DATA_DATA_C: number // real 110
declare var ABILITY_DATA_DATA_D: number // real 111
declare var ABILITY_DATA_DATA_E: number // real 112
declare var ABILITY_DATA_DATA_F: number // real 113
declare var ABILITY_DATA_DATA_G: number // real
declare var ABILITY_DATA_DATA_H: number // real
declare var ABILITY_DATA_DATA_I: number // real
declare var ABILITY_DATA_UNITID: number // integer

declare var ABILITY_DATA_HOTKET: number // integer
declare var ABILITY_DATA_UNHOTKET: number // integer
declare var ABILITY_DATA_RESEARCH_HOTKEY: number // integer
declare var ABILITY_DATA_NAME: number // string
declare var ABILITY_DATA_ART: number // string
declare var ABILITY_DATA_TARGET_ART: number // string
declare var ABILITY_DATA_CASTER_ART: number // string
declare var ABILITY_DATA_EFFECT_ART: number // string
declare var ABILITY_DATA_AREAEFFECT_ART: number // string
declare var ABILITY_DATA_MISSILE_ART: number // string
declare var ABILITY_DATA_SPECIAL_ART: number // string
declare var ABILITY_DATA_LIGHTNING_EFFECT: number // string
declare var ABILITY_DATA_BUFF_TIP: number // string
declare var ABILITY_DATA_BUFF_UBERTIP: number // string
declare var ABILITY_DATA_RESEARCH_TIP: number // string
declare var ABILITY_DATA_TIP: number // string
declare var ABILITY_DATA_UNTIP: number // string
declare var ABILITY_DATA_RESEARCH_UBERTIP: number // string
declare var ABILITY_DATA_UBERTIP: number // string
declare var ABILITY_DATA_UNUBERTIP: number // string
declare var ABILITY_DATA_UNART: number // string

//EVENT_DAMAGE_DATA
declare var EVENT_DAMAGE_DATA_VAILD: number
declare var EVENT_DAMAGE_DATA_IS_PHYSICAL: number
declare var EVENT_DAMAGE_DATA_IS_ATTACK: number
declare var EVENT_DAMAGE_DATA_IS_RANGED: number
declare var EVENT_DAMAGE_DATA_DAMAGE_TYPE: number
declare var EVENT_DAMAGE_DATA_WEAPON_TYPE: number
declare var EVENT_DAMAGE_DATA_ATTACK_TYPE: number

//
/**骰子数量*/
declare var UnitStateDamageDice: unitstate
/**骰子面数*/
declare var UnitStateDamageSide: unitstate
/**基础伤害 （白字攻击+英雄主属性奖励的绿字攻击值）*/
declare var UnitStateDamageBase: unitstate
/**附加伤害*/
declare var UnitStateDamageBonus: unitstate
/**攻击最小值*/
declare var UnitStateDamageMix: unitstate
/**攻击最大值*/
declare var UnitStateDamageMax: unitstate
/**攻击范围*/
declare var UnitStateDamageRange: unitstate
/**攻击间隔*/
declare var UnitStateDamageCool: unitstate
/**攻击速度*/
declare var UnitStateAttackSpeed: unitstate
/**护甲*/
declare var UnitStateArmor: unitstate


/**
 * base from japi
 */

/** 重置旋转xyz */
declare function EXEffectMatReset(effect: effect): any;


declare function EXSetEffectSpeed(...args: any[]): any;

declare function EXGetUnitInteger(...args: any[]): any;


declare function EXEffectMatScale(h: effect, sx: number, sy: number, sz: number): any;


declare function EXGetAbilityDataInteger(...args: any[]): any;

/**
 * declare function GetUnitState(whichUnit: unit, whichUnitState: unitstate): number;
 */


declare function EXGetUnitString(...args: any[]): any;

declare function EXSetUnitString(...args: any[]): any;

declare function EXGetUnitReal(...args: any[]): any;


declare function EXSetUnitReal(...args: any[]): any;

declare function EXSetUnitInteger(...args: any[]): any;


declare function EXGetUnitArrayString(...args: any[]): any;

declare function EXSetUnitArrayString(...args: any[]): any;

declare function EXPauseUnit(p1: unit, flag: boolean): void;

declare function EXSetUnitCollisionType(...args: any[]): any;

/**
 * 设置单位移动类型
 */
declare function EXSetUnitMoveType(handle: unit, ydlx: number): void;

declare function EXSetUnitFacing(...args: any[]): any;


declare function EXExecuteScript(...args: any[]): any;

//native EXGetUnitAbility        takes unit u, integer abilcode returns ability
declare function EXGetUnitAbility(u: unit, abilcode: number | string): ability;

//单位handle, 索引 0-100
declare function EXGetUnitAbilityByIndex(unit: unit, index: number): ability;

//EXGetAbilityId(EXGetUnitAbilityByIndex())
declare function EXGetAbilityId(arg: ability): number;

declare function EXGetAbilityState(abil: ability, data_type: number): number;

declare function EXSetAbilityState(abil: ability, data_type: number, value: number): boolean;

declare function EXGetAbilityDataReal(abil: ability, level: number, data_type: number): number;

//108 = dataa,   109 = datab
declare function EXSetAbilityDataReal(abil: ability, level: number, data_type: number, value: number): any;


//native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
declare function EXSetAbilityDataInteger(abil: ability, level: number, data_type: number, value: number): any;

declare function EXGetAbilityDataString(...args: any[]): any;

declare function EXSetAbilityDataString(...args: any[]): any;

declare function EXSetBuffDataString(buffId: any, data_type: number, value: string): any;

declare function EXGetAbilityString(abilcode: number | string, level: number, data_type: number): string;

declare function EXSetAbilityString(abilcode: number | string, level: number, data_type: number, value: string): boolean;

declare function EXGetItemDataString(itemcode: number | string, data_type: number): string;

//4 = 提示,   3 = 提示（扩展）
/**
 * YDWESetItemDataString takes integer itemcode, integer data_type, string value returns boolean
 */
declare function EXSetItemDataString(itemcode: number | string, data_type: number, value: string): boolean;

/**
 edd_type :可选择：
 constant integer EVENT_DAMAGE_DATA_VAILD       = 0
 constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL = 1//是否物理伤害 (UnitDamageTarget只能造成非物理伤害)
 constant integer EVENT_DAMAGE_DATA_IS_ATTACK   = 2//是否攻击伤害
 constant integer EVENT_DAMAGE_DATA_IS_RANGED   = 3//是否远程
 constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4 //伤害类型
 constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE = 5//武器类型
 constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE = 6//攻击类型
 * @param
 * @constructor
 */
declare function EXGetEventDamageData(edd_type: number): number;

//function YDWESetEventDamage takes real amount returns boolean
declare function EXSetEventDamage(amount: number): boolean;

declare function EXSetEffectSize(handle: effect, size: number): any;

declare function EXDisplayChat(...args: any[]): any;

declare function EXDclareButtonIcon(path: string): void;

/**
 * 只能对64x64大小的blp图片进行操作
 * @param topPath 上层图片
 * @param bgPath 背景底图
 * @param resultPath 融合后的保存结果
 * @constructor
 */
declare function EXBlendButtonIcon(topPath: string, bgPath: string, resultPath: string): any;

declare function EXSetEffectXY(args: effect, x: number, y: number): any;

declare function EXSetEffectZ(handle: effect, val: number): any;

declare function EXGetEffectX(args: effect): number;

declare function EXGetEffectY(args: effect): number

declare function EXGetEffectZ(args: effect): number;

declare function EXGetEffectSize(handle: effect): any;

declare function EXEffectMatRotateX(handle: effect, val: number): any;

declare function EXEffectMatRotateY(handle: effect, val: number): any;

declare function EXEffectMatRotateZ(handle: effect, val: number): any;


declare let _g_objs: {
    ability: { [id: string]: aobj }
    upgrade: { [id: string]: upobj }
    buff: { [id: string]: bobj }
    misc: { [id: string]: { [key: string]: string } }
    destructable: { [id: string]: deobj }
    doodad: { [id: string]: dobj }
    item: { [id: string]: iobj }
    unit: { [id: string]: uobj }
};



/**
 * 其他lua api
 */

/**
 * 本地玩家的鼠标坐标 (游戏坐标)
 * @param x
 * @param y
 */
declare function mouse(): LuaMultiReturn<[number, number]>;

/**
 * 本地玩家技能按钮的状态
 *  根据格子找到技能id，命令id，目标类型
 *  ability, order, target_type = message.button(x, y)
 * @param x
 * @param y
 */
declare function button(x: number, y: number): LuaMultiReturn<[number, number, number]>;

/**
 * 获得本地玩家当前选中单位
 * 多选时返回选择列表里的第一个单位
 */
declare function selection(): unit;
