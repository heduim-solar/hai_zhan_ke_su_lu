import FramePoint from "@/FramePoint";
import BaseUtil from "@/BaseUtil";
import InputUtil from "@/InputUtil";
import SolarConfig from "@/SolarConfig";
import TipFrameUtil from "@/TipFrameUtil";

/**
 * 鼠标 ui相关工具
 */
export default class MouseFrameUtil {


    static showWarnText(tipText: string, dur: number = 1, showPlayer?: player) {
        MouseFrameUtil.showTipText(SolarConfig.defaultWarnTextColor + tipText, dur, showPlayer)
    }

    static showFailText(tipText: string, dur: number = 1, showPlayer?: player) {
        MouseFrameUtil.showTipText(SolarConfig.defaultFailTextColor + tipText, dur, showPlayer)
    }

    static showSuccessText(tipText: string, dur: number = 1, showPlayer?: player) {
        MouseFrameUtil.showTipText(SolarConfig.defaultSuccessTextColor + tipText, dur, showPlayer);
    }

    /**
     * 在UI层显示提示信息 如一些点击图标后条件不足的警告提示 优点是就在鼠标此时的位置显示，符合玩家此时的焦点视区
     * @param tipText  示例 “|cffff0000金币不足”
     * @param dur
     * @param showPlayer 对指定玩家显示 如果不填则会对执行此函数的所有玩家显示
     */
    static showTipText(tipText: string, dur: number = 1, showPlayer?: player) {
        if (showPlayer != null && GetLocalPlayer() != showPlayer) {
            return
        }
        let frame = TipFrameUtil._sl_tipTextFrameObjectPool.borrowObject();
        frame.setText(tipText);
        frame.visible = true;
        DzFrameShow(frame.backdropFrame.handle, true);
        let mx = InputUtil.getMouseSceneX()
        let my = InputUtil.getMouseSceneY()

        BaseUtil.runLater(0.03, (count, maxCount) => {
            let y = 0.01 + (0.002 * count)
            if (mx > 0.76) {
                frame.setAbsPoint(FramePoint.bottomRight, mx, my + y)
            } else {
                frame.setAbsPoint(FramePoint.bottom, mx, my + y)
            }
        }, 30, true);
        BaseUtil.runLater(dur, () => {
            frame.visible = false;
            DzFrameShow(frame.backdropFrame.handle, false);
            TipFrameUtil._sl_tipTextFrameObjectPool.returnObject(frame);
        })

    }


}