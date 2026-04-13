/**
 * 对象池
 */
export default class ObjectPool<T> {
    //对象
    objects: T[] = [];
    //对象是否空闲
    objectIdleStatus: boolean[] = [];
    private _before_lastBorrowObjectIndex: number = -1;
    lastBorrowObjectIndex: number = -1;
    private create: () => T = null;
    private returnCallBack: (obj: T) => boolean | void = null;
    private maxTotal: number = 1000000;
    private minIdle: number = 1;


    /**
     *
     * @param create = 创建对象的
     * @param returnCallBack
     */
    constructor(create: () => T, returnCallBack: (obj: T) => boolean | void = null) {
        this.create = create;
        this.returnCallBack = returnCallBack;
    }

    /**
     * 提前准备池 使池至少拥有createCount个空闲对象
     */
    public preparePool(idleCount: number = this.minIdle): void {
        let tempIdleCount = 0;
        for (let i = 0; i < this.maxTotal; i++) {
            if (tempIdleCount >= idleCount) {
                return
            }
            if (this.objectIdleStatus[i] == true) {
                tempIdleCount++;
            } else if (this.objects[i] == null) {
                this.objects[i] = this.create();
                this.objectIdleStatus[i] = true;
                tempIdleCount++;
            }

        }
    }

    /**
     * 获取一个对象
     * @param obj
     */
    public borrowObject(): T {
        for (let i = 0; i < this.maxTotal; i++) {
            if (this.objectIdleStatus[i] == true) {
                this.lastBorrowObjectIndex = i;
                this.objectIdleStatus[i] = false;
                return this.objects[i];
            } else if (this.objects[i] == null) {
                this.objects[i] = this.create();
                this.lastBorrowObjectIndex = i;
                this.objectIdleStatus[i] = false;
                return this.objects[i];
            }

        }
        //超过最大数量
        return null;
    }


    /**
     * 返还一个对象
     * @param obj
     */
    public returnObject(obj: T): boolean {
        let isIdle = true;
        if (this.returnCallBack) {
            let flag = this.returnCallBack(obj);
            if (flag != null) {
                isIdle = flag as boolean;
            }
        }
        for (let i = 0; i < this.maxTotal; i++) {
            if (obj == this.objects[i]) {
                this.objectIdleStatus[i] = isIdle;
                return true
            }
        }
        return false;
    }

    /**
     * 设置对象池所有对象的空闲状态
     */
    setAllIdleStatus(isIdle: boolean = true): void {
        this._before_lastBorrowObjectIndex = this.lastBorrowObjectIndex;
        if (isIdle) {
            this.lastBorrowObjectIndex = -1;
        } else {
            this.lastBorrowObjectIndex = this.objects.length - 1;
        }
        for (let i = 0; i < this.objects.length; i++) {
            this.objectIdleStatus[i] = isIdle;
        }
    }

    /**
     * 遍历所有对象
     * @param callBack 返回值将 设置对象 是否空闲
     */
    forObjects(callBack: (obj: T) => boolean | void): void {
        for (let i = 0; i < this.objects.length; i++) {
            let isIdle = callBack(this.objects[i]);
            if (isIdle != null) {
                this.objectIdleStatus[i] = isIdle as boolean;
            }
        }
    }

    /**
     * 遍历所有空闲对象
     * @param callBack 返回值将 设置对象 是否空闲
     */
    forIdleObjects(callBack: (obj: T) => boolean | void): void {
        for (let i = 0; i < this.objectIdleStatus.length; i++) {
            if (this.objectIdleStatus[i] == true) {
                let isIdle = callBack(this.objects[i]);
                if (isIdle != null) {
                    this.objectIdleStatus[i] = isIdle as boolean;
                }
            }
        }
    }

    /**
     * 遍历所有活跃(非空闲)对象
     * @param callBack 返回值将 设置对象 是否空闲
     */
    forActiveObjects(callBack: (obj: T) => boolean | void): void {
        for (let i = 0; i < this.objects.length; i++) {
            if (this.objectIdleStatus[i] == false) {
                let isIdle = callBack(this.objects[i]);
                if (isIdle != null) {
                    this.objectIdleStatus[i] = isIdle as boolean;
                }
            }
        }
    }

    /**
     * 遍历所有脏对象
     * （参考test/模拟血条处清理未使用的血条）
     */
    forDirtyObjects(callBack: (obj: T) => void): number {
        let clearNum = 0;
        //如果本次获取的对象索引 大于上次获取的对象索引 则没有脏对象
        if (this.lastBorrowObjectIndex >= this._before_lastBorrowObjectIndex) {
            return clearNum
        }
        // let start = Math.min(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        // let End = Math.max(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        // let start = Math.min(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        // let End = Math.max(this._before_lastBorrowObjectIndex, this.lastBorrowObjectIndex)
        //若本次 获取的对象索引 小于 上次获取的对象索引  则有脏对象
        for (let i = this.lastBorrowObjectIndex + 1; i <= this._before_lastBorrowObjectIndex; i++) {
            callBack(this.objects[i])
            clearNum++;
        }
        return clearNum;
    }

    /**
     * 获取活跃的对象数量
     */
    getNumActive(): number {
        let num = 0;
        for (let i = 0; i < this.objectIdleStatus.length; i++) {
            if (this.objectIdleStatus[i] == false) {
                num++;
            }
        }
        return num;
    }

    /**
     * 获取空闲的对象数量
     */
    getNumIdle(): number {
        let num = 0;
        for (let i = 0; i < this.objectIdleStatus.length; i++) {
            if (this.objectIdleStatus[i] == true) {
                num++;
            }
        }
        return num;
    }


}
