import {Frame} from "@/frame";
import FrameNode from "@/FrameNode";

export default class ImageColor extends FrameNode {
    static bgPath = "UI\\Widgets\\EscMenu\\Human\\slider-background.blp";
    static rPath = "ReplaceableTextures\\TeamColor\\TeamColor00.blp";
    static gPath = "ReplaceableTextures\\TeamColor\\TeamColor06.blp";
    static bPath = "ReplaceableTextures\\TeamColor\\TeamColor01.blp";

    bgFrame: Frame;
    rFrame: Frame;
    gFrame: Frame;
    bFrame: Frame;


    constructor() {
        super();

        this.bgFrame = Frame.createBackDrop(this.handle)
        this._sl_Frames.push(this.bgFrame)
        this.bgFrame.setAllPoints(this.handle)
        this.bgFrame.setTexture(ImageColor.bgPath)
        this.rFrame = Frame.createBackDrop(this.handle)
        this._sl_Frames.push(this.rFrame)
        this.rFrame.setAllPoints(this.handle)
        this.rFrame.setTexture(ImageColor.rPath)
        this.gFrame = Frame.createBackDrop(this.handle)
        this._sl_Frames.push(this.gFrame)
        this.gFrame.setAllPoints(this.handle)
        this.gFrame.setTexture(ImageColor.gPath)
        this.bFrame = Frame.createBackDrop(this.handle)
        this._sl_Frames.push(this.bFrame)
        this.bFrame.setAllPoints(this.handle)
        this.bFrame.setTexture(ImageColor.bPath)
    }


    /**
     * 设置图片 rgb 颜色 (实际颜色和透明度 会相差一些 算法有待改进 适合要求不高的背景图 )
     * @param r
     * @param g
     * @param b
     * @param a
     */
    setColor(r: number, g: number, b: number, a: number = 255) {
        let ta = 255;
        // let aba = (r + g + b) / ta * (a / 255)
        let aba = (a / 255)
        this.bgFrame.setAlpha(a * 0.9)
        this.rFrame.setAlpha(r * 0.7 * aba)
        this.gFrame.setAlpha(g * 0.7 * aba)
        this.bFrame.setAlpha(b * 0.7 * aba)
    }

}