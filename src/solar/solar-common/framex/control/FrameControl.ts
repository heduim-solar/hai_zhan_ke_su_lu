import FrameNode from "@/FrameNode";
import {Frame} from "@/frame";
import SolarConfig from "@/SolarConfig";
import FramePoint from "@/FramePoint";

/**
 * 对UI的控制器
 * 可以方便的构建UI 和控制UI
 */
export default class FrameControl extends FrameNode {


    /** 内部半透明图片 以视觉支持禁用效果 */
    protected _sl_disableFrame: Frame;
    /** 默认的图片 ui */
    protected _sl_imageFrame: Frame;
    /** 默认背景图片 ui */
    protected _sl_backgroundImageFrame: Frame;
    /** 默认的文本 ui */
    protected _sl_textFrame: Frame;
    /** 默认的文本域 ui */
    protected _sl_textAreaFrame: Frame;
    /** 打钩图片 以视觉支持打上勾的效果 */
    protected _sl_tickFrame: Frame;
    /** 右下角文本的背景图片 */
    protected _sl_numberOverlayFrame: Frame;
    /** 右下角文本 类似物品使用次数 */
    protected _sl_numberOverlayTextFrame: Frame;

    /** 自动施法的转圈ui模型   */
    protected _sl_autocastFrame: Frame;
    /** 跑马灯光模型 (也可拿来做提示玩家点击的效果) */
    protected _sl_lampEffectFrame: Frame;
    /** 冷却ui模型 (可以做自定义的冷却效果) */
    protected _sl_cooldownFrame: Frame;
    /** 按钮 可以监听 点击 进入事件等 */
    protected _sl_buttonFrame: Frame;
    protected _sl_isInitialized = false;


    protected init() {
        if (this._sl_isInitialized) {
            log.errorWithTraceBack("不要多次调用init()!")
        }
        this._sl_isInitialized = true
    }

    /**
     * 获取该 根Frame （该ui会自动在合适的位置显示和隐藏 技能就是在技能按钮上 物品就是在物品按钮上）
     * 可以把自己的ui绑定位置到这个节点上 以自动在合适的时候合适的位置显示自己的ui
     * @param createDefault 如果没有初始化则默认创建一个
     */
    getRootFrame(createDefault: boolean = true): Frame {
        // if (createDefault && this._sl_RootFrame == null) {
        //     this._sl_RootFrame = new Frame("FRAME", null, null);
        //     this._sl_RootFrame.setSize(0.04, 0.04)
        //     if (this._sl_Frames == null) {
        //         this._sl_Frames = []
        //     }
        //     this._sl_Frames.push(this._sl_RootFrame)
        // }
        return this.rootFrame;
    }

    /** 添加一个文本UI到 RootFrame */
    addTextFrame(text?: string): Frame {
        let frame = new Frame("TEXT", null, this.getRootFrame().handle);
        frame.visible = true;
        frame.setAllPoints(this.getRootFrame().handle)
        if (text) {
            frame.setText(text)
        }
        this._sl_Frames.push(frame)
        return frame;
    }

    /** 添加一个文本域UI到 RootFrame */
    addTextAreaFrame(text?: string): Frame {
        let frame = new Frame("TEXTAREA", null, this.getRootFrame().handle);
        frame.visible = true;
        frame.setAllPoints(this.getRootFrame().handle)
        if (text) {
            frame.setText(text)
        }
        this._sl_Frames.push(frame)
        return frame;
    }

    /** 添加一个图片到RootFrame */
    addImageFrame(imagePath?: string): Frame {
        let frame = new Frame("BACKDROP", null, this.getRootFrame().handle);
        frame.visible = true;
        frame.setAllPoints(this.getRootFrame().handle)
        if (imagePath) {
            frame.setTexture(imagePath)
        }
        this._sl_Frames.push(frame)
        return frame;
    }

    /** 添加一个UI SPRITE模型到RootFrame */
    addModelFrame(modelPath?: string): Frame {
        let frame = new Frame("SPRITE", null, this.getRootFrame().handle);
        frame.visible = true;
        frame.setAllPoints(this.getRootFrame().handle)
        if (modelPath) {
            frame.setModel(modelPath)
        }
        this._sl_Frames.push(frame)
        return frame;
    }

    /** 获取禁用的图片蒙版 */
    getDisableFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_disableFrame == null) {
            this._sl_disableFrame = this.addImageFrame(SolarConfig.defaultDisablePath)
        }
        return this._sl_disableFrame;
    }

    /** 获取基础图片Frame */
    getImageFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_imageFrame == null) {
            this._sl_imageFrame = this.addImageFrame("")
        }
        return this._sl_imageFrame;
    }

    /** 获取基础背景图片Frame */
    getBackgroundImageFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_backgroundImageFrame == null) {
            this._sl_backgroundImageFrame = this.addImageFrame("")
        }
        return this._sl_backgroundImageFrame;
    }

    /** 获取基础文本 Frame */
    getTextFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_textFrame == null) {
            this._sl_textFrame = this.addTextFrame("")
        }
        return this._sl_textFrame;
    }

    /** 获取基础文本域 Frame */
    getTextAreaFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_textAreaFrame == null) {
            this._sl_textAreaFrame = this.addTextAreaFrame("")
        }
        return this._sl_textAreaFrame;
    }

    /** 获取打钩的图片 */
    getTickFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_tickFrame == null) {
            this._sl_tickFrame = this.addImageFrame(SolarConfig.defaultTickPath)
        }
        return this._sl_tickFrame;
    }


    /** 显示打钩 */
    showTickFrame(): void {
        this.getTickFrame(true).visible = true;
    }

    /** 隐藏打钩 */
    hideTickFrame(): void {
        if (this._sl_tickFrame) {
            this._sl_tickFrame.visible = false;
        }
    }


    /** 获取自动施法提示ui模型 */
    getAutoCastFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_autocastFrame == null) {
            this._sl_autocastFrame = this.addModelFrame(SolarConfig.defaultAutoCastModelPath);
        }
        return this._sl_autocastFrame;
    }

    /** 获取按钮 */
    getButtonFrame(createDefault: boolean = true, hasHighlight: boolean = true): Frame {
        if (createDefault && this._sl_buttonFrame == null) {
            let frame = new Frame("BUTTON", null, this.getRootFrame().handle, hasHighlight ? "ScoreScreenTabButtonTemplate" : "");

            frame.visible = true;
            frame.setAllPoints(this.getRootFrame().handle)
            this._sl_buttonFrame = frame;
            this._sl_Frames.push(frame)
        }
        return this._sl_buttonFrame;
    }

    /** 显示自动施法提示ui模型 */
    showAutoCastFrame(): void {
        this.getAutoCastFrame(true).visible = true;
    }

    /** 隐藏自动施法提示ui模型 */
    hideAutoCastFrame(): void {
        if (this._sl_autocastFrame) {
            this._sl_autocastFrame.visible = false;
        }
    }

    /** 获取跑马灯光ui模型 */
    getLampEffectFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_lampEffectFrame == null) {
            this._sl_lampEffectFrame = this.addModelFrame(SolarConfig.defaultLampEffectModelPath);
        }
        return this._sl_lampEffectFrame;
    }

    /** 显示跑马灯光ui模型 */
    showLampEffectFrame(): void {
        this.getLampEffectFrame(true).visible = true;
    }

    /** 隐藏跑马灯光ui模型 */
    hideLampEffectFrame(): void {
        if (this._sl_lampEffectFrame) {
            this._sl_lampEffectFrame.visible = false;
        }
    }

    /** 获取冷却状态ui模型 */
    getCooldownFrame(createDefault: boolean = true): Frame {
        if (createDefault && this._sl_cooldownFrame == null) {
            this._sl_cooldownFrame = this.addModelFrame();
            this._sl_cooldownFrame.setAllPoints(this.getRootFrame().handle)
        }
        return this._sl_cooldownFrame;
    }

    /** 获取右下角文本窗 */
    getNumberOverlayTextFrame(createDefault: boolean = true, point: FramePoint = FramePoint.bottomRight): Frame {
        if (createDefault && this._sl_numberOverlayTextFrame == null) {
            //UI\Widgets\Console\Human\CommandButton\human-button-lvls-overlay.blp
            this._sl_numberOverlayFrame = new Frame("BACKDROP", null, this.getRootFrame().handle);
            this._sl_numberOverlayFrame.setTexture("UI\\Widgets\\Console\\Human\\CommandButton\\human-button-lvls-overlay.blp")
            //
            this._sl_numberOverlayTextFrame = new Frame("TEXT", null, this.getRootFrame().handle);
            this._sl_numberOverlayTextFrame.setFont(0.009)
            if (point == FramePoint.bottomRight) {
                this._sl_numberOverlayTextFrame.setPoint(point, this.getRootFrame().handle, point, -0.005, 0.002)
            } else if (point == FramePoint.topRight) {
                this._sl_numberOverlayTextFrame.setPoint(point, this.getRootFrame().handle, point, -0.005, -0.002)
            } else if (point == FramePoint.topLeft) {
                this._sl_numberOverlayTextFrame.setPoint(point, this.getRootFrame().handle, point, 0.005, -0.002)
            } else if (point == FramePoint.bottomLeft) {
                this._sl_numberOverlayTextFrame.setPoint(point, this.getRootFrame().handle, point, 0.005, 0.002)
            } else if (point == FramePoint.center) {
                this._sl_numberOverlayTextFrame.setPoint(point, this.getRootFrame().handle, point, 0, 0)
            } else {
                this._sl_numberOverlayTextFrame.setPoint(point, this.getRootFrame().handle, point, 0, 0)
            }
            //
            this._sl_numberOverlayFrame.setPoints(this._sl_numberOverlayTextFrame.handle, 0.003, 0.002)
        }
        return this._sl_numberOverlayTextFrame;
    }


    /** 设置右下角文本 */
    setNumberOverlayText(text: string) {
        if (text == null || text.length == 0) {
            if (this._sl_numberOverlayFrame != null) {
                this._sl_numberOverlayFrame.visible = false
            }
            if (this._sl_numberOverlayTextFrame != null) {
                this._sl_numberOverlayTextFrame.visible = false
            }
            return
        }
        this.getNumberOverlayTextFrame().setText(text)
        this._sl_numberOverlayFrame.visible = true
        this._sl_numberOverlayTextFrame.visible = true
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