/** @noSelf **/
import CodecUtil from "../math/CodecUtil";
import BaseUtil from "../BaseUtil";
import {MapPlayer} from "@/w3ts/handles/player";
import DataBase from "@/DataBase";

/**
 将存档key 与存档值 作为Json字符串 统一存储到平台服务器上
 因此请尽量减少key的长度 以多存内容

 修改玩家名之后将导致存档失效

 已被占用的key: _SL  _SH _SI//用作存储存档玩家的地图等级 玩家名字哈希 和玩家账号id 防止盒子佬一键复制别人的存档
 */
declare global {
    interface ArchiveData {
        _SL?: number
        _SH?: number
        _SI?: number
        /**total time = 当前地图总计游玩时间(分钟)*/
        _tt?: number
        /**最大刷怪等级 =最大无尽波数*/
        _mel?: number
        /**难度通关积分 _n1-xx*/
        _n1?: number
        _n2?: number
        _n3?: number

        [key: string]: any
    }
}

/**
 * @deprecated
 * 此旧存档方式数据量过大时有几率导致丢档
 * 请迁移到新的 ArchiveUtil.ts
 *
 */
export default class Old_ArchiveUtil {
    //加密 请在地图发布前就确定是否需要加密以及加密的方式。发布后不能更改此选项 否则会造成旧存档被清空
    /**
     * 是否加密
     */
    static encrypt: boolean = true;
    /**
     * 是否校验玩家名
     * （本地开发时不校验 以免本地玩家1跟本地玩家2存档校验冲突）
     */
    static verifyPlayerName: boolean = !isDebug;
    /**是否校验玩家地图等级
     * (在某P平台使用经验书 会出现等级上去了又退回来的情况 可能导致存档等级比地图等级高 重启平台可以解决问题)
     * */
    static verifyPlayerMapLv: boolean = false;
    /**
     * 最大存档key 长度
     */
    static ArchiveKeyCountMax: number = 150 - 10;
    static salt: string = "s_z_b_s_q_j";
    //11平台最大8位
    static baseArchiveKeyPrefix: string = "SA_";
    static defaultLimitKey: string = null;
    //
    static playerDatas: { [playerIndex: string]: ArchiveData } = {}
    private static _sl_playerCurrentArchiveKeyMax: { [currentArchiveKeyMax: string]: number } = {}
    private static _init_time = -1;


    /**
     * 获取玩家地图存档 没有则返回null
     * @param whichPlayer
     * @param key
     * @param limitVal 值限制 传0则不限制（当玩家对应的存档key小于此数字时返回null）
     * @param limitKey 限制存档key 传null则为地图等级限制 (通常用通关次数 并且在后台限制了每日获取量的基础存档key)
     */
    static get(whichPlayer: player, key: string, limitVal: number = 0, limitKey: string = Old_ArchiveUtil.defaultLimitKey): null | any {
        Old_ArchiveUtil._init0();
        if (limitVal > 0) {
            let sVal = limitKey ? S2I(DzAPI_Map_GetServerValue(whichPlayer, limitKey)) : DzAPI_Map_GetMapLevel(whichPlayer)
            if (sVal < limitVal) {
                return null;
            }
        }
        let data = Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            return null;
        }
        return data[key];
    }

    /**
     * 保存玩家的一个存档
     * @param whichPlayer
     * @param key
     * @param value
     * @param isSaveAll 是否立即上传到服务器存档(批量设置值时可以先填false 最后再统一上传 节省一丝性能)
     */
    static set(whichPlayer: player, key: string, value: any, isSaveAll: boolean = true) {
        Old_ArchiveUtil._init0();
        let data = Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        data[key] = value;
        if (isSaveAll) {
            Old_ArchiveUtil.saveAll(whichPlayer)
        }
    }

    /**
     *获取所有存档
     */
    static getAllArchive(whichPlayer: player): ArchiveData {
        Old_ArchiveUtil._init0();
        return Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
    }

    /**
     * 打印某个玩家的所有存档 调试时用
     * @param whichPlayer
     */
    static printAllArchive(whichPlayer: player): void {
        Old_ArchiveUtil._init0();
        let data = Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
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
     * 清空所有存档
     */
    static clearAllArchive(whichPlayer: player): void {
        Old_ArchiveUtil._init0();
        Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = {};
        for (let i = 0; i < Old_ArchiveUtil.ArchiveKeyCountMax; i++) {
            let key: string = Old_ArchiveUtil.baseArchiveKeyPrefix + i;
            DzAPI_Map_FlushStoredMission(whichPlayer, key);
        }
        print("已清理全部存档!")
    }

    /**
     * 获取玩家当前使用的存档栏位
     */
    static getCurrentArchiveKeyMax(whichPlayer: player): number {
        Old_ArchiveUtil._init0();
        return Old_ArchiveUtil._sl_playerCurrentArchiveKeyMax["P" + GetPlayerId(whichPlayer)] || 0;
    }

    /**
     * 获取玩家当前使用的存档栏位 提示信息
     */
    static getCurrentArchiveKeyMaxInfo(whichPlayer: player): string {
        let used = Old_ArchiveUtil.getCurrentArchiveKeyMax(whichPlayer);
        let p = Math.ceil(used * 100 / Old_ArchiveUtil.ArchiveKeyCountMax)
        let info = "(" + p + "%)";
        if (p > 90) {
            info = "|cffff0000" + info
        } else if (p > 80) {
            info = "|cffe24700" + info
        } else if (p > 70) {
            info = "|cffdb7835" + info
        } else {
            info = "|cff0a8f17" + info
        }
        return used + "/" + Old_ArchiveUtil.ArchiveKeyCountMax + info;
    }

    /**
     * 保存玩家的所有存档数据
     */
    static saveAll(whichPlayer: player): void {
        if (isDebug && (Old_ArchiveUtil._init_time + 500) > time) {
            print("本地存档提示:本地调试情况下多玩家公用一个本地存档文件，保存与初始化相隔太近可能导致后初始化读取存档的玩家读到更新后的存档文件。导致多玩家存档不一致")
            log.errorWithTraceBack("(PS:即一个玩家初始化存档后 再保存存档，另外一个玩家才执行到初始化存档，就会导致2个玩家读取到的存档文件不是一个版本的。这可能导致本地多玩家调试时异步)")
            BaseUtil.runLater(1, () => {
                print("本地存档提示:延迟1秒再保存。")
                Old_ArchiveUtil.saveAll(whichPlayer);
            })
            return;
        }
        let data = Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            Old_ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        //设置地图等级 以作存档验证  _SI
        data._SL = DzAPI_Map_GetMapLevel(whichPlayer);
        data._SH = StringHash(GetPlayerName(whichPlayer));
        data._SI = MapPlayer.fromHandle(whichPlayer).userId;
        data._tt = (DataBase.getPlayerSolarData(whichPlayer)._tt || 0) + Math.floor(time / 1000 / 60);

        let dataJsonStr: string = JSON.stringify(data);
        if (Old_ArchiveUtil.encrypt) {
            dataJsonStr = CodecUtil.saesEncode(dataJsonStr, gameName + Old_ArchiveUtil.salt)
        }
        let dataJsonStrLength = dataJsonStr.length;
        let keyLength = math.floor(dataJsonStrLength / 64) + 1;
        log.debug("玩家" + (GetPlayerId(whichPlayer) + 1) + ":的存档栏位大小为:" + keyLength)
        if (keyLength > Old_ArchiveUtil.ArchiveKeyCountMax) {
            log.errorWithTraceBack("存档栏位大小超过" + Old_ArchiveUtil.ArchiveKeyCountMax + "！" + keyLength)
            return;
        }
        for (let i = 0; i < keyLength; i++) {
            let endIndex = (i + 1) * 64;
            if (endIndex > dataJsonStrLength) {
                endIndex = dataJsonStrLength;
            }
            let oneData = dataJsonStr.substring(i * 64, endIndex)
            let key: string = Old_ArchiveUtil.baseArchiveKeyPrefix + i;
            DzAPI_Map_SaveServerValue(whichPlayer, key, oneData);
        }
        //清空后一个存档栏位 以标记结束
        let key: string = Old_ArchiveUtil.baseArchiveKeyPrefix + keyLength;
        DzAPI_Map_FlushStoredMission(whichPlayer, key);
        Old_ArchiveUtil._sl_playerCurrentArchiveKeyMax["P" + GetPlayerId(whichPlayer)] = keyLength;
    }


    /**
     * 初始化存档数据
     * @private
     */
    private static isInit = false;

    private static _init0(): boolean {
        if (Old_ArchiveUtil.isInit) {
            return true;
        }
        Old_ArchiveUtil.isInit = true;
        Old_ArchiveUtil._init_time = time;
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);

            if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                let playerAllArchiveData = Old_ArchiveUtil._init0_onePlayer(tempPlayer);
                Old_ArchiveUtil.playerDatas["P" + i] = playerAllArchiveData;
                DataBase.getPlayerSolarData(tempPlayer, true)._tt = (playerAllArchiveData._tt || 0)
            }
        }
        se.playerChat("-sl-ia", (p) => {
            DisplayTimedTextToPlayer(p, 0, 0, 10, Old_ArchiveUtil.getCurrentArchiveKeyMaxInfo(p));
        });
        se.playerChat("-sl-save", (p) => {
            Old_ArchiveUtil.saveAll(p);
            DisplayTimedTextToPlayer(p, 0, 0, 10, '保存存档完毕! tt=' + tostring(Old_ArchiveUtil.getAllArchive(p)._tt));
        });
        //
        return true;
    }

    private static _init0_onePlayer(tempPlayer: player) {
        let data: any = {};
        let pId = GetPlayerId(tempPlayer);
        let dataJsonStr: string = "";
        for (let i = 0; i < Old_ArchiveUtil.ArchiveKeyCountMax; i++) {
            let key: string = Old_ArchiveUtil.baseArchiveKeyPrefix + i;
            let serverValue: string = DzAPI_Map_GetServerValue(tempPlayer, key);
            if (serverValue && serverValue.length > 0) {
                dataJsonStr = dataJsonStr + serverValue;
            } else {
                Old_ArchiveUtil._sl_playerCurrentArchiveKeyMax["P" + pId] = i;
                break;
            }
        }
        //转json了
        if (dataJsonStr.length < 2) {
            return {};
        }
        try {
            if (Old_ArchiveUtil.encrypt) {
                dataJsonStr = CodecUtil.saesDecode(dataJsonStr, gameName + Old_ArchiveUtil.salt)
                if (dataJsonStr == null) {//存档解密失败 说明玩家改存档了
                    print("存档Json格式解析出错!")
                    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '存档格式解析出错！请不要私自修改存档数据！');
                    return {};
                }
            }

            data = JSON.parse(dataJsonStr);
            log.debug("玩家" + (pId + 1) + ":的存档数据为:" + dataJsonStr)
            //验证存档
            if (Old_ArchiveUtil.verifyPlayerMapLv && DzAPI_Map_GetMapLevel(tempPlayer) < data._SL) {
                print("存档验证失败!默认使用空存档!")
                data = {}
                BaseUtil.runLater(1, () => {
                    CustomDefeatBJ(tempPlayer, "警告:存档验证失败C1！");
                })
            }
            //验证玩家名哈希
            let shTemp = StringHash(GetPlayerName(tempPlayer));
            let userId = MapPlayer.fromHandle(tempPlayer).userId;
            if (userId == -1) {
                //userId 还在获取同步中...
                const info = "提示:请不要再地图初始时获取存档！应当延迟执行存档逻辑!";
                // DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, info);
                print(info)
                print("请等待内置userId(用户id)同步完成！(为了解决玩家名更改后靠userId判断是否是自己的存档)")
                log.errorWithTraceBack(info)
            }
            //校验存档
            if (Old_ArchiveUtil.verifyPlayerName && data._SH && data._SH != shTemp) {//如果玩家名哈希不一样  则说明玩家改名或则复制了别人的存档
                if (data._SI && data._SI > 0 && data._SI == userId) {//说明存档就是本玩家的
                    print("检测到玩家改名了！自动修正存档!")
                } else {
                    //存档有问题的玩家 自己清空存档并退出游戏
                    data = {}
                    DisplayTimedTextToPlayer(tempPlayer, 0, 0, 60, '存档玩家名验证失败!请主动退出游戏或使用空存档继续游玩!');
                    // BaseUtil.runLater(1, () => {
                    //     CustomDefeatBJ(tempPlayer, "警告:存档验证失败C2！");
                    // })
                }
            }
            //设置
            return data;
        } catch (e) {
            print("存档Json格式解析出错!")
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '存档格式解析出错！请不要私自修改存档数据！');
            print("需要解析的Json字符串为[" + dataJsonStr + "]")
        }
        return data;
    }
}
