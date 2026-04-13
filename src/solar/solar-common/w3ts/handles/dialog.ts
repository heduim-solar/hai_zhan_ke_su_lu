/** @noSelfInFile **/

import {Handle} from "./handle";
import {MapPlayer} from "./player";
import DataBase from "../../common/DataBase";

export class DialogButton extends Handle<button> {

    constructor(whichDialog: Dialog, text: string, hotkey: number = 0, quit: boolean = false, score: boolean = false) {
        if (Handle.initFromHandle()) {
            super();
        } else if (!quit) {
            super(DialogAddButton(whichDialog.handle, text, hotkey));
        } else {
            super(DialogAddQuitButton(whichDialog.handle, score, text, hotkey));
        }
    }

    public get solarData(): { [key: string]: any } {
        return DataBase.getDialogButtonSolarData(this.handle)
    }

    public set solarData(obj: { [key: string]: any }) {
        DataBase.setDataByHandle("+dlb", this.handle, obj)
    }

    public static fromHandle(handle: button): DialogButton {
        return this.getObject(handle);
    }
}

export class Dialog extends Handle<dialog> {

    constructor() {
        super(Handle.initFromHandle() ? undefined : DialogCreate());
    }

    /**
     * 添加按钮
     * @param text
     * @param hotkey
     * @param quit
     * @param score
     */
    public addButton(text: string, hotkey: number = 0, quit: boolean = false, score: boolean = false) {
        return new DialogButton(this, text, hotkey, quit, score);
    }

    /**
     * 清除
     */
    public clear() {
        DialogClear(this.handle);
    }

    /**
     * 销毁
     */
    public destroy() {
        DialogDestroy(this.handle);
    }

    /**
     * 显示
     */
    public display(whichPlayer: MapPlayer, flag: boolean) {
        DialogDisplay(whichPlayer.handle, this.handle, flag);
    }

    /**
     * 设置消息
     */
    public setMessage(whichMessage: string) {
        DialogSetMessage(this.handle, whichMessage);
    }

    /**
     * 从handle封装对话框
     */
    public static fromHandle(handle: dialog): Dialog {
        return this.getObject(handle);
    }
}
