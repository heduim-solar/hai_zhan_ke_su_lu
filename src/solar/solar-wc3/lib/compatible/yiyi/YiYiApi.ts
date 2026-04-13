/** @noSelfInFile */
declare global {
    let YDWERPGBilling__m_table: gamecache[]

}

let YDWE11Platform___gc: gamecache;
let YDWE11Platform___is_vaild: boolean = false;
let YDWERecord___m_table: gamecache[];
let YDWENetApi___is_11Platform: boolean = true;
let YY_Bill_m_table: gamecache[];
let ctable: gamecache = null;
let ranktable: gamecache = null;
let stSaveCnt: number = 0;

//


//library YDWE11Platform:
export function YDWE11Platform___IsLivingPlayer(p: player): boolean {


    return (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING) && (GetPlayerController(p) == MAP_CONTROL_USER);
}

export function YDWE11Platform___GetLivingfPlayer(): player {

    let i: number = 0;

    while (true) {
        if (YDWE11Platform___IsLivingPlayer(Player(i)) || i >= 11) break;
        i = i + 1;
    }
    return Player(i);
}

export function YDWE11Platform___InitGC(): boolean {
    if (true) {
        return true
    }

    let p: player = YDWE11Platform___GetLivingfPlayer();

    if (GetLocalPlayer() == p) {
        StoreInteger(YDWE11Platform___gc, "Global", "RoomFlag", GetStoredInteger(YDWE11Platform___gc, "Global", "RoomFlag"));
        StoreInteger(YDWE11Platform___gc, "Global", "Enable", GetStoredInteger(YDWE11Platform___gc, "Global", "Enable"));
        StoreInteger(YDWE11Platform___gc, "-", "-", FourCC('YDWE'));
    }
    TriggerSyncStart();
    if (GetLocalPlayer() == p) {
        SyncStoredInteger(YDWE11Platform___gc, "Global", "RoomFlag");
        SyncStoredInteger(YDWE11Platform___gc, "Global", "Enable");
        SyncStoredInteger(YDWE11Platform___gc, "-", "-");
    }
    StoreInteger(YDWE11Platform___gc, "Global", "RoomFlag", 0);
    StoreInteger(YDWE11Platform___gc, "Global", "Enable", 0);
    StoreInteger(YDWE11Platform___gc, "-", "-", 0);
    TriggerSyncReady();
    while (true) {
        if (FourCC('YDWE') == GetStoredInteger(YDWE11Platform___gc, "-", "-"))
            return true;
        TriggerSleepAction(0.2);
    }
    return true;
}

// export function YDWEPlatformIsInRoom(): boolean {
//
//
//     while (true) {
//         if (YDWE11Platform___is_vaild) break;
//         TriggerSleepAction(0.2);
//     }
//     return GetStoredInteger(YDWE11Platform___gc, "Global", "RoomFlag") == 0x40000000;
// }

// export function YDWEPlatformIsInPlatform(): boolean {
//
//
//     while (true) {
//         if (YDWE11Platform___is_vaild) break;
//         TriggerSleepAction(0.2);
//     }
//     return GetStoredInteger(YDWE11Platform___gc, "Global", "Enable") == 1;
// }

export function YDWE11Platform___Init(): void {


    YDWE11Platform___gc = InitGameCache("@11CONF");
    YDWE11Platform___is_vaild = false;
    YDWE11Platform___is_vaild = YDWE11Platform___InitGC();
}

//library YDWE11Platform ends
//library YDWERecord:
export function YDWERecord___ToLetter(i: number): string {


    return SubString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i, i + 1);
}

export function YDWERecord___NewTable(playerid: number): gamecache {


    return InitGameCache("11SAV@" + YDWERecord___ToLetter(playerid));
}

export function YDWERecord___GetTable(playerid: number): gamecache {


    if (YDWERecord___m_table[playerid] == null)
        YDWERecord___m_table[playerid] = (InitGameCache("11SAV@" + YDWERecord___ToLetter((playerid)))) // INLINED!!
        ;
    return YDWERecord___m_table[playerid];
}

export function YDWERecord___SetS(playerid: number, key: string, value: string): void {


    StoreString(YDWERecord___GetTable(playerid), "", key, value);
}

// 指定平台界面显示的项
// @reserve 保留参数，暂时无用
// @index   显示的位置，值必须是0~7中的一个
// @value   显示的标题，其值必须用SetI来设置
export function YDWERecord_SetTitle(playerid: number, reserve: number, index: number, value: string): void {


    YDWERecord___SetS(playerid, "Title@" + YDWERecord___ToLetter(index), value);
}

// 写入一项
// @key    索引
// @value  值
export function YDWERecord_SetI(playerid: number, key: string, value: number): void {


    StoreInteger(YDWERecord___GetTable(playerid), "", key, value);
}

// 读取一项
// @key    索引
// @Return 值
export function YDWERecord_GetI(playerid: number, key: string): number {


    return GetStoredInteger(YDWERecord___GetTable(playerid), "", key);
}

// 保存当前的所有内容。
// @Return   成功与否
export function YDWERecord_Save(playerid: number): boolean {


    return SaveGameCache(YDWERecord___GetTable(playerid));
}

// 清空所有内容
export function YDWERecord_Clear(playerid: number): void {


    FlushGameCache(YDWERecord___GetTable(playerid));
}

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
export function YDWENetApi___YY_Bill_ToLetter(i: number): string {


    return SubString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i, i + 1);
}

export function YDWEStatRemoteData(p: player, key: string, value: string): boolean {


    return EXNetStatRemoteData(GetPlayerId(p), key, value);
}

export function YY_Bill_GetTable(playerid: number): gamecache {


    if (YY_Bill_m_table[playerid] == null)
        YY_Bill_m_table[playerid] = InitGameCache("11billing@" + YDWENetApi___YY_Bill_ToLetter(playerid));
    return YY_Bill_m_table[playerid];
}

//获取玩家货币余额
export function YDWERPGBillingGetCurrency(p: player): number {


    return GetStoredInteger(YY_Bill_GetTable(GetPlayerId(p)), "货币", "currency");
}

//玩家货币扣款
export function YDWERPGBillingConsume(p: player, consume: number): boolean {


    return EXNetConsume(p, consume);
}

//获取玩家货币余额(一级货币)
export function YDWERPGBillingGetCommonCurrency(p: player): number {


    return GetStoredInteger(YY_Bill_GetTable(GetPlayerId(p)), "货币", "bill");
}

//玩家货币扣款(一级货币)
export function YDWERPGBillingCommonConsume(p: player, consume: number): boolean {


    if (consume > 0)
        return EXNetCommonConsume(p, consume);
    else
        return false;
}

//货币引用代码结束
//获取地图配置
export function YDWERPGGetMapConfig(ckey: string): string {


    return GetStoredString(ctable, "config", ckey);
}

//读取用户缓存数据
//if EXNetLoadRemoteData(GetPlayerId(p), rKey) == true then
export function YDWERPGGetRemoteData(p: player, rKey: string): string {

    //    return GetStoredString(ctable,EXGetPlayerRealName(p), rKey)
    //else
    //    return ""
    //endif

    return GetStoredString(ctable, EXGetPlayerRealName(p), rKey);
}

//显示在排行榜中第rank位的玩家名，如果不存在则返回空字符串
export function YDWEGetRPGTopName(rank: number): string {


    return GetStoredString(ranktable, "TopsName", I2S(rank));
}

//显示在排行榜中第rank位的玩家分数，如果不存在则返回-1
export function YDWEGetRPGTopScore(rank: number): number {


    return GetStoredInteger(ranktable, "TopsScore", I2S(rank));
}

//显示玩家的排行，如果不存在则返回-1
export function YDWEGetPalyerRPGRank(p: player): number {


    return GetStoredInteger(ranktable, "PlayerRank", I2S(GetPlayerId(p)));
}

//显示玩家的分数，如果不存在则返回-1
export function YDWEGetPalyerRPGRankScore(p: player): number {


    return GetStoredInteger(ranktable, "PlayerScore", I2S(GetPlayerId(p)));
}

//显示当前的排名种类名称
export function YDWEGetRPGRankName(): string {


    return GetStoredString(ranktable, "RankKey", "0");
}

export function YDWENetApi___EXSaveRemoteData(player_id: number, Key: string, value: string): boolean {


    return StoreString(ctable, EXGetPlayerRealName(Player(player_id)), Key, value);
}

export function YDWESaveRemoteData(p: player, Key: string, value: string): boolean {


    if (YDWENetApi___is_11Platform == true)
        return EXNetSaveRemoteData(GetPlayerId(p), Key, value);
    else
        return YDWENetApi___EXSaveRemoteData(GetPlayerId(p), Key, value);
}

export function PlayerHighFreqScoreTest(player_id: number, value: string): void {

    let p: player = Player(player_id);

    YDWESaveRemoteData(p, "HFreqT1", value);
    YDWESaveRemoteData(p, "HFreqT2", value);
    YDWESaveRemoteData(p, "HFreqT3", value);
    YDWESaveRemoteData(p, "HFreqT4", value);
    YDWESaveRemoteData(p, "HFreqT5", value);
    YDWESaveRemoteData(p, "HFreqT6", value);
    YDWESaveRemoteData(p, "HFreqT7", value);
    YDWESaveRemoteData(p, "HFreqT8", value);
    YDWESaveRemoteData(p, "HFreqT9", value);
    YDWESaveRemoteData(p, "HFreqT10", value);
}

export function YDWEHighFreqScorePrint(): void {


    BJDebugMsg("st的触发者显示最大的数字，其余玩家显示最大数字-1");
    BJDebugMsg("HFreqT1: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT1"));
    BJDebugMsg("HFreqT2: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT2"));
    BJDebugMsg("HFreqT3: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT3"));
    BJDebugMsg("HFreqT4: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT4"));
    BJDebugMsg("HFreqT5: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT5"));
    BJDebugMsg("HFreqT6: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT6"));
    BJDebugMsg("HFreqT7: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT7"));
    BJDebugMsg("HFreqT8: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT8"));
    BJDebugMsg("HFreqT9: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT9"));
    BJDebugMsg("HFreqT10: " + YDWERPGGetRemoteData(GetLocalPlayer(), "HFreqT10"));
}

export function YDWEHighFreqScoreSave(): void {

    let localPlayer: number = GetPlayerId(GetLocalPlayer());
    let triggerPlayerId: number = GetPlayerId(GetTriggerPlayer());
    let idx: number = 0;

    stSaveCnt = stSaveCnt + 1;
    while (true) {
        if ((idx > 12)) break;
        if ((triggerPlayerId == idx))
            PlayerHighFreqScoreTest(idx, I2S(stSaveCnt));
        else
            PlayerHighFreqScoreTest(idx, I2S(stSaveCnt - 1));
        idx = idx + 1;
    }
}

export function YDWECheckIsYYHighLadder(): boolean {


    return EXNetIsYYHighLadder();
}

export function YDWEGetYYAssistantValue(key: string): number {


    return EXNetGetYYAssistantValue(key);
}

export function YDWEBits32And(v1: number, v2: number): number {


    return EXNetBit32And(v1, v2);
}

export function YDWEBits32Or(v1: number, v2: number): number {


    return EXNetBit32Or(v1, v2);
}

export function YDWETranslate(s: string): string {

    let ret: string = EXTranslateString(s);

    return ret;
}

export function YDWENetApi___Init(): void {


    // YDWENetApi___is_11Platform = YDWEPlatformIsInPlatform();
    YDWENetApi___is_11Platform = true;
}

//library YDWENetApi ends
//library YDWERecordSystem:
export function YDWERecordGetI(p: player, kid: string): number {


    return YDWERecord_GetI(GetPlayerId(p), kid);
}

export function YDWERecordSetI(p: player, kid: string, data: number): void {


    YDWERecord_SetI(GetPlayerId(p), kid, data);
}

export function YDWERecordSetTitle(id: number, kid: string): void {

    let i: number = 0;

    while (true) {
        if (i > 11) break;
        if ((GetPlayerController(Player(i)) == MAP_CONTROL_USER) && (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING))
            YDWERecord_SetTitle(i, 0, id, kid);
        i = i + 1;
    }
}

export function YDWERecordSave(p: player): void {


    if (!IsPlayerObserver(p))
        SaveGameCache(YDWERecord___GetTable((GetPlayerId(p))))// INLINED!!
        ;
}

export function YDWERecordClear(p: player): void {


    FlushGameCache(YDWERecord___GetTable((GetPlayerId(p))))// INLINED!!
}


export function YDWERPGBilling__ToLetter(i: number): string {
    return SubString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i, i + 1);
}

export function YDWERPGBilling__GetTable(playerid: number): gamecache {
    if (YDWERPGBilling__m_table[playerid] == null)
        YDWERPGBilling__m_table[playerid] = InitGameCache("11billing@" + YDWERPGBilling__ToLetter(playerid));
    return YDWERPGBilling__m_table[playerid];
}

export function YDWERPGBillingGetStatus(p: player, key: string): number {
    return GetStoredInteger(YDWERPGBilling__GetTable(GetPlayerId(p)), "状态", key);
}

export function YDWERPGBillingGetItem(p: player, key: string): number {


    return GetStoredInteger(YDWERPGBilling__GetTable(GetPlayerId(p)), "道具", key);
}

export function YDWERPGBillingHasStatus(p: player, key: string): boolean {


    return HaveStoredInteger(YDWERPGBilling__GetTable(GetPlayerId(p)), "状态", key);
}

export function YDWERPGBillingHasItem(p: player, key: string): boolean {
    return HaveStoredInteger(YDWERPGBilling__GetTable(GetPlayerId(p)), "道具", key);
}

//YDWEReplayHelper.j

let curplayer: player;
let gc: gamecache;

export function IsLivingPlayer(p: player): boolean {


    return (GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING);
}

export function GetLivingfPlayer(): player {

    let i: number = 0;

    while (true) {
        if (IsLivingPlayer(Player(i)) || i >= 11) break;
        i = i + 1;
    }
    return Player(i);
}

export function YDWEWriteToReplay(table: string, key: string, data: number): void {


    if (!IsLivingPlayer(curplayer))
        curplayer = GetLivingfPlayer();
    StoreInteger(gc, table, key, data);
    if (GetLocalPlayer() == curplayer)
        SyncStoredInteger(gc, table, key);
}

export function YDWEReadFromReplay(table: string, key: string): number {


    return GetStoredInteger(gc, table, key);
}

export function Init(): void {


    FlushGameCache(InitGameCache("11.x"));
    gc = InitGameCache("11.x");
}


export function ToLetter(i: number): string {


    return SubString("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i, i + 1);
}

export function YDWERPGGetKey(p: player, key: string): number {


    return YDWEReadFromReplay(ToLetter(GetPlayerId(p)), key);
}

export function YDWERPGSetKey(p: player, key: string, value: number): void {


    YDWEWriteToReplay(ToLetter(GetPlayerId(p)) + "=", key, value);
}

export function YDWERPGAddKey(p: player, key: string, value: number): void {


    YDWEWriteToReplay(ToLetter(GetPlayerId(p)) + "+", key, value);
}

export function YDWERPGGameEnd(): void {


    YDWEWriteToReplay("$", "GameEnd", 0);
}


export default class YiYiApi {

    static is_init = false;

    constructor() {

        YiYiApi.init();
    }


    static init() {
        if (YiYiApi.is_init) {
            return
        }
        YiYiApi.is_init = true;
        //
        YDWERPGBilling__m_table = [];
        YDWERecord___m_table = [];
        YY_Bill_m_table = [];
        ctable = InitGameCache("11.s");
        ranktable = InitGameCache("11.rank");
        //
        Init();
        YDWE11Platform___Init();
        YDWENetApi___Init();
    }

}