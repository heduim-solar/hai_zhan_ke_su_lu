import {Trigger} from "@/w3ts/handles/trigger";
import SelectUtil from "@/util/unit/SelectUtil";
import {Frame} from "@/frame";
import {Unit} from "@/unit";
import ArchiveUtil from "@/ArchiveUtil";
import InputUtil from "@/InputUtil";
import KeyCode from "@/KeyCode";
import FramePoint from "@/FramePoint";
import SingletonUtil from "@/SingletonUtil";
import SyncUtil from "@/SyncUtil";

/** @noSelf **/
export default class DebugUtil {
    static noDebug = false;

    /**
     * 显示文本
     * @param text
     */
    static showText(text: string) {
        if (DebugUtil.noDebug) {
            return
        }
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30,
            text)
    }

    /**
     * 创建单位
     * @param unitId
     */
    static createUnit(unitId: string | "Hamg" | "Hpal" | "hfoo" | "hpea" = "Hamg"): Unit {
        return new Unit(0, unitId, 0, 0, 0)
    }

    /**
     * 显示图片
     * @param texFile
     * @param size
     */
    static showTexture(texFile: string, size: number = 0.04) {
        if (DebugUtil.noDebug) {
            return
        }
        let frame = Frame.createBackDrop();
        frame.setSize(size, size)
        frame.setAbsPoint(4, 0.3, 0.3)
        frame.setTexture(texFile, 0)
    }

    /**
     * 统计代码执行时间
     */
    static codeExecStartTime = 0;

    /**
     * 开始统计
     */
    static refreshCodeExecStartTime(): void {
        // @ts-ignore
        let o: NoSelf = os;
        DebugUtil.codeExecStartTime = o.clock();
    };

    /**
     * 获取执行时间 距离上次refreshCodeExecStartTime 过去的时间  单位秒
     */
    static countCodeExecuteTime(): number {
        // @ts-ignore
        let o: NoSelf = os;
        let useTime = o.clock() - DebugUtil.codeExecStartTime;
        return useTime
    }

    /**
     * 打印统计的时间信息
     * @param title
     */
    static printCodeExecuteTime(title: string = "函数"): void {
        // @ts-ignore
        let stringTs: NoSelf = string
        let info = title + '执行时间=' + stringTs.format("%.3f", (DebugUtil.countCodeExecuteTime() * 1000)) + "毫秒";
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, info);
        print(info);
    };

    /**
     * 计算函数执行耗时
     * @param func
     * @param title
     */
    static countExecuteTime(func: () => void, title: string = "函数"): number {
        // @ts-ignore
        let o: NoSelf = os;
        let start = o.clock();
        func();
        let useTime = o.clock() - start;
        // @ts-ignore
        let stringTs: NoSelf = string
        let info = title + '执行时间=' + stringTs.format("%.3f", (useTime * 1000)) + "毫秒";
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, info);
        print(info);
        return useTime
    }


    /**
     * 注册时间到期时的触发事件
     * @param time
     * @param actionFunc
     */
    static onTime(time: number, actionFunc: (this: void) => void) {
        let trigger = new Trigger();
        trigger.registerTimerEvent(time, false)
        trigger.addAction(actionFunc)
    }

    /**
     * 注册聊天事件
     * @param char
     * @param actionFunc
     */
    static onChat(char: string, actionFunc: (this: void) => void) {
        let trigger = new Trigger();
        trigger.registerAnyPlayerChatEvent(char, true)
        trigger.addAction(actionFunc)
    }

    /**当键盘按下时*/
    static onKeyEvent(key: number, actionFunc: (this: void) => void) {
        let t = CreateTrigger();
        DzTriggerRegisterKeyEventByCode(t, key, 1, true, null)
        TriggerAddAction(t, actionFunc)

    }


    static limitTimeCache: { [id: string]: number } = {}

    /**
     * 是否在限制次数
     * @param key
     * @param time
     */
    static isLimitTime(key: string, time: number): boolean {
        if (!DebugUtil.limitTimeCache[key]) {
            DebugUtil.limitTimeCache[key] = 1;
        }
        if (DebugUtil.limitTimeCache[key] > time) {
            return true;
        }
        DebugUtil.limitTimeCache[key] = DebugUtil.limitTimeCache[key] + 1;
        return false;
    }

    /**
     * 打印本地变量
     */
    static printLocalVars() {
        for (let i = 1; i < 1000000; i++) {
            let [name, value] = debug.getlocal(2, i);
            if (!name) {
                break
            }
            print(`${name} :`)
            print_r(value)
        }
    }


    /**
     * 移除所有单位
     */
    static removeAllUnits() {
        SelectUtil.forAllUnits(unit => {
            RemoveUnit(unit)
        })
    }

    /**
     * 移除所有物品
     */
    static removeAllItems() {
        EnumItemsInRect(bj_mapInitialPlayableArea, null, () => {
            RemoveItem(GetEnumItem())
        })
    }


    /**
     * 打开商城
     */
    static openShop() {
        _G.DzAPI_Map_HasMallItem = function (whichPlayer: player, key: string) {
            return true;
        }
        _G.DzAPI_Map_GetMallItemCount = function (whichPlayer: player, key: string) {
            return 100;
        }
    }

    /**
     * 打开商城与存档
     */
    static openShopArchiveMapLv(shop = true, Archive = true, mapLv = true) {
        BJDebugMsg("打开商城与太阳存档权限：地图等级设置为100Lv")
        if (Archive) {
            let oldGet = ArchiveUtil.get;
            ArchiveUtil.get = function (whichPlayer: player, key: string, mapLevelLimit?: number) {
                let val = oldGet(whichPlayer, key, mapLevelLimit);
                if (val == null) {
                    val = 100;
                }
                return val;
            }
        }
        if (shop) {
            _G.DzAPI_Map_HasMallItem = function (whichPlayer: player, key: string) {
                return true;
            }
            _G.DzAPI_Map_GetMallItemCount = function (whichPlayer: player, key: string) {
                return 100;
            }
        }
        if (mapLv) {
            _G.DzAPI_Map_GetMapLevel = function (whichPlayer: player) {
                return 100;
            }
        }


        _G.DzAPI_Map_ContinuousCount = function (whichPlayer: player, id: number) {
            return 100;
        }
        _G.DzAPI_Map_GetForumData = function (whichPlayer: player, id: number) {
            return 100;
        }
        _G.DzAPI_Map_Returns = function (whichPlayer: player, id: number) {
            return true;
        }
        _G.DzAPI_Map_GetGuildName = function (whichPlayer: player) {
            return "太阳公会";
        }
    }


    static numKeyFrame(num: number, name: string, callBack: (player?: player) => void, info?: string) {
        SingletonUtil.executeOnce("_sl_debug_test:numKeyFrame:tips", () => {
            BJDebugMsg("按下键盘对应的数字可以执行测试示例!")
        })
        let frame = Frame.createTEXTWithBorderBackDrop();
        let frameWidth = 0.06
        frame.setAbsPoint(FramePoint.topLeft, ((frameWidth + 0.025) * (num - 1)) + 0.06, 0.55)
        frame.setText(num + "、" + name);
        frame.setFont(0.013)
        frame.setWidth(frameWidth)
        //
        let button = Frame.createBUTTON(frame.current);
        button.setAllPoints(frame.current)

        let frameTip = Frame.createTEXTWithBorderBackDrop();
        let text = name;
        if (info) {
            text = text + "|n|n" + info;
        }
        frameTip.setText(text)
        DzFrameShow(frameTip.current, false)
        DzFrameShow(frameTip.backdropFrame.handle, false)
        frameTip.setPoint(FramePoint.topLeft, frame.handle, FramePoint.bottom, 0.02, -0.02)

        button.setOnMouseEnter(() => {
            DzFrameShow(frameTip.current, true)
            DzFrameShow(frameTip.backdropFrame.handle, true)
        });

        button.addOnMouseLeave(() => {
            DzFrameShow(frameTip.current, false)
            DzFrameShow(frameTip.backdropFrame.handle, false)
        });
        SyncUtil.onSyncData("_sl_debug_test_:" + num, (t, d) => {
            callBack(t)
            print("执行完毕:" + name)
            BJDebugMsg("执行完毕:" + name)
            if (info) {
                print(info)
                BJDebugMsg(info)
            }
        });
        let cb = function (this: void) {
            SyncUtil.syncData("_sl_debug_test_:" + num)
        }
        button.setOnClick(cb)
        InputUtil.onKeyPressed(KeyCode["VK_" + num], cb)
    }


}
