import ActorFrameUtil from "@/ActorFrameUtil";
import FramePoint from "@/FramePoint";
import TipFrameUtil from "@/TipFrameUtil";
import NativeFrameUtil from "@/NativeFrameUtil";

/**
 * 游戏中的文字非常重要。(文字越少越好 没人愿意玩游戏时花太多时间在看文字上)
 * 此类可以让你的地图变成没有文字的模式 方便测试无文字的情况下其他东西的表达力 以及文字的表达力重心
 *
 * 使用场景:测试地图上手难度。
 * 可以在此模式下游玩地图 遇到玩不懂的地方 优先考虑提高美术场景等人性化直观表达力 然后再考虑加上必要的辅助文字 这样玩家上手就丝滑多了
 */
export default class 无文字模式 {

    static justInit = 无文字模式.init();

    constructor() {
        无文字模式.init();
    }


    static init(): boolean {
        _G.DisplayTextToPlayer = () => {

        }
        _G.DisplayTimedTextToPlayer = () => {

        }
        _G.DisplayTimedTextFromPlayer = () => {

        }
        _G.SetTextTagText = () => {

        }
        _G.MultiboardSetItemValue = () => {

        }
        _G.MultiboardDisplay = () => {

        }
        _G.DialogSetMessage = () => {

        }
        _G.TimerDialogSetTitle = () => {

        }
        _G.TimerDialogDisplay = () => {

        }
        _G.DzFrameSetText = () => {

        }
        _G.DialogAddButton = (whichDialog: dialog, buttonText: string, hotkey: number) => {
            let cj: NoSelf = require("jass.common")
            return cj.DialogAddButton(whichDialog, "", hotkey);
        }

        //
        let tooltip = DzFrameGetTooltip();
        DzFrameClearAllPoints(tooltip);
        DzFrameSetAbsolutePoint(tooltip, FramePoint.bottomLeft, 0.81, 0);
        ActorFrameUtil.showTooltip = () => {
        }
        ActorFrameUtil.hideTooltip = () => {
        }
        TipFrameUtil.showTipText = () => {
            return null;
        }
        //


        无文字模式.hideFrames(NativeFrameUtil.getUnitDetail());
        无文字模式.hideFrames(NativeFrameUtil.getHeroStatePanel());
        无文字模式.hideFrames(NativeFrameUtil.getUnitAttackValue(0));
        无文字模式.hideFrames(NativeFrameUtil.getUnitAttackValue(1));
        无文字模式.hideFrames(NativeFrameUtil.getUnitArmorValue());
        无文字模式.hideFrames(NativeFrameUtil.getHeroStrValue());
        无文字模式.hideFrames(NativeFrameUtil.getHeroAgiValue());
        无文字模式.hideFrames(NativeFrameUtil.getHeroIntValue());
        无文字模式.hideFrames(NativeFrameUtil.getUnitName());
        无文字模式.hideFrames(NativeFrameUtil.getUnitClass());
        return true;
    }

    static hideFrames(frame: number) {
        DzFrameClearAllPoints(frame);
        DzFrameShow(frame, false);
        DzFrameSetAbsolutePoint(frame, FramePoint.bottomLeft, 0.81, 0);
    }

}