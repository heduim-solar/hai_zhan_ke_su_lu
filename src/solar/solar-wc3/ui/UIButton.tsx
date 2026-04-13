/**按钮*/
import * as React from "@/tsx";
import { Frame } from "@/frame";
import FramePoint from "@/FramePoint";


export default class UIButton {

    private _root: Frame = new Frame();
    private _backdrop: Frame = new Frame();
    private _text: Frame = new Frame();
    private _button: Frame = new Frame();
    private _callback: () => void = null;
    private _anchorPoint: FramePoint = FramePoint.center;
    private _zoomScale: number = 0.1;

    public setVisible(flag: boolean): void {
        this._root.setVisible(flag);
    }

    public setTexture(texture: string): void {
        this._backdrop.setTexture(texture);
    }

    public getTexture(): string {
        return this._backdrop.props.texture as string;
    }

    public setText(text: string) {
        this._text.setText(text);
    }

    public setAnchorPoint(anchorPoint: FramePoint): void {
        this._anchorPoint = anchorPoint;
    }

    public setPosition(x: number, y: number): void {
        this._backdrop.clearPoints();
        this._backdrop.setAbsPoint(this._anchorPoint, x, y);
    }

    public getPosition(): { x: number, y: number } {
        let x: number = (this._backdrop.props.position as Pos)['x'];
        let y: number = (this._backdrop.props.position as Pos)['y'];
        return { x: x, y: y };
    }

    public setContentSize(width: number, height: number): void {
        this._backdrop.setSize(width, height);
    }

    public getContentSize(): { width: number, height: number } {
        let width: number = this._backdrop?.props?.size?.width ?? 0.00;
        let height: number = this._backdrop?.props?.size?.height ?? 0.00;
        return { width: width, height: height };
    }

    public setScale(scale: number): void {
        this._backdrop.setScale(scale);
    }

    public getScale(): number {
        return this._backdrop?.props?.scale ?? 1.0;
    }

    public setZoomScale(scale: number): void {
        this._zoomScale = scale;
    }

    public getZoomScale(): number {
        return this._zoomScale;
    }

    public setCallback(callback: () => void) {
        this._callback = callback;
    }

    constructor(texture: string = '') {
        React.render(this.draw(), DzGetGameUI());
        this.setTexture(texture);
        this._button.addOnMouseDown(() => {
            this.setScale(1.0 + this._zoomScale);
        });
        this._button.addOnMouseUp(() => {
            this.setScale(1.0);
        });
    }

    private onClick() {
        if (this._callback) {
            this._callback();
        }
    }

    private draw() {
        return (<div
            size={{ width: 0.001, height: 0.001 }}
            ref={this._root}
            visible={true}>
            <backdrop
                id="backdrop"
                position={{ x: 0.4, y: 0.3 }}
                size={{ width: 0.03, height: 0.04 }}
                ref={this._backdrop}
                texture={''}
            >
                <text
                    id="text"
                    ref={this._text}
                    text={''}
                    textAlignment={TEXTALIGN_CENTER}
                    font={{ fileName: "ZITI.TTF", height: 0.012, flags: 0 }}
                >
                </text>
                <button
                    id="button"
                    ref={this._button}
                    onClick={() => this.onClick()}
                >
                </button>
            </backdrop>
        </div>);
    }
}