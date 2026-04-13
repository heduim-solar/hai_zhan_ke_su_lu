/** @noSelf **/
import CodecUtil from "../math/CodecUtil";
import SyncUtil from "../net/SyncUtil";

/**
 将存档key 与存档值 作为Json字符串 统一存储到本地文件上
 每个玩家只将自己的存档数据存档自己的本地文件上 (即本地玩家存档到本地电脑)
 读取存档时 读取本地电脑的存档文件 然后同步给其他玩家 然后读取同步到的数据 （即要保证使用存档时 所有玩家的存档已经同步完成）
 如需更换电脑的玩家 可手动将游戏根目录下的solar文件夹 复制过去即可
 (为防止玩家复制存档文件 可将存档数据md5后 保存到平台服务器一个key上 用于辨别是否是自己的存档文件)
 */
export default class LocalArchiveUtil {

    static playerDatas: { [playerIndex: string]: { [key: string]: any } } = {}
    static fileName = "LocalArchive_" + CodecUtil.md5hex(gameName) + ".sdb"


    /**
     *
     * @param whichPlayer
     * @param key
     * @param mapLevelLimit 地图等级限制（当玩家地图等级小于此数字时返回null）
     */
    static get(whichPlayer: player, key: string, mapLevelLimit: number = 0) {
        LocalArchiveUtil._init0();
        if (mapLevelLimit > 0 && DzAPI_Map_GetMapLevel(whichPlayer) < mapLevelLimit) {
            return null;
        }
        let data = LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            return null;
        }
        return data[key];
    }

    /**
     * 保存一个玩家存档
     * @param whichPlayer
     * @param key
     * @param value
     * @param saveAll
     */
    static set(whichPlayer: player, key: string, value: any, saveAll = false) {
        LocalArchiveUtil._init0();
        let data = LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        data[key] = value;
        if (saveAll) {
            LocalArchiveUtil.saveAll(whichPlayer)
        }
    }

    /**
     *获取所有存档
     */
    static getAllArchive(whichPlayer: player): any {
        LocalArchiveUtil._init0();
        return LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
    }

    /**
     * 打印所有存档 方便调试查看
     * @param whichPlayer
     */
    static printAllArchive(whichPlayer: player): void {
        LocalArchiveUtil._init0();
        let data = LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            return;
        }
        print("========打印玩家" + (GetPlayerId(whichPlayer) + 1) + "的存档 开始========")
        for (let dataKey in data) {
            print(dataKey + "=[" + data[dataKey] + "]")
        }
        print("========打印玩家" + (GetPlayerId(whichPlayer) + 1) + "的存档 结束========")
    }

    /**
     * base
     * 清空所有存档
     */
    static clearAllArchive(whichPlayer: player = GetLocalPlayer()): void {
        LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = {}
        if (whichPlayer == GetLocalPlayer()) {
            LocalArchiveUtil.saveAll(whichPlayer)
        }
        print("已清空全部存档!")
    }

    /**
     * 保存本地玩家所有存档到本地磁盘
     * @param whichPlayer
     */
    static saveAll(whichPlayer: player = GetLocalPlayer()): void {
        if (whichPlayer != GetLocalPlayer()) {
            return
        }
        let data = LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            LocalArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        let dataJsonStr: string = JSON.stringify(data);
        let [file] = io.open("solar/" + LocalArchiveUtil.fileName, "wb");
        file.write(CodecUtil.saesEncode(dataJsonStr))
        file.close()

    }


    private static isInit = false;

    private static _init0(): boolean {
        if (LocalArchiveUtil.isInit) {
            return true;
        }
        LocalArchiveUtil.isInit = true;
        SyncUtil.onSyncBigData("SL:LAU", (player, dataJsonStr) => {
            //转json了
            let playerId = GetPlayerId(player);
            if (dataJsonStr.length > 2) {
                try {
                    let data = JSON.parse(dataJsonStr);
                    LocalArchiveUtil.playerDatas["P" + playerId] = data;
                    log.debug("玩家" + (playerId + 1) + ":的存档数据为:" + dataJsonStr)
                } catch (e) {
                    log.errorWithTraceBack("存档Json解析出错!")
                    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '存档Json解析出错！');
                    print("需要解析的Json字符串为[" + dataJsonStr + "]")
                    LocalArchiveUtil.playerDatas["P" + playerId] = {};
                }
            } else {
                LocalArchiveUtil.playerDatas["P" + playerId] = {};
            }
            log.debug(`玩家${playerId + 1}本地存档同步完成！` + dataJsonStr.length)
        })
        LocalArchiveUtil._init_SyncData();
        return true;
    }

    private static _init_SyncData(): boolean {
        let dataJsonStr: string = "";
        // 读取文件并显示
        let [file] = io.open("solar/" + LocalArchiveUtil.fileName, "rb")
        if (file) {
            let ciphertext = file.read("*a" as any) as string;
            // print("ciphertext:" + tostring(ciphertext))
            dataJsonStr = CodecUtil.saesDecode(ciphertext);
            file.close()
        }
        // print("dataJsonStr:" + tostring(dataJsonStr))
        SyncUtil.syncBigData("SL:LAU", dataJsonStr)
        return true;
    }

}
