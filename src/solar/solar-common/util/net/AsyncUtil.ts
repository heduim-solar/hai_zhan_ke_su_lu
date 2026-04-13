import BaseUtil from "../BaseUtil";
import PlayerUtil from "../game/PlayerUtil";
import SyncUtil from "./SyncUtil";

/**
 * 异步工具
 */
export default class AsyncUtil {


    private static uuidAsync: number = 1

    /**
     * 异步的唯一id
     * 比如用于创建Frame的名字后缀
     */
    static getUUIDAsync(): number {
        AsyncUtil.uuidAsync++;
        return AsyncUtil.uuidAsync
    }

    /**
     *在本地玩家执行
     */
    static run(fun: () => void, runPlayer = GetTriggerPlayer()) {
        if (runPlayer == GetLocalPlayer()) {
            let old = isAsync
            isAsync = true;
            fun();
            isAsync = old;
        }
    }

    /**
     * 异步请求 同步的获得结果。
     * 示例:主机玩家获取全服排行榜。同步结果然后所有玩家根据排行榜结果给与奖励
     * @param url
     * @param data
     * @param onResult
     */
    static asyncHttpSyncResult(url: string, data: string, onResult: (result: string) => void) {
        if (isAsync) {
            log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
            return
        }
        let firstOfUsers = PlayerUtil.firstOfUsers();
        let key = "AsyncUtil:asyncHttpSyncResult:" + BaseUtil.getUUID()
        //
        SyncUtil.onSyncData(key, (triggerPlayer, syncData) => {
            onResult(syncData);
        })
        AsyncUtil.run(() => {
            HttpRequest(url, data, result => {
                SyncUtil.syncData(key, result)
            })
        }, firstOfUsers)
    }


}
