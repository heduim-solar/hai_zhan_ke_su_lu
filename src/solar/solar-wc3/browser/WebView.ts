/** @noSelfInFile */
import BaseUtil from "@/BaseUtil";
import Flag from "./Flag";


const storm: NoSelf = require('jass.storm');

function converScreenPosition(x, y) {
    x = x / 1920 * 0.8;
    y = (1080 - y) / 1080 * 0.6;
    return [x, y];
}

function converScreenSize(width, height) {
    width = width / 1920 * 0.8;
    height = height / 1080 * 0.6;
    return [width, height];
}


InitHtml5Plugin(Flag.ENGINE_DISABLE_GPU)
// InitHtml5Plugin(Flag.ENGINE_DISABLE_GPU | Flag.ENGINE_SINGLE_PROCESS)
export default class WebView {
    /**
     * static
     */
    static _index = 0;
    static viewMap: any = {};

    /**
     * obj
     */
    _id: number;
    x: number;
    y: number;
    w: number;
    h: number;
    normal_image: string;
    level: number;
    is_show: boolean;
    _name: string;
    parent_id: number;
    toTopTempFrame: number = 0


    constructor(x = 0, y = 0, w = 1920, h = 1080) {
        this._name = "_VIEW_" + WebView._index;
        this.parent_id = GetGlueUI()
        WebView._index = WebView._index + 1;
        this._id = CreateFrameByTagName("BACKDROP", this._name, this.parent_id, "", 0);

        this.setSize(w, h);
        this.setPosition(x, y);
        // storm.save("ui\\" + WebView._index + ".blp", storm.load("UI\\Widgets\\EscMenu\\Human\\blank-background.blp"));
        // this.setNormalImage("ui\\" + WebView._index + ".blp");
        this.setNormalImage();
        BaseUtil.runLater(0.01, () => {
            if (this._id && this.parent_id != GetGameUI()) {
                FrameSetParent(this._id, GetGameUI());
            }
        });
        WebView.viewMap[this._id] = this;
        webView = this;
    }

    destroy() {
        if (this._id == undefined) {
            return;
        }
        WebView.viewMap[this._id] = undefined;
        DestroyFrame(this._id);
        this._id = undefined;
    }

    /**
     * 将浏览器UI设置当前所有UI的最前方
     */
    toTop(destroyOldFrame = false) {
        let newToTopTempFrame = CreateFrameByTagName("BACKDROP", this._name + this.toTopTempFrame, GetGameUI(), "", 0);
        FrameSetParent(this._id, newToTopTempFrame);
        if (this.toTopTempFrame != 0 && destroyOldFrame) {
            DestroyFrame(this.toTopTempFrame)
        }
        this.toTopTempFrame = newToTopTempFrame;
    }

    show() {
        if (this.is_show) {
            return;
        }
        this.is_show = true;
        FrameShow(this._id, true);
    }

    hide() {
        if (this.is_show == false) {
            return;
        }
        this.is_show = false;
        FrameShow(this._id, false);
    }

    setAlpha(value) {
        if (value <= 1) {
            value = value * 0xff;
        }
        FrameSetAlpha(this._id, value);
    }

    getAlpha() {
        return FrameGetAlpha(this._id);
    }

    getPosition() {
        return [this.x, this.y];
    }

    setPosition(x, y) {
        if (this._id == undefined || this._id == 0) {
            return;
        }
        this.x = x;
        this.y = y;
        [x, y] = converScreenPosition(x, y);
        FrameSetAbsolutePoint(this._id, 0, x, y);

    }

    getWidth() {
        return FrameGetWidth(this._id) / 0.8 * 1920;
    }

    getHeight() {
        return FrameGetHeight(this._id) / 0.6 * 1080;
    }

    setWidth(width) {
        this.w = width;
        FrameSetWidth(this._id, width / 1920 * 0.8);
    }

    setHeight(height) {
        this.h = height;
        FrameSetHeight(this._id, height / 1080 * 0.6);
    }

    setSize(width, height) {
        if (this._id == undefined || this._id == 0) {
            return;
        }
        this.w = width;
        this.h = height;
        [width, height] = converScreenSize(width, height);
        FrameSetSize(this._id, width, height);
    }

    setLevel(level) {
        this.level = level;
        FrameSetLevel(this._id, level);
    }

    setNormalImage(image_path?: string, flag?: number) {
        if (this._id == undefined || this._id == 0) {
            return;
        }
        this.normal_image = image_path;
        if (image_path == '') {
            // image_path = 'core\\Transparent.tga';
            image_path = "UI\\Widgets\\EscMenu\\Human\\blank-background.blp";
        }
        FrameSetTexture(this._id, image_path, flag || 0);
    }

    /**
     * about:blank
     * @param url
     * @param view_config 只有第一次有效。相当于是初始化webview的参数
     */
    loadUrl(url, view_config?: number) {
        if (url == null) {
            log.errorWithTraceBack("你传的url为空！")
            return
        }
        FrameSetUrl(this._id, url, view_config || 0);
    }

    loadHtmlFile(filePath: string, view_config?: number) {
        this.loadUrl("http://localhost/" + filePath, view_config);
    }

    setFocus(bool?: boolean) {
        webEngine.handle = this._id;
    }

    showDevtool(delay: number = 0) {
        if (delay > 0) {
            BaseUtil.runLater(delay, () => {
                webEngine.handle = this._id;
                webEngine.debugger = true;
            })
        } else {
            webEngine.handle = this._id;
            webEngine.debugger = true;
        }

    }


}

declare global {
    let webView: WebView;
}