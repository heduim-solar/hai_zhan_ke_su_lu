/**
 * 内置japi的相关工具类
 */
import Cache from "@/Cache";

export default class EmbedJapiUtil {
    private static _sl_cache = new Cache();


    /**
     * 矩形裁剪图片
     * 左上角为0,0 原点
     * 右下角为 图片的 maxX maxY
     * @param path
     * @param left minX
     * @param top minY
     * @param right maxX
     * @param bottom maxY
     * @constructor
     */
    static blpRect(path: string, left: number, top: number, right: number, bottom: number): string {
        if (!EXBlpRect) {
            log.errorWithTraceBack("当前环境不是内置japi环境!")
            return path;
        }
        left = Math.floor(left);
        top = Math.floor(top);
        right = Math.floor(right);
        bottom = Math.floor(bottom);
        let newPath = "blpRect" + left + "_" + top + "_" + right + "_" + bottom + path;
        return EmbedJapiUtil._sl_cache.get(newPath, () => {
            EXBlpRect(path, newPath, left, top, right, bottom);
            return newPath;
        });
    }


}