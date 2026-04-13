/**
 * ipc是异步的通讯机制
 * 当需要对游戏状态进行修改时  请使用同步函数再执行对应操作
 * 已被太阳占用的通道： _SL_***
 * 单次消息传输到接收端通常为20ms左右
 */
import SyncUtil from "@/SyncUtil";

const luaScriptFunCache = {};
export default class IpcMain {

    /**
     * 监听 channel, 当新消息到达，将通过 listener(args...) 调用 listener。
     */
    static onObjData(channel: string, listener: (this: void, objData: any) => void): void {
        webEngine.events[channel] = function (this: void, dataStr) {
            listener(JSON.parse(dataStr))
        };
    }

    /**
     * 接收从浏览器发送过来的消息
     * 监听 channel, 当新消息到达，将通过 listener(args...) 调用 listener。
     * 一个通道只能被监听一次
     */
    static on(channel: string, listener: (this: void, dataStr: string) => void): void {
        webEngine.events[channel] = listener;
    }

    /**
     * 接收从浏览器发送过来的消息
     * 并同步到所有玩家
     * 一个通道只能被监听一次
     */
    static onSync(channel: string, actionFunc: (triggerPlayer: player, data: string) => void): void {
        SyncUtil.onSyncData(channel, actionFunc);
        IpcMain.on(channel, dataStr => {
            SyncUtil.syncData(channel, dataStr)
        })
    }

    static onResponseMap: {
        [id: number]: (this: void, data: any) => void//data 返回的数据
    } = {};

    /**
     * 监听一个请求 可以通过id 返回响应数据
     * @param channel
     * @param listener
     */
    static onRequest(channel: string, listener: (this: void, objData: ReqData) => void) {
        IpcMain.onObjData(channel, listener)
    }

    private static _sl_reqIdIndex = 0;

    static request(channel: string, onResponse: (this: void, data: any) => void, data?: any) {
        IpcMain._sl_reqIdIndex++;
        let reqData: ReqData = {
            id: IpcMain._sl_reqIdIndex,
            data: data
        }
        IpcMain.send(channel, reqData);
        //接收响应
        if (onResponse != null) {
            IpcMain.onResponseMap[reqData.id] = onResponse;
        }
    }

    /**
     * @param reqId
     * @param data
     */
    static response(reqId: number, data: any) {
        let objData: ReqData = {
            id: reqId,
            data: data,
        }
        IpcMain.send("_SL_RES", objData)
    }


    /**
     * 通知浏览器消息
     */
    static send(channel: string, ...data: any[]): void {
        let args = [...data]
        let buffer: any[] = []
        let paramCount = data.length;
        for (let i = 0; i < paramCount; i += 1) {
            let value = args[i];
            let s = value;
            if (typeof (value) == 'object') {
                s = JSON.stringify(value);
            } else if (typeof (value) == 'number') {
                let [int, float] = math.modf(value);
                if (float == 0) {
                    s = tostring(int);
                } else {
                    s = tostring(value);
                    // // @ts-ignore
                    // let stringTs: NoSelf = string
                    // s = stringTs.format("%.4f", value);
                }
            } else {
                s = tostring(value);
            }
            buffer[buffer.length] = s.gsub('\\', '\\\\').gsub('blp', 'bmp');
        }
        let executeFun: (this: void, ...args: any[]) => void = webEngine[channel];
        executeFun(...buffer);
    }

    /**
     *
     * 通知浏览器执行 js
     */
    static executeJavaScript(javaScript: string): void {
        let executeFun: (this: void, jsCode: string) => void = webEngine.execute;
        executeFun(javaScript + "\r\n")//添加一个换行符 以避免在一帧中多个js拼接在一起后语法错误
    }

    /**
     * 基础监听通道消息事件
     */
    static _init0() {
        IpcMain.initOnResponseListener()
        IpcMain.initOnExecuteLuaScript()
        IpcMain.initOnExecuteLuaScriptAndReturnValue()
        IpcMain.initOnGetGV()
    }

    private static initOnResponseListener() {
        IpcMain.onObjData("_SL_RES", (objData: ReqData) => {
            IpcMain.onResponseMap[objData.id](objData.data)
            IpcMain.onResponseMap[objData.id] = null;//排泄回调
        })
    }

    private static initOnExecuteLuaScript() {
        IpcMain.on("_SL_ELS", luaScript => {
            try {
                let fun = luaScriptFunCache[luaScript];
                if (!fun) {
                    [fun] = load(luaScript);
                    luaScriptFunCache[luaScript] = fun;
                }
                fun();
            } catch (e) {
                print(e)
            }
        })
    }

    //
    private static initOnExecuteLuaScriptAndReturnValue() {
        IpcMain.onRequest("_SL_ELSARV", reqData => {
            try {
                let fun = luaScriptFunCache[reqData.data];
                if (!fun) {
                    [fun] = load(reqData.data);
                    luaScriptFunCache[reqData.data] = fun;
                }
                let result = fun();
                IpcMain.response(reqData.id, result)
            } catch (e) {
                print(e)
            }
        })
    }

    //
    private static initOnGetGV() {
        IpcMain.onRequest("_SL_GGV", reqData => {
            try {
                IpcMain.response(reqData.id, gv[reqData.data])
            } catch (e) {
                print(e)
            }
        })
    }

}