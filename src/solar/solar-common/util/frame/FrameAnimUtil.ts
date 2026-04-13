import {Frame} from "@/frame";
import FramePoint from "@/FramePoint";
import BaseUtil from "@/BaseUtil";
import ObjectPool from "@/ObjectPool";

export default class FrameAnimUtil {
    /**
     * Cooldown Frame 对象池
     */
    static cdFramePool: ObjectPool<Frame> = new ObjectPool<Frame>(() => {
        let cdFrame = Frame.createSPRITE();
        cdFrame.clearPoints();
        cdFrame.setModel("UI\\Feedback\\Cooldown\\UI-Cooldown-Indicator.mdx", 0);
        cdFrame.setSpriteAnimate(0, false)
        return cdFrame
    }, frame => {
        frame.clearPoints();
        frame.setAbsPoint(FramePoint.left, -1, -1)
        frame.visible = false
    });
    static cdRefreshInterval: number = 0.2

    /**
     * 返回一个cd对象池 中的 cd Frame
     * @param parent
     * @param cd
     */
    static addCooldown(parent: Frame, cd: number): Frame {
        let cdFrame = FrameAnimUtil.cdFramePool.borrowObject();
        cdFrame.visible = true
        cdFrame.setPoint(FramePoint.center, parent.current, FramePoint.center, 0.00, 0.00)
        cdFrame.setAllPoints(parent.current)
        cdFrame.setAnimateOffset(0);
        if (isEmbedJapi) {
            //拥有内置 才能设置大小
            let modelSize = DzFrameGetHeight(parent.current) / 0.0378
            cdFrame.setModelSize(modelSize);
        }
        BaseUtil.onTimer(FrameAnimUtil.cdRefreshInterval, (count) => {
            let offset = FrameAnimUtil.cdRefreshInterval * count / cd;
            cdFrame.setAnimateOffset(offset)
            if (offset >= 1) {
                FrameAnimUtil.cdFramePool.returnObject(cdFrame);
                return false;
            }
            return true;
        });
        return cdFrame;

    }


    /**
     *  添加鼠标移入放大动画
     */
    static addEnlargeMouseEnter(frame: Frame, widthFactor: number = 1.05, heightFactor: number = widthFactor) {
        //点击按钮事件
        frame.addOnClick(() => {
            DzFrameSetSize(frame.current, frame.props.size.width * widthFactor, frame.props.size.height * heightFactor)
        })
        //进入按钮事件
        frame.addOnMouseEnter(() => {
            DzFrameSetSize(frame.current, frame.props.size.width * widthFactor, frame.props.size.height * heightFactor)
        })
        //离开按钮事件
        frame.addOnMouseLeave(() => {
            DzFrameSetSize(frame.current, frame.props.size.width, frame.props.size.height)
        })
    }

}