import BaseUtil from "@/BaseUtil";
import AttributeUtil from "@/AttributeUtil";
import PlayerUtil from "@/PlayerUtil";
import {Frame} from "@/frame";
import FramePoint from "@/FramePoint";
import NativeFrameUtil from "@/NativeFrameUtil";
import TextAlign from "@/TextAlign";

declare global {
    interface AppPlayerAttribute {
        每秒金币?: number
        每秒木材?: number
        每秒人口?: number
        金币收益加成?: number
        木材收益加成?: number
    }
}

export default class 每秒资源 {

    static cfg = {
        showUI: true
    }
    goldAddText: Frame = null;
    lumberAddText: Frame = null;

    constructor() {
        if (每秒资源.cfg.showUI) {
            let goldAddText = Frame.createTEXT();
            goldAddText.setPoint(FramePoint.right, NativeFrameUtil.getGoldText(), FramePoint.left, -0.001, 0)
            goldAddText.setText('|cFFFFC66D+0/s');
            goldAddText.setTextAlignment(TextAlign.right);
            this.goldAddText = goldAddText;

            let lumberAddText = Frame.createTEXT();
            lumberAddText.setPoint(FramePoint.right, NativeFrameUtil.getLumberText(), FramePoint.left, -0.001, 0)
            lumberAddText.setText('|cFF499C54+0/s');
            lumberAddText.setTextAlignment(TextAlign.right);
            lumberAddText.visible = false;
            this.lumberAddText = lumberAddText;
        }


        BaseUtil.onTimer(1, () => {
            AttributeUtil.forAllPlayerAttribute((p, playerAttribute) => {
                if (playerAttribute.每秒金币) {
                    let add = playerAttribute.每秒金币 * (1 + (playerAttribute.金币收益加成 || 0))
                    if (playerAttribute.earn_gold_p) {
                        add = add * (1 + playerAttribute.earn_gold_p);
                    }
                    add = Math.floor(add);
                    PlayerUtil.addGoldState(p, add)
                    if (this.goldAddText && GetLocalPlayer() == p) {
                        this.goldAddText.setText('|cFFFFC66D+' + add + '/s');
                    }
                }
                if (playerAttribute.每秒木材) {
                    let add = playerAttribute.每秒木材 * (1 + (playerAttribute.木材收益加成 || 0))
                    add = Math.floor(add);
                    PlayerUtil.addLumberState(p, add)
                    if (this.lumberAddText && GetLocalPlayer() == p) {
                        this.lumberAddText.setText('|cFF499C54+' + add + '/s');
                    }
                }
                if (playerAttribute.每秒人口) {
                    PlayerUtil.addFoodCapState(p, playerAttribute.每秒人口)
                }
            })
            return true;
        });


    }


}