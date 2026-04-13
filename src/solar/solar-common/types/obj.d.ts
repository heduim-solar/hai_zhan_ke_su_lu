/**
 * game obj
 */

declare type uobj = {
    [key: string]: any
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** code */
    code?: string
    /** 图标 - 普通 */
    Art?: string
    /** 模型文件 */
    file?: string
    /** 提示工具 - 普通 */
    Tip?: string
    /** 生命值 */
    HP?: any
    /** 基础护甲 */
    def?: any
    /** 攻击 1 - 基础伤害 */
    dmgplus1?: string
    /** 英雄 - 初始力量 */
    STR?: string
    /** 英雄 - 初始敏捷 */
    AGI?: string
    /** 英雄 - 初始智力 */
    INT?: string
    /** 英雄 - 每等级提升力量 */
    STRplus?: string
    /** 英雄 - 每等级提升敏捷 */
    AGIplus?: string
    /** 英雄 - 每等级提升智力 */
    INTplus?: string
    /** 允许攻击模式 */
    weapsOn?: string
    /** 英雄 - 主要属性 */
    Primary?: "STR" | "AGI" | "INT"
    /** 类型 */
    movetp?: string
    /** 建筑升级 */
    Upgrade?: string
    /** 占用人口 */
    fused?: string
    /** 售出物品 */
    Sellitems?: string
    /** 售出单位 */
    Sellunits?: string
    /** 提供人口 */
    fmade?: string
    /** 攻击 1 - 攻击间隔 */
    cool1?: string
    /** 碰撞体积 */
    collision?: string
    /** 黄金奖励 - 基础值 */
    bountyplus?: string
    /** 攻击 2 - 攻击间隔 */
    cool2?: string
    /** 技能 */
    abilList?: string
    /** 魔法最大值 */
    manaN?: string
    /** 提示工具 - 普通 - 扩展 */
    Ubertip?: string
    /** 按钮位置 - 普通 (X) */
    Buttonpos_1?: string
    /** 按钮位置 - 普通 (Y) */
    Buttonpos_2?: string
    /** 热键 - 普通 */
    Hotkey?: string
    /** 需求 */
    Requires?: string
    /** 英雄技能 */
    heroAbilList?: string
    /** 组群分离 - 允许 */
    repulse?: string
    /** 可作为中立敌对显示 */
    hostilePal?: string
    /** 最小速度 */
    minSpd?: string
    /** 基础速度 */
    spd?: string
    /** 等级 */
    level?: string
    /** 防御升级奖励 */
    defUp?: string
    /** 建造时间 */
    bldtm?: string
    /** 攻击 1 - 范围影响目标 */
    splashTargs1?: string
    /** 作为目标类型 */
    targType?: string
    /** 攻击 2 - 范围影响目标 */
    splashTargs2?: string
    /** 攻击 2 - 动画伤害点 */
    dmgpt2?: string
    /** 称谓 */
    Propernames?: string
    /** 战争迷雾 - 采样范围 */
    fogRad?: string
    /** 最大速度 */
    maxSpd?: string
    /** 修理金子消耗 */
    goldRep?: string
    /** 购买时间间隔 */
    stockRegen?: string
    /** 射弹碰撞偏移 - Z (深水) */
    impactSwimZ?: string
    /** 攻击 1 - 射弹自导允许 */
    MissileHoming_1?: string
    /** 攻击 2 - 射弹自导允许 */
    MissileHoming_2?: string
    /** 攻击 1 - 动画伤害点 */
    dmgpt1?: string
    /** 阴影图像(建筑) */
    buildingShadow?: string
    /** 可设置死亡掉落物品 */
    dropItems?: string
    /** 攻击 2 - 全伤害范围 */
    Farea2?: string
    /** 训练单位 */
    Trains?: string
    /** 攻击 1 - 全伤害范围 */
    Farea1?: string
    /** 深水区有阴影 */
    shadowOnWater?: string
    /** 攻击 2 - 投射物图像 */
    Missileart_2?: string
    /** 木材消耗 */
    lumbercost?: string
    /** 射弹偏移 - Z */
    launchZ?: string
    /** 主动攻击范围 */
    acquire?: string
    /** 射弹偏移 - Y */
    launchY?: string
    /** 射弹偏移 - X */
    launchX?: string
    /** Y轴最大旋转角度(度数) */
    maxRoll?: string
    /** 攻击 2 - 小伤害范围 */
    Qarea2?: string
    /** 攻击 1 - 投射物图像 */
    Missileart_1?: string
    /** 隐藏小地图显示 */
    hideOnMinimap?: string
    /** 攻击 1 - 小伤害范围 */
    Qarea1?: string
    /** 攻击 2 - 武器声音 */
    weapType2?: string
    /** 攻击 1 - 武器声音 */
    weapType1?: string
    /** 要求动画名 */
    animProps?: string
    /** 攻击 2 - 射弹弧度 */
    Missilearc_2?: string
    /** 攻击 1 - 射弹弧度 */
    Missilearc_1?: string
    /** 攻击 1 - 射弹速率 */
    Missilespeed_1?: string
    /** 攻击 1 - 攻击类型 */
    atkType1?: string
    /** 死亡类型 */
    deathType?: string
    /** 攻击 2 - 射弹速率 */
    Missilespeed_2?: string
    /** 颜色值(蓝) */
    blue?: string
    /** 高度 */
    moveHeight?: string
    /** 随机 */
    RandomSoundLabel?: string
    /** 特殊效果 */
    Specialart?: string
    /** 攻击 1 - 目标允许 */
    targs1?: string
    /** 攻击 2 - 目标允许 */
    targs2?: string
    /** 运输尺寸 */
    cargoSize?: string
    /** 动画 - 跑步速度 */
    run?: string
    /** 黄金奖励 - 骰子面数 */
    bountysides?: string
    /** 名字 */
    Name?: string
    /** AI放置范围 */
    buffRadius?: string
    /** 颜色值(红) */
    red?: any
    /** 攻击 1 - 武器类型 */
    weapTp1?: string
    /** 攻击 2 - 攻击类型 */
    atkType2?: string
    /** 攻击 2 - 武器类型 */
    weapTp2?: string
    /** 生命回复类型 */
    regenType?: string
    /** 优先权 */
    prio?: string
    /** 需求 -使用等级数 */
    Requirescount?: string
    /** 可建造建筑 */
    Builds?: string
    /** 攻击 2 - 动画回复点 */
    backSw2?: string
    /** 攻击 1 - 动画回复点 */
    backSw1?: string
    /** 组群分离 -优先权 */
    repulsePrio?: string
    /** 装甲类型 */
    armor?: string
    /** 分类 - 战役 */
    campaign?: string
    /** 提示工具 -重生 */
    Revivetip?: string
    /** 称谓数量 */
    nameCount?: string
    /** 攻击 2 - 伤害衰减参数 */
    damageLoss2?: string
    /** 生命回复 */
    regenHP?: string
    /** 攻击 1 - 伤害衰减参数 */
    damageLoss1?: string
    /** 单位声音设置 */
    unitSound?: string
    /** 可重生阵亡英雄 */
    Revive?: string
    /** 高度变化 - 采样点数量 */
    elevPts?: string
    /** 护甲类型 */
    defType?: string
    /** 可研究项目 */
    Researches?: string
    /** 攻击 1 - 伤害骰子数量 */
    dice1?: string
    /** 攻击 2 - 伤害骰子数量 */
    dice2?: string
    /** 要求骨骼名 */
    Boneprops?: string
    /** 颜色值(绿) */
    green?: string
    /** 魔法初始数量 */
    mana0?: string
    /** 种族 */
    race?: string
    /** 动画 - 转向角度 */
    propWin?: string
    /** 加强闭塞范围 */
    fatLOS?: string
    /** 能被其他建筑建造 */
    canBuildOn?: string
    /** 提示工具 -唤醒 */
    Awakentip?: string
    /** 最小高度 */
    moveFloor?: string
    /** 分类 - 特殊 */
    special?: string
    /** 组群分离 - 参数 */
    repulseParam?: string
    /** 队伍颜色 */
    teamColor?: string
    /** 转身速度 */
    turnRate?: string
    /** 魔法升级图标 */
    Casterupgradeart?: string
    /** 制造物品 */
    Makeitems?: string
    /** 英雄 - 隐藏英雄死亡信息 */
    hideHeroDeathMsg?: string
    /** 类别 */
    type?: string
    /** 使用科技 */
    upgrades?: string
    /** 路径纹理 */
    pathTex?: string
    /** AI放置类型 */
    buffType?: string
    /** 射弹碰撞偏移 - Z */
    impactZ?: string
    /** 视野范围(白天) */
    sight?: string
    /** 选择圈在水面上 */
    selCircOnWater?: string
    /** 需求 - 等级 3 */
    Requires2?: string
    /** 攻击 2 - 穿透伤害距离 */
    spillDist2?: string
    /** 需求 - 等级 2 */
    Requires1?: string
    /** 闭塞高度 */
    occH?: string
    /** 允许睡眠 */
    canSleep?: string
    /** 攻击 1 - 显示UI */
    showUI1?: string
    /** 英雄 - 隐藏英雄栏图标 */
    hideHeroBar?: string
    /** 攻击 2 - 显示UI */
    showUI2?: string
    /** 阴影图像 - 高度 */
    shadowH?: string
    /** 说明 */
    Description?: string
    /** 黄金消耗 */
    goldcost?: string
    /** X轴最大旋转角度(度数) */
    maxPitch?: string
    /** 队形排列 */
    formation?: string
    /** 可在编辑器中放置 */
    inEditor?: string
    /** 阴影图像 - X轴偏移 */
    shadowX?: string
    /** 阴影图像 - Y轴偏移 */
    shadowY?: string
    /** 能建造在其他建筑上 */
    isBuildOn?: string
    /** 攻击 2 - 中伤害参数 */
    Hfact2?: string
    /** 攻击 1 - 中伤害参数 */
    Hfact1?: string
    /** 魔法回复 */
    regenMana?: string
    /** 修理木材消耗 */
    lumberRep?: string
    /** 阴影图像 - 宽度 */
    shadowW?: string
    /** 魔法升级说明 */
    Casterupgradetip?: string
    /** 动画 - 转向补正 */
    orientInterp?: string
    /** 要求动画名 - 附加动画 */
    Attachmentanimprops?: string
    /** 模型缩放 */
    modelScale?: string
    /** 可以逃跑 */
    canFlee?: string
    /** 使用点击帮助 */
    useClickHelper?: string
    /** 魔法升级名字 */
    Casterupgradename?: string
    /** 放置要求 */
    preventPlace?: string
    /** 木材奖励 - 骰子面数 */
    lumberbountysides?: string
    /** 缩放投射物 */
    scaleBull?: string
    /** 有地形指定数据 */
    tilesetSpecific?: string
    /** 选择圈高度 */
    selZ?: string
    /** 组群分离 - 组号 */
    repulseGroup?: string
    /** 地形设置 */
    tilesets?: string
    /** 从属等价物 */
    DependencyOr?: string
    /** 射弹偏移 - Z (深水) */
    launchSwimZ?: string
    /** 放置不允许 */
    requirePlace?: string
    /** 中立建筑 - 可作为随机建筑 */
    nbrandom?: string
    /** 默认主动技能 */
    auto?: string
    /** 攻击 2 - 伤害骰子面数 */
    sides2?: string
    /** 攻击 1 - 伤害骰子面数 */
    sides1?: string
    /** 攻击 2 - 基础伤害 */
    dmgplus2?: string
    /** 单位附加值 */
    points?: string
    /** 放置要求距离水的范围 */
    requireWaterRadius?: string
    /** 攻击 2 - 中伤害范围 */
    Harea2?: string
    /** 攻击 1 - 中伤害范围 */
    Harea1?: string
    /** 攻击 1 - 小伤害参数 */
    Qfact1?: string
    /** 攻击 2 - 小伤害参数 */
    Qfact2?: string
    /** 修理时间 */
    reptm?: string
    /** 建筑 */
    BuildingSoundLabel?: string
    /** 黄金奖励 - 骰子数量 */
    bountydice?: string
    /** 高度变化 - 采样范围 */
    elevRad?: string
    /** 动画 - 魔法施放回复 */
    castbsw?: string
    /** 最小攻击范围 */
    minRange?: string
    /** 攻击 1 -最大目标数 */
    targCount1?: string
    /** 攻击 2 -最大目标数 */
    targCount2?: string
    /** 攻击 1 - 穿透伤害范围 */
    spillRadius1?: string
    /** 死亡时间(秒) */
    death?: string
    /** 攻击 2 - 穿透伤害范围 */
    spillRadius2?: string
    /** 动画 - 混合时间(秒) */
    blend?: string
    /** 目标效果 */
    Targetart?: string
    /** 缩放 */
    scale?: string
    /** 循环淡出率 */
    LoopingSoundFadeOut?: string
    /** 要求附加动画链接名 */
    Attachmentlinkprops?: string
    /** 攻击 1 - 伤害升级奖励 */
    dmgUp1?: string
    /** 攻击 2 - 伤害升级奖励 */
    dmgUp2?: string
    /** 循环淡入率 */
    LoopingSoundFadeIn?: string
    /** 视野范围(夜晚) */
    nsight?: string
    /** 建筑地面纹理 */
    uberSplat?: string
    /** 木材奖励 - 基础值 */
    lumberbountyplus?: string
    /** 是一个建筑 */
    isbldg?: string
    /** 攻击 1 - 攻击范围缓冲 */
    RngBuff1?: string
    /** 英雄 - 隐藏小地图英雄显示 */
    hideHeroMinimap?: string
    /** 攻击 1 - 穿透伤害距离 */
    spillDist1?: string
    /** 木材奖励 - 骰子数量 */
    lumberbountydice?: string
    /** 攻击 2 - 攻击范围缓冲 */
    RngBuff2?: string
    /** 模型文件 - 版本 */
    fileVerFlags?: string
    /** 购买开始时间 */
    stockStart?: string
    /** 最大库存量 */
    stockMax?: string
    /** 攻击 1 - 攻击范围 */
    rangeN1?: string
    /** 中立建筑 - 显示小地图标记 */
    nbmmIcon?: string
    /** 攻击 2 - 攻击范围 */
    rangeN2?: string
    /** 移动 */
    MovementSoundLabel?: string
    /** 图标 - 计分屏 */
    ScoreScreenIcon?: string
    /** 阴影图像(单位) */
    unitShadow?: string
    /** 队伍颜色 - 允许自定义 */
    customTeamColor?: string
    /** 编辑器后缀 */
    EditorSuffix?: string
    /** 动画 - 行走速度 */
    walk?: string
    /** 动画 - 魔法施放点 */
    castpt?: string
}


declare type upobj = {
    [key: string]: string
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** code */
    code?: string
    /** 效果 4 */
    code4?: string
    /** 效果 3 */
    code3?: string
    /** 效果 4 */
    mod4?: string
    /** 图标 - 普通 */
    Art?: string
    /** 效果 2 */
    code2?: string
    /** 效果 3 */
    mod3?: string
    /** 效果 1 */
    code1?: string
    /** 效果 2 */
    mod2?: string
    /** 只应用于之后生产的单位 */
    global?: string
    /** 按钮位置 - 普通 (X) */
    Buttonpos_1?: string
    /** 按钮位置 - 普通 (Y) */
    Buttonpos_2?: string
    /** 每等级增加黄金 */
    goldmod?: string
    /** 名字 */
    Name?: string
    /** 基础木材消耗 */
    lumberbase?: string
    /** 效果 3 */
    base3?: string
    /** 效果 4 */
    base4?: string
    /** 效果 1 */
    base1?: string
    /** 效果 2 */
    base2?: string
    /** 基础黄金消耗 */
    goldbase?: string
    /** 每等级增加木材 */
    lumbermod?: string
    /** 效果 1 */
    mod1?: string
    /** 物品分类 */
    class?: string
    /** 等级 */
    maxlevel?: string
    /** 种族 */
    race?: string
    /** 需求值 */
    Requiresamount?: string
    /** 需求 */
    Requires?: string
    /** 基础时间消耗 */
    timebase?: string
    /** 提示工具 - 普通 - 扩展 */
    Ubertip?: string
    /** 效果 1 */
    effect1?: string
    /** 效果 2 */
    effect2?: string
    /** 效果 3 */
    effect3?: string
    /** 效果 4 */
    effect4?: string
    /** 可随单位转移所有者 */
    inherit?: string
    /** 提示工具 - 普通 */
    Tip?: string
    /** 每等级增加时间 */
    timemod?: string
    /** 编辑器后缀 */
    EditorSuffix?: string
    /** 热键 - 普通 */
    Hotkey?: string

}

declare type bobj = {
    [key: string]: string
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** code */
    code?: string
    /** 效果 - 目标附加点1 */
    Targetattach?: string
    /** 效果 - 目标附加点2 */
    Targetattach1?: string
    /** 效果 - 目标附加点3 */
    Targetattach2?: string
    /** 效果 - 目标附加点4 */
    Targetattach3?: string
    /** 效果 - 射弹弧度 */
    Missilearc?: string
    /** 效果 - 目标附加点5 */
    Targetattach4?: string
    /** 工具提示 */
    Bufftip?: string
    /** 效果 - 目标附加点6 */
    Targetattach5?: string
    /** 效果显示需求 */
    Spelldetail?: string
    /** 是区域效果 */
    isEffect?: string
    /** 效果 - 射弹自导允许 */
    MissileHoming?: string
    /** 效果 - 目标点 */
    EffectArt?: string
    /** 效果 - 目标 - 附加数量 */
    Targetattachcount?: string
    /** 效果 - 射弹速度 */
    Missilespeed?: string
    /** 效果 - 投射物图像 */
    Missileart?: string
    /** 图标 */
    Buffart?: string
    /** 效果 -特殊 */
    SpecialArt?: string
    /** 种族 */
    race?: string
    /** 音效(循环) */
    Effectsoundlooped?: string
    /** 效果 - 目标 */
    TargetArt?: string
    /** 效果 -特殊附加点 */
    Specialattach?: string
    /** 名字(编辑器) */
    EditorName?: string
    /** 工具提示 - 扩展 */
    Buffubertip?: string
    /** 效果 - 闪电效果 */
    LightningEffect?: string
    /** 音效 */
    Effectsound?: string
    /** 编辑器后缀 */
    EditorSuffix?: string
    /** 效果 - 点目标附加点 */
    Effectattach?: string


}
declare type deobj = {
    [key: string]: string
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** code */
    code?: string
    /** 小地图颜色(绿) */
    MMGreen?: string
    /** 颜色值(蓝) */
    colorB?: string
    /** 阴影 */
    shadow?: string
    /** 飞越高度 */
    flyH?: string
    /** 游戏中可选择 */
    selectable?: string
    /** 生命值 */
    HP?: string
    /** 迷雾范围 */
    fogRadius?: string
    /** 路径纹理(死亡) */
    pathTexDeath?: string
    /** 名字 */
    Name?: string
    /** 替换纹理ID */
    texID?: string
    /** 路径纹理 */
    pathTex?: string
    /** 小地图 - 使用自定义颜色 */
    useMMColor?: string
    /** 模型文件 - 样式总数 */
    numVar?: string
    /** 高度变化 - 采样范围 */
    radius?: string
    /** 作为目标类型 */
    targType?: string
    /** 选择圈大小(编辑器) */
    selSize?: string
    /** 建造时间 */
    buildTime?: string
    /** 悬崖高度 */
    cliffHeight?: string
    /** 闭塞高度 */
    occH?: string
    /** 替换纹理文件 */
    texFile?: string
    /** 小地图颜色(红) */
    MMRed?: string
    /** 死亡 */
    deathSnd?: string
    /** 修理金子消耗 */
    goldRep?: string
    /** 装甲类型 */
    armor?: string
    /** 模型文件 - 头像 */
    portraitmodel?: string
    /** 选择圈大小(游戏) */
    selcircsize?: string
    /** 面板显示死亡版本 */
    canPlaceDead?: string
    /** X轴最大旋转角度(度数) */
    maxPitch?: string
    /** Y轴最大旋转角度(度数) */
    maxRoll?: string
    /** 模型文件 - 有附属模型 */
    lightweight?: string
    /** 可以放置随机比例 */
    canPlaceRandScale?: string
    /** 模型文件 */
    file?: string
    /** 悬崖上可放置 */
    onCliffs?: string
    /** 迷雾中可见动画 */
    fogVis?: string
    /** 小地图颜色(蓝) */
    MMBlue?: string
    /** 最小比例 */
    minScale?: string
    /** 修理木材消耗 */
    lumberRep?: string
    /** 加入用户指定列表 */
    UserList?: string
    /** 最大比例 */
    maxScale?: string
    /** 可通行 */
    walkable?: string
    /** 固定角度 */
    fixedRot?: string
    /** 小地图 - 显示 */
    showInMM?: string
    /** 使用点击帮助 */
    useClickHelper?: string
    /** 加强闭塞范围 */
    fatLOS?: string
    /** 颜色值(红) */
    colorR?: string
    /** 有地形指定数据 */
    tilesetSpecific?: string
    /** 修理时间 */
    repairTime?: string
    /** 水面可放置 */
    onWater?: string
    /** 地形设置 */
    tilesets?: string
    /** 编辑器后缀 */
    EditorSuffix?: string
    /** 颜色值(绿) */
    colorG?: string
    /** 类别 */
    category?: string


}

declare type dobj = {
    [key: string]: string
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** code */
    code?: string
    /** 小地图颜色(绿) */
    MMGreen?: string
    /** 阴影 */
    shadow?: string
    /** X轴最大旋转角度(度数) */
    maxPitch?: string
    /** 迷雾中显示 */
    showInFog?: string
    /** Y轴最大旋转角度(度数) */
    maxRoll?: string
    /** 名字 */
    Name?: string
    /** 路径纹理 */
    pathTex?: string
    /** 小地图 - 使用自定义颜色 */
    useMMColor?: string
    /** 可以放置随机比例 */
    canPlaceRandScale?: string
    /** 模型文件 */
    file?: string
    /** 可见范围 */
    visRadius?: string
    /** 悬崖上可放置 */
    onCliffs?: string
    /** 颜色值(绿) */
    vertG?: string
    /** 模型文件 - 样式总数 */
    numVar?: string
    /** 小地图颜色(蓝) */
    MMBlue?: string
    /** 忽略模型点击 */
    ignoreModelClick?: string
    /** 最小比例 */
    minScale?: string
    /** 默认比例 */
    defScale?: string
    /** 加入用户指定列表 */
    UserList?: string
    /** 迷雾中显示动画 */
    animInFog?: string
    /** 颜色值(蓝) */
    vertB?: string
    /** 循环声音 */
    soundLoop?: string
    /** 漂浮 */
    floats?: string
    /** 最大比例 */
    maxScale?: string
    /** 选择圈大小(编辑器) */
    selSize?: string
    /** 可通行 */
    walkable?: string
    /** 固定角度 */
    fixedRot?: string
    /** 小地图 - 显示 */
    showInMM?: string
    /** 使用点击帮助 */
    useClickHelper?: string
    /** 颜色值(红) */
    vertR?: string
    /** 小地图颜色(红) */
    MMRed?: string
    /** 有地形指定数据 */
    tilesetSpecific?: string
    /** 水面可放置 */
    onWater?: string
    /** 地形设置 */
    tilesets?: string
    /** 类别 */
    category?: string

}


declare type aobj = {
    [key: string]: string
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** code */
    code?: string
    /** 效果 - 射弹弧度 */
    Missilearc?: string
    /** 提示工具 - 学习 - 扩展 */
    Researchubertip?: string
    /** 区域持续效果 */
    EfctID?: string
    /** 施法距离 */
    Rng?: string
    /** 按钮位置xy 在w3x地图运行时为此字符格式： "1,2"  */
    Buttonpos?: string
    /** 按钮位置 - 普通 (X) */
    Buttonpos_1?: string
    /** 按钮位置 - 普通 (Y) */
    Buttonpos_2?: string
    /** 魔法效果 */
    BuffID?: string
    /** 名字 */
    Name?: string
    /** 热键 -关闭 */
    Unhotkey?: string
    /** 持续时间 - 英雄 */
    HeroDur?: string
    /** 效果 - 射弹自导允许 */
    MissileHoming?: string
    /** 热键 - 学习 */
    Researchhotkey?: string
    /** 效果 - 目标点 */
    EffectArt?: string
    /** 效果 - 目标 - 附加数量 */
    Targetattachcount?: string
    /** 效果 - 投射物图像 */
    Missileart?: string
    /** 效果 - 施法者 - 附加数量 */
    Casterattachcount?: string
    /** 图标 - 学习 */
    ResearchArt?: string
    /** 命令串 - 使用/打开 */
    Order?: string
    /** 物品 */
    item?: string
    /** 提示工具 -关闭 */
    Untip?: string
    /** 需求 */
    Requires?: string
    /** 效果 - 目标 */
    TargetArt?: string
    /** 效果 - 施法者 */
    CasterArt?: string
    /** 魔法偷取优先权 */
    priority?: string
    /** 按钮位置 - 研究 (X) */
    Researchbuttonpos_1?: string
    /** 提示工具 - 普通 - 扩展 */
    Ubertip?: string
    /** 影响区域 */
    Area?: string
    /** 按钮位置 - 研究 (Y) */
    Researchbuttonpos_2?: string
    /** 效果 - 施法者附加点1 */
    Casterattach?: string
    /** 提示工具 - 学习 */
    Researchtip?: string
    /** 提示工具 -关闭 - 扩展 */
    Unubertip?: string
    /** 热键 - 普通 */
    Hotkey?: string
    /** 魔法施放时间 */
    Cast?: string
    /** 目标允许 */
    targs?: string
    /** 效果 - 目标附加点1 */
    Targetattach?: string
    /** 效果 - 区域 */
    Areaeffectart?: string
    /** 图标 - 普通 */
    Art?: string
    /** 效果 - 目标附加点2 */
    Targetattach1?: string
    /** 效果 - 目标附加点3 */
    Targetattach2?: string
    /** 效果 - 目标附加点4 */
    Targetattach3?: string
    /** 效果 - 目标附加点5 */
    Targetattach4?: string
    /** 效果 - 目标附加点6 */
    Targetattach5?: string
    /** 命令串 - 激活 */
    Orderon?: string
    /** 魔法施放时间间隔 */
    Cool?: string
    /** 英雄 */
    hero?: string
    /** 等级要求 */
    reqLevel?: string
    /** 魔法消耗 */
    Cost?: string
    /** 命令串 - 关闭 */
    Unorder?: string
    /** DataF */
    DataF?: string
    /** DataG */
    DataG?: string
    /** 按钮位置 - 关闭 (Y) */
    UnButtonpos_2?: string
    /** DataH */
    DataH?: string
    /** DataI */
    DataI?: string
    /** DataB */
    DataB?: string
    /** 按钮位置 - 关闭 (X) */
    UnButtonpos_1?: string
    /** DataC */
    DataC?: string
    /** DataD */
    DataD?: string
    /** DataE */
    DataE?: string
    /** 效果 - 射弹速度 */
    Missilespeed?: string
    /** DataA */
    DataA?: string
    /** 效果 -特殊 */
    SpecialArt?: string
    /** 持续时间 - 普通 */
    Dur?: string
    /** 跳级要求 */
    levelSkip?: string
    /** 种族 */
    race?: string
    /** 音效(循环) */
    Effectsoundlooped?: string
    /** 需求值 */
    Requiresamount?: string
    /** 效果 -特殊附加点 */
    Specialattach?: string
    /** 图标 -关闭 */
    Unart?: string
    /** 命令串 - 取消激活 */
    Orderoff?: string
    /** 召唤单位类型 */
    UnitID?: string
    /** 效果 - 闪电效果 */
    LightningEffect?: string
    /** 音效 */
    Effectsound?: string
    /** 提示工具 - 普通 */
    Tip?: string
    /** 编辑器后缀 */
    EditorSuffix?: string
    /** 效果 - 施法动作 */
    Animnames?: string
    /** 检查等价所属 */
    checkDep?: string
    /** 等级 */
    levels?: string

}


declare type iobj = {
    [key: string]: string
    /** id */
    id?: string
    /** 父id */
    _parent?: string
    /** 持有者死亡时掉落 */
    drop?: string
    /** 捡取时自动使用 */
    powerup?: string
    /** 颜色值(蓝) */
    colorB?: string
    /** 图标 - 普通 */
    Art?: string
    /** 说明 */
    Description?: string
    /** 黄金消耗 */
    goldcost?: string
    /** 生命值 */
    HP?: string
    /** CD间隔组 */
    cooldownID?: string
    /** 缩放 */
    scale?: string
    /** 木材消耗 */
    lumbercost?: string
    /** 可被市场出售 */
    sellable?: string
    /** 按钮位置 - 普通 (X) */
    Buttonpos_1?: string
    /** 按钮位置 - 普通 (Y) */
    Buttonpos_2?: string
    /** 名字 */
    Name?: string
    /** 主动使用 */
    usable?: string
    /** 模型文件 */
    file?: string
    /** 等级(旧版) */
    oldLevel?: string
    /** 优先权 */
    prio?: string
    /** 物品分类 */
    class?: string
    /** 使用完会消失 */
    perishable?: string
    /** 选择圈大小(编辑器) */
    selSize?: string
    /** 购买开始时间 */
    stockStart?: string
    /** 需求 */
    Requires?: string
    /** 最大库存量 */
    stockMax?: string
    /** 可以被抵押 */
    pawnable?: string
    /** 提示工具 - 普通 - 扩展 */
    Ubertip?: string
    /** 可以丢弃 */
    droppable?: string
    /** 无视CD间隔 */
    ignoreCD?: string
    /** 颜色值(红) */
    colorR?: string
    /** 购买时间间隔 */
    stockRegen?: string
    /** 装甲类型 */
    armor?: string
    /** 技能 */
    abilList?: string
    /** 等级 */
    Level?: string
    /** 提示工具 - 普通 */
    Tip?: string
    /** 颜色值(绿) */
    colorG?: string
    /** 使用次数 */
    uses?: string
    /** 有效的物品转换目标 */
    morph?: string
    /** 可作为随机物品 */
    pickRandom?: string
    /** 热键 - 普通 */
    Hotkey?: string
}
