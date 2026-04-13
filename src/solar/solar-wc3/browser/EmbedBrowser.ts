import IpcMain from "./IpcMain";

export default class EmbedBrowser {

    private static justInvoke: boolean = EmbedBrowser.init0();


    private static init0(): boolean {
        let _require = require
        webEngine = _require("javascript")
        let newPath = ";webapp;webapp\\dist;webapp\\public;frontend;resource;";
        if (webEngine.path) {
            newPath = webEngine.path + newPath;
        }
        webEngine.path = newPath;
        webEngine.events = {}
        webEngine.events.on_debugf = function (this: void, level, file_name, line, message: string) {
            if (!message || message.indexOf("Access-Control-Allow-Origin") >= 0) {
                return;//跨域报错信息不要显示了
            }
            print(`WebLog:${webEngine.events.trigger_handle} =>  ${message}`)
        }
        IpcMain._init0()

        return true;
    }


}
