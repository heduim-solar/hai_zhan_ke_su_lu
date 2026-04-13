import GameCenter from "@/GameCenter";
import UnitDeathTimeUtil from "@/UnitDeathTimeUtil";
import BaseUtil from "@/BaseUtil";

/**
 * 数据库
 * 任意数据都可以放到数据库来管理
 */
export default class DataBase {
    private static idStrHandleMap: { [hIdStr: string]: handle } = {}
    private static dataBaseContext: { [type: string]: { [id: string]: AppData } } = {}
    private static _sl_solarDataIdIndex = 0;
    /**
     * 默认不存在solarData时 创建 solarData
     */
    static DefaultCreateSolarData = true;

    /**
     * base
     * @param type
     * @param handle
     * @param createDefault
     */
    public static getDataByHandle(type: string, handle: handle, createDefault = DataBase.DefaultCreateSolarData): AppData {
        if (!IsHandle(handle)) {
            if (createDefault) {
                log.errorWithTraceBack("DataBase.getData():" + type + ":你传的handle为空或0！不能为空hanlde创建SolarData")
            }
            return null;
        }
        return DataBase.getDataByTypeId(type, tostring(GetHandleId(handle)), createDefault);
    }


    /**
     * 获取一个类型的所有数据
     * @param type
     */
    public static getTypeData(type: string): { [id: string]: AppData } {
        return DataBase.dataBaseContext[type]
    }

    /**
     * 遍历一个类型的所有数据
     * @param type
     * @param callBack
     */
    public static forTypeDatas(type: string, callBack: (id: string, solarData: AppData) => void) {
        let typeData = DataBase.dataBaseContext[type];
        if (typeData) {
            for (let id in typeData) {
                callBack(id, typeData[id])
            }
        }
    }

    /**
     * 基础的获取数据的方式
     * @param type 类型
     * @param id 数据id
     * @param createDefault 如之前未设置data 则可以返回一个默认的空对象 以供使用
     */
    public static getDataByTypeId(type: string, id: string, createDefault = DataBase.DefaultCreateSolarData): AppData {
        let typeData = DataBase.dataBaseContext[type]
        if (typeData == null && createDefault) {
            typeData = {};
            DataBase.dataBaseContext[type] = typeData;
        }
        if (typeData == null) {
            return null;
        }
        let data = typeData[id]
        if (!data && createDefault) {
            data = {}
            typeData[id] = data
            if (isDebug) {
                DataBase._sl_solarDataIdIndex++;
                (data as SolarDataDebugInfo)._SL_id = (type + ":" + DataBase._sl_solarDataIdIndex);
            }
        }
        return data;
    }

    public static setDataByHandle(type: string, handle: handle, obj: any): void {
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("DataBase.setData():" + type + ":你传的handle为空或0！")
            log.error(tb)
            return null;
        }
        return DataBase.setDataByTypeId(type, tostring(GetHandleId(handle)), obj);
    }

    /**
     * 基础的设置数据的方式
     * @param type
     * @param id
     * @param obj
     */
    public static setDataByTypeId(type: string, id: string, obj: any): void {
        let typeData = DataBase.dataBaseContext[type]
        if (typeData == null && obj != null) {
            typeData = {};
            DataBase.dataBaseContext[type] = typeData;
        }
        if (obj == null && typeData?.[id] == null) {
            //如果有才清空 没有就不要设置一个key为null了
            return
        }
        typeData[id] = obj
    }

    public static clearDataByHandle(type: string, handle: handle): any {
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("DataBase.clearData():" + type + ":你传的handle为空或0！")
            log.error(tb)
            return null;
        }
        DataBase.setDataByTypeId(type, tostring(GetHandleId(handle)), null)
    }

    /**
     * addons Obj Type
     */
    public static getUnitTypeSolarData(id: string, createDefault = DataBase.DefaultCreateSolarData): AppUnitTypeData {
        return DataBase.getDataByTypeId("_SL_UnitType", id, createDefault);
    }

    public static setUnitTypeSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_UnitType", id, obj);
    }

    public static forUnitTypeSolarDatas(callback: (id: string, solarData: AppUnitTypeData) => void) {
        DataBase.forTypeDatas("_SL_UnitType", callback);
    }

    public static getItemTypeSolarData(id: string, createDefault = DataBase.DefaultCreateSolarData): AppItemTypeData {
        return DataBase.getDataByTypeId("_SL_ItemType", id, createDefault);
    }

    public static setItemTypeSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_ItemType", id, obj);
    }

    public static forItemTypeSolarDatas(callback: (id: string, solarData: AppItemTypeData) => void) {
        DataBase.forTypeDatas("_SL_ItemType", callback);
    }

    public static getAbilityTypeSolarData(id: string, createDefault = DataBase.DefaultCreateSolarData): AppAbilityTypeData {
        return DataBase.getDataByTypeId("_SL_AbilityType", id, createDefault);
    }

    public static setAbilityTypeSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_AbilityType", id, obj);
    }

    public static forAbilityTypeSolarDatas(callback: (id: string, solarData: AppAbilityTypeData) => void) {
        DataBase.forTypeDatas("_SL_AbilityType", callback);
    }

    /**
     * Solar Buff Type
     * 存储太阳增益效果类型
     */
    public static getSolarBuffType(sBuffTypeId: string): AppBuffType {
        return DataBase.getDataByTypeId("_SL_SolarBuffType", sBuffTypeId, false) as AppBuffType;
    }

    public static setSolarBuffType(sBuffTypeId: string, appBuffType: AppBuffType) {
        DataBase.setDataByTypeId("_SL_SolarBuffType", sBuffTypeId, appBuffType);
    }


    /**
     * 获取太阳buff的自定义值
     * @param id
     * @param createDefault
     */
    public static getSolarBuffSolarData(id: string, createDefault = DataBase.DefaultCreateSolarData): AppSolarBuffData {
        return DataBase.getDataByTypeId("_SL_SolarBuff", id, createDefault);
    }

    public static setSolarBuffSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_SolarBuff", id, obj);
    }

    public static forSolarBuffSolarData(callBack: (id: string, solarData: AppSolarBuffData) => void) {
        DataBase.forTypeDatas("_SL_SolarBuff", callBack);
    }

    /**
     * Solar Actor Type
     * 存储太阳 演员 类型
     */
    public static getSolarActorType(sActorTypeId: string): AppActorType {
        return DataBase.getDataByTypeId("_SL_SolarActorType", sActorTypeId, false) as AppActorType;
    }

    public static setSolarActorType(sActorTypeId: string, appActorType: AppActorType) {
        DataBase.setDataByTypeId("_SL_SolarActorType", sActorTypeId, appActorType);
    }


    /**
     * 获取太阳actor的自定义值
     * @param id
     * @param createDefault
     */
    public static getSolarActorSolarData(id: string, createDefault = DataBase.DefaultCreateSolarData): AppSolarActorData {
        return DataBase.getDataByTypeId("_SL_SolarActor", id, createDefault);
    }

    public static setSolarActorSolarData(id: string, obj: any) {
        DataBase.setDataByTypeId("_SL_SolarActor", id, obj);
    }

    public static forSolarActorSolarData(callBack: (id: string, solarData: AppSolarActorData) => void) {
        DataBase.forTypeDatas("_SL_SolarActor", callBack);
    }

    /**
     * addons Handle
     * ps: 支持异步创建solarData 放心使用
     */
    public static getUnitSolarData(handle: unit, createDefault = DataBase.DefaultCreateSolarData): AppUnitData {
        if (!IsHandle(handle)) {
            log.errorWithTraceBack("你正在获取一个空单位handle的solarData!")
            return null;
        }
        if (isDebug && createDefault) {
            let info = handledef(handle);
            if (info && info.type != null && info.type != "+w3u") {//判断一下是否被底层回收
                print("handle= " + GetHandleId(handle));
                print_r(handledef(handle));
                log.errorWithTraceBack(time + "正在从一个不是单位的handle中 获取单位solarData。可能此handle已被底层销毁 或被其他类型的handle重用！")
            }
            //
            if (!UnitAlive(handle) && DataBase.getDataByHandle("+w3u", handle, false) == null) {
                //延迟0.01秒 以兼容在死亡事件里新建solarData 可能还未正取设置死亡时间 延迟可以获得正确的死亡时间(以免获取到继承的旧单位时间)
                let tb = debug.traceback();
                BaseUtil.runLater(0.01, () => {
                    if (!UnitDeathTimeUtil.hasDeathTime(handle)) {
                        print("time=" + time)
                        log.errorWithTraceBack(time + "警告：正在给没有死亡时间的死亡单位新建SolarData: " + tostring(GetUnitName(handle)) +
                            "这可能是死亡单位已被RemoveUnit移除超过handle重用时间，请不要获取已被移除很久的单位的solarData数据。handle重用保护时间=" + handleReuseMinTime)
                    } else if (UnitDeathTimeUtil.isTimeOfDeathExceeded(handle, handleReuseMinTime)) {
                        //不是英雄单位 或已被底层回收的英雄单位 需要判断是否在handle重用时间之内
                        print("deathTime=" + UnitDeathTimeUtil.getDeathTime(handle))
                        print("time=" + time)
                        print("baseTraceback=" + tostring(tb))
                        log.errorWithTraceBack(time + "警告：正在给超过handle重用保护时间的死亡单位新建SolarData: " + tostring(GetUnitName(handle)) +
                            ":这可能导致单位不会被正常清理solarData并造成solarData重用。handle重用保护时间=" + handleReuseMinTime)
                    }
                })

            }
        }
        let solarData = DataBase.getDataByHandle("+w3u", handle, createDefault)
        if (isDebug && solarData) {//debug数据 附加
            if (!solarData._SL_name) {
                solarData._SL_name = GetUnitName(handle);
            }
            if (createDefault) {
                solarData._SL_createDefaultGetTime = time;
            }
        }
        return solarData;
    }

    public static clearUnitSolarData(handle: unit) {
        let solarData = DataBase.getUnitSolarData(handle, false);
        if (solarData) {
            if (solarData._SL_solarBuffSet) {
                for (let buffTypeId in solarData._SL_solarBuffSet) {
                    solarData._SL_solarBuffSet[buffTypeId]?.destroy();
                }
            }
            DataBase.clearDataByHandle("+w3u", handle)
        }
    }

    /**
     * 遍历所有单位的 solarData
     * @param handle
     * @param callBack
     */
    public static forUnitSolarDatas(callBack: (unit: unit, solarData: AppUnitData) => void) {
        let typeData = DataBase.dataBaseContext["+w3u"];
        if (!typeData) {
            return
        }
        //这里虽然可以使用typeData反推单位handle出来 但是对数据同步性要求太高 导致易用性极低，所以还是使用带缓存的全图单位靠谱，稳定大于一切
        let allUnits = GameCenter.getAllUnits();
        for (let unitHandle of allUnits) {
            let solarData = typeData[tostring(unitHandle)];
            if (solarData) {
                callBack(unitHandle, solarData)
            }
        }
    }

    public static getItemSolarData(handle: item, createDefault = DataBase.DefaultCreateSolarData): AppItemData {
        return DataBase.getDataByHandle("item", handle, createDefault)
    }

    public static clearItemSolarData(handle: item) {
        DataBase.clearDataByHandle("item", handle)
    }

    public static getDialogButtonSolarData(handle: button): AppData {
        return DataBase.getDataByHandle("+dlb", handle)
    }

    public static clearDialogButtonSolarData(handle: button) {
        DataBase.clearDataByHandle("+dlb", handle)
    }

    public static getPlayerSolarData(handle: player, createDefault = DataBase.DefaultCreateSolarData): AppPlayerData {
        return DataBase.getDataByHandle("+ply", handle, createDefault)
    }

    public static clearPlayerSolarData(handle: player) {
        DataBase.clearDataByHandle("+ply", handle)
    }


    /**获取单位的 solar data */
    public static sd(handle: unit, createDefault?: boolean): AppUnitData;
    /**获取物品的 solar data */
    public static sd(handle: item, createDefault?: boolean): AppItemData;
    /**获取玩家的 solar data */
    public static sd(handle: player, createDefault?: boolean): AppPlayerData;
    /**获取按钮的 solar data */
    public static sd(handle: button, createDefault?: boolean): AppData;
    /**获取handle的 solar data */
    public static sd(handle: any, createDefault = DataBase.DefaultCreateSolarData): any {
        if (!IsHandle(handle)) {
            log.errorWithTraceBack("sd:你传的handle为空或0！")
            return null;
        }
        let type = handledef(handle)?.type;
        if (!type) {
            print("警告：你的handle数据已被底层回收!请实时获取handle,sd智能方法不能使用过时的handle")
            log.errorWithTraceBack("sd:" + tostring(type) + ":你传的handle类型不存在！" + tostring(handle))
            return null;
        }
        if (type == "+w3u") {
            //单位走专用的 方法
            return DataBase.getUnitSolarData(handle, createDefault)
        }
        return DataBase.getDataByHandle(type, handle, createDefault)
    }


}

/**
 * 使用缩写开发
 */
declare global {
    let db: typeof DataBase
    /**获取handle的 solar data */
    let sd: typeof DataBase.sd
}