/**
 * 缓存类
 */
export default class Cache {
    dataBase: { [key: string]: any } = {}


    /**
     * 从缓存中获取值
     * @param key 缓存唯一标识
     * @param defaultValue 当缓存不存在的时候创建该值的方法
     */
    get<T>(key: string, defaultValue?: () => T): T {
        let val = this.dataBase[key]
        if (val == null && defaultValue != null) {//如果值不存在 并且有初始化值的函数
            val = defaultValue()
            this.dataBase[key] = val
        }
        return val
    }

    /**
     * 缓存中是否拥有此key的值
     * @param key 缓存唯一标识
     */
    has(key: string): boolean {
        let val = this.dataBase[key]
        if (val == null) {
            return false
        }
        return true
    }

    /**
     * 设置缓存值
     * @param key 缓存唯一标识
     * @param value
     */
    put(key: string, value: any): any {
        let old = this.dataBase[key];
        this.dataBase[key] = value
        return old;
    }

    /**
     * 移除缓存
     * @param key 缓存唯一标识
     */
    remove(key: string): void {
        this.dataBase[key] = null;
    }

    /**
     * 清空缓存
     */
    clear() {
        this.dataBase = {}
    }

}
