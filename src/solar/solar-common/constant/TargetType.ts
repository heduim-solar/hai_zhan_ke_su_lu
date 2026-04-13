/**
 转换目标允许
 */
enum TargetType {
    /**地面*/ground = 2 ** 1,
    /**空中*/air = 2 ** 2,
    /**建筑*/structure = 2 ** 3,
    /**守卫*/ward = 2 ** 4,
    /**物品*/item = 2 ** 5,
    /**树木*/tree = 2 ** 6,
    /**墙*/wall = 2 ** 7,
    /**残骸*/ debris = 2 ** 8,
    /**装饰物*/decoration = 2 ** 9,
    /**桥*/bridge = 2 ** 10,
    //
    /**自己*/self = 2 ** 12,
    /**玩家单位*/player = 2 ** 13,
    /**联盟*/allies = 2 ** 14,
    /**中立*/neutral = 2 ** 15,
    /**敌人*/enemy = 2 ** 16,
    /**敌人*/enemies = 2 ** 16,
    //
    /**可攻击的*/vulnerable = 2 ** 20,
    /**无敌*/invulnerable = 2 ** 21,
    /**英雄*/hero = 2 ** 22,
    /**非-英雄*/nonhero = 2 ** 23,
    /**存活*/alive = 2 ** 24,
    /**死亡*/dead = 2 ** 25,
    /**有机生物*/organic = 2 ** 26,
    /**机械类*/mechanical = 2 ** 27,
    /**非-自爆工兵*/nonsapper = 2 ** 28,
    /**自爆工兵*/sapper = 2 ** 29,
    /**非-古树*/nonancient = 2 ** 30,
    /**古树*/ancient = 2 ** 31,
    //不确定的
    /**别人*/notself = 2 ** 11,
    /**地形*/terrain = 2 ** 17,
    /**没有*/none = 2 ** 18,
    /**友军单位*/friend = 2 ** 19,
}

export default TargetType

/**
 转换目标允许
 */
export enum TargetCnType {
    地面 = 2 ** 1,
    空中 = 2 ** 2,
    建筑 = 2 ** 3,
    守卫 = 2 ** 4,
    物品 = 2 ** 5,
    树木 = 2 ** 6,
    墙 = 2 ** 7,
    残骸 = 2 ** 8,
    装饰物 = 2 ** 9,
    桥 = 2 ** 10,
    //
    自己 = 2 ** 12,
    玩家单位 = 2 ** 13,
    联盟 = 2 ** 14,
    中立 = 2 ** 15,
    敌人 = 2 ** 16,
    //
    可攻击的 = 2 ** 20,
    无敌 = 2 ** 21,
    英雄 = 2 ** 22,
    非英雄 = 2 ** 23,
    存活 = 2 ** 24,
    死亡 = 2 ** 25,
    有机生物 = 2 ** 26,
    机械类 = 2 ** 27,
    非自爆工兵 = 2 ** 28,
    自爆工兵 = 2 ** 29,
    非古树 = 2 ** 30,
    古树 = 2 ** 31,
    //不确定的
    别人 = 2 ** 11,
    地形 = 2 ** 17,
    没有 = 2 ** 18,
    友军单位 = 2 ** 19,
}

/**无目标*/
export const TARGET_TYPE_NONE = 0;
/**单位目标*/
export const TARGET_TYPE_UNIT = 1;
/**点目标*/
export const TARGET_TYPE_POINT = 2;
/**单位或点*/
export const TARGET_TYPE_UNIT_OR_POINT = 3;

/**
 图标选项
 */
export enum OptionType {
    /**图标可见*/visible = 1,
    /**目标选取图像*/targimage = 2 ** 1,
    /**物理魔法*/physical = 2 ** 2,
    /**通用魔法*/universal = 2 ** 3,
    /**单独释放*/unique = 2 ** 4,
}