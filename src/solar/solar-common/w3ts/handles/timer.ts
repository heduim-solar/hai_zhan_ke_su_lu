/** @noSelfInFile **/

import {Handle} from "./handle";

/**
 * @deprecated 请尽量使用BaseUtil.runLater 中心计时器替代 以减少内存泄漏
 */
export class Timer extends Handle<timer> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateTimer());
        }
    }

    /**
     * 计时器经过的时间
     */
    public get elapsed(): number {
        return TimerGetElapsed(this.handle);
    }

    /**
     * 计时器剩余时间
     */
    public get remaining(): number {
        return TimerGetRemaining(this.handle);
    }

    /**
     * 计时器初始的时间
     */
    public get timeout(): number {
        return TimerGetTimeout(this.handle);
    }

    /**
     * 删除计时器 [R]
     */
    public destroy() {
        DestroyTimer(this.handle);
        return this;
    }

    /**
     * 暂停计时器 [R]
     */
    public pause() {
        PauseTimer(this.handle);
        return this;
    }

    /**
     * 恢复计时器 [R]
     */
    public resume() {
        ResumeTimer(this.handle);
        return this;
    }

    /**
     * 运行计时器 [C]
     * @deprecated 请尽量使用BaseUtil.runLater 中心计时器替代 以减少内存泄漏
     * (或者handlerFunc 使用命名函数 以减少内存泄漏)
     */
    public start(timeout: number, periodic: boolean, handlerFunc: () => void) {
        TimerStart(this.handle, timeout, periodic, handlerFunc);
        return this;
    }

    /**
     * 事件响应 - 计时器期满
     */
    public static fromExpired(): Timer {
        return this.fromHandle(GetExpiredTimer());
    }

    public static fromHandle(handle: timer): Timer {
        return this.getObject(handle);
    }
}
