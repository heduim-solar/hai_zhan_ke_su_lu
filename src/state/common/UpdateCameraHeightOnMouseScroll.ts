import FrameCallbackUtil from '@/FrameCallbackUtil';

export default class UpdateCameraHeightOnMouseScroll {

    static isWideScreen = false;//
    static bufferWeight = 0.1;//平滑
    /**
     * 最低高度 (高度=Lv*200)
     */
    static minHeightLv = 5; //1000
    static maxHeightLv = 19; //3800
    static level = 14;
    static delta = 0;


    static dataBaseContext: { [id: string]: any } = {};

    static UserDataSet(type: string, handle: handle, varName: string, varValue: any): void {
        let key = type + GetHandleId(handle);
        let data = UpdateCameraHeightOnMouseScroll.dataBaseContext[key] || (UpdateCameraHeightOnMouseScroll.dataBaseContext[key] = {});
        data[varName] = varValue;
    }

    static UserDataGet(type: string, handle: handle, varName: string): any {
        let key = type + GetHandleId(handle);
        let data = UpdateCameraHeightOnMouseScroll.dataBaseContext[key];
        return data ? data[varName] : null;
    }

    ///
    constructor() {


        FrameCallbackUtil.addFrameSetUpdateCallback(UpdateCameraHeightOnMouseScroll.setRange);

        UpdateCameraHeightOnMouseScroll.UserDataSet("player", GetLocalPlayer(), "镜头距离", (I2R(UpdateCameraHeightOnMouseScroll.level) * 200.00));
        SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, UpdateCameraHeightOnMouseScroll.UserDataGet("player", GetLocalPlayer(), "镜头距离"),
            UpdateCameraHeightOnMouseScroll.bufferWeight
        );


        DzTriggerRegisterMouseWheelEventByCode(null, false, UpdateCameraHeightOnMouseScroll.OnDzGetWheelDelta);

        DzTriggerRegisterKeyEventByCode(null, 145, 1, false, () => {
            if (UpdateCameraHeightOnMouseScroll.isWideScreen == true) {
                UpdateCameraHeightOnMouseScroll.isWideScreen = false;
                DzEnableWideScreen(false);
            } else {
                UpdateCameraHeightOnMouseScroll.isWideScreen = true;
                DzEnableWideScreen(true);
            }
        });
    }

    static setRange(this: void): void {
        if ((UpdateCameraHeightOnMouseScroll.UserDataGet("player", GetLocalPlayer(), "重置镜头属性") == true)) {
            SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, UpdateCameraHeightOnMouseScroll.UserDataGet("player", GetLocalPlayer(), "镜头X角度"), 0.00);
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, UpdateCameraHeightOnMouseScroll.UserDataGet("player", GetLocalPlayer(), "镜头距离"), UpdateCameraHeightOnMouseScroll.bufferWeight);
            UpdateCameraHeightOnMouseScroll.UserDataSet("player", GetLocalPlayer(), "重置镜头属性", false);
        }
    }

    static OnDzGetWheelDelta(this: void): void {
        if ((DzIsMouseOverUI() == false))
            return;
        UpdateCameraHeightOnMouseScroll.delta = DzGetWheelDelta();
        UpdateCameraHeightOnMouseScroll.UserDataSet("player", GetLocalPlayer(), "重置镜头属性", true);
        if (UpdateCameraHeightOnMouseScroll.delta > 0) {
            if (UpdateCameraHeightOnMouseScroll.level > UpdateCameraHeightOnMouseScroll.minHeightLv) {
                UpdateCameraHeightOnMouseScroll.level--;
            }
        } else if (UpdateCameraHeightOnMouseScroll.level < UpdateCameraHeightOnMouseScroll.maxHeightLv) {
            UpdateCameraHeightOnMouseScroll.level++;
        }
        UpdateCameraHeightOnMouseScroll.UserDataSet("player", GetLocalPlayer(), "镜头X角度", Rad2Deg(GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK)));
        UpdateCameraHeightOnMouseScroll.UserDataSet("player", GetLocalPlayer(), "镜头距离", UpdateCameraHeightOnMouseScroll.level * 200.00);
    }


}