/** @noSelfInFile */
import KeyCode from "@/KeyCode";
import Cache from "@/Cache";
import AsyncUtil from "@/AsyncUtil";
import BaseUtil from "@/BaseUtil";

export default class InputUtil {
    private static cache = new Cache();
    private static _sl_isMouseLeftButtonDown = false;

    /**
     * 键盘按下
     * @param key
     * @param actionFunc
     */
    static onKeyPressed(key: KeyCode, actionFunc: () => void): void {
        let callbacks: (() => void)[] = InputUtil.cache.get("onKeyPressed:" + key, () => {
            let cbs: (() => void)[] = [];
            DzTriggerRegisterKeyEventByCode(null, key, 1, false, () => {
                for (let cb of cbs) {
                    cb();
                }
            })
            return cbs
        });
        callbacks.push(actionFunc);
    }

    /**
     * 键盘释放
     * @param key
     * @param actionFunc
     */
    static onKeyReleased(key: KeyCode, actionFunc: () => void): void {
        let callbacks: (() => void)[] = InputUtil.cache.get("onKeyReleased:" + key, () => {
            let cbs: (() => void)[] = [];
            DzTriggerRegisterKeyEventByCode(null, key, 0, false, () => {
                for (let cb of cbs) {
                    cb();
                }
            })
            return cbs
        });
        callbacks.push(actionFunc);
    }


    /**
     * 鼠标左键按下
     * @param actionFunc
     */
    static onMouseLeftButtonPressed(actionFunc: () => void): void {
        let callbacks: (() => void)[] = InputUtil.cache.get("onMouseLeftButtonPressed", () => {
            let cbs: (() => void)[] = [];
            DzTriggerRegisterMouseEventByCode(null, 1, 1, false, () => {
                for (let cb of cbs) {
                    cb();
                }
            })
            return cbs
        });
        callbacks.push(actionFunc);

    }

    /**
     * 鼠标左键释放
     * @param actionFunc
     */
    static onMouseLeftButtonReleased(actionFunc: () => void): void {
        let callbacks: (() => void)[] = InputUtil.cache.get("onMouseLeftButtonReleased", () => {
            let cbs: (() => void)[] = [];
            DzTriggerRegisterMouseEventByCode(null, 1, 0, false, () => {
                for (let cb of cbs) {
                    cb();
                }
            })
            return cbs
        });
        callbacks.push(actionFunc);
    }

    /**
     * 鼠标右键按下
     * @param actionFunc
     */
    static onMouseRightButtonPressed(actionFunc: () => void): void {
        let callbacks: (() => void)[] = InputUtil.cache.get("onMouseRightButtonPressed", () => {
            let cbs: (() => void)[] = [];
            DzTriggerRegisterMouseEventByCode(null, 2, 1, false, () => {
                for (let cb of cbs) {
                    cb();
                }
            })
            return cbs
        });
        callbacks.push(actionFunc);
    }

    /**
     * 鼠标右键释放
     * @param actionFunc
     */
    static onMouseRightButtonReleased(actionFunc: () => void): void {
        let callbacks: (() => void)[] = InputUtil.cache.get("onMouseRightButtonReleased", () => {
            let cbs: (() => void)[] = [];
            DzTriggerRegisterMouseEventByCode(null, 2, 0, false, () => {
                for (let cb of cbs) {
                    cb();
                }
            })
            return cbs
        });
        callbacks.push(actionFunc);
    }

    /**
     * 添加鼠标移动事件
     * (内置环境下 此函数不能在鼠标回调事件中调用 否则崩溃 延迟执行即可)
     * @param actionFunc
     * @param key
     * @param delay 延迟执行
     */
    static onMouseMoveEvent(actionFunc: () => void, key: string = "slmm" + AsyncUtil.getUUIDAsync(), delay: number = 0.1): string {
        BaseUtil.runLater(delay, () => {
            let callbacks: { [key: string]: () => void } = InputUtil.cache.get("onMouseMoveEvent", () => {
                let cbs: { [key: string]: () => void } = {};
                DzTriggerRegisterMouseMoveEventByCode(null, false, () => {
                    for (let key in cbs) {
                        cbs[key]?.();
                    }
                })
                return cbs
            });
            callbacks[key] = actionFunc;
        })
        return key;
    }

    /**
     * 移除 鼠标移动事件
     * @param actionFunc
     * @param key
     */
    static removeMouseMoveEvent(key: string) {
        let callbacks: { [key: string]: () => void } = InputUtil.cache.get("onMouseMoveEvent");
        if (callbacks) {
            callbacks[key] = null;
        }
    }


    /**
     * 是否左键按下
     */
    static isMouseRightButtonDown(): boolean {
        InputUtil._sl_init_isMouseLeftButtonDown();
        return InputUtil._sl_isMouseLeftButtonDown;
    }

    /**
     * 计算鼠标所在的X 0-0.8
     */
    static getMouseSceneX() {
        let sceneX = DzGetMouseXRelative() / DzGetClientWidth() * 0.8;
        return sceneX;
    }

    /**
     * 计算鼠标所在的X 0-0.6 (从下到上)
     */
    static getMouseSceneY() {
        let sceneY = DzGetMouseYRelative() / DzGetClientHeight() * 0.6;
        return 0.6 - sceneY;
    }

    /**
     * solar addons helper
     */
    private static _sl_init_isMouseLeftButtonDown_flag: boolean = false;

    private static _sl_init_isMouseLeftButtonDown(): void {
        if (InputUtil._sl_init_isMouseLeftButtonDown_flag) {
            return
        }
        //释放鼠标左键事件
        InputUtil.onMouseLeftButtonPressed(() => {
            InputUtil._sl_isMouseLeftButtonDown = true;
        });
        InputUtil.onMouseLeftButtonReleased(() => {
            InputUtil._sl_isMouseLeftButtonDown = false;
        });
        InputUtil._sl_init_isMouseLeftButtonDown_flag = true;
    }
}