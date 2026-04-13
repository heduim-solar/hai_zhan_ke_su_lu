import ObjectPool from "@/ObjectPool";
import {Frame} from "@/frame";
import SolarConfig from "@/SolarConfig";
import BaseUtil from "@/BaseUtil";
import FramePoint from "@/FramePoint";
import CameraUtil from "@/CameraUtil";
import GameUtil from "@/GameUtil";
import {Easing, Tween} from "@/lib/tween";

/**
 * ui 提示窗口 工具
 */
export default class TipFrameUtil {

    /**
     * 文本和背景图
     * @private
     */
    static _sl_tipTextFrameObjectPool: ObjectPool<Frame> = new ObjectPool(() => {
        let backDrop = Frame.createBackDrop();
        backDrop.setTexture(SolarConfig.defaultTipBackgroundPath)
        let text = Frame.createTEXT();
        backDrop.setPoints(text.handle, 0.002, 0.001)
        text.backdropFrame = backDrop;
        return text;
    }, (obj) => {
        obj.clearPoints();
    });
    // 图标 - 文本和背景图 (示例：提示加金币的时候 前面是个金币图标后面跟数值)
    private static _sl_tipIconTextFrameObjectPool: ObjectPool<{
        icon: Frame,
        text: Frame,
    }> = new ObjectPool(() => {
        let icon = Frame.createBackDrop();
        icon.setTexture(SolarConfig.defaultTipBackgroundPath)
        let text = Frame.createTEXT();
        text.setPoint(FramePoint.left, icon.handle, FramePoint.right, 0.001, 0)
        return {icon, text,};
    }, (obj) => {
        obj.icon.clearPoints();
    });


    static showWarnText(tipText: string, framePoint: FramePoint, dur: number = 1, fontSize: number = 0.015, showPlayer?: player) {
        return TipFrameUtil.showTipText(SolarConfig.defaultWarnTextColor + tipText, framePoint, dur, fontSize, showPlayer)
    }

    static showFailText(tipText: string, framePoint: FramePoint, dur: number = 1, fontSize: number = 0.015, showPlayer?: player) {
        return TipFrameUtil.showTipText(SolarConfig.defaultFailTextColor + tipText, framePoint, dur, fontSize, showPlayer)
    }

    static showSuccessText(tipText: string, framePoint: FramePoint, dur: number = 1, fontSize: number = 0.015, showPlayer?: player) {
        return TipFrameUtil.showTipText(SolarConfig.defaultSuccessTextColor + tipText, framePoint, dur, fontSize, showPlayer)
    }

    /**
     * 在UI层显示提示信息 如一些点击图标后条件不足的警告提示 优点是就在鼠标此时的位置显示，符合玩家此时的焦点视区
     * @param tipText  示例 “|cffff0000金币不足”
     * @param framePoint
     * @param dur
     * @param fontSize
     * @param showPlayer
     */
    static showTipText(tipText: string, framePoint: FramePoint, dur: number = 1, fontSize: number = 0.015, showPlayer?: player): Frame {
        if (showPlayer != null && GetLocalPlayer() != showPlayer) {
            return
        }
        let frame = TipFrameUtil._sl_tipTextFrameObjectPool.borrowObject();
        frame.setText(tipText);
        frame.visible = true;
        frame.setFont(fontSize);
        DzFrameShow(frame.backdropFrame.handle, true);
        let startX = 0.8
        let startY = 0.4
        if (framePoint == FramePoint.left) {
            startX = 0.01;
            startY = 0.3;
        } else if (framePoint == FramePoint.bottomLeft) {
            startX = 0.05;
            startY = 0.15;
        } else if (framePoint == FramePoint.bottom) {
            startX = 0.4;
            startY = 0.15;
        } else if (framePoint == FramePoint.bottomRight) {
            startX = 0.78;
            startY = 0.15;
        } else if (framePoint == FramePoint.right) {
            startX = 0.78;
            startY = 0.3;
        } else if (framePoint == FramePoint.topRight) {
            startX = 0.78;
            startY = 0.5;
        } else if (framePoint == FramePoint.top) {
            startX = 0.4;
            startY = 0.48;
        } else if (framePoint == FramePoint.topLeft) {
            startX = 0.05;
            startY = 0.5;
        } else if (framePoint == FramePoint.center) {
            startX = 0.4;
            startY = 0.38;
        }
        BaseUtil.runLater(0.03, (count, maxCount) => {
            let y = 0.01 + (0.002 * count)
            frame.setAbsPoint(framePoint, startX, startY + y)
        }, 30, true);

        BaseUtil.runLater(dur, () => {
            frame.visible = false;
            DzFrameShow(frame.backdropFrame.handle, false);
            TipFrameUtil._sl_tipTextFrameObjectPool.returnObject(frame);
        });
        return frame;
    }


    /**
     * 在单位头上显示 图标 文本
     * @param icon
     * @param tipText 不需要文字 可以填 空字符
     * @param unit
     * @param dur
     * @param iconSize
     * @param fontSize
     * @param showPlayer
     */
    static showIconTextOnUnit(icon: string, tipText: string, unit: unit, dur: number = 1, iconSize: number = 0.011, fontSize: number = iconSize, showPlayer?: player): {
        icon: Frame,
        text: Frame,
    } {
        if (showPlayer != null && GetLocalPlayer() != showPlayer) {
            return
        }
        let frames = TipFrameUtil._sl_tipIconTextFrameObjectPool.borrowObject();
        frames.icon.setSize(iconSize, iconSize);
        frames.icon.setTexture(icon);
        frames.icon.visible = true;
        //
        frames.text.setText(tipText);
        frames.text.visible = true;
        frames.text.setFont(fontSize);

        BaseUtil.runLater(0.03, (count, maxCount) => {
            let y = 0.01 + (0.002 * Math.min(count, 30))
            let ux = GetUnitX(unit);
            let uy = GetUnitY(unit)
            let tz = GameUtil.getTerrainHeight(ux, uy)
            let vector = CameraUtil.getScreenCoordinates(ux, uy, tz + 150);
            let startX = vector.x
            let startY = vector.y
            frames.icon.setAbsPoint(FramePoint.bottom, startX, startY + y)
            if (count == maxCount) {
                frames.icon.visible = false;
                frames.text.visible = false;
                TipFrameUtil._sl_tipIconTextFrameObjectPool.returnObject(frames);
            }
        }, Math.floor(dur / 0.03), true);
        return frames;
    }

    /**
     * 从屏幕指定位置移动并缩小图标到指定位置 （使用示例：吞噬装备后显示一个图标到UI界面按钮里 方便玩家知道在那里点击可以查看此图标）
     * @param icon
     * @param startX
     * @param startY
     * @param toX
     * @param toY
     * @param dur
     * @param showPlayer
     */
    static showIconMoveIntoAnimation(icon: string, startX: number = 0.4, startY: number = 0.3, toX: number = 0.08, toY: number = 0.055, dur: number = 0.5, showPlayer?: player): {
        icon: Frame,
        text: Frame,
    } {
        if (showPlayer != null && GetLocalPlayer() != showPlayer) {
            return
        }
        let frames = TipFrameUtil._sl_tipIconTextFrameObjectPool.borrowObject();
        frames.icon.setSize(0.06, 0.06);
        frames.icon.setTexture(icon);
        frames.icon.visible = true;
        //
        frames.text.visible = false;

        let tween = new Tween({x: startX, y: startY, s: 0.06, a: 255})
            .to({x: toX, y: toY, s: 0.025, a: 155}, dur * 1000)
            // .delay(200)
            .easing(Easing.Linear.None)
            .onUpdate((temp) => {
                DzFrameSetAlpha(frames.icon.current, temp.a)
                DzFrameSetAbsolutePoint(frames.icon.current, FRAMEPOINT_CENTER, temp.x, temp.y)
                DzFrameSetSize(frames.icon.current, temp.s, temp.s)
            }).onComplete(o => {
                frames.icon.setSize(0.04, 0.04);
                frames.icon.visible = false;
                frames.text.visible = false;
                TipFrameUtil._sl_tipIconTextFrameObjectPool.returnObject(frames);
            });
        tween.start()
        return frames;
    }
}