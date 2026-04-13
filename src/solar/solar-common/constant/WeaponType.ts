/**
 共计23种武器类型 可以自行对应这些类型到自己的设计的属性上
 */
enum WeaponType {
    //base

    /** */
    T0_WHOKNOWS = 0,
    /** */
    T1_METAL_LIGHT_CHOP = 1,
    /** */
    T2_METAL_MEDIUM_CHOP = 2,
    /** */
    T3_METAL_HEAVY_CHOP = 3,
    /** */
    T4_METAL_LIGHT_SLICE = 4,
    /** */
    T5_METAL_MEDIUM_SLICE = 5,
    /** */
    T6_METAL_HEAVY_SLICE = 6,
    /** */
    T7_METAL_MEDIUM_BASH = 7,
    /** */
    T8_METAL_HEAVY_BASH = 8,
    /** */
    T9_METAL_MEDIUM_STAB = 9,
    /** */
    T10_METAL_HEAVY_STAB = 10,
    /** */
    T11_WOOD_LIGHT_SLICE = 11,
    /** */
    T12_WOOD_MEDIUM_SLICE = 12,
    /** */
    T13_WOOD_HEAVY_SLICE = 13,
    /** */
    T14_WOOD_LIGHT_BASH = 14,
    /** */
    T15_WOOD_MEDIUM_BASH = 15,
    /** */
    T16_WOOD_HEAVY_BASH = 16,
    /** */
    T17_WOOD_LIGHT_STAB = 17,
    /** */
    T18_WOOD_MEDIUM_STAB = 18,
    /**原生不常见的*/
    T19_CLAW_LIGHT_SLICE = 19,
    /**原生不常见的 */
    T20_CLAW_MEDIUM_SLICE = 20,//被动伤害
    /**原生不常见的*/
    T21_CLAW_HEAVY_SLICE = 21,//主动伤害
    /** */
    T22_AXE_MEDIUM_CHOP = 22,
    /** */
    T23_ROCK_HEAVY_BASH = 23,

}

export default WeaponType


