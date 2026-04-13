import * as React from "@/tsx";
import { Frame } from "@/frame";
import InputUtil from "@/InputUtil";


export default class UIFollowMouse {

    private _backdrop: Frame = new Frame();
    private static _instance: UIFollowMouse = null;

    public static getInstance(): UIFollowMouse {
        if (!UIFollowMouse._instance) {
            UIFollowMouse._instance = new UIFollowMouse();
        }
        return UIFollowMouse._instance;
    }

    public getBackdrop(): Frame {
        return this._backdrop;
    }

    public setTexture(texture: string) {
        this._backdrop.setTexture(texture);
    }

    public setVisible(flag: boolean) {
        this._backdrop.setVisible(flag);
    }

    public removeMouseMoveEvent() {
        InputUtil.removeMouseMoveEvent('UIFollowMouse');
    }

    private constructor() {
        React.render(this.draw(), DzGetGameUI());
        InputUtil.onMouseMoveEvent(() => {
            let x: number = RAbsBJ(0.80 * (I2R(DzGetMouseXRelative()) / I2R(DzGetClientWidth())));
            let y: number = RAbsBJ(0.60 - (0.60 * (I2R(DzGetMouseYRelative()) / I2R(DzGetClientHeight()))));
            this._backdrop.clearPoints();
            this._backdrop.setAbsPoint(4, x, y);
        }, 'UIFollowMouse');
    }

    private draw() {
        return (<div
            size={{ width: 0.001, height: 0.001 }}
            visible={true}>
            <backdrop
                position={{ x: 0.000, y: 0.000 }}
                size={{ width: 0.030, height: 0.040 }}
                visible={false}
                texture={'ReplaceableTextures\\CommandButtons\\BTNDispelMagic.blp'}
                ref={this._backdrop}
            >
            </backdrop>
        </div>);
    }
}