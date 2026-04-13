/**
 * Actor(演员/表现)
 *
 * 演员可以扮演游戏中几乎任何游戏对象
 *
 * 太阳Actor 主要提供扮演技能 物品 buff 单位的基础功能（当然也可以获取底层实现的模板物编）
 *
 * 这意味着上层作者只需定义Actor类型即可 底层的操作交互由太阳封装 模板技能 模板物品 等来实现
 *
 * 这可以使一个数据结构 统一并简单的复用， 比如技能与对应的技能书 可以通过Actor来轻易的实现转换 而无需去定义原始的技能和物品物编
 *
 * 提供统一的数据结构来使用模拟系统
 *
 *
 */


import Actor from "@/Actor";

type _SL_SolarBaseTemplateType =
    "宝宝助手"
    | "近战力量英雄"
    | "近战敏捷英雄"
    | "近战智力英雄"
    | "远程力量英雄"
    | "远程敏捷英雄"
    | "远程智力英雄"
    | "近战单位"
    | "远程单位"
    | "NPC单位"
    | "飞行单位"
    /** 物品模板 */
    | "主动物品"
    | "被动物品"
    /** 技能通魔模板 1=左上角位置 12=右下角位置 */
    | "主动1"
    | "主动2"
    | "主动3"
    | "主动4"
    | "主动5"
    | "主动6"
    | "主动7"
    | "主动8"
    | "主动9"
    | "主动10"
    | "主动11"
    | "主动12";

/**
 *  ActorType = 演员类型
 *  ActorType 可以根据类型创建对单个actor起作用的
 */
declare global {

    /** 演员基础事件
     *
     * 基础单位事件都会路由回调到演员类型事件里。
     * 可以在这里方便的做游戏逻辑
     * 而不用自己去注册单位事件并自己判断是否拥有某个物品技能类型
     *
     * */
    interface SolarActorTypeEventHandler {

        /** 基础事件 回调事件中通常需考虑冥等性（即多次调用这个事件回调无副作用 比如删除一次单位跟删除N次单位是一样的效果）
         *  （尽量不要在事件里使用as 子类型做操作 因为这会导致演员不能形态转换 比如吞噬一个装备或技能为buff了 应尽可能保证事件是基于Actor基类写的以提高灵活性 毕竟游戏策划说变就变）
         * */

        /** 当创建时 onUnitChange可能在此事件之前执行(比如演员单位 和演员技能 都必须有单位才能创建 物品则创建时没有单位创建后才能添加到单位物品栏)
         *  不要过渡关注事件执行顺序，应当考虑冥等性 即无论随机顺序 结果也应该相同 */
        onCreated?: ((actor: Actor) => void)
        /** 当从商店购买这个演员时（比如购买一个演员物品）buyingUnit=购买者 */
        onBuy?: ((actor: Actor, buyingUnit: unit) => void)
        /** 当更新时 */
        onUpdate?: ((actor: Actor) => void)
        /** 当本地点击时 ( 异步回调 比如用作建造技能 模拟商店 当返回false时则忽略此次点击 btn 1=左键 2=右键 xy为鼠标位置0-0.8 ) */
        onLocalClick?: ((actor: Actor, btn: number, x: number, y: number, actorType: AppActorType) => boolean | void)
        /** 当点击时 同步(由 onLocalClick 同步数据获得 )
         *  注意和onAction 的区别 (这里的点击是由本地点击ui再同步数据触发的  onAction则通常是由释放技能效果时触发的)
         * */
        onClick?: ((actor: Actor, btn: number, triggerPlayer: player, actorType: AppActorType) => void)
        /** 当触发基本动作时 (释放演员技能 会走这个 会自动填充合适的xy坐标和目标单位
         *  通过使用这个xy参数比直接使用GetSpellTargetX的好处是 可以更好的做自动施法了 以及主被动技能方便切换)
         *  (演员物品点击使用时也会走这个)
         *  */
        onAction?: ((actor: Actor, x: number, y: number, targetUnit?: unit) => void)
        /**当循环间隔到时的回调 (创建演员时就会启动 如果跟单位相关的 通常应该使用onWithUnitInterval)*/
        onInterval?: (actor: Actor) => void
        /**当有关联的单位(活着的)且循环间隔到时的回调  物品周期装备用这个可以节省性能 因为只有在单位捡起此物品时才会触发计时器启动和回调*/
        /** 光环技能也可通过这个对周围单位每2秒 添加一个持续2秒的 演员buff */
        onUnitInterval?: (actor: Actor) => void
        /**当演员等级(或buff叠加层数)改变时 的回调函数 delta 等级改变的增量*/
        onActorLevelChange?: (actor: Actor, delta: number) => void
        /** 演员销毁时 单位删除技能 删除单位/物品时会触发此事件 (演员buff返回false可以停止销毁)*/
        onDestroy?: ((actor: Actor) => boolean | void)
        /**
         * 关联单位的事件 (通常 演员技能 演员物品 演员buff 的逻辑效果都是作用在单位身上的 可以直接使用以下事件  方便编写对关联单位的功能逻辑)
         */
        /**
         * 当关联的unit发生改变时 （actor.lastUnit可以获得旧的单位）
         * 如单位拾取/丢弃到物品演员会触发此事件 (丢弃物品时unit则为null 通过lastUnit获取丢弃物品的单位)
         * */
        onUnitChange?: ((actor: Actor, unit?: unit) => void)
        /**当关联的单位 施放任意技能时(发动技能效果) 如需监听本技能释放 可注册onAction事件*/
        onUnitSpell?: (actor: Actor, spellAbilityId: string) => void
        /**当关联的单位 拾取任意物品时*/
        onUnitPickupItem?: (actor: Actor, item: item) => void
        /**当关联的单位 等级改变时*/
        onUnitLevelChange?: (actor: Actor, delta: number) => void
        /**当关联的单位 受到攻击的时候*/
        onUnitAttacked?: (actor: Actor, attacker: unit) => void
        /**当关联的单位 受到伤害的时候*/
        onUnitDamaged?: (actor: Actor, damageSource: unit, event: AppDamageEvent) => void
        /**当关联的单位 受到攻击伤害的时候 这个当攻击事件可以防止单位寸止 即抬手时就触发了被攻击事件 */
        onUnitAttackedDamage?: (actor: Actor, damageSource: unit, event: AppDamageEvent) => void
        /**当关联的单位 死亡时 killingUnit凶手单位可能为空 */
        onUnitDeath?: (actor: Actor, killingUnit?: unit) => void
        // 反转单位
        /**当关联的单位 对敌人造成攻击伤害时 这个当攻击事件可以防止单位寸止 即抬手时就触发了被攻击事件 */
        onUnitAttackDamageEnemy?: (actor: Actor, enemy: unit, event: AppDamageEvent) => void
        /**当关联的单位 对敌人造成伤害时 */
        onUnitDamageEnemy?: (actor: Actor, enemy: unit, event: AppDamageEvent) => void
        /**当关联的单位 杀敌时 */
        onUnitKillEnemy?: (actor: Actor, deathEnemy: unit) => void
        /** 单位增强事件 */
        /**当任意单位进入关联单位指定范围时 需同时指定unitInRangeValue范围值才能触发此事件
         *  (此事件底层暂时未排泄 推荐注册次数不超过500次) */
        onUnitInRange?: (actor: Actor, enteringUnit: unit) => void
        /**当关联的单位 获得新的演员对象时  如获得了演员buff、拾取了演员物品、或添加了演员技能 在这里可以做一些排斥判断等等操作*/
        onUnitAddActor?: (actor: Actor, newActor: Actor) => void
        /**当关联的单位 移除关联的演员对象时  如失去了演员buff、丢弃了演员物品、销毁了演员技能 或销毁了演员*/
        onUnitRemoveActor?: (actor: Actor, removedActor: Actor) => void
        /**当关联的单位 获得或移除关联的演员对象时  在这里可以做一些刷新操作 比如延迟0.01秒判断单位是否还拥有什么特殊的物品等*/
        onUnitActorsChange?: (actor: Actor, isRemove: boolean, changeActor: Actor) => void
    }

    /** 演员基础属性 */
    /**
     * 这里的属性只是一个数据 不知道是什么功能可以不用管。因为它的功能取决于你读取它拿来做什么。
     * 大部分的属性命名和使用 应符合常规理解 即可!
     *
     * 通常数据类型是字符串的显示文本 都可以异步设置 (通常参与战斗，属性计算的number类型的数值不能异步设置)
     *
     * */
    interface SolarActorType extends SolarActorTypeEventHandler {
        /**基础属性*/
        /**id 可以设自定义中文名字 (注意不要跟原生物编id冲突了 以免导致系统无法区分一个id是演员类型还是原生类型)*/
        id?: string,
        /** 模版 当没有此值的时候会取自动默认的基础模版 单位模板可以直接填原生物品的4字符id如hfoo代表使用步兵*/
        templateType?: string | _SL_SolarBaseTemplateType,
        /**Lv.1 演员类型的类别 */
        class?: "基础" | "技能" | "物品" | "单位" | string,
        /**Lv.2 种类(可做同类buff覆盖的效果标记)*/
        kind?: string,
        /**Lv.3 标签(可对指定标签的buff做特殊操作)*/
        tag?: string,
        // /**唯一种类*/
        // isUniqueKind?: boolean,
        /** 名字 */
        name?: string,
        /** 图标 */
        icon?: string,
        /** 详细扩展描述 */
        describe?: string,
        /** 快捷键 */
        hotKey?: string,

        /** 影响区域 */
        area?: number,
        /** 目标类型 */
        targetType?: "单位" | "点" | "单位或点" | "物品" | "无目标",
        /** 目标允许 示例: 地面,空中,建筑 中英皆可以 */
        targetAllow?: string,
        /**模型*/
        model?: string,
        /**模型缩放*/
        modelScale?: number,
        /** 颜色rgb max=255 */
        colorR?: number
        colorG?: number
        colorB?: number
        /** 透明度 max=255 */
        alpha?: number
        /**等级*/
        level?: number
        /** 最大等级 (同buff最大叠加层数 -1=无限叠加)*/
        levelMax?: number
        /**是否被动*/
        passive?: boolean,
        /**是否禁用*/
        disable?: boolean,
        /**是否唯一*/
        unique?: boolean,
        /**是否隐藏*/
        hide?: boolean,
        /**图标显示类型 显示系统 决定该数据信息的在哪里显示 由其他显示系统遍历这些信息来主动显示*/
        uiShowType?: "单位状态栏" | "图标面板" | "通用图标面板" | "任务面板" | string,
        /**图标项目是否启用 true为亮图标 如果没有值或为false则显示暗图标 这个值可以是异步的（比如商城存档）*/
        uiEnable?: boolean,
        /**要求提示*/
        requiredTip?: string,
        /** 属性附加 */
        attribute?: AppAttribute,
        /** 索引序号 通常应该与表格的索引对应 第一行数据为0开始
         *  (比如单位与专属的物品表格都对应时 这个作为演员类型表格的数组索引 可以找到对应的数据，或者当做简短的存档key) */
        index?: number,
        /** 数值公式 示例:技能造成伤害可以读取这个来计算出伤害值 */
        stateFormula?: StateFormula,

        /**技能:最大冷却时间  */
        maxCd?: number
        /** 技能:施法范围 / 单位:攻击范围 */
        range?: number,


        /** 金币消耗 */
        goldCost?: number
        /** 木材消耗 */
        lumberCost?: number
        /** 人口(食物)消耗 */
        foodCost?: number
        /** 杀敌消耗 */
        killsCost?: number
        /** 消耗公式 */
        cost?: StateFormula


        /** 位置 */
        x?: number
        y?: number
        /**持续时间 秒单位*/
        dur?: number,
        /** 事件辅助参数 */
        /**间隔 秒单位 可触发onUnitInterval onInterval 等 */
        interval?: number,
        /**单位范围 可触发onUnitInRange*/
        unitInRangeValue?: number,
        /** 扩展提示 */
        /** 鼠标放到按钮上的 右下角扩展提示 属性图标标签(金币 木材 食物 / 冷却 耗蓝 杀敌) 可以异步设置 */
        //第一个标签 图标的 图片路径
        tooltipLabelIcon1?: string; //默认会显示金币图标
        //第一个标签 的文本
        tooltipLabel1?: string;
        tooltipLabelIcon2?: string; //默认会显示木材图标
        tooltipLabel2?: string;
        tooltipLabelIcon3?: string; //默认会显示杀敌图标
        tooltipLabel3?: string;

        /**附加数据 可以在表格里配置 的扩展数据*/
        val1?: any
        val2?: any
        val3?: any
        val4?: any
        val5?: any

        [key: string]: any
    }


    interface AppActorAbilityType extends AppActorType {
        /**
         * 技能相关
         * /
         /**  魔法消耗*/
        lumberCost?: number
    }

    interface AppActorBuffType extends AppActorType {
        /**buff 相关*/
        /**寄生单位的模型附加效果*/
        modelAttach?: string,
        /**特效附加到单位模型的目标 */
        modelAttachTarget?: string,
        /**是减益buff */
        isDebuff?: boolean,
        /**优先级 */
        priority?: number,
        /**每层 buff 独立计算持续时间 （为true的情况下 最大层数只能是在dur时间段内的添加buff的次数 即不会出现无限叠加上去的情况。）*/
        levelDurMode?: boolean,
    }

    /**
     * 物品相关
     */
    interface AppActorItemType extends AppActorAbilityType {
        /**
         * 物品
         * /
         /** 是否可抵押 */
        pawnable?: boolean
        /** 是否可丢弃 */
        droppable?: boolean
        /** 使用次数 */
        uses?: number
        /** 最大堆叠数 使用次数模拟 */
        stackMax?: number
        /**  当没有使用次数的时候自动销毁  使用次数<=0时*/
        destroyOnNoUses?: boolean
    }


    type moveType = "没有" | "无法移动" | "步行" | "飞行" | "地雷" | "疾风步" |
        "漂浮" | "浮空" | "两栖" | "amph" | "horse" | "float" | "foot" |
        "fly" | "nomove" | "nomove" | "none"

    /**
     * 单位相关
     */
    interface AppActorUnitType extends AppActorType {
        /**
         * 单位相关
         * /
         /** 弹道模型 */
        missileModel?: string,
        /** 移动类型 */
        moveType?: string | moveType,
        /** 飞行高度 */
        flyHeight?: number,
        /** 移动速度 */
        moveSpeed?: number,
        /** 最大生命值 */
        maxLife?: number
        /** 最大魔法值 */
        maxMana?: number
        /** 主动攻击范围 感知敌人的距离*/
        acquireRange?: number
        /** 护甲 */
        def?: number
        /** 基础伤害值 */
        damage?: number
        /** 攻击间隔  */
        damageCd?: number
        /** 英雄相关 */
        /** 基础白字力量 */
        strength?: number,
        /** 基础白字敏捷 */
        agility?: number,
        /** 基础白字智力 */
        intelligence?: number,
        /** 击杀后的奖金  */
        bounty?: number
        /** 击杀后掉落的物品 {"倚天剑":0.05}=表示死亡后5%概率掉落倚天剑  */
        bountyItems?: { [itemIdOrActorId: string]: number }
        /** 死亡后诞生的单位 如九头蛇死亡后诞生小九头蛇 {"小九头蛇":0.05}=表示死亡后5%概率诞生1个小九头蛇  */
        //{"小九头蛇":3}=表示死亡后100%概率诞生3个小九头蛇
        afterDeathBirthUnits?: { [unitIdOrActorId: string]: number }
        /** 售卖演员物品类型id列表  */
        sellItems?: string[]
        /** 拥有的技能类型id列表 (可以为演员类型或基础物编类型id) */
        abilities?: string[]
    }
}