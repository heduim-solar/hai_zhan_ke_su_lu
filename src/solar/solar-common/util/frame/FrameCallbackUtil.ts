/** @noSelfInFile **/
import Cache from "@/tool/Cache";


export default class FrameCallbackUtil {
    private static _sl_tempFps: number = 0;
    private static _sl_lastFrameUpdateTime: number = 0;
    static cache = new Cache();

    /**
     * 获取FPS
     */
    static getFps(): number {
        if (isEmbedJapi) {
            return GetFps();
        }
        //手动计算fps
        FrameCallbackUtil.cache.get("getFps", () => {
            FrameCallbackUtil.addFrameSetUpdateCallback(() => {
                let nowTime = os.clock();
                let fpsGap = nowTime - FrameCallbackUtil._sl_lastFrameUpdateTime;
                FrameCallbackUtil._sl_tempFps = 1 / fpsGap;
                FrameCallbackUtil._sl_lastFrameUpdateTime = nowTime;
            });
            return true;
        });
        return FrameCallbackUtil._sl_tempFps;
    }


    /**
     * 添加一个帧回调监听
     * （ps：原生的只能设置最后一个有效）
     * @param frameUpdateCallback
     */
    static addFrameSetUpdateCallback(frameUpdateCallback: () => void) {
        let callbacks: (() => void)[] = FrameCallbackUtil.cache.get("AddFrameSetUpdateCallback", () => {
            let cbs: (() => void)[] = [];
            DzFrameSetUpdateCallbackByCode(() => {
                for (let cb of cbs) {
                    cb();
                }
            });
            //重写DzFrameSetUpdateCallbackByCode
            _G.DzFrameSetUpdateCallbackByCode = function (this: void, funcHandle: () => void) {
                FrameCallbackUtil.addFrameSetUpdateCallback(funcHandle);
            }
            return cbs
        });
        callbacks.push(frameUpdateCallback);
    }


}