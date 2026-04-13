declare interface ObjProxyType {
    vals: any
    getHandlers: ((obj: any, key: any) => any | undefined)[]
    setHandlers: ((obj: any, key: any, val: any) => any | undefined)[]
}

/**
 *  拦截对象的 属性值 访问和设置
 */
export default class ProxyUtil {

    private static objProxys: Map<any, ObjProxyType> = new Map()

    /**
     * 添加一个访问处理器
     * @param obj
     * @param handler
     */
    static addGetHandler(obj: any, handler: ((obj: any, key: any) => any | undefined)) {
        if (targetLanguage != "lua") {
            print("暂未实现")
            return
        }
        ProxyUtil.getObjProxy(obj).getHandlers.push(handler)

    }

    /**
     * 添加一个赋值处理器
     * @param obj
     * @param handler
     */

    static addSetHandler(obj: any, handler: ((obj: any, key: any, val: any) => any | undefined)) {
        if (targetLanguage != "lua") {
            print("暂未实现")
            return
        }
        ProxyUtil.getObjProxy(obj).setHandlers.push(handler)
    }

    /**
     * 添加一个对象的属性值改变的 监听器
     * @param obj
     * @param handler
     */

    static addValueChangeListener(obj: any, key: string, handler: ((oldVal: any, newVal: any) => any | undefined)) {
        if (targetLanguage != "lua") {
            print("暂未实现")
            return
        }
        let lastVal = obj[key];
        ProxyUtil.getObjProxy(obj).setHandlers.push((obj: any, key2: any, val: any) => {
            if (key != key2) {
                return
            }
            if (val != lastVal) {
                handler(lastVal, val)
            }
            lastVal = val;
        });
    }


    private static getObjProxy(obj: any) {
        let objProxy: ObjProxyType = ProxyUtil.objProxys.get(obj);
        if (objProxy != null) {
            return objProxy;
        }
        objProxy = {
            //将监控对象的数据复制到代理对象
            vals: {...obj},
            getHandlers: [],
            setHandlers: [],
        };
        //清空监控对象的数据
        for (let objKey in obj) {
            delete obj[objKey]
        }
        setmetatable(obj, {
            __index: function (this: void, _, k) {
                let result = null;
                for (let handler of objProxy.getHandlers) {
                    result = handler(_, k);
                }
                if (result != null) {
                    return result;
                }
                return objProxy.vals[k];
            } as any,
            __newindex: function (this: void, _, k, v) {
                let result = null;
                for (let handler of objProxy.setHandlers) {
                    result = handler(_, k, v);
                }
                if (result == null) {
                    result = v;
                }
                objProxy.vals[k] = result;
            } as any,
            __pairs: function (this: void) {
                return function (this: void, _, k) {
                    return next(objProxy.vals, k)
                };
            } as any,

            __len: function (this: void) {
                if (objProxy.vals[1] == null) {
                    return 0;
                }
                for (let i = 2; i < 1000000; i++) {
                    if (objProxy.vals[i] == null) {
                        return i;
                    }
                }
            } as any,

        })
        ProxyUtil.objProxys.set(obj, objProxy)
        return objProxy;
    }
}