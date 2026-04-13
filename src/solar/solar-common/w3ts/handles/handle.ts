/** @noSelfInFile **/
import DataBase from "@/DataBase";

// const map: WeakMap<handle, any> = new WeakMap<handle, any>();

export class Handle<T extends handle> {

    public readonly handle: T;
    private static initHandle: handle | undefined;

    protected constructor(handle?: T) {
        this.handle = handle === undefined ? Handle.initHandle as T : handle;
        // map.set(this.handle, this);
    }

    public get handleId() {
        return GetHandleId(this.handle);
    }

    public static initFromHandle(): boolean {
        return Handle.initHandle !== undefined;
    }

    protected static getObject(handle: handle, handleType?: string): any {
        // const obj = map.get(handle);
        // if (obj !== undefined) {
        //     return obj;
        // }
        if (!IsHandle(handle)) {
            let tb = debug.traceback();
            log.error("Handle.getObject():你传的handle为空或0！")
            log.error(tb)
            return null;
        }

        Handle.initHandle = handle;
        let handleObj = null
        if (handleType != null) {
            /** 从solarData里获取 包装对象 以保证每次获取的都是相同的对象*/
            let solarData = DataBase.getDataByHandle(handleType, handle, true);
            handleObj = solarData._sl_handleObj;
            if (handleObj == null) {
                handleObj = new this();
                solarData._sl_handleObj = handleObj;
            }
        } else {
            handleObj = new this();
        }
        Handle.initHandle = undefined;
        return handleObj;
    }

}
