local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 34,["13"] = 36,["14"] = 36,["15"] = 36,["16"] = 36,["17"] = 36,["18"] = 36,["19"] = 37,["20"] = 37,["21"] = 37,["22"] = 37,["23"] = 37,["24"] = 37,["25"] = 37,["26"] = 37,["27"] = 37,["28"] = 42,["29"] = 44,["30"] = 44,["31"] = 44,["32"] = 44,["33"] = 44,["34"] = 44,["35"] = 45,["36"] = 46,["37"] = 47,["39"] = 49,["40"] = 50,["42"] = 44,["43"] = 44,["44"] = 31,["45"] = 18,["46"] = 19,["47"] = 20,["49"] = 20,["50"] = 20,["51"] = 20,["53"] = 20,["54"] = 21,["55"] = 18,["56"] = 24,["57"] = 25,["58"] = 26,["59"] = 27,["60"] = 27,["61"] = 27,["63"] = 27,["65"] = 27,["66"] = 24,["67"] = 55,["68"] = 56,["69"] = 56,["70"] = 56,["71"] = 56,["72"] = 56,["73"] = 57,["74"] = 57,["75"] = 57,["76"] = 57,["77"] = 57,["78"] = 57,["79"] = 57,["80"] = 57,["81"] = 57,["82"] = 58,["83"] = 58,["84"] = 58,["85"] = 58,["86"] = 58,["87"] = 58,["88"] = 58,["89"] = 58,["90"] = 58,["91"] = 59,["92"] = 59,["93"] = 59,["94"] = 59,["95"] = 59,["96"] = 59,["98"] = 55,["99"] = 63,["100"] = 64,["103"] = 66,["104"] = 67,["105"] = 67,["106"] = 67,["107"] = 67,["108"] = 67,["109"] = 67,["110"] = 68,["111"] = 69,["113"] = 70,["115"] = 72,["117"] = 73,["119"] = 75,["120"] = 75,["121"] = 75,["122"] = 75,["123"] = 75,["124"] = 75,["125"] = 76,["126"] = 76,["127"] = 76,["128"] = 76,["129"] = 76,["130"] = 76,["131"] = 63,["132"] = 5,["133"] = 6,["134"] = 10,["135"] = 11,["136"] = 12,["137"] = 13,["138"] = 16});
local ____exports = {}
local ____FrameCallbackUtil = require("solar.solar-common.util.frame.FrameCallbackUtil")
local FrameCallbackUtil = ____FrameCallbackUtil.default
____exports.default = __TS__Class()
local UpdateCameraHeightOnMouseScroll = ____exports.default
UpdateCameraHeightOnMouseScroll.name = "UpdateCameraHeightOnMouseScroll"
function UpdateCameraHeightOnMouseScroll.prototype.____constructor(self)
    FrameCallbackUtil:addFrameSetUpdateCallback(____exports.default.setRange)
    ____exports.default:UserDataSet(
        "player",
        GetLocalPlayer(),
        "镜头距离",
        I2R(____exports.default.level) * 200
    )
    SetCameraField(
        CAMERA_FIELD_TARGET_DISTANCE,
        ____exports.default:UserDataGet(
            "player",
            GetLocalPlayer(),
            "镜头距离"
        ),
        ____exports.default.bufferWeight
    )
    DzTriggerRegisterMouseWheelEventByCode(nil, false, ____exports.default.OnDzGetWheelDelta)
    DzTriggerRegisterKeyEventByCode(
        nil,
        145,
        1,
        false,
        function()
            if ____exports.default.isWideScreen == true then
                ____exports.default.isWideScreen = false
                DzEnableWideScreen(false)
            else
                ____exports.default.isWideScreen = true
                DzEnableWideScreen(true)
            end
        end
    )
end
function UpdateCameraHeightOnMouseScroll.UserDataSet(self, ____type, handle, varName, varValue)
    local key = ____type .. tostring(GetHandleId(handle))
    local ____exports_default_dataBaseContext_key_1 = ____exports.default.dataBaseContext[key]
    if not ____exports_default_dataBaseContext_key_1 then
        local ____temp_0 = {}
        ____exports.default.dataBaseContext[key] = ____temp_0
        ____exports_default_dataBaseContext_key_1 = ____temp_0
    end
    local data = ____exports_default_dataBaseContext_key_1
    data[varName] = varValue
end
function UpdateCameraHeightOnMouseScroll.UserDataGet(self, ____type, handle, varName)
    local key = ____type .. tostring(GetHandleId(handle))
    local data = ____exports.default.dataBaseContext[key]
    local ____data_2
    if data then
        ____data_2 = data[varName]
    else
        ____data_2 = nil
    end
    return ____data_2
end
function UpdateCameraHeightOnMouseScroll.setRange()
    if ____exports.default:UserDataGet(
        "player",
        GetLocalPlayer(),
        "重置镜头属性"
    ) == true then
        SetCameraField(
            CAMERA_FIELD_ANGLE_OF_ATTACK,
            ____exports.default:UserDataGet(
                "player",
                GetLocalPlayer(),
                "镜头X角度"
            ),
            0
        )
        SetCameraField(
            CAMERA_FIELD_TARGET_DISTANCE,
            ____exports.default:UserDataGet(
                "player",
                GetLocalPlayer(),
                "镜头距离"
            ),
            ____exports.default.bufferWeight
        )
        ____exports.default:UserDataSet(
            "player",
            GetLocalPlayer(),
            "重置镜头属性",
            false
        )
    end
end
function UpdateCameraHeightOnMouseScroll.OnDzGetWheelDelta()
    if DzIsMouseOverUI() == false then
        return
    end
    ____exports.default.delta = DzGetWheelDelta()
    ____exports.default:UserDataSet(
        "player",
        GetLocalPlayer(),
        "重置镜头属性",
        true
    )
    if ____exports.default.delta > 0 then
        if ____exports.default.level > ____exports.default.minHeightLv then
            local ____exports_default_3, ____level_4 = ____exports.default, "level"
            ____exports_default_3[____level_4] = ____exports_default_3[____level_4] - 1
        end
    elseif ____exports.default.level < ____exports.default.maxHeightLv then
        local ____exports_default_5, ____level_6 = ____exports.default, "level"
        ____exports_default_5[____level_6] = ____exports_default_5[____level_6] + 1
    end
    ____exports.default:UserDataSet(
        "player",
        GetLocalPlayer(),
        "镜头X角度",
        Rad2Deg(GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK))
    )
    ____exports.default:UserDataSet(
        "player",
        GetLocalPlayer(),
        "镜头距离",
        ____exports.default.level * 200
    )
end
UpdateCameraHeightOnMouseScroll.isWideScreen = false
UpdateCameraHeightOnMouseScroll.bufferWeight = 0.1
UpdateCameraHeightOnMouseScroll.minHeightLv = 5
UpdateCameraHeightOnMouseScroll.maxHeightLv = 19
UpdateCameraHeightOnMouseScroll.level = 14
UpdateCameraHeightOnMouseScroll.delta = 0
UpdateCameraHeightOnMouseScroll.dataBaseContext = {}
return ____exports
