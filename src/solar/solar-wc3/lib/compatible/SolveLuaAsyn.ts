/** @noSelfInFile */
import Cache from "@/Cache";
import GroupUtil from "@/GroupUtil";

const CJ: NoSelf = require('jass.common')
//由于在对战平台 double类型的数学函数 在窗口化时 会丢失精度 所以改用魔兽的float单精浮点数 统一丢掉4字节 防止异步
const deg = CJ.Rad2Deg(1)
const rad = CJ.Deg2Rad(1)

/** @noSelf */
//解决lua异步
export default class SolveLuaAsyn {
    // static tempGroup2: group;
    static cache = new Cache();

    static init() {
        // SolveLuaAsyn.tempGroup2 = CJ.CreateGroup();
        _G.ForGroup = SolveLuaAsyn.ForGroup;
        _G.GroupPickRandomUnit = function (whichGroup: group): unit {
            let unitArray: unit[] = [];
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(whichGroup)
                if (!IsHandle(unitHandle)) {
                    break
                }
                unitArray.push(unitHandle)
                GroupRemoveUnit(whichGroup, unitHandle)
            }
            for (let i = 0; i < unitArray.length; i++) {
                GroupAddUnit(whichGroup, unitArray[i])
            }
            if (unitArray.length == 0) {
                return null;
            }
            if (unitArray.length == 1) {
                return unitArray[0]
            }
            return unitArray[GetRandomInt(0, unitArray.length - 1)]
        };

        /**
         * 命名的函数可能会降低匿名闭包造成的异步几率
         * 即ts里写静态方法 当做回调函数 静态方法里访问静态变量，以减少闭包的对象实例
         * filter 尽量传null 然后在遍历单位组时根据想要的条件if判断 这样就没有闭包到jass了
         */

        //如无暂停计时器窗口这些特殊需求 只是需要简单的几秒后执行函数可使用 BaseUtil.runLater() 内部由lua单个中心计时器回调
        // _G.TimerStart = SolveLuaAsyn.TimerStart;

        /**
         * 优化、减少闭包传入jass
         * 通过一次注册触发 实现触发里再去调用其他需要此事件的触发
         */
        //事件分发
        //_G.TriggerRegisterDeathEvent = TriggerRegisterDeathEvent; //
        _G.SyncSelections = function (this: void) {
            SolveLuaAsyn.cache.get("runtime_sleep_true", () => {
                if (require("jass.runtime").sleep == false) {
                    // require("jass.runtime").sleep = true;//这一行最好要置顶 以免会崩溃bug
                    print("你正在使用一个不推荐的函数:SyncSelections;请使用同步函数或其他方式实现要做的功能; 或手动将require(\"jass.runtime\").sleep = true置顶 以正常使用此函数")
                    log.errorWithTraceBack("你正在使用一个不推荐的函数 SyncSelections")
                }
                return true;
            })
            CJ.SyncSelections()
        }
        /**
         * 自选项
         */
        // @ts-ignore
        // _G.pairs = pairs; //pairs遍历字符串key时可不用 排序后遍历
    }

    /**
     * 命名的函数可能会降低匿名闭包造成的异步几率
     * @constructor
     * @param whichTimer
     * @param timeout
     * @param periodic
     * @param handlerFunc
     */
    //one case todo 这里使用lua模拟的中心计时器 更佳
    static TimerStart(whichTimer: timer, timeout: number, periodic: boolean, handlerFunc: () => void): void {
        CJ.TimerStart(whichTimer, timeout, periodic, handlerFunc)
    }

    //one case
    /**
     * 由于在ForGroup 里不能再调用ForGroup 所以需要2个临时group来中转
     * @param whichGroup
     * @param callback
     * @constructor
     */
    static ForGroup(whichGroup: group, callback: () => void): void {
        let unitHandle: unit = null;
        //重写 GetEnumUnit
        let oldGetEnumUnit = GetEnumUnit;
        _G.GetEnumUnit = function () {
            return unitHandle;
        }
        let unitArray: unit[] = [];
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(whichGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            unitArray.push(unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
        }
        for (let i = 0; i < unitArray.length; i++) {
            GroupAddUnit(whichGroup, unitArray[i])
            unitHandle = unitArray[i];
            callback()
        }
        //还原 GetEnumUnit
        _G.GetEnumUnit = oldGetEnumUnit;
    };


    /**
     * R2I 实数会被转到 -2147483648 到 2147483647 区间
     * math.floor 可以返回超过922337万亿的整数
     * @constructor
     */
    static SolveMathAsyn(): void {

        // let old_floor = math.floor;
        // math.floor = function (r: number) {
        //     if (r > 2147483640 || r < -2147483640) {
        //         return old_floor(r)//注意最大值范围
        //     }
        //     return CJ.R2I(r)//注意最大值范围
        // }

        math.sin = function (r: number) {
            return CJ.Sin(r * rad)
        }

        //余弦 
        math.cos = function (r: number) {
            return CJ.Cos(r * rad)
        }

        //正切 
        math.tan = function (r: number) {
            return CJ.Tan(r * rad)
        }

        //反正弦 
        math.asin = function (v: number) {
            return CJ.Asin(v) * deg
        }

        //反余弦
        math.acos = function (v: number) {
            return CJ.Acos(v) * deg
        }

        // //反正切
        // math.atan = function(v1:number, v2:number){
        //  return CJ.atan2(v1, v2) * deg
        // }
    }


}
