/** @noSelfInFile **/
declare interface agent extends handle {
    __agent: never;
}

declare interface event extends agent {
    __event: never;
}

declare interface player extends agent {
    __player: never;
}

declare interface widget extends agent {
    __widget: never;
}

declare interface unit extends widget {
    __unit: never;
}

declare interface destructable extends widget {
    __destructable: never;
}

declare interface item extends widget {
    __item: never;
}

declare interface ability extends agent {
    __ability: never;
}

declare interface buff extends ability {
    __buff: never;
}

declare interface force extends agent {
    __force: never;
}

declare interface group extends agent {
    __group: never;
}

declare interface trigger extends agent {
    __trigger: never;
}

declare interface triggercondition extends agent {
    __triggercondition: never;
}

declare interface triggeraction extends handle {
    __triggeraction: never;
}

declare interface timer extends agent {
    __timer: never;
}

declare interface location extends agent {
    __location: never;
}

declare interface region extends agent {
    __region: never;
}

declare interface rect extends agent {
    __rect: never;
}

declare interface boolexpr extends agent {
    __boolexpr: never;
}

declare interface sound extends agent {
    __sound: never;
}

declare interface conditionfunc extends boolexpr {
    __conditionfunc: never;
}

declare interface filterfunc extends boolexpr {
    __filterfunc: never;
}

declare interface unitpool extends handle {
    __unitpool: never;
}

declare interface itempool extends handle {
    __itempool: never;
}

declare interface race extends handle {
    __race: never;
}

declare interface alliancetype extends handle {
    __alliancetype: never;
}

declare interface racepreference extends handle {
    __racepreference: never;
}

declare interface gamestate extends handle {
    __gamestate: never;
}

declare interface igamestate extends gamestate {
    __igamestate: never;
}

declare interface fgamestate extends gamestate {
    __fgamestate: never;
}

declare interface playerstate extends handle {
    __playerstate: never;
}

declare interface playerscore extends handle {
    __playerscore: never;
}

declare interface playergameresult extends handle {
    __playergameresult: never;
}

declare interface unitstate extends handle {
    __unitstate: never;
}

declare interface aidifficulty extends handle {
    __aidifficulty: never;
}

declare interface eventid extends handle {
    __eventid: never;
}

declare interface gameevent extends eventid {
    __gameevent: never;
}

declare interface playerevent extends eventid {
    __playerevent: never;
}

declare interface playerunitevent extends eventid {
    __playerunitevent: never;
}

declare interface unitevent extends eventid {
    __unitevent: never;
}

declare interface limitop extends eventid {
    __limitop: never;
}

declare interface widgetevent extends eventid {
    __widgetevent: never;
}

declare interface dialogevent extends eventid {
    __dialogevent: never;
}

declare interface unittype extends handle {
    __unittype: never;
}

declare interface gamespeed extends handle {
    __gamespeed: never;
}

declare interface gamedifficulty extends handle {
    __gamedifficulty: never;
}

declare interface gametype extends handle {
    __gametype: never;
}

declare interface mapflag extends handle {
    __mapflag: never;
}

declare interface mapvisibility extends handle {
    __mapvisibility: never;
}

declare interface mapsetting extends handle {
    __mapsetting: never;
}

declare interface mapdensity extends handle {
    __mapdensity: never;
}

declare interface mapcontrol extends handle {
    __mapcontrol: never;
}

declare interface playerslotstate extends handle {
    __playerslotstate: never;
}

declare interface volumegroup extends handle {
    __volumegroup: never;
}

declare interface camerafield extends handle {
    __camerafield: never;
}

declare interface camerasetup extends handle {
    __camerasetup: never;
}

declare interface playercolor extends handle {
    __playercolor: never;
}

declare interface placement extends handle {
    __placement: never;
}

declare interface startlocprio extends handle {
    __startlocprio: never;
}

declare interface raritycontrol extends handle {
    __raritycontrol: never;
}

declare interface blendmode extends handle {
    __blendmode: never;
}

declare interface texmapflags extends handle {
    __texmapflags: never;
}

declare interface effect extends agent {
    __effect: never;
}

declare interface effecttype extends handle {
    __effecttype: never;
}

declare interface weathereffect extends handle {
    __weathereffect: never;
}

declare interface terraindeformation extends handle {
    __terraindeformation: never;
}

declare interface fogstate extends handle {
    __fogstate: never;
}

declare interface fogmodifier extends agent {
    __fogmodifier: never;
}

declare interface dialog extends agent {
    __dialog: never;
}

declare interface button extends agent {
    __button: never;
}

declare interface quest extends agent {
    __quest: never;
}

declare interface questitem extends agent {
    __questitem: never;
}

declare interface defeatcondition extends agent {
    __defeatcondition: never;
}

declare interface timerdialog extends agent {
    __timerdialog: never;
}

declare interface leaderboard extends agent {
    __leaderboard: never;
}

declare interface multiboard extends agent {
    __multiboard: never;
}

declare interface multiboarditem extends agent {
    __multiboarditem: never;
}

declare interface trackable extends agent {
    __trackable: never;
}

declare interface gamecache extends agent {
    __gamecache: never;
}

declare interface version extends handle {
    __version: never;
}

declare interface itemtype extends handle {
    __itemtype: never;
}

declare interface texttag extends handle {
    __texttag: never;
}

declare interface attacktype extends handle {
    __attacktype: never;
}

declare interface damagetype extends handle {
    __damagetype: never;
}

declare interface weapontype extends handle {
    __weapontype: never;
}

declare interface soundtype extends handle {
    __soundtype: never;
}

declare interface lightning extends handle {
    __lightning: never;
}

declare interface pathingtype extends handle {
    __pathingtype: never;
}

declare interface image extends handle {
    __image: never;
}

declare interface ubersplat extends handle {
    __ubersplat: never;
}

declare interface hashtable extends agent {
    __hashtable: never;
}

/**
 * made by solar
 */

//solar made
/**
 * 转换种族
 */
declare function ConvertRace(i: number): race;

/**
 * 转换联盟类型
 */
declare function ConvertAllianceType(i: number): alliancetype;

/**
 * 转换种族
 */
declare function ConvertRacePref(i: number): racepreference;

/**
 * 转换I游戏状态
 */
declare function ConvertIGameState(i: number): igamestate;

/**
 * 转换F游戏状态
 */
declare function ConvertFGameState(i: number): fgamestate;

/**
 * 玩家状态转换
 */
declare function ConvertPlayerState(i: number): playerstate;

/**
 * 转换玩家得分
 */
declare function ConvertPlayerScore(i: number): playerscore;

/**
 * 转换玩家游戏结果
 */
declare function ConvertPlayerGameResult(i: number): playergameresult;

/**
 * 转换单位状态
 */
declare function ConvertUnitState(i: number): unitstate;

/**
 * 转换AI难度
 */
declare function ConvertAIDifficulty(i: number): aidifficulty;

/**
 * 转换游戏事件
 */
declare function ConvertGameEvent(i: number): gameevent;

/**
 * 转换玩家事件
 */
declare function ConvertPlayerEvent(i: number): playerevent;

/**
 * 转换玩家单位事件
 */
declare function ConvertPlayerUnitEvent(i: number): playerunitevent;

/**
 * 转换组件事件
 */
declare function ConvertWidgetEvent(i: number): widgetevent;

/**
 * 转换对话框事件
 */
declare function ConvertDialogEvent(i: number): dialogevent;

/**
 * 转换单位事件
 */
declare function ConvertUnitEvent(i: number): unitevent;

/**
 * 转换限制操作
 */
declare function ConvertLimitOp(i: number): limitop;

/**
 * 转换单位类型
 */
declare function ConvertUnitType(i: number): unittype;

/**
 * 转换游戏速度
 */
declare function ConvertGameSpeed(i: number): gamespeed;

/**
 * 转换位置
 */
declare function ConvertPlacement(i: number): placement;

/**
 * 转换起始位置优先
 */
declare function ConvertStartLocPrio(i: number): startlocprio;

/**
 * 游戏难度
 */
declare function ConvertGameDifficulty(i: number): gamedifficulty;

/**
 * 游戏类型
 */
declare function ConvertGameType(i: number): gametype;

/**
 * 地图标记
 */
declare function ConvertMapFlag(i: number): mapflag;

/**
 * 地图可见性
 */
declare function ConvertMapVisibility(i: number): mapvisibility;

/**
 * 地图设置
 */
declare function ConvertMapSetting(i: number): mapsetting;

/**
 * 地图密度
 */
declare function ConvertMapDensity(i: number): mapdensity;

/**
 * 地图控制器
 */
declare function ConvertMapControl(i: number): mapcontrol;

/**
 * 玩家颜色
 */
declare function ConvertPlayerColor(i: number): playercolor;

/**
 * 玩家位置状态
 */
declare function ConvertPlayerSlotState(i: number): playerslotstate;

/**
 * 音量组
 */
declare function ConvertVolumeGroup(i: number): volumegroup;

/**
 * 照相机领域
 */
declare function ConvertCameraField(i: number): camerafield;

/**
 * 混合模式
 */
declare function ConvertBlendMode(i: number): blendmode;

/**
 * 罕见的控制
 */
declare function ConvertRarityControl(i: number): raritycontrol;

/**
 * 纹理贴图标志
 */
declare function ConvertTexMapFlags(i: number): texmapflags;

/**
 * 迷雾状态
 */
declare function ConvertFogState(i: number): fogstate;

/**
 * 特效类型
 */
declare function ConvertEffectType(i: number): effecttype;

/**
 * 版本
 */
declare function ConvertVersion(i: number): version;

/**
 * 物品类型
 */
declare function ConvertItemType(i: number): itemtype;

/**
 * 攻击类型
 */
declare function ConvertAttackType(i: number): attacktype;

/**
 * 伤害类型
 */
declare function ConvertDamageType(i: number): damagetype;

/**
 * 武器类型
 */
declare function ConvertWeaponType(i: number): weapontype;

/**
 * 声音类型
 */
declare function ConvertSoundType(i: number): soundtype;

/**
 * 路径类型
 */
declare function ConvertPathingType(i: number): pathingtype;

/**
 * 命令id
 */
declare function OrderId(orderIdString: string): number;

/**
 * 命令id转字符串
 */
declare function OrderId2String(orderid: number): string;

/**
 * 单位id
 */
declare function UnitId(unitIdString: string): number;

/**
 * 单位id转字符串
 */
declare function UnitId2String(unitid: number): string;

/**
 * Not currently working correctly...
 */
declare function AbilityId(abilityIdString: string): number;

declare function AbilityId2String(abilityid: number): string;

/**
 * Looks up the "name" field for any object (unit, item, ability)
 */
/**
 * 物体名称 [C]
 */
declare function GetObjectName(objectid: number): string;

/**
 * 获取最大的玩家数
 */
declare function GetBJMaxPlayers(): number;

/**
 * 玩家中立的受害者
 */
declare function GetBJPlayerNeutralVictim(): number;

/**
 * 获得bj玩家中立额外
 */
declare function GetBJPlayerNeutralExtra(): number;

/**
 * 获得最大玩家插槽
 */
declare function GetBJMaxPlayerSlots(): number;

/**
 * 玩家中立被动
 */
declare function GetPlayerNeutralPassive(): number;

/**
 * 玩家中立敌对
 */
declare function GetPlayerNeutralAggressive(): number;

/**
 * end global var declaration
 */
//============================================================================
/**
 * MathAPI
 */
/**
 * 转换 度 到 弧度
 */
declare function Deg2Rad(degrees: number): number;

/**
 * 转换 弧度 到 度
 */
declare function Rad2Deg(radians: number): number;

/**
 * 正弦(弧度) [R]
 */
declare function Sin(radians: number): number;

/**
 * 余弦(弧度) [R]
 */
declare function Cos(radians: number): number;

/**
 * 正切(弧度) [R]
 */
declare function Tan(radians: number): number;

/**
 * Expect values between -1 and 1...returns 0 for invalid input
 */
/**
 * 反正弦(弧度) [R]
 */
declare function Asin(y: number): number;

/**
 * 反余弦(弧度) [R]
 */
declare function Acos(x: number): number;

/**
 * 反正切(弧度) [R]
 */
declare function Atan(x: number): number;

/**
 * Returns 0 if x and y are both 0
 */
/**
 * 反正切(Y:X)(弧度) [R]
 */
declare function Atan2(y: number, x: number): number;

/**
 * Returns 0 if x <= 0
 */
/**
 * 平方根
 */
declare function SquareRoot(x: number): number;

/**
 * computes x to the y power
 */
/**
 * y == 0.0             => 1
 */
/**
 * x ==0.0 and y < 0    => 0
 */

//
/**
 * 求幂
 */
declare function Pow(x: number, power: number): number;

declare function MathRound(r: number): number;

//============================================================================
/**
 * String Utility API
 */
/**
 * 转换整数变量为实数
 */
declare function I2R(i: number): number;

/**
 * 转换实数为整数
 */
declare function R2I(r: number): number;

/**
 * 将整数转换为字符串
 */
declare function I2S(i: number): string;

/**
 * 将实数转换为字符串
 */
declare function R2S(r: number): string;

/**
 * 将实数转换为格式化字符串
 */
declare function R2SW(r: number, width: number, precision: number): string;

/**
 * 转换字串符为整数
 */
declare function S2I(s: string): number;

/**
 * 转换字符串为实数
 */
declare function S2R(s: string): number;

/**
 * 获取句柄id    tips:一般用于hashtable key
 */
declare function GetHandleId(h: handle): number;

/**
 * 截取字符串 [R]
 */
declare function SubString(source: string, start: number, end: number): string;

/**
 * 字串符长度
 */
declare function StringLength(s: string): number;

/**
 * 将字串符转换为大小写字母
 */
declare function StringCase(source: string, upper: boolean): string;

/**
 * 转换字符串为哈希码
 */
declare function StringHash(s: string): number;

/**
 * 本地字符串 [R]
 */
declare function GetLocalizedString(source: string): string;

/**
 * 本地热键
 */
declare function GetLocalizedHotkey(source: string): number;

//============================================================================
/**
 * Map Setup API
 */
//
/**
 * These are native functions for describing the map configuration
 */
/**
 * these funcs should only be used in the "config" function of
 */

/**
 * a map script. The functions should also be called in this order
 */
/**
 * ( i.e. call SetPlayers before SetPlayerColor...
 */
//
declare function SetMapName(name: string): void;

declare function SetMapDescription(description: string): void;

declare function SetTeams(teamcount: number): void;

declare function SetPlayers(playercount: number): void;

declare function DefineStartLocation(whichStartLoc: number, x: number, y: number): void;

declare function DefineStartLocationLoc(whichStartLoc: number, whichLocation: location): void;

declare function SetStartLocPrioCount(whichStartLoc: number, prioSlotCount: number): void;

declare function SetStartLocPrio(whichStartLoc: number, prioSlotIndex: number, otherStartLocIndex: number, priority: startlocprio): void;

declare function GetStartLocPrioSlot(whichStartLoc: number, prioSlotIndex: number): number;

declare function GetStartLocPrio(whichStartLoc: number, prioSlotIndex: number): startlocprio;

declare function SetEnemyStartLocPrioCount(whichStartLoc: number, prioSlotCount: number): void;

declare function SetEnemyStartLocPrio(whichStartLoc: number, prioSlotIndex: number, otherStartLocIndex: number, priority: startlocprio): void;

declare function SetGameTypeSupported(whichGameType: gametype, value: boolean): void;

/**
 * 设置地图参数
 */
declare function SetMapFlag(whichMapFlag: mapflag, value: boolean): void;

declare function SetGamePlacement(whichPlacementType: placement): void;

/**
 * 设定游戏速度
 */
declare function SetGameSpeed(whichspeed: gamespeed): void;

/**
 * 设置游戏难度 [R]
 */
declare function SetGameDifficulty(whichdifficulty: gamedifficulty): void;

declare function SetResourceDensity(whichdensity: mapdensity): void;

declare function SetCreatureDensity(whichdensity: mapdensity): void;

/**
 * 队伍数量
 */
declare function GetTeams(): number;

/**
 * 玩家数量
 */
declare function GetPlayers(): number;

/**
 * 是否支持游戏类型
 */
declare function IsGameTypeSupported(whichGameType: gametype): boolean;

/**
 * 游戏选择类型
 */
declare function GetGameTypeSelected(): gametype;

/**
 * 地图参数
 */
declare function IsMapFlagSet(whichMapFlag: mapflag): boolean;

declare function GetGamePlacement(): placement;

/**
 * 当前游戏速度
 */
declare function GetGameSpeed(): gamespeed;

/**
 * 难度等级
 */
declare function GetGameDifficulty(): gamedifficulty;

declare function GetResourceDensity(): mapdensity;

declare function GetCreatureDensity(): mapdensity;

declare function GetStartLocationX(whichStartLocation: number): number;

declare function GetStartLocationY(whichStartLocation: number): number;

declare function GetStartLocationLoc(whichStartLocation: number): location;

/**
 * 设置玩家队伍
 */
declare function SetPlayerTeam(whichPlayer: player, whichTeam: number): void;

/**
 * 设置玩家开始点
 */
declare function SetPlayerStartLocation(whichPlayer: player, startLocIndex: number): void;

/**
 * forces player to have the specified start loc and marks the start loc as occupied
 */
/**
 * which removes it from consideration for subsequently placed players
 */
/**
 * ( i.e. you can use this to put people in a fixed loc and then
 */
/**
 * use random placement for any unplaced players etc )
 */

/**
 * use random placement for any unplaced players etc )
 */
/**
 * 势力玩家开始点
 */
declare function ForcePlayerStartLocation(whichPlayer: player, startLocIndex: number): void;

/**
 * 改变玩家颜色 [R]
 */
declare function SetPlayerColor(whichPlayer: player, color: playercolor): void;

/**
 * 设置联盟状态(指定项目) [R]
 */
declare function SetPlayerAlliance(sourcePlayer: player, otherPlayer: player, whichAllianceSetting: alliancetype, value: boolean): void;

/**
 * 设置税率 [R]
 */
declare function SetPlayerTaxRate(sourcePlayer: player, otherPlayer: player, whichResource: playerstate, rate: number): void;

/**
 * 设置玩家种族
 */
declare function SetPlayerRacePreference(whichPlayer: player, whichRacePreference: racepreference): void;

/**
 * 设置玩家种族可选
 */
declare function SetPlayerRaceSelectable(whichPlayer: player, value: boolean): void;

/**
 * 设置玩家控制器
 */
declare function SetPlayerController(whichPlayer: player, controlType: mapcontrol): void;

/**
 * 设置玩家名字
 */
declare function SetPlayerName(whichPlayer: player, name: string): void;

/**
 * 显示/隐藏计分屏显示 [R]
 */
declare function SetPlayerOnScoreScreen(whichPlayer: player, flag: boolean): void;

/**
 * 玩家在的队伍
 */
declare function GetPlayerTeam(whichPlayer: player): number;

/**
 * 玩家开始点
 */
declare function GetPlayerStartLocation(whichPlayer: player): number;

/**
 * 玩家的颜色
 */
declare function GetPlayerColor(whichPlayer: player): playercolor;

/**
 * 玩家是否可选
 */
declare function GetPlayerSelectable(whichPlayer: player): boolean;

/**
 * 玩家控制者
 */
declare function GetPlayerController(whichPlayer: player): mapcontrol;

/**
 * 玩家游戏属性
 */
declare function GetPlayerSlotState(whichPlayer: player): playerslotstate;

/**
 * 玩家税率 [R]
 */
declare function GetPlayerTaxRate(sourcePlayer: player, otherPlayer: player, whichResource: playerstate): number;

/**
 * 玩家的种族选择
 */
declare function IsPlayerRacePrefSet(whichPlayer: player, pref: racepreference): boolean;

/**
 * 玩家名字
 */
declare function GetPlayerName(whichPlayer: player): string;

//============================================================================
/**
 * Timer API
 */

//
/**
 * 新建计时器 [R]
 */
declare function CreateTimer(): timer;

/**
 * 删除计时器 [R]
 */
declare function DestroyTimer(whichTimer: timer): void;

/**
 * 运行计时器 [C]
 * @deprecated 请尽量使用BaseUtil.runLater 中心计时器替代 以减少内存泄漏
 * (或者handlerFunc 使用命名函数 以减少内存泄漏)
 */
declare function TimerStart(whichTimer: timer, timeout: number, periodic: boolean, handlerFunc: () => void): void;

/**
 * 计时器经过的时间
 */
declare function TimerGetElapsed(whichTimer: timer): number;

/**
 * 计时器剩余时间
 */
declare function TimerGetRemaining(whichTimer: timer): number;

/**
 * 计时器初始的时间
 */
declare function TimerGetTimeout(whichTimer: timer): number;

/**
 * 暂停计时器 [R]
 */
declare function PauseTimer(whichTimer: timer): void;

/**
 * 恢复计时器 [R]
 */
declare function ResumeTimer(whichTimer: timer): void;

/**
 * 事件响应 - 计时器期满
 */
declare function GetExpiredTimer(): timer;

//============================================================================
/**
 * Group API
 */

//
/**
 * 新建的单位组 [R]
 */
declare function CreateGroup(): group;

/**
 * 删除单位组 [R]
 */
declare function DestroyGroup(whichGroup: group): void;

/**
 * 添加单位 [R]
 */
declare function GroupAddUnit(whichGroup: group, whichUnit: unit): boolean;

/**
 * 移除单位 [R]
 */
declare function GroupRemoveUnit(whichGroup: group, whichUnit: unit): boolean;

// /**
//  * 单位组添加单位组 [快速的]
//  */
// declare function BlzGroupAddGroupFast(whichGroup: group, addGroup: group): number;

// /**
//  * 单位组移除单位组 [快速的]
//  */
// declare function BlzGroupRemoveGroupFast(whichGroup: group, removeGroup: group): number;

/**
 * 清除
 */
declare function GroupClear(whichGroup: group): void;

// /**
//  * 获取单组大小
//  */
// declare function BlzGroupGetSize(whichGroup: group): number;
//
// /**
//  * 获取单位组中下标的单位
//  */
// declare function BlzGroupUnitAt(whichGroup: group, index: number): unit;

/**
 * 通过单位类型匹配单位
 */
declare function GroupEnumUnitsOfType(whichGroup: group, unitname: string, filter: boolexpr): void;

/**
 * 通过玩家匹配单位
 */
declare function GroupEnumUnitsOfPlayer(whichGroup: group, whichPlayer: player, filter: boolexpr): void;

/**
 * 通过单位类型匹配单位 [countLimit 上限]
 */
declare function GroupEnumUnitsOfTypeCounted(whichGroup: group, unitname: string, filter: boolexpr, countLimit: number): void;

/**
 * 匹配范围单位
 */
declare function GroupEnumUnitsInRect(whichGroup: group, r: rect, filter: boolexpr): void;

/**
 * 匹配范围单位 [countLimit 上限]
 */
declare function GroupEnumUnitsInRectCounted(whichGroup: group, r: rect, filter: boolexpr, countLimit: number): void;

/**
 * 选取单位添加到单位组(坐标)
 */
declare function GroupEnumUnitsInRange(whichGroup: group, x: number, y: number, radius: number, filter: boolexpr): void;

/**
 * 选取单位添加到单位组(点)
 */
declare function GroupEnumUnitsInRangeOfLoc(whichGroup: group, whichLocation: location, radius: number, filter: boolexpr): void;

/**
 * 选取单位添加到单位组(坐标)(不建议使用)
 */
declare function GroupEnumUnitsInRangeCounted(whichGroup: group, x: number, y: number, radius: number, filter: boolexpr, countLimit: number): void;

/**
 * 选取单位添加到单位组(点)(不建议使用)
 */
declare function GroupEnumUnitsInRangeOfLocCounted(whichGroup: group, whichLocation: location, radius: number, filter: boolexpr, countLimit: number): void;

declare function GroupEnumUnitsSelected(whichGroup: group, whichPlayer: player, filter: boolexpr): void;

/**
 * 发送单位组命令到 没有目标
 */
declare function GroupImmediateOrder(whichGroup: group, order: string): boolean;

/**
 * 发布命令(无目标)(ID)
 */
declare function GroupImmediateOrderById(whichGroup: group, order: number): boolean;

/**
 * 发布命令(指定坐标) [R]
 */
declare function GroupPointOrder(whichGroup: group, order: string, x: number, y: number): boolean;

/**
 * 发送单位组命令到 点
 */
declare function GroupPointOrderLoc(whichGroup: group, order: string, whichLocation: location): boolean;

/**
 * 发布命令(指定坐标)(ID)
 */
declare function GroupPointOrderById(whichGroup: group, order: number, x: number, y: number): boolean;

/**
 * 发布命令(指定点)(ID)
 */
declare function GroupPointOrderByIdLoc(whichGroup: group, order: number, whichLocation: location): boolean;

/**
 * 发送单位组命令到 单位
 */
declare function GroupTargetOrder(whichGroup: group, order: string, targetWidget: widget): boolean;

/**
 * 发布命令(指定单位)(ID)
 */
declare function GroupTargetOrderById(whichGroup: group, order: number, targetWidget: widget): boolean;

/**
 * This will be difficult to support with potentially disjoint, cell-based regions
 */
/**
 * as it would involve enumerating all the cells that are covered by a particularregion
 */
/**
 * a better implementation would be a trigger that adds relevant units as they enter
 */

/**
 * and removes them if they leave...
 */
/**
 * 选取所有单位在单位组做 多动作
 * @deprecated 请使用GroupUtil.for  以减少内存泄漏
 */
declare function ForGroup(whichGroup: group, callback: () => void): void;

/**
 * 单位组中第一个单位
 */
declare function FirstOfGroup(whichGroup: group): unit;

//============================================================================
/**
 * Force API
 */

//
/**
 * 新建玩家组 [R]
 */
declare function CreateForce(): force;

/**
 * 删除玩家组 [R]
 */
declare function DestroyForce(whichForce: force): void;

/**
 * 添加玩家 [R]
 */
declare function ForceAddPlayer(whichForce: force, whichPlayer: player): void;

/**
 * 移除玩家 [R]
 */
declare function ForceRemovePlayer(whichForce: force, whichPlayer: player): void;

// declare function BlzForceHasPlayer(whichForce: force, whichPlayer: player): boolean;

/**
 * 清除玩家
 */
declare function ForceClear(whichForce: force): void;

/**
 * 匹配玩家
 */
declare function ForceEnumPlayers(whichForce: force, filter: boolexpr): void;

/**
 * 匹配玩家 [countLimit 上限]
 */
declare function ForceEnumPlayersCounted(whichForce: force, filter: boolexpr, countLimit: number): void;

/**
 * 匹配联盟
 */
declare function ForceEnumAllies(whichForce: force, whichPlayer: player, filter: boolexpr): void;

/**
 * 匹配敌对
 */
declare function ForceEnumEnemies(whichForce: force, whichPlayer: player, filter: boolexpr): void;

/**
 * 选取所有玩家在玩家组做动作(单一的)
 */
declare function ForForce(whichForce: force, callback: () => void): void;

//============================================================================
/**
 * Region and Location API
 */

//
/**
 * 将坐标转换为区域
 */
declare function Rect(minx: number, miny: number, maxx: number, maxy: number): rect;

/**
 * 将点转换为区域
 */
declare function RectFromLoc(min: location, max: location): rect;

/**
 * 删除矩形区域 [R]
 */
declare function RemoveRect(whichRect: rect): void;

/**
 * 设置矩形区域(指定坐标) [R]
 */
declare function SetRect(whichRect: rect, minx: number, miny: number, maxx: number, maxy: number): void;

/**
 * 设置矩形区域(指定点) [R]
 */
declare function SetRectFromLoc(whichRect: rect, min: location, max: location): void;

/**
 * 移动矩形区域(指定坐标) [R]
 */
declare function MoveRectTo(whichRect: rect, newCenterX: number, newCenterY: number): void;

/**
 * 移动区域
 */
declare function MoveRectToLoc(whichRect: rect, newCenterLoc: location): void;

/**
 * 区域中心的 X 坐标
 */
declare function GetRectCenterX(whichRect: rect): number;

/**
 * 区域中心的 Y 坐标
 */
declare function GetRectCenterY(whichRect: rect): number;

/**
 * 区域最小 X 坐标
 */
declare function GetRectMinX(whichRect: rect): number;

/**
 * 区域最小 Y 坐标
 */
declare function GetRectMinY(whichRect: rect): number;

/**
 * 区域最大 X 坐标
 */
declare function GetRectMaxX(whichRect: rect): number;

/**
 * 区域最大 Y 坐标
 */
declare function GetRectMaxY(whichRect: rect): number;

/**
 * 新建区域 [R]
 */
declare function CreateRegion(): region;

/**
 * 删除不规则区域 [R]
 */
declare function RemoveRegion(whichRegion: region): void;

/**
 * 添加区域 [R]
 */
declare function RegionAddRect(whichRegion: region, r: rect): void;

/**
 * 移除区域 [R]
 */
declare function RegionClearRect(whichRegion: region, r: rect): void;

/**
 * 添加单元点(指定坐标) [R]
 */
declare function RegionAddCell(whichRegion: region, x: number, y: number): void;

/**
 * 添加单元点(指定点) [R]
 */
declare function RegionAddCellAtLoc(whichRegion: region, whichLocation: location): void;

/**
 * 移除单元点(指定坐标) [R]
 */
declare function RegionClearCell(whichRegion: region, x: number, y: number): void;

/**
 * 移除单元点(指定点) [R]
 */
declare function RegionClearCellAtLoc(whichRegion: region, whichLocation: location): void;

/**
 * 转换坐标到点
 */
declare function Location(x: number, y: number): location;

/**
 * 清除点 [R]
 */
declare function RemoveLocation(whichLocation: location): void;

/**
 * 移动点 [R]
 */
declare function MoveLocation(whichLocation: location, newX: number, newY: number): void;

/**
 * X 坐标
 */
declare function GetLocationX(whichLocation: location): number;

/**
 * Y 坐标
 */
declare function GetLocationY(whichLocation: location): number;

/**
 * This function is asynchronous. The values it returns are not guaranteed synchronous between each player.
 */

/**
 * If you attempt to use it in a synchronous manner, it may cause a desync.
 */
/**
 * 点的Z轴高度 [R]
 */
declare function GetLocationZ(whichLocation: location): number;

/**
 * 单位检查
 */
declare function IsUnitInRegion(whichRegion: region, whichUnit: unit): boolean;

/**
 * 包含坐标
 */
declare function IsPointInRegion(whichRegion: region, x: number, y: number): boolean;

/**
 * 包含点
 */
declare function IsLocationInRegion(whichRegion: region, whichLocation: location): boolean;

/**
 * Returns full map bounds, including unplayable borders, in world coordinates
 */

/**
 * Returns full map bounds, including unplayable borders, in world coordinates
 */
/**
 * 获取可用地图范围
 */
declare function GetWorldBounds(): rect;

//============================================================================
/**
 * Native trigger interface
 */

//
/**
 * 新建触发 [R]
 */
declare function CreateTrigger(): trigger;

/**
 * 删除触发器 [R]
 */
declare function DestroyTrigger(whichTrigger: trigger): void;

/**
 * 重置触发
 */
declare function ResetTrigger(whichTrigger: trigger): void;

/**
 * 打开触发器
 */
declare function EnableTrigger(whichTrigger: trigger): void;

/**
 * 关掉触发器
 */
declare function DisableTrigger(whichTrigger: trigger): void;

/**
 * 触发器打开
 */
declare function IsTriggerEnabled(whichTrigger: trigger): boolean;

/**
 * 挂起触发
 */
declare function TriggerWaitOnSleeps(whichTrigger: trigger, flag: boolean): void;

/**
 * 触发是否挂起
 */
declare function IsTriggerWaitOnSleeps(whichTrigger: trigger): boolean;

/**
 * 匹配的单位
 */
declare function GetFilterUnit(): unit;

/**
 * 选取的单位
 */
declare function GetEnumUnit(): unit;

/**
 * 匹配的可毁坏物
 */
declare function GetFilterDestructable(): destructable;

/**
 * 选取的可毁坏物
 */
declare function GetEnumDestructable(): destructable;

/**
 * 匹配的物品
 */
declare function GetFilterItem(): item;

/**
 * 选取的物品
 */
declare function GetEnumItem(): item;

/**
 * 解析tags
 */
declare function ParseTags(taggedString: string): string;

/**
 * 匹配的玩家
 */
declare function GetFilterPlayer(): player;

/**
 * 选取的玩家
 */
declare function GetEnumPlayer(): player;

/**
 * 当前触发器
 */
declare function GetTriggeringTrigger(): trigger;

/**
 * 获取触发ID
 */
declare function GetTriggerEventId(): eventid;

/**
 * 触发器赋值统计
 */
declare function GetTriggerEvalCount(whichTrigger: trigger): number;

/**
 * 触发器运行次数统计
 */
declare function GetTriggerExecCount(whichTrigger: trigger): number;

/**
 * 运行函数 [R] (只能同步使用)
 */
declare function ExecuteFunc(funcName: string): void;

//============================================================================
/**
 * Boolean Expr API ( for compositing trigger conditions and unit filter funcs...)
 */
//============================================================================
/**
 * ============================================================================
 */
/**
 * and
 */
declare function And(operandA: boolexpr, operandB: boolexpr): boolexpr;

/**
 * or
 */
declare function Or(operandA: boolexpr, operandB: boolexpr): boolexpr;

/**
 * not
 */
declare function Not(operand: boolexpr): boolexpr;

/**
 * 限制条件为
 * @deprecated 推荐在动作里使用if判断条件
 */
declare function Condition(func: () => boolean): conditionfunc;

/**
 * 销毁条件
 */
declare function DestroyCondition(c: conditionfunc): void;

/**
 * 过滤
 * @deprecated 推荐在动作里使用if判断条件
 */
declare function Filter(func: () => boolean): filterfunc;

/**
 * 销毁过滤
 */
declare function DestroyFilter(f: filterfunc): void;

/**
 * 销毁条件表达式
 */
declare function DestroyBoolExpr(e: boolexpr): void;

//============================================================================
/**
 * Trigger Game Event API
 */

//============================================================================
/**
 * 变量的值
 */
declare function TriggerRegisterVariableEvent(whichTrigger: trigger, varName: string, opcode: limitop, limitval: number): event;

/**
 * EVENT_GAME_VARIABLE_LIMIT
 */
//constant native string GetTriggeringVariableName takes nothing returns string
/**
 * Creates it's own timer and triggers when it expires
 */

/**
 * Creates it's own timer and triggers when it expires
 */
/**
 * 注册计时器事件
 */
declare function TriggerRegisterTimerEvent(whichTrigger: trigger, timeout: number, periodic: boolean): event;

/**
 * Triggers when the timer you tell it about expires
 */

/**
 * Triggers when the timer you tell it about expires
 */
/**
 * 计时器到期事件
 */
declare function TriggerRegisterTimerExpireEvent(whichTrigger: trigger, t: timer): event;

/**
 * 游戏状态事件
 */
declare function TriggerRegisterGameStateEvent(whichTrigger: trigger, whichState: gamestate, opcode: limitop, limitval: number): event;

/**
 * 对话框事件
 */
declare function TriggerRegisterDialogEvent(whichTrigger: trigger, whichDialog: dialog): event;

/**
 * 对话框按钮被点击 [R]
 */
declare function TriggerRegisterDialogButtonEvent(whichTrigger: trigger, whichButton: button): event;

/**
 * EVENT_GAME_STATE_LIMIT
 */

/**
 * EVENT_GAME_STATE_LIMIT
 */
/**
 * 获取游戏状态
 */
declare function GetEventGameState(): gamestate;

/**
 * 比赛游戏事件
 */
declare function TriggerRegisterGameEvent(whichTrigger: trigger, whichGameEvent: gameevent): event;

/**
 * EVENT_GAME_VICTORY
 */

/**
 * EVENT_GAME_VICTORY
 */
/**
 * 过去胜利玩家
 */
declare function GetWinningPlayer(): player;

/**
 * 单位进入不规则区域(指定条件) [R]
 */
declare function TriggerRegisterEnterRegion(whichTrigger: trigger, whichRegion: region, filter: boolexpr): event;

/**
 * EVENT_GAME_ENTER_REGION
 */
/**
 * 触发区域 [R]
 */
declare function GetTriggeringRegion(): region;

/**
 * 正在进入的单位
 */
declare function GetEnteringUnit(): unit;

/**
 * EVENT_GAME_LEAVE_REGION
 */
/**
 * 单位离开不规则区域(指定条件) [R]
 */
declare function TriggerRegisterLeaveRegion(whichTrigger: trigger, whichRegion: region, filter: boolexpr): event;

/**
 * 正在离开的单位
 */
declare function GetLeavingUnit(): unit;

/**
 * 鼠标点击可追踪物 [R]
 */
declare function TriggerRegisterTrackableHitEvent(whichTrigger: trigger, t: trackable): event;

/**
 * 鼠标移动到追踪对象 [R]
 */
declare function TriggerRegisterTrackableTrackEvent(whichTrigger: trigger, t: trackable): event;

/**
 * EVENT_COMMAND_BUTTON_CLICK
 */
/**
 * 命令事件
 */
declare function TriggerRegisterCommandEvent(whichTrigger: trigger, whichAbility: number, order: string): event;

declare function TriggerRegisterUpgradeCommandEvent(whichTrigger: trigger, whichUpgrade: number): event;

/**
 * EVENT_GAME_TRACKABLE_HIT
 */

/**
 * EVENT_GAME_TRACKABLE_TRACK
 */
/**
 * 事件响应 - 触发可追踪物 [R]
 */
declare function GetTriggeringTrackable(): trackable;

/**
 * EVENT_DIALOG_BUTTON_CLICK
 */

/**
 * EVENT_DIALOG_BUTTON_CLICK
 */
/**
 * 获取点击按钮
 */
declare function GetClickedButton(): button;

/**
 * 获取点击对话框
 */
declare function GetClickedDialog(): dialog;

/**
 * EVENT_GAME_TOURNAMENT_FINISH_SOON
 */
/**
 * 比赛剩余时间
 */
declare function GetTournamentFinishSoonTimeRemaining(): number;

/**
 * 比赛结束规则
 */
declare function GetTournamentFinishNowRule(): number;

/**
 * 比赛结束玩家
 */
declare function GetTournamentFinishNowPlayer(): player;

/**
 * 对战比赛得分
 */
declare function GetTournamentScore(whichPlayer: player): number;

/**
 * EVENT_GAME_SAVE
 */
/**
 * 储存游戏文件名
 */
declare function GetSaveBasicFilename(): string;

//============================================================================
/**
 * Trigger Player Based Event API
 */

//============================================================================
/**
 * 玩家事件
 */
declare function TriggerRegisterPlayerEvent(whichTrigger: trigger, whichPlayer: player, whichPlayerEvent: playerevent): event;

/**
 * EVENT_PLAYER_DEFEAT
 */

/**
 * EVENT_PLAYER_VICTORY
 */
/**
 * 触发玩家
 */
declare function GetTriggerPlayer(): player;

/**
 * 玩家单位事件
 */
declare function TriggerRegisterPlayerUnitEvent(whichTrigger: trigger, whichPlayer: player, whichPlayerUnitEvent: playerunitevent, filter: boolexpr): event;

/**
 * EVENT_PLAYER_HERO_LEVEL
 */

/**
 * EVENT_UNIT_HERO_LEVEL
 */
/**
 * 英雄升级
 */
declare function GetLevelingUnit(): unit;

/**
 * EVENT_PLAYER_HERO_SKILL
 */

/**
 * EVENT_UNIT_HERO_SKILL
 */
/**
 * 学习技能的英雄
 */
declare function GetLearningUnit(): unit;

/**
 * 学习技能 [R]
 */
declare function GetLearnedSkill(): number;

/**
 * 学习的技能的等级
 */
declare function GetLearnedSkillLevel(): number;

/**
 * EVENT_PLAYER_HERO_REVIVABLE
 */
/**
 * 可复活的英雄
 */
declare function GetRevivableUnit(): unit;

/**
 * EVENT_PLAYER_HERO_REVIVE_START
 */
/**
 * EVENT_PLAYER_HERO_REVIVE_CANCEL
 */
/**
 * EVENT_PLAYER_HERO_REVIVE_FINISH
 */
/**
 * EVENT_UNIT_HERO_REVIVE_START
 */
/**
 * EVENT_UNIT_HERO_REVIVE_CANCEL
 */

/**
 * EVENT_UNIT_HERO_REVIVE_FINISH
 */
/**
 * 复活英雄
 */
declare function GetRevivingUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_ATTACKED
 */
/**
 * 攻击的单位
 */
declare function GetAttacker(): unit;

/**
 * EVENT_PLAYER_UNIT_RESCUED
 */
/**
 * EVENT_PLAYER_UNIT_RESCUED
 */
declare function GetRescuer(): unit;

/**
 * EVENT_PLAYER_UNIT_DEATH
 */
/**
 * 垂死的单位
 */
declare function GetDyingUnit(): unit;

/**
 * 凶手单位
 */
declare function GetKillingUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_DECAY
 */
/**
 * 尸体腐烂单位
 */
declare function GetDecayingUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_SELECTED
 */
//constant native GetSelectedUnit takes nothing returns unit
/**
 * EVENT_PLAYER_UNIT_CONSTRUCT_START
 */
/**
 * 正在建造的建筑
 */
declare function GetConstructingStructure(): unit;

/**
 * EVENT_PLAYER_UNIT_CONSTRUCT_FINISH
 */

/**
 * EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL
 */
/**
 * 取消建造中的建筑
 */
declare function GetCancelledStructure(): unit;

/**
 * 已建造的建筑
 */
declare function GetConstructedStructure(): unit;

/**
 * EVENT_PLAYER_UNIT_RESEARCH_START
 */
/**
 * EVENT_PLAYER_UNIT_RESEARCH_CANCEL
 */

/**
 * EVENT_PLAYER_UNIT_RESEARCH_FINISH
 */
/**
 * 研究科技单位
 */
declare function GetResearchingUnit(): unit;

/**
 * 研究的 科技-类型
 */
declare function GetResearched(): number;

/**
 * EVENT_PLAYER_UNIT_TRAIN_START
 */
/**
 * EVENT_PLAYER_UNIT_TRAIN_CANCEL
 */
/**
 * EVENT_PLAYER_UNIT_TRAIN_FINISH
 */

/**
 * EVENT_PLAYER_UNIT_TRAIN_FINISH
 */
/**
 * 训练单位类型
 */
declare function GetTrainedUnitType(): number;

/**
 * EVENT_PLAYER_UNIT_TRAIN_FINISH
 */
/**
 * 训练单位
 */
declare function GetTrainedUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_DETECTED
 */

/**
 * EVENT_PLAYER_UNIT_DETECTED
 */
/**
 * 检测单位
 */
declare function GetDetectedUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_SUMMONED
 */
/**
 * 正在召唤的单位
 */
declare function GetSummoningUnit(): unit;

/**
 * 已召唤单位
 */
declare function GetSummonedUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_LOADED
 */

/**
 * EVENT_PLAYER_UNIT_LOADED
 */
/**
 * 传送单位
 */
declare function GetTransportUnit(): unit;

/**
 * 加载单位
 */
declare function GetLoadedUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_SELL
 */
/**
 * 出售单位
 */
declare function GetSellingUnit(): unit;

/**
 * 被出售单位
 */
declare function GetSoldUnit(): unit;

/**
 * 在购买的单位
 */
declare function GetBuyingUnit(): unit;

/**
 * EVENT_PLAYER_UNIT_SELL_ITEM
 */
/**
 * 卖出的物品
 */
declare function GetSoldItem(): item;

/**
 * EVENT_PLAYER_UNIT_CHANGE_OWNER
 */
/**
 * 改变了所有者的单位
 */
declare function GetChangingUnit(): unit;

/**
 * 前一个所有者
 */
declare function GetChangingUnitPrevOwner(): player;

/**
 * EVENT_PLAYER_UNIT_DROP_ITEM
 */
/**
 * EVENT_PLAYER_UNIT_PICKUP_ITEM
 */

/**
 * EVENT_PLAYER_UNIT_USE_ITEM
 */
/**
 * 获取操作物品的单位
 */
declare function GetManipulatingUnit(): unit;

/**
 * 被操作的物品
 */
declare function GetManipulatedItem(): item;

/**
 * EVENT_PLAYER_UNIT_ISSUED_ORDER
 */
/**
 * 收到命令的单位
 */
declare function GetOrderedUnit(): unit;

/**
 * 发出命令的单位
 */
declare function GetIssuedOrderId(): number;

/**
 * EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER
 */
/**
 * 命令发布点X坐标 [R]
 */
declare function GetOrderPointX(): number;

/**
 * 命令发布点Y坐标 [R]
 */
declare function GetOrderPointY(): number;

/**
 * 目标的位置
 */
declare function GetOrderPointLoc(): location;

/**
 * EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER
 */
/**
 * EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER
 */
declare function GetOrderTarget(): widget;

/**
 * 目标的可毁坏物
 */
declare function GetOrderTargetDestructable(): destructable;

/**
 * 目标的物品
 */
declare function GetOrderTargetItem(): item;

/**
 * 目标的单位
 */
declare function GetOrderTargetUnit(): unit;

/**
 * EVENT_UNIT_SPELL_CHANNEL
 */
/**
 * EVENT_UNIT_SPELL_CAST
 */
/**
 * EVENT_UNIT_SPELL_EFFECT
 */
/**
 * EVENT_UNIT_SPELL_FINISH
 */
/**
 * EVENT_UNIT_SPELL_ENDCAST
 */
/**
 * EVENT_PLAYER_UNIT_SPELL_CHANNEL
 */
/**
 * EVENT_PLAYER_UNIT_SPELL_CAST
 */
/**
 * EVENT_PLAYER_UNIT_SPELL_EFFECT
 */
/**
 * EVENT_PLAYER_UNIT_SPELL_FINISH
 */

/**
 * EVENT_PLAYER_UNIT_SPELL_ENDCAST
 */
/**
 * 技能单位
 */
declare function GetSpellAbilityUnit(): unit;

/**
 * 使用的技能
 */
declare function GetSpellAbilityId(): number;

/**
 * 使用的技能
 */
declare function GetSpellAbility(): ability;

/**
 * 对其使用技能的目标点
 */
declare function GetSpellTargetLoc(): location;

/**
 * 对其使用技能的目标点x
 */
declare function GetSpellTargetX(): number;

/**
 * 对其使用技能的目标点y
 */
declare function GetSpellTargetY(): number;

/**
 * 对其使用技能的目标可毁坏物
 */
declare function GetSpellTargetDestructable(): destructable;

/**
 * 对其使用技能的目标物品
 */
declare function GetSpellTargetItem(): item;

/**
 * 对其使用技能的目标单位
 */
declare function GetSpellTargetUnit(): unit;

/**
 * 联盟状态改变(特殊)
 */
declare function TriggerRegisterPlayerAllianceChange(whichTrigger: trigger, whichPlayer: player, whichAlliance: alliancetype): event;

/**
 * 属性
 */
declare function TriggerRegisterPlayerStateEvent(whichTrigger: trigger, whichPlayer: player, whichState: playerstate, opcode: limitop, limitval: number): event;

/**
 * EVENT_PLAYER_STATE_LIMIT
 */

/**
 * EVENT_PLAYER_STATE_LIMIT
 */
/**
 * 获取玩家属性
 */
declare function GetEventPlayerState(): playerstate;

/**
 * 玩家输入聊天信息
 */
declare function TriggerRegisterPlayerChatEvent(whichTrigger: trigger, whichPlayer: player, chatMessageToDetect: string, exactMatchOnly: boolean): event;

/**
 * EVENT_PLAYER_CHAT
 */
/**
 * returns the actual string they typed in ( same as what you registered for
 */

/**
 * if you required exact match )
 */
/**
 * 输入的聊天字符
 */
declare function GetEventPlayerChatString(): string;

/**
 * returns the string that you registered for
 */
/**
 * 匹配的聊天字符
 */
declare function GetEventPlayerChatStringMatched(): string;

/**
 * 可毁坏物死亡
 */
declare function TriggerRegisterDeathEvent(whichTrigger: trigger, whichWidget: widget): event;

//============================================================================
/**
 * Trigger Unit Based Event API
 */
//============================================================================
/**
 * returns handle to unit which triggered the most recent event when called from
 */

/**
 * within a trigger action function...returns null handle when used incorrectly
 */
/**
 * 触发单位
 */
declare function GetTriggerUnit(): unit;

/**
 * 单位状态事件
 */
declare function TriggerRegisterUnitStateEvent(whichTrigger: trigger, whichUnit: unit, whichState: unitstate, opcode: limitop, limitval: number): event;

/**
 * EVENT_UNIT_STATE_LIMIT
 */

/**
 * EVENT_UNIT_STATE_LIMIT
 */
/**
 * 获取单位状态
 */
declare function GetEventUnitState(): unitstate;

/**
 * 详细单位的事件
 */
declare function TriggerRegisterUnitEvent(whichTrigger: trigger, whichUnit: unit, whichEvent: unitevent): event;

/**
 * EVENT_UNIT_DAMAGED
 */
/**
 * 被伤害的生命值
 */
declare function GetEventDamage(): number;

/**
 * 伤害来源
 */
declare function GetEventDamageSource(): unit;

/**
 * EVENT_UNIT_DEATH
 */
/**
 * EVENT_UNIT_DECAY
 */
/**
 * Use the GetDyingUnit and GetDecayingUnit funcs above
 */
/**
 * EVENT_UNIT_DETECTED
 */

/**
 * EVENT_UNIT_DETECTED
 */
/**
 * 事件检测的玩家
 */
declare function GetEventDetectingPlayer(): player;

/**
 * 特定玩家事件
 */
declare function TriggerRegisterFilterUnitEvent(whichTrigger: trigger, whichUnit: unit, whichEvent: unitevent, filter: boolexpr): event;

/**
 * EVENT_UNIT_ACQUIRED_TARGET
 */

/**
 * EVENT_UNIT_TARGET_IN_RANGE
 */
/**
 * 目标单位
 */
declare function GetEventTargetUnit(): unit;

/**
 * EVENT_UNIT_ATTACKED
 */
/**
 * Use GetAttacker from the Player Unit Event API Below...
 */
/**
 * EVENT_UNIT_RESCUEDED
 */
/**
 * Use GetRescuer from the Player Unit Event API Below...
 */
/**
 * EVENT_UNIT_CONSTRUCT_CANCEL
 */
/**
 * EVENT_UNIT_CONSTRUCT_FINISH
 */
/**
 * See the Player Unit Construction Event API above for event info funcs
 */
/**
 * EVENT_UNIT_TRAIN_START
 */
/**
 * EVENT_UNIT_TRAIN_CANCELLED
 */
/**
 * EVENT_UNIT_TRAIN_FINISH
 */
/**
 * See the Player Unit Training Event API above for event info funcs
 */
/**
 * EVENT_UNIT_SELL
 */
/**
 * See the Player Unit Sell Event API above for event info funcs
 */
/**
 * EVENT_UNIT_DROP_ITEM
 */
/**
 * EVENT_UNIT_PICKUP_ITEM
 */
/**
 * EVENT_UNIT_USE_ITEM
 */
/**
 * See the Player Unit/Item manipulation Event API above for event info funcs
 */
/**
 * EVENT_UNIT_ISSUED_ORDER
 */
/**
 * EVENT_UNIT_ISSUED_POINT_ORDER
 */
/**
 * EVENT_UNIT_ISSUED_TARGET_ORDER
 */

/**
 * See the Player Unit Order Event API above for event info funcs
 */
/**
 * 范围内玩家事件
 */
declare function TriggerRegisterUnitInRange(whichTrigger: trigger, whichUnit: unit, range: number, filter: boolexpr): event;

/**
 * 添加触发器限制条件
 * @deprecated see AddAction 推荐在动作里使用if判断条件
 */
declare function TriggerAddCondition(whichTrigger: trigger, condition: boolexpr): triggercondition;

/**
 * 移除触发器限制条件
 */
declare function TriggerRemoveCondition(whichTrigger: trigger, whichCondition: triggercondition): void;

/**
 * 清空触发器限制条件
 */
declare function TriggerClearConditions(whichTrigger: trigger): void;

/**
 * 添加触发器动作
 */
declare function TriggerAddAction(whichTrigger: trigger, actionFunc: () => void): triggeraction;

/**
 * 移除触发器动作
 */
declare function TriggerRemoveAction(whichTrigger: trigger, whichAction: triggeraction): void;

/**
 * 清空触发器动作
 */
declare function TriggerClearActions(whichTrigger: trigger): void;

/**
 * 等待
 * @deprecated
 */
declare function TriggerSleepAction(timeout: number): void;

/**
 * @deprecated
 * @param s
 * @param offset
 * @constructor
 */
declare function TriggerWaitForSound(s: sound, offset: number): void;

/**
 * 触发器条件成立
 */
declare function TriggerEvaluate(whichTrigger: trigger): boolean;

/**
 * 运行触发器 (忽略条件)
 */
declare function TriggerExecute(whichTrigger: trigger): void;

declare function TriggerExecuteWait(whichTrigger: trigger): void;

declare function TriggerSyncStart(): void;

/**
 * @deprecated
 */
declare function TriggerSyncReady(): void;

//============================================================================
/**
 * Widget API
 */
/**
 * Widget API
 */
declare function GetWidgetLife(whichWidget: widget): number;

declare function SetWidgetLife(whichWidget: widget, newLife: number): void;

declare function GetWidgetX(whichWidget: widget): number;

declare function GetWidgetY(whichWidget: widget): number;

declare function GetTriggerWidget(): widget;

//============================================================================
/**
 * Destructable Object API
 */

/**
 * Facing arguments are specified in degrees
 */
/**
 * Facing arguments are specified in degrees
 */
declare function CreateDestructable(objectid: number | string, x: number, y: number, face: number, scale: number, variation: number): destructable;

/**
 * 新建可破坏物 [R]
 */
declare function CreateDestructableZ(objectid: number | string, x: number, y: number, z: number, face: number, scale: number, variation: number): destructable;

declare function CreateDeadDestructable(objectid: number | string, x: number, y: number, face: number, scale: number, variation: number): destructable;

/**
 * 新建可破坏物(死亡的) [R]
 */
declare function CreateDeadDestructableZ(objectid: number | string, x: number, y: number, z: number, face: number, scale: number, variation: number): destructable;

/**
 * 删除 可毁坏物
 */
declare function RemoveDestructable(d: destructable): void;

/**
 * 杀死 可毁坏物
 */
declare function KillDestructable(d: destructable): void;

declare function SetDestructableInvulnerable(d: destructable, flag: boolean): void;

declare function IsDestructableInvulnerable(d: destructable): boolean;

declare function EnumDestructablesInRect(r: rect, filter: boolexpr, actionFunc: () => void): void;

/**
 * 建筑的类型
 */
declare function GetDestructableTypeId(d: destructable): number;

/**
 * 可破坏物所在X轴坐标 [R]
 */
declare function GetDestructableX(d: destructable): number;

/**
 * 可破坏物所在Y轴坐标 [R]
 */
declare function GetDestructableY(d: destructable): number;

/**
 * 设置 可毁坏物 生命 (值)
 */
declare function SetDestructableLife(d: destructable, life: number): void;

/**
 * 生命值 (可毁坏物)
 */
declare function GetDestructableLife(d: destructable): number;

//设置可破坏物的最大生命值
declare function SetDestructableMaxLife(d: destructable, max: number): void;

/**
 * 最大生命值 (可毁坏物)
 */
declare function GetDestructableMaxLife(d: destructable): number;

/**
 * 复活 可毁坏物
 */
declare function DestructableRestoreLife(d: destructable, life: number, birth: boolean): void;

//队列可破坏物的动画
declare function QueueDestructableAnimation(d: destructable, whichAnimation: string): void;

//设置可破坏物的动画
declare function SetDestructableAnimation(d: destructable, whichAnimation: string): void;

/**
 * 改变可破坏物动画播放速度 [R]
 */
declare function SetDestructableAnimationSpeed(d: destructable, speedFactor: number): void;

/**
 * 显示/隐藏 [R]
 */
declare function ShowDestructable(d: destructable, flag: boolean): void;

/**
 * 闭塞高度 (可毁坏物)
 */
declare function GetDestructableOccluderHeight(d: destructable): number;

/**
 * 设置闭塞高度
 */
declare function SetDestructableOccluderHeight(d: destructable, height: number): void;

/**
 * 可毁坏物的名字
 */
declare function GetDestructableName(d: destructable): string;

/**
 * 获取触发可破坏物
 */
declare function GetTriggerDestructable(): destructable;

//============================================================================
/**
 * Item API
 */
/**
 * 创建
 */
declare function CreateItem(itemid: number | string, x: number, y: number): item;

/**
 * 删除物品
 */
declare function RemoveItem(whichItem: item): void;

/**
 * 物品的所有者
 */
declare function GetItemPlayer(whichItem: item): player;

/**
 * 物品的类别
 */
declare function GetItemTypeId(i: item): number;

/**
 * 物品的X轴坐标 [R]
 */
declare function GetItemX(i: item): number;

/**
 * 物品的Y轴坐标 [R]
 */
declare function GetItemY(i: item): number;

/**
 * 移动物品到坐标(立即)(指定坐标) [R]
 */
declare function SetItemPosition(i: item, x: number, y: number): void;

/**
 * 设置物品是否死亡时掉落
 */
declare function SetItemDropOnDeath(whichItem: item, flag: boolean): void;

/**
 * 设置物品可以丢弃
 */
declare function SetItemDroppable(i: item, flag: boolean): void;

/**
 * 设置物品能否变卖
 */
declare function SetItemPawnable(i: item, flag: boolean): void;

/**
 * 设置物品所属
 */
declare function SetItemPlayer(whichItem: item, whichPlayer: player, changeColor: boolean): void;

/**
 * 设置物品是否无敌的
 */
declare function SetItemInvulnerable(whichItem: item, flag: boolean): void;

/**
 * 物品是无敌的
 */
declare function IsItemInvulnerable(whichItem: item): boolean;

/**
 * 显示/隐藏 [R]
 */
declare function SetItemVisible(whichItem: item, show: boolean): void;

/**
 * 物品可见 [R]
 */
declare function IsItemVisible(whichItem: item): boolean;

/**
 * 物品被持有
 */
declare function IsItemOwned(whichItem: item): boolean;

/**
 * 物品是拾取时自动使用的 [R]
 */
declare function IsItemPowerup(whichItem: item): boolean;

/**
 * 物品可被市场随机出售 [R]
 */
declare function IsItemSellable(whichItem: item): boolean;

/**
 * 物品可被抵押 [R]
 */
declare function IsItemPawnable(whichItem: item): boolean;

/**
 * 物品可以充能
 */
declare function IsItemIdPowerup(itemid: number | string): boolean;

/**
 * 物品可以销售
 */
declare function IsItemIdSellable(itemid: number | string): boolean;

/**
 * 物品可以抵押
 */
declare function IsItemIdPawnable(itemid: number | string): boolean;

/**
 * 选取 区域内 所有物品在 做动作 r = 区域 ， filter = 条件 ， actionFunc = 动作
 */
declare function EnumItemsInRect(r: rect, filter: boolexpr, actionFunc: () => void): void;

/**
 * 物品等级
 */
declare function GetItemLevel(whichItem: item): number;

/**
 * 获取物品类型
 */
declare function GetItemType(whichItem: item): itemtype;

/**
 * 设置重生神符的产生单位类型
 */
declare function SetItemDropID(whichItem: item, unitid: number | string): void;

/**
 * 物品名
 */
declare function GetItemName(whichItem: item): string;

/**
 * 物品的数量
 */
declare function GetItemCharges(whichItem: item): number;

/**
 * 设置物品数量[使用次数]
 */
declare function SetItemCharges(whichItem: item, charges: number): void;

/**
 * 物品自定义值
 */
declare function GetItemUserData(whichItem: item): number;

/**
 * 设置物品自定义数据
 */
declare function SetItemUserData(whichItem: item, data: number): void;

//============================================================================
/**
 * Unit API
 */

/**
 * Facing arguments are specified in degrees
 */
/**
 * 新建单位(指定坐标) [R]
 */
declare function CreateUnit(id: player, unitid: number | string, x: number, y: number, face: number): unit;

/**
 * 新建单位(指定坐标) [R]
 */
declare function CreateUnitByName(whichPlayer: player, unitname: string, x: number, y: number, face: number): unit;

/**
 * 新建单位(指定点) [R]
 */
declare function CreateUnitAtLoc(id: player, unitid: number | string, whichLocation: location, face: number): unit;

/**
 * 新建单位(指定点) [R]
 */
declare function CreateUnitAtLocByName(id: player, unitname: string, whichLocation: location, face: number): unit;

/**
 * 新建尸体 [R]
 */
declare function CreateCorpse(whichPlayer: player, unitid: number | string, x: number, y: number, face: number): unit;

/**
 * 杀死单位
 */
declare function KillUnit(whichUnit: unit): void;

/**
 * 删除单位
 */
declare function RemoveUnit(whichUnit: unit): void;

/**
 * 显示/隐藏 [R]
 */
declare function ShowUnit(whichUnit: unit, show: boolean): void;

/**
 * 设置单位属性 [R]
 */
declare function SetUnitState(whichUnit: unit, whichUnitState: unitstate, newVal: number): void;

/**
 * 设置X坐标 [R]
 * （不会停止当前 单位命令等行为）
 * @deprecated SetUnitPosition (单独分开设置坐标一个轴 可能会触发进入新x 旧y所在的区域事件 还是同时设置xy稳定)
 */
declare function SetUnitX(whichUnit: unit, newX: number): void;

/**
 * 设置Y坐标 [R]
 * （不会停止当前 单位命令等行为）
 * @deprecated see SetUnitPosition (单独分开设置坐标一个轴 可能会触发进入新y 旧x所在的区域事件 还是同时设置xy稳定)
 */
declare function SetUnitY(whichUnit: unit, newY: number): void;

/**
 * 移动单位(立即)(指定坐标) [R]
 * (会停止当前命令 如果在技能释放中 可能会造成技能不进入cd)
 */
declare function SetUnitPosition(whichUnit: unit, newX: number, newY: number): void;

/**
 * 移动单位 (立刻)
 */
declare function SetUnitPositionLoc(whichUnit: unit, whichLocation: location): void;

/**
 * 设置单位面向角度 [R]
 */
declare function SetUnitFacing(whichUnit: unit, facingAngle: number): void;

/**
 * 设置单位面对角度
 */
declare function SetUnitFacingTimed(whichUnit: unit, facingAngle: number, duration: number): void;

/**
 * 设置单位移动速度
 */
declare function SetUnitMoveSpeed(whichUnit: unit, newSpeed: number): void;

//设定单位飞行高度
declare function SetUnitFlyHeight(whichUnit: unit, newHeight: number, rate: number): void;

//设定单位转向速度
declare function SetUnitTurnSpeed(whichUnit: unit, newTurnSpeed: number): void;

/**
 * 改变单位转向角度(弧度制) [R]
 */
declare function SetUnitPropWindow(whichUnit: unit, newPropWindowAngle: number): void;

//设置感知敌人距离
declare function SetUnitAcquireRange(whichUnit: unit, newAcquireRange: number): void;

/**
 * 锁定指定单位的警戒点 [R]
 */
declare function SetUnitCreepGuard(whichUnit: unit, creepGuard: boolean): void;

/**
 * 单位射程 (当前)
 */
declare function GetUnitAcquireRange(whichUnit: unit): number;

/**
 * 转向速度 (当前)
 */
declare function GetUnitTurnSpeed(whichUnit: unit): number;

/**
 * 当前转向角度(弧度制) [R]
 */
declare function GetUnitPropWindow(whichUnit: unit): number;

/**
 * 飞行高度 (当前)
 */
declare function GetUnitFlyHeight(whichUnit: unit): number;

/**
 * 单位射程 (默认)
 */
declare function GetUnitDefaultAcquireRange(whichUnit: unit): number;

/**
 * 转向速度 (默认)
 */
declare function GetUnitDefaultTurnSpeed(whichUnit: unit): number;

declare function GetUnitDefaultPropWindow(whichUnit: unit): number;

/**
 * 飞行高度 (默认)
 */
declare function GetUnitDefaultFlyHeight(whichUnit: unit): number;

/**
 * 改变单位所有者
 */
declare function SetUnitOwner(whichUnit: unit, whichPlayer: player, changeColor: boolean): void;

/**
 * 改变单位颜色
 */
declare function SetUnitColor(whichUnit: unit, whichColor: playercolor): void;

/**
 * 改变单位尺寸(按倍数) [R]
 */
declare function SetUnitScale(whichUnit: unit, scaleX: number, scaleY: number, scaleZ: number): void;

/**
 * 改变单位动画播放速度(按倍数) [R]
 */
declare function SetUnitTimeScale(whichUnit: unit, timeScale: number): void;

declare function SetUnitBlendTime(whichUnit: unit, blendTime: number): void;

/**
 * 改变单位的颜色(RGB:0-255) [R]
 */
declare function SetUnitVertexColor(whichUnit: unit, red: number, green: number, blue: number, alpha: number): void;

//队列单位动作
declare function QueueUnitAnimation(whichUnit: unit, whichAnimation: string): void;

/**
 * 播放单位动作
 */
declare function SetUnitAnimation(whichUnit: unit, whichAnimation: string): void;

/**
 * 播放单位指定序号动动作 [R]
 */
declare function SetUnitAnimationByIndex(whichUnit: unit, whichAnimation: number): void;

/**
 * 播放单位动作 (指定概率)
 */
declare function SetUnitAnimationWithRarity(whichUnit: unit, whichAnimation: string, rarity: raritycontrol): void;

/**
 * 添加/删除 单位动画附加名 [R]
 */
declare function AddUnitAnimationProperties(whichUnit: unit, animProperties: string, add: boolean): void;

/**
 * 锁定单位脸面对方向
 */
declare function SetUnitLookAt(whichUnit: unit, whichBone: string, lookAtTarget: unit, offsetX: number, offsetY: number, offsetZ: number): void;

/**
 * 重置单位面对方向
 */
declare function ResetUnitLookAt(whichUnit: unit): void;

/**
 * 设置可否营救(对玩家) [R]
 */
declare function SetUnitRescuable(whichUnit: unit, byWhichPlayer: player, flag: boolean): void;

/**
 * 设置营救单位的营救距离
 */
declare function SetUnitRescueRange(whichUnit: unit, range: number): void;

/**
 * 设置英雄力量 [R]
 */
declare function SetHeroStr(whichHero: unit, newStr: number, permanent: boolean): void;

/**
 * 设置英雄敏捷 [R]
 */
declare function SetHeroAgi(whichHero: unit, newAgi: number, permanent: boolean): void;

/**
 * 设置英雄智力 [R]
 */
declare function SetHeroInt(whichHero: unit, newInt: number, permanent: boolean): void;

/**
 * 英雄力量 [R]
 */
declare function GetHeroStr(whichHero: unit, includeBonuses: boolean): number;

/**
 * 英雄敏捷 [R]
 */
declare function GetHeroAgi(whichHero: unit, includeBonuses: boolean): number;

/**
 * 英雄智力 [R]
 */
declare function GetHeroInt(whichHero: unit, includeBonuses: boolean): number;

/**
 * 降低等级 [R]
 */
declare function UnitStripHeroLevel(whichHero: unit, howManyLevels: number): boolean;

/**
 * 英雄的经验值
 */
declare function GetHeroXP(whichHero: unit): number;

/**
 * 设置英雄经验值
 */
declare function SetHeroXP(whichHero: unit, newXpVal: number, showEyeCandy: boolean): void;

/**
 * 未用完的技能点数
 */
declare function GetHeroSkillPoints(whichHero: unit): number;

/**
 * 添加剩余技能点 [R]
 */
declare function UnitModifySkillPoints(whichHero: unit, skillPointDelta: number): boolean;

/**
 * 增加经验值 [R]
 */
declare function AddHeroXP(whichHero: unit, xpToAdd: number, showEyeCandy: boolean): void;

/**
 * 设置英雄等级
 */
declare function SetHeroLevel(whichHero: unit, level: number, showEyeCandy: boolean): void;

/**
 * 英雄等级
 */
declare function GetHeroLevel(whichHero: unit): number;

/**
 * 单位等级
 */
declare function GetUnitLevel(whichUnit: unit): number;

/**
 * 英雄的姓名
 */
declare function GetHeroProperName(whichHero: unit): string;

/**
 * 允许/禁止经验获取 [R]
 */
declare function SuspendHeroXP(whichHero: unit, flag: boolean): void;

/**
 * 英雄获得经验值
 */
declare function IsSuspendedXP(whichHero: unit): boolean;

/**
 * 英雄学习技能
 */
declare function SelectHeroSkill(whichHero: unit, abilcode: number | string): void;

/**
 * 单位技能等级 [R]
 */
declare function GetUnitAbilityLevel(whichUnit: unit, abilcode: number | string): number;

/**
 * 降低技能等级 [R]
 */
declare function DecUnitAbilityLevel(whichUnit: unit, abilcode: number | string): number;

/**
 * 提升技能等级 [R]
 */
declare function IncUnitAbilityLevel(whichUnit: unit, abilcode: number | string): number;

/**
 * 设置技能等级 [R]
 */
declare function SetUnitAbilityLevel(whichUnit: unit, abilcode: number | string, level: number): number;

/**
 * 立即复活(指定坐标) [R]
 */
declare function ReviveHero(whichHero: unit, x: number, y: number, doEyecandy: boolean): boolean;

/**
 * 复活英雄（立即）
 */
declare function ReviveHeroLoc(whichHero: unit, loc: location, doEyecandy: boolean): boolean;

declare function SetUnitExploded(whichUnit: unit, exploded: boolean): void;

/**
 * 设置单位 无敌/可攻击
 */
declare function SetUnitInvulnerable(whichUnit: unit, flag: boolean): void;

/**
 * 暂停/恢复 [R]
 */
declare function PauseUnit(whichUnit: unit, flag: boolean): void;

declare function IsUnitPaused(whichHero: unit): boolean;

/**
 * 设置碰撞 打开/关闭
 */
declare function SetUnitPathing(whichUnit: unit, flag: boolean): void;

/**
 * 清除所有选定
 */
declare function ClearSelection(): void;

declare function SelectUnit(whichUnit: unit, flag: boolean): void;

/**
 * 单位的 附加值
 */
declare function GetUnitPointValue(whichUnit: unit): number;

/**
 * 单位-类型的 附加值
 */
declare function GetUnitPointValueByType(unitType: number): number;

//native        SetUnitPointValueByType takes integer unitType, integer newPointValue returns nothing
/**
 * 给予物品 [R]
 */
declare function UnitAddItem(whichUnit: unit, whichItem: item): boolean;

declare function UnitAddItemById(whichUnit: unit, itemid: number | string): item;

/**
 * 新建物品到指定物品栏 [R]
 */
declare function UnitAddItemToSlotById(whichUnit: unit, itemid: number | string, itemSlot: number): boolean;

declare function UnitRemoveItem(whichUnit: unit, whichItem: item): void;

declare function UnitRemoveItemFromSlot(whichUnit: unit, itemSlot: number): item;

/**
 * 英雄已有物品
 */
declare function UnitHasItem(whichUnit: unit, whichItem: item): boolean;

/**
 * 单位持有物品
 */
declare function UnitItemInSlot(whichUnit: unit, itemSlot: number): item;

declare function UnitInventorySize(whichUnit: unit): number;

/**
 * 发布丢弃物品命令(指定坐标) [R]
 * (可使用 SetItemPosition或UnitRemoveItem 立即从背包丢弃物品 到地形上 以防止玩家通过其他命令中断了此丢弃物品的命令)
 */
declare function UnitDropItemPoint(whichUnit: unit, whichItem: item, x: number, y: number): boolean;

/**
 * 移动物品到物品栏 [R]
 */
declare function UnitDropItemSlot(whichUnit: unit, whichItem: item, slot: number): boolean;

declare function UnitDropItemTarget(whichUnit: unit, whichItem: item, target: widget): boolean;

/**
 * 使用物品
 */
declare function UnitUseItem(whichUnit: unit, whichItem: item): boolean;

/**
 * 使用物品(指定坐标)
 */
declare function UnitUseItemPoint(whichUnit: unit, whichItem: item, x: number, y: number): boolean;

/**
 * 对单位使用物品
 */
declare function UnitUseItemTarget(whichUnit: unit, whichItem: item, target: widget): boolean;

/**
 * 单位所在X轴坐标 [R]
 */
declare function GetUnitX(whichUnit: unit): number;

/**
 * 单位所在Y轴坐标 [R]
 */
declare function GetUnitY(whichUnit: unit): number;

/**
 * 单位的位置
 */
declare function GetUnitLoc(whichUnit: unit): location;

/**
 * 单位面向角度
 */
declare function GetUnitFacing(whichUnit: unit): number;

/**
 * 单位移动速度 (当前)
 */
declare function GetUnitMoveSpeed(whichUnit: unit): number;

/**
 * 单位移动速度 (默认)
 */
declare function GetUnitDefaultMoveSpeed(whichUnit: unit): number;

/**
 * 属性 [R]
 */
declare function GetUnitState(whichUnit: unit, whichUnitState: unitstate): number;

/**
 * 单位的所有者
 */
declare function GetOwningPlayer(whichUnit: unit): player;

/**
 * 单位的类型
 */
declare function GetUnitTypeId(whichUnit: unit): number;

/**
 * 单位的种族
 */
declare function GetUnitRace(whichUnit: unit): race;

/**
 * 单位名字
 */
declare function GetUnitName(whichUnit: unit): string;

/**
 * 单位使用人口
 */
declare function GetUnitFoodUsed(whichUnit: unit): number;

/**
 * 单位提供人口数量
 */
declare function GetUnitFoodMade(whichUnit: unit): number;

/**
 * 单位-类型 提供的人口
 */
declare function GetFoodMade(unitid: number | string): number;

/**
 * 单位-类型 使用的人口
 */
declare function GetFoodUsed(unitid: number | string): number;

/**
 * 允许/禁止 人口占用 [R]
 */
declare function SetUnitUseFood(whichUnit: unit, useFood: boolean): void;

/**
 * 聚集点
 */
declare function GetUnitRallyPoint(whichUnit: unit): location;

/**
 * 拥有源聚集点单位
 */
declare function GetUnitRallyUnit(whichUnit: unit): unit;

/**
 * 单位 聚集点
 */
declare function GetUnitRallyDestructable(whichUnit: unit): destructable;

/**
 * 单位在 单位组
 */
declare function IsUnitInGroup(whichUnit: unit, whichGroup: group): boolean;

/**
 * 是玩家组里玩家的单位
 */
declare function IsUnitInForce(whichUnit: unit, whichForce: force): boolean;

/**
 * 是玩家的单位
 */
declare function IsUnitOwnedByPlayer(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位所属玩家的同盟玩家
 */
declare function IsUnitAlly(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位所属玩家的敌对玩家
 */
declare function IsUnitEnemy(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位对于玩家可见
 */
declare function IsUnitVisible(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 被检测到
 */
declare function IsUnitDetected(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位对于玩家不可见
 */
declare function IsUnitInvisible(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位被战争迷雾遮挡
 */
declare function IsUnitFogged(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位被黑色阴影遮挡
 */
declare function IsUnitMasked(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 玩家已选定单位
 */
declare function IsUnitSelected(whichUnit: unit, whichPlayer: player): boolean;

/**
 * 单位种族检查
 */
declare function IsUnitRace(whichUnit: unit, whichRace: race): boolean;

/**
 * 检查单位 分类
 */
declare function IsUnitType(whichUnit: unit, whichUnitType: unittype): boolean;

/**
 * 是单位
 */
declare function IsUnit(whichUnit: unit, whichSpecifiedUnit: unit): boolean;

/**
 * 在指定单位范围内 [R]
 */
declare function IsUnitInRange(whichUnit: unit, otherUnit: unit, distance: number): boolean;

/**
 * 在指定坐标范围内 [R]
 */
declare function IsUnitInRangeXY(whichUnit: unit, x: number, y: number, distance: number): boolean;

/**
 * 在指定点范围内 [R]
 */
declare function IsUnitInRangeLoc(whichUnit: unit, whichLocation: location, distance: number): boolean;

/**
 * 是隐藏单位
 */
declare function IsUnitHidden(whichUnit: unit): boolean;

//是镜像单位
declare function IsUnitIllusion(whichUnit: unit): boolean;

/**
 * 是运输单元
 */
declare function IsUnitInTransport(whichUnit: unit, whichTransport: unit): boolean;

//单位加载
declare function IsUnitLoaded(whichUnit: unit): boolean;

/**
 * 单位类型是英雄单位
 */
declare function IsHeroUnitId(unitid: number | string): boolean;

/**
 * 检查单位-类型 分类
 */
declare function IsUnitIdType(unitid: number | string, whichUnitType: unittype): boolean;

/**
 * 共享视野 [R]
 */
declare function UnitShareVision(whichUnit: unit, whichPlayer: player, share: boolean): void;

/**
 * 暂停尸体腐烂 [R]
 */
declare function UnitSuspendDecay(whichUnit: unit, suspend: boolean): void;

/**
 * 添加类别 [R]
 */
declare function UnitAddType(whichUnit: unit, whichUnitType: unittype): boolean;

/**
 * 删除类别 [R]
 */
declare function UnitRemoveType(whichUnit: unit, whichUnitType: unittype): boolean;

/**
 * 添加技能 [R]
 */
declare function UnitAddAbility(whichUnit: unit, abilityid: number | string): boolean;

/**
 * 删除技能 [R]
 */
declare function UnitRemoveAbility(whichUnit: unit, abilityid: number | string): boolean;

/**
 * 设置技能永久性 [R]
 */
declare function UnitMakeAbilityPermanent(whichUnit: unit, permanent: boolean, abilityid: number | string): boolean;

/**
 * 删除魔法效果(指定极性) [R]
 */
declare function UnitRemoveBuffs(whichUnit: unit, removePositive: boolean, removeNegative: boolean): void;

/**
 * 删除魔法效果(详细类别) [R]
 */
declare function UnitRemoveBuffsEx(whichUnit: unit, removePositive: boolean, removeNegative: boolean, magic: boolean, physical: boolean, timedLife: boolean, aura: boolean, autoDispel: boolean): void;

/**
 * 拥有Buff [R]
 */
declare function UnitHasBuffsEx(whichUnit: unit, removePositive: boolean, removeNegative: boolean, magic: boolean, physical: boolean, timedLife: boolean, aura: boolean, autoDispel: boolean): boolean;

/**
 * 拥有Buff数量 [R]
 */
declare function UnitCountBuffsEx(whichUnit: unit, removePositive: boolean, removeNegative: boolean, magic: boolean, physical: boolean, timedLife: boolean, aura: boolean, autoDispel: boolean): number;

/**
 * 单位添加睡眠
 */
declare function UnitAddSleep(whichUnit: unit, add: boolean): void;

/**
 * 单位可以睡眠
 */
declare function UnitCanSleep(whichUnit: unit): boolean;

/**
 * 设置单位睡眠(无论何时)
 */
declare function UnitAddSleepPerm(whichUnit: unit, add: boolean): void;

/**
 * 单位在睡觉
 */
declare function UnitCanSleepPerm(whichUnit: unit): boolean;

/**
 * 单位在睡眠
 */
declare function UnitIsSleeping(whichUnit: unit): boolean;

declare function UnitWakeUp(whichUnit: unit): void;

/**
 * 设置生命周期 [R]
 */
declare function UnitApplyTimedLife(whichUnit: unit, buffid: number | string, duration: number): void;

//单位忽略报警
declare function UnitIgnoreAlarm(whichUnit: unit, flag: boolean): boolean;

//单位忽略报警开关
declare function UnitIgnoreAlarmToggled(whichUnit: unit): boolean;

/**
 * 重设单位技能Cooldown
 */
declare function UnitResetCooldown(whichUnit: unit): void;

/**
 * 设置建筑物 建筑升级比
 */
declare function UnitSetConstructionProgress(whichUnit: unit, constructionPercentage: number): void;

/**
 * 设置建筑物 科技升级比
 */
declare function UnitSetUpgradeProgress(whichUnit: unit, upgradePercentage: number): void;

/**
 * 暂停/恢复生命周期 [R]
 */
declare function UnitPauseTimedLife(whichUnit: unit, flag: boolean): void;

/**
 * 设置单位小地图图标
 */
declare function UnitSetUsesAltIcon(whichUnit: unit, flag: boolean): void;

/**
 * 伤害区域 [R]
 */
declare function UnitDamagePoint(whichUnit: unit, delay: number, radius: number, x: number, y: number, amount: number, attack: boolean, ranged: boolean, attackType: attacktype, damageType: damagetype, weaponType: weapontype): boolean;

/**
 * 伤害目标 [R]
 */
declare function UnitDamageTarget(whichUnit: unit, target: widget, amount: number, attack: boolean, ranged: boolean, attackType: attacktype, damageType: damagetype, weaponType: weapontype): boolean;

/**
 * 给单位发送命令到 没有目标
 */
declare function IssueImmediateOrder(whichUnit: unit, order: string): boolean;

/**
 * 发布命令(无目标)(ID)
 */
declare function IssueImmediateOrderById(whichUnit: unit, order: number): boolean;

/**
 * 发布命令(指定坐标)
 */
declare function IssuePointOrder(whichUnit: unit, order: string, x: number, y: number): boolean;

/**
 * 给单位发送命令到 点
 */
declare function IssuePointOrderLoc(whichUnit: unit, order: string, whichLocation: location): boolean;

/**
 * 发布命令(指定坐标)(ID)
 */
declare function IssuePointOrderById(whichUnit: unit, order: number, x: number, y: number): boolean;

/**
 * 发布命令(指定点)(ID)
 */
declare function IssuePointOrderByIdLoc(whichUnit: unit, order: number, whichLocation: location): boolean;

/**
 * 给单位发送命令到 单位
 */
declare function IssueTargetOrder(whichUnit: unit, order: string, targetWidget: widget): boolean;

/**
 * 发布命令(指定单位)(ID)
 */
declare function IssueTargetOrderById(whichUnit: unit, order: number, targetWidget: widget): boolean;

/**
 * 发布命令(指定坐标)
 */
declare function IssueInstantPointOrder(whichUnit: unit, order: string, x: number, y: number, instantTargetWidget: widget): boolean;

/**
 * 发布命令(指定点)(ID)
 */
declare function IssueInstantPointOrderById(whichUnit: unit, order: number, x: number, y: number, instantTargetWidget: widget): boolean;

/**
 * 发布命令(指定单位)
 */
declare function IssueInstantTargetOrder(whichUnit: unit, order: string, targetWidget: widget, instantTargetWidget: widget): boolean;

/**
 * 发布命令(指定单位)(ID)
 */
declare function IssueInstantTargetOrderById(whichUnit: unit, order: number, targetWidget: widget, instantTargetWidget: widget): boolean;

/**
 * 发布建造命令(指定坐标) [R]
 */
declare function IssueBuildOrder(whichPeon: unit, unitToBuild: string, x: number, y: number): boolean;

/**
 * 发布建造命令(指定坐标) [R]
 */
declare function IssueBuildOrderById(whichPeon: unit, unitid: number | string, x: number, y: number): boolean;

/**
 * 发布中介命令(无目标)
 */
declare function IssueNeutralImmediateOrder(forWhichPlayer: player, neutralStructure: unit, unitToBuild: string): boolean;

/**
 * 发布中介命令(无目标)(ID)
 */
declare function IssueNeutralImmediateOrderById(forWhichPlayer: player, neutralStructure: unit, unitid: number | string): boolean;

/**
 * 发布中介命令(指定坐标)
 */
declare function IssueNeutralPointOrder(forWhichPlayer: player, neutralStructure: unit, unitToBuild: string, x: number, y: number): boolean;

/**
 * 发布中介命令(指定坐标)(ID)
 */
declare function IssueNeutralPointOrderById(forWhichPlayer: player, neutralStructure: unit, unitid: number | string, x: number, y: number): boolean;

/**
 * 发布中介命令(指定单位)
 */
declare function IssueNeutralTargetOrder(forWhichPlayer: player, neutralStructure: unit, unitToBuild: string, target: widget): boolean;

/**
 * 发布中介命令(指定单位)(ID)
 */
declare function IssueNeutralTargetOrderById(forWhichPlayer: player, neutralStructure: unit, unitid: number | string, target: widget): boolean;

/**
 * 单位当前的命令
 */
declare function GetUnitCurrentOrder(whichUnit: unit): number;

/**
 * 设置金矿资源
 */
declare function SetResourceAmount(whichUnit: unit, amount: number): void;

/**
 * 添加金矿资源
 */
declare function AddResourceAmount(whichUnit: unit, amount: number): void;

/**
 * 黄金资源数量
 */
declare function GetResourceAmount(whichUnit: unit): number;

/**
 * 传送门目的地X坐标
 */
declare function WaygateGetDestinationX(waygate: unit): number;

/**
 * 传送门目的地Y坐标
 */
declare function WaygateGetDestinationY(waygate: unit): number;

/**
 * 设置传送门目的坐标 [R]
 */
declare function WaygateSetDestination(waygate: unit, x: number, y: number): void;

//传送门激活
declare function WaygateActivate(waygate: unit, activate: boolean): void;

//传送门状态
declare function WaygateIsActive(waygate: unit): boolean;

/**
 * 增加 物品-类型 (到所有商店)
 */
declare function AddItemToAllStock(itemid: number | string, currentStock: number, stockMax: number): void;

/**
 * 增加 物品-类型 (到商店)
 */
declare function AddItemToStock(whichUnit: unit, itemid: number | string, currentStock: number, stockMax: number): void;

/**
 * 增加 单位-类型 (到所有商店)
 */
declare function AddUnitToAllStock(unitid: number | string, currentStock: number, stockMax: number): void;

/**
 * 增加 单位-类型 (到商店)
 */
declare function AddUnitToStock(whichUnit: unit, unitid: number | string, currentStock: number, stockMax: number): void;

/**
 * 删除 物品-类型 (从所有商店)
 */
declare function RemoveItemFromAllStock(itemid: number | string): void;

/**
 * 删除 物品-类型 (从商店)
 */
declare function RemoveItemFromStock(whichUnit: unit, itemid: number | string): void;

/**
 * 删除 单位-类型 (从所有商店)
 */
declare function RemoveUnitFromAllStock(unitid: number | string): void;

/**
 * 删除 单位-类型 (从商店)
 */
declare function RemoveUnitFromStock(whichUnit: unit, unitid: number | string): void;

/**
 * 限制物品的位置 (从所有商店)
 */
declare function SetAllItemTypeSlots(slots: number): void;

/**
 * 限制单位的位置 (从所有商店)
 */
declare function SetAllUnitTypeSlots(slots: number): void;

/**
 * 限制物品的位置 (从商店)
 */
declare function SetItemTypeSlots(whichUnit: unit, slots: number): void;

/**
 * 限制单位的位置 (从商店)
 */
declare function SetUnitTypeSlots(whichUnit: unit, slots: number): void;

/**
 * 单位自定义值
 */
declare function GetUnitUserData(whichUnit: unit): number;

/**
 * 设置单位自定义数据
 */
declare function SetUnitUserData(whichUnit: unit, data: number): void;

//============================================================================
/**
 * Player API
 */
/**
 * 玩家(下标0)
 */
declare function Player(number: number): player;

/**
 * 本地玩家 [R]
 */
declare function GetLocalPlayer(): player;

/**
 * 玩家是玩家的同盟
 */
declare function IsPlayerAlly(whichPlayer: player, otherPlayer: player): boolean;

/**
 * 玩家是玩家的敌人
 */
declare function IsPlayerEnemy(whichPlayer: player, otherPlayer: player): boolean;

/**
 * 玩家在玩家组
 */
declare function IsPlayerInForce(whichPlayer: player, whichForce: force): boolean;

/**
 * 玩家是裁判或观察者 [R]
 */
declare function IsPlayerObserver(whichPlayer: player): boolean;

/**
 * 坐标可见
 */
declare function IsVisibleToPlayer(x: number, y: number, whichPlayer: player): boolean;

/**
 * 点对于玩家可见
 */
declare function IsLocationVisibleToPlayer(whichLocation: location, whichPlayer: player): boolean;

/**
 * 坐标在迷雾中
 */
declare function IsFoggedToPlayer(x: number, y: number, whichPlayer: player): boolean;

/**
 * 点被迷雾遮挡
 */
declare function IsLocationFoggedToPlayer(whichLocation: location, whichPlayer: player): boolean;

/**
 * 坐标在黑色阴影中
 */
declare function IsMaskedToPlayer(x: number, y: number, whichPlayer: player): boolean;

/**
 * 点被黑色阴影遮挡
 */
declare function IsLocationMaskedToPlayer(whichLocation: location, whichPlayer: player): boolean;

/**
 * 玩家的种族
 */
declare function GetPlayerRace(whichPlayer: player): race;

/**
 * 玩家ID - 1 [R]
 */
declare function GetPlayerId(whichPlayer: player): number;

/**
 * 单位数量(非建筑)
 */
declare function GetPlayerUnitCount(whichPlayer: player, includeIncomplete: boolean): number;

//获取玩家特定单位数
declare function GetPlayerTypedUnitCount(whichPlayer: player, unitName: string, includeIncomplete: boolean, includeUpgrades: boolean): number;

/**
 * 获得建筑数量
 */
declare function GetPlayerStructureCount(whichPlayer: player, includeIncomplete: boolean): number;

/**
 * 获得玩家属性
 */
declare function GetPlayerState(whichPlayer: player, whichPlayerState: playerstate): number;

/**
 * 获得玩家得分
 */
declare function GetPlayerScore(whichPlayer: player, whichPlayerScore: playerscore): number;

/**
 * 玩家与玩家结盟
 */
declare function GetPlayerAlliance(sourcePlayer: player, otherPlayer: player, whichAllianceSetting: alliancetype): boolean;

//经验上限 [R]
declare function GetPlayerHandicap(whichPlayer: player): number;

//经验获得率 [R]
declare function GetPlayerHandicapXP(whichPlayer: player): number;

//玩家障碍恢复时间
declare function GetPlayerHandicapReviveTime(whichPlayer: player): number;

//玩家遭受残疾伤害
declare function GetPlayerHandicapDamage(whichPlayer: player): number;

/**
 * 设置经验上限 [R]
 */
declare function SetPlayerHandicap(whichPlayer: player, handicap: number): void;

/**
 * 设置经验获得率 [R]
 */
declare function SetPlayerHandicapXP(whichPlayer: player, handicap: number): void;

//设置玩家障碍恢复时间
declare function SetPlayerHandicapReviveTime(whichPlayer: player, handicap: number): void;

//设置玩家残障伤害
declare function SetPlayerHandicapDamage(whichPlayer: player, handicap: number): void;

//允许玩家的科技上限
declare function SetPlayerTechMaxAllowed(whichPlayer: player, techid: number | string, maximum: number): void;

/**
 * 获取允许玩家的科技上限
 * 单位默认建造数量为2147483647 */
declare function GetPlayerTechMaxAllowed(whichPlayer: player, techid: number | string): number;

/**
 * 增加科技等级
 */
declare function AddPlayerTechResearched(whichPlayer: player, techid: number | string, levels: number): void;

/**
 * 设置玩家科技等级
 */
declare function SetPlayerTechResearched(whichPlayer: player, techid: number | string, setToLevel: number): void;

/**
 * 获取玩家科技是否已经研究
 */
declare function GetPlayerTechResearched(whichPlayer: player, techid: number | string, specificonly: boolean): boolean;

/**
 * 获取玩家科技数量
 */
declare function GetPlayerTechCount(whichPlayer: player, techid: number | string, specificonly: boolean): number;

/**
 * 设置单位所属玩家
 */
declare function SetPlayerUnitsOwner(whichPlayer: player, newOwner: number): void;

/**
 * 削弱玩家
 */
declare function CripplePlayer(whichPlayer: player, toWhichPlayers: force, flag: boolean): void;

/**
 * 允许/禁用 技能 [R]
 */
declare function SetPlayerAbilityAvailable(whichPlayer: player, abilid: number | string, avail: boolean): void;

/**
 * 设置玩家属性
 */
declare function SetPlayerState(whichPlayer: player, whichPlayerState: playerstate, value: number): void;

/**
 * 踢除玩家
 */
declare function RemovePlayer(whichPlayer: player, gameResult: playergameresult): void;

/**
 * Used to store hero level data for the scorescreen
 */

/**
 * before units are moved to neutral passive in melee games
 */
/**
 * 缓存玩家数据
 */
declare function CachePlayerHeroData(whichPlayer: player): void;

//============================================================================
/**
 * Fog of War API
 */
/**
 * 设置地图迷雾(矩形区域) [R]
 */
declare function SetFogStateRect(forWhichPlayer: player, whichState: fogstate, where: rect, useSharedVision: boolean): void;

/**
 * 设置地图迷雾(圆范围) [R]
 */
declare function SetFogStateRadius(forWhichPlayer: player, whichState: fogstate, centerx: number, centerY: number, radius: number, useSharedVision: boolean): void;

/**
 * 设置地图迷雾(圆范围) [R]
 */
declare function SetFogStateRadiusLoc(forWhichPlayer: player, whichState: fogstate, center: location, radius: number, useSharedVision: boolean): void;

/**
 * 启用/禁用黑色阴影 [R]
 */
declare function FogMaskEnable(enable: boolean): void;

/**
 * 允许黑色阴影
 */
declare function IsFogMaskEnabled(): boolean;

/**
 * 启用/禁用 战争迷雾 [R]
 */
declare function FogEnable(enable: boolean): void;

/**
 * 允许战争迷雾
 */
declare function IsFogEnabled(): boolean;

/**
 * 新建可见度修正器(矩形区域) [R]
 */
declare function CreateFogModifierRect(forWhichPlayer: player, whichState: fogstate, where: rect, useSharedVision: boolean, afterUnits: boolean): fogmodifier;

/**
 * 新建可见度修正器(圆范围) [R]
 */
declare function CreateFogModifierRadius(forWhichPlayer: player, whichState: fogstate, centerx: number, centerY: number, radius: number, useSharedVision: boolean, afterUnits: boolean): fogmodifier;

/**
 * 新建可见度修正器(圆范围) [R]
 */
declare function CreateFogModifierRadiusLoc(forWhichPlayer: player, whichState: fogstate, center: location, radius: number, useSharedVision: boolean, afterUnits: boolean): fogmodifier;

/**
 * 删除可见度修正器
 */
declare function DestroyFogModifier(whichFogModifier: fogmodifier): void;

/**
 * 允许可见度修正器
 */
declare function FogModifierStart(whichFogModifier: fogmodifier): void;

/**
 * 禁止可见度修正器
 */
declare function FogModifierStop(whichFogModifier: fogmodifier): void;

//============================================================================
/**
 * Game API
 */
/**
 * 获取版本
 */
declare function VersionGet(): version;

/**
 * 版本兼容
 */
declare function VersionCompatible(whichVersion: version): boolean;

/**
 * 版本支持
 */
declare function VersionSupported(whichVersion: version): boolean;

/**
 * 最后阶段
 */
declare function EndGame(doScoreScreen: boolean): void;

/**
 * Async only!
 */
/**
 * 切换关卡 [R]
 */
declare function ChangeLevel(newLevel: string, doScoreScreen: boolean): void;

/**
 * 重启游戏
 */
declare function RestartGame(doScoreScreen: boolean): void;

/**
 * 从加载游戏
 */
declare function ReloadGame(): void;

/**
 * %%% SetCampaignMenuRace is deprecated.  It must remain to support
 */
/**
 * old maps which use it, but all new maps should use SetCampaignMenuRaceEx
 */

/**
 * old maps which use it, but all new maps should use SetCampaignMenuRaceEx
 */
/**
 * 设置战役菜单竞赛 @deprecated("这方法不建议使用,应该使用SetCampaignMenuRaceEx代替")
 */
declare function SetCampaignMenuRace(r: race): void;

/**
 * 设置战役菜单竞赛
 */
declare function SetCampaignMenuRaceEx(campaignIndex: number): void;

/**
 * 部队行动选择画面
 */
declare function ForceCampaignSelectScreen(): void;

/**
 * 加载游戏
 */
declare function LoadGame(saveFileName: string, doScoreScreen: boolean): void;

/**
 * 保存进度 [R]
 */
declare function SaveGame(saveFileName: string): void;

/**
 * 重命名保存目录
 */
declare function RenameSaveDirectory(sourceDirName: string, destDirName: string): boolean;

/**
 * 移除保存目录
 */
declare function RemoveSaveDirectory(sourceDirName: string): boolean;

/**
 * 复制保存目录
 */
declare function CopySaveGame(sourceSaveName: string, destSaveName: string): boolean;

/**
 * 游戏进度是存在的
 */
declare function SaveGameExists(saveName: string): boolean;

/**
 * 设置最大关卡保存
 */
declare function SetMaxCheckpointSaves(maxCheckpointSaves: number): void;

/**
 * 保存关卡
 */
declare function SaveGameCheckpoint(saveFileName: string, showWindow: boolean): void;

/**
 * 同步选择
 * runtime.sleep (默认为 false)
 * common.j 中包含 sleep 操作的函数有 4 个，
 * TriggerSleepAction/TriggerSyncReady/TriggerWaitForSound/SyncSelections。
 * 当此项为 false 时，lua 引擎会忽略这 4 个函数的调用，并给予运行时警告。当此项为 true 时，这 4 个函数将会得到正确的执行。
 *
 * 但请注意此项为 true 时将降低 lua 引擎的运行效率，即使你没有使用这 4 个函数。
 *
 * 这个函数内部包含了等待
 *@deprecated
 */
declare function SyncSelections(): void;

declare function SetFloatGameState(whichFloatGameState: fgamestate, value: number): void;

declare function GetFloatGameState(whichFloatGameState: fgamestate): number;

declare function SetIntegerGameState(whichIntegerGameState: igamestate, value: number): void;

declare function GetIntegerGameState(whichIntegerGameState: igamestate): number;

//============================================================================
/**
 * Campaign API
 */
/**
 * Campaign API
 */
declare function SetTutorialCleared(cleared: boolean): void;

declare function SetMissionAvailable(campaignNumber: number, missionNumber: number, available: boolean): void;

declare function SetCampaignAvailable(campaignNumber: number, available: boolean): void;

declare function SetOpCinematicAvailable(campaignNumber: number, available: boolean): void;

declare function SetEdCinematicAvailable(campaignNumber: number, available: boolean): void;

declare function GetDefaultDifficulty(): gamedifficulty;

declare function SetDefaultDifficulty(g: gamedifficulty): void;

declare function SetCustomCampaignButtonVisible(whichButton: number, visible: boolean): void;

declare function GetCustomCampaignButtonVisible(whichButton: number): boolean;

/**
 * 关闭游戏录像功能 [R]
 */
declare function DoNotSaveReplay(): void;

//============================================================================
/**
 * Dialog API
 */
/**
 * 新建对话框 [R]
 */
declare function DialogCreate(): dialog;

/**
 * 删除对话框 [R]
 */
declare function DialogDestroy(whichDialog: dialog): void;

/**
 * 清空对话框
 */
declare function DialogClear(whichDialog: dialog): void;

/**
 * 设置对话框信息
 */
declare function DialogSetMessage(whichDialog: dialog, messageText: string): void;

/**
 * 添加对话框按钮 [R]
 */
declare function DialogAddButton(whichDialog: dialog, buttonText: string, hotkey: number): button;

/**
 * 添加退出游戏按钮 [R]
 */
declare function DialogAddQuitButton(whichDialog: dialog, doScoreScreen: boolean, buttonText: string, hotkey: number): button;

/**
 * 显示/隐藏 [R]
 */
declare function DialogDisplay(whichPlayer: player, whichDialog: dialog, flag: boolean): void;

/**
 * Creates a new or reads in an existing game cache file stored
 */
/**
 * in the current campaign profile dir
 */

//
/**
 * 读取所有缓存
 */
declare function ReloadGameCachesFromDisk(): boolean;

/**
 * 新建游戏缓存 [R]
 */
declare function InitGameCache(campaignFile: string): gamecache;

/**
 * 保存游戏缓存
 */
declare function SaveGameCache(whichCache: gamecache): boolean;

/**
 * 记录整数
 */
declare function StoreInteger(cache: gamecache, missionKey: string, key: string, value: number): void;

/**
 * 记录实数
 */
declare function StoreReal(cache: gamecache, missionKey: string, key: string, value: number): void;

/**
 * 记录布尔值
 */
declare function StoreBoolean(cache: gamecache, missionKey: string, key: string, value: boolean): void;

/**
 * 记录单位
 */
declare function StoreUnit(cache: gamecache, missionKey: string, key: string, whichUnit: unit): boolean;

/**
 * 记录字符串
 */
declare function StoreString(cache: gamecache, missionKey: string, key: string, value: string): boolean;

declare function SyncStoredInteger(cache: gamecache, missionKey: string, key: string): void;

declare function SyncStoredReal(cache: gamecache, missionKey: string, key: string): void;

declare function SyncStoredBoolean(cache: gamecache, missionKey: string, key: string): void;

declare function SyncStoredUnit(cache: gamecache, missionKey: string, key: string): void;

declare function SyncStoredString(cache: gamecache, missionKey: string, key: string): void;

declare function HaveStoredInteger(cache: gamecache, missionKey: string, key: string): boolean;

declare function HaveStoredReal(cache: gamecache, missionKey: string, key: string): boolean;

declare function HaveStoredBoolean(cache: gamecache, missionKey: string, key: string): boolean;

declare function HaveStoredUnit(cache: gamecache, missionKey: string, key: string): boolean;

declare function HaveStoredString(cache: gamecache, missionKey: string, key: string): boolean;

/**
 * 删除缓存 [C]
 */
declare function FlushGameCache(cache: gamecache): void;

/**
 * 删除类别
 */
declare function FlushStoredMission(cache: gamecache, missionKey: string): void;

/**
 * 删除整数
 */
declare function FlushStoredInteger(cache: gamecache, missionKey: string, key: string): void;

/**
 * 删除实数
 */
declare function FlushStoredReal(cache: gamecache, missionKey: string, key: string): void;

/**
 * 删除布尔值
 */
declare function FlushStoredBoolean(cache: gamecache, missionKey: string, key: string): void;

/**
 * 删除单位
 */
declare function FlushStoredUnit(cache: gamecache, missionKey: string, key: string): void;

/**
 * 删除字符串
 */
declare function FlushStoredString(cache: gamecache, missionKey: string, key: string): void;

/**
 * Will return 0 if the specified value's data is not found in the cache
 */
/**
 * 缓存读取整数 [C]
 */
declare function GetStoredInteger(cache: gamecache, missionKey: string, key: string): number;

/**
 * 缓存读取实数 [C]
 */
declare function GetStoredReal(cache: gamecache, missionKey: string, key: string): number;

/**
 * 读取布尔值[R]
 */
declare function GetStoredBoolean(cache: gamecache, missionKey: string, key: string): boolean;

/**
 * 读取字符串 [C]
 */
declare function GetStoredString(cache: gamecache, missionKey: string, key: string): string;

/**
 * 恢复单位
 */
declare function RestoreUnit(cache: gamecache, missionKey: string, key: string, forWhichPlayer: player, x: number, y: number, facing: number): unit;

/**
 * <1.24> 新建哈希表 [C]
 */
declare function InitHashtable(): hashtable;

/**
 * <1.24> 保存整数 [C]
 */
declare function SaveInteger(table: hashtable, parentKey: number, childKey: number, value: number): void;

/**
 * <1.24> 保存实数 [C]
 */
declare function SaveReal(table: hashtable, parentKey: number, childKey: number, value: number): void;

/**
 * <1.24> 保存布尔 [C]
 */
declare function SaveBoolean(table: hashtable, parentKey: number, childKey: number, value: boolean): void;

/**
 * <1.24> 保存字符串 [C]
 */
declare function SaveStr(table: hashtable, parentKey: number, childKey: number, value: string): boolean;

/**
 * <1.24> 保存玩家 [C]
 */
declare function SavePlayerHandle(table: hashtable, parentKey: number, childKey: number, whichPlayer: player): boolean;

declare function SaveWidgetHandle(table: hashtable, parentKey: number, childKey: number, whichWidget: widget): boolean;

/**
 * <1.24> 保存可破坏物 [C]
 */
declare function SaveDestructableHandle(table: hashtable, parentKey: number, childKey: number, whichDestructable: destructable): boolean;

/**
 * <1.24> 保存物品 [C]
 */
declare function SaveItemHandle(table: hashtable, parentKey: number, childKey: number, whichItem: item): boolean;

/**
 * <1.24> 保存单位 [C]
 */
declare function SaveUnitHandle(table: hashtable, parentKey: number, childKey: number, whichUnit: unit): boolean;

declare function SaveAbilityHandle(table: hashtable, parentKey: number, childKey: number, whichAbility: ability): boolean;

/**
 * <1.24> 保存计时器 [C]
 */
declare function SaveTimerHandle(table: hashtable, parentKey: number, childKey: number, whichTimer: timer): boolean;

/**
 * <1.24> 保存触发器 [C]
 */
declare function SaveTriggerHandle(table: hashtable, parentKey: number, childKey: number, whichTrigger: trigger): boolean;

/**
 * <1.24> 保存触发条件 [C]
 */
declare function SaveTriggerConditionHandle(table: hashtable, parentKey: number, childKey: number, whichTriggercondition: triggercondition): boolean;

/**
 * <1.24> 保存触发动作 [C]
 */
declare function SaveTriggerActionHandle(table: hashtable, parentKey: number, childKey: number, whichTriggeraction: triggeraction): boolean;

/**
 * <1.24> 保存触发事件 [C]
 */
declare function SaveTriggerEventHandle(table: hashtable, parentKey: number, childKey: number, whichEvent: event): boolean;

/**
 * <1.24> 保存玩家组 [C]
 */
declare function SaveForceHandle(table: hashtable, parentKey: number, childKey: number, whichForce: force): boolean;

/**
 * <1.24> 保存单位组 [C]
 */
declare function SaveGroupHandle(table: hashtable, parentKey: number, childKey: number, whichGroup: group): boolean;

/**
 * <1.24> 保存点 [C]
 */
declare function SaveLocationHandle(table: hashtable, parentKey: number, childKey: number, whichLocation: location): boolean;

/**
 * <1.24> 保存区域(矩型) [C]
 */
declare function SaveRectHandle(table: hashtable, parentKey: number, childKey: number, whichRect: rect): boolean;

/**
 * <1.24> 保存布尔表达式 [C]
 */
declare function SaveBooleanExprHandle(table: hashtable, parentKey: number, childKey: number, whichBoolexpr: boolexpr): boolean;

/**
 * <1.24> 保存音效 [C]
 */
declare function SaveSoundHandle(table: hashtable, parentKey: number, childKey: number, whichSound: sound): boolean;

/**
 * <1.24> 保存特效 [C]
 */
declare function SaveEffectHandle(table: hashtable, parentKey: number, childKey: number, whichEffect: effect): boolean;

/**
 * <1.24> 保存单位池 [C]
 */
declare function SaveUnitPoolHandle(table: hashtable, parentKey: number, childKey: number, whichUnitpool: unitpool): boolean;

/**
 * <1.24> 保存物品池 [C]
 */
declare function SaveItemPoolHandle(table: hashtable, parentKey: number, childKey: number, whichItempool: itempool): boolean;

/**
 * <1.24> 保存任务 [C]
 */
declare function SaveQuestHandle(table: hashtable, parentKey: number, childKey: number, whichQuest: quest): boolean;

/**
 * <1.24> 保存任务要求 [C]
 */
declare function SaveQuestItemHandle(table: hashtable, parentKey: number, childKey: number, whichQuestitem: questitem): boolean;

/**
 * <1.24> 保存失败条件 [C]
 */
declare function SaveDefeatConditionHandle(table: hashtable, parentKey: number, childKey: number, whichDefeatcondition: defeatcondition): boolean;

/**
 * <1.24> 保存计时器窗口 [C]
 */
declare function SaveTimerDialogHandle(table: hashtable, parentKey: number, childKey: number, whichTimerdialog: timerdialog): boolean;

/**
 * <1.24> 保存排行榜 [C]
 */
declare function SaveLeaderboardHandle(table: hashtable, parentKey: number, childKey: number, whichLeaderboard: leaderboard): boolean;

/**
 * <1.24> 保存多面板 [C]
 */
declare function SaveMultiboardHandle(table: hashtable, parentKey: number, childKey: number, whichMultiboard: multiboard): boolean;

/**
 * <1.24> 保存多面板项目 [C]
 */
declare function SaveMultiboardItemHandle(table: hashtable, parentKey: number, childKey: number, whichMultiboarditem: multiboarditem): boolean;

/**
 * <1.24> 保存可追踪物 [C]
 */
declare function SaveTrackableHandle(table: hashtable, parentKey: number, childKey: number, whichTrackable: trackable): boolean;

/**
 * <1.24> 保存对话框 [C]
 */
declare function SaveDialogHandle(table: hashtable, parentKey: number, childKey: number, whichDialog: dialog): boolean;

/**
 * <1.24> 保存对话框按钮 [C]
 */
declare function SaveButtonHandle(table: hashtable, parentKey: number, childKey: number, whichButton: button): boolean;

/**
 * <1.24> 保存漂浮文字 [C]
 */
declare function SaveTextTagHandle(table: hashtable, parentKey: number, childKey: number, whichTexttag: texttag): boolean;

/**
 * <1.24> 保存闪电效果 [C]
 */
declare function SaveLightningHandle(table: hashtable, parentKey: number, childKey: number, whichLightning: lightning): boolean;

/**
 * <1.24> 保存图像 [C]
 */
declare function SaveImageHandle(table: hashtable, parentKey: number, childKey: number, whichImage: image): boolean;

/**
 * <1.24> 保存地面纹理变化 [C]
 */
declare function SaveUbersplatHandle(table: hashtable, parentKey: number, childKey: number, whichUbersplat: ubersplat): boolean;

/**
 * <1.24> 保存区域(不规则) [C]
 */
declare function SaveRegionHandle(table: hashtable, parentKey: number, childKey: number, whichRegion: region): boolean;

/**
 * <1.24> 保存迷雾状态 [C]
 */
declare function SaveFogStateHandle(table: hashtable, parentKey: number, childKey: number, whichFogState: fogstate): boolean;

/**
 * <1.24> 保存可见度修正器 [C]
 */
declare function SaveFogModifierHandle(table: hashtable, parentKey: number, childKey: number, whichFogModifier: fogmodifier): boolean;

/**
 * <1.24> 保存实体对象 [C]
 */
declare function SaveAgentHandle(table: hashtable, parentKey: number, childKey: number, whichAgent: agent): boolean;

/**
 * <1.24> 保存哈希表 [C]
 */
declare function SaveHashtableHandle(table: hashtable, parentKey: number, childKey: number, whichHashtable: hashtable): boolean;

/**
 * <1.24> 从哈希表提取整数 [C]
 */
declare function LoadInteger(table: hashtable, parentKey: number, childKey: number): number;

/**
 * <1.24> 从哈希表提取实数 [C]
 */
declare function LoadReal(table: hashtable, parentKey: number, childKey: number): number;

/**
 * <1.24> 从哈希表提取布尔 [C]
 */
declare function LoadBoolean(table: hashtable, parentKey: number, childKey: number): boolean;

/**
 * <1.24> 从哈希表提取字符串 [C]
 */
declare function LoadStr(table: hashtable, parentKey: number, childKey: number): string;

/**
 * <1.24> 从哈希表提取玩家 [C]
 */
declare function LoadPlayerHandle(table: hashtable, parentKey: number, childKey: number): player;

declare function LoadWidgetHandle(table: hashtable, parentKey: number, childKey: number): widget;

/**
 * <1.24> 从哈希表提取可破坏物 [C]
 */
declare function LoadDestructableHandle(table: hashtable, parentKey: number, childKey: number): destructable;

/**
 * <1.24> 从哈希表提取物品 [C]
 */
declare function LoadItemHandle(table: hashtable, parentKey: number, childKey: number): item;

/**
 * <1.24> 从哈希表提取单位 [C]
 */
declare function LoadUnitHandle(table: hashtable, parentKey: number, childKey: number): unit;

declare function LoadAbilityHandle(table: hashtable, parentKey: number, childKey: number): ability;

/**
 * <1.24> 从哈希表提取计时器 [C]
 */
declare function LoadTimerHandle(table: hashtable, parentKey: number, childKey: number): timer;

/**
 * <1.24> 从哈希表提取触发器 [C]
 */
declare function LoadTriggerHandle(table: hashtable, parentKey: number, childKey: number): trigger;

/**
 * <1.24> 从哈希表提取触发条件 [C]
 */
declare function LoadTriggerConditionHandle(table: hashtable, parentKey: number, childKey: number): triggercondition;

/**
 * <1.24> 从哈希表提取触发动作 [C]
 */
declare function LoadTriggerActionHandle(table: hashtable, parentKey: number, childKey: number): triggeraction;

/**
 * <1.24> 从哈希表提取触发事件 [C]
 */
declare function LoadTriggerEventHandle(table: hashtable, parentKey: number, childKey: number): event;

/**
 * <1.24> 从哈希表提取玩家组 [C]
 */
declare function LoadForceHandle(table: hashtable, parentKey: number, childKey: number): force;

/**
 * <1.24> 从哈希表提取单位组 [C]
 */
declare function LoadGroupHandle(table: hashtable, parentKey: number, childKey: number): group;

/**
 * <1.24> 从哈希表提取点 [C]
 */
declare function LoadLocationHandle(table: hashtable, parentKey: number, childKey: number): location;

/**
 * <1.24> 从哈希表提取区域(矩型) [C]
 */
declare function LoadRectHandle(table: hashtable, parentKey: number, childKey: number): rect;

/**
 * <1.24> 从哈希表提取布尔表达式 [C]
 */
declare function LoadBooleanExprHandle(table: hashtable, parentKey: number, childKey: number): boolexpr;

/**
 * <1.24> 从哈希表提取音效 [C]
 */
declare function LoadSoundHandle(table: hashtable, parentKey: number, childKey: number): sound;

/**
 * <1.24> 从哈希表提取特效 [C]
 */
declare function LoadEffectHandle(table: hashtable, parentKey: number, childKey: number): effect;

/**
 * <1.24> 从哈希表提取单位池 [C]
 */
declare function LoadUnitPoolHandle(table: hashtable, parentKey: number, childKey: number): unitpool;

/**
 * <1.24> 从哈希表提取物品池 [C]
 */
declare function LoadItemPoolHandle(table: hashtable, parentKey: number, childKey: number): itempool;

/**
 * <1.24> 从哈希表提取任务 [C]
 */
declare function LoadQuestHandle(table: hashtable, parentKey: number, childKey: number): quest;

/**
 * <1.24> 从哈希表提取任务要求 [C]
 */
declare function LoadQuestItemHandle(table: hashtable, parentKey: number, childKey: number): questitem;

/**
 * <1.24> 从哈希表提取失败条件 [C]
 */
declare function LoadDefeatConditionHandle(table: hashtable, parentKey: number, childKey: number): defeatcondition;

/**
 * <1.24> 从哈希表提取计时器窗口 [C]
 */
declare function LoadTimerDialogHandle(table: hashtable, parentKey: number, childKey: number): timerdialog;

/**
 * <1.24> 从哈希表提取排行榜 [C]
 */
declare function LoadLeaderboardHandle(table: hashtable, parentKey: number, childKey: number): leaderboard;

/**
 * <1.24> 从哈希表提取多面板 [C]
 */
declare function LoadMultiboardHandle(table: hashtable, parentKey: number, childKey: number): multiboard;

/**
 * <1.24> 从哈希表提取多面板项目 [C]
 */
declare function LoadMultiboardItemHandle(table: hashtable, parentKey: number, childKey: number): multiboarditem;

/**
 * <1.24> 从哈希表提取可追踪物 [C]
 */
declare function LoadTrackableHandle(table: hashtable, parentKey: number, childKey: number): trackable;

/**
 * <1.24> 从哈希表提取对话框 [C]
 */
declare function LoadDialogHandle(table: hashtable, parentKey: number, childKey: number): dialog;

/**
 * <1.24> 从哈希表提取对话框按钮 [C]
 */
declare function LoadButtonHandle(table: hashtable, parentKey: number, childKey: number): button;

/**
 * <1.24> 从哈希表提取漂浮文字 [C]
 */
declare function LoadTextTagHandle(table: hashtable, parentKey: number, childKey: number): texttag;

/**
 * <1.24> 从哈希表提取闪电效果 [C]
 */
declare function LoadLightningHandle(table: hashtable, parentKey: number, childKey: number): lightning;

/**
 * <1.24> 从哈希表提取图象 [C]
 */
declare function LoadImageHandle(table: hashtable, parentKey: number, childKey: number): image;

/**
 * <1.24> 从哈希表提取地面纹理变化 [C]
 */
declare function LoadUbersplatHandle(table: hashtable, parentKey: number, childKey: number): ubersplat;

/**
 * <1.24> 从哈希表提取区域(不规则) [C]
 */
declare function LoadRegionHandle(table: hashtable, parentKey: number, childKey: number): region;

/**
 * <1.24> 从哈希表提取迷雾状态 [C]
 */
declare function LoadFogStateHandle(table: hashtable, parentKey: number, childKey: number): fogstate;

/**
 * <1.24> 从哈希表提取可见度修正器 [C]
 */
declare function LoadFogModifierHandle(table: hashtable, parentKey: number, childKey: number): fogmodifier;

/**
 * <1.24> 从哈希表提取哈希表 [C]
 */
declare function LoadHashtableHandle(table: hashtable, parentKey: number, childKey: number): hashtable;

/**
 * <1.24> 清空哈希表 [C]
 */
declare function FlushParentHashtable(table: hashtable): void;

/**
 * <1.24> 清空哈希表主索引 [C]
 */
declare function FlushChildHashtable(table: hashtable, parentKey: number): void;

//============================================================================
/**
 * Randomization API
 */
/**
 * 随机数字
 */
declare function GetRandomInt(lowBound: number, highBound: number): number;

/**
 * 随机数
 */
declare function GetRandomReal(lowBound: number, highBound: number): number;

/**
 * 新建单位池 [R]
 */
declare function CreateUnitPool(): unitpool;

/**
 * 删除单位池 [R]
 */
declare function DestroyUnitPool(whichPool: unitpool): void;

/**
 * 添加单位类型 [R]
 */
declare function UnitPoolAddUnitType(whichPool: unitpool, unitid: number | string, weight: number): void;

/**
 * 删除单位类型 [R]
 */
declare function UnitPoolRemoveUnitType(whichPool: unitpool, unitid: number | string): void;

/**
 * 选择放置单位 [R]
 */
declare function PlaceRandomUnit(whichPool: unitpool, forWhichPlayer: player, x: number, y: number, facing: number): unit;

/**
 * 新建物品池 [R]
 */
declare function CreateItemPool(): itempool;

/**
 * 删除物品池 [R]
 */
declare function DestroyItemPool(whichItemPool: itempool): void;

/**
 * 添加物品类型 [R]
 */
declare function ItemPoolAddItemType(whichItemPool: itempool, itemid: number | string, weight: number): void;

/**
 * 删除物品类型 [R]
 */
declare function ItemPoolRemoveItemType(whichItemPool: itempool, itemid: number | string): void;

/**
 * 选择放置物品 [R]
 */
declare function PlaceRandomItem(whichItemPool: itempool, x: number, y: number): item;

/**
 * Choose any random unit/item. (NP means Neutral Passive)
 */
/**
 * Choose any random unit/item. (NP means Neutral Passive)
 */
declare function ChooseRandomCreep(level: number): number;

declare function ChooseRandomNPBuilding(): number;

declare function ChooseRandomItem(level: number): number;

declare function ChooseRandomItemEx(whichType: itemtype, level: number): number;

/**
 * 设置随机种子
 */
declare function SetRandomSeed(seed: number): void;

//============================================================================
/**
 * Visual API
 */
/**
 * Visual API
 */
declare function SetTerrainFog(a: number, b: number, c: number, d: number, e: number): void;

declare function ResetTerrainFog(): void;

declare function SetUnitFog(a: number, b: number, c: number, d: number, e: number): void;

/**
 * 设置迷雾 [R]
 */
declare function SetTerrainFogEx(style: number, zstart: number, zend: number, density: number, red: number, green: number, blue: number): void;

/**
 * 对玩家显示文本消息(自动限时) [R]
 */
declare function DisplayTextToPlayer(toPlayer: player, x: number, y: number, message: string): void;

/**
 * 对玩家显示文本消息(指定时间) [R]
 */
declare function DisplayTimedTextToPlayer(toPlayer: player, x: number, y: number, duration: number, message: string): void;

declare function DisplayTimedTextFromPlayer(toPlayer: player, x: number, y: number, duration: number, message: string): void;

/**
 * 清空文本信息(所有玩家) [R]
 */
declare function ClearTextMessages(): void;

declare function SetDayNightModels(terrainDNCFile: string, unitDNCFile: string): void;

declare function SetPortraitLight(portraitDNCFile: string): void;

/**
 * 设置天空
 */
declare function SetSkyModel(skyModelFile: string): void;

/**
 * 启用/禁用玩家控制权(所有玩家) [R]
 */
declare function EnableUserControl(b: boolean): void;

declare function EnableUserUI(b: boolean): void;

declare function SuspendTimeOfDay(b: boolean): void;

/**
 * 设置昼夜时间流逝速度 [R]
 */
declare function SetTimeOfDayScale(r: number): void;

declare function GetTimeOfDayScale(): number;

/**
 * 开启/关闭 信箱模式(所有玩家) [R]
 */
declare function ShowInterface(flag: boolean, fadeDuration: number): void;

/**
 * 暂停/恢复游戏 [R]
 */
declare function PauseGame(flag: boolean): void;

/**
 * 闪动指示器(对单位) [R]
 */
declare function UnitAddIndicator(whichUnit: unit, red: number, green: number, blue: number, alpha: number): void;

declare function AddIndicator(whichWidget: widget, red: number, green: number, blue: number, alpha: number): void;

/**
 * 小地图信号(所有玩家) [R]
 */
declare function PingMinimap(x: number, y: number, duration: number): void;

/**
 * 小地图信号(指定颜色)(所有玩家) [R]
 */
declare function PingMinimapEx(x: number, y: number, duration: number, red: number, green: number, blue: number, extraEffects: boolean): void;

/**
 * 允许/禁止闭塞(所有玩家) [R]
 */
declare function EnableOcclusion(flag: boolean): void;

declare function SetIntroShotText(introText: string): void;

declare function SetIntroShotModel(introModelPath: string): void;

/**
 * 允许/禁止 边界染色(所有玩家) [R]
 */
declare function EnableWorldFogBoundary(b: boolean): void;

declare function PlayModelCinematic(modelName: string): void;

declare function PlayCinematic(movieName: string): void;

declare function ForceUIKey(key: string): void;

declare function ForceUICancel(): void;

declare function DisplayLoadDialog(): void;

/**
 * 改变小地图的特殊图标
 */
declare function SetAltMinimapIcon(iconPath: string): void;

/**
 * 禁用 重新开始任务按钮
 */
declare function DisableRestartMission(flag: boolean): void;

/**
 * 新建漂浮文字 [R]
 */
declare function CreateTextTag(): texttag;

declare function DestroyTextTag(t: texttag): void;

/**
 * 改变文字内容 [R]
 */
declare function SetTextTagText(t: texttag, s: string, height: number): void;

/**
 * 改变位置(坐标) [R]
 */
declare function SetTextTagPos(t: texttag, x: number, y: number, heightOffset: number): void;

declare function SetTextTagPosUnit(t: texttag, whichUnit: unit, heightOffset: number): void;

/**
 * 改变颜色 [R]
 */
declare function SetTextTagColor(t: texttag, red: number, green: number, blue: number, alpha: number): void;

/**
 * 设置速率 [R]
 */
declare function SetTextTagVelocity(t: texttag, xvel: number, yvel: number): void;

/**
 * 显示/隐藏 (所有玩家) [R]
 */
declare function SetTextTagVisibility(t: texttag, flag: boolean): void;

/**
 * 保留英雄按钮
 */
declare function SetReservedLocalHeroButtons(reserved: number): void;

/**
 * 结盟滤色镜的设置值
 */
declare function GetAllyColorFilterState(): number;

/**
 * 设置结盟滤色镜
 */
declare function SetAllyColorFilterState(state: number): void;

/**
 * 野生单位显示是开启的
 */
declare function GetCreepCampFilterState(): boolean;

/**
 * 显示/隐藏野生生物图标在小地图
 */
declare function SetCreepCampFilterState(state: boolean): void;

/**
 * 允许/禁止小地图按钮
 */
declare function EnableMinimapFilterButtons(enableAlly: boolean, enableCreep: boolean): void;

/**
 * 允许/禁止框选
 */
declare function EnableDragSelect(state: boolean, ui: boolean): void;

/**
 * 允许/禁止预选
 */
declare function EnablePreSelect(state: boolean, ui: boolean): void;

/**
 * 允许/禁止选择
 */
declare function EnableSelect(state: boolean, ui: boolean): void;

/**
 * Trackable API
 */
/**
 * 新建可追踪物 [R]
 */
declare function CreateTrackable(trackableModelPath: string, x: number, y: number, facing: number): trackable;

/**
 * Quest API
 */
/**
 * 新建任务 [R]
 */
declare function CreateQuest(): quest;

/**
 * 销毁任务
 */
declare function DestroyQuest(whichQuest: quest): void;

/**
 * 设置任务标题
 */
declare function QuestSetTitle(whichQuest: quest, title: string): void;

/**
 * 设置任务介绍
 */
declare function QuestSetDescription(whichQuest: quest, description: string): void;

/**
 * 设置任务图标
 */
declare function QuestSetIconPath(whichQuest: quest, iconPath: string): void;

declare function QuestSetRequired(whichQuest: quest, required: boolean): void;

declare function QuestSetCompleted(whichQuest: quest, completed: boolean): void;

declare function QuestSetDiscovered(whichQuest: quest, discovered: boolean): void;

declare function QuestSetFailed(whichQuest: quest, failed: boolean): void;

/**
 * 启用/禁用 任务 [R]
 */
declare function QuestSetEnabled(whichQuest: quest, enabled: boolean): void;

/**
 * 任务是必须完成的
 */
declare function IsQuestRequired(whichQuest: quest): boolean;

/**
 * 任务完成
 */
declare function IsQuestCompleted(whichQuest: quest): boolean;

/**
 * 任务找到
 */
declare function IsQuestDiscovered(whichQuest: quest): boolean;

/**
 * 任务失败
 */
declare function IsQuestFailed(whichQuest: quest): boolean;

/**
 * 允许任务
 */
declare function IsQuestEnabled(whichQuest: quest): boolean;

/**
 * 任务创建物品
 */
declare function QuestCreateItem(whichQuest: quest): questitem;

/**
 * 任务物品介绍
 */
declare function QuestItemSetDescription(whichQuestItem: questitem, description: string): void;

/**
 * 任务物品发货
 */
declare function QuestItemSetCompleted(whichQuestItem: questitem, completed: boolean): void;

/**
 * 任务条件完成
 */
declare function IsQuestItemCompleted(whichQuestItem: questitem): boolean;

/**
 * 创建失败条件
 */
declare function CreateDefeatCondition(): defeatcondition;

/**
 * 销毁失败条件
 */
declare function DestroyDefeatCondition(whichCondition: defeatcondition): void;

/**
 * 失败条件描述
 */
declare function DefeatConditionSetDescription(whichCondition: defeatcondition, description: string): void;

declare function FlashQuestDialogButton(): void;

declare function ForceQuestDialogUpdate(): void;

//============================================================================
/**
 * Timer Dialog API
 */
/**
 * 新建计时器窗口 [R]
 */
declare function CreateTimerDialog(t: timer): timerdialog;

/**
 * 销毁计时器窗口
 */
declare function DestroyTimerDialog(whichDialog: timerdialog): void;

/**
 * 设置计时器窗口标题
 */
declare function TimerDialogSetTitle(whichDialog: timerdialog, title: string): void;

/**
 * 改变计时器窗口文字颜色 [R]
 */
declare function TimerDialogSetTitleColor(whichDialog: timerdialog, red: number, green: number, blue: number, alpha: number): void;

/**
 * 改变计时器窗口计时颜色 [R]
 */
declare function TimerDialogSetTimeColor(whichDialog: timerdialog, red: number, green: number, blue: number, alpha: number): void;

/**
 * 设置计时器窗口速率 [R]
 */
declare function TimerDialogSetSpeed(whichDialog: timerdialog, speedMultFactor: number): void;

/**
 * 显示/隐藏 计时器窗口(所有玩家) [R]
 */
declare function TimerDialogDisplay(whichDialog: timerdialog, display: boolean): void;

/**
 * 判断计时器窗口是否显示
 */
declare function IsTimerDialogDisplayed(whichDialog: timerdialog): boolean;

/**
 * 可以修改倒计时窗口的时间，可以开启另一个计时器每隔一段时间，修改倒计时窗口时间，从而实现正计时
 */
declare function TimerDialogSetRealTimeRemaining(whichDialog: timerdialog, timeRemaining: number): void;

//============================================================================
/**
 * Leaderboard API
 */

/**
 * Create a leaderboard object
 */
/**
 * 新建排行榜 [R]
 */
declare function CreateLeaderboard(): leaderboard;

//删除排行榜
declare function DestroyLeaderboard(lb: leaderboard): void;

/**
 * 显示/隐藏 [R]
 */
declare function LeaderboardDisplay(lb: leaderboard, show: boolean): void;

/**
 * 是否显示排行榜
 */
declare function IsLeaderboardDisplayed(lb: leaderboard): boolean;

/**
 * 行数
 */
declare function LeaderboardGetItemCount(lb: leaderboard): number;

declare function LeaderboardSetSizeByItemCount(lb: leaderboard, count: number): void;

declare function LeaderboardAddItem(lb: leaderboard, label: string, value: number, p: player): void;

declare function LeaderboardRemoveItem(lb: leaderboard, index: number): void;

declare function LeaderboardRemovePlayerItem(lb: leaderboard, p: player): void;

/**
 * 清空 [R]
 */
declare function LeaderboardClear(lb: leaderboard): void;

declare function LeaderboardSortItemsByValue(lb: leaderboard, ascending: boolean): void;

declare function LeaderboardSortItemsByPlayer(lb: leaderboard, ascending: boolean): void;

declare function LeaderboardSortItemsByLabel(lb: leaderboard, ascending: boolean): void;

declare function LeaderboardHasPlayerItem(lb: leaderboard, p: player): boolean;

declare function LeaderboardGetPlayerIndex(lb: leaderboard, p: player): number;

declare function LeaderboardSetLabel(lb: leaderboard, label: string): void;

declare function LeaderboardGetLabelText(lb: leaderboard): string;

/**
 * 设置玩家使用的排行榜 [R]
 */
declare function PlayerSetLeaderboard(toPlayer: player, lb: leaderboard): void;

declare function PlayerGetLeaderboard(toPlayer: player): leaderboard;

/**
 * 设置文字颜色 [R]
 */
declare function LeaderboardSetLabelColor(lb: leaderboard, red: number, green: number, blue: number, alpha: number): void;

/**
 * 设置数值颜色 [R]
 */
declare function LeaderboardSetValueColor(lb: leaderboard, red: number, green: number, blue: number, alpha: number): void;

declare function LeaderboardSetStyle(lb: leaderboard, showLabel: boolean, showNames: boolean, showValues: boolean, showIcons: boolean): void;

declare function LeaderboardSetItemValue(lb: leaderboard, whichItem: number, val: number): void;

declare function LeaderboardSetItemLabel(lb: leaderboard, whichItem: number, val: string): void;

declare function LeaderboardSetItemStyle(lb: leaderboard, whichItem: number, showLabel: boolean, showValue: boolean, showIcon: boolean): void;

declare function LeaderboardSetItemLabelColor(lb: leaderboard, whichItem: number, red: number, green: number, blue: number, alpha: number): void;

declare function LeaderboardSetItemValueColor(lb: leaderboard, whichItem: number, red: number, green: number, blue: number, alpha: number): void;

//============================================================================
/**
 * Multiboard API
 */
//============================================================================
/**
 * Create a multiboard object
 */
/**
 * 新建多面板 [R]
 */
declare function CreateMultiboard(): multiboard;

declare function DestroyMultiboard(lb: multiboard): void;

/**
 * 显示/隐藏 [R]
 */
declare function MultiboardDisplay(lb: multiboard, show: boolean): void;

/**
 * 多列面板 是已显示的
 */
declare function IsMultiboardDisplayed(lb: multiboard): boolean;

/**
 * 最大/最小化 [R]
 */
declare function MultiboardMinimize(lb: multiboard, minimize: boolean): void;

/**
 * 多列面板 是最小化的
 */
declare function IsMultiboardMinimized(lb: multiboard): boolean;

/**
 * 清除 多列面板
 */
declare function MultiboardClear(lb: multiboard): void;

/**
 * 改变 多列面板 标题
 */
declare function MultiboardSetTitleText(lb: multiboard, label: string): void;

/**
 * 多列面板 的标题
 */
declare function MultiboardGetTitleText(lb: multiboard): string;

/**
 * 设置标题颜色 [R]
 */
declare function MultiboardSetTitleTextColor(lb: multiboard, red: number, green: number, blue: number, alpha: number): void;

/**
 * 获得多列面板 的行数
 */
declare function MultiboardGetRowCount(lb: multiboard): number;

/**
 * 获得多列面板 的列数
 */
declare function MultiboardGetColumnCount(lb: multiboard): number;

/**
 * 改变多列面板'列数'
 */
declare function MultiboardSetColumnCount(lb: multiboard, count: number): void;

/**
 * 改变多列面板'行数'
 */
declare function MultiboardSetRowCount(lb: multiboard, count: number): void;

/**
 * broadcast settings to all items
 */
/**
 * 设置所有项目显示风格 [R]
 */
declare function MultiboardSetItemsStyle(lb: multiboard, showValues: boolean, showIcons: boolean): void;

/**
 * 设置所有项目文本 [R]
 */
declare function MultiboardSetItemsValue(lb: multiboard, value: string): void;

/**
 * 设置所有项目颜色 [R]
 */
declare function MultiboardSetItemsValueColor(lb: multiboard, red: number, green: number, blue: number, alpha: number): void;

/**
 * 设置所有项目宽度 [R]
 */
declare function MultiboardSetItemsWidth(lb: multiboard, width: number): void;

/**
 * 设置所有项目图标 [R]
 */
declare function MultiboardSetItemsIcon(lb: multiboard, iconPath: string): void;

/**
 * funcs for modifying individual items
 */
/**
 * 多面板项目 [R]
 */
declare function MultiboardGetItem(lb: multiboard, row: number, column: number): multiboarditem;

/**
 * 删除多面板项目 [R]
 */
declare function MultiboardReleaseItem(mbi: multiboarditem): void;

/**
 * 设置指定项目显示风格 [R]
 */
declare function MultiboardSetItemStyle(mbi: multiboarditem, showValue: boolean, showIcon: boolean): void;

/**
 * 设置指定项目文本 [R]
 */
declare function MultiboardSetItemValue(mbi: multiboarditem, val: string): void;

/**
 * 设置指定项目颜色 [R]
 */
declare function MultiboardSetItemValueColor(mbi: multiboarditem, red: number, green: number, blue: number, alpha: number): void;

/**
 * 设置指定项目宽度 [R]
 */
declare function MultiboardSetItemWidth(mbi: multiboarditem, width: number): void;

/**
 * 设置指定项目图标 [R]
 */
declare function MultiboardSetItemIcon(mbi: multiboarditem, iconFileName: string): void;

/**
 * meant to unequivocally suspend display of existing and
 */
/**
 * subsequently displayed multiboards
 */

//
/**
 * 显示/隐藏多面板模式 [R]
 */
declare function MultiboardSuppressDisplay(flag: boolean): void;

//============================================================================
/**
 * Camera API
 */
declare function SetCameraPosition(x: number, y: number): void;

/**
 * 设置空格键转向点(所有玩家) [R]
 */
declare function SetCameraQuickPosition(x: number, y: number): void;

/**
 * 设置可用镜头区域(所有玩家) [R]
 */
declare function SetCameraBounds(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number, x4: number, y4: number): void;

/**
 * 停止播放镜头(所有玩家) [R]
 */
declare function StopCamera(): void;

/**
 * 重置游戏镜头(所有玩家) [R]
 */
declare function ResetToGameCamera(duration: number): void;

/**
 * 平移镜头
 */
declare function PanCameraTo(x: number, y: number): void;

/**
 * 平移镜头(所有玩家)(限时) [R]
 */
declare function PanCameraToTimed(x: number, y: number, duration: number): void;

/**
 * 平移镜头(包含z轴)
 */
declare function PanCameraToWithZ(x: number, y: number, zOffsetDest: number): void;

/**
 * 指定高度平移镜头(所有玩家)(限时) [R]
 */
declare function PanCameraToTimedWithZ(x: number, y: number, zOffsetDest: number, duration: number): void;

/**
 * 播放电影镜头(所有玩家) [R]
 */
declare function SetCinematicCamera(cameraModelFile: string): void;

/**
 * 指定点旋转镜头(所有玩家)(弧度)(限时) [R]
 */
declare function SetCameraRotateMode(x: number, y: number, radiansToSweep: number, duration: number): void;

/**
 * 设置镜头属性(所有玩家)(限时) [R]
 */
declare function SetCameraField(whichField: camerafield, value: number, duration: number): void;

declare function AdjustCameraField(whichField: camerafield, offset: number, duration: number): void;

/**
 * 锁定镜头到单位(所有玩家) [R]
 */
declare function SetCameraTargetController(whichUnit: unit, xoffset: number, yoffset: number, inheritOrientation: boolean): void;

/**
 * 锁定镜头到单位(固定镜头源)(所有玩家) [R]
 */
declare function SetCameraOrientController(whichUnit: unit, xoffset: number, yoffset: number): void;

declare function CreateCameraSetup(): camerasetup;

declare function CameraSetupSetField(whichSetup: camerasetup, whichField: camerafield, value: number, duration: number): void;

/**
 * 镜头属性(指定镜头) [R]
 */
declare function CameraSetupGetField(whichSetup: camerasetup, whichField: camerafield): number;

declare function CameraSetupSetDestPosition(whichSetup: camerasetup, x: number, y: number, duration: number): void;

/**
 * 摄象机的目标
 */
declare function CameraSetupGetDestPositionLoc(whichSetup: camerasetup): location;

declare function CameraSetupGetDestPositionX(whichSetup: camerasetup): number;

declare function CameraSetupGetDestPositionY(whichSetup: camerasetup): number;

declare function CameraSetupApply(whichSetup: camerasetup, doPan: boolean, panTimed: boolean): void;

declare function CameraSetupApplyWithZ(whichSetup: camerasetup, zDestOffset: number): void;

/**
 * 应用镜头(所有玩家)(限时) [R]
 */
declare function CameraSetupApplyForceDuration(whichSetup: camerasetup, doPan: boolean, forceDuration: number): void;

declare function CameraSetupApplyForceDurationWithZ(whichSetup: camerasetup, zDestOffset: number, forceDuration: number): void;

declare function BlzCameraSetupSetLabel(whichSetup: camerasetup, label: string): void;

declare function BlzCameraSetupGetLabel(whichSetup: camerasetup): string;

declare function CameraSetTargetNoise(mag: number, velocity: number): void;

declare function CameraSetSourceNoise(mag: number, velocity: number): void;

/**
 * 摇晃镜头目标(所有玩家) [R]
 */
declare function CameraSetTargetNoiseEx(mag: number, velocity: number, vertOnly: boolean): void;

/**
 * 摇晃镜头源(所有玩家) [R]
 */
declare function CameraSetSourceNoiseEx(mag: number, velocity: number, vertOnly: boolean): void;

declare function CameraSetSmoothingFactor(factor: number): void;

declare function CameraSetFocalDistance(distance: number): void;

declare function CameraSetDepthOfFieldScale(scale: number): void;

declare function SetCineFilterTexture(filename: string): void;

declare function SetCineFilterBlendMode(whichMode: blendmode): void;

declare function SetCineFilterTexMapFlags(whichFlags: texmapflags): void;

declare function SetCineFilterStartUV(minu: number, minv: number, maxu: number, maxv: number): void;

declare function SetCineFilterEndUV(minu: number, minv: number, maxu: number, maxv: number): void;

declare function SetCineFilterStartColor(red: number, green: number, blue: number, alpha: number): void;

declare function SetCineFilterEndColor(red: number, green: number, blue: number, alpha: number): void;

declare function SetCineFilterDuration(duration: number): void;

declare function DisplayCineFilter(flag: boolean): void;

declare function IsCineFilterDisplayed(): boolean;

declare function SetCinematicScene(portraitUnitid: number | string, color: playercolor, speakerTitle: string, text: string, sceneDuration: number, voiceoverDuration: number): void;

declare function EndCinematicScene(): void;

declare function ForceCinematicSubtitles(flag: boolean): void;

declare function SetCinematicAudio(cinematicAudio: boolean): void;

declare function GetCameraMargin(whichMargin: number): number;

/**
 * These return values for the local players camera only...
 */
/**
 * These return values for the local players camera only...
 */
declare function GetCameraBoundMinX(): number;

declare function GetCameraBoundMinY(): number;

declare function GetCameraBoundMaxX(): number;

declare function GetCameraBoundMaxY(): number;

/**
 * 当前摄象机的数值
 */
declare function GetCameraField(whichField: camerafield): number;

/**
 * 当前摄象机的目标的 X 坐标
 */
declare function GetCameraTargetPositionX(): number;

/**
 * 当前摄象机的目标的 Y 坐标
 */
declare function GetCameraTargetPositionY(): number;

/**
 * 当前摄象机的目标的 Z 坐标
 */
declare function GetCameraTargetPositionZ(): number;

/**
 * 当前摄象机的目标
 */
declare function GetCameraTargetPositionLoc(): location;

/**
 * 当前摄象机的位置的 X 坐标
 */
declare function GetCameraEyePositionX(): number;

/**
 * 当前摄象机的位置的 Y 坐标
 */
declare function GetCameraEyePositionY(): number;

/**
 * 当前摄象机的位置的 Z 坐标
 */
declare function GetCameraEyePositionZ(): number;

/**
 * 当前照相机的位置
 */
declare function GetCameraEyePositionLoc(): location;

//============================================================================
/**
 * Sound API
 */
//
declare function NewSoundEnvironment(environmentName: string): void;

declare function CreateSound(fileName: string, looping: boolean, is3D: boolean, stopwhenoutofrange: boolean, fadeInRate: number, fadeOutRate: number, eaxSetting: string): sound;

declare function CreateSoundFilenameWithLabel(fileName: string, looping: boolean, is3D: boolean, stopwhenoutofrange: boolean, fadeInRate: number, fadeOutRate: number, SLKEntryName: string): sound;

declare function CreateSoundFromLabel(soundLabel: string, looping: boolean, is3D: boolean, stopwhenoutofrange: boolean, fadeInRate: number, fadeOutRate: number): sound;

declare function CreateMIDISound(soundLabel: string, fadeInRate: number, fadeOutRate: number): sound;

declare function SetSoundParamsFromLabel(soundHandle: sound, soundLabel: string): void;

declare function SetSoundDistanceCutoff(soundHandle: sound, cutoff: number): void;

declare function SetSoundChannel(soundHandle: sound, channel: number): void;

/**
 * 设置音效音量 [R]
 */
declare function SetSoundVolume(soundHandle: sound, volume: number): void;

declare function SetSoundPitch(soundHandle: sound, pitch: number): void;

/**
 * the following method must be called immediately after calling "StartSound"
 */
/**
 * 设置音效播放时间点 [R]
 */
declare function SetSoundPlayPosition(soundHandle: sound, millisecs: number): void;

/**
 * these calls are only valid if the sound was created with 3d enabled
 */
/**
 * 设置3D声音距离
 */
declare function SetSoundDistances(soundHandle: sound, minDist: number, maxDist: number): void;

declare function SetSoundConeAngles(soundHandle: sound, inside: number, outside: number, outsideVolume: number): void;

declare function SetSoundConeOrientation(soundHandle: sound, x: number, y: number, z: number): void;

/**
 * 设置3D音效位置(指定坐标) [R]
 */
declare function SetSoundPosition(soundHandle: sound, x: number, y: number, z: number): void;

declare function SetSoundVelocity(soundHandle: sound, x: number, y: number, z: number): void;

declare function AttachSoundToUnit(soundHandle: sound, whichUnit: unit): void;

declare function StartSound(soundHandle: sound): void;

declare function StopSound(soundHandle: sound, killWhenDone: boolean, fadeOut: boolean): void;

declare function KillSoundWhenDone(soundHandle: sound): void;

/**
 * Music Interface. Note that if music is disabled, these calls do nothing
 */
/**
 * 设置背景音乐列表 [R]
 */
declare function SetMapMusic(musicName: string, random: boolean, index: number): void;

declare function ClearMapMusic(): void;

declare function PlayMusic(musicName: string): void;

declare function PlayMusicEx(musicName: string, frommsecs: number, fadeinmsecs: number): void;

declare function StopMusic(fadeOut: boolean): void;

declare function ResumeMusic(): void;

/**
 * 播放主题音乐 [C]
 */
declare function PlayThematicMusic(musicFileName: string): void;

/**
 * 跳播主题音乐 [R]
 */
declare function PlayThematicMusicEx(musicFileName: string, frommsecs: number): void;

/**
 * 停止主题音乐[C]
 */
declare function EndThematicMusic(): void;

/**
 * 设置背景音乐音量 [R]
 */
declare function SetMusicVolume(volume: number): void;

/**
 * 设置背景音乐播放时间点 [R]
 */
declare function SetMusicPlayPosition(millisecs: number): void;

declare function SetThematicMusicVolume(volume: number): void;

/**
 * 设置主题音乐播放时间点 [R]
 */
declare function SetThematicMusicPlayPosition(millisecs: number): void;

/**
 * other music and sound calls
 */
declare function SetSoundDuration(soundHandle: sound, duration: number): void;

declare function GetSoundDuration(soundHandle: sound): number;

declare function GetSoundFileDuration(musicFileName: string): number;

/**
 * 设置多通道音量 [R]
 */
declare function VolumeGroupSetVolume(vgroup: volumegroup, scale: number): void;

declare function VolumeGroupReset(): void;

declare function GetSoundIsPlaying(soundHandle: sound): boolean;

declare function GetSoundIsLoading(soundHandle: sound): boolean;

declare function RegisterStackedSound(soundHandle: sound, byPosition: boolean, rectwidth: number, rectheight: number): void;

declare function UnregisterStackedSound(soundHandle: sound, byPosition: boolean, rectwidth: number, rectheight: number): void;

declare function SetSoundFacialAnimationLabel(soundHandle: sound, animationLabel: string): boolean;

declare function SetSoundFacialAnimationGroupLabel(soundHandle: sound, groupLabel: string): boolean;

declare function SetSoundFacialAnimationSetFilepath(soundHandle: sound, animationSetFilepath: string): boolean;

//Subtitle support that is attached to the soundHandle rather than as disperate data with the legacy UI
/**
 * Subtitle support that is attached to the soundHandle rather than as disperate data with the legacy UI
 */
declare function SetDialogueSpeakerNameKey(soundHandle: sound, speakerName: string): boolean;

declare function GetDialogueSpeakerNameKey(soundHandle: sound): string;

declare function SetDialogueTextKey(soundHandle: sound, dialogueText: string): boolean;

declare function GetDialogueTextKey(soundHandle: sound): string;

//============================================================================
/**
 * Effects API
 */

//
/**
 * 新建天气效果 [R]
 */
declare function AddWeatherEffect(where: rect, effectid: number | string): weathereffect;

declare function RemoveWeatherEffect(whichEffect: weathereffect): void;

/**
 * 打开/关闭天气效果
 */
declare function EnableWeatherEffect(whichEffect: weathereffect, enable: boolean): void;

/**
 * 新建地形变化:弹坑 [R]
 */
declare function TerrainDeformCrater(x: number, y: number, radius: number, depth: number, duration: number, permanent: boolean): terraindeformation;

/**
 * 新建地形变化:波纹 [R]
 */
declare function TerrainDeformRipple(x: number, y: number, radius: number, depth: number, duration: number, count: number, spaceWaves: number, timeWaves: number, radiusStartPct: number, limitNeg: boolean): terraindeformation;

/**
 * 新建地形变化:冲击波 [R]
 */
declare function TerrainDeformWave(x: number, y: number, dirX: number, dirY: number, distance: number, speed: number, radius: number, depth: number, trailTime: number, count: number): terraindeformation;

/**
 * 新建地形变化:随机 [R]
 */
declare function TerrainDeformRandom(x: number, y: number, radius: number, minDelta: number, maxDelta: number, duration: number, updateInterval: number): terraindeformation;

/**
 * 停止地形变化 [R]
 */
declare function TerrainDeformStop(deformation: terraindeformation, duration: number): void;

/**
 * 停止所有地域变形
 */
declare function TerrainDeformStopAll(): void;

/**
 * 新建特效(创建到坐标) [R]
 */
declare function AddSpecialEffect(modelName: string, x: number, y: number): effect;

/**
 * 新建特效(创建到点) [R]
 */
declare function AddSpecialEffectLoc(modelName: string, where: location): effect;

/**
 * 新建特效(创建到单位) [R]
 */
declare function AddSpecialEffectTarget(modelName: string, targetWidget: widget, attachPointName: string): effect;

/**
 * 销毁特效
 */
declare function DestroyEffect(whichEffect: effect): void;

declare function AddSpellEffect(abilityString: string, t: effecttype, x: number, y: number): effect;

declare function AddSpellEffectLoc(abilityString: string, t: effecttype, where: location): effect;

/**
 * 新建特效(指定技能，创建到坐标) [R]
 */
declare function AddSpellEffectById(abilityid: number | string, t: effecttype, x: number, y: number): effect;

/**
 * 新建特效(指定技能，创建到点) [R]
 */
declare function AddSpellEffectByIdLoc(abilityid: number | string, t: effecttype, where: location): effect;

declare function AddSpellEffectTarget(modelName: string, t: effecttype, targetWidget: widget, attachPoint: string): effect;

/**
 * 新建特效(指定技能，创建到单位) [R]
 */
declare function AddSpellEffectTargetById(abilityid: number | string, t: effecttype, targetWidget: widget, attachPoint: string): effect;

/**
 * 新建闪电效果 [R]
 */
declare function AddLightning(codeName: string, checkVisibility: boolean, x1: number, y1: number, x2: number, y2: number): lightning;

/**
 * 新建闪电效果(指定Z轴) [R]
 */
declare function AddLightningEx(codeName: string, checkVisibility: boolean, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number): lightning;

/**
 * 销毁闪电特效
 */
declare function DestroyLightning(whichBolt: lightning): boolean;

/**
 * 移动闪电效果
 */
declare function MoveLightning(whichBolt: lightning, checkVisibility: boolean, x1: number, y1: number, x2: number, y2: number): boolean;

/**
 * 移动闪电效果(指定坐标) [R]
 */
declare function MoveLightningEx(whichBolt: lightning, checkVisibility: boolean, x1: number, y1: number, z1: number, x2: number, y2: number, z2: number): boolean;

declare function GetLightningColorA(whichBolt: lightning): number;

declare function GetLightningColorR(whichBolt: lightning): number;

declare function GetLightningColorG(whichBolt: lightning): number;

declare function GetLightningColorB(whichBolt: lightning): number;

declare function SetLightningColor(whichBolt: lightning, r: number, g: number, b: number, a: number): boolean;

declare function GetAbilityEffect(abilityString: string, t: effecttype, index: number): string;

declare function GetAbilityEffectById(abilityid: number | string, t: effecttype, index: number): string;

declare function GetAbilitySound(abilityString: string, t: soundtype): string;

declare function GetAbilitySoundById(abilityid: number | string, t: soundtype): string;

//============================================================================
/**
 * Terrain API
 */

//
/**
 * 地形悬崖高度(指定坐标) [R]
 */
declare function GetTerrainCliffLevel(x: number, y: number): number;

/**
 * 设置水颜色 [R]
 */
declare function SetWaterBaseColor(red: number, green: number, blue: number, alpha: number): void;

/**
 * 设置 水变形 开/关
 */
declare function SetWaterDeforms(val: boolean): void;

/**
 * 指定坐标地形 [R]
 */
declare function GetTerrainType(x: number, y: number): number;

/**
 * 地形样式(指定坐标) [R]
 */
declare function GetTerrainVariance(x: number, y: number): number;

/**
 * 改变地形类型(指定坐标) [R]
 */
declare function SetTerrainType(x: number, y: number, terrainType: number, variation: number, area: number, shape: number): void;

/**
 * 地形通行状态关闭(指定坐标) [R]
 */
declare function IsTerrainPathable(x: number, y: number, t: pathingtype): boolean;

/**
 * 设置地形通行状态(指定坐标) [R]
 */
declare function SetTerrainPathable(x: number, y: number, t: pathingtype, flag: boolean): void;

//============================================================================
/**
 * Image API
 */

//
/**
 * 新建图像 [R]
 */
declare function CreateImage(file: string, sizeX: number, sizeY: number, sizeZ: number, posX: number, posY: number, posZ: number, originX: number, originY: number, originZ: number, imageType: number): image;

/**
 * 删除图像
 */
declare function DestroyImage(whichImage: image): void;

/**
 * 显示/隐藏 [R]
 */
declare function ShowImage(whichImage: image, flag: boolean): void;

/**
 * 改变图像高度
 */
declare function SetImageConstantHeight(whichImage: image, flag: boolean, height: number): void;

/**
 * 改变图像位置(指定坐标) [R]
 */
declare function SetImagePosition(whichImage: image, x: number, y: number, z: number): void;

/**
 * 改变图像颜色 [R]
 */
declare function SetImageColor(whichImage: image, red: number, green: number, blue: number, alpha: number): void;

/**
 * 改变图像着色状态
 */
declare function SetImageRender(whichImage: image, flag: boolean): void;

/**
 * 改变图像永久着色状态
 */
declare function SetImageRenderAlways(whichImage: image, flag: boolean): void;

/**
 * 改变图像水上状态
 */
declare function SetImageAboveWater(whichImage: image, flag: boolean, useWaterAlpha: boolean): void;

/**
 * 改变图像类型
 */
declare function SetImageType(whichImage: image, imageType: number): void;

//============================================================================
/**
 * Ubersplat API
 */

//
/**
 * 新建地面纹理变化 [R]
 */
declare function CreateUbersplat(x: number, y: number, name: string, red: number, green: number, blue: number, alpha: number, forcePaused: boolean, noBirthTime: boolean): ubersplat;

/**
 * 删除地面纹理
 */
declare function DestroyUbersplat(whichSplat: ubersplat): void;

/**
 * 重置地面纹理
 */
declare function ResetUbersplat(whichSplat: ubersplat): void;

/**
 * 完成地面纹理
 */
declare function FinishUbersplat(whichSplat: ubersplat): void;

/**
 * 显示/隐藏 地面纹理变化[R]
 */
declare function ShowUbersplat(whichSplat: ubersplat, flag: boolean): void;

/**
 * 改变地面纹理着色状态
 */
declare function SetUbersplatRender(whichSplat: ubersplat, flag: boolean): void;

/**
 * 改变地面纹理永久着色状态
 */
declare function SetUbersplatRenderAlways(whichSplat: ubersplat, flag: boolean): void;

//============================================================================
/**
 * Blight API
 */

//
/**
 * 创建/删除荒芜地表(圆范围)(指定坐标) [R]
 */
declare function SetBlight(whichPlayer: player, x: number, y: number, radius: number, addBlight: boolean): void;

/**
 * 创建/删除荒芜地表(矩形区域) [R]
 */
declare function SetBlightRect(whichPlayer: player, r: rect, addBlight: boolean): void;

/**
 * 设置荒芜地表位置
 */
declare function SetBlightPoint(whichPlayer: player, x: number, y: number, addBlight: boolean): void;

/**
 * 设置荒芜地表点
 */
declare function SetBlightLoc(whichPlayer: player, whichLocation: location, radius: number, addBlight: boolean): void;

/**
 * 新建不死族金矿 [R]
 */
declare function CreateBlightedGoldmine(id: player, x: number, y: number, face: number): unit;

/**
 * 坐标点被荒芜地表覆盖 [R]
 */
declare function IsPointBlighted(x: number, y: number): boolean;

//============================================================================
/**
 * Doodad API
 */

//
/**
 * 播放圆范围内地形装饰物动画 [R]
 */
declare function SetDoodadAnimation(x: number, y: number, radius: number, doodadid: number | string, nearestOnly: boolean, animName: string, animRandom: boolean): void;

/**
 * 播放矩形区域内地形装饰物动画 [R]
 */
declare function SetDoodadAnimationRect(r: rect, doodadid: number | string, animName: string, animRandom: boolean): void;

//============================================================================
/**
 * Computer AI interface
 */

//
/**
 * 启动对战 AI
 */
declare function StartMeleeAI(num: player, script: string): void;

/**
 * 启动战役 AI
 */
declare function StartCampaignAI(num: player, script: string): void;

/**
 * 发送 AI 命令
 */
declare function CommandAI(num: player, command: number, data: number): void;

/**
 * 暂停/恢复 AI脚本运行 [R]
 */
declare function PauseCompAI(p: player, pause: boolean): void;

/**
 * 对战 AI
 */
declare function GetAIDifficulty(num: player): aidifficulty;

/**
 * 忽略单位的防守职责
 */
declare function RemoveGuardPosition(hUnit: unit): void;

/**
 * 恢复单位的防守职责
 */
declare function RecycleGuardPosition(hUnit: unit): void;

/**
 * 忽略所有单位的防守职责
 */
declare function RemoveAllGuardPositions(num: player): void;

//============================================================================
/**
 * ** Cheat标签 **
 */
declare function Cheat(cheatStr: string): void;

/**
 * 无法胜利 [R]
 */
declare function IsNoVictoryCheat(): boolean;

/**
 * 无法失败 [R]
 */
declare function IsNoDefeatCheat(): boolean;

/**
 * 预读文件
 */
declare function Preload(filename: string): void;

/**
 * 开始预读
 */
declare function PreloadEnd(timeout: number): void;

/**
 * 预加载开始
 */
declare function PreloadStart(): void;

/**
 * 预加载刷新
 */
declare function PreloadRefresh(): void;

/**
 * 预加载结束
 */
declare function PreloadEndEx(): void;

declare function PreloadGenClear(): void;

declare function PreloadGenStart(): void;

declare function PreloadGenEnd(filename: string): void;

/**
 * 预读一批文件
 */
declare function Preloader(filename: string): void;

/**
 *  base from cj
 */
declare function HaveSavedInteger(table: hashtable, parentKey: number, childKey: number): boolean;

declare function HaveSavedReal(table: hashtable, parentKey: number, childKey: number): boolean;

declare function HaveSavedBoolean(table: hashtable, parentKey: number, childKey: number): boolean;

declare function HaveSavedString(table: hashtable, parentKey: number, childKey: number): boolean;

declare function HaveSavedHandle(table: hashtable, parentKey: number, childKey: number): boolean;

declare function RemoveSavedInteger(table: hashtable, parentKey: number, childKey: number): void;

declare function RemoveSavedReal(table: hashtable, parentKey: number, childKey: number): void;

declare function RemoveSavedBoolean(table: hashtable, parentKey: number, childKey: number): void;

declare function RemoveSavedString(table: hashtable, parentKey: number, childKey: number): void;

declare function RemoveSavedHandle(table: hashtable, parentKey: number, childKey: number): void;

declare function SetTextTagSuspended(t: texttag, flag: boolean): void;

declare function SetTextTagPermanent(t: texttag, flag: boolean): void;

declare function SetTextTagAge(t: texttag, age: number): void;

declare function SetTextTagLifespan(t: texttag, lifespan: number): void;

declare function SetTextTagFadepoint(t: texttag, fadepoint: number): void;

declare let FALSE: boolean;
declare let TRUE: boolean;
declare let JASS_MAX_ARRAY_SIZE: number;
declare let PLAYER_NEUTRAL_PASSIVE: number;
declare let PLAYER_NEUTRAL_AGGRESSIVE: number;
/**
 *  红色
 */
declare let PLAYER_COLOR_RED: playercolor;
/**
 *  蓝色
 */
declare let PLAYER_COLOR_BLUE: playercolor;
/**
 *  青色
 */
declare let PLAYER_COLOR_CYAN: playercolor;
/**
 *  紫色
 */
declare let PLAYER_COLOR_PURPLE: playercolor;
/**
 *  黄色
 */
declare let PLAYER_COLOR_YELLOW: playercolor;
/**
 *  橙色
 */
declare let PLAYER_COLOR_ORANGE: playercolor;
/**
 *  绿色
 */
declare let PLAYER_COLOR_GREEN: playercolor;
/**
 *  粉红色
 */
declare let PLAYER_COLOR_PINK: playercolor;
/**
 *  灰色
 */
declare let PLAYER_COLOR_LIGHT_GRAY: playercolor;
/**
 *  淡蓝色
 */
declare let PLAYER_COLOR_LIGHT_BLUE: playercolor;
/**
 *  暗绿色
 */
declare let PLAYER_COLOR_AQUA: playercolor;
/**
 *  棕色
 */
declare let PLAYER_COLOR_BROWN: playercolor;
/**
 *  人族
 */
declare let RACE_HUMAN: race;
/**
 *  兽族
 */
declare let RACE_ORC: race;
/**
 *  不死族
 */
declare let RACE_UNDEAD: race;
/**
 *  暗夜精灵族
 */
declare let RACE_NIGHTELF: race;
/**
 *  恶魔
 */
declare let RACE_DEMON: race;
declare let RACE_OTHER: race;
/**
 *  胜利
 */
declare let PLAYER_GAME_RESULT_VICTORY: playergameresult;
/**
 *  失败
 */
declare let PLAYER_GAME_RESULT_DEFEAT: playergameresult;
/**
 *  平局
 */
declare let PLAYER_GAME_RESULT_TIE: playergameresult;
declare let PLAYER_GAME_RESULT_NEUTRAL: playergameresult;
/**
 *  结盟(不侵犯)
 */
declare let ALLIANCE_PASSIVE: alliancetype;
/**
 *  救援请求
 */
declare let ALLIANCE_HELP_REQUEST: alliancetype;
/**
 *  救援回应
 */
declare let ALLIANCE_HELP_RESPONSE: alliancetype;
/**
 *  共享经验
 */
declare let ALLIANCE_SHARED_XP: alliancetype;
/**
 *  盟友魔法锁定
 */
declare let ALLIANCE_SHARED_SPELLS: alliancetype;
/**
 *  共享视野
 */
declare let ALLIANCE_SHARED_VISION: alliancetype;
/**
 *  共享单位
 */
declare let ALLIANCE_SHARED_CONTROL: alliancetype;
/**
 *  共享完全控制权
 */
declare let ALLIANCE_SHARED_ADVANCED_CONTROL: alliancetype;
declare let ALLIANCE_RESCUABLE: alliancetype;
declare let ALLIANCE_SHARED_VISION_FORCED: alliancetype;
declare let VERSION_REIGN_OF_CHAOS: version;
declare let VERSION_FROZEN_THRONE: version;
/**
 *  普通 x 【法术】
 *  （//通法术 we里触发伤害目标 法术类型 转jass后为 ATTACK_TYPE_NORMAL 此类型受 平衡性常数 伤害奖励-法术 影响 )
 *  PS:jass传null时默认为此攻击类型
 */
declare let ATTACK_TYPE_NORMAL: attacktype;
/**
 *  近战 x 【普通】
 *  （//通普通 we里触发伤害目标 普通类型 转jass后为 ATTACK_TYPE_MELEE 此类型受 平衡性常数 伤害奖励-普通 影响 )
 */
declare let ATTACK_TYPE_MELEE: attacktype;
/**
 *  穿刺
 */
declare let ATTACK_TYPE_PIERCE: attacktype;
/**
 *  攻城
 */
declare let ATTACK_TYPE_SIEGE: attacktype;
/**
 *  魔法
 */
declare let ATTACK_TYPE_MAGIC: attacktype;
/**
 *  混乱
 *  默认对所有护甲类型造成100%伤害
 */
declare let ATTACK_TYPE_CHAOS: attacktype;
/**
 *  英雄
 */
declare let ATTACK_TYPE_HERO: attacktype;
/**
 *  未知
 */
declare let DAMAGE_TYPE_UNKNOWN: damagetype;
/**
 *  普通
 */
declare let DAMAGE_TYPE_NORMAL: damagetype;
/**
 *  强化
 */
declare let DAMAGE_TYPE_ENHANCED: damagetype;
/**
 *  火焰
 */
declare let DAMAGE_TYPE_FIRE: damagetype;
/**
 *  冰冻
 */
declare let DAMAGE_TYPE_COLD: damagetype;
/**
 *  闪电
 */
declare let DAMAGE_TYPE_LIGHTNING: damagetype;
/**
 *  毒药
 */
declare let DAMAGE_TYPE_POISON: damagetype;
/**
 *  疾病
 */
declare let DAMAGE_TYPE_DISEASE: damagetype;
/**
 *  神圣
 */
declare let DAMAGE_TYPE_DIVINE: damagetype;
/**
 *  魔法
 */
declare let DAMAGE_TYPE_MAGIC: damagetype;
/**
 *  音速
 */
declare let DAMAGE_TYPE_SONIC: damagetype;
/**
 *  酸性
 */
declare let DAMAGE_TYPE_ACID: damagetype;
/**
 *  力量
 */
declare let DAMAGE_TYPE_FORCE: damagetype;
/**
 *  死亡
 */
declare let DAMAGE_TYPE_DEATH: damagetype;
/**
 *  精神
 */
declare let DAMAGE_TYPE_MIND: damagetype;
/**
 *  植物
 */
declare let DAMAGE_TYPE_PLANT: damagetype;
/**
 *  防御
 */
declare let DAMAGE_TYPE_DEFENSIVE: damagetype;
/**
 *  破坏
 */
declare let DAMAGE_TYPE_DEMOLITION: damagetype;
/**
 *  慢性毒药
 */
declare let DAMAGE_TYPE_SLOW_POISON: damagetype;
/**
 *  灵魂锁链
 */
declare let DAMAGE_TYPE_SPIRIT_LINK: damagetype;
/**
 *  暗影突袭
 */
declare let DAMAGE_TYPE_SHADOW_STRIKE: damagetype;
/**
 *  通用
 */
declare let DAMAGE_TYPE_UNIVERSAL: damagetype;
/**
 *  无
 */
declare let WEAPON_TYPE_WHOKNOWS: weapontype;
/**
 *  金属轻砍
 */
declare let WEAPON_TYPE_METAL_LIGHT_CHOP: weapontype;
/**
 *  金属中砍
 */
declare let WEAPON_TYPE_METAL_MEDIUM_CHOP: weapontype;
/**
 *  金属重砍
 */
declare let WEAPON_TYPE_METAL_HEAVY_CHOP: weapontype;
/**
 *  金属轻切
 */
declare let WEAPON_TYPE_METAL_LIGHT_SLICE: weapontype;
/**
 *  金属中切
 */
declare let WEAPON_TYPE_METAL_MEDIUM_SLICE: weapontype;
/**
 *  金属重切
 */
declare let WEAPON_TYPE_METAL_HEAVY_SLICE: weapontype;
/**
 *  金属中击
 */
declare let WEAPON_TYPE_METAL_MEDIUM_BASH: weapontype;
/**
 *  金属重击
 */
declare let WEAPON_TYPE_METAL_HEAVY_BASH: weapontype;
declare let WEAPON_TYPE_METAL_MEDIUM_STAB: weapontype;
declare let WEAPON_TYPE_METAL_HEAVY_STAB: weapontype;
declare let WEAPON_TYPE_WOOD_LIGHT_SLICE: weapontype;
declare let WEAPON_TYPE_WOOD_MEDIUM_SLICE: weapontype;
declare let WEAPON_TYPE_WOOD_HEAVY_SLICE: weapontype;
/**
 *  木头轻击
 */
declare let WEAPON_TYPE_WOOD_LIGHT_BASH: weapontype;
/**
 *  木头中击
 */
declare let WEAPON_TYPE_WOOD_MEDIUM_BASH: weapontype;
/**
 *  木头重击
 */
declare let WEAPON_TYPE_WOOD_HEAVY_BASH: weapontype;
declare let WEAPON_TYPE_WOOD_LIGHT_STAB: weapontype;
declare let WEAPON_TYPE_WOOD_MEDIUM_STAB: weapontype;
declare let WEAPON_TYPE_CLAW_LIGHT_SLICE: weapontype;
declare let WEAPON_TYPE_CLAW_MEDIUM_SLICE: weapontype;
declare let WEAPON_TYPE_CLAW_HEAVY_SLICE: weapontype;
/**
 *  斧头中砍
 */
declare let WEAPON_TYPE_AXE_MEDIUM_CHOP: weapontype;
/**
 *  岩石重击
 */
declare let WEAPON_TYPE_ROCK_HEAVY_BASH: weapontype;
/**
 *  任意
 */
declare let PATHING_TYPE_ANY: pathingtype;
/**
 *  可通行地面
 */
declare let PATHING_TYPE_WALKABILITY: pathingtype;
/**
 *  空中单位可通行
 */
declare let PATHING_TYPE_FLYABILITY: pathingtype;
/**
 *  可建造地面
 */
declare let PATHING_TYPE_BUILDABILITY: pathingtype;
/**
 *  矿工采集可通行
 */
declare let PATHING_TYPE_PEONHARVESTPATHING: pathingtype;
/**
 *  荒芜地表
 */
declare let PATHING_TYPE_BLIGHTPATHING: pathingtype;
/**
 *  可通行海面
 */
declare let PATHING_TYPE_FLOATABILITY: pathingtype;
/**
 *  两栖单位可通行
 */
declare let PATHING_TYPE_AMPHIBIOUSPATHING: pathingtype;
/**
 *  人族
 */
declare let RACE_PREF_HUMAN: racepreference;
/**
 *  兽族
 */
declare let RACE_PREF_ORC: racepreference;
/**
 *  暗夜精灵族
 */
declare let RACE_PREF_NIGHTELF: racepreference;
/**
 *  不死族
 */
declare let RACE_PREF_UNDEAD: racepreference;
declare let RACE_PREF_DEMON: racepreference;
/**
 *  随机
 */
declare let RACE_PREF_RANDOM: racepreference;
declare let RACE_PREF_USER_SELECTABLE: racepreference;
/**
 *  用户
 */
declare let MAP_CONTROL_USER: mapcontrol;
/**
 *  电脑
 */
declare let MAP_CONTROL_COMPUTER: mapcontrol;
/**
 *  可营救
 */
declare let MAP_CONTROL_RESCUABLE: mapcontrol;
/**
 *  中立被动
 */
declare let MAP_CONTROL_NEUTRAL: mapcontrol;
/**
 *  中立敌对
 */
declare let MAP_CONTROL_CREEP: mapcontrol;
/**
 *  没有
 */
declare let MAP_CONTROL_NONE: mapcontrol;
declare let GAME_TYPE_MELEE: gametype;
declare let GAME_TYPE_FFA: gametype;
declare let GAME_TYPE_USE_MAP_SETTINGS: gametype;
declare let GAME_TYPE_BLIZ: gametype;
declare let GAME_TYPE_ONE_ON_ONE: gametype;
declare let GAME_TYPE_TWO_TEAM_PLAY: gametype;
declare let GAME_TYPE_THREE_TEAM_PLAY: gametype;
declare let GAME_TYPE_FOUR_TEAM_PLAY: gametype;
/**
 *  可见度 - 隐藏地形
 */
declare let MAP_FOG_HIDE_TERRAIN: mapflag;
/**
 *  可见度 - 可见地形
 */
declare let MAP_FOG_MAP_EXPLORED: mapflag;
/**
 *  可见度 - 总是可见
 */
declare let MAP_FOG_ALWAYS_VISIBLE: mapflag;
/**
 *  生命障碍
 */
declare let MAP_USE_HANDICAPS: mapflag;
/**
 *  允许观看者
 */
declare let MAP_OBSERVERS: mapflag;
/**
 *  失败时作为观看者
 */
declare let MAP_OBSERVERS_ON_DEATH: mapflag;
declare let MAP_FIXED_COLORS: mapflag;
/**
 *  锁定资源交易
 */
declare let MAP_LOCK_RESOURCE_TRADING: mapflag;
/**
 *  限制盟友资源交易
 */
declare let MAP_RESOURCE_TRADING_ALLIES_ONLY: mapflag;
/**
 *  锁定联盟设置
 */
declare let MAP_LOCK_ALLIANCE_CHANGES: mapflag;
/**
 *  隐藏联盟设置
 */
declare let MAP_ALLIANCE_CHANGES_HIDDEN: mapflag;
declare let MAP_CHEATS: mapflag;
declare let MAP_CHEATS_HIDDEN: mapflag;
declare let MAP_LOCK_SPEED: mapflag;
declare let MAP_LOCK_RANDOM_SEED: mapflag;
declare let MAP_SHARED_ADVANCED_CONTROL: mapflag;
/**
 *  使用随机英雄
 */
declare let MAP_RANDOM_HERO: mapflag;
/**
 *  使用随机种族
 */
declare let MAP_RANDOM_RACES: mapflag;
/**
 *  地图转换
 */
declare let MAP_RELOADED: mapflag;
declare let MAP_PLACEMENT_RANDOM: placement;
declare let MAP_PLACEMENT_FIXED: placement;
declare let MAP_PLACEMENT_USE_MAP_SETTINGS: placement;
declare let MAP_PLACEMENT_TEAMS_TOGETHER: placement;
declare let MAP_LOC_PRIO_LOW: startlocprio;
declare let MAP_LOC_PRIO_HIGH: startlocprio;
declare let MAP_LOC_PRIO_NOT: startlocprio;
/**
 *  无
 */
declare let MAP_DENSITY_NONE: mapdensity;
/**
 *  轻
 */
declare let MAP_DENSITY_LIGHT: mapdensity;
/**
 *  中
 */
declare let MAP_DENSITY_MEDIUM: mapdensity;
/**
 *  重
 */
declare let MAP_DENSITY_HEAVY: mapdensity;
/**
 *  简单
 */
declare let MAP_DIFFICULTY_EASY: gamedifficulty;
/**
 *  普通
 */
declare let MAP_DIFFICULTY_NORMAL: gamedifficulty;
/**
 *  困难
 */
declare let MAP_DIFFICULTY_HARD: gamedifficulty;
declare let MAP_DIFFICULTY_INSANE: gamedifficulty;
/**
 *  最慢速
 */
declare let MAP_SPEED_SLOWEST: gamespeed;
/**
 *  慢速
 */
declare let MAP_SPEED_SLOW: gamespeed;
/**
 *  普通
 */
declare let MAP_SPEED_NORMAL: gamespeed;
/**
 *  快速
 */
declare let MAP_SPEED_FAST: gamespeed;
/**
 *  最快速
 */
declare let MAP_SPEED_FASTEST: gamespeed;
/**
 *  没有使用
 */
declare let PLAYER_SLOT_STATE_EMPTY: playerslotstate;
/**
 *  正在游戏
 */
declare let PLAYER_SLOT_STATE_PLAYING: playerslotstate;
/**
 *  已离开游戏
 */
declare let PLAYER_SLOT_STATE_LEFT: playerslotstate;
/**
 *  单位移动音效
 */
declare let SOUND_VOLUMEGROUP_UNITMOVEMENT: volumegroup;
/**
 *  单位回应音效
 */
declare let SOUND_VOLUMEGROUP_UNITSOUNDS: volumegroup;
/**
 *  战斗音效
 */
declare let SOUND_VOLUMEGROUP_COMBAT: volumegroup;
/**
 *  动画和技能音效
 */
declare let SOUND_VOLUMEGROUP_SPELLS: volumegroup;
/**
 *  用户界面音效
 */
declare let SOUND_VOLUMEGROUP_UI: volumegroup;
/**
 *  音乐
 */
declare let SOUND_VOLUMEGROUP_MUSIC: volumegroup;
/**
 *  环境音效
 */
declare let SOUND_VOLUMEGROUP_AMBIENTSOUNDS: volumegroup;
/**
 *  火焰音效
 */
declare let SOUND_VOLUMEGROUP_FIRE: volumegroup;
declare let GAME_STATE_DIVINE_INTERVENTION: igamestate;
declare let GAME_STATE_DISCONNECTED: igamestate;
declare let GAME_STATE_TIME_OF_DAY: fgamestate;
/**
 *  游戏得分
 */
declare let PLAYER_STATE_GAME_RESULT: playerstate;
/**
 *  现有黄金
 */
declare let PLAYER_STATE_RESOURCE_GOLD: playerstate;
/**
 *  现有木材
 */
declare let PLAYER_STATE_RESOURCE_LUMBER: playerstate;
/**
 *  剩余可用英雄
 */
declare let PLAYER_STATE_RESOURCE_HERO_TOKENS: playerstate;
/**
 *  可用人口数
 */
declare let PLAYER_STATE_RESOURCE_FOOD_CAP: playerstate;
/**
 *  已使用人口数
 */
declare let PLAYER_STATE_RESOURCE_FOOD_USED: playerstate;
/**
 *  最大人口上限
 */
declare let PLAYER_STATE_FOOD_CAP_CEILING: playerstate;
/**
 *  给予奖励
 */
declare let PLAYER_STATE_GIVES_BOUNTY: playerstate;
/**
 *  联盟胜利
 */
declare let PLAYER_STATE_ALLIED_VICTORY: playerstate;
declare let PLAYER_STATE_PLACED: playerstate;
declare let PLAYER_STATE_OBSERVER_ON_DEATH: playerstate;
declare let PLAYER_STATE_OBSERVER: playerstate;
/**
 *  不可跟随
 */
declare let PLAYER_STATE_UNFOLLOWABLE: playerstate;
/**
 *  金钱维修费率
 */
declare let PLAYER_STATE_GOLD_UPKEEP_RATE: playerstate;
/**
 *  木材维修费率
 */
declare let PLAYER_STATE_LUMBER_UPKEEP_RATE: playerstate;
/**
 *  总黄金采集量
 */
declare let PLAYER_STATE_GOLD_GATHERED: playerstate;
/**
 *  总木材采集量
 */
declare let PLAYER_STATE_LUMBER_GATHERED: playerstate;
declare let PLAYER_STATE_NO_CREEP_SLEEP: playerstate;
/**
 *  生命值
 */
declare let UNIT_STATE_LIFE: unitstate;
/**
 *  最大生命值
 */
declare let UNIT_STATE_MAX_LIFE: unitstate;
/**
 *  魔法值
 */
declare let UNIT_STATE_MANA: unitstate;
/**
 *  最大魔法值
 */
declare let UNIT_STATE_MAX_MANA: unitstate;
/**
 *  简单AI
 */
declare let AI_DIFFICULTY_NEWBIE: aidifficulty;
/**
 *  普通AI
 */
declare let AI_DIFFICULTY_NORMAL: aidifficulty;
/**
 *  疯狂AI
 */
declare let AI_DIFFICULTY_INSANE: aidifficulty;
/**
 *  训练单位数量
 */
declare let PLAYER_SCORE_UNITS_TRAINED: playerscore;
/**
 *  杀死单位数量
 */
declare let PLAYER_SCORE_UNITS_KILLED: playerscore;
/**
 *  建造建筑数量
 */
declare let PLAYER_SCORE_STRUCT_BUILT: playerscore;
/**
 *  摧毁建筑数量
 */
declare let PLAYER_SCORE_STRUCT_RAZED: playerscore;
/**
 *  科技百分比
 */
declare let PLAYER_SCORE_TECH_PERCENT: playerscore;
/**
 *  最大可用人口数
 */
declare let PLAYER_SCORE_FOOD_MAXPROD: playerscore;
/**
 *  最大使用人口数
 */
declare let PLAYER_SCORE_FOOD_MAXUSED: playerscore;
/**
 *  杀死英雄次数
 */
declare let PLAYER_SCORE_HEROES_KILLED: playerscore;
/**
 *  获得物品数量
 */
declare let PLAYER_SCORE_ITEMS_GAINED: playerscore;
/**
 *  雇佣单位数量
 */
declare let PLAYER_SCORE_MERCS_HIRED: playerscore;
/**
 *  总黄金采集量
 */
declare let PLAYER_SCORE_GOLD_MINED_TOTAL: playerscore;
/**
 *  实际黄金采集量(带有维修费)
 */
declare let PLAYER_SCORE_GOLD_MINED_UPKEEP: playerscore;
/**
 *  维修费损失的黄金数量
 */
declare let PLAYER_SCORE_GOLD_LOST_UPKEEP: playerscore;
/**
 *  所得税损失的黄金数量
 */
declare let PLAYER_SCORE_GOLD_LOST_TAX: playerscore;
/**
 *  给予盟友的黄金数量
 */
declare let PLAYER_SCORE_GOLD_GIVEN: playerscore;
/**
 *  从盟友那里收到的黄金数量
 */
declare let PLAYER_SCORE_GOLD_RECEIVED: playerscore;
/**
 *  总木材采集量
 */
declare let PLAYER_SCORE_LUMBER_TOTAL: playerscore;
/**
 *  维修费损失的木材数量
 */
declare let PLAYER_SCORE_LUMBER_LOST_UPKEEP: playerscore;
/**
 *  所得税损失的木材数量
 */
declare let PLAYER_SCORE_LUMBER_LOST_TAX: playerscore;
/**
 *  给予盟友的木材数量
 */
declare let PLAYER_SCORE_LUMBER_GIVEN: playerscore;
/**
 *  从盟友那里收到的木材数量
 */
declare let PLAYER_SCORE_LUMBER_RECEIVED: playerscore;
/**
 *  总单位得分
 */
declare let PLAYER_SCORE_UNIT_TOTAL: playerscore;
/**
 *  总英雄得分
 */
declare let PLAYER_SCORE_HERO_TOTAL: playerscore;
/**
 *  总资源得分
 */
declare let PLAYER_SCORE_RESOURCE_TOTAL: playerscore;
/**
 *  整体得分
 */
declare let PLAYER_SCORE_TOTAL: playerscore;
/**
 *  (000)游戏事件 - 游戏胜利
 */
declare let EVENT_GAME_VICTORY: gameevent;
/**
 *  (001)游戏事件 - 游戏结束
 */
declare let EVENT_GAME_END_LEVEL: gameevent;
/**
 *  (002)游戏事件 - 变量改变
 */
declare let EVENT_GAME_VARIABLE_LIMIT: gameevent;
/**
 *  (003)游戏事件 - 状态改变
 */
declare let EVENT_GAME_STATE_LIMIT: gameevent;
/**
 *  (004)游戏事件 - 计时器到期
 */
declare let EVENT_GAME_TIMER_EXPIRED: gameevent;
/**
 *  (005)游戏事件 - 进入区域
 */
declare let EVENT_GAME_ENTER_REGION: gameevent;
/**
 *  (006)游戏事件 - 离开区域
 */
declare let EVENT_GAME_LEAVE_REGION: gameevent;
/**
 *  (007)游戏事件 - 鼠标点击可追踪物
 */
declare let EVENT_GAME_TRACKABLE_HIT: gameevent;
/**
 *  (008)游戏事件 - 鼠标移动到可追踪物
 */
declare let EVENT_GAME_TRACKABLE_TRACK: gameevent;
/**
 *  (009)游戏事件 - 英雄技能按钮被点击
 */
declare let EVENT_GAME_SHOW_SKILL: gameevent;
declare let EVENT_GAME_BUILD_SUBMENU: gameevent;
/**
 *  (011)玩家事件 - 属性变化
 */
declare let EVENT_PLAYER_STATE_LIMIT: playerevent;
/**
 *  (012)玩家事件 - 联盟状态变化
 */
declare let EVENT_PLAYER_ALLIANCE_CHANGED: playerevent;
/**
 *  (013)玩家事件 - 游戏失败
 */
declare let EVENT_PLAYER_DEFEAT: playerevent;
/**
 *  (014)玩家事件 - 游戏胜利
 */
declare let EVENT_PLAYER_VICTORY: playerevent;
/**
 *  (015)玩家事件 - 离开游戏
 */
declare let EVENT_PLAYER_LEAVE: playerevent;
/**
 *  (016)玩家事件 - (废弃的事件)
 */
declare let EVENT_PLAYER_CHAT: playerevent;
/**
 *  (017)玩家事件 - 按下Esc键
 */
declare let EVENT_PLAYER_END_CINEMATIC: playerevent;
/**
 *  (018)玩家单位事件 - 被攻击
 */
declare let EVENT_PLAYER_UNIT_ATTACKED: playerunitevent;
/**
 *  (019)玩家单位事件 - 被营救
 */
declare let EVENT_PLAYER_UNIT_RESCUED: playerunitevent;
//任意单位死亡事件
/**
 *  (020)玩家单位事件 - 死亡
 */
declare let EVENT_PLAYER_UNIT_DEATH: playerunitevent;
/**
 *  (021)玩家单位事件 - 开始腐化
 */
declare let EVENT_PLAYER_UNIT_DECAY: playerunitevent;
/**
 *  (022)玩家单位事件 - 被侦测到
 */
declare let EVENT_PLAYER_UNIT_DETECTED: playerunitevent;
/**
 *  (023)玩家单位事件 - 被隐藏
 */
declare let EVENT_PLAYER_UNIT_HIDDEN: playerunitevent;
/**
 *  (024)玩家单位事件 - 被选择
 */
declare let EVENT_PLAYER_UNIT_SELECTED: playerunitevent;
/**
 *  (025)玩家单位事件 - 被取消选择
 */
declare let EVENT_PLAYER_UNIT_DESELECTED: playerunitevent;
/**
 *  (026)玩家单位事件 - 开始被建造
 */
declare let EVENT_PLAYER_UNIT_CONSTRUCT_START: playerunitevent;
/**
 *  (027)玩家单位事件 - 被取消建造
 */
declare let EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL: playerunitevent;
/**
 *  (028)玩家单位事件 - 完成建造
 */
declare let EVENT_PLAYER_UNIT_CONSTRUCT_FINISH: playerunitevent;
/**
 *  (029)玩家单位事件 - 开始建筑升级
 */
declare let EVENT_PLAYER_UNIT_UPGRADE_START: playerunitevent;
/**
 *  (030)玩家单位事件 - 取消建筑升级
 */
declare let EVENT_PLAYER_UNIT_UPGRADE_CANCEL: playerunitevent;
/**
 *  (031)玩家单位事件 - 完成建筑升级
 */
declare let EVENT_PLAYER_UNIT_UPGRADE_FINISH: playerunitevent;
/**
 *  (032)玩家单位事件 - 开始训练单位
 */
declare let EVENT_PLAYER_UNIT_TRAIN_START: playerunitevent;
/**
 *  (033)玩家单位事件 - 取消训练单位
 */
declare let EVENT_PLAYER_UNIT_TRAIN_CANCEL: playerunitevent;
/**
 *  (034)玩家单位事件 - 完成训练单位
 */
declare let EVENT_PLAYER_UNIT_TRAIN_FINISH: playerunitevent;
/**
 *  (035)玩家单位事件 - 开始研究科技
 */
declare let EVENT_PLAYER_UNIT_RESEARCH_START: playerunitevent;
/**
 *  (036)玩家单位事件 - 取消研究科技
 */
declare let EVENT_PLAYER_UNIT_RESEARCH_CANCEL: playerunitevent;
/**
 *  (037)玩家单位事件 - 完成研究科技
 */
declare let EVENT_PLAYER_UNIT_RESEARCH_FINISH: playerunitevent;
/**
 *  (038)玩家单位事件 - 发布无目标指令
 */
declare let EVENT_PLAYER_UNIT_ISSUED_ORDER: playerunitevent;
/**
 *  (039)玩家单位事件 - 发布指定点目标指令
 */
declare let EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER: playerunitevent;
/**
 *  (040)玩家单位事件 - 发布指定物体目标指令
 *  UnitDropItemSlot 也会触发调用这个
 */
declare let EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER: playerunitevent;
declare let EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER: playerunitevent;
/**
 *  (041)玩家单位事件 - 提升等级
 */
declare let EVENT_PLAYER_HERO_LEVEL: playerunitevent;
/**
 *  (042)玩家单位事件 - 学习技能
 */
declare let EVENT_PLAYER_HERO_SKILL: playerunitevent;
/**
 *  (043)玩家单位事件 - 变得可重生
 */
declare let EVENT_PLAYER_HERO_REVIVABLE: playerunitevent;
/**
 *  (044)玩家单位事件 - 开始复活英雄
 */
declare let EVENT_PLAYER_HERO_REVIVE_START: playerunitevent;
/**
 *  (045)玩家单位事件 - 取消复活英雄
 */
declare let EVENT_PLAYER_HERO_REVIVE_CANCEL: playerunitevent;
/**
 *  (046)玩家单位事件 - 完成复活英雄
 */
declare let EVENT_PLAYER_HERO_REVIVE_FINISH: playerunitevent;
/**
 *  (047)玩家单位事件 - 被召唤
 */
declare let EVENT_PLAYER_UNIT_SUMMON: playerunitevent;
/**
 *  (048)玩家单位事件 - 丢弃物品
 */
declare let EVENT_PLAYER_UNIT_DROP_ITEM: playerunitevent;
/**
 *  (049)玩家单位事件 - 获得物品
 */
declare let EVENT_PLAYER_UNIT_PICKUP_ITEM: playerunitevent;
/**
 *  (050)玩家单位事件 - 使用物品
 */
declare let EVENT_PLAYER_UNIT_USE_ITEM: playerunitevent;
/**
 *  (051)玩家单位事件 - 被运输机装载
 */
declare let EVENT_PLAYER_UNIT_LOADED: playerunitevent;
/**
 *  (052)单位事件 - 接受伤害
 */
declare let EVENT_UNIT_DAMAGED: unitevent;
/**
 *  (053)单位事件 - 死亡
 */
declare let EVENT_UNIT_DEATH: unitevent;
/**
 *  (054)单位事件 - 开始腐化
 */
declare let EVENT_UNIT_DECAY: unitevent;
/**
 *  (055)单位事件 - 被侦测到
 */
declare let EVENT_UNIT_DETECTED: unitevent;
/**
 *  (056)单位事件 - 被隐藏
 */
declare let EVENT_UNIT_HIDDEN: unitevent;
/**
 *  (057)单位事件 - 被选择
 */
declare let EVENT_UNIT_SELECTED: unitevent;
/**
 *  (058)单位事件 - 被取消选择
 */
declare let EVENT_UNIT_DESELECTED: unitevent;
/**
 *  (059)单位事件 - 生命值/魔法值发生变化
 */
declare let EVENT_UNIT_STATE_LIMIT: unitevent;
/**
 *  (060)单位事件 - 注意到攻击目标
 */
declare let EVENT_UNIT_ACQUIRED_TARGET: unitevent;
/**
 *  (061)单位事件 - 获取攻击目标
 */
declare let EVENT_UNIT_TARGET_IN_RANGE: unitevent;
/**
 *  (062)单位事件 - 被攻击
 */
declare let EVENT_UNIT_ATTACKED: unitevent;
/**
 *  (063)单位事件 - 被营救
 */
declare let EVENT_UNIT_RESCUED: unitevent;
/**
 *  (064)单位事件 - 被取消建造
 */
declare let EVENT_UNIT_CONSTRUCT_CANCEL: unitevent;
/**
 *  (065)单位事件 - 完成建造
 */
declare let EVENT_UNIT_CONSTRUCT_FINISH: unitevent;
/**
 *  (066)单位事件 - 开始建筑升级
 */
declare let EVENT_UNIT_UPGRADE_START: unitevent;
/**
 *  (067)单位事件 - 取消建筑升级
 */
declare let EVENT_UNIT_UPGRADE_CANCEL: unitevent;
/**
 *  (068)单位事件 - 完成建筑升级
 */
declare let EVENT_UNIT_UPGRADE_FINISH: unitevent;
/**
 *  (069)单位事件 - 开始训练单位
 */
declare let EVENT_UNIT_TRAIN_START: unitevent;
/**
 *  (070)单位事件 - 取消训练单位
 */
declare let EVENT_UNIT_TRAIN_CANCEL: unitevent;
/**
 *  (071)单位事件 - 完成训练单位
 */
declare let EVENT_UNIT_TRAIN_FINISH: unitevent;
/**
 *  (072)单位事件 - 开始研究科技
 */
declare let EVENT_UNIT_RESEARCH_START: unitevent;
/**
 *  (073)单位事件 - 取消研究科技
 */
declare let EVENT_UNIT_RESEARCH_CANCEL: unitevent;
/**
 *  (074)单位事件 - 完成研究科技
 */
declare let EVENT_UNIT_RESEARCH_FINISH: unitevent;
/**
 *  (075)单位事件 - 发布无目标指令
 */
declare let EVENT_UNIT_ISSUED_ORDER: unitevent;
/**
 *  (076)单位事件 - 发布指定点目标指令
 */
declare let EVENT_UNIT_ISSUED_POINT_ORDER: unitevent;
/**
 *  (077)单位事件 - 发布指定物体目标指令
 */
declare let EVENT_UNIT_ISSUED_TARGET_ORDER: unitevent;
/**
 *  (078)单位事件 - 提升等级
 */
declare let EVENT_UNIT_HERO_LEVEL: unitevent;
/**
 *  (079)单位事件 - 学习技能
 */
declare let EVENT_UNIT_HERO_SKILL: unitevent;
/**
 *  (080)单位事件 - 变得可重生
 */
declare let EVENT_UNIT_HERO_REVIVABLE: unitevent;
/**
 *  (081)单位事件 - 开始复活英雄
 */
declare let EVENT_UNIT_HERO_REVIVE_START: unitevent;
/**
 *  (082)单位事件 - 取消复活英雄
 */
declare let EVENT_UNIT_HERO_REVIVE_CANCEL: unitevent;
/**
 *  (083)单位事件 - 完成复活英雄
 */
declare let EVENT_UNIT_HERO_REVIVE_FINISH: unitevent;
/**
 *  召唤一个单位
 */
declare let EVENT_UNIT_SUMMON: unitevent;
/**
 *  (085)单位事件 - 丢弃物品
 */
declare let EVENT_UNIT_DROP_ITEM: unitevent;
/**
 *  (086)单位事件 - 获得物品
 */
declare let EVENT_UNIT_PICKUP_ITEM: unitevent;
/**
 *  (087)单位事件 - 使用物品
 */
declare let EVENT_UNIT_USE_ITEM: unitevent;
/**
 *  (088)单位事件 - 被运输机装载
 */
declare let EVENT_UNIT_LOADED: unitevent;
/**
 *  (089)widget事件 - 死亡
 */
declare let EVENT_WIDGET_DEATH: widgetevent;
/**
 *  (090)对话框事件 - 对话框按钮被点击
 */
declare let EVENT_DIALOG_BUTTON_CLICK: dialogevent;
/**
 *  (091)对话框事件 - 对话框被点击
 */
declare let EVENT_DIALOG_CLICK: dialogevent;
/**
 *  (256)游戏事件 - 游戏读档
 */
declare let EVENT_GAME_LOADED: gameevent;
/**
 *  (257)游戏事件 - 游戏将在现在结束
 */
declare let EVENT_GAME_TOURNAMENT_FINISH_SOON: gameevent;
/**
 *  (258)游戏事件 - 游戏将在不久结束
 */
declare let EVENT_GAME_TOURNAMENT_FINISH_NOW: gameevent;
/**
 *  (259)游戏事件 - 游戏存档
 */
declare let EVENT_GAME_SAVE: gameevent;
/**
 *  (261)玩家键盘事件 - 按下Left键
 */
declare let EVENT_PLAYER_ARROW_LEFT_DOWN: playerevent;
/**
 *  (262)玩家键盘事件 - 松开Left键
 */
declare let EVENT_PLAYER_ARROW_LEFT_UP: playerevent;
/**
 *  (263)玩家键盘事件 - 按下Right键
 */
declare let EVENT_PLAYER_ARROW_RIGHT_DOWN: playerevent;
/**
 *  (264)玩家键盘事件 - 松开Right键
 */
declare let EVENT_PLAYER_ARROW_RIGHT_UP: playerevent;
/**
 *  (265)玩家键盘事件 - 按下Down键
 */
declare let EVENT_PLAYER_ARROW_DOWN_DOWN: playerevent;
/**
 *  (266)玩家键盘事件 - 松开Down键
 */
declare let EVENT_PLAYER_ARROW_DOWN_UP: playerevent;
/**
 *  (267)玩家键盘事件 - 按下Up键
 */
declare let EVENT_PLAYER_ARROW_UP_DOWN: playerevent;
/**
 *  (268)玩家键盘事件 - 松开Up键
 */
declare let EVENT_PLAYER_ARROW_UP_UP: playerevent;
/**
 *  (269)玩家单位事件 - 出售单位
 */
declare let EVENT_PLAYER_UNIT_SELL: playerunitevent;
/**
 *  (270)玩家单位事件 - 改变所有者
 */
declare let EVENT_PLAYER_UNIT_CHANGE_OWNER: playerunitevent;
/**
 *  (271)玩家单位事件 - 出售物品
 */
declare let EVENT_PLAYER_UNIT_SELL_ITEM: playerunitevent;
/**
 *  (272)玩家单位事件 - 准备施放技能
 */
declare let EVENT_PLAYER_UNIT_SPELL_CHANNEL: playerunitevent;
/**
 *  (273)玩家单位事件 - 开始施放技能
 */
declare let EVENT_PLAYER_UNIT_SPELL_CAST: playerunitevent;
/**
 *  (273)玩家单位事件 - 发动技能效果
 */
declare let EVENT_PLAYER_UNIT_SPELL_EFFECT: playerunitevent;
/**
 *  (275)玩家单位事件 - 施放技能结束
 */
declare let EVENT_PLAYER_UNIT_SPELL_FINISH: playerunitevent;
/**
 *  (276)玩家单位事件 - 停止施放技能
 */
declare let EVENT_PLAYER_UNIT_SPELL_ENDCAST: playerunitevent;
/**
 *  (277)玩家单位事件 - 抵押物品
 */
declare let EVENT_PLAYER_UNIT_PAWN_ITEM: playerunitevent;
/**
 *  (286)单位事件 - 出售单位
 */
declare let EVENT_UNIT_SELL: unitevent;
/**
 *  (287)单位事件 - 改变所有者
 */
declare let EVENT_UNIT_CHANGE_OWNER: unitevent;
/**
 *  出售物品
 */
declare let EVENT_UNIT_SELL_ITEM: unitevent;
/**
 *  (289)单位事件 - 准备施放技能
 */
declare let EVENT_UNIT_SPELL_CHANNEL: unitevent;
/**
 *  (290)单位事件 - 开始施放技能
 */
declare let EVENT_UNIT_SPELL_CAST: unitevent;
/**
 *  (291)单位事件 - 发动技能效果
 */
declare let EVENT_UNIT_SPELL_EFFECT: unitevent;
/**
 *  (292)单位事件 - 施放技能结束
 */
declare let EVENT_UNIT_SPELL_FINISH: unitevent;
/**
 *  (293)单位事件 - 停止施放技能
 */
declare let EVENT_UNIT_SPELL_ENDCAST: unitevent;
/**
 *  (294)单位事件 - 抵押物品
 */
declare let EVENT_UNIT_PAWN_ITEM: unitevent;
/**
 *  小于
 */
declare let LESS_THAN: limitop;
/**
 *  小于或等于
 */
declare let LESS_THAN_OR_EQUAL: limitop;
/**
 *  等于
 */
declare let EQUAL: limitop;
/**
 *  大于或等于
 */
declare let GREATER_THAN_OR_EQUAL: limitop;
/**
 *  大于
 */
declare let GREATER_THAN: limitop;
/**
 *  不等于
 */
declare let NOT_EQUAL: limitop;
/**
 *  英雄
 */
declare let UNIT_TYPE_HERO: unittype;
/**
 *  死亡的
 */
declare let UNIT_TYPE_DEAD: unittype;
/**
 *  建筑
 */
declare let UNIT_TYPE_STRUCTURE: unittype;
/**
 *  飞行单位
 */
declare let UNIT_TYPE_FLYING: unittype;
/**
 *  地面单位
 */
declare let UNIT_TYPE_GROUND: unittype;
/**
 *  可攻击飞行物的单位
 */
declare let UNIT_TYPE_ATTACKS_FLYING: unittype;
/**
 *  可攻击地面的单位
 */
declare let UNIT_TYPE_ATTACKS_GROUND: unittype;
/**
 *  近战单位
 */
declare let UNIT_TYPE_MELEE_ATTACKER: unittype;
/**
 *  远程单位
 */
declare let UNIT_TYPE_RANGED_ATTACKER: unittype;
/**
 *  泰坦族
 */
declare let UNIT_TYPE_GIANT: unittype;
/**
 *  召唤单位
 */
declare let UNIT_TYPE_SUMMONED: unittype;
/**
 *  被枷锁的
 */
declare let UNIT_TYPE_STUNNED: unittype;
/**
 *  附带瘟疫的
 */
declare let UNIT_TYPE_PLAGUED: unittype;
/**
 *  被束缚的
 */
declare let UNIT_TYPE_SNARED: unittype;
/**
 *  不死族
 */
declare let UNIT_TYPE_UNDEAD: unittype;
/**
 *  机械
 */
declare let UNIT_TYPE_MECHANICAL: unittype;
/**
 *  工人
 */
declare let UNIT_TYPE_PEON: unittype;
/**
 *  自爆工兵
 */
declare let UNIT_TYPE_SAPPER: unittype;
/**
 *  城镇大厅
 */
declare let UNIT_TYPE_TOWNHALL: unittype;
/**
 *  古树
 */
declare let UNIT_TYPE_ANCIENT: unittype;
/**
 *  牛头人
 */
declare let UNIT_TYPE_TAUREN: unittype;
/**
 *  中毒的
 */
declare let UNIT_TYPE_POISONED: unittype;
/**
 *  被变形的
 */
declare let UNIT_TYPE_POLYMORPHED: unittype;
/**
 *  被催眠的
 */
declare let UNIT_TYPE_SLEEPING: unittype;
/**
 *  有抗性皮肤
 */
declare let UNIT_TYPE_RESISTANT: unittype;
/**
 *  处于虚无状态
 */
declare let UNIT_TYPE_ETHEREAL: unittype;
/**
 *  魔法免疫
 */
declare let UNIT_TYPE_MAGIC_IMMUNE: unittype;
/**
 *  永久
 */
declare let ITEM_TYPE_PERMANENT: itemtype;
/**
 *  可充
 */
declare let ITEM_TYPE_CHARGED: itemtype;
/**
 *  能量提升
 */
declare let ITEM_TYPE_POWERUP: itemtype;
/**
 *  人造
 */
declare let ITEM_TYPE_ARTIFACT: itemtype;
/**
 *  可购买
 */
declare let ITEM_TYPE_PURCHASABLE: itemtype;
/**
 *  战役
 */
declare let ITEM_TYPE_CAMPAIGN: itemtype;
/**
 *  混杂
 */
declare let ITEM_TYPE_MISCELLANEOUS: itemtype;
/**
 *  未知
 */
declare let ITEM_TYPE_UNKNOWN: itemtype;
/**
 *  任何
 */
declare let ITEM_TYPE_ANY: itemtype;
declare let ITEM_TYPE_TOME: itemtype;
/**
 *  镜头距离(距离到目标)
 */
declare let CAMERA_FIELD_TARGET_DISTANCE: camerafield;
/**
 *  远景截断距离(远景剪裁)
 */
declare let CAMERA_FIELD_FARZ: camerafield;
/**
 *  X轴旋转角度(水平角度)
 */
declare let CAMERA_FIELD_ANGLE_OF_ATTACK: camerafield;
/**
 *  镜头区域(观察区域)
 */
declare let CAMERA_FIELD_FIELD_OF_VIEW: camerafield;
/**
 *  Y轴旋转角度(滚动)
 */
declare let CAMERA_FIELD_ROLL: camerafield;
/**
 *  Z轴旋转角度(旋转)
 */
declare let CAMERA_FIELD_ROTATION: camerafield;
/**
 *  Z轴偏移(高度位移)
 */
declare let CAMERA_FIELD_ZOFFSET: camerafield;
/**
 *  无混合物
 */
declare let BLEND_MODE_NONE: blendmode;
declare let BLEND_MODE_DONT_CARE: blendmode;
/**
 *  关键的Alpha混合物
 */
declare let BLEND_MODE_KEYALPHA: blendmode;
/**
 *  普通混合物
 */
declare let BLEND_MODE_BLEND: blendmode;
/**
 *  附加的混合物
 */
declare let BLEND_MODE_ADDITIVE: blendmode;
/**
 *  调整的混合物
 */
declare let BLEND_MODE_MODULATE: blendmode;
/**
 *  调整的2倍混合物
 */
declare let BLEND_MODE_MODULATE_2X: blendmode;
/**
 *  普通的
 */
declare let RARITY_FREQUENT: raritycontrol;
declare let RARITY_RARE: raritycontrol;
declare let TEXMAP_FLAG_NONE: texmapflags;
declare let TEXMAP_FLAG_WRAP_U: texmapflags;
declare let TEXMAP_FLAG_WRAP_V: texmapflags;
declare let TEXMAP_FLAG_WRAP_UV: texmapflags;
/**
 *  黑色迷雾
 */
declare let FOG_OF_WAR_MASKED: fogstate;
/**
 *  战争迷雾
 */
declare let FOG_OF_WAR_FOGGED: fogstate;
/**
 *  可见
 */
declare let FOG_OF_WAR_VISIBLE: fogstate;
declare let CAMERA_MARGIN_LEFT: number;
declare let CAMERA_MARGIN_RIGHT: number;
declare let CAMERA_MARGIN_TOP: number;
declare let CAMERA_MARGIN_BOTTOM: number;
/**
 *  点目标效果
 */
declare let EFFECT_TYPE_EFFECT: effecttype;
/**
 *  目标效果
 */
declare let EFFECT_TYPE_TARGET: effecttype;
/**
 *  施法者效果
 */
declare let EFFECT_TYPE_CASTER: effecttype;
/**
 *  特殊效果
 */
declare let EFFECT_TYPE_SPECIAL: effecttype;
/**
 *  区域效果
 */
declare let EFFECT_TYPE_AREA_EFFECT: effecttype;
/**
 *  投射物效果
 */
declare let EFFECT_TYPE_MISSILE: effecttype;
/**
 *  闪电效果
 */
declare let EFFECT_TYPE_LIGHTNING: effecttype;
/**
 *  音效
 */
declare let SOUND_TYPE_EFFECT: soundtype;
/**
 *  循环音效
 */
declare let SOUND_TYPE_EFFECT_LOOPED: soundtype;
