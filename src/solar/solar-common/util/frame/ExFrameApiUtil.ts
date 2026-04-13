import BaseUtil from "../BaseUtil";
import DataBase from "../../common/DataBase";
import STimer from "@/STimer";
import AsyncUtil from "../net/AsyncUtil";
import FramePoint from "../../constant/FramePoint";


export default class ExFrameApiUtil {


    /**
     * 设置小地图显示单位头像
     * (可以在物编里隐藏原生的英雄单位小地图显示)
     * @param unit 单位
     * @param head_pic_path 头像路径
     * @param picSize 头像大小
     */
    static setUnitMapHeadPortrait(unit: unit, head_pic_path: string, picSize = 0.01): STimer {
        const head_ui = DzCreateFrameByTagName("BACKDROP", 'ExFrameApiUtil_' + AsyncUtil.getUUIDAsync(), DzGetGameUI(), "template", 0)
        DzFrameSetSize(head_ui, picSize, picSize)
        DzFrameSetTexture(head_ui, head_pic_path, 0)
        // 世界地图与小地图的比例  原生的大小：0.1420116
        let minimapWidth = 0.1420116
        let minimapHeight = 0.1420116
        if (FrameGetWidth && FrameGetWidth(DzFrameGetMinimap()) > 0.01) {
            minimapWidth = FrameGetWidth(DzFrameGetMinimap())
        }
        if (FrameGetHeight && FrameGetHeight(DzFrameGetMinimap()) > 0.01) {
            minimapHeight = FrameGetHeight(DzFrameGetMinimap())
        }
        DataBase.getUnitSolarData(unit)._sl_head_ui = head_ui;
        return BaseUtil.onTimer(0.1, () => {
            if (DataBase.getUnitSolarData(unit, false)?._sl_head_ui == null) {
                DzDestroyFrame(head_ui)
                return false
            }
            //在这里实时获取 可以应对 地图切换镜头区域的情况
            const width = GetCameraBoundMaxX() - GetCameraBoundMinX();
            const height = GetCameraBoundMaxY() - GetCameraBoundMinY();
            const centerX = width / 2 + GetCameraBoundMinX();
            const centerY = height / 2 + GetCameraBoundMinY();
            const maxSize = Math.max(width, height);
            const w = minimapWidth / maxSize
            const h = minimapHeight / maxSize
            const x = (GetUnitX(unit) - centerX) * w
            const y = (GetUnitY(unit) - centerY) * h
            DzFrameSetPoint(head_ui, FramePoint.center, DzFrameGetMinimap(), FramePoint.center, x, y)
            return true
        });
    }


    /**
     * 用于将自己的Frame 绑定到原生的SimpleFrame 中
     * parentSimpleFrame 父节点
     */
    static createBaseFrameInSimpleFrame(parentSimpleFrame: number): number {
        let uuid = AsyncUtil.getUUIDAsync();
        DzCreateSimpleFrame("_sl_simpleframe_and_frame", parentSimpleFrame, uuid)
        return DzFrameFindByName("_sl_simpleframe_and_frame_frame", uuid)
    };


}