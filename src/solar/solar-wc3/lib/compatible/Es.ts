import BaseUtil from "@/BaseUtil";

export default class Es {

    static init() {
        _G.setTimeout = function (this: void, handler: (this: void) => void, timeout: number, loopCount: number) {
            BaseUtil.runLater(timeout, handler, loopCount)
            return 0
        }

        _G.setInterval = function (this: void, handler: (count: number) => boolean, timeout: number) {
            BaseUtil.onTimer(timeout, handler)
            return 0
        }


    }


}