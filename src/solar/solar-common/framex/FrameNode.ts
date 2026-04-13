import {Frame} from "@/frame";
import FramePoint from "@/FramePoint";

export default class FrameNode implements Destroyable {
    /** ui */
    rootFrame: Frame;
    protected _sl_Frames: Frame[] = [];
    protected _sl_isDestroyed = false;

    constructor() {
        // this.rootFrame = new Frame("FRAME", null, null) //会阻挡鼠标点击到地面
        this.rootFrame = new Frame("BACKDROP", null, null)//不会阻挡鼠标点击到地面
        this.rootFrame.setTexture('UI\\Widgets\\EscMenu\\Human\\blank-background.blp')
        this.rootFrame.setSize(0.04, 0.04)
    }

    get handle(): number {
        return this.rootFrame.handle
    }

    setSize(width: number, height: number) {
        this.rootFrame.setSize(width, height)
    }

    setAbsPoint(point: FramePoint, x: number, y: number) {
        this.rootFrame.setAbsPoint(point, x, y)
    }

    public set visible(flag: boolean) {
        this.rootFrame.visible = flag;
    }

    public get visible() {
        return this.rootFrame.visible;
    }

    public destroy() {
        if (this._sl_isDestroyed) {
            return
        }
        if (this._sl_Frames != null) {
            for (let frame of this._sl_Frames) {
                frame.destroy();
            }
            this._sl_Frames = null;
        }
        this._sl_isDestroyed = true;
    }

}