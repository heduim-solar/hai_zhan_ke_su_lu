/**
 * 模拟游戏 父UI
 * 以达到分层级显示
 */
export default class FrameLayerUtil {

    private static father_UI_array: number[] = null;

    private static _sl_init() {
        // 创建 10个 父UI
        FrameLayerUtil.father_UI_array = [];
        for (let i = 0; i < 10; i++) {
            const temp_ui = DzCreateFrameByTagName("BACKDROP", '_sl_FrameLayerUtil' + i, DzGetGameUI(), "", 0)
            DzFrameSetTexture(temp_ui, 'UI\\Widgets\\EscMenu\\Human\\blank-background.blp', 0)
            DzFrameSetPoint(temp_ui, 0, DzGetGameUI(), 0, 0, 0)
            DzFrameSetPoint(temp_ui, 8, DzGetGameUI(), 8, 0, 0)
            FrameLayerUtil.father_UI_array.push(temp_ui)
        }
    }


    /**
     * 层级大的会覆盖层级小的
     * @param layer 0 - 9
     */
    static getLayerParentUI(layer: number = 0) {
        if (layer < 0) {
            layer = 0;
        } else if (layer > 9) {
            layer = 9;
        }
        if (FrameLayerUtil.father_UI_array == null) {
            FrameLayerUtil._sl_init();
        }
        return FrameLayerUtil.father_UI_array[layer];
    }

    /**
     * 设置有层级的父UI
     * @param frame
     * @param layer
     */
    static setLayerParent(frame: number, layer: number = 0) {
        DzFrameSetParent(frame, FrameLayerUtil.getLayerParentUI(layer));
    }

};