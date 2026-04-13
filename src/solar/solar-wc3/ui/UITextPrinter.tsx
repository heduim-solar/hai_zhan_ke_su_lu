/**文字打印机*/
import * as React from "@/w3ts/tsx";
import {Frame} from "@/frame";
import BaseUtil from "@/BaseUtil";
import FramePoint from "@/FramePoint";
import StringUtil from "@/StringUtil";


export default class UITextPrinter {

    private _root: Frame = new Frame();
    private _backdrop: Frame = new Frame();
    private _text: Frame = new Frame();
    private _textString: string = '';
    private _isPrint: boolean = false;
    private _anchorPoint: FramePoint = FramePoint.center;

    constructor(text: string = '') {
        React.render(this.draw(), DzGetGameUI());
        this.setText(text);
        this._root.setVisible(false);
        this._backdrop.setPoints(this._text.current, 0.005, 0.005);
    }

    /**逐个打印文本*/
    public startPrint() {
        let index: number = 0;
        let displayString: string = '';
        this._text.setText(displayString);
        this._root.setVisible(true);
        this._isPrint = true;
        let length: number = StringUtil.getLength(this._textString);
        BaseUtil.onTimer(0.03, () => {
            if (!this._isPrint) {
                return false;
            }
            index++;
            if (index <= length) {
                displayString += StringUtil.getCharAtIndex(this._textString, index);
                this._text.setText(displayString);
                return true;
            }
            return false;
        })
    }

    /**直接显示文本*/
    public showText() {
        this._root.setVisible(true);
        this._isPrint = false;
        this._text.setText(this._textString);
    }

    /**设置文本*/
    public setText(text: string) {
        this._textString = text;
        this._text.setText(text);
    }

    /**设置文本宽度*/
    public setTextWidth(width: number) {
        let height: number = this._text?.props?.size?.height ?? 0;
        this._text.setSize(width, height);
    }

    /**设置背景是否显示*/
    public setBackgroundVisible(flag: boolean) {
        this._backdrop.setVisible(flag);
    }

    /**设置锚点*/
    public setAnchorPoint(anchorPoint: FramePoint): void {
        this._anchorPoint = anchorPoint;
    }

    /**设置位置*/
    public setPosition(x: number, y: number): void {
        this._text.clearPoints();
        this._text.setAbsPoint(this._anchorPoint, x, y);
    }

    private draw() {
        return (<div
            size={{width: 0.001, height: 0.001}}
            ref={this._root}
            visible={true}>
            <backdrop
                id="backdrop"
                ref={this._backdrop}
                texture={'UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp'}
            >
            </backdrop>
            <text
                id="text"
                position={{x: 0.4, y: 0.3}}
                size={{width: 0.20, height: 0.00}}
                ref={this._text}
                text={''}
                textAlignment={TEXTALIGN_LEFT}
                font={{fileName: "ZITI.TTF", height: 0.012, flags: 0}}
            >
            </text>
        </div>);
    }
}