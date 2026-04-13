import Log from "@sl-wc3/Log";
import {Trigger} from "@/trigger";
import {MapPlayer} from "@/player";
import GroupUtil from "@/GroupUtil";
import ClosureCounter from "@sl-wc3/lib/debug/ClosureCounter";
import BaseUtil from "@/BaseUtil";
import FrameDebug from "@sl-wc3/lib/debug/FrameDebug";
import HandleDebug from "@sl-wc3/lib/debug/HandleDebug";

let runtime: NoSelf | any = require('jass.runtime')
let jDebug: NoSelf = require('jass.debug')
let jass: NoSelf = require('jass.common')

export default class Develop {
    static debuggerPort = 4279
    static isSocketDebug = false
    /**
     * 启用太阳编辑器游戏插件库
     */
    static _sl_egp_enable = true

    static open() {
        //test
        runtime.debugger = Develop.debuggerPort;
        runtime.console = true;
        isDebug = true;
        if (!DzTriggerRegisterSyncData) {
            print("本地开发环境DzApi不存在!请检查编辑器与相关辅助程序是否安装正确(请使用推荐的版本),加入QQ群941442872了解更多信息！")
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, '当前环境无完整Japi！');
        }
        try {
            require("_SLA_temp")
            let _SL_version_info = "编译版本号:" + _G['_SL_version_info'];
            print(_SL_version_info)
        } catch (e) {
        }
        //de 0
        if (isEmbedJapi) {
            let pv = tostring(GetPluginVersion())
            if (_G.CreateDoodad) {
                pv = pv + "_sp3"
            } else if (_G.DzGetPlayerSelectedHero) {
                pv = pv + "_sp2"
            } else if (_G.GetRealSelectItem) {
                pv = pv + "_sp1"
            }
            print("内置Japi版本=" + pv)
        }
        if (Develop.isSocketDebug) {
            pcall(function () {
                let dbg = require('debugger')
                dbg.io('listen:127.0.0.1:' + Develop.debuggerPort);
                dbg.start()
                print("启动Lua Socket调试 " + Develop.debuggerPort)
            })
        }
        //
        //加载太阳编辑器游戏插件 如果有的话
        BaseUtil.runLater(0.01, () => {
            if (Develop._sl_egp_enable) {
                try {
                    PACKAGE.path = local_map_dir_path + 'scripts\\?.lua;' +
                        local_map_dir_path + '\\?.lua;' +
                        PACKAGE.path + ';_sre\\?.lua;'
                    let _require = require;
                    _require("_sl_egp._sl_egp")
                } catch (e) {
                    print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!")
                }
            }
        })
        //
        let trigger = new Trigger()
        trigger.registerPlayerChatEvent(MapPlayer.fromIndex(0), "d", true)
        trigger.addAction(() => {
            Develop.showDebugInfo();
        })
        //
        let trigger2 = new Trigger()
        trigger2.registerPlayerChatEvent(MapPlayer.fromIndex(0), "stop", true)
        trigger2.addAction(() => {
            log.debug('暂停Lua垃圾回收:' + collectgarbage('stop'))
        })

        ClosureCounter.init()
        FrameDebug.init()
        HandleDebug.init()

    }

    static close() {
        runtime.console = false;
        isDebug = false;
        Log.enable = false;
        Log.enablePrint = false;
    }


    static showDebugInfo() {
        log.debug(Develop.getDebugInfo())
    }

    static getDebugInfo(): string {
        let str = "========Develop.showJassDebugInfo():Start========\r\n"
        str = str + '垃圾收集器在运行为：' + collectgarbage('isrunning') + "\r\n"
        let lua_memory = collectgarbage('count')
        // @ts-ignore
        let stringTs: NoSelf = string
        let lm = stringTs.format("%.3f", (lua_memory / 1024));
        str = str + '脚本引擎占用内存[' + lm + 'm]'
        if (GetUsedMemory) {
            str = str + ' GetUsedMemory=[' + GetUsedMemory() + ']'
        }
        collectgarbage('collect')
        str = str + "\r\nhandle最大值 =" + jDebug.handlemax() + "\r\n"
        str = str + "handle总数 =" + jDebug.handlecount() + "\r\n"
        str = str + "========Handle信息:========" + "\r\n"
        let handleInfoObj = Develop.calculateHandleInfoObj();
        let handleInfoObjs = [];
        for (let handleInfoObjKey in handleInfoObj) {
            let obj: any = handleInfoObj[handleInfoObjKey];
            obj.type = handleInfoObjKey;
            obj.typeName = Develop.getTypeCnName(handleInfoObjKey);
            handleInfoObjs.push(obj)
        }
        handleInfoObjs.sort(function (a, b) {
            return b.count - a.count;
        });
        for (let obj of handleInfoObjs) {
            str = str + Develop.getTypeCnName(obj.type) + "    数量: " + obj.count + "    引用计数: " + obj.reference + "\r\n"
        }
        str = str + "========Develop.showJassDebugInfo():End========" + "\r\n"
        str = str + "GroupUtil.groupObjectPool.getNumActive()=" + GroupUtil.groupObjectPool.getNumActive() + "\r\n"
        str = str + "GroupUtil.groupObjectPool.getNumIdle()=" + GroupUtil.groupObjectPool.getNumIdle() + "\r\n"
        return str;
    }

    static calculateHandleInfoObj() {
        const startIndex = 1048575;
        let handleInfoObj: { [type: string]: { count: number, reference: number, typeName: string } } = {}
        for (let i = startIndex; i < startIndex + jDebug.handlemax(); i++) {
            let handledefInfo = handledef(i2h(i));
            if (!handledefInfo || !handledefInfo.type) {
                continue
            }
            let infoObj = handleInfoObj[handledefInfo.type]
            if (!infoObj) {
                infoObj = {count: 0, reference: 0, typeName: Develop.getTypeCnName(handledefInfo.type)};
            }
            infoObj.count++;
            if (handledefInfo.reference) {
                infoObj.reference += handledefInfo.reference;
            }
            handleInfoObj[handledefInfo.type] = infoObj;
        }

        return handleInfoObj;
    }


    static typeName = {
        '+loc': '点',
        '+EIP': '点特效',
        '+EIm': '附着特效',
        '+EIf': '特效III',
        '+tmr': '计时器',
        'item': '物品',
        '+w3u': '单位',
        '+grp': '单位组',
        '+dlb': '按钮',
        '+dlg': '对话框',
        '+w3d': '可破坏物',
        '+rev': '事件',
        'alvt': '事件',
        'bevt': '事件',
        'devt': '事件',
        'gevt': '事件',
        'gfvt': '事件',
        'pcvt': '玩家聊天事件',
        'pevt': '玩家事件',
        'psvt': '事件',
        'tmet': '事件',
        'tmvt': '事件',
        'uevt': '单位事件',
        'wdvt': '可破坏物事件',
        '+flt': '过滤器',
        '+fgm': '可见度修正器',
        '+frc': '玩家组',
        'ghth': '哈希表',
        '+mdb': '多面板',
        '+ply': '玩家',
        '+rct': '矩形区域',
        '+agr': '范围',
        '+snd': '声音',
        '+tid': '计时器窗口',
        '+trg': '触发器',
        '+tac': '触发器动作',
        'tcnd': '触发器条件',
        'ipol': '物品池',
        '+mbi': '多面板项目',
        'gcch': '缓存',
        '+que': '任务'
    }

    static getTypeCnName(type: string): string {
        let name = Develop.typeName[type];
        name = name ? name : type
        if ("事件" == name) {
            name = name + "(" + type + ")";
        }
        return name;
    }


}
