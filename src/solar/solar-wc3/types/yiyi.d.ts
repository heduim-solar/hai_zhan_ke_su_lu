/** @noSelfInFile */

/**
 * 这里是11平台的方法定义
 * 不建议使用此文件类声明的方法 在11平台底层以使用这些函数来实现dz api。所以上层游戏统一使用dz api即可
 */

//消费
declare function EXNetConsume(p: player, consume: number): boolean;

//消费(一级货币)
declare function EXNetCommonConsume(p: player, consume: number): boolean;

//获取用户名
declare function EXGetPlayerRealName(p: player): string;

//道具扣除开始
declare function EXNetUseItem(player_id: player, itemid: string, amount: number): boolean;

//道具扣除结束
//时间函数需要引用的代码
/**
 * 获取的是实时时间  每秒获取的都不同 (底层是否玩家已同步不清楚)
 * 返回格式 2023-07-18 15:08:03
 * @constructor
 */
declare function EXNetGetTime(): string;

//时间引用代码结束
//统计引用代码
declare function EXNetStatRemoteData(player_id: number, key: string, value: string): boolean;

//统计引用代码结束
//保存用户缓存数据
declare function EXNetSaveRemoteData(player_id: number, Key: string, value: string): boolean;

//重新加载用户缓存数据
declare function EXNetLoadRemoteData(player_id: number, Key: string): boolean;

//判断是否是11平台的天梯房间
declare function EXNetIsYYHighLadder(): boolean;

//与操作
declare function EXNetBit32And(v1: number, v2: number): number;

//或操作
declare function EXNetBit32Or(v1: number, v2: number): number;

//获取11平台辅助信息, 参数支持"roomtype","datetime"
declare function EXNetGetYYAssistantValue(key: string): number;

/*!
@brief 选择翻译用的mo文件，地图作者可以用这个接口在本地切换语言，如果不调用这个函数YDWE默认选择war3map_zh.mo
@param i: 0-war3map_zh.mo，1-war3map_en.mo，-1-默认(线上时会根据平台环境自动切换)
@return: 永远返回1
@warning: 发布到线上时尽可能在所有YDWETranslate前调用，如果在YDWETranslate前没有调用，则在第一次调用YDWETranslate时进行默认的翻译包加载行为。
*/
declare function EXSetLanguage(i: number): number;

/*!
@brief YDWETranslate的底层实现
@param s: 需要翻译的字符串
@return: 翻译完成的字符串
*/
declare function EXTranslateString(s: string): string;

/*!
@brief 获取玩家游戏时间，单位秒
@param p: 玩家对象
@return: 玩家游戏时间，单位秒
*/
declare function EXGetGamePlaySecs(p: player): number;


/**
 * jass 扩展的
 */



//library YDWE11Platform:
declare function YDWE11Platform___IsLivingPlayer(p: player): boolean;

declare function YDWE11Platform___GetLivingfPlayer(): player;

declare function YDWE11Platform___InitGC(): boolean;

declare function YDWEPlatformIsInRoom(): boolean;

declare function YDWEPlatformIsInPlatform(): boolean;

declare function YDWE11Platform___Init(): void;

//library YDWE11Platform ends
//library YDWERecord:
declare function YDWERecord___ToLetter(i: number): string;

declare function YDWERecord___NewTable(playerid: number): gamecache;

declare function YDWERecord___GetTable(playerid: number): gamecache;

declare function YDWERecord___SetS(playerid: number, key: string, value: string): void;

// 指定平台界面显示的项
// @reserve 保留参数，暂时无用
// @index   显示的位置，值必须是0~7中的一个
// @value   显示的标题，其值必须用SetI来设置
declare function YDWERecord_SetTitle(playerid: number, reserve: number, index: number, value: string): void;

// 写入一项
// @key    索引
// @value  值
declare function YDWERecord_SetI(playerid: number, key: string, value: number): void;

// 读取一项
// @key    索引
// @Return 值
declare function YDWERecord_GetI(playerid: number, key: string): number;

// 保存当前的所有内容。
// @Return   成功与否
declare function YDWERecord_Save(playerid: number): boolean;

// 清空所有内容
declare function YDWERecord_Clear(playerid: number): void;

//library YDWERecord ends
//library YDWENetApi:
//消费
//消费(一级货币)
//获取用户名
//道具扣除开始
//道具扣除结束
//时间函数需要引用的代码
//时间引用代码结束
//统计引用代码
//统计引用代码结束
//保存用户缓存数据
//重新加载用户缓存数据
//判断是否是11平台的天梯房间
//与操作
//或操作
//获取11平台辅助信息, 参数支持"roomtype","datetime"
//--------------------------------------------------------------------------------------------------------
declare function YDWENetApi___YY_Bill_ToLetter(i: number): string;

declare function YDWEStatRemoteData(p: player, key: string, value: string): boolean;

declare function YY_Bill_GetTable(playerid: number): gamecache;

//获取玩家货币余额
declare function YDWERPGBillingGetCurrency(p: player): number;

//玩家货币扣款
declare function YDWERPGBillingConsume(p: player, consume: number): boolean;

//获取玩家货币余额(一级货币)
declare function YDWERPGBillingGetCommonCurrency(p: player): number;

//玩家货币扣款(一级货币)
declare function YDWERPGBillingCommonConsume(p: player, consume: number): boolean;

//货币引用代码结束
//获取地图配置
declare function YDWERPGGetMapConfig(ckey: string): string;

//读取用户缓存数据
//if EXNetLoadRemoteData(GetPlayerId(p), rKey) == true then
declare function YDWERPGGetRemoteData(p: player, rKey: string): string;

//显示在排行榜中第rank位的玩家名，如果不存在则返回空字符串
declare function YDWEGetRPGTopName(rank: number): string;

//显示在排行榜中第rank位的玩家分数，如果不存在则返回-1
declare function YDWEGetRPGTopScore(rank: number): number;

//显示玩家的排行，如果不存在则返回-1
declare function YDWEGetPalyerRPGRank(p: player): number;

//显示玩家的分数，如果不存在则返回-1
declare function YDWEGetPalyerRPGRankScore(p: player): number;

//显示当前的排名种类名称
declare function YDWEGetRPGRankName(): string;

declare function YDWENetApi___EXSaveRemoteData(player_id: number, Key: string, value: string): boolean;

declare function YDWESaveRemoteData(p: player, Key: string, value: string): boolean;

declare function PlayerHighFreqScoreTest(player_id: number, value: string): void;

declare function YDWEHighFreqScorePrint(): void;

declare function YDWEHighFreqScoreSave(): void;

declare function YDWECheckIsYYHighLadder(): boolean;

declare function YDWEGetYYAssistantValue(key: string): number;

declare function YDWEBits32And(v1: number, v2: number): number;

declare function YDWEBits32Or(v1: number, v2: number): number;

declare function YDWETranslate(s: string): string;

declare function YDWENetApi___Init(): void;

//library YDWENetApi ends
//library YDWERecordSystem:
declare function YDWERecordGetI(p: player, kid: string): number;

declare function YDWERecordSetI(p: player, kid: string, data: number): void;

declare function YDWERecordSetTitle(id: number, kid: string): void;

declare function YDWERecordSave(p: player): void;

declare function YDWERecordClear(p: player): void;


/**是否拥有商城道具 (针对期限型道具) */
declare function YDWERPGBillingHasStatus(pl: player, key: string)

/**获取商城道具拥有数量 (针对数量型道具) */
declare function YDWERPGBillingGetItem(pl: player, key: string)

/**设置房间显示数据 (11平台只能设置数字) */
declare function YDWERPGSetKey(p: player, key: string, val: number)

declare function YDWERPGAddKey(p: player, key: string, val: number)

declare function YDWERPGGetKey(p: player, key: string): number