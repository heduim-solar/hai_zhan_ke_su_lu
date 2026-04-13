import {Frame} from "@/frame";
import TextAlign from "@/TextAlign";
import FramePoint from "@/FramePoint";
import {Trigger} from "@/trigger";
import DamageRecordUtil, {RecordRankingDataType} from "@/DamageRecordUtil";
import TextUtil from "@/TextUtil";
import FrameAnimUtil from "@/FrameAnimUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import DataBase from "@/DataBase";

type 行记录集合 = {
    行记录: Frame,
    记录图标: Frame,
    记录名字: Frame,
    记录值: Frame,
}

export default class 伤害排行榜 {

    static config = {
        lineSize: 6,
        selectedColor: DzGetColor(255, 255, 0, 0),
        baseColor: DzGetColor(255, 255, 255, 255),
        baseIcon: "UI\\Widgets\\BattleNet\\chaticons\\bnet-squelch.blp",
    }

    static root: Frame = null;

    static 总开关: Frame = null;
    static lineFrames: 行记录集合[] = [];
    static rankType: "玩家排行" | "总伤害" | "阶段" = "阶段"

    constructor(container = DzGetGameUI()) {
        伤害排行榜.create(container)
        let trigger = new Trigger();
        trigger.registerTimerEvent(1, true)
        trigger.addAction(() => {
            伤害排行榜.update();
        })
        //
    }

    static update() {
        if (伤害排行榜.root.visible == false) {
            return
        }
        let rankingDatas: RecordRankingDataType[] = null;
        if (伤害排行榜.rankType == "玩家排行") {
            rankingDatas = DamageRecordUtil.getRecordsByPlayer(DamageRecordUtil.totalRecord);
        } else if (伤害排行榜.rankType == "总伤害") {
            rankingDatas = DamageRecordUtil.getRecordsByName(DamageRecordUtil.totalRecord, GetPlayerId(GetLocalPlayer()));
        } else if (伤害排行榜.rankType == "阶段") {
            rankingDatas = DamageRecordUtil.getRecordsByName(DamageRecordUtil.tempRecord, GetPlayerId(GetLocalPlayer()));
        }
        for (let i = 0; i < 伤害排行榜.config.lineSize; i++) {
            let lineFrame = 伤害排行榜.lineFrames[i];
            if (i < rankingDatas.length) {
                let rankingData = rankingDatas[i];
                lineFrame.记录名字.setText(rankingData.name)
                lineFrame.记录值.setText(TextUtil.toCnUnit(rankingData.total) + "(" + (Math.floor(rankingData.p * 100)) + "%)")

                let icon = DataBase.getSolarActorType(rankingData.name)?.icon;

                if (icon) {
                    lineFrame.记录图标.setTexture(icon);
                } else {
                    lineFrame.记录图标.setTexture(伤害排行榜.config.baseIcon);
                }
            } else {
                lineFrame.记录名字.setText("")
                lineFrame.记录值.setText("")
                lineFrame.记录图标.setTexture(伤害排行榜.config.baseIcon);
            }
        }
    }


    static create(container: number) {


        let 总开关 = 伤害排行榜.createTextBUTTON("伤害显示", DzGetGameUI())
        this.总开关 = 总开关;
        总开关.setSize(0.041, 0.02)
        总开关.setPoint(FramePoint.right, DzGetGameUI(), FramePoint.right, 0, 0.1)
        总开关.setVisible(true);
        总开关.setTextAlignment(TextAlign.center);
        总开关.addOnClick(() => {
            伤害排行榜.root.visible = !伤害排行榜.root.visible
            伤害排行榜.update();
        })

        let root = Frame.createBackDrop()
        伤害排行榜.root = root;
        root.setSize(0.13, 伤害排行榜.config.lineSize * 0.021)
        root.setPoint(FramePoint.topRight, 总开关.handle, FramePoint.bottomRight, 0, -0.02)
        root.visible = false;
        root.setTexture("UI\\Widgets\\EscMenu\\Undead\\undead-options-menu-background.blp");
        /**No.2  z:2 根节点----结束*/


        /**No.3  z:2 标签面板1----开始*/
        let 标签面板0 = 伤害排行榜.createTextBUTTON("玩家")
        标签面板0.setSize(0.02, 0.018)
        标签面板0.setPoint(FramePoint.bottomLeft, root.handle, FramePoint.topLeft, 0.002, 0)
        标签面板0.setTextAlignment(TextAlign.center);
        标签面板0.addOnClick(() => {
            标签面板0.textFrame.setTextColor(伤害排行榜.config.selectedColor)
            标签面板1.textFrame.setTextColor(伤害排行榜.config.baseColor)
            标签面板2.textFrame.setTextColor(伤害排行榜.config.baseColor)
            伤害排行榜.rankType = "玩家排行"
            伤害排行榜.update();
        })
        /**No.3  z:2 标签面板1----开始*/
        let 标签面板1 = 伤害排行榜.createTextBUTTON("总计")
        标签面板1.setSize(0.02, 0.018)
        标签面板1.setPoint(FramePoint.left, 标签面板0.handle, FramePoint.right, 0.005, 0)
        标签面板1.setTextAlignment(TextAlign.center);
        标签面板1.addOnClick(() => {
            标签面板0.textFrame.setTextColor(伤害排行榜.config.baseColor)
            标签面板1.textFrame.setTextColor(伤害排行榜.config.selectedColor)
            标签面板2.textFrame.setTextColor(伤害排行榜.config.baseColor)
            伤害排行榜.rankType = "总伤害"
            伤害排行榜.update();
        })
        /**No.3  z:2 标签面板1----结束*/
        let 标签面板2 = 伤害排行榜.createTextBUTTON("阶段")
        标签面板2.setSize(0.02, 0.018)
        标签面板2.setPoint(FramePoint.left, 标签面板1.handle, FramePoint.right, 0.005, 0)
        标签面板2.textFrame.setTextColor(伤害排行榜.config.selectedColor)
        标签面板2.setTextAlignment(TextAlign.center);
        标签面板2.addOnClick(() => {
            标签面板0.textFrame.setTextColor(伤害排行榜.config.baseColor)
            标签面板1.textFrame.setTextColor(伤害排行榜.config.baseColor)
            标签面板2.textFrame.setTextColor(伤害排行榜.config.selectedColor)
            伤害排行榜.rankType = "阶段"
            伤害排行榜.update();
        })

        let 标签面板3 = 伤害排行榜.createTextBUTTON("清空阶段")
        标签面板3.setSize(0.042, 0.018)
        标签面板3.setPoint(FramePoint.left, 标签面板2.handle, FramePoint.right, 0.005, 0)
        标签面板3.setTextAlignment(TextAlign.center);
        标签面板3.addOnClick(() => {
            //异步全清空
            DamageRecordUtil.clearRecordDatas(DamageRecordUtil.tempRecord)
            伤害排行榜.update();
        })


        let oneLine: 行记录集合 = null;
        for (let i = 1; i <= 伤害排行榜.config.lineSize; i++) {
            oneLine = 伤害排行榜.addOneLine(i);
            伤害排行榜.lineFrames.push(oneLine)
        }
        // root.setPoint(FramePoint.bottom, oneLine.行记录.handle, FramePoint.bottom, 0, 0)
    }

    static createTextBUTTON(text: string, parent?: number): Frame {
        if (parent == null) {
            parent = 伤害排行榜.root?.handle;
        }
        let textFrame = Frame.createTEXT(parent)
        textFrame.setText(text)
        let buttonFrame = Frame.createGLUEBUTTON(textFrame.handle)
        textFrame.setAllPoints(buttonFrame.handle)
        FrameAnimUtil.addEnlargeMouseEnter(buttonFrame)
        buttonFrame.textFrame = textFrame
        return buttonFrame;
    }


    static addOneLine(index: number): 行记录集合 {
        /**No.7  z:2 行记录----开始*/
        let 行记录 = new Frame("BACKDROP", null, 伤害排行榜.root.handle, "", 0);
        let lineHeight = 0.020;
        行记录.setSize(0.13, lineHeight)
        行记录.setPoint(FramePoint.topRight, 伤害排行榜.root.handle, FramePoint.topRight, 0, -(lineHeight + 0.001) * (index - 1))
        行记录.setTexture("UI\\Glues\\BattleNet\\BattleNetTeamLevelBar\\Loading-BarBackground.blp")
        /**No.8  z:3 记录图标----开始*/
        let 记录图标 = new Frame("BACKDROP", null, 行记录.handle, "", 0);

        记录图标.setSize(lineHeight, lineHeight)
        记录图标.setPoint(FramePoint.right, 行记录.handle, FramePoint.right, 0, 0)
        记录图标.setTexture(伤害排行榜.config.baseIcon);
        /**No.8  z:3 记录图标----结束*/
        /**No.9  z:3 记录名字----开始*/
        let 记录名字 = new Frame("TEXT", null, 行记录.handle, "", 0);

        记录名字.setSize(0, 0.020)
        记录名字.setPoint(FramePoint.right, 记录图标.handle, FramePoint.left, -0.002, 0)
        记录名字.setText('');
        记录名字.setTextAlignment(TextAlign.right);
        /**No.9  z:3 记录名字----结束*/
        /**No.10  z:3 记录值----开始*/
        let 记录值 = new Frame("TEXT", null, 行记录.handle, "", 0);

        记录值.setSize(0, 0.020)
        记录值.setPoint(FramePoint.right, 记录名字.handle, FramePoint.left, -0.01, 0)
        记录值.setVisible(true);
        记录值.setText('0(0%)');
        记录值.setTextAlignment(TextAlign.center);
        //
        return {
            行记录,
            记录图标,
            记录名字,
            记录值,
        }
    }


}
