import SolveLuaAsyn from "@sl-wc3/lib/compatible/SolveLuaAsyn";
import BaseUtil from "@/BaseUtil";
import EmbedJapi from "@sl-wc3/lib/compatible/EmbedJapi";
import DzApiHelper from "@sl-wc3/lib/compatible/DzApiHelper";
import Constant from "@/Constant";
import Log from "@sl-wc3/Log";
import Develop from "./Develop";
import Es from "@sl-wc3/lib/compatible/Es";
import ErrorMsgHelper from "@/ErrorMsgHelper";
import IDAdapter from "@sl-wc3/lib/compatible/IDAdapter";
import YDWE from "@sl-wc3/lib/compatible/YDWE";
import SolarDataClearState from "@/SolarDataClearState";
import YiYiEnv from "@sl-wc3/lib/compatible/yiyi/YiYiEnv";
import SolarReload from "@sl-wc3/SolarReload";
import SolarGlobalVars from "@/SolarGlobalVars";
import KKImplementEmbedJapi from "@sl-wc3/lib/compatible/kk/KKImplementEmbedJapi";
import ErrorFrame from "@/ErrorFrame";

const CJ: NoSelf = require('jass.common')
const globals: NoSelf = require('jass.globals')
const japi: NoSelf = require('jass.japi')
const ai: NoSelf = require('jass.ai')
const slk: NoSelf = require('jass.slk')
const runtime: NoSelf | any = require('jass.runtime')
const jConsole: NoSelf = require('jass.console')
const jDebug: NoSelf = require('jass.debug')
const jMessage: NoSelf = require('jass.message')
const storm: NoSelf = require('jass.storm')
_G.log = new Log();

export default class GlobalVars {
    static isInit: boolean = false;
    private static justInvoke: boolean = GlobalVars.init0();

    //要调一个函数 以免import GlobalVars 被编译器取消了
    /**
     * @param debug 是否调试模式
     * @param egp_enable 是否启用太阳编辑器游戏插件  (是否打开游戏左上角太阳Logo按钮) 平台测试异步时最好关闭此项 以免因版本不一致导致异步
     */
    static init(debug: boolean = isDebug, egp_enable = debug) {
        if (_G.GlobalVars_init) {
            return
        }
        SolarGlobalVars.init(debug, egp_enable);
        // @ts-ignore
        _G.isDebug = debug;
        Develop._sl_egp_enable = egp_enable;
        if (isDebug) {
            Develop.open()
            //热加载lua
            if (DzTriggerRegisterSyncData) {
                SolarReload.init()
            } else {
                log.debug("本地Dzapi环境不存在！未启动热加载模块！")
            }
        } else {
            Develop.close()
        }
        ErrorFrame.init();
        _G.GlobalVars_init = true;
    }

    public static initOnMain(): void {
        GlobalVars.set2G(globals);
        if (isEmbedJapi) {
            EmbedJapi.initInEnd()
            print("初始化内置Japi环境")
        }
        //解决lua 异步问题
        SolveLuaAsyn.init()
        //11实现 dz
        if (is_11Platform) {
            YiYiEnv.initInEnd()
        }
        //判断是否kk平台
        if (DzGetActivePatron != null) {
            KKImplementEmbedJapi.init()
        }
    }


    private static init0(): boolean {
        if (GlobalVars.isInit) {
            return true;
        }
        GlobalVars.isInit = true;
        try {
            require('env_vars')
        } catch (e) {
        }
        isDebug = (storm.load(local_map_dir_path + "/src/App.ts") != null) && (storm.load("war3mapunits.doo") != null)
        if (isDebug) {
            runtime.console = true; //如果App start不执行 可以在此启用控制台 以debug 此类的代码是否正常执行
        }
        GlobalVars.initBaseLuaEnv();
        //初始化所有jass.xxx的值 到_G全局变量上
        GlobalVars.set2G(jDebug)
        GlobalVars.set2G(CJ)
        GlobalVars.set2G(ai)
        GlobalVars.set2G(japi)
        _g_objs = slk as any;
        GlobalVars.set2G(jMessage);
        for (const gk in DzApiHelper) {
            // @ts-ignore
            if (gk.startsWith("Dz") || gk.startsWith("KK")) {
                // @ts-ignore
                _G[gk] = DzApiHelper[gk];
            }
        }
        //初始化基础的方法与变量到_G全局变量上
        GlobalVars.initBaseVars();

        //实现bj 函数
        require('blizzard')
        //InitBlizzard() //lua初始化bj [see war3map.j]
        //实现大部分逆天 函数
        require('solar_addons')
        //解决lua 的数学库 异步问题
        SolveLuaAsyn.SolveMathAsyn();
        //业务上的初始化
        BaseUtil.init();
        Constant.init()
        IDAdapter.init()
        YDWE._sl_init()
        SolarDataClearState._sl_hookClearHandle();
        DzLoadToc?.("solar_asset\\ui\\base.toc")
        return true;
    }


    private static set2G(obj: any): void {
        //init obj 2 _G
        for (const gk in obj) {
            //注意 有些作者自定义变量可能会跟lua核心变量冲突 所以这里判断一下 不要覆盖了核心库
            if ("table" == gk) {
                continue
            }
            // @ts-ignore
            _G[gk] = obj[gk];
        }
    }

    /**
     * 初始化Lua环境
     */
    private static initBaseLuaEnv(): void {
        Es.init()
        targetLanguage = "lua"
        //重载print,自动转换编码
        _G.print = function (...args: any[]) {
            jConsole.write(...args)
        };
        //lua error_handle 异常打印
        runtime.error_handle = ErrorMsgHelper.error_handle;
        runtime.handle_level = 0;
        //判断lua环境是否为内置japi
        isEmbedJapi = (japi.GetPluginVersion != null);
        if (isEmbedJapi) {
            EmbedJapi.init()
        }
        //判断lua环境是否为内置浏览器
        isEmbedBrowser = (japi.InitHtml5Plugin != null);
        //判断是否11平台
        is_11Platform = (japi.EXNetIsYYHighLadder != null);
        if (is_11Platform) {
            YiYiEnv.init()
        }


        //实现 json
        require('base')
        require('json')
    }


    private static initBaseVars(): void {
        isBigAttributeMode = false;
        StrHpBonus = S2R(_g_objs.misc["Misc"]["StrHitPointBonus"]);
        AgiDefenseBonus = S2R(_g_objs.misc["Misc"]["AgiDefenseBonus"]);
        IntManaBonus = S2R(_g_objs.misc["Misc"]["IntManaBonus"]);
        PrimaryAttackBonus = S2R(_g_objs.misc["Misc"]["StrAttackBonus"]);
        ArmorReducesDamageFactor = S2R(_g_objs.misc["Misc"]["DefenseArmor"]);
        PawnItemRate = S2R(_g_objs.misc["Misc"]["PawnItemRate"] || "0.5");
        // print("PrimaryAttackBonus=" + PrimaryAttackBonus + "    ArmorReducesDamageFactor=" + ArmorReducesDamageFactor)

        tempLocation = Location(0, 0);
        tempGroup = CreateGroup();
        _tempGroup = CreateGroup();
        _sl_tempGroup1 = CreateGroup();
        _sl_tempGroup2 = CreateGroup();
        _sl_tempGroup3 = CreateGroup();
        // @ts-ignore
        _G.globals = globals

        _G.UnitAlive = function (this: void, unit: unit) {
            return GetUnitState(unit, UNIT_STATE_LIFE) > 0.405 && !IsUnitType(unit, UNIT_TYPE_DEAD);
        }

        let old_handle_ref = handle_ref;
        _G.handle_ref = function (h: handle) {
            if (!IsHandle(h)) {
                log.errorWithTraceBack("无法增加一个空handle的引用!")
                return
            }
            let defInfo = handledef(h);

            if (!defInfo.reference || defInfo.reference <= 0) {
                log.errorWithTraceBack("无法增加一个0引用的handle的引用!请提前增加引用。" +
                    "因为此handle已经是空闲的handle了，马上就会被底层重用了！" + tostring(defInfo?.reference))
                return
            }
            old_handle_ref(h);
        }
        let old_handle_unref = handle_unref;
        _G.handle_unref = function (h: handle) {
            if (!IsHandle(h)) {
                log.errorWithTraceBack("无法减少一个空handle的引用!")
                return
            }
            let defInfo = handledef(h);

            if (!defInfo.reference || defInfo.reference <= 0) {
                log.errorWithTraceBack("无法减少一个0引用的handle的引用!请提前使用handle_ref增加引用!" + tostring(defInfo?.reference))
                return
            }
            old_handle_unref(h);
        }
        _G.handle_clearref = function (h: handle) {
            if (!IsHandle(h)) {
                return
            }
            for (let i = 0; i < 10000; i++) {
                if (handledef(h).reference > 0) {
                    handle_unref(h)
                } else {
                    return;
                }
            }
        }
        _G.char2number = function (char: string): number {
            // @ts-ignore
            let t: NoSelf = string
            return t.byte(char, 1);
        }

        _G.deleteKey = function (obj: any, key: number | string | any): void {
            // delete obj[key]
            if (obj) {
                obj[key] = null;
            }
        }
        let oldUnitDropItemSlot = UnitDropItemSlot;
        _G.UnitDropItemSlot = function (whichUnit: unit, whichItem: item, slot: number): boolean {
            gv.isUnitDropItemSlotExecIng = true;
            let b = oldUnitDropItemSlot(whichUnit, whichItem, slot);
            gv.isUnitDropItemSlotExecIng = false;
            return b;
        }

        _G.HttpRequest = function (url: string, post: string, onResult: (this: void, result: string) => void): any {
            if (post_message) {
                return post_message(url, post, onResult)
            } else {
                let info = "此函数暂时未兼容你的脚本环境!";
                print(info)
                onResult(info);
            }
            return false;
        }
    }


}
