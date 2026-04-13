/** @noSelfInFile **/
import DataBase from "@/DataBase";
import AsyncUtil from "@/AsyncUtil";
import Cache from "@/Cache";
import TextAlign from "@/TextAlign";
import FramePoint from "@/FramePoint";
import InputUtil from "@/InputUtil";
import BaseUtil from "@/BaseUtil";
import SolarEvent from "@/SolarEvent";
import ArrayUtil from "@/ArrayUtil";


/**
 BACKDROP, TEXT, GLUETEXTBUTTON, BUTTON, TEXTBUTTON, TEXTAREA,
 FRAME, CHECKBOX, EDITBOX, GLUEBUTTON, SCROLLBAR, SLIDER,
 POPUPMENU, CONTROL, DIALOG, HIGHLIGHT, LISTBOX, MENU,
 CHATDISPLAY, GLUECHECKBOX, SIMPLEFRAME, SIMPLEBUTTON;

 */
export type PointType = {
    point?: number;
    relative?: number;
    relativePoint?: number;
    x?: number;
    y?: number;
}
declare global {
    interface DragEvent {
        /** 所在控件的 x  */
        x?: number;
        /** 所在控件的 y  */
        y?: number;
        /** 增量 x  */
        deltaX?: number;
        /** 增量 y  */
        deltaY?: number;
        /** 游戏窗口x (0-0.8 )  */
        sceneX: number;
        /** 游戏窗口y 从下到上(0-0.6 )  */
        sceneY: number;
        /** 电脑屏幕x (0-显示屏像素)  */
        screenX: number;
        /** 电脑屏幕y 从上到下(0-显示屏像素)  */
        screenY: number;
        /** 初始鼠标X */
        startDragX?: number;
        /** 初始鼠标Y */
        startDragY?: number;
    }

}

export class Frame {
    private static _sl_cache = new Cache();

    current: number = 0
    type: string = ""
    //缓存数据 要保证这里的数据是真实的Frame的数据 即所有修改frame的值都通过此类修改。否则访问这里的值可能不准确
    private propsTemp: FrameProps = null;


    constructor(frameOrFrameType?: FrameType | string | number, name?: string, parent?: number, template?: string, id?: number) {
        if (!frameOrFrameType) {//创建一个空的Frame 然后自行设置current的 值
            return;
        }
        const type = typeof frameOrFrameType;
        if (type == "number") {//如果名字不存在 说明是包装一个已有的frame
            this.current = frameOrFrameType as number;
            Frame._sl_cache.put("handle:" + this.current, this);
            return;
        }
        if (!name) {
            name = "Solar:Frame:" + AsyncUtil.getUUIDAsync();
        }
        if (!parent) {
            parent = DzGetGameUI();
        }
        if (!template) {
            template = "";
        }
        if (!id) {
            id = 0;
        }
        this.type = frameOrFrameType as string;
        this.current = DzCreateFrameByTagName(
            frameOrFrameType as string,
            name,
            parent,
            template,
            id,
        );
        Frame._sl_cache.put("handle:" + this.current, this);
    }


    public get props(): FrameProps {
        if (!this.propsTemp) {//初始化一个空的props
            if (this.current == 0) {
                this.propsTemp = {size: {}, position: {relative: 0, x: 0, y: 0}, visible: true, scale: 1}
            } else {
                this.propsTemp = {
                    size: {
                        width: 0,
                        height: 0
                    },
                    position: {
                        relative: DzFrameGetParent(this.current),
                        x: 0,
                        y: 0
                    },
                    visible: true,
                    scale: 1
                }
            }
        }
        return this.propsTemp;
    }

    public set props(obj: FrameProps) {
        this.propsTemp = obj;
    }

    public get solarData(): AppFrameData {
        return DataBase.getDataByTypeId("_SL_Frame", tostring(this.current))
    }

    public set solarData(obj: { [key: string]: any }) {
        DataBase.setDataByTypeId("_SL_Frame", tostring(this.current), obj)
    }


    get handle(): number {
        return this.current;
    }


    public set alpha(alpha: number) {
        DzFrameSetAlpha(this.current, alpha);

    }

    public get alpha() {
        return DzFrameGetAlpha(this.current);
    }

    // public get children() {
    //     const count = this.childrenCount;
    //     const output: Frame[] = [];
    //     for (let i = 0; i < count; i++) {
    //         output.push(this.getChild(i));
    //     }
    //     return output;
    // }
    //
    // public get childrenCount() {
    //     return DzFrameGetChildrenCount(this.current);
    // }
    /**设置窗体禁用/启用 */
    public set enabled(flag: boolean) {
        DzFrameSetEnable(this.current, flag);
    }

    /**获取控件是否启用 */
    public get enabled() {
        return DzFrameGetEnable(this.current);
    }

    public set height(height: number) {
        this.props.size.height = height;
        if (this.current != 0) {
            DzFrameSetSize(this.current, this.width, height);
        }
    }

    public get height() {
        if (this.current == 0) {
            return this.props.size.height;
        }
        return DzFrameGetHeight(this.current);
    }

    public set parent(parent: number) {
        DzFrameSetParent(this.current, parent);
    }

    public get parent() {
        return DzFrameGetParent(this.current);
    }

    public set text(text: string) {
        this.setText(text)
    }

    public get text() {
        return this.getText();
    }

    public set textSizeLimit(size: number) {
        DzFrameSetTextSizeLimit(this.current, size);
    }

    public get textSizeLimit() {
        return DzFrameGetTextSizeLimit(this.current);
    }

    public set value(value: number) {
        DzFrameSetValue(this.current, value);
    }

    public get value() {
        return DzFrameGetValue(this.current);
    }

    /**显示/隐藏窗体 */
    public set visible(flag: boolean) {
        this.props.visible = flag;
        DzFrameShow(this.current, flag);
    }

    public get visible() {
        return this.props.visible;
    }

    public set width(width: number) {
        this.props.size.width = width;
        DzFrameSetSize(this.current, width, this.height);
    }

    public get width() {
        return this.props.size.width;
    }

    public cageMouse(enable: boolean) {
        DzFrameCageMouse(this.current, enable);
        return this;
    }

    /**
     * 清除描点
     */
    public clearPoints() {
        DzFrameClearAllPoints(this.current);
        return this;
    }

    /**销毁窗体 */
    public destroy(this: any) {
        DzDestroyFrame(this.current)
        this.solarData = null;
        return this;
    }

    // public getChild(index: number) {
    //     return Frame.fromHandle(DzFrameGetChild(this.current, index));
    // }
    /**设置窗体绝对位置 */
    public setAbsPoint(point: FramePoint, x: number, y: number) {
        let pointObj = this.getPoint();
        if (!pointObj) {
            pointObj = {point: point, relative: DzGetGameUI(), relativePoint: FramePoint.bottomLeft, x, y}
            this.props.position = pointObj
        }
        pointObj.x = x;
        pointObj.y = y;
        DzFrameSetAbsolutePoint(this.current, point, x, y);
        return this;
    }

    /**设置所有锚点到目标窗体上 */
    public setAllPoints(relative: number) {
        DzFrameSetAllPoints(this.current, relative);
        return this;
    }

    /**设置透明度（0-255） */
    public setAlpha(alpha: number) {
        DzFrameSetAlpha(this.current, alpha);
        return this;
    }

    /**设置窗体禁用/启用 */
    public setEnabled(flag: boolean) {
        DzFrameSetEnable(this.current, flag);
        return this;
    }

    /**设置焦点 */
    public setFocus(flag: boolean) {
        DzFrameSetFocus(this.current, flag);
        return this;
    }

    /**
     * 设置字体,原生字体 "Fonts\\dfst-m3u.ttf"
     * @param height 字体大小(0.0001 - 0.026)
     * @param filename 路径名称
     * @param flags 默认填0
     */
    public setFont(height: number, filename: string = "Fonts\\dfst-m3u.ttf", flags: number = 0) {
        DzFrameSetFont(this.current, filename, height, flags);
        this.props.font = {fileName: filename, height: height, flags: flags}
        return this;
    }

    /**
     * 获取字体
     */
    public getFontName() {
        return this.props.font?.fileName
    }

    /**
     * 获取字体大小
     */
    public getFontSize() {
        return this.props.font?.height
    }

    /**
     * 设置高度
     * @param height
     */
    public setHeight(height: number) {
        this.setSize(this.width, height);
        return this;
    }

    /**
     * 设置宽度
     * @param width
     */
    public setWidth(width: number) {
        this.setSize(width, this.height);
        return this;
    }

    /**
     * 设置窗体大小 文本传入-1可以自适应大小
     * @param width
     * @param height
     */
    public setSize(width: number, height: number) {
        this.props.size.width = width;
        this.props.size.height = height;
        DzFrameSetSize(this.current, width, height);
        return this;
    }


    /**
     * 设置字体间距
     */
    public setTextFontSpacing(fontSpacing: number) {
        FrameSetTextFontSpacing(this.current, fontSpacing)
        this.props.fontSpacing = fontSpacing
    }

    /**
     * 获取字体间距
     */
    public getFontSpacing() {
        return this.props.fontSpacing
    }

    /**
     * 设置对齐方式
     * 2左上对齐  17中上对齐  33右上对齐
     * 3左中对齐  19中中对齐  35右中对齐
     * 5左下对齐  21中下对齐  37右下对齐
     */
    public setTextAlignment(alignment: TextAlign | number) {
        DzFrameSetTextAlignment(this.current, alignment)
        this.props.textAlignment = alignment
    }

    /**
     * 获取对齐方式
     */
    public getTextAlignment() {
        return this.props.textAlignment
    }

    /**
     * 设置ui优先级 (不是显示层级 只是ui点击优先级)
     * @param level
     */
    public setLevel(level: number) {
        FrameSetLevel(this.current, level);
        return this;
    }

    /**
     * 设置控件视口
     */
    public setFramePort(p2: boolean) {
        FrameSetViewPort(this.current, p2)
    }

    /**
     * 设置最小值与最大值
     */
    public setMinMaxValue(minValue: number, maxValue: number) {
        DzFrameSetMinMaxValue(this.current, minValue, maxValue);
        this.props.minMaxValue = {min: minValue, max: maxValue}
        return this;
    }

    /**
     * 获取最小值与最大值
     */
    public getMinMaxValue(): { min?: number, max?: number } {
        return this.props.minMaxValue
    }

    /**
     * 设置模型（支持Sprite、Model、StatusBar）
     */
    public setModel(modelFile: string, modelType: number = 0, flag: number = 0) {
        DzFrameSetModel(this.current, modelFile, modelType, flag);
        this.props.model = {modelFile: modelFile};
        return this;
    }

    /**
     * 获取模型
     */
    public getModel(): string {
        return this.props.model.modelFile
    }

    public setParent(parent: number) {
        DzFrameSetParent(this.current, parent);
        return this;
    }

    /**
     * 设置瞄准信息
     */
    public setPoint(pointObj: PointType): Frame;
    /**
     * 设置窗体相对位置 [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
     */
    public setPoint(point: FramePoint, relative: number, relativePoint: FramePoint, x?: number, y?: number): Frame;
    public setPoint(pointObjOrPoint: FramePoint | PointType, relative?: number, relativePoint?: FramePoint, x?: number, y?: number): Frame {
        if (pointObjOrPoint == null) {
            return this
        }
        if (typeof pointObjOrPoint == "number") {
            let point: number = pointObjOrPoint as number
            DzFrameSetPoint(this.current, point, relative, relativePoint, x || 0, y || 0);
            this.props.position = {point, relative, relativePoint, x: x || 0, y: y || 0}
        } else {
            let pointObj: PointType = pointObjOrPoint as PointType
            if (!pointObj.relative) {
                return this
            }
            DzFrameSetPoint(this.current, pointObj.point, pointObj.relative, pointObj.relativePoint, pointObj.x, pointObj.y);
            this.props.position = {
                point: pointObj.point, relative: pointObj.relative, relativePoint: pointObj.relativePoint, x:
                pointObj.x, y: pointObj.y
            }

        }
        return this;
    }

    /**
     * 设置到相对窗口的中心
     * @param relative
     */
    setPoint2Center(relative: number) {
        this.setPoint(FramePoint.center, relative, FramePoint.center, 0, 0)
    }

    /**
     * 获取瞄准信息
     */
    public getPoint(): {
        point?: number; relative?: number;
        relativePoint?: number; x?: number; y?: number;
    } {
        return this.props.position as any;
    }

    /**
     * 获取 相对 跟随UI
     */
    public getRelative() {
        let p: { relative: number } = this.props.position as any
        return p?.relative
    }

    /**
     * 获取窗体 相对 偏移
     */
    public getRelativeXY(): { x: number, y: number } {
        let p: { x: number, y: number } = this.props.position as any
        if (!p) {
            return null;
        }
        return {x: p.x, y: p.y}
    }

    /**
     * 设置跟随到相对节点的大小 通常用于背景自适应文本的ui （自动根据文本长度变化大小）
     * @param relative
     * @param widthGap
     * @param heightGap
     */
    public setPoints(relative: number, widthGap: number, heightGap: number = widthGap) {
        DzFrameSetPoint(this.current, FRAMEPOINT_TOPLEFT, relative, FRAMEPOINT_TOPLEFT, -widthGap, heightGap);
        DzFrameSetPoint(this.current, FRAMEPOINT_BOTTOMRIGHT, relative, FRAMEPOINT_BOTTOMRIGHT, widthGap, -heightGap);
        return this;
    }

    public getScale(): number {
        return this.props.scale;
    }

    public setScale(scale: number) {
        this.props.scale = scale;
        DzFrameSetScale(this.current, scale);
        return this;
    }

    /**
     * 设置动画
     * @param animId
     * @param autocast
     */
    public setSpriteAnimate(animId: number, autocast: boolean) {
        DzFrameSetAnimate(this.current, animId, autocast);
        return this;
    }

    /**
     * 播放模型指定动作
     */
    public setAnimationByIndex(animId: number) {
        FrameSetAnimationByIndex(this.current, animId)
        return this;
    }


    public setStepSize(stepSize: number) {
        DzFrameSetStepValue(this.current, stepSize);
        return this;
    }

    /**
     * 设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
     *  */
    public setText(text: string) {
        this.props.text = text;
        DzFrameSetText(this.current, text);
        return this;
    }

    public getText() {
        return DzFrameGetText(this.current);
    }


    public setTextColor(rOrColor: number, g?: number, b?: number) {
        if (b != null) {
            rOrColor = 255 * 0x1000000 + rOrColor * 0x10000 + g * 0x100 + b
        }
        DzFrameSetTextColor(this.current, rOrColor);
        return this;
    }

    public setTextSizeLimit(size: number) {
        DzFrameSetTextSizeLimit(this.current, size);
        return this;
    }

    /**
     * 设置UI 贴图
     * @param texFile
     * @param flag
     */
    public setTexture(texFile: string, flag: number = 0) {
        DzFrameSetTexture(this.current, texFile, flag);
        this.props.texture = texFile;
        return this;
    }

    /**
     * 获取UI贴图
     */
    public getTexture() {
        return this.props.texture
    }

    /**
     * 创建一个背景图 并返回这个背景Frame
     * @param texFile
     * @param flag
     */
    public addBackgroundImage(texFile: string, flag: number = 0): Frame {
        let backdropFrame = new Frame("BACKDROP", Frame.getRandomName(), this.current);
        backdropFrame.setTexture(texFile, flag);
        backdropFrame.setAllPoints(this.current)
        this.backdropFrame = backdropFrame;
        return backdropFrame;
    }

    /**
     * 创建一个文本 并返回这个文本Frame
     * (文本也有鼠标事件 会阻挡之前的父Frame的鼠标相关事件)
     * @param text
     */
    public addTextFrame(text: string): Frame {
        let frame = new Frame("TEXT", Frame.getRandomName(), this.current);
        frame.setText(text);
        frame.setAllPoints(this.current)
        this.textFrame = frame;
        return frame;
    }

    public setTooltip(tooltip: number) {
        DzFrameSetTooltip(this.current, tooltip);
        return this;
    }

    public setValue(value: number) {
        DzFrameSetValue(this.current, value);
        return this;
    }

    /**设置颜色（支持SimpleStatusBar） */
    public setVertexColor(color: number) {
        DzFrameSetVertexColor(this.current, color);
        return this;
    }

    /**显示/隐藏窗体 */
    public setVisible(flag: boolean) {
        this.props.visible = flag;
        DzFrameShow(this.current, flag);
        return this;
    }


    /**
     * 设置模型大小（内置缩放）
     * eJapi
     */
    public setModelSize(size: number) {
        if (FrameSetModelSize) {
            FrameSetModelSize(this.current, size)
        }
        this.props.modelSize = size
    }

    /**
     * 获取模型大小
     */
    public getModelSize(): number {
        return this.props.modelSize
    }

    /**
     * 设置模型粒子大小
     * eJapi
     */
    public set setModelPariticleSize(size: number) {
        FrameSetModelPariticle2Size(this.current, size)
        this.props.modelPariticleSize = size
    }

    /**
     * 设置模型粒子大小
     */
    public get getModelPariticleSize() {
        return this.props.modelPariticleSize;
    }

    /**
     * 设置模型动画播放速度
     */
    public setModelSpeed(Speed: number) {
        FrameSetModelSpeed(this.current, Speed)
        this.props.modelSpeed = Speed
    }

    /**
     * 获取模型动画播放速度
     */
    public getModelSpeed() {
        return this.props.modelSpeed
    }

    /**
     * 设置模型播放进度
     */
    public setAnimateOffset(offset: number) {
        DzFrameSetAnimateOffset(this.current, offset)
        this.props.animateOffset = offset
    }

    /**
     * 设置模型播放进度
     */
    public getAnimateOffset() {
        return this.props.animateOffset
    }

    /**
     * 设置UI忽视点击
     */
    public setIgnoreTrackEvent(ign: boolean) {
        FrameSetIgnoreTrackEvents(this.current, ign)
    }

    /**
     * 设置UI贴图为透明贴图
     */
    public setTexture2Transparent() {
        this.setTexture('UI\\Widgets\\EscMenu\\Human\\blank-background.blp')
    }

    /**
     * 设置UI对应贴图UI
     */
    public set backdropFrame(frame: Frame) {
        this.props.backdropFrame = frame
    }

    /**
     * 获取UI对应贴图UI
     */
    public get backdropFrame(): Frame {
        return this.props.backdropFrame
    }

    /**
     * 设置UI对应文字UI
     */
    public set textFrame(frame: Frame) {
        this.props.textFrame = frame
    }

    /**
     * 获取UI对应文字UI
     */
    public get textFrame(): Frame {
        return this.props.textFrame
    }

    /**
     * 事件
     */
    /**
     * 设置回调：点击事件
     */
    public setOnClick(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_CONTROL_CLICK, callback, sync);
    }

    /**
     * 添加回调：点击事件
     */
    public addOnClick(callback: () => void, sync = false) {
        this.addEventCallback(FRAMEEVENT_CONTROL_CLICK, callback, sync);
    }


    /**
     * 添加回调：右键按下事件
     */
    public addOnMouseRightDown(callback: () => void) {
        let current = this.current;
        InputUtil.onMouseRightButtonPressed(() => {
            let focusUiId = DzGetMouseFocus()
            if (focusUiId == current) {
                callback();
            }
        });
    }

    /**
     * 添加回调：右键释放事件
     */
    public addOnMouseRightUp(callback: () => void) {
        let current = this.current;
        InputUtil.onMouseRightButtonReleased(() => {
            let focusUiId = DzGetMouseFocus()
            if (focusUiId == current) {
                callback();
            }
        });
    }

    /**
     * 设置回调：双击事件
     */
    public setOnDoubleClick(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_DOUBLECLICK, callback, sync);
    }

    /**
     * 添加回调：双击事件
     */
    public addOnDoubleClick(callback: () => void, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_DOUBLECLICK, callback, sync);
    }

    /**
     * 设置回调：鼠标进入
     */
    public setOnMouseEnter(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_ENTER, callback, sync);
    }

    /**
     * 添加回调： 鼠标进入
     */
    public addOnMouseEnter(callback: () => void, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_ENTER, callback, sync);
    }

    /**
     * 设置回调：鼠标离开
     */
    public setOnMouseLeave(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_LEAVE, callback, sync);
    }

    /**
     * 添加回调：鼠标离开
     */
    public addOnMouseLeave(callback: () => void, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_LEAVE, callback, sync);
    }

    /**
     * 设置回调：鼠标按下
     * @deprecated  see addOnMouseDown
     */
    public setOnMouseDown(callback: () => void, sync = false) {
        //原生的貌似不生效
        this.setEventCallback(FRAMEEVENT_MOUSE_DOWN, callback, sync);
    }

    /**
     * 添加回调：鼠标按下
     * (内部以模拟 生效)
     */
    public addOnMouseDown(callback: () => void) {
        this.addEventCallback(FRAMEEVENT_MOUSE_DOWN, callback, false);
    }

    /**
     * 设置回调：鼠标释放
     */
    public setOnMouseUp(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_UP, callback, sync);
    }

    /**
     * 添加回调：鼠标释放
     */
    public addOnMouseUp(callback: () => void, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_UP, callback, sync);
    }

    /**
     * 设置回调：鼠标滚轮
     */
    public setOnMouseWheel(callback: () => void, sync = false) {
        this.setEventCallback(FRAMEEVENT_MOUSE_WHEEL, callback, sync);
    }

    /**
     * 添加回调：鼠标滚轮
     */
    public addOnMouseWheel(callback: () => void, sync = false) {
        this.addEventCallback(FRAMEEVENT_MOUSE_WHEEL, callback, sync);
    }

    /**
     * 设置UI回调事件 会覆盖之前设置的回调
     */
    public setEventCallback(event: number, callback: () => void, sync = false) {
        if (sync && isAsync) {
            log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！")
            return
        }

        //检查是否已替换
        let array: (() => void)[] = Frame._sl_cache.get(this.current + "aecb" + event);
        if (array) {
            log.errorWithTraceBack("你之前已经使用addEventCallback添加了此事件!请再次使用addEventCallback 以禁用此警告")
            array.push(callback)
        } else {
            //正常设置
            if (sync == false) {
                const key = "onFrameEvent:" + event;
                let solarTriggers = SolarEvent.getFrameDataEventHandler(this.current, key, false);
                ArrayUtil.clear(solarTriggers);
                se.onFrameEvent(this.handle, event, callback);
            } else {
                DzFrameSetScriptByCode(this.current, event, callback, sync)
            }
        }
    }

    /**
     * 添加UI回调事件
     */
    public addEventCallback(event: number, callback: (this: void) => void, sync = false) {
        if (sync && isAsync) {
            log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！")
            return
        }
        let array: (() => void)[] = Frame._sl_cache.get(this.current + "aecb" + event, () => {
            let array_temp = [];
            if (event == FRAMEEVENT_MOUSE_DOWN) {        //原生的貌似不生效 这里模拟一下
                let current = this.current;
                InputUtil.onMouseLeftButtonPressed(() => {
                    let focusUiId = DzGetMouseFocus()
                    if (focusUiId == current) {
                        for (let cb of array_temp) {
                            cb();
                        }
                    }
                });
                return array_temp;
            }
            if (sync == false) {
                se.onFrameEvent(this.handle, event, () => {
                    for (let cb of array_temp) {
                        cb();
                    }
                });
            } else {
                DzFrameSetScriptByCode(this.current, event, () => {
                    for (let cb of array_temp) {
                        cb();
                    }
                }, sync);
            }

            return array_temp;
        });
        array.push(callback)
    }


    /**
     * 扩展的事件
     */
    /**
     * 右键 拖放物品事件
     * 需保证frame是最上层的UI 即鼠标在窗口上时通过DzGetMouseFocus()能获得此UI
     */
    private _sl_FrameEvent_RightDragInit?: boolean
    /**可手动修改此值 为false 提前结束拖拽*/
    startDrag?: boolean = false
    private _sl_FrameEvent_startDragTime?: number
    private _sl_onRightDragStart: (this: void) => void;

    /**
     * 右键 拖放UI事件 开始
     */
    setOnRightDragStart(onRightDragStart: () => void) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragStart = onRightDragStart;
    }

    private _sl_onRightDragOver: (this: void, event: DragEvent) => void;

    /**
     * 右键 拖放UI事件 拖拽中
     */
    setOnRightDragOver(onRightDragOver: (event: DragEvent) => void) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragOver = onRightDragOver;
    }

    private _sl_onRightDragEnd: (this: void) => void;

    /**
     * 右键 拖放UI事件 拖拽结束
     */
    setOnRightDragEnd(onRightDragEnd: () => void) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragEnd = onRightDragEnd;
    }

    /**
     * 获取 拖放UI事件 拖拽结束 回调函数
     */
    getOnRightDragEnd(): () => void {
        return this._sl_onRightDragEnd;
    }

    private _sl_onRightDragDrop: (this: void, targetFrame?: Frame) => void;

    /**
     * 右键 拖放UI事件 拖放下ondrop
     */
    setOnRightDragDrop(onRightDragDrop: (targetFrame?: Frame) => void) {
        this._sl_InitRightDragEvent(this);
        this._sl_onRightDragDrop = onRightDragDrop;
    }


    public static fromEvent() {
        return this.fromHandle(DzGetTriggerUIEventFrame());
    }

    /**
     * 添加 鼠标左键拖拽事件 回调
     * @param onDrag
     */
    addOnDragOver(onDrag: (this: void, event: DragEvent) => void) {
        let f = this;
        this.addOnMouseDown(() => {
            f.startDrag = true;
            let bX = InputUtil.getMouseSceneX();
            let bY = InputUtil.getMouseSceneY();
            let startDragX = InputUtil.getMouseSceneX();
            let startDragY = InputUtil.getMouseSceneY();
            BaseUtil.onTimer(0.03, () => {
                if (!f.startDrag) {
                    return false;
                }
                let screenX = DzGetMouseX();
                let screenY = DzGetMouseY();
                let sceneX = InputUtil.getMouseSceneX();
                let sceneY = InputUtil.getMouseSceneY();
                let x = 0
                let y = 0
                let point = f.getPoint();
                if (point?.x && point.y) {
                    x = sceneX - point.x;
                    y = sceneY - point.y;
                }
                onDrag({
                    x,
                    y,
                    deltaX: sceneX - bX,
                    deltaY: sceneY - bY,
                    sceneX,
                    sceneY,
                    screenX,
                    screenY,
                    startDragX,
                    startDragY,
                })
                bX = sceneX;
                bY = sceneY;
                return true
            })
        });
        InputUtil.onMouseLeftButtonReleased(() => {
            f.startDrag = false;
        })
    }

    /**
     * solar 内部事件系统
     */
    private _sl_InitRightDragEvent(frame: Frame): void {
        if (this._sl_FrameEvent_RightDragInit == true) {
            return
        }
        this._sl_FrameEvent_RightDragInit = true;
        let MouseMoveEventKey = "RightDrag_" + frame.current
        //
        let bX = InputUtil.getMouseSceneX();
        let bY = InputUtil.getMouseSceneY();
        let onMouseMoveEventCallBack = function (this: void) {
            if (!frame.startDrag) {
                InputUtil.removeMouseMoveEvent(MouseMoveEventKey)
                return;
            }
            let screenX = DzGetMouseX();
            let screenY = DzGetMouseY();
            let sceneX = InputUtil.getMouseSceneX();
            let sceneY = InputUtil.getMouseSceneY();
            frame._sl_onRightDragOver?.({
                x: 0,
                y: 0,
                deltaX: sceneX - bX,
                deltaY: sceneY - bY,
                sceneX,
                sceneY,
                screenX,
                screenY,
                startDragX: bX,
                startDragY: bY,
            })
            return
        }
        //
        frame.addOnMouseRightUp(() => {
            if (frame.startDrag) {//如果已是拖拽状态 则退出取消拖拽
                frame.startDrag = false
                return
            }
            if (time - (frame._sl_FrameEvent_startDragTime || 0) < 500) {//短时间内 不能重复触发拖放
                return;
            }
            frame.startDrag = true;
            frame._sl_onRightDragStart?.();
            if (frame.startDrag) {//可能再 start事件里 又取消了拖放 所以这里再判断一下
                bX = InputUtil.getMouseSceneX();
                bY = InputUtil.getMouseSceneY();
                InputUtil.onMouseMoveEvent(onMouseMoveEventCallBack, MouseMoveEventKey)
            }

        });

        //
        InputUtil.onMouseRightButtonPressed(() => {
            if (frame.startDrag) {
                frame._sl_FrameEvent_startDragTime = time;
                frame._sl_onRightDragEnd?.();
                frame.startDrag = false;
            }
        });
        //放下
        InputUtil.onMouseLeftButtonPressed(() => {
            if (frame.startDrag) {
                frame._sl_FrameEvent_startDragTime = time;
                if (frame._sl_onRightDragDrop) {
                    let mouseFocus = DzGetMouseFocus();
                    let targetFrame = Frame.fromHandle(mouseFocus, true);
                    frame._sl_onRightDragDrop(targetFrame);
                } else {
                    frame.getOnRightDragEnd()?.();
                }
                frame.startDrag = false;
            }
        });
    }


    /**
     *
     * @param handle
     * @param onlyCache 是否只从已缓存的Frame中获取 默认为false 不存在时会新建Frame
     */
    public static fromHandle(handle: number, onlyCache: boolean = false): Frame {
        if (onlyCache) {
            return Frame._sl_cache.get("handle:" + handle);
        } else {
            return Frame._sl_cache.get("handle:" + handle, () => new Frame(handle));
        }

    }

    public static fromName(name: string, createContext: number) {
        return this.fromHandle(DzFrameFindByName(name, createContext));
    }

    public static loadTOC(filename: string) {
        return DzLoadToc(filename);
    }


    /**
     * helper
     */

    public static getRandomName() {
        return "Solar:Frame:" + AsyncUtil.getUUIDAsync();
    }

    /**
     * 创建一个FRAME 可当做FRAME 父容器 以管理子FRAME
     */
    public static createFrame(parent?: number) {
        return new Frame("FRAME", null, parent);
    }

    /**
     * 创建一个背景
     */
    public static createBackDrop(parent?: number) {
        return new Frame("BACKDROP", null, parent);
    }

    /**
     * 创建一个文本ui
     * (文本也有鼠标事件 会阻挡之前的父Frame的鼠标相关事件)
     */
    public static createTEXT(parent?: number) {
        return new Frame("TEXT", null, parent);
    }

    /**
     * 创建一个带阴影的 文本ui
     */
    public static createShadowTEXT(parent?: number) {
        return new Frame("TEXT", null, parent, "_sl_shadowtext");
    }

    /**
     * 创建一个文本ui
     */
    public static createTEXTWithBorderBackDrop(parent?: number) {
        //
        let bdFrame = new Frame("BACKDROP", null, parent, "_sl_border_backdrop", 0)
        let textFrame = Frame.createTEXT(parent)
        textFrame.backdropFrame = bdFrame
        bdFrame.setPoints(textFrame.current, 0.01, 0.01);
        return textFrame
    }

    /**
     * 创建一个带声音的文字按钮
     */
    public static createGLUETEXTBUTTON(parent?: number) {
        return new Frame("GLUETEXTBUTTON", null, parent);
    }

    /**
     * 创建一个按钮
     * (ScoreScreenTabButtonTemplate 模板自带高亮效果)
     */
    public static createBUTTON(parent?: number) {
        return new Frame("BUTTON", null, parent, "ScoreScreenTabButtonTemplate");
    }

    /**
     * 创建一个带声音按钮
     */
    public static createGLUEBUTTON(parent?: number) {
        return new Frame("GLUEBUTTON", null, parent, "ScoreScreenTabButtonTemplate");
    }

    /**
     * 创建一个文字按钮
     */
    public static createTEXTBUTTON(parent?: number) {
        return new Frame("TEXTBUTTON", null, parent);
    }

    /**
     * 创建一个文本域
     */
    public static createTEXTAREA(parent?: number) {
        return new Frame("TEXTAREA", null, parent);
    }


    /**
     * 新建模型UI
     */
    public static createSPRITE(parent?: number) {
        return new Frame("SPRITE", null, parent);
    }

}
