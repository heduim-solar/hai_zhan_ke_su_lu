/** @noSelfInFile */


declare function DzTriggerRegisterMouseEventTrg(trg: trigger, status: number, btn: number): void;

declare function DzTriggerRegisterKeyEventTrg(trg: trigger, status: number, btn: number): void;

declare function DzTriggerRegisterMouseMoveEventTrg(trg: trigger): void;

declare function DzTriggerRegisterMouseWheelEventTrg(trg: trigger): void;

declare function DzTriggerRegisterWindowResizeEventTrg(trg: trigger): void;

declare function DzF2I(i: any): number;

declare function DzI2F(i: any): number;

declare function DzK2I(i: any): number;

declare function DzI2K(i: any): number;

declare function DzGetLocale(...args: any[]): any;

declare function DzGetClientWidth(): any;

declare function DzFrameGetName(...args: any[]): any;


declare function RequestExtraIntegerData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): number;

declare function RequestExtraBooleanData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): boolean;

declare function RequestExtraStringData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): string;

declare function RequestExtraRealData(dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): number;


/**
 * addons
 */


declare function DzAPI_Map_IsPlatformVIP(whichPlayer: player): boolean;

declare function DzAPI_Map_Global_GetStoreString(key: string): string;

declare function DzAPI_Map_Global_StoreString(key: string, value: string): void;

declare function DzAPI_Map_Global_ChangeMsg(trig: trigger): void;

declare function DzAPI_Map_ServerArchive(whichPlayer: player, key: string): string;

declare function DzAPI_Map_SaveServerArchive(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_IsRPGQuickMatch(): boolean;

declare function DzAPI_Map_GetMallItemCount(whichPlayer: player, key: string): number;

declare function DzAPI_Map_ConsumeMallItem(whichPlayer: player, key: string, count: number): boolean;

declare function DzAPI_Map_EnablePlatformSettings(whichPlayer: player, option: number, enable: boolean): boolean;

declare function DzAPI_Map_IsBuyReforged(whichPlayer: player): boolean;

declare function GetPlayerServerValueSuccess(whichPlayer: player): boolean;

/**@deprecated*/
declare function DzAPI_Map_StoreIntegerEX(whichPlayer: player, key: string, value: number): void;

/**@deprecated*/
declare function DzAPI_Map_GetStoredIntegerEX(whichPlayer: player, key: string): number;

declare function DzAPI_Map_StoreInteger(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_GetStoredInteger(whichPlayer: player, key: string): number;

declare function DzAPI_Map_CommentTotalCount1(whichPlayer: player, id: number): number;

declare function DzAPI_Map_StoreReal(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_GetStoredReal(whichPlayer: player, key: string): number;

declare function DzAPI_Map_StoreBoolean(whichPlayer: player, key: string, value: boolean): void;

declare function DzAPI_Map_GetStoredBoolean(whichPlayer: player, key: string): boolean;

declare function DzAPI_Map_StoreString(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_GetStoredString(whichPlayer: player, key: string): string;

/**@deprecated*/
declare function DzAPI_Map_StoreStringEX(whichPlayer: player, key: string, value: string): void;

/**@deprecated*/
declare function DzAPI_Map_GetStoredStringEX(whichPlayer: player, key: string): string;

declare function DzAPI_Map_GetStoredUnitType(whichPlayer: player, key: string): number;

declare function DzAPI_Map_GetStoredAbilityId(whichPlayer: player, key: string): number;

declare function DzAPI_Map_FlushStoredMission(whichPlayer: player, key: string): void;

declare function DzAPI_Map_Ladder_SubmitIntegerData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Stat_SubmitUnitIdData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Stat_SubmitUnitData(whichPlayer: player, key: string, value: unit): void;

declare function DzAPI_Map_Ladder_SubmitAblityIdData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Ladder_SubmitItemIdData(whichPlayer: player, key: string, value: number): void;

declare function DzAPI_Map_Ladder_SubmitItemData(whichPlayer: player, key: string, value: item): void;

declare function DzAPI_Map_Ladder_SubmitBooleanData(whichPlayer: player, key: string, value: boolean): void;

declare function DzAPI_Map_Ladder_SubmitTitle(whichPlayer: player, value: string): void;

declare function DzAPI_Map_Ladder_SubmitPlayerRank(whichPlayer: player, value: number): void;

declare function DzAPI_Map_Ladder_SubmitPlayerExtraExp(whichPlayer: player, value: number): void;

declare function DzAPI_Map_PlayedGames(whichPlayer: player): number;

declare function DzAPI_Map_CommentCount(whichPlayer: player): number;

declare function DzAPI_Map_FriendCount(whichPlayer: player): number;

declare function DzAPI_Map_IsConnoisseur(whichPlayer: player): boolean;

declare function DzAPI_Map_IsBattleNetAccount(whichPlayer: player): boolean;

declare function DzAPI_Map_IsAuthor(whichPlayer: player): boolean;

declare function DzAPI_Map_CommentTotalCount(): number;

/**
 * 平台统计 埋点
 * @param whichPlayer
 * @param eventKey
 * @param eventType
 * @param value
 * @constructor
 */
declare function DzAPI_Map_Statistics(whichPlayer: player, eventKey: string, eventType: string, value: number): void;

declare function DzAPI_Map_Returns(whichPlayer: player, label: number): boolean;

declare function DzAPI_Map_ContinuousCount(whichPlayer: player, id: number): number;

// IsPlayer,                      //是否为玩家
declare function DzAPI_Map_IsPlayer(whichPlayer: player): boolean;

// MapsTotalPlayed,               //所有地图的总游戏时长
declare function DzAPI_Map_MapsTotalPlayed(whichPlayer: player): number;

// MapsLevel,                    //指定地图的地图等级
declare function DzAPI_Map_MapsLevel(whichPlayer: player, mapId: number): number;

// MapsConsumeGold,              //所有地图的金币消耗
declare function DzAPI_Map_MapsConsumeGold(whichPlayer: player, mapId: number): number;

// MapsConsumeLumber,            //所有地图的木材消耗
declare function DzAPI_Map_MapsConsumeLumber(whichPlayer: player, mapId: number): number;

// MapsConsumeLv1,               //消费 1-199
declare function DzAPI_Map_MapsConsumeLv1(whichPlayer: player, mapId: number): boolean;

// MapsConsumeLv2,               //消费 200-499
declare function DzAPI_Map_MapsConsumeLv2(whichPlayer: player, mapId: number): boolean;

// MapsConsumeLv3,               //消费 500~999
declare function DzAPI_Map_MapsConsumeLv3(whichPlayer: player, mapId: number): boolean;

// MapsConsumeLv4,               //消费 1000+
declare function DzAPI_Map_MapsConsumeLv4(whichPlayer: player, mapId: number): boolean;

//获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
declare function DzAPI_Map_GetForumData(whichPlayer: player, whichData: number): number;

declare function DzAPI_Map_OpenMall(whichPlayer: player, whichkey: string): boolean;

declare function DzAPI_Map_GameResult_CommitData(whichPlayer: player, key: string, value: string): void;

//游戏结算
declare function DzAPI_Map_GameResult_CommitTitle(whichPlayer: player, value: string): void;

declare function DzAPI_Map_GameResult_CommitPlayerRank(whichPlayer: player, value: number): void;

declare function DzAPI_Map_GameResult_CommitGameMode(value: string): void;

declare function DzAPI_Map_GameResult_CommitGameResult(whichPlayer: player, value: number): void;

//实时购买
/**
 * 注册实时购买商品事件
 */
declare function DzTriggerRegisterMallItemSyncData(trig: trigger): void;

/**
 * 获得实时购买商品的玩家
 */
declare function DzGetTriggerMallItemPlayer(): player;

/**
 * 获得实时购买的商品Key
 */
declare function DzGetTriggerMallItem(): string;

/**
 *
 */

declare function DzEvent_Unit_Hired(...args: any[]): any;

declare function DzEvent_Building_Dead(...args: any[]): any;


declare function DzAPI_Map_ChangeStoreItemCount(...args: any[]): any;


declare function DzEvent_Tech_Start(...args: any[]): any;

declare function DzAPI_Map_UpdatePlayerHero(...args: any[]): any;

declare function DzGetPlayerName(...args: any[]): any;


declare function DzDebugString(...args: any[]): any;


declare function DzEvent_Hero_Dead(...args: any[]): any;


declare function DzEvent_Item_Pickup(...args: any[]): any;


declare function DzUnitLearningSkill(...args: any[]): any;


declare function DzAPI_Map_ChangeStoreItemCoolDown(...args: any[]): any;

declare function DzAPI_Map_ToggleStore(...args: any[]): any;

declare function DzEvent_Unit_Start(...args: any[]): any;


declare function DzAPI_Map_GetUserID(...args: any[]): any;

declare function DzAPI_Map_GetPlatformVIP(...args: any[]): any;


declare function DzSetParams(...args: any[]): any;

declare function DzEvent_Building_Cancel(...args: any[]): any;

declare function DzDotaInfo_Item_HE(...args: any[]): any;

declare function EXSetAbilityAEmeDataA(...args: any[]): any;

declare function DzGetPlayerSelectedHero(...args: any[]): any;

declare function EXGetBuffDataString(...args: any[]): any;

declare function DzGetPlayerInitGold(...args: any[]): any;

declare function DzGetGameMode(...args: any[]): any;


declare function DzDotaInfo_IsPlayerRandom(...args: any[]): any;

declare function DzDotaInfo_IsRepicked(...args: any[]): any;

declare function DzDotaInfo_Item_TM(...args: any[]): any;


declare function DzDotaInfo_Item(...args: any[]): any;

declare function DzEvent_Building_Start(...args: any[]): any;


declare function DzEvent_Unit_Dead(...args: any[]): any;

declare function DzEvent_Unit_Cancel(...args: any[]): any;

declare function DzEvent_Unit_Finish(...args: any[]): any;

declare function DzGetClientHeight(...args: any[]): any;

declare function DzEvent_Tech_Cancel(...args: any[]): any;


declare function DzEvent_Tech_Finish(...args: any[]): any;


declare function DzEvent_Hero_Level(...args: any[]): any;


declare function DzEvent_Unit_ChangeOwner(...args: any[]): any;

declare function DzEvent_Item_Drop(...args: any[]): any;

declare function DzEvent_Item_Use(...args: any[]): any;

declare function DzEvent_Item_Sell(...args: any[]): any;


declare function DzPlatform_HasGameOver(...args: any[]): any;

declare function DzPlatform_HasGameOver_Player(...args: any[]): any;

declare function DzPlatform_GameStart(...args: any[]): any;

/**
 * ui
 */
/**
 * 保存值
 */
declare function DzAPI_Map_SaveServerValue(whichPlayer: player, key: string, value: string): boolean;

/**
 * 获取值
 */
declare function DzAPI_Map_GetServerValue(whichPlayer: player, key: string): string;

declare function DzAPI_Map_Ladder_SetStat(whichPlayer: player, key: string, value: string): void;

/**
 * rpg阶梯
 */
declare function DzAPI_Map_IsRPGLadder(): boolean;

/**
 * 游戏开始时间
 */
declare function DzAPI_Map_GetGameStartTime(): number;

declare function DzAPI_Map_Stat_SetStat(whichPlayer: player, key: string, value: string): void;

/**
 * 匹配类型
 */
declare function DzAPI_Map_GetMatchType(): number;

/**
 * 玩家状态
 */
declare function DzAPI_Map_Ladder_SetPlayerStat(whichPlayer: player, key: string, value: string): void;

declare function DzAPI_Map_GetServerValueErrorCode(whichPlayer: player): number;

/**
 * 得到阶梯水平
 */
declare function DzAPI_Map_GetLadderLevel(whichPlayer: player): number;

/**
 * 红名vip
 */
declare function DzAPI_Map_IsRedVIP(whichPlayer: player): boolean;

/**
 * 蓝名vip
 */
declare function DzAPI_Map_IsBlueVIP(whichPlayer: player): boolean;

/**
 * 得到梯阶
 */
declare function DzAPI_Map_GetLadderRank(whichPlayer: player): number;

/**
 * 地图排名
 */
declare function DzAPI_Map_GetMapLevelRank(whichPlayer: player): number;

/**
 * 工会名称
 */
declare function DzAPI_Map_GetGuildName(whichPlayer: player): string;

/**
 * 工会权限
 */
declare function DzAPI_Map_GetGuildRole(whichPlayer: player): number;

/**
 * rpg大厅
 */
declare function DzAPI_Map_IsRPGLobby(): boolean;

/**
 * 获取地图等级
 */
declare function DzAPI_Map_GetMapLevel(whichPlayer: player): number;

/**
 * 任务完成
 */
declare function DzAPI_Map_MissionComplete(whichPlayer: player, key: string, value: string): void;

/**
 * 活动数据
 */
declare function DzAPI_Map_GetActivityData(): string;

/**
 * 地图配置
 */
declare function DzAPI_Map_GetMapConfig(key: string): string;

/**
 * 是否有购物中心项目
 */
declare function DzAPI_Map_HasMallItem(whichPlayer: player, key: string): boolean;

declare function DzAPI_Map_SavePublicArchive(whichPlayer: player, key: string, value: string): boolean;

declare function DzAPI_Map_GetPublicArchive(whichPlayer: player, key: string): string;

declare function DzAPI_Map_UseConsumablesItem(whichPlayer: player, key: string): void;

/**
 * Orpg触发
 */
declare function DzAPI_Map_OrpgTrigger(whichPlayer: player, key: string): void;

/**
 * 获取服务器存档
 */
declare function DzAPI_Map_GetServerArchiveDrop(whichPlayer: player, key: string): string;

/**
 * 服务器存档设备
 */
declare function DzAPI_Map_GetServerArchiveEquip(whichPlayer: player, key: string): number;

/**
 * 获取鼠标在游戏内的坐标X
 */
declare function DzGetMouseTerrainX(): number;

/**
 * 获取鼠标在游戏内的坐标Y
 */
declare function DzGetMouseTerrainY(): number;

/**
 * 获取鼠标在游戏内的坐标Z
 */
declare function DzGetMouseTerrainZ(): number;

/**
 * 鼠标是否在游戏内
 */
declare function DzIsMouseOverUI(): boolean;

/**
 * 获取鼠标屏幕坐标X
 */
declare function DzGetMouseX(): number;

/**
 * 获取鼠标屏幕坐标Y
 */
declare function DzGetMouseY(): number;

/**
 * 获取鼠标游戏窗口坐标X
 */
declare function DzGetMouseXRelative(): number;

/**
 * 获取鼠标游戏窗口坐标Y
 */
declare function DzGetMouseYRelative(): number;

/**
 * 设置鼠标位置
 */
declare function DzSetMousePos(x: number, y: number): void;

/**
 * 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
 */
declare function DzTriggerRegisterMouseEvent(trig: trigger, btn: number, status: number, sync: boolean, func: string): void;

/**
 * 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
 */
declare function DzTriggerRegisterMouseEventByCode(trig: trigger, btn: number, status: number, sync: boolean, funcHandle: () => void): void;

/**
 * 注册键盘点击触发
 */
declare function DzTriggerRegisterKeyEvent(trig: trigger, key: number, status: number, sync: boolean, func: string): void;

/**
 * 注册键盘点击触发
 */
declare function DzTriggerRegisterKeyEventByCode(trig: trigger, key: number, status: number, sync: boolean, funcHandle: () => void): void;

/**
 * 注册鼠标滚轮触发
 */
declare function DzTriggerRegisterMouseWheelEvent(trig: trigger, sync: boolean, func: string): void;

/**
 * 注册鼠标滚轮触发
 */
declare function DzTriggerRegisterMouseWheelEventByCode(trig: trigger, sync: boolean, funcHandle: () => void): void;

/**
 * 注册鼠标移动触发
 */
declare function DzTriggerRegisterMouseMoveEvent(trig: trigger, sync: boolean, func: string): void;

/**
 * 注册鼠标移动触发
 */
declare function DzTriggerRegisterMouseMoveEventByCode(trig: trigger, sync: boolean, funcHandle: () => void): void;

/**
 * 获取触发器的按键码
 */
declare function DzGetTriggerKey(): number;

/**
 * 获取滚轮delta
 */
declare function DzGetWheelDelta(): number;

/**
 * 判断按键是否按下
 */
declare function DzIsKeyDown(iKey: number): boolean;

/**
 * 获取触发key的玩家
 */
declare function DzGetTriggerKeyPlayer(): player;

/**
 * 获取war3窗口宽度
 */
declare function DzGetWindowWidth(): number;

/**
 * 获取war3窗口高度
 */
declare function DzGetWindowHeight(): number;

/**
 * 获取war3窗口X坐标
 */
declare function DzGetWindowX(): number;

/**
 * 获取war3窗口Y坐标
 */
declare function DzGetWindowY(): number;

/**
 * 注册war3窗口大小变化事件
 */
declare function DzTriggerRegisterWindowResizeEvent(trig: trigger, sync: boolean, func: string): void;

/**
 * 注册war3窗口大小变化事件
 */
declare function DzTriggerRegisterWindowResizeEventByCode(trig: trigger, sync: boolean, funcHandle: () => void): void;

/**
 * 判断窗口是否激活
 */
declare function DzIsWindowActive(): boolean;

/**
 * 设置可摧毁物位置
 */
declare function DzDestructablePosition(d: destructable, x: number, y: number): void;

/**
 * 设置单位位置-本地调用
 */
declare function DzSetUnitPosition(whichUnit: unit, x: number, y: number): void;

/**
 * 异步执行函数
 */
declare function DzExecuteFunc(funcName: string): void;

/**
 * 取鼠标指向的单位
 */
declare function DzGetUnitUnderMouse(): unit;

/**
 * 设置单位的贴图
 */
declare function DzSetUnitTexture(whichUnit: unit, path: string, texId: number): void;

/**
 * 设置内存数值
 */
declare function DzSetMemory(address: number, value: number): void;

/**
 * 替换单位类型 [BZAPI]
 */
declare function DzSetUnitID(whichUnit: unit, id: number): void;

/**
 * 替换单位模型 [BZAPI]
 */
declare function DzSetUnitModel(whichUnit: unit, path: string): void;

/**
 * 获取单位 ${unit} 的 ${level}级 升级所需经验
 */
declare function DzGetUnitNeededXP(whichUnit: unit, level: number): number;

/**
 * 原生 - 设置小地图背景贴图
 */
declare function DzSetWar3MapMap(map: string): void;

/**
 * 注册数据同步触发器
 */
declare function DzTriggerRegisterSyncData(trig: trigger, prefix: string, server: boolean): void;

/**
 * 同步游戏数据
 */
declare function DzSyncData(prefix: string, data: string): void;

/**
 * 获取同步的数据
 */
declare function DzGetTriggerSyncData(): string;

/**
 * 获取同步数据的玩家
 */
declare function DzGetTriggerSyncPlayer(): player;

/**
 * 隐藏界面元素
 */
declare function DzFrameHideInterface(): void;

/**
 * 修改游戏世界窗口位置
 */
declare function DzFrameEditBlackBorders(upperHeight: number, bottomHeight: number): void;

/**
 * 头像
 */
declare function DzFrameGetPortrait(): number;

/**
 * 小地图
 */
declare function DzFrameGetMinimap(): number;

/**
 * 技能按钮
 */
declare function DzFrameGetCommandBarButton(row: number, column: number): number;

/**
 * 英雄按钮
 */
declare function DzFrameGetHeroBarButton(buttonId: number): number;

/**
 * 英雄血条
 */
declare function DzFrameGetHeroHPBar(buttonId: number): number;

/**
 * 英雄蓝条
 */
declare function DzFrameGetHeroManaBar(buttonId: number): number;

/**
 * 道具按钮
 */
declare function DzFrameGetItemBarButton(buttonId: number): number;

/**
 * 小地图按钮
 */
declare function DzFrameGetMinimapButton(buttonId: number): number;

/**
 * 左上菜单按钮
 */
declare function DzFrameGetUpperButtonBarButton(buttonId: number): number;

/**
 * 鼠标提示
 */
declare function DzFrameGetTooltip(): number;

/**
 * 聊天信息
 */
declare function DzFrameGetChatMessage(): number;

/**
 * 单位信息
 */
declare function DzFrameGetUnitMessage(): number;

/**
 * 获取最上的信息
 */
declare function DzFrameGetTopMessage(): number;

/**
 * 取rgba色值
 */
declare function DzGetColor(r: number, g: number, b: number, a: number): number;

/**
 * 设置界面更新回调（非同步）
 */
declare function DzFrameSetUpdateCallback(func: string): void;

/**
 * 界面更新回调
 */
declare function DzFrameSetUpdateCallbackByCode(funcHandle: () => void): void;

/**
 * 显示/隐藏窗体
 */
declare function DzFrameShow(frame: number, enable: boolean): void;

/**
 * 创建窗体
 */
declare function DzCreateFrame(frame: string, parent: number, id: number): number;

/**
 * 创建简单的窗体
 */
declare function DzCreateSimpleFrame(frame: string, parent: number, id: number): number;

/**
 * 销毁窗体
 */
declare function DzDestroyFrame(frame: number): void;

/**
 * 加载内容目录 (Toc table of contents)
 */
declare function DzLoadToc(fileName: string): void;

/**
 * 设置窗体相对位置 [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
 */
declare function DzFrameSetPoint(frame: number, point: number, relativeFrame: number, relativePoint: number, x: number, y: number): void;

/**
 * 设置窗体绝对位置
 */
declare function DzFrameSetAbsolutePoint(frame: number, point: number, x: number, y: number): void;

/**
 * 清空窗体锚点
 */
declare function DzFrameClearAllPoints(frame: number): void;

/**
 * 设置窗体禁用/启用
 */
declare function DzFrameSetEnable(name: number, enable: boolean): void;

/**
 * 注册用户界面事件回调
 */
declare function DzFrameSetScript(frame: number, eventId: number, func: string, sync: boolean): void;

/**
 * 注册UI事件回调(func handle)
 * 如果要在同步事件里获取触发玩家 可使用DzGetTriggerUIEventPlayer 获得触发UI事件的玩家
 */
declare function DzFrameSetScriptByCode(frame: number, eventId: number, funcHandle: () => void, sync: boolean): void;

/**
 * 获取触发用户界面事件的玩家
 */
declare function DzGetTriggerUIEventPlayer(): player;

/**
 * 获取触发用户界面事件的窗体
 */
declare function DzGetTriggerUIEventFrame(): number;

/**
 * 通过名称查找窗体
 */
declare function DzFrameFindByName(name: string, id: number): number;

/**
 * 通过名称查找普通窗体
 */
declare function DzSimpleFrameFindByName(name: string, id: number): number;

/**
 * 查找字符串
 */
declare function DzSimpleFontStringFindByName(name: string, id: number): number;

/**
 * 查找BACKDROP frame
 */
declare function DzSimpleTextureFindByName(name: string, id: number): number;

/**
 * 获取游戏用户界面
 */
declare function DzGetGameUI(): number;

/**
 * 点击窗体
 */
declare function DzClickFrame(frame: number): void;

/**
 * 自定义屏幕比例
 */
declare function DzSetCustomFovFix(value: number): void;

/**
 * 使用宽屏模式
 */
declare function DzEnableWideScreen(enable: boolean): void;

/**
 * 设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
 */
declare function DzFrameSetText(frame: number, text: string): void;

/**
 * 获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）
 */
declare function DzFrameGetText(frame: number): string;

/**
 * 设置字数限制（支持EditBox）
 */
declare function DzFrameSetTextSizeLimit(frame: number, size: number): void;

/**
 * 获取字数限制（支持EditBox）
 */
declare function DzFrameGetTextSizeLimit(frame: number): number;

/**
 * 设置文字颜色（支持TextFrame, EditBox）
 */
declare function DzFrameSetTextColor(frame: number, color: number): void;

/**
 * 获取鼠标所在位置的用户界面控件指针
 */
declare function DzGetMouseFocus(): number;

/**
 * 设置所有锚点到目标窗体上
 */
declare function DzFrameSetAllPoints(frame: number, relativeFrame: number): boolean;

/**
 * 设置焦点
 */
declare function DzFrameSetFocus(frame: number, enable: boolean): boolean;

/**
 * 设置模型（支持Sprite、Model、StatusBar）
 */
declare function DzFrameSetModel(frame: number, modelFile: string, modelType: number, flag: number): void;

/**
 * 获取控件是否启用
 */
declare function DzFrameGetEnable(frame: number): boolean;

/**
 * 设置透明度（0-255）
 */
declare function DzFrameSetAlpha(frame: number, alpha: number): void;

/**
 * 获取透明度（0-255）
 */
declare function DzFrameGetAlpha(frame: number): number;

/**
 * 设置动画
 */
declare function DzFrameSetAnimate(frame: number, animId: number, autocast: boolean): void;

/**
 * 设置动画进度（autocast为false是可用）
 */
declare function DzFrameSetAnimateOffset(frame: number, offset: number): void;

/**
 * 设置texture（支持Backdrop、SimpleStatusBar）
 */
declare function DzFrameSetTexture(frame: number, texture: string, flag: number): void;

/**
 * 设置缩放
 */
declare function DzFrameSetScale(frame: number, scale: number): void;

/**
 * 设置提示
 */
declare function DzFrameSetTooltip(frame: number, tooltip: number): void;

/**
 * 鼠标限制在用户界面内
 */
declare function DzFrameCageMouse(frame: number, enable: boolean): void;

/**
 * 获取当前值（支持Slider、SimpleStatusBar、StatusBar）
 */
declare function DzFrameGetValue(frame: number): number;

/**
 * 设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）
 */
declare function DzFrameSetMinMaxValue(frame: number, minValue: number, maxValue: number): void;

/**
 * 设置Step值（支持Slider）
 */
declare function DzFrameSetStepValue(frame: number, step: number): void;

/**
 * 设置当前值（支持Slider、SimpleStatusBar、StatusBar）
 */
declare function DzFrameSetValue(frame: number, value: number): void;

/**
 * 设置窗体大小
 */
declare function DzFrameSetSize(frame: number, w: number, h: number): void;

/**
 * 根据tag创建窗体
 */
declare function DzCreateFrameByTagName(frameType: string, name: string, parent: number, template: string, id: number): number;

/**
 * 设置颜色（支持SimpleStatusBar）
 */
declare function DzFrameSetVertexColor(frame: number, color: number): void;

/**
 * 不明觉厉
 */
declare function DzOriginalUIAutoResetPoint(enable: boolean): void;

/**
 * 设置优先级 [NEW]
 */
declare function DzFrameSetPriority(frame: number, priority: number): void;

/**
 * 设置父窗口 [NEW]
 */
declare function DzFrameSetParent(frame: number, parent: number): void;

/**
 * 设置字体 [NEW]
 * 原生字体 "Fonts\\dfst-m3u.ttf"
 */
declare function DzFrameSetFont(frame: number, fileName: string, height: number, flag: number): void;

/**
 * 获取 Frame 的 高度 [NEW]
 */
declare function DzFrameGetHeight(frame: number): number;

/**
 * 设置对齐方式 [NEW]
 */
declare function DzFrameSetTextAlignment(frame: number, align: number): void;

/**
 * 获取 Frame 的 Parent [NEW]
 */
declare function DzFrameGetParent(frame: number): number;

declare function DzEvent_Building_Finish(...args: any[]): any;


declare function DzAPI_Map_GameResult_CommitGameResultNoEnd(whichPlayer: player, value: number): void;

// GetSinceLastPlayedSeconds, // 获取距最后一次游戏的秒数
declare function DzAPI_Map_GetSinceLastPlayedSeconds(whichPlayer: player): number;

// QuickBuy, //游戏内快速购买
declare function DzAPI_Map_QuickBuy(whichPlayer: player, key: string, count: number, seconds: number): boolean;

// CancelQuickBuy, //取消快速购买
declare function DzAPI_Map_CancelQuickBuy(whichPlayer: player): boolean;

//判断是加载成功某个玩家的道具
declare function DzAPI_Map_PlayerLoadedItems(whichPlayer: player): boolean;