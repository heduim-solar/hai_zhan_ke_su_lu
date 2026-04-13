/** @noSelfInFile **/

import {Handle} from "./handle";
import {Unit} from "./unit";

export class TextTag extends Handle<texttag> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
            return
        }
        let textTagHandle = CreateTextTag();
        if (textTagHandle) {
            super(textTagHandle);
        }

    }

    /**
     * 销毁漂浮文字 [R]
     */
    public destroy() {
        DestroyTextTag(this.handle);
    }

    /**
     * 设置已存在时间 [R]
     */
    public setAge(age: number) {
        SetTextTagAge(this.handle, age);
    }

    /**
     * 改变颜色 [R]
     */
    public setColor(red: number, green: number, blue: number, alpha: number) {
        SetTextTagColor(this.handle, red, green, blue, alpha);
    }

    /**
     * 设置消逝时间点
     * @param fadepoint
     */
    public setFadepoint(fadepoint: number) {
        SetTextTagFadepoint(this.handle, fadepoint);
    }

    /**
     * 设置显示时间
     * @param lifespan
     */
    public setLifespan(lifespan: number) {
        SetTextTagLifespan(this.handle, lifespan);
    }

    /**
     * 设置永久显示
     * @param flag
     */
    public setPermanent(flag: boolean) {
        SetTextTagPermanent(this.handle, flag);
    }

    /**
     * 改变位置(坐标) [R]
     */
    public setPos(x: number, y: number, heightOffset: number) {
        SetTextTagPos(this.handle, x, y, heightOffset);
    }

    /**
     * 改变位置(单位点) [R]
     */
    public setPosUnit(u: Unit, heightOffset: number) {
        SetTextTagPosUnit(this.handle, u.handle, heightOffset);
    }

    /**
     * 暂停/恢复
     * 暂停状态暂停漂浮文字的移动和生命计时.
     * @param flag
     */
    public setSuspended(flag: boolean) {
        SetTextTagSuspended(this.handle, flag);
    }

    /**
     * 改变文字内容 [R]
     */
    public setText(s: string, height: number, adjustHeight = false) {
        if (adjustHeight) {
            height = height * 0.0023;
        }
        SetTextTagText(this.handle, s, height);
    }

    /**
     * 设置速率 [R]
     */
    public setVelocity(xvel: number, yvel: number) {
        SetTextTagVelocity(this.handle, xvel, yvel);
    }

    /**
     * 设置速率(角度)[R]
     */
    public setVelocityAngle(speed: number, angle: number) {
        const vel = speed * 0.071 / 128;
        this.setVelocity(vel * Cos(angle * 0.017), vel * Sin(angle * 0.017));
    }

    /**
     * 显示/隐藏 (所有玩家) [R]
     */
    public setVisible(flag: boolean) {
        SetTextTagVisibility(this.handle, flag);
    }

    public static fromHandle(handle: texttag): TextTag {
        return this.getObject(handle);
    }

}
