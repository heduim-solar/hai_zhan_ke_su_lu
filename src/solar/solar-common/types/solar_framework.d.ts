/** @noSelfInFile */
/**
 * 太阳框架
 */

/**
 * 大属性模式 (属性可突破100万 21亿限制  达到数百涧 涧=10的36次方)
 * (此模式下 会重写一些与属性相关的函数 如玩家金币 木材 单位的攻击护甲 英雄的3维等)
 * 默认为false 不开启大属性模式
 * （在大属性模式下 不能斤斤计较）
 * see attribute/BigAttributeCompatibleState
 */
declare let isBigAttributeMode: boolean

/**
 * 太阳伤害系统 是否启用
 */
declare let isSolarDamageEnable: boolean


/**
 * 游戏设置
 * 比如伤害显示 物品锁 或其他设置
 */
declare let settings: AppSettings


declare interface SolarGlobalVariable {
    /**
     * 下一波倒计时
     */
    nextWaveCountdown?: number
    /**
     * 敌人等级
     */
    enemyLevel?: number
    /**
     * 当前敌人数量
     */
    enemyCount?: number
    /**
     * 判断 UnitDropItemSlot 正在执行 (这个函数也会触发EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER 事件  可以判断这个来做一些逻辑)
     */
    isUnitDropItemSlotExecIng?: boolean

    /**
     * 任意全局变量
     */
    [key: string]: any
}

/**
 *  全局变量
 */
declare let gv: AppGlobalVariable

/**
 *  太阳事件总线自定义事件类型
 *  (通过中心事件可以解耦各个系统的数据逻辑交互)
 */
declare interface SolarEventType {
    "选择模式"?: string
    "选择难度"?: number
    /** 玩家按下回城按钮 */
    "回城"?: player
    "练功房"?: player
    "任务点"?: player
    /**选择英雄 被选中的英雄*/
    "选择英雄"?: unit
    "打开UI"?: string
    /** 刷新图标面板 可能在图标面板做操作时 修改了图标 禁用/启用 文本 可以触发这个事件也实时显示效果
     * 否则要等下次打开图标面板才会刷新最新的数据 */
    "刷新图标面板"?: void
    /**通用基础的ui刷新*/
    "刷新UI"?: void
    "接受任务"?: { id: string, p: number, type?: string, tip?: string, lv?: number, max?: number, [key: string]: any }
    "任务进度"?: {
        id: string,
        p: number,
        type?: string,
        tip?: string,
        workDone?: number,
        max?: number,
        [key: string]: any
    }
    "完成任务"?: { id: string, p: number, type?: string, tip?: string, lv?: number, max?: number, [key: string]: any }
    "存档"?: void
    /**
     * unit  转生的英雄单位
     * level 转生后的等级
     */
    "转生"?: { unit: unit, level: number }
    /**用作出怪的提前预警 参数为多少秒后开始出怪*/
    "准备出怪"?: number
    "开始出怪"?: void
    /**用作每波需要改变的功能 参数为第几波*/
    "敌人波数改变"?: number
    "敌人进攻"?: void
    "特殊怪进攻"?: void
    "Boss进攻"?: void
    "双击选择单位"?: unit
    /**没有玩家则认为是所有玩家*/
    "游戏胜利"?: player
    "游戏失败"?: player
    "游戏结束"?: player
    /**需要及时刷新属性的时候可以发送这个事件 其他属性系统监听这个事件以进行及时刷新*/
    "属性刷新"?: string
    /**
     * key:奖励名字
     * val:奖励值（可以为对象 比如属性对象）
     * */
    "给与玩家奖励"?: { p: number, key: string, val: any }
    /**
     * 可以用这个把挑战NPC跟刷怪系统解耦
     * key:奖励名字
     * val:挑战值
     * */
    "挑战"?: { p: number, key: string | "基础刷怪", val: any }

    [id: string]: any
}

/**
 * 第一个参数url = 需要请求的网址
 *
 * 第二个参数data = 需要发送请求报文数据
 *
 * 第三个参数onResult = http响应后的异步回调，记得使用同步方法同步到其他玩家
 * @deprecated 不要收集玩家用户的信息 以免触犯规则
 */
declare function HttpRequest(url: string, data: string, onResult: (result: string) => void): any;


declare function char2number(char: string): number;


/**
 * 根据这些key的值乘以对应的单位属性 获得属性对应的公式值
 */
declare interface StateFormula {
    /** 概率 0.1 =10% 如果有此值的话 则计算概率 不在概率中会返回0 外部使用可以根据伤害是否大于0再做 逻辑 */
    chance?: number
    /** 基础值 */
    base?: number
    /** 基础(来源)单位 */
    /** 攻击力 */
    attack?: number,
    /** 护甲 */
    def?: number,
    /** 全属性 */
    fullPros?: number,
    /** 力量 */
    str?: number,
    /** 敏捷 */
    agi?: number,
    /** 智力 */
    int?: number,
    /** 当前生命值 */
    hp?: number,
    /** 当前魔法值 */
    mana?: number,
    /** 最大生命值 */
    maxHp?: number,
    maxMana?: number,
    /** 已损失生命值 */
    loseHp?: number,
    loseMana?: number,


    /** 受害(目标)单位 */
    target_attack?: number,
    target_def?: number,
    /** 目标全属性 */
    target_fullPros?: number,
    target_str?: number,
    target_agi?: number,
    target_int?: number,
    /** 当前生命值 */
    target_hp?: number,
    target_mana?: number,
    /** 最大生命值 */
    target_maxHp?: number,
    target_maxMana?: number,
    /** 已损失生命值 */
    target_loseHp?: number,
    target_loseMana?: number,


    /** 玩家相关 */
    /** 金币 */
    gold?: number
    /** 木材 */
    lumber?: number
    /** 人口(食物) */
    food?: number
    /** 杀敌数 */
    kills?: number


    /** 最终数值增幅 0.5=增加50%*/
    increased?: number
}

declare interface Destroyable {
    destroy(): any;
}


declare type FrameType = "BACKDROP" | "TEXT" | "GLUETEXTBUTTON" | "BUTTON" | "TEXTBUTTON" | "TEXTAREA" | "FRAME"
    | "CHECKBOX" | "EDITBOX" | "GLUEBUTTON" | "SCROLLBAR" | "SLIDER" | "SPRITE" | "POPUPMENU" | "CONTROL" | "DIALOG"
    | "HIGHLIGHT" | "LISTBOX" | "MENU" | "CHATDISPLAY" | "GLUECHECKBOX" | "SIMPLEFRAME" | "SIMPLEBUTTON";