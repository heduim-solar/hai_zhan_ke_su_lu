// spd?: number,//移动速度
// spd_p?: number,
// lifeSpd?: number, //生命恢复速度
// lifeSpd_p?: number,
// manaSpd?: number,
// manaSpd_p?: number,
// cool?: number, //冷却减少时间
// cool_p?: number, //冷却减少百分比

/**
 * 游戏平衡性常数
 * 大数值模式下可使用下面的常数来执行对应奖励
 */


/**力量奖励生命值*/
declare let StrHpBonus: number;
/**敏捷奖励防御 0.01=100点敏捷奖励1点护甲*/
declare let AgiDefenseBonus: number;
/**智力奖励魔法值*/
declare let IntManaBonus: number;
/**主属性奖励攻击力*/
declare let PrimaryAttackBonus: number;
/**护甲减少伤害因子
 * 设此项为a 护甲为x
 * 减少值为 ax/(ax+1)*/
declare let ArmorReducesDamageFactor: number;
/** 物品贩卖回收比例 */
declare let PawnItemRate: number;

declare interface SolarSettings {
    /**挂机模式*/
    isSuspendMode?: boolean
    /**无尽模式*/
    isEndlessMode?: boolean
    /**游戏模式 其他游戏模式*/
    gameMode?: string
    /**游戏难度*/
    gameDifficulty?: number
    /**最大游戏难度*/
    maxGameDifficulty?: number
    /**数值系数*/
    valueCoefficient?: number
    /**敌人上限*/
    enemyUpperLimit?: number
    /**特效显示*/
    isEffectDisplay?: boolean
    /**播放音效*/
    isPlaySoundEffect?: boolean
    /**播放背景音乐*/
    isPlayBackgroundMusic?: boolean
    /**天气效果显示*/
    isWeatherEffectDisplay?: boolean
    /**伤害显示*/
    isDamageDisplay?: boolean
    /**默认字体路径 */
    fontPath?: string,
    /**物品锁 true为锁定 false或无值则没有加锁*/
    isItemLocks?: { [playerId: number]: boolean }
    /**区域锁 true为锁定 false或无值则没有加锁*/
    isRectLocks?: { [playerId: number]: boolean }
    /**自动施法 true为自动施法 false或无值则没有*/
    isAutoCasts?: { [playerId: number]: boolean }

    [key: string]: any
}

/**
 * 太阳用户自定义值
 */
declare interface SolarData {
    // /**名字 用于debug时获取附加到的信息*/
    // _SL_name?: string
    /**太阳属性*/
    _SL_solarAttribute?: SolarAttribute
    /**太阳指定对象的事件*/
    _SL_solarEventHandler?: { [eventKey: string]: SolarTriggerArray }

    [key: string]: any
}

declare interface SolarDataDebugInfo {
    /**id*/
    _SL_id?: string
    /**名字 用于debug时获取附加到的信息*/
    _SL_name?: string
}

declare interface AppUnitData {
    /**当前由单位物品栏里累加的属性值*/
    _SL_totalItemsSolarAttribute?: SolarAttribute
    /**当前从玩家属性继承的属性值*/
    _SL_inheritPSA?: SolarAttribute
    /**当前由单位所有buff(增益效果)累加的属性值
     * @deprecated see 推荐使用演员buff 实现功能
     * */
    _SL_totalBuffsSolarAttribute?: SolarAttribute
    /**当前由单位所有Actor 累加的属性值*/
    _SL_totalActorsSolarAttribute?: SolarAttribute
    /**太阳技能模版模拟信息  abilityNum 技能所在位置序号 1-12 不传则自动计算空的位置 */
    _SL_abilityTemplate?: { [abilityNum: number]: string }
    /**太阳buff 集合
     * @deprecated see 推荐使用演员buff 实现功能
     * */
    _SL_solarBuffSet?: { [buffTypeId: string]: any }
    /**太阳演员buff 集合*/
    _SL_solarActorBuffSet?: { [actorBuffTypeId: string]: any }//ActorBuff
    /** 单位所属的 太阳actorUnit*/
    _SL_solarActorUnit?: any//ActorUnit
}

declare interface AppAbilityTypeData {
    /** 由于技能没有稳定的handle 所以 技能类型 对应 太阳ActorAbility(ActorItem 也是继承的 ActorAbility)*/
    _SL_solarActorAbility?: any//ActorAbility（或ActorAbility的子类 ActorItem）
}

declare interface AppItemData {
    /** 物品所属的 太阳actorItem*/
    _SL_solarActorItem?: any//ActorItem
}

/**
 * 基础属性 与游戏原生属性 直接对应
 * 扩展原生限制21亿 做大数值可使用这些属性来辅助记录属性
 * 绿字属性走UnitUtil.setExtraXXX getExtraXXX
 */
declare interface BaseAttribute {
    //玩家
    /**现有黄金*/
    _SL_BA_gold?: number
    _SL_BA_gold_temp?: number
    /**现有木材*/
    _SL_BA_lumber?: number
    _SL_BA_lumber_temp?: number
    //单位
    /**基础伤害 白字攻击*/
    _SL_BA_damage_base?: number
    /**基础护甲 白字护甲*/
    _SL_BA_armor?: number
    // /**附加伤害 绿字攻击*/
    // _SL_BA_damage_bonus?: number
    // /**附加护甲 绿字护甲*/
    // _SL_BA_armor_bonus?: number
    //英雄
    /**基础力量 白字力量*/
    _SL_BA_str?: number
    /**基础敏捷 白字敏捷*/
    _SL_BA_agi?: number
    /**基础智力 白字智力*/
    _SL_BA_int?: number
    // /**附加力量 绿字力量*/
    // _SL_BA_str_bonus?: number
    // /**附加敏捷 绿字敏捷*/
    // _SL_BA_agi_bonus?: number
    // /**附加智力 绿字智力*/
    // _SL_BA_int_bonus?: number

}

/**
 * 太阳扩展属性系统
 * 由属性词条 与 实数值 组成
 */
declare interface SolarAttribute extends BaseAttribute {
    /**攻击*/
    attack?: number,
    /**攻击百分比*/
    attack_p?: number,
    /**生命*/
    life?: number,
    life_p?: number,
    /**魔法*/
    mana?: number,
    mana_p?: number,
    /**护甲*/
    def?: number,
    /**护甲比例*/
    def_p?: number,
    /**全属性*/
    full_property?: number,
    full_property_p?: number,
    /**力量*/
    strength?: number,
    /**力量百分比*/
    strength_p?: number,
    /**敏捷*/
    agility?: number,
    agility_p?: number,
    /**智力*/
    intelligence?: number,
    intelligence_p?: number,
    /**攻击速度 0.5 = 50%*/
    attackSpd_p?: number,
    /**移动速度 1-522*/
    move_speed?: number,
    /**移动速度增幅比例 1=100% 也会受到最大522限制 负数为减少*/
    move_speed_p?: number,
    /**攻击间隔 -0.1 = 减少0.1秒攻击间隔*/
    damage_cool?: number,//攻击间隔 -0.1 = 减少0.1秒攻击间隔
    /**攻击范围*/
    damage_range?: number,//攻击范围 600 = 增加600攻击范围
    /**攻击增伤 0.5=增加50%伤害*/
    attack_damage_increased?: number,
    /**护甲穿透 （比例）*/
    def_pierce_p?: number,
    /**护甲穿透 固定数值*/
    def_pierce?: number,
    //----物理系----
    /**物理增伤*/
    physical_damage_increased?: number,
    /**物理伤害减免 (物理抗性)*/
    physical_damage_reduction?: number,
    /**物理伤害穿透 (抵扣 物理伤害减免)*/
    physical_damage_pierce?: number,
    /**物理暴击几率*/
    physical_critical_chance?: number,
    /**物理暴击伤害*/
    physical_critical_damage?: number,
    //----法术系----
    /**法术强度 (法术伤害会加上此数值)*/
    magic_power?: number,
    /**法术增伤 0.5 = 额外增加50%伤害*/
    magic_damage_increased?: number,
    /**法术伤害减免（法术抗性）*/
    magic_damage_reduction?: number,
    /**法术伤害穿透 (抵扣 法术伤害减免)*/
    magic_damage_pierce?: number,
    /**法术暴击几率*/
    magic_critical_chance?: number,
    /**法术暴击伤害*/
    magic_critical_damage?: number,
    //----全伤----
    /**全伤害增幅*/
    damage_increased?: number,
    /**全伤害减免 0.5=减少50%伤害*/
    damage_reduction?: number,
    /**伤害吸血*/
    blood_sucking?: number,

    /**     自定义伤害类型 增伤与减免 如自定义金木水火土 增伤与抗性
     根据伤害类型的id（damageType） 增幅 比如神圣伤害 闪电伤害 火焰伤害 冰冻伤害 等等加成 damageType取值 0-31
     key为 "damage_increased_dt_"+damageType  x为damageType 0.5=增加50%伤害
     // [damage_increased_dt_x: string]: number,//特定伤害类型 增幅

     // [damage_reduction_dt_x: string]: number,//特定伤害类型 减免 0.5=减少50%伤害
     */

    /**     自定义武器类型 增伤与减免 如主动伤害 被动伤害 增伤与抗性  增伤的第二个维度
     根据武器类型的id（weaponType） 增幅 比如神圣伤害 闪电伤害 火焰伤害 冰冻伤害 等等加成 weaponType 0-23
     key为 "damage_increased_dt_"+damageType  x为damageType 0.5=增加50%伤害
     // [damage_increased_wt_x: string]: number,//特定武器类型 增幅
     // [damage_reduction_wt_x: string]: number,//特定武器类型 减免
     */

    /**
     * 技能cd 比例 -0.1为降低10%冷却时间
     * [ability_cd_p_${id}]: number
     *
     * 技能cd 附加(单位秒) -0.1为降低 0.1秒 冷却时间
     * [ability_cd_${id}]: number
     */

    //自定义的其他属性词条
    [custom_key: string]: number | string,

}

/**
 * 太阳伤害事件
 */
declare interface SolarDamageEvent {
    //基础
    /*** 基础伤害值 =GetEventDamage()*/
    readonly baseDamage: number,
    /*** 伤害类型 0-31*/
    readonly damageType: number,
    /*** 武器类型 0-23*/
    readonly weaponType: number,
    /*** 受害单位*/
    readonly unit0: unit,
    /*** 伤害来源单位*/
    readonly unit1: unit,
    /*** 受害单位 太阳属性 可能为空 */
    readonly u0sa?: AppAttribute,
    /*** 伤害来源单位 太阳属性 可能为空 */
    readonly u1sa?: AppAttribute,
    /*** 是否攻击伤害 */
    isAttack: boolean,
    /*** 是否远程 */
    isRanged: boolean,
    /*** 是否物理伤害类型 以下5个默认会当做是物理伤害类型
     DamageType.T4_NORMAL
     DamageType.T5_ENHANCED
     DamageType.T17_FORCE
     DamageType.T21_DEFENSIVE
     DamageType.T26_UNIVERSAL */
    isPhysical: boolean,
    //扩展值
    /*** 是否已消耗 当设置此值为true时将跳过后续伤害处理器*/
    consumed?: boolean
    /*** 是否暴击 */
    isCritical?: boolean
    /*** 返回最终造成的伤害值 会被EXSetEventDamage(resultDamage)设置到最终伤害*/
    resultDamage?: number

    //自定义的其他数据字段
    [custom_key: string]: any,
}

/**
 *  buff = （增益）效果 修改器
 * 太阳模拟buff 系统
 * buff类型 可以根据类型创建对单个单位起作用的buff
 */
declare interface SolarBuffType {

    /**基础事件*/
    /**当创建时*/
    onCreated?: (buff) => void
    /**当buff系统循环更新此buff时的回调 tpf=每次更新的间隔 毫秒单位*/
    onUpdate?: (buff, tpf: number) => void
    /**当循环间隔到时 比如每2秒造成伤害 持续6秒 则每2秒时会回调用此方法*/
    onInterval?: (buff) => void
    /**buff结束时 返回false可以停止销毁 让buff继续执行*/
    onDestroy?: (buff) => boolean | void
    /**当buff 叠加层数改变时 的回调函数*/
    onStackCountChange?: (buff, stackAdd: number) => void

    /**基础属性*/
    /**id*/
    id: string,
    /**Lv.1 增益效果类型的类别 传统狭义的buff可使用基础 (羁绊等任意状态附加也是增益效果哦)*/
    class?: "基础" | "羁绊" | "商城" | "存档" | "神器" | "境界" | "入体装备" | "法宝" | "丹药" | "奇遇" | "套装" | "奖励" | "AI" | string,
    /**Lv.2 种类(可做同类buff覆盖的效果标记)*/
    kind?: string,
    /**Lv.3 标签(可对指定标签的buff做特殊操作)*/
    tag?: string,
    // /**唯一种类*/
    // isUniqueKind?: boolean,
    name?: string,
    ubertip?: string,
    /**等级*/
    level?: number
    /**图标显示类型 显示系统 决定该数据信息的在哪里显示 由其他显示系统遍历这些信息来主动显示*/
    uiShowType?: "单位状态栏" | "通用图标面板" | "任务面板" | string,
    /**图标项目是否启用 true为亮图标 如果没有值或为false则显示暗图标 这个值可以是异步的（比如商城存档）*/
    uiEnable?: boolean,
    /**要求提示*/
    requiredTip?: string,
    /**持续时间 秒单位*/
    dur?: number,
    /**每层buff独立计算持续时间*/
    stackDurMode?: boolean,
    /**间隔 秒单位*/
    interval?: number,
    stackCountMax?: number,
    /**优先权*/
    priority?: number,
    isDebuff?: boolean,
    art?: string,
    /**模型效果附加节点*/
    targetAttach?: string,
    /**效果模型路径*/
    targetArt?: string,
    /**属性附加*/
    attribute?: AppAttribute,

    /**附加数据 可以在表格里配置 增益效果 的扩展数据*/
    val1?: any
    val2?: any
    val3?: any
    val4?: any
    val5?: any

    [key: string]: any
}


