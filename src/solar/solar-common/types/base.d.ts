/** @noSelfInFile */
declare interface handle {
    __handle: never;
}

/**太阳TS框架版本号*/
declare let _sl_version: number;

declare let gameName: string;

declare let isDebug: boolean;

/**
 * 编译到的目标语言
 */
declare let targetLanguage: "js" | "lua";

declare let globals: any;

declare let isEmbedJapi: boolean

declare let isEmbedBrowser: boolean

declare let is_11Platform: boolean
/**
 * 当前游戏时间 （毫秒单位）
 * @deprecated 请使用_g_time 以减少命名冲突
 */
declare let time: number;
/**
 * 当前游戏时间 （毫秒单位）
 */
declare let _g_time: number;
/**
 * handle最低重用时间 （主要为单位死亡后超过这个时间后 不能再对单位进行任何操作。因为此handle可能已是其他单位）
 * (物品最好不要死亡 直接RemoveItem 以免还要考虑物品的handle重用问题)
 */
declare let handleReuseMinTime: number;
/**
 * 是否异步
 */
declare let isAsync: boolean
/**
 * 是否在UI回调事件里
 */
declare let isInFrameEvent: boolean

//lua package
declare const PACKAGE: any & {
    path: string,
    loaded: any
};
/**
 * env_vars
 * 环境变量
 */
/**
 * 本地开发的地图dir格式路径
 */
declare let local_map_dir_path: string
/**
 * 临时点
 */
declare let tempLocation: location
/**
 * 临时单位组
 * tip:不要在遍历临时单位组的回调中 再使用临时单位组
 */
declare let tempGroup: group
declare let _tempGroup: group
/**太阳框架内部使用的单位组*/
declare let _sl_tempGroup1: group
declare let _sl_tempGroup2: group
declare let _sl_tempGroup3: group
/**
 * 临时变量
 */
declare let tempBoolean: boolean
declare let tempNumber: number
declare let tempString: string


declare type Vector = {
    x: number,
    y: number,
    z?: number,
}

declare type Num_1_12 = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12;

/**
 * addons
 */
declare function print_r(val: any): any;

// @ts-ignore
declare function require(name: string): any;

/**
 * FourCC
 * FourCC全称Four-Character Codes，代表四字符代码 (four character code), 它是一个32位的标示符
 * 此方法可将4字符的字符串转换为整数
 * (可通过id2string将整数转换为4个字符的字符串)
 */
declare function FourCC(str: string): number;

/**
 * 可将整数转换为4个字符的字符串
 * @param id
 */
declare function id2string(id: number): string;

/**
 * 删除一个对象的key
 * @param obj
 * @param key
 */
declare function deleteKey(obj: any, key: number | string | any): void;

/**
 * 判断handle 不为空 并且是一个有效的handle
 */
declare function IsHandle(handle: handle): boolean;

/**
 * 异步执行函数
 */
declare function asyncExec(asyncPlayer: player, fun: () => void): void

/** @noSelf **/
declare class NoSelf {
    [key: string]: (this: void, ...args: any[]) => any;
}

/**
 * ydlua
 */
declare type HandledefInfo = {
    reference: number
    type?: string //若handle被移除后 则没有类型信息
}

declare function functiondef(fun: any): any;

declare function globaldef(val: any): any;

/**
 * 注意:可能每个玩家返回的数据不一样。请不要当做同步数据使用
 * @param h
 */
declare function handledef(h: handle): HandledefInfo;

declare function handlemax(): number;

declare function handlecount(): number;

declare function h2i(h: handle): number;

declare function i2h(ih: number): handle;

/**
 * 给handle 增加一个引用计数
 * 可以防止 底层给此handle重新分配新的对象(如单位、物品)
 * (PS:引用计数即使大于0 魔兽也会在一定机制下清理该handle指向的对象【如单位死亡后腐化结束】 清理后无法获取此handle对应的单位名字等由底层管理的单位数据)
 * @param h
 */
declare function handle_ref(h: handle): any;

/**
 * 给handle 减少一个引用计数
 * (PS:漂浮文字不是平常的handle 无法加锁解锁)
 * @param h
 */
declare function handle_unref(h: handle): any;

/**
 * 将handle 引用计数设置到0 以便让底层可以重用此handle
 * 通常不建议使用此项  以免把不需要解锁的也解了 (推荐使用成对出现的handle_ref/handle_unref)
 * @deprecated
 * @param h
 */
declare function handle_clearref(h: handle): void;

/**
 * @deprecated 没什么用 空函数
 * @param val
 * @param hash
 */
declare function gchash(val: any, hash: number): any;


/** solar_es */
declare function setInterval(handler: (count: number) => boolean, timeout?: number, ...arguments: any[]): number;

declare function setTimeout(handler: (this: void) => void, timeout?: number, ...arguments: any[]): number;


declare namespace log {
    function trace(...args: any[]): void

    function debug(...args: any[]): void

    function info(...args: any[]): void

    function warn(...args: any[]): void

    function error(...args: any[]): void

    function errorWithTraceBack(...args: any[]): void;
}