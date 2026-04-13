import ObjectPool from "@/tool/ObjectPool";

export default class GroupUtil {

    /**
     * 单位组 对象池
     */
    static groupObjectPool: ObjectPool<group> = new ObjectPool<group>(() => {
        if (isAsync) {
            log.errorWithTraceBack("不能在异步操作中创建handle!")
            return null;
        }
        return CreateGroup()
    }, g => {
        GroupClear(g);
    });


    /**
     * 单位组转单位数组
     * 转换完会移除单位组的所有单位
     * (这样可以重复高效率的遍历单位组)
     */
    static toArray(whichGroup: group): unit[] {
        let unitArray: unit[] = []
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(whichGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            unitArray.push(unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
        }
        return unitArray;
    }

    /**
     * 遍历完会清空单位组
     * @param whichGroup
     * @param callback
     */
    static for(whichGroup: group, callback: (unit: unit) => void) {
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(whichGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            callback(unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
        }
    }

    /**
     * 太阳for 保留原group 内的单位
     * @param whichGroup
     * @param callback
     */
    static forSL(whichGroup: group, callback: (unit: unit) => void) {
        let unitArray: unit[] = [];
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(whichGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            unitArray.push(unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
        }
        for (let i = 0; i < unitArray.length; i++) {
            GroupAddUnit(whichGroup, unitArray[i])
            callback(unitArray[i])
        }
    }


}