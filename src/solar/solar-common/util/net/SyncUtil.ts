type BigDataPacket = {
    i: number, //当前包的序号
    t: number, //总计包数
    d: string //当前包的数据
}
/** @noSelf **/
export default class SyncUtil {
    static data_length_max = 976;

    /**
     * 可在异步里调用此方法
     */
    static syncData(key: string, data = ""): void {
        if (data.length > SyncUtil.data_length_max) {
            log.error("同步数据的长度超过976!可能会无法同步成功！")
        }
        DzSyncData(key, data)
    }

    static syncObjData(key: string, data: any): void {
        // @ts-ignore
        DzSyncData(key, JSON.stringify(data))
    }


    /**
     * 只能在同步里调用此方法
     */
    static onSyncData(key: string, actionFunc: (triggerPlayer: player, data: string) => void): void {
        if (isAsync) {
            log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
            return
        }
        let trigger = CreateTrigger();
        DzTriggerRegisterSyncData(trigger, key, false)
        TriggerAddAction(trigger, () => {
            let triggerPlayer = DzGetTriggerSyncPlayer();
            let data = DzGetTriggerSyncData();
            actionFunc(triggerPlayer, data)
        })
    }

    /**
     * 当接收到同步对象时
     * 注意发送端也要发送对象
     * @param key
     * @param actionFunc
     */
    static onSyncObjData(key: string, actionFunc: (triggerPlayer: player, data: any) => void): void {
        if (isAsync) {
            log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
            return
        }
        let trigger = CreateTrigger();
        DzTriggerRegisterSyncData(trigger, key, false)
        TriggerAddAction(trigger, () => {
            let triggerPlayer = DzGetTriggerSyncPlayer();
            let dataStr = DzGetTriggerSyncData();
            // @ts-ignore
            let data = JSON.parse(dataStr);
            actionFunc(triggerPlayer, data)
        })
    }


    /**
     * 只能在同步里调用此方法
     */
    static bigDataBuffer = {}

    /**
     * 当同步大数据时 超过976长度的字符串则为大数据
     * @param key
     * @param actionFunc
     */
    static onSyncBigData(key: string, actionFunc: (triggerPlayer: player, data: string) => void): void {
        if (isAsync) {
            log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
            return
        }
        key = "SL:BD:" + key;
        let trigger = CreateTrigger();
        DzTriggerRegisterSyncData(trigger, key, false)
        TriggerAddAction(trigger, () => {
            let triggerPlayer = DzGetTriggerSyncPlayer();
            let dataStr = DzGetTriggerSyncData();
            // @ts-ignore
            let dataPacket: BigDataPacket = JSON.parse(dataStr);
            //组装数据
            let keyDataPackets: BigDataPacket[] = SyncUtil.bigDataBuffer[key];
            if (!keyDataPackets) {
                keyDataPackets = []
                SyncUtil.bigDataBuffer[key] = keyDataPackets;
            }
            keyDataPackets.push(dataPacket)
            //检查是否接收完毕
            if (keyDataPackets.length < dataPacket.t) {
                return
            }
            //组装数据
            let bigData = "";
            let index = 0;
            for (let keyDataPacket of keyDataPackets) {
                if (keyDataPacket.i != index) {
                    print("数据包错乱:No." + index + " = " + keyDataPacket.i)
                }
                bigData = bigData + keyDataPacket.d
                index++;
            }
            actionFunc(triggerPlayer, bigData)
            //清空数据缓冲区
            SyncUtil.bigDataBuffer[key] = []
        })
    }

    /**
     * 可在异步里调用此方法
     */
    static syncBigData(key: string, data = ""): void {
        key = "SL:BD:" + key;
        const oneDataMaxSize = SyncUtil.data_length_max - 276;
        let length = data.length;
        let keyLength = math.floor(length / oneDataMaxSize) + 1;
        for (let i = 0; i < keyLength; i++) {
            let endIndex = (i + 1) * oneDataMaxSize;
            if (endIndex > length) {
                endIndex = length;
            }
            let oneData = data.substring(i * oneDataMaxSize, endIndex)
            let dataPacket: BigDataPacket = {
                i: i,
                t: keyLength,
                d: oneData
            }
            DzSyncData(key, JSON.stringify(dataPacket))
        }
    }

}
