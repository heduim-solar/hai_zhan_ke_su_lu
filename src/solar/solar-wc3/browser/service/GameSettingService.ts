import IpcMain from "@sl-wc3/IpcMain";

declare type DataType = {
    key: string//
    value: any//
}
export default class GameSettingService {

    constructor() {
        this.regSetSettings()
        this.regSetPlayerIdSetting()
    }


    regSetSettings() {
        IpcMain.onSync("_SL_setSettings", (t, dataStr) => {
            let data: DataType = JSON.parse(dataStr);
            settings[data.key] = data.value
            if ("gameDifficulty" == data.key) {
                se.emit("选择难度", data.value)
            }else if ("gameMode" == data.key) {
                se.emit("选择模式", data.value)
            }
        })
    }

    regSetPlayerIdSetting() {
        IpcMain.onSync("_SL_setPlayerIdSetting", (t, dataStr) => {
            let data: DataType = JSON.parse(dataStr);
            let obj: { [playerId: number]: any } = settings[data.key];
            if (!obj) {
                obj = {}
                settings[data.key] = obj;
            }
            obj[GetPlayerId(t)] = data.value
        })
    }


}