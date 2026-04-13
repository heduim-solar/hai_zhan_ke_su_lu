/**
 * 单例模式
 * 相关的工具
 */
import Cache from "@/Cache";

export default class SingletonUtil {
    static cache = new Cache();
    static _sl_cache = {};

    /**
     * 是否第一次
     * 相同 key 只有第一次调用会返回true 后续调用都会返回false
     * @param key
     * @param printTraceBack 打印函数堆栈信息
     * @param tips 提示信息
     */
    static isFirstTime(key: string | any, printTraceBack: boolean = true, tips?: string) {
        if (SingletonUtil._sl_cache[key] == true) {
            if (printTraceBack) {
                log.errorWithTraceBack("唯一限制:" + key)
            }
            if (tips) {
                print(tips)
            }
            return false
        }
        SingletonUtil._sl_cache[key] = true;
        return true;
    }

    /**
     * 如果不是第一次使用此参数
     * @param key
     * @param printTraceBack
     * @param tips
     */
    static notFirstTime(key: string | any, printTraceBack: boolean = true, tips?: string) {
        return !SingletonUtil.isFirstTime(key, printTraceBack, tips)
    }


    /**
     * 获取实例单例
     * @param clazz 类
     */
    static getInstance(clazz): any {
        return SingletonUtil.cache.get("getInstance:" + tostring(clazz), () => {
            return new clazz;
        });
    }


    /**
     * 只执行一次
     * @param key
     * @param runable
     */
    static executeOnce(key: string | any, runable: () => void): void {
        if (SingletonUtil._sl_cache[key] == true) {
            return
        }
        SingletonUtil._sl_cache[key] = true;
        runable()
    }


}