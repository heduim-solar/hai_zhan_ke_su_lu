/** @noSelfInFile */
import ArrayUtil from "@/ArrayUtil";
import ErrorMsgHelper from "@/ErrorMsgHelper";


declare global {
    type SolarTriggerArray = SolarTrigger[];
}

let index = 0;
export default class SolarTrigger implements Destroyable {
    private static _sl_TriggeringSolarTrigger: SolarTrigger = null;
    readonly uuid: string = "stri" + index++;
    enable: boolean = true;
    onDestroy: ((this: void, solarTrigger: SolarTrigger) => void) = null;
    actionFuncs: (((this: void, solarTrigger: SolarTrigger, data?: any) => void)[]) = [];
    private solarTriggers: SolarTriggerArray = null;
    private _sl_isDestroyed = false;

    /**
     *
     * @param actionFunc 触发时的回调函数
     * @param solarTriggers 触发器寄生的触发数组
     */
    constructor(actionFunc: (this: void, solarTrigger: SolarTrigger, data?: any) => void, solarTriggers: SolarTriggerArray) {
        this.addAction(actionFunc);
        this.solarTriggers = solarTriggers;
        this.solarTriggers.push(this);
    }

    public addAction(actionFunc: (this: void, solarTrigger: SolarTrigger, data?: any) => void) {
        this.actionFuncs.push(actionFunc);
    }

    /**
     * 移除触发器动作
     */
    public removeAction(actionFunc: (this: void, solarTrigger: SolarTrigger, data?: any) => void) {
        this.actionFuncs.splice(this.actionFuncs.indexOf(actionFunc), 1);
    }

    /**
     * 清空触发器动作
     */
    public removeActions() {
        this.actionFuncs = [];
    }


    public exec(data?: any) {
        SolarTrigger._sl_TriggeringSolarTrigger = this;
        if (this._sl_isDestroyed) {
            return
        }
        if (this.enable == false) {
            return
        }
        //即使报错也不要影响后续的逻辑 以尽可能提高游戏体验
        xpcall(() => {
            for (let actionFunc of this.actionFuncs) {
                actionFunc(this, data);
            }
        }, ErrorMsgHelper.error_handle);
        SolarTrigger._sl_TriggeringSolarTrigger = null;
    }


    public destroy() {
        this._sl_isDestroyed = true;
        this.onDestroy?.(this);
        this.actionFuncs = null;
        ArrayUtil.removeElement(this.solarTriggers, this)
        this.solarTriggers = null;
    }

    /**
     * 在SolarTrigger动作事件中获得 当前的触发器
     */
    static getTriggeringSolarTrigger(): SolarTrigger {
        return SolarTrigger._sl_TriggeringSolarTrigger;
    }
}