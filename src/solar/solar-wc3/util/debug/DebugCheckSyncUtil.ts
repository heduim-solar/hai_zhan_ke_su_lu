/**
 *  太阳异步检查工具
 */
import SyncUtil from "@/SyncUtil";
import BaseUtil from "@/BaseUtil";
import ForceUtil from "@/ForceUtil";
import DebugUtil from "@/DebugUtil";
import DebugVmUtil from "@/DebugVmUtil";

const CJ: NoSelf = require('jass.common')
type DataType = {
    index: number//校验序号
    gameTime: number//毫秒单位
    pid: number
    info?: string
    checkCode: number
}
//Sync
const SyncFunNames = {
    CreateUnit: true,
    // AddSpecialEffect: true,
    // AddSpecialEffectTarget: true,//创建特效 触发太频繁了 同步检测太卡
    CreateTimer: true,
    CreateTrigger: true,
    CreateItem: true,
    CreateUnitAtLoc: true,
    // GetRandomInt: true, //校验里面有GetRandomInt 以免进入死循环
    GetRandomReal: true,
}
/** @noSelf **/
export default class DebugCheckSyncUtil {
    static index = 0;
    static checkSyncData: { [index: number]: DataType[] } = {}
    static stop = false;
    static checkFuns = false;
    static _stopHook = false;

    /**
     * 启动异步测试
     * @param checkFuns 开启后 每次方法运行都检测同步 性能开销极大
     */
    static start(checkFuns = false) {
        DebugCheckSyncUtil.checkFuns = checkFuns;
        //收到数据
        SyncUtil.onSyncObjData("CheckSync", (p, obj: DataType) => {
            let syncDatas = DebugCheckSyncUtil.checkSyncData[obj.index];
            if (syncDatas == null) {
                syncDatas = []
                DebugCheckSyncUtil.checkSyncData[obj.index] = syncDatas
            }
            syncDatas.push(obj);
        })
        //发送校验数据
        BaseUtil.onTimer(1, c => {
            DebugCheckSyncUtil.syncCheckCode("定时检查");
            if (DebugCheckSyncUtil.stop) {
                return false;
            }
            return true;
        });
        //
        if (checkFuns) {
            DebugCheckSyncUtil.initCheckFuns();
        }
        //定时校验数据
        BaseUtil.onTimer(1, c => {
            if (DebugCheckSyncUtil.stop) {
                return false;
            }
            DebugCheckSyncUtil.check();
            return true;
        });
        //测试异步
        DebugUtil.onChat("yb", () => {
            if (GetLocalPlayer() == GetTriggerPlayer()) {
                CreateUnit(GetLocalPlayer(), "hpea", 0, 0, 0)
            }
            // CreateUnit(GetLocalPlayer(),"hpea",0,0,0) //各个玩家都创建一个 异步的单位 todo
        })
        print("启动异步校验检测器！")
    }


    //
    static initCheckFuns(): void {
        //发送校验数据2 方法校验
        DebugVmUtil.sethook(event => {
            if (DebugCheckSyncUtil.stop) {
                return
            }
            let information = debug.getinfo(2, "nS");
            //判断是否在同步方法里
            if (!DebugCheckSyncUtil._stopHook && information?.name && SyncFunNames[information.name] == true) {
                if (isAsync) {
                    log.errorWithTraceBack("不能在同步中调用此方法:")
                    return
                }
                DebugCheckSyncUtil._stopHook = true;
                let tsSrcNameLine = DebugVmUtil.getTsSrcLineName(information as any);
                let tsSrcNameLine3 = DebugVmUtil.getTsSrcLineName(debug.getinfo(3, "nS") as any);
                let tsSrcNameLine4 = DebugVmUtil.getTsSrcLineName(debug.getinfo(4, "nS") as any);
                DebugCheckSyncUtil.syncCheckCode("方法校验:" + tsSrcNameLine + "\r\n" + tsSrcNameLine3 + "\r\n"
                    + tostring(tsSrcNameLine4) + "\r\n--\r\n" + debug.traceback());
                DebugCheckSyncUtil._stopHook = false;
            }
        }, "r")
    }

    //采用多数玩家的校验码 一样的 为正确的校验码
    static check(): void {
        let userCount = ForceUtil.getUserCount();
        let csdLen = Object.keys(DebugCheckSyncUtil.checkSyncData).length;
        if (csdLen > 5) {
            print("CheckSync.checkSyncData.length=" + csdLen)
        }
        for (let index in DebugCheckSyncUtil.checkSyncData) {
            let syncDatas: DataType[] = DebugCheckSyncUtil.checkSyncData[index];
            if (syncDatas.length >= userCount) {//当前轮次的 数据全都收集到了 才开始校验
                DebugCheckSyncUtil.checkSyncDatas(syncDatas)
                DebugCheckSyncUtil.checkSyncData[index] = null;//移除已经校验的数据
            }
        }

    }

    static checkSyncDatas(syncDatas: DataType[]): void {
        let checkCodeCount: { [checkCode: string]: number } = {}
        let rightCheckCode = 0; //正确的校验值
        let rightCheckCodeVote = 0;//校验值 投票
        for (let syncData of syncDatas) {
            checkCodeCount[tostring(syncData.checkCode)] = (checkCodeCount[tostring(syncData.checkCode)] || 0) + 1
        }
        let cccLen = Object.keys(checkCodeCount).length;
        if (cccLen <= 1) {
            return
        }
        print("checkCodeCount.length=" + cccLen)
        //获取正确的校验值
        for (let checkCode in checkCodeCount) {
            if (checkCodeCount[checkCode] > rightCheckCodeVote) {
                rightCheckCode = tonumber(checkCode);
                rightCheckCodeVote = checkCodeCount[checkCode];
            }
        }
        //计算谁异步了
        for (let syncData of syncDatas) {
            if (syncData.checkCode != rightCheckCode) {
                let info = `|cffff0000【异步校验】玩家${syncData.pid + 1}:${GetPlayerName(Player(syncData.pid))}:进入了异次元！`
                DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, info);
                print(info)
                print_r(syncData)
            }
        }
        //已经有异步状况 关闭异步检测系统 （后续的全是异步状态无需检测了）
        BaseUtil.runLater(3, () => {
            print("已经出现异步状况！关闭异步检测系统!")
            DebugCheckSyncUtil.stop = true;
        })

    }

    /**
     * 获取整个游戏的 校验码
     */
    static syncCheckCode(info: string): void {
        DebugCheckSyncUtil.index++;
        let checkCode = DebugCheckSyncUtil.countCheckCode();
        if (info && info.length > 500) {
            info = info.substring(0, 500)
        }
        let syncData: DataType = {
            index: DebugCheckSyncUtil.index,
            gameTime: BaseUtil.time,
            pid: GetPlayerId(GetLocalPlayer()),
            info: info,
            checkCode: checkCode
        }
        SyncUtil.syncObjData("CheckSync", syncData);
    }

    static countCheckCode(): number {
        // let checkCode = 1;
        let checkCode = CJ.GetRandomInt(1, 999999);
        checkCode += handlecount()
        checkCode += handlemax()
        return checkCode;
    }


}


