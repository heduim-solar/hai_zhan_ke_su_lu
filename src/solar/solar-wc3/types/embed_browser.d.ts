/** @noSelfInFile */

/**
 * 这里是内置浏览器的方法定义
 * 需要有内置浏览器 才能拥有这些的方法
 * 没有的话可以注释掉此文件
 */

/**
 * webEngine = require("javascript")
 */
declare let webEngine: any & {
    path?: string
    handle: number
    events: {
        trigger_handle: number;
    } & {
        on_debugf: (this: void, level: number, file_name: number, line: number, message: string) => void;
        [funName: string]: (this: void, ...args: any[]) => void
    },
    execute: (this: void, jsCode: string) => void,
};

/**
 * 与浏览器 请求通讯的数据
 */
type ReqData = {
    readonly id: number;
    readonly data?: any;
}

/**
 * jass.japi
 */
declare function InitHtml5Plugin(config: number): void;

/**
 * 获取加载进度0 - 1.2 (>1时即地图载入完毕)
 */
declare function GetLoadingProgress(): number;

declare function GetGlueUI(): number;

declare function FrameSetUrl(fid: number, url: string, flag: number): number;


/**
 * javascript
 */

