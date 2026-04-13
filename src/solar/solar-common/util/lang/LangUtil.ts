/**
 * 编程语言工具
 */
export default class LangUtil {


    static getIntId(id: string | number): number {
        if (id && typeof id == "string") {
            id = FourCC(id as string)
        }
        return id as number;
    }

    static getStringId(id: string | number): string {
        if (id && typeof id == "string") {
            return id
        }
        return id2string(id as number);
    }

    /**
     * 判断是否是数字
     * @param obj
     */
    static isNumber(obj: any) {
        if (typeof obj == "number") {
            return true;
        }
    }

    /**
     * 判断是否是字符串
     * @param obj
     */
    static isString(obj: any) {
        if (typeof obj == "string") {
            return true;
        }
    }

    /**
     * 判断是否是布尔
     * @param obj
     */
    static isBoolean(obj: any) {
        if (typeof obj == "boolean") {
            return true;
        }
    }


    /**
     * 判断是否是函数
     * @param obj
     */
    static isFunction(obj: any) {
        if (typeof obj == "function") {
            return true;
        }
    }

    /**
     * 判断是否是对象
     * @param obj
     */
    static isObject(obj: any) {
        if (typeof obj == "object") {
            return true;
        }
    }

    // static isTable(obj: any) {
    //     if (typeof obj == "table") {
    //         return true;
    //     }
    // }
    //
    // static isUserData(obj: any) {
    //     if (typeof obj == "userdata") {
    //         return true;
    //     }
    // }

    /**
     * 移除集合中的元素
     * @param set
     * @param ele
     */
    static removeSetElement(set: any, ele: any): boolean {
        for (let key in set) {
            if (set[key] == ele) {
                deleteKey(set, key)
                return true
            }
        }
        return false;
    }

    /**
     * 遍历集合中的元素
     * @param set
     * @param callback
     */
    static forEach(set: any, callback: (key: any, val: any) => void) {
        for (let key in set) {
            callback(key, set[key])
        }
    }

    /**
     * 排序遍历集合中的元素
     * @param set
     * @param callback
     */
    static forEachSort(set: any, callback: (key: any, val: any) => void) {
        let keys: string[] = []
        for (let key in set) {
            keys.push(key);
        }
        keys.sort();
        for (let key of keys) {
            callback(key, set[key])
        }

    }

    /**
     * 浮点数 四舍五入 转为字符串
     * @param num
     * @param fractionDigits
     */
    static toFixed(num: number, fractionDigits: number = 3): string {
        // @ts-ignore
        let stringTs: NoSelf = string
        return stringTs.format("%." + fractionDigits + "f", num);
    }
}