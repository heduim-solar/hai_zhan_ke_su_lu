local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 6,["14"] = 6,["15"] = 6,["17"] = 8,["18"] = 114,["19"] = 115,["20"] = 114,["21"] = 121,["22"] = 122,["23"] = 121,["24"] = 128,["25"] = 129,["26"] = 128,["27"] = 135,["28"] = 136,["29"] = 135,["30"] = 142,["31"] = 143,["32"] = 144,["34"] = 146,["36"] = 142,["37"] = 153,["38"] = 154,["39"] = 155,["41"] = 157,["43"] = 153,["44"] = 164,["45"] = 165,["46"] = 164,["47"] = 171,["48"] = 172,["49"] = 172,["50"] = 172,["51"] = 172,["52"] = 172,["53"] = 172,["54"] = 172,["55"] = 172,["56"] = 172,["57"] = 172,["58"] = 171,["59"] = 178,["60"] = 179,["61"] = 178,["62"] = 186,["63"] = 187,["64"] = 186,["65"] = 194,["66"] = 195,["67"] = 194,["68"] = 205,["69"] = 206,["70"] = 205,["71"] = 216,["72"] = 217,["73"] = 216,["74"] = 227,["75"] = 228,["76"] = 227,["77"] = 238,["78"] = 239,["79"] = 238,["80"] = 246,["81"] = 247,["82"] = 246,["83"] = 254,["84"] = 255,["85"] = 254,["86"] = 264,["87"] = 265,["88"] = 264,["89"] = 278,["90"] = 279,["91"] = 279,["92"] = 279,["93"] = 279,["94"] = 279,["95"] = 279,["96"] = 279,["97"] = 279,["98"] = 278,["99"] = 288,["100"] = 289,["101"] = 288,["102"] = 298,["103"] = 299,["104"] = 298,["105"] = 305,["106"] = 306,["107"] = 305,["108"] = 313,["109"] = 314,["110"] = 313,["111"] = 320,["112"] = 320,["113"] = 320,["115"] = 321,["116"] = 320,["117"] = 327,["118"] = 328,["119"] = 327,["120"] = 334,["121"] = 334,["122"] = 334,["124"] = 335,["125"] = 334,["126"] = 341,["127"] = 342,["128"] = 341,["134"] = 24,["136"] = 15,["137"] = 16,["145"] = 31,["152"] = 38,["159"] = 45,["166"] = 52,["173"] = 59,["180"] = 66,["187"] = 73,["194"] = 80,["201"] = 87,["208"] = 94,["215"] = 101,["222"] = 108,["225"] = 347,["226"] = 347,["227"] = 347,["228"] = 347,["230"] = 350,["231"] = 350,["232"] = 350,["234"] = 350,["236"] = 347,["237"] = 349,["238"] = 398,["239"] = 399,["240"] = 398,["241"] = 407,["242"] = 408,["243"] = 407,["244"] = 421,["245"] = 422,["246"] = 421,["247"] = 430,["248"] = 431,["249"] = 430,["250"] = 437,["251"] = 438,["252"] = 437,["253"] = 444,["254"] = 445,["255"] = 444,["256"] = 451,["257"] = 452,["258"] = 451,["259"] = 458,["260"] = 459,["261"] = 458,["266"] = 357,["275"] = 364,["277"] = 370,["278"] = 371,["288"] = 378,["290"] = 384,["291"] = 385});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____point = require("solar.solar-common.w3ts.handles.point")
local Point = ____point.Point
____exports.Camera = __TS__Class()
local Camera = ____exports.Camera
Camera.name = "Camera"
function Camera.prototype.____constructor(self)
end
function Camera.adjustField(self, whichField, offset, duration)
    AdjustCameraField(whichField, offset, duration)
end
function Camera.endCinematicScene(self)
    EndCinematicScene()
end
function Camera.forceCinematicSubtitles(self, flag)
    ForceCinematicSubtitles(flag)
end
function Camera.getMargin(self, whichMargin)
    return GetCameraMargin(whichMargin)
end
function Camera.pan(self, x, y, zOffsetDest)
    if not zOffsetDest then
        PanCameraTo(x, y)
    else
        PanCameraToWithZ(x, y, zOffsetDest)
    end
end
function Camera.panTimed(self, x, y, duration, zOffsetDest)
    if not zOffsetDest then
        PanCameraToTimed(x, y, duration)
    else
        PanCameraToTimedWithZ(x, y, zOffsetDest, duration)
    end
end
function Camera.reset(self, duration)
    ResetToGameCamera(duration)
end
function Camera.setBounds(self, x1, y1, x2, y2, x3, y3, x4, y4)
    SetCameraBounds(
        x1,
        y1,
        x2,
        y2,
        x3,
        y3,
        x4,
        y4
    )
end
function Camera.setCameraOrientController(self, whichUnit, xOffset, yOffset)
    SetCameraOrientController(whichUnit, xOffset, yOffset)
end
function Camera.setCineFilterBlendMode(self, whichMode)
    SetCineFilterBlendMode(whichMode)
end
function Camera.setCineFilterDuration(self, duration)
    SetCineFilterDuration(duration)
end
function Camera.setCineFilterEndColor(self, red, green, blue, alpha)
    SetCineFilterEndColor(red, green, blue, alpha)
end
function Camera.setCineFilterEndUV(self, minU, minV, maxU, maxV)
    SetCineFilterEndUV(minU, minV, maxU, maxV)
end
function Camera.setCineFilterStartColor(self, red, green, blue, alpha)
    SetCineFilterStartColor(red, green, blue, alpha)
end
function Camera.setCineFilterStartUV(self, minU, minV, maxU, maxV)
    SetCineFilterStartUV(minU, minV, maxU, maxV)
end
function Camera.setCineFilterTexMapFlags(self, whichFlags)
    SetCineFilterTexMapFlags(whichFlags)
end
function Camera.setCineFilterTexture(self, fileName)
    SetCineFilterTexture(fileName)
end
function Camera.setCinematicCamera(self, cameraModelFile)
    SetCinematicCamera(cameraModelFile)
end
function Camera.SetCinematicScene(self, portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
    SetCinematicScene(
        portraitUnitId,
        color,
        speakerTitle,
        text,
        sceneDuration,
        voiceoverDuration
    )
end
function Camera.setField(self, whichField, value, duration)
    SetCameraField(whichField, value, duration)
end
function Camera.setPos(self, x, y)
    SetCameraPosition(x, y)
end
function Camera.setRotateMode(self, x, y, radiansToSweep, duration)
    SetCameraRotateMode(x, y, radiansToSweep, duration)
end
function Camera.setSmoothingFactor(self, factor)
    CameraSetSmoothingFactor(factor)
end
function Camera.setSourceNoise(self, mag, velocity, vertOnly)
    if vertOnly == nil then
        vertOnly = false
    end
    CameraSetSourceNoiseEx(mag, velocity, vertOnly)
end
function Camera.setTargetController(self, whichUnit, xOffset, yOffset, inheritOrientation)
    SetCameraTargetController(whichUnit, xOffset, yOffset, inheritOrientation)
end
function Camera.setTargetNoise(self, mag, velocity, vertOnly)
    if vertOnly == nil then
        vertOnly = false
    end
    CameraSetTargetNoiseEx(mag, velocity, vertOnly)
end
function Camera.stop(self)
    StopCamera()
end
__TS__ObjectDefineProperty(
    Camera,
    "visible",
    {
        get = function(self)
            return IsCineFilterDisplayed()
        end,
        set = function(self, flag)
            DisplayCineFilter(flag)
        end
    }
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMinX",
    {get = function(self)
        return GetCameraBoundMinX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMinY",
    {get = function(self)
        return GetCameraBoundMinY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMaxX",
    {get = function(self)
        return GetCameraBoundMaxX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "boundMaxY",
    {get = function(self)
        return GetCameraBoundMaxY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetX",
    {get = function(self)
        return GetCameraTargetPositionX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetY",
    {get = function(self)
        return GetCameraTargetPositionY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetZ",
    {get = function(self)
        return GetCameraTargetPositionZ()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeX",
    {get = function(self)
        return GetCameraEyePositionX()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeY",
    {get = function(self)
        return GetCameraEyePositionY()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyeZ",
    {get = function(self)
        return GetCameraEyePositionZ()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "eyePoint",
    {get = function(self)
        return GetCameraEyePositionLoc()
    end}
)
__TS__ObjectDefineProperty(
    Camera,
    "targetPoint",
    {get = function(self)
        return Point:fromHandle(GetCameraTargetPositionLoc())
    end}
)
____exports.CameraSetup = __TS__Class()
local CameraSetup = ____exports.CameraSetup
CameraSetup.name = "CameraSetup"
__TS__ClassExtends(CameraSetup, Handle)
function CameraSetup.prototype.____constructor(self)
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = CreateCameraSetup()
    end
    Handle.prototype.____constructor(self, ____Handle_initFromHandle_result_0)
end
function CameraSetup.prototype.apply(self, doPan, panTimed)
    CameraSetupApply(self.handle, doPan, panTimed)
end
function CameraSetup.prototype.applyForceDuration(self, doPan, forceDuration)
    CameraSetupApplyForceDuration(self.handle, doPan, forceDuration)
end
function CameraSetup.prototype.applyForceDurationZ(self, zDestOffset, forceDuration)
    CameraSetupApplyForceDurationWithZ(self.handle, zDestOffset, forceDuration)
end
function CameraSetup.prototype.applyZ(self, zDestOffset)
    CameraSetupApplyWithZ(self.handle, zDestOffset)
end
function CameraSetup.prototype.getField(self, whichField)
    return CameraSetupGetField(self.handle, whichField)
end
function CameraSetup.prototype.setDestPos(self, x, y, duration)
    CameraSetupSetDestPosition(self.handle, x, y, duration)
end
function CameraSetup.prototype.setField(self, whichField, value, duration)
    CameraSetupSetField(self.handle, whichField, value, duration)
end
function CameraSetup.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destPoint",
    {get = function(self)
        return CameraSetupGetDestPositionLoc(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destX",
    {
        get = function(self)
            return CameraSetupGetDestPositionX(self.handle)
        end,
        set = function(self, x)
            CameraSetupSetDestPosition(self.handle, x, self.destY, 0)
        end
    },
    true
)
__TS__SetDescriptor(
    CameraSetup.prototype,
    "destY",
    {
        get = function(self)
            return CameraSetupGetDestPositionY(self.handle)
        end,
        set = function(self, y)
            CameraSetupSetDestPosition(self.handle, self.destX, y, 0)
        end
    },
    true
)
return ____exports
