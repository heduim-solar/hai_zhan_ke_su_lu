/** @noSelfInFile */

/**
 物品合成系统
 填写物品合成所需的材料及其数量，最多可以填6种；当所需材料数量为0时，对应材料将被忽略。
 将材料1( ${类型},${整数})、材料2( ${类型},${整数})、材料3( ${类型},${整数})""、""材""料""4""( ${类型},${整数})、材料5( ${类型},${整数})、材料6( ${类型},${整数})合成 ${物品}
 */

// declare declare function YDWENewItemsFormula (type1: number, n1: number, type2: number, n2: number, type3: number, n3: number, type4: number, n4: number, type5: number, n5: number, type6: number, n6: number, eventually: number): void;


/**两个单位之间的角度 */
declare function YDWEAngleBetweenUnits(fromUnit: unit, toUnit: unit): number;

/**两个单位之间的距离*/
declare function YDWEDistanceBetweenUnits(a: unit, b: unit): number;

/** 设置伤害*/
declare function YDWESetEventDamage(amount: number): boolean;

/**设置技能属性 ( state_type:1冷却时间)*/
declare function YDWESetUnitAbilityState(u: unit, abilcode: number, state_type: number, value: number): any;

/**获取技能属性 ( state_type:1冷却时间)*/
declare function YDWEGetUnitAbilityState(u: unit, abilcode: number, state_type: number): number;

/** 设置单位技能实数属性*/
declare function YDWESetUnitAbilityDataReal(u: unit, abilcode: number, level: number, data_type: number, value: number): boolean;

/** 设置单位可飞行*/
declare function YDWEFlyEnable(u: unit): void;

/** 计时删除单位*/
declare function YDWETimerRemoveUnit(time: number, u: unit);

/** 计时删除特效*/
declare function YDWETimerDestroyEffect(time: number, e: effect);

/**佣兵系统 */
/** 设置佣兵（宠物，英雄，刷新时间，巡逻范围，返回范围，传送范围，巡逻概率）*/
declare function YDWESetGuard(pet: unit, captain: unit, timeout: number, guardRanger: number, returnRanger: number, outRanger: number, percent: number): void;

/**获取物品数据 (字符串) [JAPI]*/
declare function YDWEGetItemDataString(ItemTypeId: number, Type: number): string;

/**技能数据 (字符串) [JAPI]*/
declare function YDWEGetUnitAbilityDataString(u: unit, abilcode: number, level: number, data_type: number): string;

/**设置技能数据 (字符串) */
declare function YDWESetUnitAbilityDataString(u: unit, abilcode: number, level: number, data_type: number, value: string): void;