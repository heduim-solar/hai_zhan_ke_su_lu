import YiYiImplementDz from "@sl-wc3/lib/compatible/yiyi/YiYiImplementDz";
import YiYiApi from "@sl-wc3/lib/compatible/yiyi/YiYiApi";
import BaseUtil from "@/BaseUtil";
import YiYiApiJassImpl from "@sl-wc3/lib/compatible/yiyi/YiYiApiJassImpl";
import ArchiveUtil from "@/ArchiveUtil";


export default class YiYiEnv {
    static init() {
        if (!isEmbedJapi) {
            // print("非内置环境。11平台下api支持不全。")
            YiYiApiJassImpl.init()
            return
        }
        // @ts-ignore
        let g: NoSelf = _G
        g.register_japi("native  InitGameCache           takes string campaignFile returns gamecache\n" +
            "native  SaveGameCache           takes gamecache whichCache returns boolean\n" +
            "\n" +
            "native  EXNetUseItem            takes player p,string key,integer count returns boolean\n" +
            "native  EXNetGetTime            takes nothing returns string\n" +
            "native  EXNetSaveRemoteData     takes integer player_id, string Key ,string value returns boolean\n" +
            "native  EXNetLoadRemoteData     takes integer player_id, string Key returns boolean\n" +
            "native  EXGetPlayerRealName     takes player p returns string\n" +
            "\n" +
            "native  StoreInteger\t\t\ttakes gamecache cache, string missionKey, string key, integer value returns nothing\n" +
            "native  StoreReal\t\t\t\ttakes gamecache cache, string missionKey, string key, real value returns nothing\n" +
            "native  StoreBoolean\t\t\ttakes gamecache cache, string missionKey, string key, boolean value returns nothing\n" +
            "native  StoreUnit\t\t\t\ttakes gamecache cache, string missionKey, string key, unit whichUnit returns boolean\n" +
            "native  StoreString\t\t\t\ttakes gamecache cache, string missionKey, string key, string value returns boolean\n" +
            "\n" +
            "native  SyncStoredInteger       takes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  SyncStoredReal          takes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  SyncStoredBoolean       takes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  SyncStoredUnit          takes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  SyncStoredString        takes gamecache cache, string missionKey, string key returns nothing\n" +
            "\n" +
            "native  HaveStoredInteger\t\ttakes gamecache cache, string missionKey, string key returns boolean\n" +
            "native  HaveStoredReal\t\t\ttakes gamecache cache, string missionKey, string key returns boolean\n" +
            "native  HaveStoredBoolean\t\ttakes gamecache cache, string missionKey, string key returns boolean\n" +
            "native  HaveStoredUnit\t\t\ttakes gamecache cache, string missionKey, string key returns boolean\n" +
            "native  HaveStoredString\t\ttakes gamecache cache, string missionKey, string key returns boolean\n" +
            "\n" +
            "native  FlushGameCache\t\t\ttakes gamecache cache returns nothing\n" +
            "native  FlushStoredMission\t\ttakes gamecache cache, string missionKey returns nothing\n" +
            "native  FlushStoredInteger\t\ttakes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  FlushStoredReal\t\t\ttakes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  FlushStoredBoolean\t\ttakes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  FlushStoredUnit\t\t\ttakes gamecache cache, string missionKey, string key returns nothing\n" +
            "native  FlushStoredString\t\ttakes gamecache cache, string missionKey, string key returns nothing\n" +
            "\n" +
            "native  GetStoredInteger\t\ttakes gamecache cache, string missionKey, string key returns integer\n" +
            "native  GetStoredReal\t\t\ttakes gamecache cache, string missionKey, string key returns real\n" +
            "native  GetStoredBoolean\t\ttakes gamecache cache, string missionKey, string key returns boolean\n" +
            "native  GetStoredString\t\t\ttakes gamecache cache, string missionKey, string key returns string\n" +
            "native  RestoreUnit\t\t\t\ttakes gamecache cache, string missionKey, string key, player forWhichPlayer, real x, real y, real facing returns unit\n" +
            "\n" +
            "native  EXNetConsume            takes player whichPlayer,integer gold returns boolean\n" +
            "native  EXNetCommonConsume      takes player whichPlayer,integer gold returns boolean\n" +
            "native  EXGetGamePlaySecs       takes player p returns integer\n");
    }


    static initInEnd() {
        YiYiApi.init();
        YiYiImplementDz.init()
        //2分钟后设置积分。
        BaseUtil.runLater(130, () => {
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                let tempPlayer = Player(i);
                if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                    ArchiveUtil.getAllArchive(tempPlayer)
                    YDWERPGSetKey(tempPlayer, "mapexp", (sd(tempPlayer, false)?._tt || 0))
                    YDWERPGSetKey(tempPlayer, "maplv", DzAPI_Map_GetMapLevel(tempPlayer))
                }
            }
        });

        if (isEmbedJapi) {
            let iFunNames = ["CreateFrame", "CreateFrameByTagName", "FrameShow", "FrameFindByName"]

            //使用内置ui 实现dz ui
            const japi: NoSelf = require('jass.japi')
            for (let funName of iFunNames) {
                if (japi[funName]) {
                    // @ts-ignore
                    _G["Dz" + funName] = japi[funName];
                }

            }
        }

    }
}