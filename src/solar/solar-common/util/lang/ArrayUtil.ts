export default class ArrayUtil {


    /**
     * 根据字段筛选
     * @param dataArray
     * @param keyAndSelectVal
     */
    static selectByWhere(dataArray: any[], ...keyAndSelectVal: string[]): any[] {
        if (dataArray == null || dataArray.length == 0) {
            return dataArray
        }
        if (keyAndSelectVal == null || keyAndSelectVal.length == 0) {
            return dataArray;
        }
        if (keyAndSelectVal.length % 2 != 0) {
            log.errorWithTraceBack("查询参数和值必须成对传入!")
            return dataArray;
        }
        let result = []
        for (let data of dataArray) {
            if (data == null) {
                continue
            }
            //
            let isOk = true;
            //校验是否相等
            for (let i = 0; i < keyAndSelectVal.length - 1; i = i + 2) {
                if (data[keyAndSelectVal[i]] != keyAndSelectVal[i + 1]) {
                    isOk = false;
                    break
                }
            }
            if (isOk) {
                result.push(data);
            }
        }
        return result;
    };


    /**
     * 获取对象数组里的单独属性组装到数组
     * @param array
     * @param key
     */
    static getPropertyVals<T>(array: T[], key: keyof T): any[] {
        let result = []
        for (let arrayElement of array) {
            result.push(arrayElement[key])
        }
        return result
    }


    /**
     * 随机一个元素
     */
    static randomElement<T>(array: T[]): T {
        if (array == null || array.length == 0) {
            return null;
        }
        return array[GetRandomInt(0, array.length - 1)]
    }


    /**
     * @brief 把数组中的元素按随机顺序重新排列
     * @param array 需要排序的数组
     * @returns 随机排序后的数组
     */
    static shuffle<T>(array: T[]): T[] {
        for (let i = array.length - 1; i >= 0; i--) {
            let randomIndex = Math.floor(Math.random() * (i + 1));
            let itemAtIndex = array[randomIndex];
            array[randomIndex] = array[i];
            array[i] = itemAtIndex;
        }
        return array;
    }


    /**
     * 从数组移除指定元素。（移除第一个指定对象）
     * @param array
     * @param deleteElement
     */
    static removeElement(array: any[], deleteElement: any): boolean {
        if (array == null || deleteElement == null) {
            return false;
        }
        let indexOf = array.indexOf(deleteElement);
        if (indexOf >= 0) {
            array.splice(indexOf, 1);
            return true;
        }
        return false;
    }

    /**
     * 清空数组
     * @param array
     */
    static clear(array: any) {
        if (array == null) {
            return
        }
        for (const key in array) {
            deleteKey(array, key)
        }
    }
}