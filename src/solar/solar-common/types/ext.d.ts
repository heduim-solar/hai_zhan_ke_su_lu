/** @noSelfInFile **/

/**
 * made by solar
 */
/**
 * 显示Debug消息[C]
 */
declare function BJDebugMsg(msg: string): void;

/**
 * 最小值
 */
declare function RMinBJ(a: number, b: number): number;

/**
 * 最大值
 */
declare function RMaxBJ(a: number, b: number): number;

/**
 * 绝对值Abs
 */
declare function RAbsBJ(a: number): number;

/**
 * 标记
 */
declare function RSignBJ(a: number): number;

/**
 * 取最小值
 */
declare function IMinBJ(a: number, b: number): number;

/**
 * 取最大值
 */
declare function IMaxBJ(a: number, b: number): number;

/**
 * 绝对值Abs
 */
declare function IAbsBJ(a: number): number;

/**
 * 标记
 */
declare function ISignBJ(a: number): number;

/**
 * 正弦
 */
declare function SinBJ(degrees: number): number;

/**
 * 余弦
 */
declare function CosBJ(degrees: number): number;

/**
 * 正切
 */
declare function TanBJ(degrees: number): number;

/**
 * 反正弦
 */
declare function AsinBJ(degrees: number): number;

/**
 * 反余弦
 */
declare function AcosBJ(degrees: number): number;

/**
 * 反正切 (From Angle)
 */
declare function AtanBJ(degrees: number): number;

/**
 * 和正半轴角度
 */
declare function Atan2BJ(y: number, x: number): number;

/**
 * 两个坐标之间的角度
 */
declare function AngleBetweenPoints(locA: location, locB: location): number;

/**
 * 坐标之间的距离
 */
declare function DistanceBetweenPoints(locA: location, locB: location): number;

/**
 * 点向方向 位移
 */
declare function PolarProjectionBJ(source: location, dist: number, angle: number): location;

/**
 * 随机角度
 */
declare function GetRandomDirectionDeg(): number;

/**
 * 随机百分数
 */
declare function GetRandomPercentageBJ(): number;

/**
 * 区域内的随机地点
 */
declare function GetRandomLocInRect(whichRect: rect): location;

/**
 * Calculate the modulus/remainder of (dividend) divided by (divisor).
 */
/**
 * Examples:  18 mod 5 = 3.  15 mod 5 = 0.  -8 mod 5 = 2.
 */

//
/**
 * 取余数
 */
declare function ModuloInteger(dividend: number, divisor: number): number;

/**
 * Calculate the modulus/remainder of (dividend) divided by (divisor).
 */
/**
 * Examples:  13.000 mod 2.500 = 0.500.  -6.000 mod 2.500 = 1.500.
 */

//
/**
 * 取余数
 */
declare function ModuloReal(dividend: number, divisor: number): number;

/**
 * 点的坐标
 */
declare function OffsetLocation(loc: location, dx: number, dy: number): location;

/**
 * 区域位移
 */
declare function OffsetRectBJ(r: rect, dx: number, dy: number): rect;

/**
 * 将点,大小转换为区域
 */
declare function RectFromCenterSizeBJ(center: location, width: number, height: number): rect;

/**
 * 矩形是否包含坐标
 */
declare function RectContainsCoords(r: rect, x: number, y: number): boolean;

/**
 * 区域是否包含点
 */
declare function RectContainsLoc(r: rect, loc: location): boolean;

/**
 * 单位在区域
 */
declare function RectContainsUnit(r: rect, whichUnit: unit): boolean;

/**
 * 物品在区域
 */
declare function RectContainsItem(whichItem: item, r: rect): boolean;

//***************************************************************************
//*
//*  Utility Constructs
//*
//***************************************************************************
/**
 * Runs the trigger's actions if the trigger's conditions evaluate to true.
 */

//
/**
 * 运行触发器 (检查条件)
 */
declare function ConditionalTriggerExecute(trig: trigger): void;

/**
 * Runs the trigger's actions if the trigger's conditions evaluate to true.
 */

//
/**
 * 运行触发器
 */
declare function TriggerExecuteBJ(trig: trigger, checkConditions: boolean): boolean;

/**
 * Arranges for a trigger to fire almost immediately, except that the calling
 */
/**
 * trigger is not interrupted as is the case with a TriggerExecute call.
 */
/**
 * Since the trigger executes normally, its conditions are still evaluated.
 */

//
/**
 * 执行触发器
 */
declare function PostTriggerExecuteBJ(trig: trigger, checkConditions: boolean): boolean;

/**
 * Debug - Display the contents of the trigger queue (as either null or "x"
 */

/**
 * for each entry).
 */
/**
 * 队列触发器检查
 */
declare function QueuedTriggerCheck(): void;

/**
 * Searches the queue for a given trigger, returning the index of the
 */
/**
 * trigger within the queue if it is found, or -1 if it is not found.
 */
//
/**
 * 队列中获取触发器下标
 */
/**
 * Determine which, if any, of the queued triggers is being removed.
 */
declare function QueuedTriggerGetIndex(trig: trigger): number;

/**
 * Removes a trigger from the trigger queue, shifting other triggers down
 */
/**
 * to fill the unused space.  If the currently running trigger is removed
 */
/**
 * in this manner, this function does NOT attempt to run the next trigger.
 */

//
/**
 * 队列中移除下标对应的触发器
 */
declare function QueuedTriggerRemoveByIndex(trigIndex: number): boolean;

/**
 * Attempt to execute the first trigger in the queue.  If it fails, remove
 */
/**
 * it and execute the next one.  Continue this cycle until a trigger runs,
 */
/**
 * or until the queue is empty.
 */

//
/**
 * 队列中尝试执行触发器
 */
declare function QueuedTriggerAttemptExec(): boolean;

/**
 * Queues a trigger to be executed, assuring that such triggers are not
 */
/**
 * executed at the same time.
 */
//
/**
 * 增加触发器到队列
 */
/**
 * Make sure our queue isn't full.  If it is, return failure.
 */
declare function QueuedTriggerAddBJ(trig: trigger, checkConditions: boolean): boolean;

/**
 * Denotes the end of a queued trigger. Be sure to call this only once per
 */
/**
 * queued trigger, or risk stepping on the toes of other queued triggers.
 */

//
/**
 * 清除触发器队列
 */
declare function QueuedTriggerRemoveBJ(trig: trigger): void;

/**
 * Denotes the end of a queued trigger. Be sure to call this only once per
 */
/**
 * queued trigger, lest you step on the toes of other queued triggers.
 */

//
/**
 * 触发器队列完成
 */
declare function QueuedTriggerDoneBJ(): void;

/**
 * Empty the trigger queue.
 */

//
/**
 * 清除触发器所有队列
 */
declare function QueuedTriggerClearBJ(): void;

/**
 * Remove all but the currently executing trigger from the trigger queue.
 */

//
/**
 * 清除触发器队列中未执行任务
 */
declare function QueuedTriggerClearInactiveBJ(): void;

/**
 * 触发器队列中触发器的数量
 */
declare function QueuedTriggerCountBJ(): number;

/**
 * 触发器队列是空的
 */
declare function IsTriggerQueueEmptyBJ(): boolean;

/**
 * 触发器在队列中
 */
declare function IsTriggerQueuedBJ(trig: trigger): boolean;

/**
 * 循环整数 A
 */
declare function GetForLoopIndexA(): number;

/**
 * 设置循环索引 A
 */
declare function SetForLoopIndexA(newIndex: number): void;

/**
 * 循环整数 B
 */
declare function GetForLoopIndexB(): number;

/**
 * 设置循环索引 B
 */
declare function SetForLoopIndexB(newIndex: number): void;

/**
 * We can't do game-time waits, so this simulates one by starting a timer
 */

/**
 * and polling until the timer expires.
 */
/**
 * 等待 (游戏时间)
 */
declare function PolledWait(duration: number): void;

declare function IntegerTertiaryOp(flag: boolean, valueA: number, valueB: number): number;

//***************************************************************************
//*
//*  General Utility Functions
//*  These functions exist purely to make the trigger dialogs cleaner and
//*  more comprehensible.
//*
//***************************************************************************
/**
 * 不做任何动作
 */
declare function DoNothing(): void;

/**
 * This function does nothing.  WorldEdit should should eventually ignore
 */
/**
 * CommentString triggers during script generation, but until such a time,
 */
/**
 * this function will serve as a stub.
 */

//
/**
 * 注释
 */
declare function CommentString(commentString: string): void;

/**
 * This function returns the input string, converting it from the localized text, if necessary
 */

//
/**
 * 格式化字串符
 */
declare function StringIdentity(theString: string): string;

/**
 * 条件A和条件B    比较
 */
declare function GetBooleanAnd(valueA: boolean, valueB: boolean): boolean;

/**
 * 条件A或条件B    比较
 */
declare function GetBooleanOr(valueA: boolean, valueB: boolean): boolean;

/**
 * Converts a percentage (real, 0..100) into a scaled integer (0..max),
 */
/**
 * clipping the result to 0..max in case the input is invalid.
 */

//
/**
 * 百分比轉換為整數
 */
declare function PercentToInt(percentage: number, max: number): number;

/**
 * 百分比小数(0-1)转(0-255)
 */
declare function PercentTo255(percentage: number): number;

/**
 * 游戏当前的时间
 */
declare function GetTimeOfDay(): number;

/**
 * 设置游戏的时间
 */
declare function SetTimeOfDay(whatTime: number): void;

/**
 * 设置时间流逝速度
 */
declare function SetTimeOfDayScalePercentBJ(scalePercent: number): void;

/**
 * 游戏时间的速度
 */
declare function GetTimeOfDayScalePercentBJ(): number;

/**
 * 播放声音
 */
declare function PlaySound(soundName: string): void;

/**
 * 比对两个点是否是同一个
 */
declare function CompareLocationsBJ(A: location, B: location): boolean;

/**
 * 比对两个矩形是否是同一个
 */
declare function CompareRectsBJ(A: rect, B: rect): boolean;

/**
 * Returns a square rect that exactly encompasses the specified circle.
 */

//
/**
 * 内切圆矩形
 */
declare function GetRectFromCircleBJ(center: location, radius: number): rect;

//***************************************************************************
//*
//*  Camera Utility Functions
//*
//***************************************************************************
/**
 * 当前的视角
 */
declare function GetCurrentCameraSetup(): camerasetup;

/**
 * 应用摄像机 (限时)
 */
declare function CameraSetupApplyForPlayer(doPan: boolean, whichSetup: camerasetup, whichPlayer: player, duration: number): void;

declare function CameraSetupApplyForPlayerSmooth(doPan: boolean, whichSetup: camerasetup, whichPlayer: player, forcedDuration: number, easeInDuration: number, easeOutDuration: number, smoothFactor: number): void;

/**
 * 摄像机的数值
 */
declare function CameraSetupGetFieldSwap(whichField: camerafield, whichSetup: camerasetup): number;

/**
 * 设定摄像机属性 (限时)
 */
declare function SetCameraFieldForPlayer(whichPlayer: player, whichField: camerafield, value: number, duration: number): void;

/**
 * 锁定摄像机目标到单位
 */
declare function SetCameraTargetControllerNoZForPlayer(whichPlayer: player, whichUnit: unit, xoffset: number, yoffset: number, inheritOrientation: boolean): void;

/**
 * 设置玩家的镜头位置
 */
declare function SetCameraPositionForPlayer(whichPlayer: player, x: number, y: number): void;

/**
 * 设置玩家的镜头位置
 */
declare function SetCameraPositionLocForPlayer(whichPlayer: player, loc: location): void;

/**
 * 旋转摄像机 (限时)
 */
declare function RotateCameraAroundLocBJ(degrees: number, loc: location, whichPlayer: player, duration: number): void;

/**
 * 平移摄像机
 */
declare function PanCameraToForPlayer(whichPlayer: player, x: number, y: number): void;

/**
 * 平移摄像机
 */
declare function PanCameraToLocForPlayer(whichPlayer: player, loc: location): void;

/**
 * 平移摄像机 定时
 */
declare function PanCameraToTimedForPlayer(whichPlayer: player, x: number, y: number, duration: number): void;

/**
 * 平移摄像机 (限时)
 */
declare function PanCameraToTimedLocForPlayer(whichPlayer: player, loc: location, duration: number): void;

/**
 * 在指定高度平移摄像机 (限时)
 */
declare function PanCameraToTimedLocWithZForPlayer(whichPlayer: player, loc: location, zOffset: number, duration: number): void;

/**
 * 必要时平移摄像机 (限时)
 */
declare function SmartCameraPanBJ(whichPlayer: player, loc: location, duration: number): void;

/**
 * 播放动画摄像机
 */
declare function SetCinematicCameraForPlayer(whichPlayer: player, cameraModelFile: string): void;

/**
 * 重置游戏摄像机
 */
declare function ResetToGameCameraForPlayer(whichPlayer: player, duration: number): void;

/**
 * 摇摆摄像机来源
 */
declare function CameraSetSourceNoiseForPlayer(whichPlayer: player, magnitude: number, velocity: number): void;

/**
 * 摇摆摄像机目标
 */
declare function CameraSetTargetNoiseForPlayer(whichPlayer: player, magnitude: number, velocity: number): void;

/**
 * 摇动摄像机
 */
declare function CameraSetEQNoiseForPlayer(whichPlayer: player, magnitude: number): void;

/**
 * 停止 摇摆/摇动 摄像机
 */
declare function CameraClearNoiseForPlayer(whichPlayer: player): void;

/**
 * Query the current camera bounds.
 */

//
/**
 * 当前的摄象机范围
 */
declare function GetCurrentCameraBoundsMapRectBJ(): rect;

/**
 * Query the initial camera bounds, as defined at map init.
 */

//
/**
 * 初始游戏时的摄象机范围
 */
declare function GetCameraBoundsMapRect(): rect;

/**
 * Query the playable map area, as defined at map init.
 */

//
/**
 * 可玩的地图区域
 */
declare function GetPlayableMapRect(): rect;

/**
 * Query the entire map area, as defined at map init.
 */

//
/**
 * 全地图
 */
declare function GetEntireMapRect(): rect;

/**
 * 设置摄像机边界
 */
declare function SetCameraBoundsToRect(r: rect): void;

/**
 * 设置镜头范围
 */
declare function SetCameraBoundsToRectForPlayerBJ(whichPlayer: player, r: rect): void;

/**
 * 调整相机边界
 */
declare function AdjustCameraBoundsBJ(adjustMethod: number, dxWest: number, dxEast: number, dyNorth: number, dySouth: number): void;

/**
 * 扩展/收缩摄像绑定
 */
declare function AdjustCameraBoundsForPlayerBJ(adjustMethod: number, whichPlayer: player, dxWest: number, dxEast: number, dyNorth: number, dySouth: number): void;

/**
 * 设置相机位置 (快速)
 */
declare function SetCameraQuickPositionForPlayer(whichPlayer: player, x: number, y: number): void;

/**
 * 设置空格点击 切换镜头目标
 */
/**
 * 设置相机位置 (快速)
 */
declare function SetCameraQuickPositionLocForPlayer(whichPlayer: player, loc: location): void;

declare function SetCameraQuickPositionLoc(loc: location): void;

/**
 * 停止摄像机
 */
declare function StopCameraForPlayerBJ(whichPlayer: player): void;

/**
 * 锁定摄像机方向到单位
 */
declare function SetCameraOrientControllerForPlayerBJ(whichPlayer: player, whichUnit: unit, xoffset: number, yoffset: number): void;

/**
 * 改变摄像机平滑参数
 */
declare function CameraSetSmoothingFactorBJ(factor: number): void;

/**
 * 重置摄像机平滑参数
 */
declare function CameraResetSmoothingFactorBJ(): void;

//***************************************************************************
//*
//*  Text Utility Functions
//*
//***************************************************************************
/**
 * 文本消息(自动计时)
 */
declare function DisplayTextToForce(toForce: force, message: string): void;

/**
 * 文本消息(指定计时)
 */
declare function DisplayTimedTextToForce(toForce: force, duration: number, message: string): void;

/**
 * 清空文本信息
 */
declare function ClearTextMessagesBJ(toForce: force): void;

/**
 * The parameters for the API Substring function are unintuitive, so this
 */
/**
 * merely performs a translation for the starting index.
 */

//
/**
 * 切割字符串
 */
declare function SubStringBJ(source: string, start: number, end: number): string;

/**
 * 获取句柄整数地址
 */
declare function GetHandleIdBJ(h: handle): number;

/**
 * 字符串哈希
 */
declare function StringHashBJ(s: string): number;

//***************************************************************************
//*
//*  Event Registration Utility Functions
//*
//***************************************************************************
/**
 * 循环逝去的时间
 */
declare function TriggerRegisterTimerEventPeriodic(trig: trigger, timeout: number): event;

/**
 * 游戏开始逝去的时间
 */
declare function TriggerRegisterTimerEventSingle(trig: trigger, timeout: number): event;

/**
 * 计时器期满
 */
declare function TriggerRegisterTimerExpireEventBJ(trig: trigger, t: timer): event;

/**
 * 玩家单位的事件
 */
declare function TriggerRegisterPlayerUnitEventSimple(trig: trigger, whichPlayer: player, whichEvent: playerunitevent): event;

/**
 * 单位的事件
 */
declare function TriggerRegisterAnyUnitEventBJ(trig: trigger, whichEvent: playerunitevent): void;

/**
 * 选择单位事件
 */
declare function TriggerRegisterPlayerSelectionEventBJ(trig: trigger, whichPlayer: player, selected: boolean): event;

/**
 * 键盘事件
 */
declare function TriggerRegisterPlayerKeyEventBJ(trig: trigger, whichPlayer: player, keType: number, keKey: number): event;

declare function TriggerRegisterPlayerMouseEventBJ(trig: trigger, whichPlayer: player, meType: number): event;

/**
 * 胜利
 */
declare function TriggerRegisterPlayerEventVictory(trig: trigger, whichPlayer: player): event;

/**
 * 失败
 */
declare function TriggerRegisterPlayerEventDefeat(trig: trigger, whichPlayer: player): event;

/**
 * 玩家离开游戏
 */
declare function TriggerRegisterPlayerEventLeave(trig: trigger, whichPlayer: player): event;

/**
 * 联盟状态改变(任何状态)
 */
declare function TriggerRegisterPlayerEventAllianceChanged(trig: trigger, whichPlayer: player): event;

/**
 * 按ESC键(跳过动画)
 */
declare function TriggerRegisterPlayerEventEndCinematic(trig: trigger, whichPlayer: player): event;

/**
 * 游戏时间改变
 */
declare function TriggerRegisterGameStateEventTimeOfDay(trig: trigger, opcode: limitop, limitval: number): event;

/**
 * 单位-任意单位进入不规则区域
 */
declare function TriggerRegisterEnterRegionSimple(trig: trigger, whichRegion: region): event;

/**
 * 单位-任意单位离开不规则区域
 */
declare function TriggerRegisterLeaveRegionSimple(trig: trigger, whichRegion: region): event;

/**
 * 单位进入区域
 */
declare function TriggerRegisterEnterRectSimple(trig: trigger, r: rect): event;

/**
 * 单位离开区域
 */
declare function TriggerRegisterLeaveRectSimple(trig: trigger, r: rect): event;

/**
 * 两单位之间的距离
 */
declare function TriggerRegisterDistanceBetweenUnits(trig: trigger, whichUnit: unit, condition: boolexpr, range: number): event;

/**
 * 进入单位的范围
 */
declare function TriggerRegisterUnitInRangeSimple(trig: trigger, range: number, whichUnit: unit): event;

/**
 * 单位生命值
 */
declare function TriggerRegisterUnitLifeEvent(trig: trigger, whichUnit: unit, opcode: limitop, limitval: number): event;

/**
 * 单位魔法值
 */
declare function TriggerRegisterUnitManaEvent(trig: trigger, whichUnit: unit, opcode: limitop, limitval: number): event;

/**
 * 对话框按钮点击
 */
declare function TriggerRegisterDialogEventBJ(trig: trigger, whichDialog: dialog): event;

/**
 * 英雄学习技能按钮被点击
 */
declare function TriggerRegisterShowSkillEventBJ(trig: trigger): event;

/**
 * 建造建筑物按钮被点击
 */
declare function TriggerRegisterBuildSubmenuEventBJ(trig: trigger): event;

declare function TriggerRegisterBuildCommandEventBJ(trig: trigger, unitId: number): event;

declare function TriggerRegisterTrainCommandEventBJ(trig: trigger, unitId: number): event;

declare function TriggerRegisterUpgradeCommandEventBJ(trig: trigger, techId: number): event;

declare function TriggerRegisterCommonCommandEventBJ(trig: trigger, order: string): event;

/**
 * 读取游戏
 */
declare function TriggerRegisterGameLoadedEventBJ(trig: trigger): event;

/**
 * 储存游戏
 */
declare function TriggerRegisterGameSavedEventBJ(trig: trigger): event;

/**
 * 注册可破坏物在区域内死亡(矩形区域)
 */
declare function RegisterDestDeathInRegionEnum(): void;

/**
 * 可毁坏物在 区域 死亡
 */
declare function TriggerRegisterDestDeathInRegionEvent(trig: trigger, r: rect): void;

//***************************************************************************
//*
//*  Environment Utility Functions
//*
//***************************************************************************
/**
 * 创造天气效果
 */
declare function AddWeatherEffectSaveLast(where: rect, effectID: number): weathereffect;

/**
 * 最后创建的天气效果
 */
declare function GetLastCreatedWeatherEffect(): weathereffect;

/**
 * 删除天气效果
 */
declare function RemoveWeatherEffectBJ(whichWeatherEffect: weathereffect): void;

/**
 * 创造地域变形 :弹坑
 */
declare function TerrainDeformationCraterBJ(duration: number, permanent: boolean, where: location, radius: number, depth: number): terraindeformation;

/**
 * 创造地域变形: 波纹
 */
declare function TerrainDeformationRippleBJ(duration: number, limitNeg: boolean, where: location, startRadius: number, endRadius: number, depth: number, wavePeriod: number, waveWidth: number): terraindeformation;

/**
 * 创造地域变形: 波
 */
declare function TerrainDeformationWaveBJ(duration: number, source: location, target: location, radius: number, depth: number, trailDelay: number): terraindeformation;

/**
 * 创造地域变形: 随机
 */
declare function TerrainDeformationRandomBJ(duration: number, where: location, radius: number, minDelta: number, maxDelta: number, updateInterval: number): terraindeformation;

/**
 * 停止地域变形
 */
declare function TerrainDeformationStopBJ(deformation: terraindeformation, duration: number): void;

/**
 * 最后创建的可毁坏物
 */
declare function GetLastCreatedTerrainDeformation(): terraindeformation;

/**
 * 创建闪电效果于指定点
 */
declare function AddLightningLoc(codeName: string, where1: location, where2: location): lightning;

/**
 * 删除闪电效果
 */
declare function DestroyLightningBJ(whichBolt: lightning): boolean;

/**
 * 移动闪电效果到指定点
 */
declare function MoveLightningLoc(whichBolt: lightning, where1: location, where2: location): boolean;

/**
 * 闪电的Alpha通道颜色
 */
declare function GetLightningColorABJ(whichBolt: lightning): number;

/**
 * 闪电的红色通道颜色
 */
declare function GetLightningColorRBJ(whichBolt: lightning): number;

/**
 * 闪电的绿色通道颜色
 */
declare function GetLightningColorGBJ(whichBolt: lightning): number;

/**
 * 闪电的蓝色通道颜色
 */
declare function GetLightningColorBBJ(whichBolt: lightning): number;

/**
 * 设置闪电效果颜色
 */
declare function SetLightningColorBJ(whichBolt: lightning, r: number, g: number, b: number, a: number): boolean;

/**
 * 最后创建的闪电效果
 */
declare function GetLastCreatedLightningBJ(): lightning;

/**
 * 技能效果图像
 */
declare function GetAbilityEffectBJ(abilcode: number, t: effecttype, index: number): string;

/**
 * 技能效果音
 */
declare function GetAbilitySoundBJ(abilcode: number, t: soundtype): string;

/**
 * 悬崖的高度
 */
declare function GetTerrainCliffLevelBJ(where: location): number;

/**
 * 地形类型
 */
declare function GetTerrainTypeBJ(where: location): number;

/**
 * 地形形态
 */
declare function GetTerrainVarianceBJ(where: location): number;

/**
 * 改变地形类型
 */
declare function SetTerrainTypeBJ(where: location, terrainType: number, variation: number, area: number, shape: number): void;

/**
 * 地形是否为对应路径
 */
declare function IsTerrainPathableBJ(where: location, t: pathingtype): boolean;

/**
 * 设置 地形路径 开/关
 */
declare function SetTerrainPathableBJ(where: location, t: pathingtype, flag: boolean): void;

/**
 * 设置 水 颜色
 */
declare function SetWaterBaseColorBJ(red: number, green: number, blue: number, transparency: number): void;

/**
 * 创建可见度修正器(矩形区域)
 */
declare function CreateFogModifierRectSimple(whichPlayer: player, whichFogState: fogstate, r: rect, afterUnits: boolean): fogmodifier;

/**
 * 创建可见度修正器(圆范围)
 */
declare function CreateFogModifierRadiusLocSimple(whichPlayer: player, whichFogState: fogstate, center: location, radius: number, afterUnits: boolean): fogmodifier;

/**
 * Version of CreateFogModifierRect that assumes use of sharedVision and
 */
/**
 * gives the option of immediately enabling the modifier, so that triggers
 */
/**
 * can default to modifiers that are immediately enabled.
 */

//
/**
 * 创造 区域 可见度修正器
 */
declare function CreateFogModifierRectBJ(enabled: boolean, whichPlayer: player, whichFogState: fogstate, r: rect): fogmodifier;

/**
 * Version of CreateFogModifierRadius that assumes use of sharedVision and
 */
/**
 * gives the option of immediately enabling the modifier, so that triggers
 */
/**
 * can default to modifiers that are immediately enabled.
 */

//
/**
 * 创造 圆周 可见度修正器
 */
declare function CreateFogModifierRadiusLocBJ(enabled: boolean, whichPlayer: player, whichFogState: fogstate, center: location, radius: number): fogmodifier;

/**
 * 最后创建的可见度修正器
 */
declare function GetLastCreatedFogModifier(): fogmodifier;

/**
 * 允许战争迷雾
 */
declare function FogEnableOn(): void;

/**
 * 禁止战争迷雾
 */
declare function FogEnableOff(): void;

/**
 * 允许黑色阴影
 */
declare function FogMaskEnableOn(): void;

/**
 * 禁止黑色阴影
 */
declare function FogMaskEnableOff(): void;

/**
 * 打开/关闭日夜循环
 */
declare function UseTimeOfDayBJ(flag: boolean): void;

/**
 * 设置 迷雾
 */
declare function SetTerrainFogExBJ(style: number, zstart: number, zend: number, density: number, red: number, green: number, blue: number): void;

/**
 * 重置 迷雾
 */
declare function ResetTerrainFogBJ(): void;

/**
 * 播放圆周内地形装饰物的动作
 */
declare function SetDoodadAnimationBJ(animName: string, doodadID: number, radius: number, center: location): void;

/**
 * 播放区域内地形装饰物的动作
 */
declare function SetDoodadAnimationRectBJ(animName: string, doodadID: number, r: rect): void;

/**
 * 添加/删除 单位动画 标签
 */
declare function AddUnitAnimationPropertiesBJ(add: boolean, animProperties: string, whichUnit: unit): void;

/**
 * 创建图像
 */
declare function CreateImageBJ(file: string, size: number, where: location, zOffset: number, imageType: number): image;

/**
 * 显示/隐藏图像
 */
declare function ShowImageBJ(flag: boolean, whichImage: image): void;

/**
 * 改变图像位置
 */
declare function SetImagePositionBJ(whichImage: image, where: location, zOffset: number): void;

/**
 * 改变图像颜色
 */
declare function SetImageColorBJ(whichImage: image, red: number, green: number, blue: number, alpha: number): void;

/**
 * 最后创建的图像
 */
declare function GetLastCreatedImage(): image;

/**
 * 创建地面纹理
 */
declare function CreateUbersplatBJ(where: location, name: string, red: number, green: number, blue: number, alpha: number, forcePaused: boolean, noBirthTime: boolean): ubersplat;

/**
 * 显示/隐藏地面纹理
 */
declare function ShowUbersplatBJ(flag: boolean, whichSplat: ubersplat): void;

/**
 * 最后创建的地面纹理
 */
declare function GetLastCreatedUbersplat(): ubersplat;

/**
 * 播放声音
 */
declare function PlaySoundBJ(soundHandle: sound): void;

/**
 * 停止声音
 */
declare function StopSoundBJ(soundHandle: sound, fadeOut: boolean): void;

/**
 * 设置声音音量
 */
declare function SetSoundVolumeBJ(soundHandle: sound, volumePercent: number): void;

/**
 * 跳跃播放声音
 */
declare function SetSoundOffsetBJ(newOffset: number, soundHandle: sound): void;

/**
 * 设置声音距离
 */
declare function SetSoundDistanceCutoffBJ(soundHandle: sound, cutoff: number): void;

/**
 * 设置声音定调
 */
declare function SetSoundPitchBJ(soundHandle: sound, pitch: number): void;

/**
 * 设置3D声音位置
 */
declare function SetSoundPositionLocBJ(soundHandle: sound, loc: location, z: number): void;

/**
 * 捆绑3D声音到单位
 */
declare function AttachSoundToUnitBJ(soundHandle: sound, whichUnit: unit): void;

declare function SetSoundConeAnglesBJ(soundHandle: sound, inside: number, outside: number, outsideVolumePercent: number): void;

/**
 * 破坏声音
 */
declare function KillSoundWhenDoneBJ(soundHandle: sound): void;

/**
 * 播放声音在点
 */
declare function PlaySoundAtPointBJ(soundHandle: sound, volumePercent: number, loc: location, z: number): void;

/**
 * 播放声音单位
 */
declare function PlaySoundOnUnitBJ(soundHandle: sound, volumePercent: number, whichUnit: unit): void;

/**
 * 播放声音 有等待时间
 */
declare function PlaySoundFromOffsetBJ(soundHandle: sound, volumePercent: number, startingOffset: number): void;

/**
 * 播放音乐
 */
declare function PlayMusicBJ(musicFileName: string): void;

/**
 * 播放音乐(跳跃)
 */
declare function PlayMusicExBJ(musicFileName: string, startingOffset: number, fadeInTime: number): void;

/**
 * 跳越音乐
 */
declare function SetMusicOffsetBJ(newOffset: number): void;

/**
 * 播放主题音乐
 */
declare function PlayThematicMusicBJ(musicName: string): void;

/**
 * 播放主题音乐(跳跃)
 */
declare function PlayThematicMusicExBJ(musicName: string, startingOffset: number): void;

/**
 * 跳越音乐主题曲
 */
declare function SetThematicMusicOffsetBJ(newOffset: number): void;

/**
 * 停放主题曲
 */
declare function EndThematicMusicBJ(): void;

/**
 * 停止音乐
 */
declare function StopMusicBJ(fadeOut: boolean): void;

/**
 * 继续音乐
 */
declare function ResumeMusicBJ(): void;

/**
 * 设置音乐音量
 */
declare function SetMusicVolumeBJ(volumePercent: number): void;

declare function SetThematicMusicVolumeBJ(volumePercent: number): void;

/**
 * 声音长度
 */
declare function GetSoundDurationBJ(soundHandle: sound): number;

/**
 * 音乐长度
 */
declare function GetSoundFileDurationBJ(musicFileName: string): number;

/**
 * 最后播放的声音
 */
declare function GetLastPlayedSound(): sound;

/**
 * 最后播放的音乐
 */
declare function GetLastPlayedMusic(): string;

/**
 * 设置音量
 */
declare function VolumeGroupSetVolumeBJ(vgroup: volumegroup, percent: number): void;

/**
 * 设置电影多通道音量环境(立即)
 */
declare function SetCineModeVolumeGroupsImmediateBJ(): void;

/**
 * 将所有音量设置为动画
 */
/**
 * Delay the request if it occurs at map init.
 */
declare function SetCineModeVolumeGroupsBJ(): void;

/**
 * 设置语音多通道音量环境(立即)
 */
declare function SetSpeechVolumeGroupsImmediateBJ(): void;

/**
 * 将所有音量设置为说话
 */
/**
 * Delay the request if it occurs at map init.
 */
declare function SetSpeechVolumeGroupsBJ(): void;

/**
 * 重置多通道音量(立即)
 */
declare function VolumeGroupResetImmediateBJ(): void;

/**
 * 重置所有音量
 */
/**
 * Delay the request if it occurs at map init.
 */
declare function VolumeGroupResetBJ(): void;

/**
 * 获取声音是否播放中
 */
declare function GetSoundIsPlayingBJ(soundHandle: sound): boolean;

/**
 * 等待声音结束
 */
declare function WaitForSoundBJ(soundHandle: sound, offset: number): void;

/**
 * 设置音乐列表 (使用指定的开始音乐)
 */
declare function SetMapMusicIndexedBJ(musicName: string, index: number): void;

/**
 * 设定音乐列表 (使用随机的开始音乐)
 */
declare function SetMapMusicRandomBJ(musicName: string): void;

/**
 * 清空音乐列表
 */
declare function ClearMapMusicBJ(): void;

/**
 * 添加/删除穿越区域的3维声音
 */
declare function SetStackedSoundBJ(add: boolean, soundHandle: sound, r: rect): void;

/**
 * 为指定玩家播放声音
 */
declare function StartSoundForPlayerBJ(whichPlayer: player, soundHandle: sound): void;

/**
 * 设置玩家声音组音量
 */
declare function VolumeGroupSetVolumeForPlayerBJ(whichPlayer: player, vgroup: volumegroup, scale: number): void;

/**
 * 打开/关闭 日出/日落 的声音
 */
declare function EnableDawnDusk(flag: boolean): void;

/**
 * 是否启用了黎明和黄昏
 */
declare function IsDawnDuskEnabled(): boolean;

//***************************************************************************
//*
//*  Day/Night ambient sounds
//*
//***************************************************************************
/**
 * 使用白昼环境的音乐
 */
declare function SetAmbientDaySound(inLabel: string): void;

/**
 * 使用夜晚环境的音乐
 */
declare function SetAmbientNightSound(inLabel: string): void;

//***************************************************************************
//*
//*  Special Effect Utility Functions
//*
//***************************************************************************
/**
 * 对某点创造特殊效果
 */
declare function AddSpecialEffectLocBJ(where: location, modelName: string): effect;

/**
 * 对某单位创造特殊效果
 */
declare function AddSpecialEffectTargetUnitBJ(attachPointName: string, targetWidget: widget, modelName: string): effect;

/**
 * Two distinct trigger actions can't share the same function name, so this
 */
/**
 * dummy function simply mimics the behavior of an existing call.
 */
//
/**
 * Commented out - Destructibles have no attachment points.
 */
//
//function AddSpecialEffectTargetDestructableBJ takes string attachPointName, widget targetWidget, string modelName returns effect
/**
 * return AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
 */
//endfunction
/**
 * Two distinct trigger actions can't share the same function name, so this
 */
/**
 * dummy function simply mimics the behavior of an existing call.
 */
//
/**
 * Commented out - Items have no attachment points.
 */
//
//function AddSpecialEffectTargetItemBJ takes string attachPointName, widget targetWidget, string modelName returns effect
/**
 * return AddSpecialEffectTargetUnitBJ(attachPointName, targetWidget, modelName)
 */

//endfunction
/**
 * 删除特殊效果
 */
declare function DestroyEffectBJ(whichEffect: effect): void;

/**
 * 最后创建的特殊效果
 */
declare function GetLastCreatedEffectBJ(): effect;

//***************************************************************************
//*
//*  Hero and Item Utility Functions
//*
//***************************************************************************
/**
 * 物品的位置
 */
declare function GetItemLoc(whichItem: item): location;

/**
 * 物品生命
 */
declare function GetItemLifeBJ(whichWidget: widget): number;

/**
 * 设置生命(物品)
 */
declare function SetItemLifeBJ(whichWidget: widget, life: number): void;

/**
 * 增加英雄经验值
 */
declare function AddHeroXPSwapped(xpToAdd: number, whichHero: unit, showEyeCandy: boolean): void;

/**
 * 设置英雄等级
 */
declare function SetHeroLevelBJ(whichHero: unit, newLevel: number, showEyeCandy: boolean): void;

/**
 * 降低单位技能等级
 */
declare function DecUnitAbilityLevelSwapped(abilcode: number, whichUnit: unit): number;

/**
 * 提升单位技能等级
 */
declare function IncUnitAbilityLevelSwapped(abilcode: number, whichUnit: unit): number;

/**
 * 设置单位技能等级
 */
declare function SetUnitAbilityLevelSwapped(abilcode: number, whichUnit: unit, level: number): number;

/**
 * 单位的技能等级
 */
declare function GetUnitAbilityLevelSwapped(abilcode: number, whichUnit: unit): number;

/**
 * 单位存在 魔法特效
 */
declare function UnitHasBuffBJ(whichUnit: unit, buffcode: number): boolean;

/**
 * 删除 持续状态 (指定的)
 */
declare function UnitRemoveBuffBJ(buffcode: number, whichUnit: unit): boolean;

/**
 * 移动物品给英雄
 */
declare function UnitAddItemSwapped(whichItem: item, whichHero: unit): boolean;

/**
 * 创建物品给英雄
 */
/**
 * Create the item at the hero's feet first, and then give it to him.
 */
declare function UnitAddItemByIdSwapped(itemId: number, whichHero: unit): item;

/**
 * 掉落英雄的一个物品
 */
declare function UnitRemoveItemSwapped(whichItem: item, whichHero: unit): void;

/**
 * Translates 0-based slot indices to 1-based slot indices.
 */

//
/**
 * 从英雄的物品栏位置中掉落物品
 */
declare function UnitRemoveItemFromSlotSwapped(itemSlot: number, whichHero: unit): item;

/**
 * 创造物品
 */
declare function CreateItemLoc(itemId: number, loc: location): item;

/**
 * 最后创造的物品
 */
declare function GetLastCreatedItem(): item;

/**
 * 最后掉落的物品
 */
declare function GetLastRemovedItem(): item;

/**
 * 移动物品 (立刻)
 */
declare function SetItemPositionLoc(whichItem: item, loc: location): void;

/**
 * 学习英雄技能
 */
declare function GetLearnedSkillBJ(): number;

/**
 * 允许/禁止 英雄获得经验值
 */
declare function SuspendHeroXPBJ(flag: boolean, whichHero: unit): void;

declare function SetPlayerHandicapDamageBJ(whichPlayer: player, handicapPercent: number): void;

declare function GetPlayerHandicapDamageBJ(whichPlayer: player): number;

declare function SetPlayerHandicapReviveTimeBJ(whichPlayer: player, handicapPercent: number): void;

declare function GetPlayerHandicapReviveTimeBJ(whichPlayer: player): number;

/**
 * 设置玩家英雄经验值预先获得
 */
declare function SetPlayerHandicapXPBJ(whichPlayer: player, handicapPercent: number): void;

/**
 * 经验值比率
 */
declare function GetPlayerHandicapXPBJ(whichPlayer: player): number;

/**
 * 设置玩家生命百分比
 */
declare function SetPlayerHandicapBJ(whichPlayer: player, handicapPercent: number): void;

/**
 * 经验值上限
 */
declare function GetPlayerHandicapBJ(whichPlayer: player): number;

/**
 * 英雄的属性
 */
declare function GetHeroStatBJ(whichStat: number, whichHero: unit, includeBonuses: boolean): number;

/**
 * 修改英雄属性
 */
/**
 * Ignore requests for negative hero stats.
 */
declare function SetHeroStat(whichHero: unit, whichStat: number, value: number): void;

/**
 * 改变英雄属性
 */
declare function ModifyHeroStat(whichStat: number, whichHero: unit, modifyMethod: number, value: number): void;

/**
 * 改变英雄技能点数
 */
declare function ModifyHeroSkillPoints(whichHero: unit, modifyMethod: number, value: number): boolean;

/**
 * 单位掉落的物品
 */

/**
 * 发布丢弃物品命令(指定坐标)
 */
/**
 * 单位掉落的物品
 */
declare function UnitDropItemPointBJ(whichUnit: unit, whichItem: item, x: number, y: number): boolean;

/**
 * 丢弃物品于指定点
 */
declare function UnitDropItemPointLoc(whichUnit: unit, whichItem: item, loc: location): boolean;

/**
 * 放置物品于指定物品格
 */
declare function UnitDropItemSlotBJ(whichUnit: unit, whichItem: item, slot: number): boolean;

/**
 * 将物品给予其它单位
 */
declare function UnitDropItemTargetBJ(whichUnit: unit, whichItem: item, target: widget): boolean;

/**
 * Two distinct trigger actions can't share the same function name, so this
 */
/**
 * dummy function simply mimics the behavior of an existing call.
 */

//
/**
 * 对可毁坏物使用物品
 */
declare function UnitUseItemDestructable(whichUnit: unit, whichItem: item, target: widget): boolean;

/**
 * 对 点 使用物品
 */
declare function UnitUseItemPointLoc(whichUnit: unit, whichItem: item, loc: location): boolean;

/**
 * Translates 0-based slot indices to 1-based slot indices.
 */

//
/**
 * 英雄携带的物品
 */
declare function UnitItemInSlotBJ(whichUnit: unit, itemSlot: number): item;

/**
 * Translates 0-based slot indices to 1-based slot indices.
 */

//
/**
 * 获取物品的类型
 */
declare function GetInventoryIndexOfItemTypeBJ(whichUnit: unit, itemId: number): number;

/**
 * 英雄携带的物品类型
 */
declare function GetItemOfTypeFromUnitBJ(whichUnit: unit, itemId: number): item;

/**
 * 英雄已有 物品 - 类型
 */
declare function UnitHasItemOfTypeBJ(whichUnit: unit, itemId: number): boolean;

/**
 * 单位物品的数量
 */
declare function UnitInventoryCount(whichUnit: unit): number;

/**
 * 物品栏容量
 */
declare function UnitInventorySizeBJ(whichUnit: unit): number;

/**
 * 设置物品 无敌/可攻击
 */
declare function SetItemInvulnerableBJ(whichItem: item, flag: boolean): void;

/**
 * 设置英雄死亡后能否物品掉落
 */
declare function SetItemDropOnDeathBJ(whichItem: item, flag: boolean): void;

/**
 * 设置物品能否丢弃
 */
declare function SetItemDroppableBJ(whichItem: item, flag: boolean): void;

/**
 * 改变物品的所有者
 */
declare function SetItemPlayerBJ(whichItem: item, whichPlayer: player, changeColor: boolean): void;

/**
 * 显示/隐藏 物品
 */
declare function SetItemVisibleBJ(show: boolean, whichItem: item): void;

/**
 * 物品是隐藏的
 */
declare function IsItemHiddenBJ(whichItem: item): boolean;

/**
 * 随机物品-所有类别
 */
declare function ChooseRandomItemBJ(level: number): number;

/**
 * 随机物品-有类别
 */
declare function ChooseRandomItemExBJ(level: number, whichType: itemtype): number;

/**
 * 随机的中立建筑物类型
 */
declare function ChooseRandomNPBuildingBJ(): number;

/**
 * 随机的野生单位单位类型(有等级)
 */
declare function ChooseRandomCreepBJ(level: number): number;

/**
 * 选取所有物品在 区域 做动作(单一的)
 */
declare function EnumItemsInRectBJ(r: rect, actionFunc: () => void): void;

/**
 * See GroupPickRandomUnitEnum for the details of this algorithm.
 */
//
/**
 * 矩形区域内随机物品(指定条件)
 */
/**
 * 随机物品在区域并匹配条件
 */
declare function RandomItemInRectBJEnum(): void;

/**
 * Picks a random item from within a rect, matching a condition
 */
//
declare function RandomItemInRectBJ(r: rect, filter: boolexpr): item;

/**
 * Picks a random item from within a rect
 */

//
/**
 * 随机物品在区域
 */
declare function RandomItemInRectSimpleBJ(r: rect): item;

/**
 * 物品状态检查
 */
declare function CheckItemStatus(whichItem: item, status: number): boolean;

/**
 * 物品 - 类型 状态检查
 */
declare function CheckItemcodeStatus(itemId: number, status: number): boolean;

//***************************************************************************
//*
//*  Unit Utility Functions
//*
//***************************************************************************
/**
 * 将单位类型转换为命令
 */
declare function UnitId2OrderIdBJ(unitId: number): number;

/**
 * 将单位类型转换为字符串
 */
declare function String2UnitIdBJ(unitIdString: string): number;

/**
 * 将单位转换为字符串
 */
declare function UnitId2StringBJ(unitId: number): string;

/**
 * 将字符串转换为命令
 */
declare function String2OrderIdBJ(orderIdString: string): number;

/**
 * 将命令转换为字符串
 */
declare function OrderId2StringBJ(orderId: number): string;

/**
 * 发出的命令
 */
declare function GetIssuedOrderIdBJ(): number;

/**
 * 凶手单位
 */
declare function GetKillingUnitBJ(): unit;

/**
 * 新建单位(指定点)
 */
declare function CreateUnitAtLocSaveLast(id: player, unitid: number, loc: location, face: number): unit;

/**
 * 最后创建的单位
 */
declare function GetLastCreatedUnit(): unit;

/**
 * 创造单位面对角度
 */
declare function CreateNUnitsAtLoc(count: number, unitId: number, whichPlayer: player, loc: location, face: number): group;

/**
 * 创造单位面对点
 */
declare function CreateNUnitsAtLocFacingLocBJ(count: number, unitId: number, whichPlayer: player, loc: location, lookAt: location): group;

/**
 * 最后创建的单位组
 */
/**
 * 最后创建的单位组
 */
declare function GetLastCreatedGroupEnum(): void;

declare function GetLastCreatedGroup(): group;

/**
 * 创造尸体
 */
declare function CreateCorpseLocBJ(unitid: number, whichPlayer: player, loc: location): unit;

/**
 * 设置尸体腐烂方式
 */
declare function UnitSuspendDecayBJ(suspend: boolean, whichUnit: unit): void;

/**
 * 延迟挂衰变停止动画
 */
declare function DelayedSuspendDecayStopAnimEnum(): void;

/**
 * 延迟挂衰变停止动画骨骼
 */
declare function DelayedSuspendDecayBoneEnum(): void;

/**
 * Game code explicitly sets the animation back to "decay bone" after the
 */

/**
 * initial corpse fades away, so we reset it now.  It's best not to show
 */
/**
 * off corpses thus created until after this grace period has passed.
 */
//
declare function DelayedSuspendDecayFleshEnum(): void;

/**
 * Waits a short period of time to ensure that the corpse is decaying, and
 */
/**
 * then suspend the animation and corpse decay.
 */
//
declare function DelayedSuspendDecay(): void;

declare function DelayedSuspendDecayCreate(): void;

/**
 * 创造永久的尸体
 */
declare function CreatePermanentCorpseLocBJ(style: number, unitid: number, whichPlayer: player, loc: location, facing: number): unit;

/**
 * 单位属性
 */
declare function GetUnitStateSwap(whichState: unitstate, whichUnit: unit): number;

declare function GetUnitStatePercent(whichUnit: unit, whichState: unitstate, whichMaxState: unitstate): number;

/**
 * 生命值百分比
 */
declare function GetUnitLifePercent(whichUnit: unit): number;

/**
 * 魔法值百分比
 */
declare function GetUnitManaPercent(whichUnit: unit): number;

/**
 * 选定单位
 */
declare function SelectUnitSingle(whichUnit: unit): void;

/**
 * 选定单位组
 */
declare function SelectGroupBJEnum(): void;

declare function SelectGroupBJ(g: group): void;

/**
 * 添加选择单位(所有玩家)
 */
/**
 * 添加选择单位(所有玩家)
 */
declare function SelectUnitAdd(whichUnit: unit): void;

/**
 * 清除单位选择
 */
declare function SelectUnitRemove(whichUnit: unit): void;

/**
 * 清除选定对玩家
 */
declare function ClearSelectionForPlayer(whichPlayer: player): void;

/**
 * 选定单位对玩家
 */
declare function SelectUnitForPlayerSingle(whichUnit: unit, whichPlayer: player): void;

/**
 * 清除选定单位组对玩家
 */
declare function SelectGroupForPlayerBJ(g: group, whichPlayer: player): void;

/**
 * 增加单位到玩家的选定中
 */
declare function SelectUnitAddForPlayer(whichUnit: unit, whichPlayer: player): void;

/**
 * 清除单位的选定为玩家
 */
declare function SelectUnitRemoveForPlayer(whichUnit: unit, whichPlayer: player): void;

/**
 * 设置单位生命值 (数值)
 */
declare function SetUnitLifeBJ(whichUnit: unit, newValue: number): void;

/**
 * 设置单位魔法值 (数值)
 */
declare function SetUnitManaBJ(whichUnit: unit, newValue: number): void;

/**
 * 设置单位生命值 (百分比)
 */
declare function SetUnitLifePercentBJ(whichUnit: unit, percent: number): void;

/**
 * 设置单位魔法值 (百分比)
 */
declare function SetUnitManaPercentBJ(whichUnit: unit, percent: number): void;

/**
 * 单位是已死亡的
 */
declare function IsUnitDeadBJ(whichUnit: unit): boolean;

/**
 * 单位是活着的
 */
declare function IsUnitAliveBJ(whichUnit: unit): boolean;

/**
 * 单位组的单位是已死亡的
 */
declare function IsUnitGroupDeadBJEnum(): void;

/**
 * Returns true if every unit of the group is dead.
 */

//
/**
 * If the user wants the group destroyed, remember that fact and clear
 */
declare function IsUnitGroupDeadBJ(g: group): boolean;

/**
 * 单位组是空的
 */
declare function IsUnitGroupEmptyBJEnum(): void;

/**
 * Returns true if the group contains no units.
 */

//
/**
 * If the user wants the group destroyed, remember that fact and clear
 */
declare function IsUnitGroupEmptyBJ(g: group): boolean;

/**
 * 单位组的单位在区域
 */
declare function IsUnitGroupInRectBJEnum(): void;

/**
 * Returns true if every unit of the group is within the given rect.
 */
//
declare function IsUnitGroupInRectBJ(g: group, r: rect): boolean;

/**
 * 单位被隐藏
 */
declare function IsUnitHiddenBJ(whichUnit: unit): boolean;

/**
 * 隐藏单位
 */
declare function ShowUnitHide(whichUnit: unit): void;

/**
 * 显示单位
 */
/**
 * Prevent dead heroes from being unhidden.
 */
declare function ShowUnitShow(whichUnit: unit): void;

declare function IssueHauntOrderAtLocBJFilter(): boolean;

declare function IssueHauntOrderAtLocBJ(whichPeon: unit, loc: location): boolean;

/**
 * 发送命令到 建造建筑
 */
declare function IssueBuildOrderByIdLocBJ(whichPeon: unit, unitId: number, loc: location): boolean;

/**
 * 发送命令到 训练兵种/升级建筑
 */
declare function IssueTrainOrderByIdBJ(whichUnit: unit, unitId: number): boolean;

/**
 * 发送单位组命令到 训练兵种/升级建筑
 */
declare function GroupTrainOrderByIdBJ(g: group, unitId: number): boolean;

/**
 * 发送命令到 研究科技
 */
declare function IssueUpgradeOrderByIdBJ(whichUnit: unit, techId: number): boolean;

/**
 * 被攻击的单位
 */
declare function GetAttackedUnitBJ(): unit;

/**
 * 改变单位飞行高度
 */
declare function SetUnitFlyHeightBJ(whichUnit: unit, newHeight: number, rate: number): void;

/**
 * 改变单位转向速度
 */
declare function SetUnitTurnSpeedBJ(whichUnit: unit, turnSpeed: number): void;

/**
 * 改变单位头像视窗角度
 */
declare function SetUnitPropWindowBJ(whichUnit: unit, propWindow: number): void;

/**
 * 单位在头像窗口的角度 (当前)
 */
declare function GetUnitPropWindowBJ(whichUnit: unit): number;

/**
 * 单位在头像窗口的角度 (默认)
 */
declare function GetUnitDefaultPropWindowBJ(whichUnit: unit): number;

/**
 * 改变单位混合时间
 */
declare function SetUnitBlendTimeBJ(whichUnit: unit, blendTime: number): void;

/**
 * 设置感知敌人距离
 */
declare function SetUnitAcquireRangeBJ(whichUnit: unit, acquireRange: number): void;

/**
 * 设置单位睡眠(之在晚上)
 */
declare function UnitSetCanSleepBJ(whichUnit: unit, canSleep: boolean): void;

/**
 * 单位晚上睡觉
 */
declare function UnitCanSleepBJ(whichUnit: unit): boolean;

/**
 * 设置单位醒来
 */
declare function UnitWakeUpBJ(whichUnit: unit): void;

/**
 * 单位正在睡觉
 */
declare function UnitIsSleepingBJ(whichUnit: unit): boolean;

declare function WakePlayerUnitsEnum(): void;

declare function WakePlayerUnits(whichPlayer: player): void;

/**
 * 允许/禁止 所有野生单位夜间睡眠
 */
declare function EnableCreepSleepBJ(enable: boolean): void;

/**
 * 设置警报产生 打开/关闭
 */
declare function UnitGenerateAlarms(whichUnit: unit, generate: boolean): boolean;

/**
 * 单位发出警报
 */
declare function DoesUnitGenerateAlarms(whichUnit: unit): boolean;

/**
 * Pause all units
 */

/**
 * Pause all units
 */
/**
 * 暂停/恢复 所有单位
 */
declare function PauseAllUnitsBJEnum(): void;

/**
 * Pause all units
 */
declare function PauseAllUnitsBJ(pause: boolean): void;

/**
 * 设置单位 暂停/恢复
 */
declare function PauseUnitBJ(pause: boolean, whichUnit: unit): void;

/**
 * 单位被暂停
 */
declare function IsUnitPausedBJ(whichUnit: unit): boolean;

/**
 * 暂停/恢复 单位生命计时器
 */
declare function UnitPauseTimedLifeBJ(flag: boolean, whichUnit: unit): void;

/**
 * 设置单位生命计时器
 */
declare function UnitApplyTimedLifeBJ(duration: number, buffId: number, whichUnit: unit): void;

/**
 * 共享单位视野
 */
declare function UnitShareVisionBJ(share: boolean, whichUnit: unit, whichPlayer: player): void;

/**
 * 删除 持续状态
 */
declare function UnitRemoveBuffsBJ(buffType: number, whichUnit: unit): void;

/**
 * 删除 持续状态 (按类型)
 */
declare function UnitRemoveBuffsExBJ(polarity: number, resist: number, whichUnit: unit, bTLife: boolean, bAura: boolean): void;

/**
 * 魔法效果/特殊效果 的数量
 */
declare function UnitCountBuffsExBJ(polarity: number, resist: number, whichUnit: unit, bTLife: boolean, bAura: boolean): number;

/**
 * 删除单位技能
 */
declare function UnitRemoveAbilityBJ(abilityId: number, whichUnit: unit): boolean;

/**
 * 增加单位技能
 */
declare function UnitAddAbilityBJ(abilityId: number, whichUnit: unit): boolean;

/**
 * 移除类别
 */
declare function UnitRemoveTypeBJ(whichType: unittype, whichUnit: unit): boolean;

/**
 * 添加类别
 */
declare function UnitAddTypeBJ(whichType: unittype, whichUnit: unit): boolean;

declare function UnitMakeAbilityPermanentBJ(permanent: boolean, abilityId: number, whichUnit: unit): boolean;

/**
 * 设置单位死亡方式
 */
declare function SetUnitExplodedBJ(whichUnit: unit, exploded: boolean): void;

/**
 * 使单位爆炸而死
 */
declare function ExplodeUnitBJ(whichUnit: unit): void;

/**
 * 传送单位
 */
declare function GetTransportUnitBJ(): unit;

/**
 * 载入单位
 */
declare function GetLoadedUnitBJ(): unit;

/**
 * 单位已经装载
 */
declare function IsUnitInTransportBJ(whichUnit: unit, whichTransport: unit): boolean;

/**
 * 单位正在被送
 */
declare function IsUnitLoadedBJ(whichUnit: unit): boolean;

/**
 * 单位是隐形的
 */
declare function IsUnitIllusionBJ(whichUnit: unit): boolean;

/**
 * This attempts to replace a unit with a new unit type by creating a new
 */
/**
 * unit of the desired type using the old unit's location, facing, etc.
 */

//
/**
 * 替换单位
 */
declare function ReplaceUnitBJ(whichUnit: unit, newUnitId: number, unitStateMethod: number): unit;

/**
 * 最后替换的单位
 */
declare function GetLastReplacedUnitBJ(): unit;

/**
 * 移动单位并改变面对角度 (立刻)
 */
declare function SetUnitPositionLocFacingBJ(whichUnit: unit, loc: location, facing: number): void;

/**
 * 移动单位并改变面对点 (立刻)
 */
declare function SetUnitPositionLocFacingLocBJ(whichUnit: unit, loc: location, lookAt: location): void;

/**
 * 增加 物品-类型 (到商店)
 */
declare function AddItemToStockBJ(itemId: number, whichUnit: unit, currentStock: number, stockMax: number): void;

/**
 * 增加 单位-类型 (到商店)
 */
declare function AddUnitToStockBJ(unitId: number, whichUnit: unit, currentStock: number, stockMax: number): void;

/**
 * 删除 物品-类型 (从商店)
 */
declare function RemoveItemFromStockBJ(itemId: number, whichUnit: unit): void;

/**
 * 删除 单位-类型 (从商店)
 */
declare function RemoveUnitFromStockBJ(unitId: number, whichUnit: unit): void;

/**
 * 允许/禁止 使用人口
 */
declare function SetUnitUseFoodBJ(enable: boolean, whichUnit: unit): void;

/**
 * 伤害区域
 */
declare function UnitDamagePointLoc(whichUnit: unit, delay: number, radius: number, loc: location, amount: number, whichAttack: attacktype, whichDamage: damagetype): boolean;

/**
 * 伤害目标
 */
declare function UnitDamageTargetBJ(whichUnit: unit, target: unit, amount: number, whichAttack: attacktype, whichDamage: damagetype): boolean;

//***************************************************************************
//*
//*  Destructable Utility Functions
//*
//***************************************************************************
/**
 * 创造 可毁坏物
 */
declare function CreateDestructableLoc(objectid: number, loc: location, facing: number, scale: number, variation: number): destructable;

/**
 * 创造[可毁坏物](毁坏的)
 */
declare function CreateDeadDestructableLocBJ(objectid: number, loc: location, facing: number, scale: number, variation: number): destructable;

/**
 * 最后创建的可毁坏物
 */
declare function GetLastCreatedDestructable(): destructable;

/**
 * 显示/隐藏 可毁坏物
 */
declare function ShowDestructableBJ(flag: boolean, d: destructable): void;

/**
 * 设置 无敌/可攻击
 */
declare function SetDestructableInvulnerableBJ(d: destructable, flag: boolean): void;

/**
 * 可毁坏物是无敌的
 */
declare function IsDestructableInvulnerableBJ(d: destructable): boolean;

/**
 * 可毁坏物的位置
 */
declare function GetDestructableLoc(whichDestructable: destructable): location;

/**
 * 选取所有可毁坏物 在区域 做 动作(单一的)
 */
declare function EnumDestructablesInRectAll(r: rect, actionFunc: () => void): void;

/**
 * 选取所有可毁坏物 在圆周 做 动作(单一的)
 */
declare function EnumDestructablesInCircleBJFilter(): boolean;

/**
 * 可毁坏物是死的
 */
declare function IsDestructableDeadBJ(d: destructable): boolean;

/**
 * 可毁坏物是活者的
 */
declare function IsDestructableAliveBJ(d: destructable): boolean;

/**
 * See GroupPickRandomUnitEnum for the details of this algorithm.
 */

//
/**
 * 区域的 随机可毁坏物 且匹配条件
 */
declare function RandomDestructableInRectBJEnum(): void;

/**
 * Picks a random destructable from within a rect, matching a condition
 */
//
declare function RandomDestructableInRectBJ(r: rect, filter: boolexpr): destructable;

/**
 * Picks a random destructable from within a rect
 */

//
/**
 * 区域的 随机可毁坏物
 */
declare function RandomDestructableInRectSimpleBJ(r: rect): destructable;

/**
 * Enumerates within a rect, with a filter to narrow the enumeration down
 */
/**
 * objects within a circular area.
 */
//
declare function EnumDestructablesInCircleBJ(radius: number, loc: location, actionFunc: () => void): void;

/**
 * 设置 可毁坏物 生命 (百分比)
 */
declare function SetDestructableLifePercentBJ(d: destructable, percent: number): void;

/**
 * 设置 可毁坏物 最大生命
 */
declare function SetDestructableMaxLifeBJ(d: destructable, max: number): void;

/**
 * 打开/关闭/破坏门
 */
declare function ModifyGateBJ(gateOperation: number, d: destructable): void;

/**
 * Determine the elevator's height from its occlusion height.
 */

//
/**
 * 升降机高度
 */
declare function GetElevatorHeight(d: destructable): number;

/**
 * To properly animate an elevator, we must know not only what height we
 */
/**
 * want to change to, but also what height we are currently at.  This code
 */
/**
 * determines the elevator's current height from its occlusion height.
 */
/**
 * Arbitrarily changing an elevator's occlusion height is thus inadvisable.
 */

//
/**
 * 设置升降机高度
 */
declare function ChangeElevatorHeight(d: destructable, newHeight: number): void;

/**
 * Grab the unit and throw his own coords in his face, forcing him to push
 */
/**
 * and shove until he finds a spot where noone will bother him.
 */
//
declare function NudgeUnitsInRectEnum(): void;

declare function NudgeItemsInRectEnum(): void;

/**
 * Nudge the items and units within a given rect ever so gently, so as to
 */

/**
 * encourage them to find locations where they can peacefully coexist with
 */
/**
 * pathing restrictions and live happy, fruitful lives.
 */
//
declare function NudgeObjectsInRect(nudgeArea: rect): void;

declare function NearbyElevatorExistsEnum(): void;

declare function NearbyElevatorExists(x: number, y: number): boolean;

declare function FindElevatorWallBlockerEnum(): void;

/**
 * This toggles pathing on or off for one wall of an elevator by killing
 */

/**
 * or reviving a pathing blocker at the appropriate location (and creating
 */
/**
 * the pathing blocker in the first place, if it does not yet exist).
 */
//
declare function ChangeElevatorWallBlocker(x: number, y: number, facing: number, open: boolean): void;

/**
 * 打开/关闭 升降机
 */
declare function ChangeElevatorWalls(open: boolean, walls: number, d: destructable): void;

//***************************************************************************
//*
//*  Neutral Building Utility Functions
//*
//***************************************************************************
/**
 * 打开/关闭 传送门
 */
declare function WaygateActivateBJ(activate: boolean, waygate: unit): void;

/**
 * 传送门是允许的
 */
declare function WaygateIsActiveBJ(waygate: unit): boolean;

/**
 * 设置传送门目的地
 */
declare function WaygateSetDestinationLocBJ(waygate: unit, loc: location): void;

/**
 * 传送门的目的地
 */
declare function WaygateGetDestinationLocBJ(waygate: unit): location;

/**
 * 改变单位的小地图图标
 */
declare function UnitSetUsesAltIconBJ(flag: boolean, whichUnit: unit): void;

//***************************************************************************
//*
//*  UI Utility Functions
//*
//***************************************************************************
/**
 * 按下 UI 键
 */
declare function ForceUIKeyBJ(whichPlayer: player, key: string): void;

/**
 * 取消 UI 键
 */
declare function ForceUICancelBJ(whichPlayer: player): void;

//***************************************************************************
//*
//*  Group and Force Utility Functions
//*
//***************************************************************************
/**
 * If the user wants the group destroyed, remember that fact and clear
 * @deprecated 请使用GroupUtil.for  以减少内存泄漏
 */
declare function ForGroupBJ(whichGroup: group, callback: () => void): void;

/**
 * 增加单位到单位组
 */
declare function GroupAddUnitSimple(whichUnit: unit, whichGroup: group): void;

/**
 * 清除单位从单位组
 */
declare function GroupRemoveUnitSimple(whichUnit: unit, whichGroup: group): void;

/**
 * 增加单位组到单位组
 */
declare function GroupAddGroupEnum(): void;

/**
 * If the user wants the group destroyed, remember that fact and clear
 * @deprecated
 */
declare function GroupAddGroup(sourceGroup: group, destGroup: group): void;

/**
 * 清除单位组从单位组
 */
declare function GroupRemoveGroupEnum(): void;

/**
 * If the user wants the group destroyed, remember that fact and clear
 */
declare function GroupRemoveGroup(sourceGroup: group, destGroup: group): void;

/**
 * 添加玩家到玩家组
 */
declare function ForceAddPlayerSimple(whichPlayer: player, whichForce: force): void;

/**
 * 删除玩家到玩家组
 */
declare function ForceRemovePlayerSimple(whichPlayer: player, whichForce: force): void;

/**
 * Consider each unit, one at a time, keeping a "current pick".   Once all units
 */
/**
 * are considered, this "current pick" will be the resulting random unit.
 */
//
/**
 * The chance of picking a given unit over the "current pick" is 1/N, where N is
 */
/**
 * the number of units considered thusfar (including the current consideration).
 */

//
/**
 * 单位组里的随机单位
 */
declare function GroupPickRandomUnitEnum(): void;

/**
 * Picks a random unit from a group.
 */

//
/**
 * If the user wants the group destroyed, remember that fact and clear
 */
declare function GroupPickRandomUnit(whichGroup: group): unit;

/**
 * See GroupPickRandomUnitEnum for the details of this algorithm.
 */

//
/**
 * 玩家组里的随机玩家
 */
declare function ForcePickRandomPlayerEnum(): void;

/**
 * Picks a random player from a force.
 */
//
declare function ForcePickRandomPlayer(whichForce: force): player;

declare function EnumUnitsSelected(whichPlayer: player, enumFilter: boolexpr, enumAction: () => void): void;

/**
 * 单位在区域中并匹配条件
 */
declare function GetUnitsInRectMatching(r: rect, filter: boolexpr): group;

/**
 * 区域中的所有单位
 */
declare function GetUnitsInRectAll(r: rect): group;

/**
 * 玩家在区域中的单位
 */
declare function GetUnitsInRectOfPlayerFilter(): boolean;

declare function GetUnitsInRectOfPlayer(r: rect, whichPlayer: player): group;

/**
 * 单位在圆周内匹配条件的
 */
declare function GetUnitsInRangeOfLocMatching(radius: number, whichLocation: location, filter: boolexpr): group;

/**
 * 圆周内的所有单位
 */
declare function GetUnitsInRangeOfLocAll(radius: number, whichLocation: location): group;

/**
 * 某类型的单位
 */
declare function GetUnitsOfTypeIdAllFilter(): boolean;

declare function GetUnitsOfTypeIdAll(unitid: number): group;

/**
 * 玩家拥有的单位匹配条件
 */
declare function GetUnitsOfPlayerMatching(whichPlayer: player, filter: boolexpr): group;

/**
 * 玩家拥有的单位
 */
declare function GetUnitsOfPlayerAll(whichPlayer: player): group;

/**
 * 玩家拥有的单位类型
 */
declare function GetUnitsOfPlayerAndTypeIdFilter(): boolean;

declare function GetUnitsOfPlayerAndTypeId(whichPlayer: player, unitid: number): group;

/**
 * 选定的单位
 */
declare function GetUnitsSelectedAll(whichPlayer: player): group;

/**
 * 将玩家转换为玩家组
 */
declare function GetForceOfPlayer(whichPlayer: player): force;

/**
 * 所有玩家
 */
declare function GetPlayersAll(): force;

/**
 * 所有某种控制的玩家
 */
declare function GetPlayersByMapControl(whichControl: mapcontrol): force;

/**
 * 玩家联盟
 */
declare function GetPlayersAllies(whichPlayer: player): force;

/**
 * 玩家的敌人
 */
declare function GetPlayersEnemies(whichPlayer: player): force;

/**
 * 所有玩家匹配条件
 */
declare function GetPlayersMatching(filter: boolexpr): force;

/**
 * 单位组的单位数量
 */
declare function CountUnitsInGroupEnum(): void;

/**
 * If the user wants the group destroyed, remember that fact and clear
 */
declare function CountUnitsInGroup(g: group): number;

declare function CountPlayersInForceEnum(): void;

/**
 * 玩家组中的玩家数量
 */
declare function CountPlayersInForceBJ(f: force): number;

/**
 * 随机选 N 个单位在单位组中
 */
declare function GetRandomSubGroupEnum(): void;

declare function GetRandomSubGroup(count: number, sourceGroup: group): group;

declare function LivingPlayerUnitsOfTypeIdFilter(): boolean;

/**
 * 玩家活着的某类型单位的数量
 */
declare function CountLivingPlayerUnitsOfTypeId(unitId: number, whichPlayer: player): number;

//***************************************************************************
//*
//*  Animation Utility Functions
//*
//***************************************************************************
/**
 * 重置单位动作
 */
declare function ResetUnitAnimation(whichUnit: unit): void;

/**
 * 改变单位动作速度
 */
declare function SetUnitTimeScalePercent(whichUnit: unit, percentScale: number): void;

/**
 * 改变单位尺寸
 */
declare function SetUnitScalePercent(whichUnit: unit, percentScaleX: number, percentScaleY: number, percentScaleZ: number): void;

/**
 * This version differs from the common.j interface in that the alpha value
 */
/**
 * is reversed so as to be displayed as transparency, and all four parameters
 */
/**
 * are treated as percentages rather than bytes.
 */

//
/**
 * 改变单位着色
 */
declare function SetUnitVertexColorBJ(whichUnit: unit, red: number, green: number, blue: number, transparency: number): void;

/**
 * 闪动指示器为了单位
 */
declare function UnitAddIndicatorBJ(whichUnit: unit, red: number, green: number, blue: number, transparency: number): void;

/**
 * 闪动指示器为了可毁坏物
 */
declare function DestructableAddIndicatorBJ(whichDestructable: destructable, red: number, green: number, blue: number, transparency: number): void;

/**
 * 闪动指示器为了物品
 */
declare function ItemAddIndicatorBJ(whichItem: item, red: number, green: number, blue: number, transparency: number): void;

/**
 * Sets a unit's facing to point directly at a location.
 */

//
/**
 * 设置单位面对点
 */
declare function SetUnitFacingToFaceLocTimed(whichUnit: unit, target: location, duration: number): void;

/**
 * Sets a unit's facing to point directly at another unit.
 */

//
/**
 * 设置单位面对单位
 */
declare function SetUnitFacingToFaceUnitTimed(whichUnit: unit, target: unit, duration: number): void;

/**
 * 队列单位动作
 */
declare function QueueUnitAnimationBJ(whichUnit: unit, whichAnimation: string): void;

/**
 * 播放可毁坏物的动作
 */
declare function SetDestructableAnimationBJ(d: destructable, whichAnimation: string): void;

/**
 * 排列可毁坏物的动作
 */
declare function QueueDestructableAnimationBJ(d: destructable, whichAnimation: string): void;

/**
 * 改变可毁坏物动作速度
 */
declare function SetDestAnimationSpeedPercent(d: destructable, percentScale: number): void;

//***************************************************************************
//*
//*  Dialog Utility Functions
//*
//***************************************************************************
/**
 * 显示/隐藏 对话框
 */
declare function DialogDisplayBJ(flag: boolean, whichDialog: dialog, whichPlayer: player): void;

/**
 * 改变 对话框 标题
 */
declare function DialogSetMessageBJ(whichDialog: dialog, message: string): void;

/**
 * 创造对话按钮
 */
declare function DialogAddButtonBJ(whichDialog: dialog, buttonText: string): button;

/**
 * 添加对话框按钮(有快捷键) [R]
 */
/**
 * 添加对话框按钮(有快捷键) [R]
 */
declare function DialogAddButtonWithHotkeyBJ(whichDialog: dialog, buttonText: string, hotkey: number): button;

/**
 * 清除所有对话的标题和按钮
 */
declare function DialogClearBJ(whichDialog: dialog): void;

/**
 * 最后创建的对话按钮
 */
declare function GetLastCreatedButtonBJ(): button;

/**
 * 事件响应: 单击对话按钮
 */
declare function GetClickedButtonBJ(): button;

/**
 * 事件响应 - 单击对话
 */
declare function GetClickedDialogBJ(): dialog;

//***************************************************************************
//*
//*  Alliance Utility Functions
//*
//***************************************************************************
/**
 * 设置联盟详细状态
 */
/**
 * Prevent players from attempting to ally with themselves.
 */
declare function SetPlayerAllianceBJ(sourcePlayer: player, whichAllianceSetting: alliancetype, value: boolean, otherPlayer: player): void;

/**
 * Set all flags used by the in-game "Ally" checkbox.
 */
//
declare function SetPlayerAllianceStateAllyBJ(sourcePlayer: player, otherPlayer: player, flag: boolean): void;

/**
 * Set all flags used by the in-game "Shared Vision" checkbox.
 */
//
declare function SetPlayerAllianceStateVisionBJ(sourcePlayer: player, otherPlayer: player, flag: boolean): void;

/**
 * Set all flags used by the in-game "Shared Units" checkbox.
 */
//
declare function SetPlayerAllianceStateControlBJ(sourcePlayer: player, otherPlayer: player, flag: boolean): void;

/**
 * Set all flags used by the in-game "Shared Units" checkbox with the Full
 */
/**
 * Shared Unit Control feature enabled.
 */
//
declare function SetPlayerAllianceStateFullControlBJ(sourcePlayer: player, otherPlayer: player, flag: boolean): void;

/**
 * 设置联盟状态
 */
/**
 * Prevent players from attempting to ally with themselves.
 */
declare function SetPlayerAllianceStateBJ(sourcePlayer: player, otherPlayer: player, allianceState: number): void;

/**
 * Set the alliance states for an entire force towards another force.
 */

//
/**
 * 设置玩家组联盟状态
 */
declare function SetForceAllianceStateBJ(sourceForce: force, targetForce: force, allianceState: number): void;

/**
 * Test to see if two players are co-allied (allied with each other).
 */

//
/**
 * Players are considered to be allied with themselves.
 */
declare function PlayersAreCoAllied(playerA: player, playerB: player): boolean;

/**
 * Force (whichPlayer) AI player to share vision and advanced unit control
 */
/**
 * with all AI players of its allies.
 */

//
/**
 * 同队共享视野与单位控制权
 */
declare function ShareEverythingWithTeamAI(whichPlayer: player): void;

/**
 * Force (whichPlayer) to share vision and advanced unit control with all of his/her allies.
 */
//
declare function ShareEverythingWithTeam(whichPlayer: player): void;

/**
 * Creates a 'Neutral Victim' player slot.  This slot is passive towards all
 */
/**
 * other players, but all other players are aggressive towards him/her.
 */
//
declare function ConfigureNeutralVictim(): void;

/**
 * 设置玩家所有单位到中立受害者单位
 */
declare function MakeUnitsPassiveForPlayerEnum(): void;

/**
 * Change ownership for every unit of (whichPlayer)'s team to neutral passive.
 */
//
declare function MakeUnitsPassiveForPlayer(whichPlayer: player): void;

/**
 * Change ownership for every unit of (whichPlayer)'s team to neutral passive.
 */
//
declare function MakeUnitsPassiveForTeam(whichPlayer: player): void;

/**
 * Determine whether or not victory/defeat is disabled via cheat codes.
 */
//
declare function AllowVictoryDefeat(gameResult: playergameresult): boolean;

declare function EndGameBJ(): void;

declare function MeleeVictoryDialogBJ(whichPlayer: player, leftGame: boolean): void;

declare function MeleeDefeatDialogBJ(whichPlayer: player, leftGame: boolean): void;

declare function GameOverDialogBJ(whichPlayer: player, leftGame: boolean): void;

declare function RemovePlayerPreserveUnitsBJ(whichPlayer: player, gameResult: playergameresult, leftGame: boolean): void;

declare function CustomVictoryOkBJ(): void;

declare function CustomVictoryQuitBJ(): void;

declare function CustomVictoryDialogBJ(whichPlayer: player): void;

declare function CustomVictorySkipBJ(whichPlayer: player): void;

/**
 * 胜利
 */
declare function CustomVictoryBJ(whichPlayer: player, showDialog: boolean, showScores: boolean): void;

declare function CustomDefeatRestartBJ(): void;

declare function CustomDefeatReduceDifficultyBJ(): void;

declare function CustomDefeatLoadBJ(): void;

declare function CustomDefeatQuitBJ(): void;

declare function CustomDefeatDialogBJ(whichPlayer: player, message: string): void;

/**
 * 游戏失败
 */
/**
 * 游戏失败
 */
declare function CustomDefeatBJ(whichPlayer: player, message: string): void;

/**
 * 设置下一张地图
 */
declare function SetNextLevelBJ(nextLevel: string): void;

/**
 * 显示/隐藏 得分屏幕
 */
declare function SetPlayerOnScoreScreenBJ(flag: boolean, whichPlayer: player): void;

//***************************************************************************
//*
//*  Quest Utility Functions
//*
//***************************************************************************
/**
 * 创建任务t
 */
declare function CreateQuestBJ(questType: number, title: string, description: string, iconPath: string): quest;

/**
 * 删除任务
 */
declare function DestroyQuestBJ(whichQuest: quest): void;

/**
 * 允许/禁止 任务
 */
declare function QuestSetEnabledBJ(enabled: boolean, whichQuest: quest): void;

/**
 * 改变任务标题
 */
declare function QuestSetTitleBJ(whichQuest: quest, title: string): void;

/**
 * 改变任务文本内容
 */
declare function QuestSetDescriptionBJ(whichQuest: quest, description: string): void;

/**
 * 设置任务为完成
 */
declare function QuestSetCompletedBJ(whichQuest: quest, completed: boolean): void;

/**
 * 设置任务为失败
 */
declare function QuestSetFailedBJ(whichQuest: quest, failed: boolean): void;

/**
 * 设置任务被发现
 */
declare function QuestSetDiscoveredBJ(whichQuest: quest, discovered: boolean): void;

/**
 * 最后创建的任务
 */
declare function GetLastCreatedQuestBJ(): quest;

/**
 * 创建任务完成条件
 */
declare function CreateQuestItemBJ(whichQuest: quest, description: string): questitem;

/**
 * 改变任务完成条件内容
 */
declare function QuestItemSetDescriptionBJ(whichQuestItem: questitem, description: string): void;

/**
 * 设置任务完成条件为已完成
 */
declare function QuestItemSetCompletedBJ(whichQuestItem: questitem, completed: boolean): void;

/**
 * 最后创建的任务完成条件
 */
declare function GetLastCreatedQuestItemBJ(): questitem;

/**
 * 创建任务失败条件
 */
declare function CreateDefeatConditionBJ(description: string): defeatcondition;

/**
 * 删除失败条件
 */
declare function DestroyDefeatConditionBJ(whichCondition: defeatcondition): void;

/**
 * 改变失败条件的内容
 */
declare function DefeatConditionSetDescriptionBJ(whichCondition: defeatcondition, description: string): void;

/**
 * 最后创建的任务失败条件
 */
declare function GetLastCreatedDefeatConditionBJ(): defeatcondition;

/**
 * 使任务按钮发光
 */
declare function FlashQuestDialogButtonBJ(): void;

/**
 * 任务消息
 */
declare function QuestMessageBJ(f: force, messageType: number, message: string): void;

//***************************************************************************
//*
//*  Timer Utility Functions
//*
//***************************************************************************
/**
 * 开启计时器
 */
declare function StartTimerBJ(t: timer, periodic: boolean, timeout: number): timer;

declare function CreateTimerBJ(periodic: boolean, timeout: number): timer;

declare function DestroyTimerBJ(whichTimer: timer): void;

/**
 * 暂停计时器r
 */
declare function PauseTimerBJ(pause: boolean, whichTimer: timer): void;

/**
 * 最后创建的计时器
 */
declare function GetLastCreatedTimerBJ(): timer;

/**
 * 创造计时器窗口
 */
declare function CreateTimerDialogBJ(t: timer, title: string): timerdialog;

/**
 * 删除计时器窗口
 */
declare function DestroyTimerDialogBJ(td: timerdialog): void;

/**
 * 改变计时器窗口标题
 */
declare function TimerDialogSetTitleBJ(td: timerdialog, title: string): void;

/**
 * 改变计时器标题颜色
 */
declare function TimerDialogSetTitleColorBJ(td: timerdialog, red: number, green: number, blue: number, transparency: number): void;

/**
 * 改变计时器窗口时间颜色
 */
declare function TimerDialogSetTimeColorBJ(td: timerdialog, red: number, green: number, blue: number, transparency: number): void;

/**
 * 改变计时器窗口速度
 */
declare function TimerDialogSetSpeedBJ(td: timerdialog, speedMultFactor: number): void;

/**
 * 显示/隐藏计时器窗口为玩家
 */
declare function TimerDialogDisplayForPlayerBJ(show: boolean, td: timerdialog, whichPlayer: player): void;

/**
 * 显示/隐藏计时器窗口
 */
declare function TimerDialogDisplayBJ(show: boolean, td: timerdialog): void;

/**
 * 最后创建的计时器窗口
 */
declare function GetLastCreatedTimerDialogBJ(): timerdialog;

//***************************************************************************
//*
//*  Leaderboard Utility Functions
//*
//***************************************************************************
declare function LeaderboardResizeBJ(lb: leaderboard): void;

/**
 * 改变排行榜中玩家的 数值
 */
declare function LeaderboardSetPlayerItemValueBJ(whichPlayer: player, lb: leaderboard, val: number): void;

/**
 * 改变排行榜中玩家 标签
 */
declare function LeaderboardSetPlayerItemLabelBJ(whichPlayer: player, lb: leaderboard, val: string): void;

/**
 * 改变排行榜中玩家的 风格
 */
declare function LeaderboardSetPlayerItemStyleBJ(whichPlayer: player, lb: leaderboard, showLabel: boolean, showValue: boolean, showIcon: boolean): void;

/**
 * 改变排行榜中玩家的 标签颜色
 */
declare function LeaderboardSetPlayerItemLabelColorBJ(whichPlayer: player, lb: leaderboard, red: number, green: number, blue: number, transparency: number): void;

/**
 * 改变排行榜中玩家的 数值颜色
 */
declare function LeaderboardSetPlayerItemValueColorBJ(whichPlayer: player, lb: leaderboard, red: number, green: number, blue: number, transparency: number): void;

/**
 * 改变排行榜 标签颜色
 */
declare function LeaderboardSetLabelColorBJ(lb: leaderboard, red: number, green: number, blue: number, transparency: number): void;

/**
 * 改变排行榜 数值颜色
 */
declare function LeaderboardSetValueColorBJ(lb: leaderboard, red: number, green: number, blue: number, transparency: number): void;

/**
 * 改变排行榜标题
 */
declare function LeaderboardSetLabelBJ(lb: leaderboard, label: string): void;

/**
 * 改变排行榜风格
 */
declare function LeaderboardSetStyleBJ(lb: leaderboard, showLabel: boolean, showNames: boolean, showValues: boolean, showIcons: boolean): void;

declare function LeaderboardGetItemCountBJ(lb: leaderboard): number;

/**
 * 排行榜包含玩家
 */
declare function LeaderboardHasPlayerItemBJ(lb: leaderboard, whichPlayer: player): boolean;

declare function ForceSetLeaderboardBJ(lb: leaderboard, toForce: force): void;

/**
 * 创建排行榜
 */
declare function CreateLeaderboardBJ(toForce: force, label: string): leaderboard;

/**
 * 删除排行榜
 */
declare function DestroyLeaderboardBJ(lb: leaderboard): void;

/**
 * 显示/隐藏 排行榜
 */
declare function LeaderboardDisplayBJ(show: boolean, lb: leaderboard): void;

/**
 * 在排行榜中增加玩家
 */
declare function LeaderboardAddItemBJ(whichPlayer: player, lb: leaderboard, label: string, value: number): void;

/**
 * 在排行榜中删除玩家
 */
declare function LeaderboardRemovePlayerItemBJ(whichPlayer: player, lb: leaderboard): void;

/**
 * 排行榜分类
 */
declare function LeaderboardSortItemsBJ(lb: leaderboard, sortType: number, ascending: boolean): void;

declare function LeaderboardSortItemsByPlayerBJ(lb: leaderboard, ascending: boolean): void;

declare function LeaderboardSortItemsByLabelBJ(lb: leaderboard, ascending: boolean): void;

/**
 * 排行榜位置
 */
declare function LeaderboardGetPlayerIndexBJ(whichPlayer: player, lb: leaderboard): number;

/**
 * Returns the player who is occupying a specified position in a leaderboard.
 */
/**
 * The position parameter is expected in the range of 1..16.
 */

//
/**
 * 玩家在排行榜中第N位
 */
declare function LeaderboardGetIndexedPlayerBJ(position: number, lb: leaderboard): player;

/**
 * 玩家排行榜
 */
declare function PlayerGetLeaderboardBJ(whichPlayer: player): leaderboard;

/**
 * 最后创建的排行榜
 */
declare function GetLastCreatedLeaderboard(): leaderboard;

//***************************************************************************
//*
//*  Multiboard Utility Functions
//*
//***************************************************************************
/**
 * 创建 多列面板
 */
declare function CreateMultiboardBJ(cols: number, rows: number, title: string): multiboard;

/**
 * 删除 多列面板
 */
declare function DestroyMultiboardBJ(mb: multiboard): void;

/**
 * 最后创建的 多列面板
 */
declare function GetLastCreatedMultiboard(): multiboard;

/**
 * 显示/隐藏 多列面板
 */
declare function MultiboardDisplayBJ(show: boolean, mb: multiboard): void;

/**
 * 最大化/最小化 多列面板
 */
declare function MultiboardMinimizeBJ(minimize: boolean, mb: multiboard): void;

/**
 * 改变 多列面板 标题颜色
 */
declare function MultiboardSetTitleTextColorBJ(mb: multiboard, red: number, green: number, blue: number, transparency: number): void;

/**
 * 显示/隐藏 所有 多列面板
 */
declare function MultiboardAllowDisplayBJ(flag: boolean): void;

/**
 * 设置多列面板项目显示风格
 */
declare function MultiboardSetItemStyleBJ(mb: multiboard, col: number, row: number, showValue: boolean, showIcon: boolean): void;

/**
 * 设置多列面板项目文本
 */
declare function MultiboardSetItemValueBJ(mb: multiboard, col: number, row: number, val: string): void;

/**
 * 设置多列面板项目颜色
 */
declare function MultiboardSetItemColorBJ(mb: multiboard, col: number, row: number, red: number, green: number, blue: number, transparency: number): void;

/**
 * 设置多列面板项目宽度
 */
declare function MultiboardSetItemWidthBJ(mb: multiboard, col: number, row: number, width: number): void;

/**
 * 设置项目图标
 */
declare function MultiboardSetItemIconBJ(mb: multiboard, col: number, row: number, iconFileName: string): void;

//***************************************************************************
//*
//*  Text Tag Utility Functions
//*
//***************************************************************************
/**
 * Scale the font size linearly such that size 10 equates to height 0.023.
 */
/**
 * Screen-relative font heights are harder to grasp and than font sizes.
 */
//
declare function TextTagSize2Height(size: number): number;

/**
 * Scale the speed linearly such that speed 128 equates to 0.071.
 */
/**
 * Screen-relative speeds are hard to grasp.
 */
//
declare function TextTagSpeed2Velocity(speed: number): number;

/**
 * 改变漂浮文字颜色
 */
declare function SetTextTagColorBJ(tt: texttag, red: number, green: number, blue: number, transparency: number): void;

/**
 * 设置漂浮文字速度
 */
declare function SetTextTagVelocityBJ(tt: texttag, speed: number, angle: number): void;

/**
 * 改变漂浮文字内容
 */
declare function SetTextTagTextBJ(tt: texttag, s: string, size: number): void;

/**
 * 改变漂浮文字位置到指定点
 */
declare function SetTextTagPosBJ(tt: texttag, loc: location, zOffset: number): void;

/**
 * 改变漂浮文字位置到指定单位
 */
declare function SetTextTagPosUnitBJ(tt: texttag, whichUnit: unit, zOffset: number): void;

/**
 * 暂停/继续漂浮文字
 */
declare function SetTextTagSuspendedBJ(tt: texttag, flag: boolean): void;

/**
 * 永久存在/允许过期
 */
declare function SetTextTagPermanentBJ(tt: texttag, flag: boolean): void;

/**
 * 改变漂浮文字已存在时间
 */
declare function SetTextTagAgeBJ(tt: texttag, age: number): void;

/**
 * 改变漂浮文字存在时限
 */
declare function SetTextTagLifespanBJ(tt: texttag, lifespan: number): void;

/**
 * 改变漂浮文字淡化点
 */
declare function SetTextTagFadepointBJ(tt: texttag, fadepoint: number): void;

/**
 * 创建漂浮文字在 点
 */
declare function CreateTextTagLocBJ(s: string, loc: location, zOffset: number, size: number, red: number, green: number, blue: number, transparency: number): texttag;

/**
 * 创建漂浮文字在单位
 */
declare function CreateTextTagUnitBJ(s: string, whichUnit: unit, zOffset: number, size: number, red: number, green: number, blue: number, transparency: number): texttag;

/**
 * 删除漂浮文字
 */
declare function DestroyTextTagBJ(tt: texttag): void;

/**
 * 显示/隐藏 漂浮文字
 */
declare function ShowTextTagForceBJ(show: boolean, tt: texttag, whichForce: force): void;

/**
 * 最后创建的漂浮文字
 */
declare function GetLastCreatedTextTag(): texttag;

//***************************************************************************
//*
//*  Cinematic Utility Functions
//*
//***************************************************************************
/**
 * 暂停游戏
 */
declare function PauseGameOn(): void;

/**
 * 恢复游戏
 */
declare function PauseGameOff(): void;

/**
 * 授予用户控制权
 */
declare function SetUserControlForceOn(whichForce: force): void;

/**
 * 禁止用户控制权
 */
declare function SetUserControlForceOff(whichForce: force): void;

/**
 * 信箱模式关
 */
declare function ShowInterfaceForceOn(whichForce: force, fadeDuration: number): void;

/**
 * 信箱模式开
 */
declare function ShowInterfaceForceOff(whichForce: force, fadeDuration: number): void;

declare function PingMinimapForForce(whichForce: force, x: number, y: number, duration: number): void;

/**
 * 小地图闪光
 */
declare function PingMinimapLocForForce(whichForce: force, loc: location, duration: number): void;

declare function PingMinimapForPlayer(whichPlayer: player, x: number, y: number, duration: number): void;

declare function PingMinimapLocForPlayer(whichPlayer: player, loc: location, duration: number): void;

declare function PingMinimapForForceEx(whichForce: force, x: number, y: number, duration: number, style: number, red: number, green: number, blue: number): void;

/**
 * 小地图闪光有颜色
 */
declare function PingMinimapLocForForceEx(whichForce: force, loc: location, duration: number, style: number, red: number, green: number, blue: number): void;

/**
 * 允许/禁止 边界色彩
 */
declare function EnableWorldFogBoundaryBJ(enable: boolean, f: force): void;

/**
 * 允许/禁止 闭合
 */
declare function EnableOcclusionBJ(enable: boolean, f: force): void;

//***************************************************************************
//*
//*  Cinematic Transmission Utility Functions
//*
//***************************************************************************
/**
 * If cancelled, stop the sound and end the cinematic scene.
 */
//
declare function CancelCineSceneBJ(): void;

/**
 * Init a trigger to listen for END_CINEMATIC events and respond to them if
 */
/**
 * a cinematic scene is in progress.  For performance reasons, this should
 */

/**
 * only be called once a cinematic scene has been started, so that maps
 */
/**
 * lacking such scenes do not bother to register for these events.
 */
//
declare function TryInitCinematicBehaviorBJ(): void;

declare function SetCinematicSceneBJ(soundHandle: sound, portraitUnitId: number, color: playercolor, speakerTitle: string, text: string, sceneDuration: number, voiceoverDuration: number): void;

declare function GetTransmissionDuration(soundHandle: sound, timeType: number, timeVal: number): number;

declare function WaitTransmissionDuration(soundHandle: sound, timeType: number, timeVal: number): void;

declare function DoTransmissionBasicsXYBJ(unitId: number, color: playercolor, x: number, y: number, soundHandle: sound, unitName: string, message: string, duration: number): void;

/**
 * Display a text message to a Player Group with an accompanying sound,
 */
/**
 * portrait, speech indicator, and all that good stuff.
 */
/**
 * - Query duration of sound
 */
/**
 * - Play sound
 */
/**
 * - Display text message for duration
 */
/**
 * - Display animating portrait for duration
 */
/**
 * - Display a speech indicator for the unit
 */
/**
 * - Ping the minimap
 */

//
/**
 * 播送 单位消息
 */
declare function TransmissionFromUnitWithNameBJ(toForce: force, whichUnit: unit, unitName: string, soundHandle: sound, message: string, timeType: number, timeVal: number, wait: boolean): void;

//Make sure that the runtime unit type and the parameter are the same,
declare function PlayDialogueFromSpeakerEx(toForce: force, speaker: unit, speakerType: number, soundHandle: sound, timeType: number, timeVal: number, wait: boolean): boolean;

declare function PlayDialogueFromSpeakerTypeEx(toForce: force, fromPlayer: player, speakerType: number, loc: location, soundHandle: sound, timeType: number, timeVal: number, wait: boolean): boolean;

/**
 * This operates like TransmissionFromUnitWithNameBJ, but for a unit type
 */
/**
 * rather than a unit instance.  As such, no speech indicator is employed.
 */

//
/**
 * 播送 单位[类型]消息
 */
declare function TransmissionFromUnitTypeWithNameBJ(toForce: force, fromPlayer: player, unitId: number, unitName: string, loc: location, soundHandle: sound, message: string, timeType: number, timeVal: number, wait: boolean): void;

/**
 * 最后 播送的 单位消息 的时间长度
 */
declare function GetLastTransmissionDurationBJ(): number;

/**
 * 副标题显示超过
 */
declare function ForceCinematicSubtitlesBJ(flag: boolean): void;

//***************************************************************************
//*
//*  Cinematic Mode Utility Functions
//*
//***************************************************************************
/**
 * Makes many common UI settings changes at once, for use when beginning and
 */
/**
 * ending cinematic sequences.  Note that some affects apply to all players,
 */
/**
 * such as game speed.  This is unavoidable.
 */
/**
 * - Clear the screen of text messages
 */
/**
 * - Hide interface UI (letterbox mode)
 */
/**
 * - Hide game messages (ally under attack, etc.)
 */
/**
 * - Disable user control
 */
/**
 * - Disable occlusion
 */
/**
 * - Set game speed (for all players)
 */
/**
 * - Lock game speed (for all players)
 */
/**
 * - Disable black mask (for all players)
 */
/**
 * - Disable fog of war (for all players)
 */
/**
 * - Disable world boundary fog (for all players)
 */
/**
 * - Dim non-speech sound channels
 */
/**
 * - End any outstanding music themes
 */
/**
 * - Fix the random seed to a set value
 */
/**
 * - Reset the camera smoothing factor
 */
//
/**
 * 切换影片模式(时间)
 */
/**
 * If the game hasn't started yet, perform interface fades immediately
 */
declare function CinematicModeExBJ(cineMode: boolean, forForce: force, interfaceFadeTime: number): void;

/**
 * 切换影片模式
 */
declare function CinematicModeBJ(cineMode: boolean, forForce: force): void;

//***************************************************************************
//*
//*  Cinematic Filter Utility Functions
//*
//***************************************************************************
/**
 * 显示/隐藏过滤器
 */
declare function DisplayCineFilterBJ(flag: boolean): void;

declare function CinematicFadeCommonBJ(red: number, green: number, blue: number, duration: number, tex: string, startTrans: number, endTrans: number): void;

declare function FinishCinematicFadeBJ(): void;

/**
 * Create a timer to end the cinematic fade.
 */
declare function FinishCinematicFadeAfterBJ(duration: number): void;

declare function ContinueCinematicFadeBJ(): void;

declare function ContinueCinematicFadeAfterBJ(duration: number, red: number, green: number, blue: number, trans: number, tex: string): void;

declare function AbortCinematicFadeBJ(): void;

/**
 * 淡化的过滤器
 */
declare function CinematicFadeBJ(fadetype: number, duration: number, tex: string, red: number, green: number, blue: number, trans: number): void;

/**
 * 高级的过滤器
 */
declare function CinematicFilterGenericBJ(duration: number, bmode: blendmode, tex: string, red0: number, green0: number, blue0: number, trans0: number, red1: number, green1: number, blue1: number, trans1: number): void;

//***************************************************************************
//*
//*  Rescuable Unit Utility Functions
//*
//***************************************************************************
/**
 * Rescues a unit for a player.  This performs the default rescue behavior,
 */
/**
 * including a rescue sound, flashing selection circle, ownership change,
 */
/**
 * and optionally a unit color change.
 */

//
/**
 * 营救单位
 */
declare function RescueUnitBJ(whichUnit: unit, rescuer: player, changeColor: boolean): void;

declare function TriggerActionUnitRescuedBJ(): void;

/**
 * Attempt to init triggers for default rescue behavior.  For performance
 */

/**
 * reasons, this should only be attempted if a player is set to Rescuable,
 */
/**
 * or if a specific unit is thus flagged.
 */
//
declare function TryInitRescuableTriggersBJ(): void;

/**
 * Determines whether or not rescued units automatically change color upon
 */
/**
 * being rescued.
 */

//
/**
 * 安排营救单位行为
 */
declare function SetRescueUnitColorChangeBJ(changeColor: boolean): void;

/**
 * Determines whether or not rescued buildings automatically change color
 */
/**
 * upon being rescued.
 */
//
/**
 * 设置营救颜色(建筑)
 */
/**
 * 设置营救颜色(建筑)
 */
declare function SetRescueBuildingColorChangeBJ(changeColor: boolean): void;

/**
 * 安排营救单位
 */
declare function MakeUnitRescuableToForceBJEnum(): void;

/**
 * Flag the unit as rescuable/unrescuable for the appropriate players.
 */
declare function MakeUnitRescuableToForceBJ(whichUnit: unit, isRescuable: boolean, whichForce: force): void;

declare function InitRescuableBehaviorBJ(): void;

//***************************************************************************
//*
//*  Research and Upgrade Utility Functions
//*
//***************************************************************************
/**
 * 设置当前科技级别
 */
declare function SetPlayerTechResearchedSwap(techid: number, levels: number, whichPlayer: player): void;

/**
 * 设置最高科技级别
 */
declare function SetPlayerTechMaxAllowedSwap(techid: number, maximum: number, whichPlayer: player): void;

/**
 * 设置英雄 的训练限制
 */
declare function SetPlayerMaxHeroesAllowed(maximum: number, whichPlayer: player): void;

/**
 * 科技等级
 */
declare function GetPlayerTechCountSimple(techid: number, whichPlayer: player): number;

/**
 * 最大科技等级
 */
declare function GetPlayerTechMaxAllowedSwap(techid: number, whichPlayer: player): number;

/**
 * 允许/禁止 技能
 */
declare function SetPlayerAbilityAvailableBJ(avail: boolean, abilid: number, whichPlayer: player): void;

//***************************************************************************
//*
//*  Campaign Utility Functions
//*
//***************************************************************************
/**
 * 设置读取地图画面
 */
declare function SetCampaignMenuRaceBJ(campaignNumber: number): void;

/**
 * Converts a single campaign mission designation into campaign and mission
 */
/**
 * numbers.  The 1000's digit is considered the campaign index, and the 1's
 */
/**
 * digit is considered the mission index within that campaign.  This is done
 */
/**
 * so that the trigger for this can use a single drop-down to list all of
 */
/**
 * the campaign missions.
 */

//
/**
 * 允许/禁止 任务
 */
declare function SetMissionAvailableBJ(available: boolean, missionIndex: number): void;

/**
 * 允许/禁止 战役
 */
declare function SetCampaignAvailableBJ(available: boolean, campaignNumber: number): void;

/**
 * 允许/禁止 过场电影
 */
declare function SetCinematicAvailableBJ(available: boolean, cinematicIndex: number): void;

/**
 * 创建游戏缓存
 */
declare function InitGameCacheBJ(campaignFile: string): gamecache;

/**
 * 存储游戏缓存
 */
declare function SaveGameCacheBJ(cache: gamecache): boolean;

/**
 * 最后创建的游戏缓存
 */
declare function GetLastCreatedGameCacheBJ(): gamecache;

/**
 * <1.24> 新建哈希表
 */
/**
 * <1.24> 新建哈希表
 */
declare function InitHashtableBJ(): hashtable;

/**
 * 最后创建的哈希表
 */
/**
 * 最后创建的哈希表
 */
declare function GetLastCreatedHashtableBJ(): hashtable;

/**
 * 贮藏 实数
 */
declare function StoreRealBJ(value: number, key: string, missionKey: string, cache: gamecache): void;

/**
 * 贮藏 整数
 */
declare function StoreIntegerBJ(value: number, key: string, missionKey: string, cache: gamecache): void;

/**
 * 贮藏 布尔变量
 */
declare function StoreBooleanBJ(value: boolean, key: string, missionKey: string, cache: gamecache): void;

/**
 * 贮藏 字串符
 */
declare function StoreStringBJ(value: string, key: string, missionKey: string, cache: gamecache): boolean;

/**
 * 贮藏 单位
 */
declare function StoreUnitBJ(whichUnit: unit, key: string, missionKey: string, cache: gamecache): boolean;

/**
 * <1.24> 保存实数
 */
declare function SaveRealBJ(value: number, key: number, missionKey: number, table: hashtable): void;

/**
 * <1.24> 保存整数
 */
declare function SaveIntegerBJ(value: number, key: number, missionKey: number, table: hashtable): void;

/**
 * <1.24> 保存布尔
 */
declare function SaveBooleanBJ(value: boolean, key: number, missionKey: number, table: hashtable): void;

/**
 * <1.24> 保存字符串
 */
declare function SaveStringBJ(value: string, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存玩家
 */
declare function SavePlayerHandleBJ(whichPlayer: player, key: number, missionKey: number, table: hashtable): boolean;

declare function SaveWidgetHandleBJ(whichWidget: widget, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存可破坏物
 */
declare function SaveDestructableHandleBJ(whichDestructable: destructable, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存物品
 */
declare function SaveItemHandleBJ(whichItem: item, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存单位
 */
declare function SaveUnitHandleBJ(whichUnit: unit, key: number, missionKey: number, table: hashtable): boolean;

declare function SaveAbilityHandleBJ(whichAbility: ability, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存计时器
 */
declare function SaveTimerHandleBJ(whichTimer: timer, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存触发器
 */
declare function SaveTriggerHandleBJ(whichTrigger: trigger, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存触发条件
 */
declare function SaveTriggerConditionHandleBJ(whichTriggercondition: triggercondition, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存触发动作
 */
declare function SaveTriggerActionHandleBJ(whichTriggeraction: triggeraction, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存触发事件
 */
declare function SaveTriggerEventHandleBJ(whichEvent: event, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存玩家组
 */
declare function SaveForceHandleBJ(whichForce: force, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存单位组
 */
declare function SaveGroupHandleBJ(whichGroup: group, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存点
 */
declare function SaveLocationHandleBJ(whichLocation: location, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存区域(矩型)
 */
declare function SaveRectHandleBJ(whichRect: rect, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存布尔表达式
 */
declare function SaveBooleanExprHandleBJ(whichBoolexpr: boolexpr, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存音效
 */
declare function SaveSoundHandleBJ(whichSound: sound, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存特效
 */
declare function SaveEffectHandleBJ(whichEffect: effect, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存单位池
 */
declare function SaveUnitPoolHandleBJ(whichUnitpool: unitpool, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存物品池
 */
declare function SaveItemPoolHandleBJ(whichItempool: itempool, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存任务
 */
declare function SaveQuestHandleBJ(whichQuest: quest, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存任务要求
 */
declare function SaveQuestItemHandleBJ(whichQuestitem: questitem, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存失败条件
 */
declare function SaveDefeatConditionHandleBJ(whichDefeatcondition: defeatcondition, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存计时器窗口
 */
declare function SaveTimerDialogHandleBJ(whichTimerdialog: timerdialog, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存排行榜
 */
declare function SaveLeaderboardHandleBJ(whichLeaderboard: leaderboard, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存多面板
 */
declare function SaveMultiboardHandleBJ(whichMultiboard: multiboard, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存多面板项目
 */
declare function SaveMultiboardItemHandleBJ(whichMultiboarditem: multiboarditem, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存可追踪物
 */
declare function SaveTrackableHandleBJ(whichTrackable: trackable, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存对话框
 */
declare function SaveDialogHandleBJ(whichDialog: dialog, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存对话框按钮
 */
declare function SaveButtonHandleBJ(whichButton: button, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存漂浮文字
 */
declare function SaveTextTagHandleBJ(whichTexttag: texttag, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存闪电效果
 */
declare function SaveLightningHandleBJ(whichLightning: lightning, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存图像
 */
declare function SaveImageHandleBJ(whichImage: image, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存地面纹理变化
 */
declare function SaveUbersplatHandleBJ(whichUbersplat: ubersplat, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存区域(不规则)
 */
declare function SaveRegionHandleBJ(whichRegion: region, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存迷雾状态
 */
declare function SaveFogStateHandleBJ(whichFogState: fogstate, key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 保存可见度修正器
 */
declare function SaveFogModifierHandleBJ(whichFogModifier: fogmodifier, key: number, missionKey: number, table: hashtable): boolean;

declare function SaveAgentHandleBJ(whichAgent: agent, key: number, missionKey: number, table: hashtable): boolean;

declare function SaveHashtableHandleBJ(whichHashtable: hashtable, key: number, missionKey: number, table: hashtable): boolean;

/**
 * 读取实数值
 */
//call SyncStoredReal(cache, missionKey, key)
declare function GetStoredRealBJ(key: string, missionKey: string, cache: gamecache): number;

/**
 * 读取整数数据
 */
//call SyncStoredInteger(cache, missionKey, key)
declare function GetStoredIntegerBJ(key: string, missionKey: string, cache: gamecache): number;

/**
 * 读取布尔值
 */
//call SyncStoredBoolean(cache, missionKey, key)
declare function GetStoredBooleanBJ(key: string, missionKey: string, cache: gamecache): boolean;

/**
 * 度曲字串符数据
 */
declare function GetStoredStringBJ(key: string, missionKey: string, cache: gamecache): string;

/**
 * <1.24> 从哈希表提取实数
 */
//call SyncStoredReal(table, missionKey, key)
declare function LoadRealBJ(key: number, missionKey: number, table: hashtable): number;

/**
 * <1.24> 从哈希表提取整数
 */
//call SyncStoredInteger(table, missionKey, key)
declare function LoadIntegerBJ(key: number, missionKey: number, table: hashtable): number;

/**
 * <1.24> 从哈希表提取布尔
 */
//call SyncStoredBoolean(table, missionKey, key)
declare function LoadBooleanBJ(key: number, missionKey: number, table: hashtable): boolean;

/**
 * <1.24> 从哈希表提取字符串
 */
declare function LoadStringBJ(key: number, missionKey: number, table: hashtable): string;

/**
 * <1.24> 从哈希表提取玩家
 */
declare function LoadPlayerHandleBJ(key: number, missionKey: number, table: hashtable): player;

declare function LoadWidgetHandleBJ(key: number, missionKey: number, table: hashtable): widget;

/**
 * <1.24> 从哈希表提取可破坏物
 */
declare function LoadDestructableHandleBJ(key: number, missionKey: number, table: hashtable): destructable;

/**
 * <1.24> 从哈希表提取物品
 */
declare function LoadItemHandleBJ(key: number, missionKey: number, table: hashtable): item;

/**
 * <1.24> 从哈希表提取单位
 */
declare function LoadUnitHandleBJ(key: number, missionKey: number, table: hashtable): unit;

declare function LoadAbilityHandleBJ(key: number, missionKey: number, table: hashtable): ability;

/**
 * <1.24> 从哈希表提取计时器
 */
declare function LoadTimerHandleBJ(key: number, missionKey: number, table: hashtable): timer;

/**
 * <1.24> 从哈希表提取触发器
 */
declare function LoadTriggerHandleBJ(key: number, missionKey: number, table: hashtable): trigger;

/**
 * <1.24> 从哈希表提取触发条件
 */
declare function LoadTriggerConditionHandleBJ(key: number, missionKey: number, table: hashtable): triggercondition;

/**
 * <1.24> 从哈希表提取触发动作
 */
declare function LoadTriggerActionHandleBJ(key: number, missionKey: number, table: hashtable): triggeraction;

/**
 * <1.24> 从哈希表提取触发事件
 */
declare function LoadTriggerEventHandleBJ(key: number, missionKey: number, table: hashtable): event;

/**
 * <1.24> 从哈希表提取玩家组
 */
declare function LoadForceHandleBJ(key: number, missionKey: number, table: hashtable): force;

/**
 * <1.24> 从哈希表提取单位组
 */
declare function LoadGroupHandleBJ(key: number, missionKey: number, table: hashtable): group;

/**
 * <1.24> 从哈希表提取点
 */
declare function LoadLocationHandleBJ(key: number, missionKey: number, table: hashtable): location;

/**
 * <1.24> 从哈希表提取区域(矩型)
 */
declare function LoadRectHandleBJ(key: number, missionKey: number, table: hashtable): rect;

/**
 * <1.24> 从哈希表提取布尔表达式
 */
declare function LoadBooleanExprHandleBJ(key: number, missionKey: number, table: hashtable): boolexpr;

/**
 * <1.24> 从哈希表提取音效
 */
declare function LoadSoundHandleBJ(key: number, missionKey: number, table: hashtable): sound;

/**
 * <1.24> 从哈希表提取特效
 */
declare function LoadEffectHandleBJ(key: number, missionKey: number, table: hashtable): effect;

/**
 * <1.24> 从哈希表提取单位池
 */
declare function LoadUnitPoolHandleBJ(key: number, missionKey: number, table: hashtable): unitpool;

/**
 * <1.24> 从哈希表提取物品池
 */
declare function LoadItemPoolHandleBJ(key: number, missionKey: number, table: hashtable): itempool;

/**
 * <1.24> 从哈希表提取任务
 */
declare function LoadQuestHandleBJ(key: number, missionKey: number, table: hashtable): quest;

/**
 * <1.24> 从哈希表提取任务要求
 */
declare function LoadQuestItemHandleBJ(key: number, missionKey: number, table: hashtable): questitem;

/**
 * <1.24> 从哈希表提取失败条件
 */
declare function LoadDefeatConditionHandleBJ(key: number, missionKey: number, table: hashtable): defeatcondition;

/**
 * <1.24> 从哈希表提取计时器窗口
 */
declare function LoadTimerDialogHandleBJ(key: number, missionKey: number, table: hashtable): timerdialog;

/**
 * <1.24> 从哈希表提取排行榜
 */
declare function LoadLeaderboardHandleBJ(key: number, missionKey: number, table: hashtable): leaderboard;

/**
 * <1.24> 从哈希表提取多面板
 */
declare function LoadMultiboardHandleBJ(key: number, missionKey: number, table: hashtable): multiboard;

/**
 * <1.24> 从哈希表提取多面板项目
 */
declare function LoadMultiboardItemHandleBJ(key: number, missionKey: number, table: hashtable): multiboarditem;

/**
 * <1.24> 从哈希表提取可追踪物
 */
declare function LoadTrackableHandleBJ(key: number, missionKey: number, table: hashtable): trackable;

/**
 * <1.24> 从哈希表提取对话框
 */
declare function LoadDialogHandleBJ(key: number, missionKey: number, table: hashtable): dialog;

/**
 * <1.24> 从哈希表提取对话框按钮
 */
declare function LoadButtonHandleBJ(key: number, missionKey: number, table: hashtable): button;

/**
 * <1.24> 从哈希表提取漂浮文字
 */
declare function LoadTextTagHandleBJ(key: number, missionKey: number, table: hashtable): texttag;

/**
 * <1.24> 从哈希表提取闪电效果
 */
declare function LoadLightningHandleBJ(key: number, missionKey: number, table: hashtable): lightning;

/**
 * <1.24> 从哈希表提取图象
 */
declare function LoadImageHandleBJ(key: number, missionKey: number, table: hashtable): image;

/**
 * <1.24> 从哈希表提取地面纹理变化
 */
declare function LoadUbersplatHandleBJ(key: number, missionKey: number, table: hashtable): ubersplat;

/**
 * <1.24> 从哈希表提取区域(不规则)
 */
declare function LoadRegionHandleBJ(key: number, missionKey: number, table: hashtable): region;

/**
 * <1.24> 从哈希表提取迷雾状态
 */
declare function LoadFogStateHandleBJ(key: number, missionKey: number, table: hashtable): fogstate;

/**
 * <1.24> 从哈希表提取可见度修正器
 */
declare function LoadFogModifierHandleBJ(key: number, missionKey: number, table: hashtable): fogmodifier;

declare function LoadHashtableHandleBJ(key: number, missionKey: number, table: hashtable): hashtable;

/**
 * 读取单位 (有角度)
 */
//call SyncStoredUnit(cache, missionKey, key)
declare function RestoreUnitLocFacingAngleBJ(key: string, missionKey: string, cache: gamecache, forWhichPlayer: player, loc: location, facing: number): unit;

/**
 * 读取单位 (有位置方向)
 */
//call SyncStoredUnit(cache, missionKey, key)
declare function RestoreUnitLocFacingPointBJ(key: string, missionKey: string, cache: gamecache, forWhichPlayer: player, loc: location, lookAt: location): unit;

/**
 * 最后恢复的单位
 */
declare function GetLastRestoredUnitBJ(): unit;

/**
 * 清除所有缓存
 */
declare function FlushGameCacheBJ(cache: gamecache): void;

/**
 * 清除缓存[分类]
 */
declare function FlushStoredMissionBJ(missionKey: string, cache: gamecache): void;

/**
 * <1.24> 清空哈希表
 */
declare function FlushParentHashtableBJ(table: hashtable): void;

/**
 * <1.24> 清空哈希表主索引
 */
declare function FlushChildHashtableBJ(missionKey: number, table: hashtable): void;

/**
 * 游戏缓存的数据
 */
declare function HaveStoredValue(key: string, valueType: number, missionKey: string, cache: gamecache): boolean;

/**
 * <1.24> 哈希项存在
 */
declare function HaveSavedValue(key: number, valueType: number, missionKey: number, table: hashtable): boolean;

/**
 * 显示/隐藏自定义战役按钮
 */
declare function ShowCustomCampaignButton(show: boolean, whichButton: number): void;

/**
 * 自定义战役按钮是可见的
 */
declare function IsCustomCampaignButtonVisibile(whichButton: number): boolean;

/**
 * Placeholder function for auto save feature
 */
declare function SaveGameCheckPointBJ(mapSaveName: string, doCheckpointHint: boolean): void;

/**
 * 读取游戏进度
 */
declare function LoadGameBJ(loadFileName: string, doScoreScreen: boolean): void;

/**
 * 保存进度同时设置下一张地图
 */
declare function SaveAndChangeLevelBJ(saveFileName: string, newLevel: string, doScoreScreen: boolean): void;

/**
 * 保存进度同时读取进度
 */
declare function SaveAndLoadGameBJ(saveFileName: string, loadFileName: string, doScoreScreen: boolean): void;

/**
 * 重命名游戏进度文件夹
 */
declare function RenameSaveDirectoryBJ(sourceDirName: string, destDirName: string): boolean;

/**
 * 删除游戏进度文件夹
 */
declare function RemoveSaveDirectoryBJ(sourceDirName: string): boolean;

/**
 * 复制游戏进度
 */
declare function CopySaveGameBJ(sourceSaveName: string, destSaveName: string): boolean;

//***************************************************************************
//*
//*  Miscellaneous Utility Functions
//*
//***************************************************************************
declare function GetPlayerStartLocationX(whichPlayer: player): number;

declare function GetPlayerStartLocationY(whichPlayer: player): number;

/**
 * 玩家的初始位置
 */
declare function GetPlayerStartLocationLoc(whichPlayer: player): location;

/**
 * 区域中心
 */
declare function GetRectCenter(whichRect: rect): location;

declare function IsPlayerSlotState(whichPlayer: player, whichState: playerslotstate): boolean;

declare function GetFadeFromSeconds(seconds: number): number;

declare function GetFadeFromSecondsAsReal(seconds: number): number;

declare function AdjustPlayerStateSimpleBJ(whichPlayer: player, whichPlayerState: playerstate, delta: number): void;

/**
 * 增加玩家属性值
 */
/**
 * If the change was positive, apply the difference to the player's
 */
declare function AdjustPlayerStateBJ(delta: number, whichPlayer: player, whichPlayerState: playerstate): void;

declare function SetPlayerStateBJ(whichPlayer: player, whichPlayerState: playerstate, value: number): void;

/**
 * 打开/关闭 玩家参数
 */
declare function SetPlayerFlagBJ(whichPlayerFlag: playerstate, flag: boolean, whichPlayer: player): void;

/**
 * 截留玩家收入 (税率)
 */
declare function SetPlayerTaxRateBJ(rate: number, whichResource: playerstate, sourcePlayer: player, otherPlayer: player): void;

/**
 * 获得玩家税率
 */
declare function GetPlayerTaxRateBJ(whichResource: playerstate, sourcePlayer: player, otherPlayer: player): number;

/**
 * 玩家旗是打开的
 */
declare function IsPlayerFlagSetBJ(whichPlayerFlag: playerstate, whichPlayer: player): boolean;

/**
 * 增加黄金到金矿
 */
declare function AddResourceAmountBJ(delta: number, whichUnit: unit): void;

/**
 * 玩家索引
 */
declare function GetConvertedPlayerId(whichPlayer: player): number;

/**
 * 将玩家索引转换为玩家
 */
declare function ConvertedPlayer(convertedPlayerId: number): player;

/**
 * 区域宽度
 */
declare function GetRectWidthBJ(r: rect): number;

/**
 * 区域高度
 */
declare function GetRectHeightBJ(r: rect): number;

/**
 * Replaces a gold mine with a blighted gold mine for the given player.
 */

//
/**
 * 设置金矿为不死族金矿
 */
declare function BlightGoldMineForPlayerBJ(goldMine: unit, whichPlayer: player): unit;

declare function BlightGoldMineForPlayer(goldMine: unit, whichPlayer: player): unit;

/**
 * 最后建造的不死族金矿
 */
declare function GetLastHauntedGoldMine(): unit;

/**
 * 点是不死族的地表
 */
declare function IsPointBlightedBJ(where: location): boolean;

/**
 * 改变玩家颜色
 */
declare function SetPlayerColorBJEnum(): void;

declare function SetPlayerColorBJ(whichPlayer: player, color: playercolor, changeExisting: boolean): void;

/**
 * 设置训练/建造单位可用性
 */
declare function SetPlayerUnitAvailableBJ(unitId: number, allowed: boolean, whichPlayer: player): void;

/**
 * 锁定游戏速度
 */
declare function LockGameSpeedBJ(): void;

/**
 * 解锁游戏速度
 */
declare function UnlockGameSpeedBJ(): void;

declare function IssueTargetOrderBJ(whichUnit: unit, order: string, targetWidget: widget): boolean;

declare function IssuePointOrderLocBJ(whichUnit: unit, order: string, whichLocation: location): boolean;

/**
 * Two distinct trigger actions can't share the same function name, so this
 */
/**
 * dummy function simply mimics the behavior of an existing call.
 */

//
/**
 * 给单位发送命令到 可毁坏物
 */
declare function IssueTargetDestructableOrder(whichUnit: unit, order: string, targetWidget: widget): boolean;

/**
 * 给单位发送命令到 物品
 */
declare function IssueTargetItemOrder(whichUnit: unit, order: string, targetWidget: widget): boolean;

declare function IssueImmediateOrderBJ(whichUnit: unit, order: string): boolean;

declare function GroupTargetOrderBJ(whichGroup: group, order: string, targetWidget: widget): boolean;

declare function GroupPointOrderLocBJ(whichGroup: group, order: string, whichLocation: location): boolean;

declare function GroupImmediateOrderBJ(whichGroup: group, order: string): boolean;

/**
 * Two distinct trigger actions can't share the same function name, so this
 */
/**
 * dummy function simply mimics the behavior of an existing call.
 */

//
/**
 * 发送单位组命令到 可毁坏物
 */
declare function GroupTargetDestructableOrder(whichGroup: group, order: string, targetWidget: widget): boolean;

/**
 * 发送单位组命令到 物品
 */
declare function GroupTargetItemOrder(whichGroup: group, order: string, targetWidget: widget): boolean;

/**
 * 垂死的可毁坏物
 */
declare function GetDyingDestructable(): destructable;

/**
 * Rally point setting
 */

//
/**
 * 设置 聚集点 在点
 */
declare function SetUnitRallyPoint(whichUnit: unit, targPos: location): void;

/**
 * 设置 聚集点 在单位
 */
declare function SetUnitRallyUnit(whichUnit: unit, targUnit: unit): void;

/**
 * 设置 聚集点 在可毁坏物
 */
declare function SetUnitRallyDestructable(whichUnit: unit, targDest: destructable): void;

/**
 * Utility function for use by editor-generated item drop table triggers.
 */

/**
 * This function is added as an action to all destructable drop triggers,
 */
/**
 * so that a widget drop may be differentiated from a unit drop.
 */
//
declare function SaveDyingWidget(): void;

/**
 * 创造/删除 不死族地表在区域
 */
declare function SetBlightRectBJ(addBlight: boolean, whichPlayer: player, r: rect): void;

/**
 * 创造/删除 不死族地表在圆周
 */
declare function SetBlightRadiusLocBJ(addBlight: boolean, whichPlayer: player, loc: location, radius: number): void;

/**
 * 技能名字
 */
declare function GetAbilityName(abilcode: number): string;

//***************************************************************************
//*
//*  Melee Template Visibility Settings
//*
//***************************************************************************
/**
 * 对用对战的时间设置
 */
/**
 * Start by setting the ToD.
 */
declare function MeleeStartingVisibility(): void;

//***************************************************************************
//*
//*  Melee Template Starting Resources
//*
//***************************************************************************
/**
 * 设置初始资源
 */
declare function MeleeStartingResources(): void;

//***************************************************************************
//*
//*  Melee Template Hero Limit
//*
//***************************************************************************
declare function ReducePlayerTechMaxAllowed(whichPlayer: player, techId: number, limit: number): void;

/**
 * 英雄数量限制
 */
declare function MeleeStartingHeroLimit(): void;

//***************************************************************************
//*
//*  Melee Template Granted Hero Items
//*
//***************************************************************************
declare function MeleeTrainedUnitIsHeroBJFilter(): boolean;

/**
 * The first N heroes trained or hired for each player start off with a
 */

/**
 * standard set of items.  This is currently:
 */
/**
 * - 1x Scroll of Town Portal
 */
//
declare function MeleeGrantItemsToHero(whichUnit: unit): void;

declare function MeleeGrantItemsToTrainedHero(): void;

declare function MeleeGrantItemsToHiredHero(): void;

/**
 * 英雄初始物品
 */
declare function MeleeGrantHeroItems(): void;

//***************************************************************************
//*
//*  Melee Template Clear Start Locations
//*
//***************************************************************************
declare function MeleeClearExcessUnit(): void;

declare function MeleeClearNearbyUnits(x: number, y: number, range: number): void;

/**
 * 删除多余单位
 */
declare function MeleeClearExcessUnits(): void;

//***************************************************************************
//*
//*  Melee Template Starting Units
//*
//***************************************************************************
declare function MeleeEnumFindNearestMine(): void;

declare function MeleeFindNearestMine(src: location, range: number): unit;

declare function MeleeRandomHeroLoc(p: player, id1: number, id2: number, id3: number, id4: number, loc: location): unit;

/**
 * Returns a location which is (distance) away from (src) in the direction of (targ).
 */
//
declare function MeleeGetProjectedLoc(src: location, targ: location, distance: number, deltaAngle: number): location;

declare function MeleeGetNearestValueWithin(val: number, minVal: number, maxVal: number): number;

declare function MeleeGetLocWithinRect(src: location, r: rect): location;

/**
 * Starting Units for Human Players
 */
/**
 * - 1 Town Hall, placed at start location
 */
/**
 * - 5 Peasants, placed between start location and nearest gold mine
 */

//
/**
 * 创建初始单位
 */
declare function MeleeStartingUnitsHuman(whichPlayer: player, startLoc: location, doHeroes: boolean, doCamera: boolean, doPreload: boolean): void;

/**
 * Starting Units for Orc Players
 */

/**
 * - 1 Great Hall, placed at start location
 */
/**
 * - 5 Peons, placed between start location and nearest gold mine
 */
//
declare function MeleeStartingUnitsOrc(whichPlayer: player, startLoc: location, doHeroes: boolean, doCamera: boolean, doPreload: boolean): void;

/**
 * Starting Units for Undead Players
 */
/**
 * - 1 Necropolis, placed at start location
 */
/**
 * - 1 Haunted Gold Mine, placed on nearest gold mine
 */
/**
 * - 3 Acolytes, placed between start location and nearest gold mine
 */

/**
 * - 1 Ghoul, placed between start location and nearest gold mine
 */
/**
 * - Blight, centered on nearest gold mine, spread across a "large area"
 */
//
declare function MeleeStartingUnitsUndead(whichPlayer: player, startLoc: location, doHeroes: boolean, doCamera: boolean, doPreload: boolean): void;

/**
 * Starting Units for Night Elf Players
 */

/**
 * - 1 Tree of Life, placed by nearest gold mine, already entangled
 */
/**
 * - 5 Wisps, placed between Tree of Life and nearest gold mine
 */
//
declare function MeleeStartingUnitsNightElf(whichPlayer: player, startLoc: location, doHeroes: boolean, doCamera: boolean, doPreload: boolean): void;

/**
 * Starting Units for Players Whose Race is Unknown
 */
/**
 * - 12 Sheep, placed randomly around the start location
 */
//
declare function MeleeStartingUnitsUnknownRace(whichPlayer: player, startLoc: location, doHeroes: boolean, doCamera: boolean, doPreload: boolean): void;

declare function MeleeStartingUnits(): void;

/**
 * 创建初始单位为了玩家
 */
/**
 * Create initial race-specific starting units
 */
declare function MeleeStartingUnitsForPlayer(whichRace: race, whichPlayer: player, loc: location, doHeroes: boolean): void;

//***************************************************************************
//*
//*  Melee Template Starting AI Scripts
//*
//***************************************************************************
declare function PickMeleeAI(num: player, s1: string, s2: string, s3: string): void;

/**
 * 运行对战 AI
 */
declare function MeleeStartingAI(): void;

/**
 * 锁定的防守职责
 */
declare function LockGuardPosition(targ: unit): void;

/**
 * base from bj
 */
/**
 *  π
 */
declare const bj_PI: number;
declare const bj_E: number;
/**
 *  单元点宽度
 */
declare const bj_CELLWIDTH: number;
declare const bj_CLIFFHEIGHT: number;
/**
 *  默认建筑朝向
 */
declare const bj_UNIT_FACING: number;
declare const bj_RADTODEG: number;
declare const bj_DEGTORAD: number;
declare const bj_TEXT_DELAY_QUEST: number;
declare const bj_TEXT_DELAY_QUESTUPDATE: number;
declare const bj_TEXT_DELAY_QUESTDONE: number;
declare const bj_TEXT_DELAY_QUESTFAILED: number;
declare const bj_TEXT_DELAY_QUESTREQUIREMENT: number;
declare const bj_TEXT_DELAY_MISSIONFAILED: number;
declare const bj_TEXT_DELAY_ALWAYSHINT: number;
declare const bj_TEXT_DELAY_HINT: number;
declare const bj_TEXT_DELAY_SECRET: number;
declare const bj_TEXT_DELAY_UNITACQUIRED: number;
declare const bj_TEXT_DELAY_UNITAVAILABLE: number;
declare const bj_TEXT_DELAY_ITEMACQUIRED: number;
declare const bj_TEXT_DELAY_WARNING: number;
/**
 *  战役任务等待
 */
declare const bj_QUEUE_DELAY_QUEST: number;
/**
 *  战役提示等待
 */
declare const bj_QUEUE_DELAY_HINT: number;
/**
 *  战役秘密等待
 */
declare const bj_QUEUE_DELAY_SECRET: number;
/**
 *  战役简单难度生命障碍
 */
declare const bj_HANDICAP_EASY: number;
declare const bj_HANDICAP_NORMAL: number;
declare const bj_HANDICAPDAMAGE_EASY: number;
declare const bj_HANDICAPDAMAGE_NORMAL: number;
declare const bj_HANDICAPREVIVE_NOTHARD: number;
declare const bj_GAME_STARTED_THRESHOLD: number;
declare const bj_WAIT_FOR_COND_MIN_INTERVAL: number;
declare const bj_POLLED_WAIT_INTERVAL: number;
declare const bj_POLLED_WAIT_SKIP_THRESHOLD: number;
declare const bj_MAX_INVENTORY: number;
declare const bj_MAX_PLAYERS: number;
declare const bj_PLAYER_NEUTRAL_VICTIM: number;
declare const bj_PLAYER_NEUTRAL_EXTRA: number;
declare const bj_MAX_PLAYER_SLOTS: number;
declare const bj_MAX_SKELETONS: number;
declare const bj_MAX_STOCK_ITEM_SLOTS: number;
declare const bj_MAX_STOCK_UNIT_SLOTS: number;
declare const bj_MAX_ITEM_LEVEL: number;
declare const bj_MAX_CHECKPOINTS: number;
declare const bj_TOD_DAWN: number;
declare const bj_TOD_DUSK: number;
declare const bj_MELEE_STARTING_TOD: number;
declare const bj_MELEE_STARTING_GOLD_V0: number;
declare const bj_MELEE_STARTING_GOLD_V1: number;
declare const bj_MELEE_STARTING_LUMBER_V0: number;
declare const bj_MELEE_STARTING_LUMBER_V1: number;
declare const bj_MELEE_STARTING_HERO_TOKENS: number;
declare const bj_MELEE_HERO_LIMIT: number;
declare const bj_MELEE_HERO_TYPE_LIMIT: number;
declare const bj_MELEE_MINE_SEARCH_RADIUS: number;
declare const bj_MELEE_CLEAR_UNITS_RADIUS: number;
declare const bj_MELEE_CRIPPLE_TIMEOUT: number;
declare const bj_MELEE_CRIPPLE_MSG_DURATION: number;
declare const bj_MELEE_MAX_TWINKED_HEROES_V0: number;
declare const bj_MELEE_MAX_TWINKED_HEROES_V1: number;
declare const bj_CREEP_ITEM_DELAY: number;
declare const bj_STOCK_RESTOCK_INITIAL_DELAY: number;
declare const bj_STOCK_RESTOCK_INTERVAL: number;
declare const bj_STOCK_MAX_ITERATIONS: number;
declare const bj_MAX_DEST_IN_REGION_EVENTS: number;
declare const bj_CAMERA_MIN_FARZ: number;
/**
 *  默认镜头距离(距离到目标)
 */
declare const bj_CAMERA_DEFAULT_DISTANCE: number;
/**
 *  默认镜头远景截断距离(远景剪裁)
 */
declare const bj_CAMERA_DEFAULT_FARZ: number;
/**
 *  默认镜头X轴旋转角度(水平角度)
 */
declare const bj_CAMERA_DEFAULT_AOA: number;
/**
 *  默认镜头区域(观察区域)
 */
declare const bj_CAMERA_DEFAULT_FOV: number;
/**
 *  默认镜头Y轴旋转角度(滚动)
 */
declare const bj_CAMERA_DEFAULT_ROLL: number;
/**
 *  默认镜头Z轴旋转角度(高度位移)
 */
declare const bj_CAMERA_DEFAULT_ROTATION: number;
declare const bj_RESCUE_PING_TIME: number;
declare const bj_NOTHING_SOUND_DURATION: number;
declare const bj_TRANSMISSION_PING_TIME: number;
declare const bj_TRANSMISSION_IND_RED: number;
declare const bj_TRANSMISSION_IND_BLUE: number;
declare const bj_TRANSMISSION_IND_GREEN: number;
declare const bj_TRANSMISSION_IND_ALPHA: number;
declare const bj_TRANSMISSION_PORT_HANGTIME: number;
declare const bj_CINEMODE_INTERFACEFADE: number;
declare const bj_CINEMODE_GAMESPEED: gamespeed;
declare const bj_CINEMODE_VOLUME_UNITMOVEMENT: number;
declare const bj_CINEMODE_VOLUME_UNITSOUNDS: number;
declare const bj_CINEMODE_VOLUME_COMBAT: number;
declare const bj_CINEMODE_VOLUME_SPELLS: number;
declare const bj_CINEMODE_VOLUME_UI: number;
declare const bj_CINEMODE_VOLUME_MUSIC: number;
declare const bj_CINEMODE_VOLUME_AMBIENTSOUNDS: number;
declare const bj_CINEMODE_VOLUME_FIRE: number;
declare const bj_SPEECH_VOLUME_UNITMOVEMENT: number;
declare const bj_SPEECH_VOLUME_UNITSOUNDS: number;
declare const bj_SPEECH_VOLUME_COMBAT: number;
declare const bj_SPEECH_VOLUME_SPELLS: number;
declare const bj_SPEECH_VOLUME_UI: number;
declare const bj_SPEECH_VOLUME_MUSIC: number;
declare const bj_SPEECH_VOLUME_AMBIENTSOUNDS: number;
declare const bj_SPEECH_VOLUME_FIRE: number;
declare const bj_SMARTPAN_TRESHOLD_PAN: number;
declare const bj_SMARTPAN_TRESHOLD_SNAP: number;
declare const bj_MAX_QUEUED_TRIGGERS: number;
declare const bj_QUEUED_TRIGGER_TIMEOUT: number;
/**
 *  教程战役
 */
declare const bj_CAMPAIGN_INDEX_T: number;
/**
 *  人族战役
 */
declare const bj_CAMPAIGN_INDEX_H: number;
/**
 *  不死族战役
 */
declare const bj_CAMPAIGN_INDEX_U: number;
/**
 *  兽族战役
 */
declare const bj_CAMPAIGN_INDEX_O: number;
/**
 *  暗夜精灵族战役
 */
declare const bj_CAMPAIGN_INDEX_N: number;
/**
 *  资料片暗夜精灵族战役
 */
declare const bj_CAMPAIGN_INDEX_XN: number;
/**
 *  资料片人族战役
 */
declare const bj_CAMPAIGN_INDEX_XH: number;
/**
 *  资料片不死族战役
 */
declare const bj_CAMPAIGN_INDEX_XU: number;
/**
 *  资料片兽族战役
 */
declare const bj_CAMPAIGN_INDEX_XO: number;
declare const bj_CAMPAIGN_OFFSET_T: number;
declare const bj_CAMPAIGN_OFFSET_H: number;
declare const bj_CAMPAIGN_OFFSET_U: number;
declare const bj_CAMPAIGN_OFFSET_O: number;
declare const bj_CAMPAIGN_OFFSET_N: number;
declare const bj_CAMPAIGN_OFFSET_XN: number;
declare const bj_CAMPAIGN_OFFSET_XH: number;
declare const bj_CAMPAIGN_OFFSET_XU: number;
declare const bj_CAMPAIGN_OFFSET_XO: number;
/**
 *  教程01
 */
declare const bj_MISSION_INDEX_T00: number;
/**
 *  教程02
 */
declare const bj_MISSION_INDEX_T01: number;
declare const bj_MISSION_INDEX_T02: number;
declare const bj_MISSION_INDEX_T03: number;
declare const bj_MISSION_INDEX_T04: number;
/**
 *  人族01
 */
declare const bj_MISSION_INDEX_H00: number;
/**
 *  人族02
 */
declare const bj_MISSION_INDEX_H01: number;
/**
 *  人族02 插曲
 */
declare const bj_MISSION_INDEX_H02: number;
/**
 *  人族03
 */
declare const bj_MISSION_INDEX_H03: number;
/**
 *  人族04
 */
declare const bj_MISSION_INDEX_H04: number;
/**
 *  人族05
 */
declare const bj_MISSION_INDEX_H05: number;
/**
 *  人族05 插曲
 */
declare const bj_MISSION_INDEX_H06: number;
/**
 *  人族06
 */
declare const bj_MISSION_INDEX_H07: number;
/**
 *  人族06 插曲
 */
declare const bj_MISSION_INDEX_H08: number;
/**
 *  人族07
 */
declare const bj_MISSION_INDEX_H09: number;
/**
 *  人族08
 */
declare const bj_MISSION_INDEX_H10: number;
/**
 *  人族09
 */
declare const bj_MISSION_INDEX_H11: number;
/**
 *  不死族01
 */
declare const bj_MISSION_INDEX_U00: number;
/**
 *  不死族02
 */
declare const bj_MISSION_INDEX_U01: number;
/**
 *  不死族02 插曲
 */
declare const bj_MISSION_INDEX_U02: number;
/**
 *  不死族03
 */
declare const bj_MISSION_INDEX_U03: number;
/**
 *  不死族04
 */
declare const bj_MISSION_INDEX_U05: number;
/**
 *  不死族05
 */
declare const bj_MISSION_INDEX_U07: number;
/**
 *  不死族05 插曲
 */
declare const bj_MISSION_INDEX_U08: number;
/**
 *  不死族06
 */
declare const bj_MISSION_INDEX_U09: number;
/**
 *  不死族07
 */
declare const bj_MISSION_INDEX_U10: number;
/**
 *  不死族08
 */
declare const bj_MISSION_INDEX_U11: number;
/**
 *  兽族01
 */
declare const bj_MISSION_INDEX_O00: number;
/**
 *  兽族02
 */
declare const bj_MISSION_INDEX_O01: number;
/**
 *  兽族02 插曲
 */
declare const bj_MISSION_INDEX_O02: number;
/**
 *  兽族03
 */
declare const bj_MISSION_INDEX_O03: number;
/**
 *  兽族04
 */
declare const bj_MISSION_INDEX_O04: number;
/**
 *  兽族04 插曲
 */
declare const bj_MISSION_INDEX_O05: number;
/**
 *  兽族05
 */
declare const bj_MISSION_INDEX_O06: number;
/**
 *  兽族06
 */
declare const bj_MISSION_INDEX_O07: number;
/**
 *  兽族07
 */
declare const bj_MISSION_INDEX_O08: number;
/**
 *  兽族07 插曲
 */
declare const bj_MISSION_INDEX_O09: number;
/**
 *  兽族08
 */
declare const bj_MISSION_INDEX_O10: number;
/**
 *  暗夜精灵族01
 */
declare const bj_MISSION_INDEX_N00: number;
/**
 *  暗夜精灵族02
 */
declare const bj_MISSION_INDEX_N01: number;
/**
 *  暗夜精灵族03
 */
declare const bj_MISSION_INDEX_N02: number;
/**
 *  暗夜精灵族04
 */
declare const bj_MISSION_INDEX_N03: number;
/**
 *  暗夜精灵族05
 */
declare const bj_MISSION_INDEX_N04: number;
/**
 *  暗夜精灵族06
 */
declare const bj_MISSION_INDEX_N05: number;
/**
 *  暗夜精灵族06 插曲
 */
declare const bj_MISSION_INDEX_N06: number;
/**
 *  暗夜精灵族07
 */
declare const bj_MISSION_INDEX_N07: number;
declare const bj_MISSION_INDEX_N08: number;
declare const bj_MISSION_INDEX_N09: number;
/**
 *  暗夜精灵族X01
 */
declare const bj_MISSION_INDEX_XN00: number;
/**
 *  暗夜精灵族X02
 */
declare const bj_MISSION_INDEX_XN01: number;
/**
 *  暗夜精灵族X03
 */
declare const bj_MISSION_INDEX_XN02: number;
/**
 *  暗夜精灵族X04
 */
declare const bj_MISSION_INDEX_XN03: number;
/**
 *  暗夜精灵族X04 插曲
 */
declare const bj_MISSION_INDEX_XN04: number;
/**
 *  暗夜精灵族X05
 */
declare const bj_MISSION_INDEX_XN05: number;
/**
 *  暗夜精灵族X06
 */
declare const bj_MISSION_INDEX_XN06: number;
/**
 *  暗夜精灵族X06 插曲
 */
declare const bj_MISSION_INDEX_XN07: number;
/**
 *  暗夜精灵族X07
 */
declare const bj_MISSION_INDEX_XN08: number;
/**
 *  暗夜精灵族X08
 */
declare const bj_MISSION_INDEX_XN09: number;
/**
 *  暗夜精灵族X08 结局
 */
declare const bj_MISSION_INDEX_XN10: number;
/**
 *  人族X01
 */
declare const bj_MISSION_INDEX_XH00: number;
/**
 *  人族X02
 */
declare const bj_MISSION_INDEX_XH01: number;
/**
 *  人族X03
 */
declare const bj_MISSION_INDEX_XH02: number;
/**
 *  人族X03 秘密关卡
 */
declare const bj_MISSION_INDEX_XH03: number;
/**
 *  人族 X03 插曲
 */
declare const bj_MISSION_INDEX_XH04: number;
/**
 *  人族X04
 */
declare const bj_MISSION_INDEX_XH05: number;
/**
 *  人族X04 插曲
 */
declare const bj_MISSION_INDEX_XH06: number;
/**
 *  人族X05
 */
declare const bj_MISSION_INDEX_XH07: number;
/**
 *  人族X06
 */
declare const bj_MISSION_INDEX_XH08: number;
/**
 *  人族X06 结局
 */
declare const bj_MISSION_INDEX_XH09: number;
/**
 *  不死族X01
 */
declare const bj_MISSION_INDEX_XU00: number;
/**
 *  不死族X01 插曲
 */
declare const bj_MISSION_INDEX_XU01: number;
/**
 *  不死族X02
 */
declare const bj_MISSION_INDEX_XU02: number;
/**
 *  不死族X02 插曲
 */
declare const bj_MISSION_INDEX_XU03: number;
/**
 *  不死族X03
 */
declare const bj_MISSION_INDEX_XU04: number;
/**
 *  不死族X04
 */
declare const bj_MISSION_INDEX_XU05: number;
/**
 *  不死族X05
 */
declare const bj_MISSION_INDEX_XU06: number;
/**
 *  不死族X06
 */
declare const bj_MISSION_INDEX_XU07: number;
/**
 *  不死族X07a
 */
declare const bj_MISSION_INDEX_XU08: number;
/**
 *  不死族X07b
 */
declare const bj_MISSION_INDEX_XU09: number;
/**
 *  不死族X07c
 */
declare const bj_MISSION_INDEX_XU10: number;
/**
 *  不死族X07 插曲
 */
declare const bj_MISSION_INDEX_XU11: number;
/**
 *  不死族X08
 */
declare const bj_MISSION_INDEX_XU12: number;
/**
 *  不死族X08 结局
 */
declare const bj_MISSION_INDEX_XU13: number;
/**
 *  兽族 X01
 */
declare const bj_MISSION_INDEX_XO00: number;
declare const bj_MISSION_INDEX_XO01: number;
declare const bj_MISSION_INDEX_XO02: number;
declare const bj_MISSION_INDEX_XO03: number;
/**
 *  教程开场动画
 */
declare const bj_CINEMATICINDEX_TOP: number;
/**
 *  人族开场动画
 */
declare const bj_CINEMATICINDEX_HOP: number;
/**
 *  人族结局动画
 */
declare const bj_CINEMATICINDEX_HED: number;
declare const bj_CINEMATICINDEX_OOP: number;
/**
 *  兽族结局动画
 */
declare const bj_CINEMATICINDEX_OED: number;
declare const bj_CINEMATICINDEX_UOP: number;
/**
 *  不死族结局动画
 */
declare const bj_CINEMATICINDEX_UED: number;
declare const bj_CINEMATICINDEX_NOP: number;
/**
 *  暗夜精灵族结局动画
 */
declare const bj_CINEMATICINDEX_NED: number;
/**
 *  资料片开场动画
 */
declare const bj_CINEMATICINDEX_XOP: number;
/**
 *  资料片结局动画
 */
declare const bj_CINEMATICINDEX_XED: number;
/**
 *  敌对
 */
declare const bj_ALLIANCE_UNALLIED: number;
/**
 *  敌对但共享视野
 */
declare const bj_ALLIANCE_UNALLIED_VISION: number;
/**
 *  结盟
 */
declare const bj_ALLIANCE_ALLIED: number;
/**
 *  结盟并共享视野
 */
declare const bj_ALLIANCE_ALLIED_VISION: number;
/**
 *  结盟并共享视野和单位
 */
declare const bj_ALLIANCE_ALLIED_UNITS: number;
/**
 *  结盟并共享视野和完全控制权
 */
declare const bj_ALLIANCE_ALLIED_ADVUNITS: number;
/**
 *  中立
 */
declare const bj_ALLIANCE_NEUTRAL: number;
/**
 *  中立并共享视野
 */
declare const bj_ALLIANCE_NEUTRAL_VISION: number;
/**
 *  按下
 */
declare const bj_KEYEVENTTYPE_DEPRESS: number;
/**
 *  松开
 */
declare const bj_KEYEVENTTYPE_RELEASE: number;
/**
 *  Left键
 */
declare const bj_KEYEVENTKEY_LEFT: number;
/**
 *  Right键
 */
declare const bj_KEYEVENTKEY_RIGHT: number;
/**
 *  Down键
 */
declare const bj_KEYEVENTKEY_DOWN: number;
/**
 *  Up键
 */
declare const bj_KEYEVENTKEY_UP: number;
declare const bj_MOUSEEVENTTYPE_DOWN: number;
declare const bj_MOUSEEVENTTYPE_UP: number;
declare const bj_MOUSEEVENTTYPE_MOVE: number;
/**
 *  添加
 */
declare const bj_TIMETYPE_ADD: number;
/**
 *  设为
 */
declare const bj_TIMETYPE_SET: number;
/**
 *  减去
 */
declare const bj_TIMETYPE_SUB: number;
/**
 *  扩展
 */
declare const bj_CAMERABOUNDS_ADJUST_ADD: number;
/**
 *  收缩
 */
declare const bj_CAMERABOUNDS_ADJUST_SUB: number;
/**
 *  要求
 */
declare const bj_QUESTTYPE_REQ_DISCOVERED: number;
/**
 *  要求，未发现的
 */
declare const bj_QUESTTYPE_REQ_UNDISCOVERED: number;
/**
 *  可选择的
 */
declare const bj_QUESTTYPE_OPT_DISCOVERED: number;
/**
 *  可选择的，未发现的
 */
declare const bj_QUESTTYPE_OPT_UNDISCOVERED: number;
/**
 *  发现任务
 */
declare const bj_QUESTMESSAGE_DISCOVERED: number;
/**
 *  任务更新
 */
declare const bj_QUESTMESSAGE_UPDATED: number;
/**
 *  任务完成
 */
declare const bj_QUESTMESSAGE_COMPLETED: number;
/**
 *  任务失败
 */
declare const bj_QUESTMESSAGE_FAILED: number;
/**
 *  任务要求
 */
declare const bj_QUESTMESSAGE_REQUIREMENT: number;
/**
 *  任务失败
 */
declare const bj_QUESTMESSAGE_MISSIONFAILED: number;
/**
 *  提示
 */
declare const bj_QUESTMESSAGE_ALWAYSHINT: number;
/**
 *  简单提示
 */
declare const bj_QUESTMESSAGE_HINT: number;
/**
 *  秘密
 */
declare const bj_QUESTMESSAGE_SECRET: number;
/**
 *  获得新单位
 */
declare const bj_QUESTMESSAGE_UNITACQUIRED: number;
/**
 *  新单位可用
 */
declare const bj_QUESTMESSAGE_UNITAVAILABLE: number;
/**
 *  收到新物品
 */
declare const bj_QUESTMESSAGE_ITEMACQUIRED: number;
/**
 *  警告
 */
declare const bj_QUESTMESSAGE_WARNING: number;
/**
 *  分数
 */
declare const bj_SORTTYPE_SORTBYVALUE: number;
/**
 *  玩家
 */
declare const bj_SORTTYPE_SORTBYPLAYER: number;
/**
 *  名字
 */
declare const bj_SORTTYPE_SORTBYLABEL: number;
/**
 *  淡入
 */
declare const bj_CINEFADETYPE_FADEIN: number;
/**
 *  淡出
 */
declare const bj_CINEFADETYPE_FADEOUT: number;
/**
 *  淡出并淡入
 */
declare const bj_CINEFADETYPE_FADEOUTIN: number;
/**
 *  有益
 */
declare const bj_REMOVEBUFFS_POSITIVE: number;
/**
 *  有害
 */
declare const bj_REMOVEBUFFS_NEGATIVE: number;
/**
 *  全部
 */
declare const bj_REMOVEBUFFS_ALL: number;
/**
 *  除生命周期外
 */
declare const bj_REMOVEBUFFS_NONTLIFE: number;
/**
 *  有益
 */
declare const bj_BUFF_POLARITY_POSITIVE: number;
/**
 *  有害
 */
declare const bj_BUFF_POLARITY_NEGATIVE: number;
/**
 *  全部
 */
declare const bj_BUFF_POLARITY_EITHER: number;
/**
 *  魔法
 */
declare const bj_BUFF_RESIST_MAGIC: number;
/**
 *  物理
 */
declare const bj_BUFF_RESIST_PHYSICAL: number;
/**
 *  魔法或物理
 */
declare const bj_BUFF_RESIST_EITHER: number;
/**
 *  无效选项
 */
declare const bj_BUFF_RESIST_BOTH: number;
/**
 *  力量
 */
declare const bj_HEROSTAT_STR: number;
/**
 *  敏捷
 */
declare const bj_HEROSTAT_AGI: number;
/**
 *  智力
 */
declare const bj_HEROSTAT_INT: number;
/**
 *  添加
 */
declare const bj_MODIFYMETHOD_ADD: number;
/**
 *  减去
 */
declare const bj_MODIFYMETHOD_SUB: number;
/**
 *  设为
 */
declare const bj_MODIFYMETHOD_SET: number;
/**
 *  旧单位的
 */
declare const bj_UNIT_STATE_METHOD_ABSOLUTE: number;
/**
 *  旧单位的相关物
 */
declare const bj_UNIT_STATE_METHOD_RELATIVE: number;
/**
 *  新单位的默认值
 */
declare const bj_UNIT_STATE_METHOD_DEFAULTS: number;
/**
 *  新单位的最大值
 */
declare const bj_UNIT_STATE_METHOD_MAXIMUM: number;
/**
 *  关闭
 */
declare const bj_GATEOPERATION_CLOSE: number;
/**
 *  打开
 */
declare const bj_GATEOPERATION_OPEN: number;
/**
 *  破坏
 */
declare const bj_GATEOPERATION_DESTROY: number;
/**
 *  布尔值
 */
declare const bj_GAMECACHE_BOOLEAN: number;
/**
 *  整数
 */
declare const bj_GAMECACHE_INTEGER: number;
/**
 *  实数
 */
declare const bj_GAMECACHE_REAL: number;
/**
 *  单位
 */
declare const bj_GAMECACHE_UNIT: number;
/**
 *  字符串
 */
declare const bj_GAMECACHE_STRING: number;
/**
 *  布尔值
 */
declare const bj_HASHTABLE_BOOLEAN: number;
/**
 *  整数
 */
declare const bj_HASHTABLE_INTEGER: number;
/**
 *  实数
 */
declare const bj_HASHTABLE_REAL: number;
/**
 *  字符串
 */
declare const bj_HASHTABLE_STRING: number;
declare const bj_HASHTABLE_HANDLE: number;
/**
 *  隐藏
 */
declare const bj_ITEM_STATUS_HIDDEN: number;
/**
 *  被持有
 */
declare const bj_ITEM_STATUS_OWNED: number;
/**
 *  无敌
 */
declare const bj_ITEM_STATUS_INVULNERABLE: number;
/**
 *  捡取时自动使用
 */
declare const bj_ITEM_STATUS_POWERUP: number;
/**
 *  可被市场随机出售
 */
declare const bj_ITEM_STATUS_SELLABLE: number;
/**
 *  可抵押
 */
declare const bj_ITEM_STATUS_PAWNABLE: number;
/**
 *  捡取时自动使用
 */
declare const bj_ITEMCODE_STATUS_POWERUP: number;
/**
 *  可出售
 */
declare const bj_ITEMCODE_STATUS_SELLABLE: number;
/**
 *  可被抵押掉
 */
declare const bj_ITEMCODE_STATUS_PAWNABLE: number;
/**
 *  简单
 */
declare const bj_MINIMAPPINGSTYLE_SIMPLE: number;
/**
 *  闪烁
 */
declare const bj_MINIMAPPINGSTYLE_FLASHY: number;
/**
 *  警告
 */
declare const bj_MINIMAPPINGSTYLE_ATTACK: number;
declare const bj_CAMPPINGSTYLE_PRIMARY: number;
declare const bj_CAMPPINGSTYLE_PRIMARY_GREEN: number;
declare const bj_CAMPPINGSTYLE_PRIMARY_RED: number;
declare const bj_CAMPPINGSTYLE_BONUS: number;
declare const bj_CAMPPINGSTYLE_TURNIN: number;
declare const bj_CAMPPINGSTYLE_BOSS: number;
declare const bj_CAMPPINGSTYLE_CONTROL_ALLY: number;
declare const bj_CAMPPINGSTYLE_CONTROL_NEUTRAL: number;
declare const bj_CAMPPINGSTYLE_CONTROL_ENEMY: number;
declare const bj_CORPSE_MAX_DEATH_TIME: number;
/**
 *  肉态
 */
declare const bj_CORPSETYPE_FLESH: number;
/**
 *  骨态
 */
declare const bj_CORPSETYPE_BONE: number;
declare const bj_ELEVATOR_BLOCKER_CODE: number;
declare const bj_ELEVATOR_CODE01: number;
declare const bj_ELEVATOR_CODE02: number;
/**
 *  所有的墙
 */
declare const bj_ELEVATOR_WALL_TYPE_ALL: number;
/**
 *  东墙
 */
declare const bj_ELEVATOR_WALL_TYPE_EAST: number;
/**
 *  北墙
 */
declare const bj_ELEVATOR_WALL_TYPE_NORTH: number;
/**
 *  南墙
 */
declare const bj_ELEVATOR_WALL_TYPE_SOUTH: number;
/**
 *  西墙
 */
declare const bj_ELEVATOR_WALL_TYPE_WEST: number;
/**
 *  全部玩家 [R]
 */
declare var bj_FORCE_ALL_PLAYERS: force;
declare var bj_FORCE_PLAYER: force[];
declare var bj_MELEE_MAX_TWINKED_HEROES: number;
/**
 *  可用地图区域 [R]
 */
declare var bj_mapInitialPlayableArea: rect;
/**
 *  初始可用镜头区域 [R]
 */
declare var bj_mapInitialCameraBounds: rect;
/**
 *  循环整数A [R]
 */
declare var bj_forLoopAIndex: number;
/**
 *  循环整数B [R]
 */
declare var bj_forLoopBIndex: number;
declare var bj_forLoopAIndexEnd: number;
declare var bj_forLoopBIndexEnd: number;
declare var bj_slotControlReady: boolean;
declare var bj_slotControlUsed: boolean[];
declare var bj_slotControl: mapcontrol[];
declare var bj_gameStartedTimer: timer;
declare var bj_gameStarted: boolean;
declare var bj_volumeGroupsTimer: timer;
declare var bj_isSinglePlayer: boolean;
declare var bj_dncSoundsDay: trigger;
declare var bj_dncSoundsNight: trigger;
declare var bj_dayAmbientSound: sound;
declare var bj_nightAmbientSound: sound;
declare var bj_dncSoundsDawn: trigger;
declare var bj_dncSoundsDusk: trigger;
declare var bj_dawnSound: sound;
declare var bj_duskSound: sound;
declare var bj_useDawnDuskSounds: boolean;
declare var bj_dncIsDaytime: boolean;
declare var bj_rescueSound: sound;
declare var bj_questDiscoveredSound: sound;
declare var bj_questUpdatedSound: sound;
declare var bj_questCompletedSound: sound;
declare var bj_questFailedSound: sound;
declare var bj_questHintSound: sound;
declare var bj_questSecretSound: sound;
declare var bj_questItemAcquiredSound: sound;
declare var bj_questWarningSound: sound;
declare var bj_victoryDialogSound: sound;
declare var bj_defeatDialogSound: sound;
declare var bj_stockItemPurchased: trigger;
declare var bj_stockUpdateTimer: timer;
declare var bj_stockAllowedPermanent: boolean[];
declare var bj_stockAllowedCharged: boolean[];
declare var bj_stockAllowedArtifact: boolean[];
declare var bj_stockPickedItemLevel: number;
declare var bj_stockPickedItemType: itemtype;
declare var bj_meleeVisibilityTrained: trigger;
declare var bj_meleeVisibilityIsDay: boolean;
declare var bj_meleeGrantHeroItems: boolean;
declare var bj_meleeNearestMineToLoc: location;
declare var bj_meleeNearestMine: unit;
declare var bj_meleeNearestMineDist: number;
declare var bj_meleeGameOver: boolean;
declare var bj_meleeDefeated: boolean[];
declare var bj_meleeVictoried: boolean[];
declare var bj_ghoul: unit[];
declare var bj_crippledTimer: timer[];
declare var bj_crippledTimerWindows: timerdialog[];
declare var bj_playerIsCrippled: boolean[];
declare var bj_playerIsExposed: boolean[];
declare var bj_finishSoonAllExposed: boolean;
declare var bj_finishSoonTimerDialog: timerdialog;
declare var bj_meleeTwinkedHeroes: number[];
declare var bj_rescueUnitBehavior: trigger;
declare var bj_rescueChangeColorUnit: boolean;
declare var bj_rescueChangeColorBldg: boolean;
declare var bj_cineSceneEndingTimer: timer;
declare var bj_cineSceneLastSound: sound;
declare var bj_cineSceneBeingSkipped: trigger;
declare var bj_cineModePriorSpeed: gamespeed;
declare var bj_cineModePriorFogSetting: boolean;
declare var bj_cineModePriorMaskSetting: boolean;
declare var bj_cineModeAlreadyIn: boolean;
declare var bj_cineModePriorDawnDusk: boolean;
declare var bj_cineModeSavedSeed: number;
declare var bj_cineFadeFinishTimer: timer;
declare var bj_cineFadeContinueTimer: timer;
declare var bj_cineFadeContinueRed: number;
declare var bj_cineFadeContinueGreen: number;
declare var bj_cineFadeContinueBlue: number;
declare var bj_cineFadeContinueTrans: number;
declare var bj_cineFadeContinueDuration: number;
declare var bj_cineFadeContinueTex: string;
declare var bj_queuedExecTotal: number;
declare var bj_queuedExecTriggers: trigger[];
declare var bj_queuedExecUseConds: boolean[];
declare var bj_queuedExecTimeoutTimer: timer;
declare var bj_queuedExecTimeout: trigger;
declare var bj_destInRegionDiesCount: number;
declare var bj_destInRegionDiesTrig: trigger;
declare var bj_groupCountUnits: number;
declare var bj_forceCountPlayers: number;
declare var bj_groupEnumTypeId: number;
declare var bj_groupEnumOwningPlayer: player;
declare var bj_groupAddGroupDest: group;
declare var bj_groupRemoveGroupDest: group;
declare var bj_groupRandomConsidered: number;
declare var bj_groupRandomCurrentPick: unit;
declare var bj_groupLastCreatedDest: group;
declare var bj_randomSubGroupGroup: group;
declare var bj_randomSubGroupWant: number;
declare var bj_randomSubGroupTotal: number;
declare var bj_randomSubGroupChance: number;
declare var bj_destRandomConsidered: number;
declare var bj_destRandomCurrentPick: destructable;
declare var bj_elevatorWallBlocker: destructable;
declare var bj_elevatorNeighbor: destructable;
declare var bj_itemRandomConsidered: number;
declare var bj_itemRandomCurrentPick: item;
declare var bj_forceRandomConsidered: number;
declare var bj_forceRandomCurrentPick: player;
declare var bj_makeUnitRescuableUnit: unit;
declare var bj_makeUnitRescuableFlag: boolean;
declare var bj_pauseAllUnitsFlag: boolean;
declare var bj_enumDestructableCenter: location;
declare var bj_enumDestructableRadius: number;
declare var bj_setPlayerTargetColor: playercolor;
declare var bj_isUnitGroupDeadResult: boolean;
declare var bj_isUnitGroupEmptyResult: boolean;
declare var bj_isUnitGroupInRectResult: boolean;
declare var bj_isUnitGroupInRectRect: rect;
declare var bj_changeLevelShowScores: boolean;
declare var bj_changeLevelMapName: string;
declare var bj_suspendDecayFleshGroup: group;
declare var bj_suspendDecayBoneGroup: group;
declare var bj_delayedSuspendDecayTimer: timer;
declare var bj_delayedSuspendDecayTrig: trigger;
declare var bj_livingPlayerUnitsTypeId: number;
declare var bj_lastDyingWidget: widget;
declare var bj_randDistCount: number;
declare var bj_randDistID: number[];
declare var bj_randDistChance: number[];
/**
 *  最后创建的单位 [R]
 */
declare var bj_lastCreatedUnit: unit;
/**
 *  最后创建的物品 [R]
 */
declare var bj_lastCreatedItem: item;
/**
 *  最后丢弃的物品 [R]
 */
declare var bj_lastRemovedItem: item;
/**
 *  最后创建的不死族金矿 [R]
 */
declare var bj_lastHauntedGoldMine: unit;
/**
 *  最后创建的可破坏物 [R]
 */
declare var bj_lastCreatedDestructable: destructable;
/**
 *  最后创建的单位组 [R]
 */
declare var bj_lastCreatedGroup: group;
/**
 *  最后创建的可见度修正器 [R]
 */
declare var bj_lastCreatedFogModifier: fogmodifier;
/**
 *  最后创建的特效 [R]
 */
declare var bj_lastCreatedEffect: effect;
/**
 *  最后创建的天气效果 [R]
 */
declare var bj_lastCreatedWeatherEffect: weathereffect;
/**
 *  最后创建的地形变化 [R]
 */
declare var bj_lastCreatedTerrainDeformation: terraindeformation;
/**
 *  最后创建的任务 [R]
 */
declare var bj_lastCreatedQuest: quest;
/**
 *  最后创建的任务项目 [R]
 */
declare var bj_lastCreatedQuestItem: questitem;
/**
 *  最后创建的失败条件 [R]
 */
declare var bj_lastCreatedDefeatCondition: defeatcondition;
/**
 *  最后启用的计时器 [R]
 */
declare var bj_lastStartedTimer: timer;
/**
 *  最后创建的计时器窗口 [R]
 */
declare var bj_lastCreatedTimerDialog: timerdialog;
/**
 *  最后创建的排行榜 [R]
 */
declare var bj_lastCreatedLeaderboard: leaderboard;
/**
 *  最后创建的多面板 [R]
 */
declare var bj_lastCreatedMultiboard: multiboard;
/**
 *  最后播放的音效 [R]
 */
declare var bj_lastPlayedSound: sound;
/**
 *  最后播放的音乐 [R]
 */
declare var bj_lastPlayedMusic: string;
/**
 *  最后发言长度 [R]
 */
declare var bj_lastTransmissionDuration: number;
/**
 *  最后创建的游戏缓存 [R]
 */
declare var bj_lastCreatedGameCache: gamecache;
/**
 *  最后创建的哈希表 [C]
 */
declare var bj_lastCreatedHashtable: hashtable;
/**
 *  最后读取的单位 [R]
 */
declare var bj_lastLoadedUnit: unit;
/**
 *  最后创建的对话框按钮 [R]
 */
declare var bj_lastCreatedButton: button;
/**
 *  最后替换的单位 [R]
 */
declare var bj_lastReplacedUnit: unit;
/**
 *  最后创建的漂浮文字 [R]
 */
declare var bj_lastCreatedTextTag: texttag;
/**
 *  最后创建的闪电效果 [R]
 */
declare var bj_lastCreatedLightning: lightning;
/**
 *  最后创建的图像 [R]
 */
declare var bj_lastCreatedImage: image;
/**
 *  最后创建的地面纹理变化 [R]
 */
declare var bj_lastCreatedUbersplat: ubersplat;
/**
 * declare var bj_lastCreatedMinimapIcon: minimapicon;
 */
/**
 * declare var bj_lastCreatedCommandButtonEffect: commandbuttoneffect;
 */
declare var filterIssueHauntOrderAtLocBJ: boolexpr | (() => boolean) | null;
declare var filterEnumDestructablesInCircleBJ: boolexpr | (() => boolean) | null;
declare var filterGetUnitsInRectOfPlayer: boolexpr | (() => boolean) | null;
declare var filterGetUnitsOfTypeIdAll: boolexpr | (() => boolean) | null;
declare var filterGetUnitsOfPlayerAndTypeId: boolexpr | (() => boolean) | null;
declare var filterMeleeTrainedUnitIsHeroBJ: boolexpr | (() => boolean) | null;
declare var filterLivingPlayerUnitsOfTypeId: boolexpr | (() => boolean) | null;
declare var bj_wantDestroyGroup: boolean;
declare var bj_lastInstObjFuncSuccessful: boolean;
/**
 * declare function GetLastCreatedMinimapIcon(): minimapicon;
 */
/**
 * declare function CreateMinimapIconOnUnitBJ(whichUnit: unit, red: number, green: number, blue: number, pingPath: string, fogVisibility: fogstate): minimapicon;
 */

/**
 * declare function CreateMinimapIconAtLocBJ(where: location, red: number, green: number, blue: number, pingPath: string, fogVisibility: fogstate): minimapicon;
 */
/**
 * declare function CreateMinimapIconBJ(x: number, y: number, red: number, green: number, blue: number, pingPath: string, fogVisibility: fogstate): minimapicon;
 */
declare function CampaignMinimapIconUnitBJ(whichUnit: unit, style: number): void;

declare function CampaignMinimapIconLocBJ(where: location, style: number): void;

/**
 * declare function CreateCommandButtonEffectBJ(abilityId: number, order: string): commandbuttoneffect;
 */
/**
 * declare function CreateTrainCommandButtonEffectBJ(unitId: number): commandbuttoneffect;
 */
/**
 * declare function CreateUpgradeCommandButtonEffectBJ(techId: number): commandbuttoneffect;
 */
/**
 * declare function CreateCommonCommandButtonEffectBJ(order: string): commandbuttoneffect;
 */
/**
 * declare function CreateLearnCommandButtonEffectBJ(abilityId: number): commandbuttoneffect;
 */

/**
 * declare function CreateBuildCommandButtonEffectBJ(unitId: number): commandbuttoneffect;
 */
/**
 * declare function GetLastCreatedCommandButtonEffectBJ(): commandbuttoneffect;
 */
declare function MeleePlayerIsOpponent(playerIndex: number, opponentIndex: number): boolean;

declare function MeleeGetAllyStructureCount(whichPlayer: player): number;

declare function MeleeGetAllyCount(whichPlayer: player): number;

declare function MeleeGetAllyKeyStructureCount(whichPlayer: player): number;

declare function MeleeDoDrawEnum(): void;

declare function MeleeDoVictoryEnum(): void;

declare function MeleeDoDefeat(whichPlayer: player): void;

declare function MeleeDoDefeatEnum(): void;

declare function MeleeDoLeave(whichPlayer: player): void;

declare function MeleeRemoveObservers(): void;

declare function MeleeCheckForVictors(): force;

declare function MeleeCheckForLosersAndVictors(): void;

declare function MeleeGetCrippledWarningMessage(whichPlayer: player): string;

declare function MeleeGetCrippledTimerMessage(whichPlayer: player): string;

declare function MeleeGetCrippledRevealedMessage(whichPlayer: player): string;

declare function MeleeExposePlayer(whichPlayer: player, expose: boolean): void;

declare function MeleeExposeAllPlayers(): void;

declare function MeleeCrippledPlayerTimeout(): void;

declare function MeleePlayerIsCrippled(whichPlayer: player): boolean;

declare function MeleeCheckForCrippledPlayers(): void;

declare function MeleeCheckLostUnit(lostUnit: unit): void;

declare function MeleeCheckAddedUnit(addedUnit: unit): void;

declare function MeleeTriggerActionConstructCancel(): void;

declare function MeleeTriggerActionUnitDeath(): void;

declare function MeleeTriggerActionUnitConstructionStart(): void;

declare function MeleeTriggerActionPlayerDefeated(): void;

declare function MeleeTriggerActionPlayerLeft(): void;

declare function MeleeTriggerActionAllianceChange(): void;

declare function MeleeTriggerTournamentFinishSoon(): void;

declare function MeleeWasUserPlayer(whichPlayer: player): boolean;

declare function MeleeTournamentFinishNowRuleA(multiplier: number): void;

declare function MeleeTriggerTournamentFinishNow(): void;

declare function MeleeInitVictoryDefeat(): void;

declare function CheckInitPlayerSlotAvailability(): void;

declare function SetPlayerSlotAvailable(whichPlayer: player, control: mapcontrol): void;

declare function TeamInitPlayerSlots(teamCount: number): void;

declare function MeleeInitPlayerSlots(): void;

declare function FFAInitPlayerSlots(): void;

declare function OneOnOneInitPlayerSlots(): void;

declare function InitGenericPlayerSlots(): void;

declare function SetDNCSoundsDawn(): void;

declare function SetDNCSoundsDusk(): void;

declare function SetDNCSoundsDay(): void;

declare function SetDNCSoundsNight(): void;

declare function InitDNCSounds(): void;

declare function InitBlizzardGlobals(): void;

declare function InitQueuedTriggers(): void;

declare function InitMapRects(): void;

declare function InitSummonableCaps(): void;

declare function UpdateStockAvailability(whichItem: item): void;

declare function UpdateEachStockBuildingEnum(): void;

declare function UpdateEachStockBuilding(iType: itemtype, iLevel: number): void;

declare function PerformStockUpdates(): void;

declare function StartStockUpdates(): void;

declare function RemovePurchasedItem(): void;

declare function InitNeutralBuildings(): void;

declare function MarkGameStarted(): void;

declare function DetectGameStarted(): void;

declare function InitBlizzard(): void;

declare function RandomDistReset(): void;

declare function RandomDistAddItem(inID: number, inChance: number): void;

declare function RandomDistChoose(): number;

declare function UnitDropItem(inUnit: unit, inItemID: number): item;

declare function WidgetDropItem(inWidget: widget, inItemID: number): item;

//1.32 api
/**
 * declare function BlzIsLastInstanceObjectFunctionSuccessful(): boolean;
 */
/**
 * declare function BlzSetAbilityBooleanFieldBJ(whichAbility: ability, whichField: abilitybooleanfield, value: boolean): void;
 */
/**
 * declare function BlzSetAbilityIntegerFieldBJ(whichAbility: ability, whichField: abilityintegerfield, value: number): void;
 */
/**
 * declare function BlzSetAbilityRealFieldBJ(whichAbility: ability, whichField: abilityrealfield, value: number): void;
 */
/**
 * declare function BlzSetAbilityStringFieldBJ(whichAbility: ability, whichField: abilitystringfield, value: string): void;
 */
/**
 * declare function BlzSetAbilityBooleanLevelFieldBJ(whichAbility: ability, whichField: abilitybooleanlevelfield, level: number, value: boolean): void;
 */
/**
 * declare function BlzSetAbilityIntegerLevelFieldBJ(whichAbility: ability, whichField: abilityintegerlevelfield, level: number, value: number): void;
 */
/**
 * declare function BlzSetAbilityRealLevelFieldBJ(whichAbility: ability, whichField: abilityreallevelfield, level: number, value: number): void;
 */
/**
 * declare function BlzSetAbilityStringLevelFieldBJ(whichAbility: ability, whichField: abilitystringlevelfield, level: number, value: string): void;
 */
/**
 * declare function BlzSetAbilityBooleanLevelArrayFieldBJ(whichAbility: ability, whichField: abilitybooleanlevelarrayfield, level: number, index: number, value: boolean): void;
 */
/**
 * declare function BlzSetAbilityIntegerLevelArrayFieldBJ(whichAbility: ability, whichField: abilityintegerlevelarrayfield, level: number, index: number, value: number): void;
 */
/**
 * declare function BlzSetAbilityRealLevelArrayFieldBJ(whichAbility: ability, whichField: abilityreallevelarrayfield, level: number, index: number, value: number): void;
 */
/**
 * declare function BlzSetAbilityStringLevelArrayFieldBJ(whichAbility: ability, whichField: abilitystringlevelarrayfield, level: number, index: number, value: string): void;
 */
/**
 * declare function BlzAddAbilityBooleanLevelArrayFieldBJ(whichAbility: ability, whichField: abilitybooleanlevelarrayfield, level: number, value: boolean): void;
 */
/**
 * declare function BlzAddAbilityIntegerLevelArrayFieldBJ(whichAbility: ability, whichField: abilityintegerlevelarrayfield, level: number, value: number): void;
 */
/**
 * declare function BlzAddAbilityRealLevelArrayFieldBJ(whichAbility: ability, whichField: abilityreallevelarrayfield, level: number, value: number): void;
 */
/**
 * declare function BlzAddAbilityStringLevelArrayFieldBJ(whichAbility: ability, whichField: abilitystringlevelarrayfield, level: number, value: string): void;
 */
/**
 * declare function BlzRemoveAbilityBooleanLevelArrayFieldBJ(whichAbility: ability, whichField: abilitybooleanlevelarrayfield, level: number, value: boolean): void;
 */
/**
 * declare function BlzRemoveAbilityIntegerLevelArrayFieldBJ(whichAbility: ability, whichField: abilityintegerlevelarrayfield, level: number, value: number): void;
 */
/**
 * declare function BlzRemoveAbilityRealLevelArrayFieldBJ(whichAbility: ability, whichField: abilityreallevelarrayfield, level: number, value: number): void;
 */
/**
 * declare function BlzRemoveAbilityStringLevelArrayFieldBJ(whichAbility: ability, whichField: abilitystringlevelarrayfield, level: number, value: string): void;
 */
/**
 * declare function BlzItemAddAbilityBJ(whichItem: item, abilCode: number): void;
 */
/**
 * declare function BlzItemRemoveAbilityBJ(whichItem: item, abilCode: number): void;
 */
/**
 * declare function BlzSetItemBooleanFieldBJ(whichItem: item, whichField: itembooleanfield, value: boolean): void;
 */
/**
 * declare function BlzSetItemIntegerFieldBJ(whichItem: item, whichField: itemintegerfield, value: number): void;
 */
/**
 * declare function BlzSetItemRealFieldBJ(whichItem: item, whichField: itemrealfield, value: number): void;
 */
/**
 * declare function BlzSetItemStringFieldBJ(whichItem: item, whichField: itemstringfield, value: string): void;
 */
/**
 * declare function BlzSetUnitBooleanFieldBJ(whichUnit: unit, whichField: unitbooleanfield, value: boolean): void;
 */
/**
 * declare function BlzSetUnitIntegerFieldBJ(whichUnit: unit, whichField: unitintegerfield, value: number): void;
 */
/**
 * declare function BlzSetUnitRealFieldBJ(whichUnit: unit, whichField: unitrealfield, value: number): void;
 */
/**
 * declare function BlzSetUnitStringFieldBJ(whichUnit: unit, whichField: unitstringfield, value: string): void;
 */
/**
 * declare function BlzSetUnitWeaponBooleanFieldBJ(whichUnit: unit, whichField: unitweaponbooleanfield, index: number, value: boolean): void;
 */
/**
 * declare function BlzSetUnitWeaponIntegerFieldBJ(whichUnit: unit, whichField: unitweaponintegerfield, index: number, value: number): void;
 */
/**
 * declare function BlzSetUnitWeaponRealFieldBJ(whichUnit: unit, whichField: unitweaponrealfield, index: number, value: number): void;
 */
/**
 * declare function BlzSetUnitWeaponStringFieldBJ(whichUnit: unit, whichField: unitweaponstringfield, index: number, value: string): void;
 */
