/**
 * 对战平台工具
 * platform Util
 */
import DataBase from "@/DataBase";

export default class PlatUtil {


    /**
     * 是否拥有商品
     * @param p
     * @param key 商品key
     */
    static hasMallItem(p: player, key: string): boolean {
        return DzAPI_Map_HasMallItem(p, key)
    }

    /**
     * 获取玩家商品数量
     * (消耗品可以叠加效果 做可重复购买的道具 如每个商品增加1%攻击 无上限)
     * @param p
     * @param key
     */
    static getMallItemCount(p: player, key: string): number {
        return DzAPI_Map_GetMallItemCount(p, key)
    }


    /**
     * 消耗商品
     * @param p
     * @param key
     * @param count
     */
    static consumeMallItem(p: player, key: string, count: number): boolean {
        return DzAPI_Map_ConsumeMallItem(p, key, count)
    }

    /**
     * 地图等级
     * @param p
     */
    static getMapLevel(p: player): number {
        return DzAPI_Map_GetMapLevel(p)
    }

    /**
     * 总签到天数
     * @param p
     */
    static continuousCount(p: player): number {
        return DzAPI_Map_ContinuousCount(p, 0)
    }

    /**
     * 累计获得赞数
     * @param p
     */
    static getForumDataTotalLikes(p: player): number {
        return DzAPI_Map_GetForumData(p, 0)
    }

    /**
     * 主题数量
     * @param p
     */
    static getForumDataTotalSubject(p: player): number {
        return DzAPI_Map_GetForumData(p, 6)
    }

    /**
     * 收藏过地图
     * @param p
     */
    static isCollect(p: player): boolean {
        return DzAPI_Map_Returns(p, 16)
    }

    /**
     * 公会名称
     * @param p
     */
    static getGuildName(p: player): string {
        return DzAPI_Map_GetGuildName(p)
    }


    /**
     * 可以设置1-3个存档用于对战平台房间内及个人战绩展示
     * (11可以设置1-8个 只能设置数字)
     * @param whichPlayer
     * @param key
     * @param value
     */
    static setStat(whichPlayer: player, key: string, value: string) {
        DzAPI_Map_Stat_SetStat(whichPlayer, key, value)
    }

    /**
     * 所有地图的总游戏时长
     * @param whichPlayer
     */
    static mapsTotalPlayed(whichPlayer: player): number {
        return DzAPI_Map_MapsTotalPlayed(whichPlayer)
    }


    /**
     * 存储服务器存档字符串
     * 实际key 会加S前缀
     * @param whichPlayer
     * @param key
     * @param value
     */
    static storeStr(whichPlayer: player, key: string, value: string): void {
        DzAPI_Map_StoreString(whichPlayer, key, value)
    }

    /**
     * 获取服务器存档字符串
     * 实际key 会加S前缀
     * @param whichPlayer
     * @param key
     */
    static getStoreStr(whichPlayer: player, key: string): string {
        return DzAPI_Map_GetStoredString(whichPlayer, key)
    }

    /**
     * 存储服务器存档整数
     * 实际key 不会加I前缀
     * @param whichPlayer
     * @param key
     * @param value
     */
    static storeInt(whichPlayer: player, key: string, value: number): boolean {
        return DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value));
    }

    /**
     * 获取服务器存档整数
     * 实际key 不会加I前缀
     * @param whichPlayer
     * @param key
     */
    static getStoreInt(whichPlayer: player, key: string): number {
        return S2I(DzAPI_Map_GetServerValue(whichPlayer, key));
    }

    /**
     * 增加存储服务器存档整数 单局可以重复调用 累加
     * 实际key 不会加I前缀
     * @param whichPlayer
     * @param key
     * @param addValue 增加值
     */
    static addStoreInt(whichPlayer: player, key: string, addValue: number): boolean {
        let oldNum = 0;
        let playerSolarData = DataBase.getPlayerSolarData(whichPlayer);
        if (playerSolarData["_sl_addStoreInt:" + key]) {
            oldNum = playerSolarData["_sl_addStoreInt:" + key];
        } else {
            oldNum = PlatUtil.getStoreInt(whichPlayer, key) || 0;
        }
        let newNum = oldNum + addValue;
        //用自定义值存一下 最新的值 以免一直以开始游戏的基础值做基数加了 这样会导致只有最后一次加的数才会加上，
        playerSolarData["_sl_addStoreInt:" + key] = newNum;
        return PlatUtil.storeInt(whichPlayer, key, newNum);
    }


    /**
     * kk addons
     */
    static getPlayerUserName(whichPlayer: player): number {
        return RequestExtraIntegerData(81, whichPlayer, null, null, false, 0, 0, 0)
    }

    /**
     * 获取玩家在指定自定义排行榜上的排名。
     * @param whichPlayer
     * @param id
     */
    static getCustomRank(whichPlayer: player, id: number): number {
        return RequestExtraIntegerData(52, whichPlayer, null, null, false, id, 0, 0)
    }

    /**
     * 获取指定自定义排行榜的上榜人数。
     * 需要授权后才允许使用 否则返回0
     * @param id
     */
    static getCustomRankCount(id: number): number {
        return RequestExtraIntegerData(78, null, null, null, false, id, 0, 0)
    }

    /**
     * 获取指定自定义排行榜上指定名次的玩家昵称。。
     * 需要授权后才允许使用 否则返回null
     * @param id
     * @param ranking
     */
    static getCustomRankPlayerName(id: number, ranking: number): string {
        return RequestExtraStringData(79, null, null, null, false, id, ranking, 0)
    }

    /**
     * 获取指定自定义排行榜上指定名次的玩家数值（排行榜值）。。。
     * 需要授权后才允许使用 否则返回0
     * @param id
     * @param ranking
     */
    static getCustomRankValue(id: number, ranking: number): number {
        return RequestExtraIntegerData(80, null, null, null, false, id, ranking, 0)
    }


    /**
     * 通知服务器端产生一个随机数，并将随机数保存至指定的只读型存档变量Key中。
     *
     * 生成随机数时需要关联一个组ID，该组ID可以在平台进行防刷分管理，同组ID下各个Key共享CD和次数。
     * @param whichPlayer
     * @param key
     * @param groupkey
     */
    static requestBackendLogic(whichPlayer: player, key: string, groupkey: string): boolean {
        return RequestExtraBooleanData(83, whichPlayer, key, groupkey, false,
            0, 0, 0)
    }


    /**
     * 读取服务器端所产生的随机数的值
     * @param whichPlayer
     * @param key
     */
    static checkBackendLogicExists(whichPlayer: player, key: string) {
        return RequestExtraBooleanData(84, whichPlayer, key, null, false, 0, 0, 0)
    }

    /**
     * 读取服务器端所产生的随机数的值
     * @param whichPlayer
     * @param key
     */
    static getBackendLogicIntResult(whichPlayer: player, key: string) {
        return RequestExtraIntegerData(85, whichPlayer, key, null, false, 0, 0, 0)
    }

    /**
     * 读取服务器端所产生随机数的生成时间
     * @param whichPlayer
     * @param key
     */
    static getBackendLogicUpdateTime(whichPlayer: player, key: string) {
        return RequestExtraIntegerData(87, whichPlayer, key, null, false, 0, 0, 0)
    }

    /**
     * 读取指定的随机只读存档变量Key最后一次是由哪个组ID所生成的。
     * @param whichPlayer
     * @param key
     */
    static getBackendLogicGroup(whichPlayer: player, key: string): string {
        return RequestExtraStringData(88, whichPlayer, key, null, false, 0, 0, 0)
    }

    /**
     * 删除指定的随机只读存档变量Key中所保存的随机数。
     *
     * @param whichPlayer
     * @param key
     */
    static removeBackendLogicResult(whichPlayer: player, key: string): boolean {
        return RequestExtraBooleanData(89, whichPlayer, key, null, false, 0, 0, 0)
    }

    /**
     * 获取指定服务器存档变量的天/周上限余额，需要在开发者平台配置服务器存档防刷。
     *（高级接口，需要授权后才允许使用。）
     * @param whichPlayer
     * @param key
     */
    static getServerValueLimitLeft(whichPlayer: player, key: string): number {
        return RequestExtraIntegerData(82, whichPlayer, key, null, false, 0, 0, 0)
    }


    /**
     * 获取玩家平台id
     * @param player
     */
    static getPlayerGUID(player: player): string {
        if (KKApiPlayerGUID) {
            return KKApiPlayerGUID(player);
        }
        return GetPlayerName(player);
    }


}

