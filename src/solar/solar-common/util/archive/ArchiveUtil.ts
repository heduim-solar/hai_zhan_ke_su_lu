/** @noSelf **/
import CodecUtil from "../math/CodecUtil";
import DataBase from "@/DataBase";
import {MapPlayer} from "@/player";

/**
 太阳存档第二版本 将存档哈希散列到100个桶  每次修改只修改一个桶的存档 这样能减少一次操作太多的服务器存档栏位
 */

export default class ArchiveUtil {
    //加密 请在地图发布前就确定是否需要加密以及加密的方式。发布后不能更改此选项 否则会造成旧存档被清空
    /**
     * 是否加密
     */
    static encrypt: boolean = true;
    static verifyPlayerName: boolean = !isDebug;
    /**
     * 最大存档key 长度
     */
    static ArchiveKeyCountMax: number = 120;
    static salt: string = "s_z_b_s_q_j";
    //11平台最大8位
    static defaultLimitKey: string = null;

    static playerDatas: { [playerIndex: string]: ArchiveData } = {}
    private static _sl_playerCurrentArchiveKeyMax: { [currentArchiveKeyMax: string]: number } = {}
    private static _init_time = -1;
    /** solar Archive v2 addon */
    private static playerDataBuckets: { [playerIndex: string]: { [bucketId: string]: any } } = {}
    static bucketMax = 100;

    /**
     * 获取玩家地图存档 没有则返回null
     * @param whichPlayer
     * @param key
     * @param limitVal 值限制 传0则不限制（当玩家对应的存档key小于此数字时返回null）
     * @param limitKey 限制存档key 传null则为地图等级限制 (通常用通关次数 并且在后台限制了每日获取量的基础存档key)
     */
    static get(whichPlayer: player, key: string, limitVal: number = 0, limitKey: string = ArchiveUtil.defaultLimitKey): null | any {
        ArchiveUtil._init0();
        if (limitVal > 0) {
            let sVal = limitKey ? S2I(DzAPI_Map_GetServerValue(whichPlayer, limitKey)) : DzAPI_Map_GetMapLevel(whichPlayer)
            if (sVal < limitVal) {
                return null;
            }
        }
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            return null;
        }
        return data[key];
    }

    /**
     * 如果大于存档的数值 则更新 （比如保存最大通关难度 最高无尽等级 最高战力等）
     * @param whichPlayer
     * @param key
     * @param value
     */
    static updateMaxNumber(whichPlayer: player, key: string, value: number) {
        let oldVal: number = ArchiveUtil.get(whichPlayer, key) || 0;
        if (value > oldVal) {
            ArchiveUtil.set(whichPlayer, key, oldVal + value)
        }
    }

    /**
     * 添加一个数值存档的值
     * @param whichPlayer
     * @param key
     * @param addValue
     */
    static addNumber(whichPlayer: player, key: string, addValue: number) {
        let oldVal: number = ArchiveUtil.get(whichPlayer, key) || 0;
        ArchiveUtil.set(whichPlayer, key, oldVal + addValue)
    }

    /**
     * 保存玩家的一个存档
     * @param whichPlayer
     * @param key
     * @param value
     * @param isSaveAll 预留参数。当前实现无效 都是立即上传！是否立即上传到服务器存档(批量设置值时可以先填false 最后再统一上传 节省一丝性能)
     */
    static set(whichPlayer: player, key: string, value: any, isSaveAll?: boolean) {
        ArchiveUtil._init0();
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
        if (!data) {
            data = {}
            ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = data;
        }
        data[key] = value;

        let bucketId = ArchiveUtil._sl_getBucketId(key);
        let playerDataBucket = ArchiveUtil.playerDataBuckets["P" + GetPlayerId(whichPlayer)];
        if (playerDataBucket == null) {
            playerDataBucket = {}
            ArchiveUtil.playerDataBuckets["P" + GetPlayerId(whichPlayer)] = playerDataBucket;
        }
        let bucket = playerDataBucket[bucketId];
        if (bucket == null) {
            bucket = {}
            playerDataBucket[bucketId] = bucket;
        }
        bucket[key] = value;
        ArchiveUtil._sl_saveBucket(whichPlayer, bucketId, bucket)
    }

    /**
     * 保存玩家的所有存档数据
     * @deprecated
     */
    static saveAll(whichPlayer: player): void {
        log.errorWithTraceBack("不推荐的用法!一次性保存所有存档容易导致崩溃丢档!")
        let allArchive = ArchiveUtil.getAllArchive(whichPlayer);
        if (allArchive == null) {
            return
        }
        for (let archiveKey in allArchive) {
            ArchiveUtil.set(whichPlayer, archiveKey, allArchive[archiveKey])
        }
    }

    /**
     *获取所有存档
     */
    static getAllArchive(whichPlayer: player): ArchiveData {
        ArchiveUtil._init0();
        return ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
    }

    /**
     * 打印某个玩家的所有存档 调试时用
     * @param whichPlayer
     */
    static printAllArchive(whichPlayer: player): void {
        ArchiveUtil._init0();
        let data = ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)];
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
        ArchiveUtil._init0();
        ArchiveUtil.playerDatas["P" + GetPlayerId(whichPlayer)] = {};
        ArchiveUtil.playerDataBuckets["P" + GetPlayerId(whichPlayer)] = {};
        for (let bidNo = 0; bidNo <= ArchiveUtil.bucketMax; bidNo++) {
            for (let i = 0; i < ArchiveUtil.ArchiveKeyCountMax; i++) {
                let key: string = "B_" + bidNo + "_" + i;
                let serverValue = DzAPI_Map_GetServerValue(whichPlayer, key);
                if (serverValue && serverValue.length > 0) {
                    DzAPI_Map_FlushStoredMission(whichPlayer, key);
                }
            }
        }
        DisplayTimedTextToPlayer(whichPlayer, 0, 0, 10, "|cffff0000已清理全部存档!请重开游戏查看效果!");
        print("已清理全部存档!")
    }

    /**
     * 获取玩家当前使用的存档栏位
     */
    static getCurrentArchiveKeyMax(whichPlayer: player): number {
        ArchiveUtil._init0();
        return ArchiveUtil._sl_playerCurrentArchiveKeyMax["P" + GetPlayerId(whichPlayer)] || 0;
    }

    /**
     * 获取玩家当前使用的存档栏位 提示信息
     */
    static getCurrentArchiveKeyMaxInfo(whichPlayer: player): string {
        let used = ArchiveUtil.getCurrentArchiveKeyMax(whichPlayer);
        let p = Math.ceil(used * 100 / ArchiveUtil.ArchiveKeyCountMax)
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
        return used + "/" + ArchiveUtil.ArchiveKeyCountMax + info;
    }

    private static _sl_saveBucket(whichPlayer: player, bucketId: string, bucket: any): void {
        let dataJsonStr: string = JSON.stringify(bucket);
        let userIdTag = ArchiveUtil._sl_getUserIdTag(whichPlayer);
        dataJsonStr = userIdTag + dataJsonStr.substring(1, dataJsonStr.length - 1)
        if (ArchiveUtil.encrypt) {
            dataJsonStr = CodecUtil.saesEncode(dataJsonStr, gameName + ArchiveUtil.salt)
        }
        let dataJsonStrLength = dataJsonStr.length;
        let keyLength = math.floor(dataJsonStrLength / 64) + 1;
        if (keyLength > ArchiveUtil.ArchiveKeyCountMax) {
            log.errorWithTraceBack("存档栏位大小超过" + ArchiveUtil.ArchiveKeyCountMax + "！" + keyLength)
            return;
        }
        let oneData: string = null;
        for (let i = 0; i < keyLength; i++) {
            let endIndex = (i + 1) * 64;
            if (endIndex > dataJsonStrLength) {
                endIndex = dataJsonStrLength;
            }
            oneData = dataJsonStr.substring(i * 64, endIndex)
            let key: string = bucketId + "_" + i;
            DzAPI_Map_SaveServerValue(whichPlayer, key, oneData);
        }
        //如果最后一段数据刚好为64满长度 则需要清空后一个存档栏位 以确保标记结束
        if (oneData.length == 64) {
            let key: string = bucketId + "_" + keyLength;
            DzAPI_Map_FlushStoredMission(whichPlayer, key);
        }
    }


    /***
     *
     */
    private static _sl_getBucketId(key: string) {
        let index = Math.abs(StringHash(key)) % ArchiveUtil.bucketMax;
        return "B_" + index;
    }


    private static _sl_getUserIdTag(p: player): string {
        if (GetUserId) {
            let uid = MapPlayer.fromHandle(p).userId;
            if (uid == -1) {
                log.errorWithTraceBack("请等待内置userId(用户id)同步完成！(为了解决玩家名更改后靠userId判断是否是自己的存档)")

            }
            return CodecUtil.sBase64Encode("SL" + tostring(uid)).substring(0, 2);
        } else {
            return CodecUtil.sBase64Encode("SL" + GetPlayerName(p)).substring(0, 2);
        }
    }


    /**
     * 初始化存档数据
     * @private
     */
    private static isInit = false;

    private static _init0(): boolean {
        if (ArchiveUtil.isInit) {
            return true;
        }
        ArchiveUtil.isInit = true;
        ArchiveUtil._init_time = time;
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            if (GetPlayerController(tempPlayer) == MAP_CONTROL_USER && GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                let playerAllArchiveData = ArchiveUtil._init0_onePlayer(tempPlayer);
                ArchiveUtil.playerDatas["P" + i] = playerAllArchiveData;
                DataBase.getPlayerSolarData(tempPlayer, true)._tt = (playerAllArchiveData._tt || 0)
            }
        }
        se.onPlayerChat("-sl-ia", (e) => {
            DisplayTimedTextToPlayer(e.triggerPlayer, 0, 0, 10, ArchiveUtil.getCurrentArchiveKeyMaxInfo(e.triggerPlayer));
        });
        se.onPlayerChat("-清空存档", (e) => {
            ArchiveUtil.clearAllArchive(e.triggerPlayer);
            DisplayTimedTextToPlayer(e.triggerPlayer, 0, 0, 10, "清空存档完毕!");
        });
        se.onPlayerChat("-sla-remove-", (e) => {
            let key = e.eventPlayerChatString.substring(12)
            let serverValue = DzAPI_Map_GetServerValue(e.triggerPlayer, key);
            DzAPI_Map_FlushStoredMission(e.triggerPlayer, key);
            DisplayTimedTextToPlayer(e.triggerPlayer, 0, 0, 10, "|cffff0000移除存档:" + key + ":" + tostring(serverValue));
        }, false);
        //
        return true;
    }

    private static _init0_onePlayer(tempPlayer: player) {
        let data: any = {};
        let pId = GetPlayerId(tempPlayer);
        let userIdTag = ArchiveUtil._sl_getUserIdTag(tempPlayer)
        let buckets = {}
        ArchiveUtil.playerDataBuckets["P" + pId] = buckets
        for (let bIndex = 0; bIndex < ArchiveUtil.bucketMax; bIndex++) {
            let bucketId = "B_" + bIndex;
            let bucketDataJsonStr: string = "";
            for (let i = 0; i < ArchiveUtil.ArchiveKeyCountMax; i++) {
                let key: string = bucketId + "_" + i;
                let serverValue: string = DzAPI_Map_GetServerValue(tempPlayer, key);
                if (serverValue && serverValue.length > 0) {
                    bucketDataJsonStr = bucketDataJsonStr + serverValue;
                }
                //没有数据 或数据小于64长度 则表明已经是最后一个key了
                if (serverValue == null || serverValue.length < 64) {
                    let keyMax = ArchiveUtil._sl_playerCurrentArchiveKeyMax["P" + pId] || 0;
                    ArchiveUtil._sl_playerCurrentArchiveKeyMax["P" + pId] = keyMax + i;
                    break;
                }
            }
            //转json了
            if (bucketDataJsonStr.length < 4) {
                continue;
            }

            try {
                if (ArchiveUtil.encrypt) {
                    bucketDataJsonStr = CodecUtil.saesDecode(bucketDataJsonStr, gameName + ArchiveUtil.salt)
                    if (bucketDataJsonStr == null) {//存档解密失败 说明玩家改存档了 (也可能是这个bucket坏了 比如刚存的时候就退出游戏 没存完整)
                        print("存档Json格式解析出错!")
                        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60,
                            "|cffff0000玩家" + (pId + 1) + ":" + GetPlayerName(tempPlayer) + ' 的存档格式解析出错！');
                        DisplayTimedTextToPlayer(tempPlayer, 0, 0, 60, "请不要私自修改存档数据或保存存档时终止游戏！" +
                            '异常的bucketId=' + bucketId);
                        return data
                    }
                }
                let bucketUserIdTag = bucketDataJsonStr.substring(0, 2);
                if (ArchiveUtil.verifyPlayerName && userIdTag != bucketUserIdTag) {
                    //校验失败 这可能是复制的别人的存档
                    DisplayTimedTextToPlayer(tempPlayer, 0, 0, 20, '|cffff0000存档玩家名验证失败!请重开游戏或使用空存档继续游玩!');
                    return data
                }

                bucketDataJsonStr = "{" + bucketDataJsonStr.substring(2) + "}"
                let bucketData = JSON.parse(bucketDataJsonStr);
                buckets[bucketId] = bucketData;
                //设置到data 里
                for (let bucketDataKey in bucketData) {
                    data[bucketDataKey] = bucketData[bucketDataKey];
                }
            } catch (e) {
                print("存档Json格式解析出错!")
                DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '存档格式解析出错！请不要私自修改存档数据！');
                print("需要解析的Json字符串为[" + bucketDataJsonStr + "]")
            }
        }
        return data
    }

}
