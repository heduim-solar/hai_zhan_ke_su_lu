import Cache from "@/Cache";
import AsyncUtil from "@/AsyncUtil";

const storm: NoSelf = require('jass.storm')
export default class IconUtil {
    /** 金色的64*64的钩子图标 */
    static tickIconPath = "UI\\Widgets\\Glues\\GlueScreen-Checkbox-Check.blp"

    /** 浅色半透明 */
    static backgroundIconPath = "UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp"

    static passiveIconPath = "solar_asset\\icon\\passive.blp";
    static disableIconPath = "solar_asset\\icon\\disable.blp";

    private static cache: Cache = new Cache();

    /**
     * 对64*64的 blp图片进行融合 返回融合后的结果图片路径
     * @param topPath 带透明的上层水印
     * @param bgPath 背景图
     */
    static blendIcon(topPath: string, bgPath: string): string {
        return IconUtil.cache.get(topPath + ":" + bgPath, () => {
            let resultPath = "_sl_blendIcon_" + AsyncUtil.getUUIDAsync() + ".blp";
            EXBlendButtonIcon(topPath, bgPath, resultPath)
            return resultPath;
        });
    }

    /**
     * 获取打钩的icon
     * @param bgIcon
     */
    static getTickIcon(bgIcon: string): string {
        return IconUtil.blendIcon(IconUtil.tickIconPath, bgIcon)
    }

    /**
     * 获取被动的icon
     * @param bgIcon
     */
    static getPassiveIcon(bgIcon: string): string {
        return IconUtil.blendIcon(IconUtil.passiveIconPath, bgIcon)
    }

    /**
     * 获取禁用的icon
     * @param bgIcon
     */
    static getDisableIcon(bgIcon: string): string {
        if (bgIcon == null) {
            return null;
        }
        return IconUtil.cache.get("getDisableIcon:" + bgIcon, () => {
            let fileName = bgIcon;
            let lastIndexOf = bgIcon.indexOf("\\");
            for (let i = 0; i < 100; i++) {
                let tempIndex = bgIcon.indexOf("\\", lastIndexOf + 1);
                if (tempIndex > 0 && tempIndex > lastIndexOf) {
                    lastIndexOf = tempIndex;
                } else {
                    break
                }
            }
            if (lastIndexOf > 0) {
                fileName = bgIcon.substring(lastIndexOf + 1, bgIcon.length);
            }
            let baseDisableIconPath = "ReplaceableTextures\\CommandButtonsDisabled\\DIS" + fileName;
            if (storm.load(baseDisableIconPath) != null) {
                return baseDisableIconPath;
            }
            return IconUtil.blendIcon(IconUtil.disableIconPath, bgIcon);
        })
    }


}