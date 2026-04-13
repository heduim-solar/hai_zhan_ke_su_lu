import {Frame} from "@/frame";
import FramePoint from "@/FramePoint";
import TextAlign from "@/TextAlign";
import AsyncUtil from "@/AsyncUtil";

declare global {

    interface IconOption {
        /**图标项目名字*/
        name: string
        /**图标项目图标*/
        icon?: string,
        /**图标项目信息*/
        info?: string,
    }

}

/**
 * 图标选择工具(比如三选一)
 * 可通过此工具解耦显示与需要显示的功能耦合
 * 切换显示效果可以重新设置IconChooserUtil.show = 你自己的显示函数
 */
export default class IconChooserUtil {
    static iconWidth = 0.12
    static iconHeight = 0.24
    static iconGap = 0.04
    static centerY = 0.35


    /**
     * 需要再同步逻辑中调用
     * @param playerId 给指定玩家显示选项
     * @param iconOptions 显示选项的备选项
     * @param onClickCallBack 当点击后的回调 (同步的)
     * @param title 可选的标题文字
     */
    static show(playerId: number, iconOptions: IconOption[], onClickCallBack: (index: number, iconOption: IconOption) => void, title?: string): void {

        //异步执行
        let startX = (0.8 - (IconChooserUtil.iconWidth * iconOptions.length + IconChooserUtil.iconGap * (iconOptions.length - 1))) / 2
        let rootFrame = new Frame("FRAME");
        for (let i = 0; i < iconOptions.length; i++) {
            let iconOption = iconOptions[i];
            let backDropFrame = Frame.createBackDrop(rootFrame.current);
            backDropFrame.setTexture(iconOption.icon)
            backDropFrame.setSize(IconChooserUtil.iconWidth, IconChooserUtil.iconHeight);
            backDropFrame.setAbsPoint(FramePoint.left, startX + ((IconChooserUtil.iconWidth + 0.04) * i), IconChooserUtil.centerY);


            let nameFrame = Frame.createTEXT(backDropFrame.current);
            nameFrame.setText(iconOption.name)
            nameFrame.setPoint(FramePoint.top, backDropFrame.current, FramePoint.top, 0, -0.01)
            nameFrame.setTextAlignment(TextAlign.top)

            let infoFrame = Frame.createTEXT(backDropFrame.current);
            infoFrame.setText(iconOption.info)
            infoFrame.setAllPoints(backDropFrame.current)
            infoFrame.setTextAlignment(TextAlign.center)

            let btn = Frame.createGLUEBUTTON(backDropFrame.current)
            btn.setAllPoints(backDropFrame.current)
            let index = i;
            btn.setOnClick(() => {
                rootFrame.setVisible(false);
                DzDestroyFrame(rootFrame.current);
                onClickCallBack(index, iconOption);
            }, true);

            backDropFrame.setVisible(false)
            AsyncUtil.run(() => {
                backDropFrame.setVisible(true)
            }, Player(playerId));
        }

        if (title) {
            AsyncUtil.run(() => {
                let titleFrame = Frame.createTEXT(rootFrame.current);
                titleFrame.setWidth(0.3)
                titleFrame.setText(title)
                titleFrame.setFont(0.026)
                titleFrame.setAbsPoint(FramePoint.top, 0.4, IconChooserUtil.centerY + (IconChooserUtil.iconHeight / 2) + IconChooserUtil.iconGap)
                titleFrame.setTextAlignment(TextAlign.top)
            }, Player(playerId));
        }
    }


}