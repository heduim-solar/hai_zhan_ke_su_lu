import SyncUtil from "@/SyncUtil";
import {MapPlayer} from "@/player";

export default class EmbedJapi {


    static init() {
        const japi: NoSelf = require('jass.japi')
        if (japi.SetOwner) {
            japi.SetOwner('问号')
        }
        // @ts-ignore
        let g: NoSelf = _G
        g.register_japi("    native DzGetMouseTerrainX takes nothing returns real\n" +
            "    native DzGetMouseTerrainY takes nothing returns real\n" +
            "    native DzGetMouseTerrainZ takes nothing returns real\n" +
            "    native DzIsMouseOverUI takes nothing returns boolean\n" +
            "    native DzGetMouseX takes nothing returns integer\n" +
            "    native DzGetMouseY takes nothing returns integer\n" +
            "    native DzGetMouseXRelative takes nothing returns integer\n" +
            "    native DzGetMouseYRelative takes nothing returns integer\n" +
            "    native DzSetMousePos takes integer x, integer y returns nothing\n" +
            "    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing\n" +
            "    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing\n" +
            "    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing\n" +
            "    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing\n" +
            "    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing\n" +
            "    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing\n" +
            "    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing\n" +
            "    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing\n" +
            "    native DzGetTriggerKey takes nothing returns integer\n" +
            "    native DzGetWheelDelta takes nothing returns integer\n" +
            "    native DzIsKeyDown takes integer iKey returns boolean\n" +
            "    native DzGetTriggerKeyPlayer takes nothing returns player\n" +
            "    native DzGetWindowWidth takes nothing returns integer\n" +
            "    native DzGetWindowHeight takes nothing returns integer\n" +
            "    native DzGetWindowX takes nothing returns integer\n" +
            "    native DzGetWindowY takes nothing returns integer\n" +
            "    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing\n" +
            "    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing\n" +
            "    native DzIsWindowActive takes nothing returns boolean\n" +
            "    //plus\n" +
            "    native DzDestructablePosition takes destructable d, real x, real y returns nothing\n" +
            "    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing\n" +
            "    native DzExecuteFunc takes string funcName returns nothing\n" +
            "    native DzGetUnitUnderMouse takes nothing returns unit\n" +
            "    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing\n" +
            "    native DzSetMemory takes integer address, real value returns nothing\n" +
            "    native DzSetUnitID takes unit whichUnit, integer id returns nothing\n" +
            "    native DzSetUnitModel takes unit whichUnit, string path returns nothing\n" +
            "    native DzSetWar3MapMap takes string map returns nothing\n" +
            "    native DzGetLocale takes nothing returns string\n" +
            "    native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer\n" +
            "    //sync\n" +
            "    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing\n" +
            "    native DzSyncData takes string prefix, string data returns nothing\n" +
            "    native DzGetTriggerSyncData takes nothing returns string\n" +
            "    native DzGetTriggerSyncPlayer takes nothing returns player\n" +
            "    //gui\n" +
            "    native DzFrameHideInterface takes nothing returns nothing\n" +
            "    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing\n" +
            "    native DzFrameGetPortrait takes nothing returns integer\n" +
            "    native DzFrameGetMinimap takes nothing returns integer\n" +
            "    native DzFrameGetCommandBarButton takes integer row, integer column returns integer\n" +
            "    native DzFrameGetHeroBarButton takes integer buttonId returns integer\n" +
            "    native DzFrameGetHeroHPBar takes integer buttonId returns integer\n" +
            "    native DzFrameGetHeroManaBar takes integer buttonId returns integer\n" +
            "    native DzFrameGetItemBarButton takes integer buttonId returns integer\n" +
            "    native DzFrameGetMinimapButton takes integer buttonId returns integer\n" +
            "    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer\n" +
            "    native DzFrameGetTooltip takes nothing returns integer\n" +
            "    native DzFrameGetChatMessage takes nothing returns integer\n" +
            "    native DzFrameGetUnitMessage takes nothing returns integer\n" +
            "    native DzFrameGetTopMessage takes nothing returns integer\n" +
            "    native DzGetColor takes integer r, integer g, integer b, integer a returns integer\n" +
            "    native DzFrameSetUpdateCallback takes string func returns nothing\n" +
            "    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing\n" +
            "    native DzFrameShow takes integer frame, boolean enable returns nothing\n" +
            "    native DzCreateFrame takes string frame, integer parent, integer id returns integer\n" +
            "    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer\n" +
            "    native DzDestroyFrame takes integer frame returns nothing\n" +
            "    native DzLoadToc takes string fileName returns nothing\n" +
            "    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing\n" +
            "    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing\n" +
            "    native DzFrameClearAllPoints takes integer frame returns nothing\n" +
            "    native DzFrameSetEnable takes integer name, boolean enable returns nothing\n" +
            "    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing\n" +
            "    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing\n" +
            "    native DzGetTriggerUIEventPlayer takes nothing returns player\n" +
            "    native DzGetTriggerUIEventFrame takes nothing returns integer\n" +
            "    native DzFrameFindByName takes string name, integer id returns integer\n" +
            "    native DzSimpleFrameFindByName takes string name, integer id returns integer\n" +
            "    native DzSimpleFontStringFindByName takes string name, integer id returns integer\n" +
            "    native DzSimpleTextureFindByName takes string name, integer id returns integer\n" +
            "    native DzGetGameUI takes nothing returns integer\n" +
            "    native DzClickFrame takes integer frame returns nothing\n" +
            "    native DzSetCustomFovFix takes real value returns nothing\n" +
            "    native DzEnableWideScreen takes boolean enable returns nothing\n" +
            "    native DzFrameSetText takes integer frame, string text returns nothing\n" +
            "    native DzFrameGetText takes integer frame returns string\n" +
            "    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing\n" +
            "    native DzFrameGetTextSizeLimit takes integer frame returns integer\n" +
            "    native DzFrameSetTextColor takes integer frame, integer color returns nothing\n" +
            "    native DzGetMouseFocus takes nothing returns integer\n" +
            "    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean\n" +
            "    native DzFrameSetFocus takes integer frame, boolean enable returns boolean\n" +
            "    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing\n" +
            "    native DzFrameGetEnable takes integer frame returns boolean\n" +
            "    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing\n" +
            "    native DzFrameGetAlpha takes integer frame returns integer\n" +
            "    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing\n" +
            "    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing\n" +
            "    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing\n" +
            "    native DzFrameSetScale takes integer frame, real scale returns nothing\n" +
            "    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing\n" +
            "    native DzFrameCageMouse takes integer frame, boolean enable returns nothing\n" +
            "    native DzFrameGetValue takes integer frame returns real\n" +
            "    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing\n" +
            "    native DzFrameSetStepValue takes integer frame, real step returns nothing\n" +
            "    native DzFrameSetValue takes integer frame, real value returns nothing\n" +
            "    native DzFrameSetSize takes integer frame, real w, real h returns nothing\n" +
            "    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer\n" +
            "    native DzFrameSetVertexColor takes integer frame, integer color returns nothing\n" +
            "    native DzOriginalUIAutoResetPoint takes boolean enable returns nothing\n" +
            "    native DzFrameSetPriority takes integer frame, integer priority returns nothing\n" +
            "    native DzFrameSetParent takes integer frame, integer parent returns nothing\n" +
            "    native DzFrameGetHeight takes integer frame returns real\n" +
            "    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing\n" +
            "    native DzFrameGetParent takes integer frame returns integer\n" +
            "    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing\n" +
            "    native DzFrameGetName takes integer frame returns string\n" +
            //  addons
            "native DzAPI_Map_SaveServerValue        takes player whichPlayer, string key, string value returns boolean\n" +
            "native DzAPI_Map_GetServerValue         takes player whichPlayer, string key returns string\n" +
            "native DzAPI_Map_Ladder_SetStat         takes player whichPlayer, string key, string value returns nothing\n" +
            "native DzAPI_Map_IsRPGLadder            takes nothing returns boolean\n" +
            "native DzAPI_Map_GetGameStartTime       takes nothing returns integer\n" +
            "native DzAPI_Map_Stat_SetStat           takes player whichPlayer, string key, string value returns nothing\n" +
            "native DzAPI_Map_GetMatchType      takes nothing returns integer\n" +
            "native DzAPI_Map_Ladder_SetPlayerStat   takes player whichPlayer, string key, string value returns nothing\n" +
            "native DzAPI_Map_GetServerValueErrorCode takes player whichPlayer returns integer\n" +
            "native DzAPI_Map_GetLadderLevel         takes player whichPlayer returns integer\n" +
            "native DzAPI_Map_IsRedVIP               takes player whichPlayer returns boolean\n" +
            "native DzAPI_Map_IsBlueVIP              takes player whichPlayer returns boolean\n" +
            "native DzAPI_Map_GetLadderRank          takes player whichPlayer returns integer\n" +
            "native DzAPI_Map_GetMapLevelRank        takes player whichPlayer returns integer\n" +
            "native DzAPI_Map_GetGuildName           takes player whichPlayer returns string\n" +
            "native DzAPI_Map_GetGuildRole           takes player whichPlayer returns integer\n" +
            "native DzAPI_Map_IsRPGLobby             takes nothing returns boolean\n" +
            "native DzAPI_Map_GetMapLevel            takes player whichPlayer returns integer\n" +
            "native DzAPI_Map_MissionComplete        takes player whichPlayer, string key, string value returns nothing\n" +
            "native DzAPI_Map_GetActivityData        takes nothing returns string\n" +
            "native DzAPI_Map_GetMapConfig           takes string key returns string\n" +
            "native DzAPI_Map_HasMallItem            takes player whichPlayer, string key returns boolean\n" +
            "native DzAPI_Map_SavePublicArchive      takes player whichPlayer, string key, string value returns boolean\n" +
            "native DzAPI_Map_GetPublicArchive       takes player whichPlayer, string key returns string\n" +
            "native DzAPI_Map_UseConsumablesItem     takes player whichPlayer, string key returns nothing\n" +
            "native DzAPI_Map_OrpgTrigger            takes player whichPlayer, string key returns nothing\n" +
            "native DzAPI_Map_GetServerArchiveDrop   takes player whichPlayer, string key returns string\n" +
            "native DzAPI_Map_GetServerArchiveEquip  takes player whichPlayer, string key returns integer\n" +
            "native RequestExtraIntegerData          takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns integer\n" +
            "native RequestExtraBooleanData          takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns boolean\n" +
            "native RequestExtraStringData           takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns string\n" +
            "native RequestExtraRealData             takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns real\n" +
            "native DzAPI_Map_GetPlatformVIP         takes player whichPlayer returns integer"
        )
    }

    static initInEnd() {
        const CJ: NoSelf & any = require('jass.common')
        const dzapi: NoSelf = require('jass.dzapi')
        for (const gk in dzapi) {
            // @ts-ignore
            let val = dzapi[gk];
            if (val) {
                // @ts-ignore
                _G[gk] = val;
            }
        }

        //同步userId
        SyncUtil.onSyncData("SL:UID", (p, uid) => {
            let userId = 0;
            if (uid && uid.length > 0) {
                userId = Number(uid);
            }
            if (IsHandle(p)) {
                MapPlayer.fromHandle(p).userId = userId;
            } else {
                print("警告：收到未知玩家发出的同步数据uid=" + uid)
            }

        });
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == CJ.MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == CJ.PLAYER_SLOT_STATE_PLAYING) {
                MapPlayer.fromHandle(tempPlayer).userId = -1;//-1代表还在获取同步中...
            }
        }
        try {
            SyncUtil.syncData("SL:UID", "" + GetUserId())
        } catch (e) {
            print(e)
        }
        //指定标准的函数
        _G.GetEventDamage = CJ.GetEventDamage;
        _G.DestroyBoolExpr = function (e: boolexpr) {
            if (e) {
                CJ.DestroyBoolExpr(e)
            }
        };
        _G.DestroyFilter = function (f: filterfunc) {
            if (f) {
                CJ.DestroyFilter(f)
            }
        };

        //解决 函数同步回调问题
        SyncUtil.onSyncData("SL:FS", (p, index) => {
            //重写 DzGetTriggerUIEventPlayer
            const base_DzGetTriggerUIEventPlayer = DzGetTriggerUIEventPlayer;
            _G.DzGetTriggerUIEventPlayer = function (this: void): player {
                return p;
            }
            EmbedJapi.cache["SL:FS:" + index]();
            _G.DzGetTriggerUIEventPlayer = base_DzGetTriggerUIEventPlayer;
        })
        EmbedJapi.solveSync("DzFrameSetScriptByCode", 3, 2)
    }

    private static cache = {}
    private static cacheIndex = 0

    /**
     * 重写需要Sync的函数
     */
    private static solveSync(funName: string, syncIndex: number, callbackIndex: number) {
        let oldFun: (this: void, ...args) => any = _G[funName];
        _G[funName] = function (this: void, ...args) {
            let sync: boolean = args[syncIndex];
            if (sync) {
                if (isAsync) {
                    log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
                    return
                }
                args[syncIndex] = false;
                EmbedJapi.cacheIndex++;
                const cacheIndexF = EmbedJapi.cacheIndex;
                EmbedJapi.cache["SL:FS:" + cacheIndexF] = args[callbackIndex];
                args[callbackIndex] = () => {
                    SyncUtil.syncData("SL:FS", cacheIndexF + "");
                };
            }
            return oldFun(...args)
        }

    }

}
