/** @noSelfInFile */
export default class FrameDebug {
    private static is_init = false;
    static frameName: { [name: string]: number } = {};

    static init() {
        if (FrameDebug.is_init) {
            return
        }
        FrameDebug.is_init = true;
        //one case
        let oldDzCreateFrameByTagName = DzCreateFrameByTagName;
        _G.DzCreateFrameByTagName = function (this: void, frameType: string, name: string, parent: number, template: string, id: number): number {

            if (FrameDebug.frameName[name] && FrameDebug.frameName[name] > 0) {
                log.errorWithTraceBack("你正在使用已经被使用过的Frame名字:" + tostring(name))
            }
            FrameDebug.frameName[name] = 1;
            return oldDzCreateFrameByTagName(frameType, name, parent, template, id);
        }

        //one case
        let oldDzGetTriggerUIEventPlayer = DzGetTriggerUIEventPlayer
        _G.DzGetTriggerUIEventPlayer = function () {
            let result = oldDzGetTriggerUIEventPlayer();
            if (!IsHandle(result)) {
                log.errorWithTraceBack("DzGetTriggerUIEventPlayer返回了一个空handle。请检查当前函数是否在UI触发回调之外使用！")
            }
            return result;
        }
    }
}