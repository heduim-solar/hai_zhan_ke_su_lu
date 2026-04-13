import {Trigger} from "@/trigger";
import SingletonUtil from "@/SingletonUtil";
import DataBase from "@/DataBase";
import KeyCode from "@/KeyCode";
import FrameDebug from "@sl-wc3/lib/debug/FrameDebug";

export default class SolarReload {
    static config = {}
    static TriggerHandle = []
    static TimerHandle = []
    static frameHandle = []
    static unitHandle = []
    static itemHandle = []

    static init() {
        if (_G.SolarReloadInitED) {
            return
        }
        _G.SolarReloadInitED = true;
        if (!local_map_dir_path) {
            return;
        }
        try {
            log.debug("local_map_dir_path=" + local_map_dir_path)
            if (isEmbedBrowser && webEngine) {
                webEngine.path =
                    local_map_dir_path + 'webapp\\dist;'
                    + local_map_dir_path + 'webapp\\public\\;'
                    + local_map_dir_path + 'webapp;'
                    + local_map_dir_path + 'frontend;'
                    + local_map_dir_path + 'resource;'
                    + webEngine.path
            }
        } catch (e) {
            print(e)
        }

        SolarReload.autoReload();

        //勾住创建的触发
        let jassCreateTrigger = CreateTrigger;
        _G.CreateTrigger = function (this: void): trigger {
            let hdl = jassCreateTrigger()
            SolarReload.TriggerHandle.push(hdl)
            return hdl;
        }
        //勾住创建的计时器
        let jassCreateTimer = CreateTimer;
        _G.CreateTimer = function (this: void): timer {
            let hdl = jassCreateTimer()
            SolarReload.TimerHandle.push(hdl)
            return hdl;
        }
        //勾住创建的UI
        let jassDzCreateFrameByTagName = DzCreateFrameByTagName;
        _G.DzCreateFrameByTagName = function (this: void, frameType: string, name: string, parent: number, template: string, id: number): number {
            let hdl = jassDzCreateFrameByTagName(frameType, name, parent, template, id)
            SolarReload.frameHandle.push(hdl)
            return hdl;
        }
        //勾住创建的Unit
        let jassCreateUnit = CreateUnit;
        _G.CreateUnit = function (this: void, id: player, unitid: number | string, x: number, y: number, face: number): unit {
            let hdl = jassCreateUnit(id, unitid, x, y, face)
            SolarReload.unitHandle.push(hdl)
            return hdl;
        }
        //勾住创建的Item
        let jassCreateItem = CreateItem;
        _G.CreateItem = function (this: void, itemid: number | string, x: number, y: number): item {
            let hdl = jassCreateItem(itemid, x, y)
            SolarReload.itemHandle.push(hdl)
            return hdl;
        }


        //触发

        if (DzTriggerRegisterKeyEventByCode && !_G.HasTriggerRegisterKeyEvent) {//判断有本地japi硬件事件环境
            let t = jassCreateTrigger();
            //F9刷新
            // TriggerRegisterPlayerEvent(t, GetLocalPlayer(), EVENT_PLAYER_ARROW_UP_DOWN)
            DzTriggerRegisterKeyEventByCode(t, KeyCode.VK_F9, 1, true, null)
            TriggerAddAction(t, () => {
                SolarReload.reload();
            })
        }
        _G.HasTriggerRegisterKeyEvent = true;
        _G.reloadCount = 1;
    }


    static autoReload() {
        _G.scripts_lastModified = -1;
        PACKAGE.loaded["_SLA_temp"] = null
        try {
            require("_SLA_temp")
        } catch (e) {
        }
        _G.scripts_last_reload = _G.scripts_lastModified;
        let trigger = new Trigger();
        trigger.registerTimerEvent(0.5, true);
        trigger.addAction(() => {
            PACKAGE.loaded["_SLA_temp"] = null
            try {
                require("_SLA_temp")
            } catch (e) {
            }
            if (_G.scripts_lastModified > _G.scripts_last_reload) {
                _G.scripts_last_reload = _G.scripts_lastModified;
                if (time > 3000) {//3秒后才能开始自动更新
                    print("======自动更新======")
                    print("_G.scripts_lastModified=" + _G.scripts_lastModified)
                    print("_G.scripts_last_reload=" + _G.scripts_last_reload)
                    SolarReload.reload();
                }
            }
        });
    }

    static reload() {
        _G.reloadCount++;
        let info = 'No.' + _G.reloadCount + ' [重新加载代码脚本]!' + time;
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, info);
        print(info)
        //干掉lua已加载的脚本
        for (let loadedKey in PACKAGE.loaded) {
            //太阳的不需要热更新
            if (loadedKey && loadedKey.indexOf("solar.") >= 0) {
                continue
            }
            PACKAGE.loaded[loadedKey] = null;
        }
        se.clear()
        SingletonUtil.cache.clear()
        SingletonUtil._sl_cache = {}
        FrameDebug.frameName = {}
        DataBase['dataBaseContext'] = {}
        //销毁已注册的数据
        for (let handleElement of SolarReload.TriggerHandle) {
            TriggerClearActions(handleElement)
            DisableTrigger(handleElement)
            DestroyTrigger(handleElement)
        }
        for (let handleElement of SolarReload.TimerHandle) {
            DestroyTimer(handleElement)
        }
        for (let handleElement of SolarReload.unitHandle) {
            RemoveUnit(handleElement)
        }
        for (let handleElement of SolarReload.itemHandle) {
            RemoveItem(handleElement)
        }
        for (let handleElement of SolarReload.frameHandle) {
            if (handleElement && handleElement > 0) {
                try {
                    DzDestroyFrame(handleElement)
                } catch (e) {
                    print("销毁Frame出错:" + handleElement + "=" + tostring(e))
                }
            }
        }
        SolarReload.TriggerHandle = []
        SolarReload.TimerHandle = []
        SolarReload.frameHandle = []
        require("App")
    }


}
