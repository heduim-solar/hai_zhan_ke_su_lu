/** @noSelfInFile **/

import {Handle} from "./handle";
import {Point} from "./point";

export class Camera {

    private constructor() {
    }

    /**
     * 显示/隐藏 滤镜
     * @param flag
     */
    public static set visible(flag: boolean) {
        DisplayCineFilter(flag);
    }

    /**
     * 显示/隐藏 滤镜
     * @param flag
     */
    public static get visible() {
        return IsCineFilterDisplayed();
    }

    /**
     * 获取相机边界最小X
     */
    public static get boundMinX() {
        return GetCameraBoundMinX();
    }

    /**
     * 获取相机边界最小y
     */
    public static get boundMinY() {
        return GetCameraBoundMinY();
    }

    /**
     * 获取相机边界最大x
     */
    public static get boundMaxX() {
        return GetCameraBoundMaxX();
    }

    /**
     * 获取相机边界最大y
     */
    public static get boundMaxY() {
        return GetCameraBoundMaxY();
    }

    /**
     * 当前摄象机的目标的 X 坐标
     */
    public static get targetX() {
        return GetCameraTargetPositionX();
    }

    /**
     * 当前摄象机的目标的 Y 坐标
     */
    public static get targetY() {
        return GetCameraTargetPositionY();
    }

    /**
     * 当前摄象机的目标的 Z 坐标
     */
    public static get targetZ() {
        return GetCameraTargetPositionZ();
    }

    /**
     * 当前摄象机的位置的 X 坐标
     */
    public static get eyeX() {
        return GetCameraEyePositionX();
    }

    /**
     * 当前摄象机的位置的 Y 坐标
     */
    public static get eyeY() {
        return GetCameraEyePositionY();
    }

    /**
     * 当前摄象机的位置的 Z 坐标
     */
    public static get eyeZ() {
        return GetCameraEyePositionZ();
    }

    /**
     * 当前照相机的位置
     */
    public static get eyePoint() {
        return GetCameraEyePositionLoc();
    }

    /**
     * 当前摄象机的目标
     */
    public static get targetPoint() {
        return Point.fromHandle(GetCameraTargetPositionLoc());
    }

    /**
     * 设置镜头属性(所有玩家)(限时) [R]
     */
    public static adjustField(whichField: camerafield, offset: number, duration: number) {
        AdjustCameraField(whichField, offset, duration);
    }

    /**
     * EndCinematicScene
     */
    public static endCinematicScene() {
        EndCinematicScene();
    }

    /**
     * 强制电影字幕
     */
    public static forceCinematicSubtitles(flag: boolean) {
        ForceCinematicSubtitles(flag);
    }

    /**
     * 获取镜头边距
     */
    public static getMargin(whichMargin: number) {
        return GetCameraMargin(whichMargin);
    }

    /**
     * 平移镜头
     */
    public static pan(x: number, y: number, zOffsetDest: number | undefined) {
        if (!zOffsetDest) {
            PanCameraTo(x, y);
        } else {
            PanCameraToWithZ(x, y, zOffsetDest);
        }
    }

    /**
     * 平移镜头(所有玩家)(限时) [R]
     */
    public static panTimed(x: number, y: number, duration: number, zOffsetDest: number | undefined) {
        if (!zOffsetDest) {
            PanCameraToTimed(x, y, duration);
        } else {
            PanCameraToTimedWithZ(x, y, zOffsetDest, duration);
        }
    }

    /**
     * 重置游戏镜头(所有玩家) [R]
     */
    public static reset(duration: number) {
        ResetToGameCamera(duration);
    }

    /**
     * 设置可用镜头区域(所有玩家) [R]
     */
    public static setBounds(x1: number, y1: number, x2: number, y2: number, x3: number, y3: number, x4: number, y4: number) {
        SetCameraBounds(x1, y1, x2, y2, x3, y3, x4, y4);
    }

    /**
     * 锁定镜头到单位(固定镜头源)(所有玩家) [R]
     */
    public static setCameraOrientController(whichUnit: unit, xOffset: number, yOffset: number) {
        SetCameraOrientController(whichUnit, xOffset, yOffset);
    }

    /**
     * 设置电影过滤器混合模式
     * @param whichMode
     */
    public static setCineFilterBlendMode(whichMode: blendmode) {
        SetCineFilterBlendMode(whichMode);
    }

    /**
     * 设置电影过滤器持续时间
     * @param duration
     */
    public static setCineFilterDuration(duration: number) {
        SetCineFilterDuration(duration);
    }

    /**
     * 设置电影过滤器结束颜色
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    public static setCineFilterEndColor(red: number, green: number, blue: number, alpha: number) {
        SetCineFilterEndColor(red, green, blue, alpha);
    }

    /**
     * 设置电影过滤器结束UV
     * @param minU
     * @param minV
     * @param maxU
     * @param maxV
     */
    public static setCineFilterEndUV(minU: number, minV: number, maxU: number, maxV: number) {
        SetCineFilterEndUV(minU, minV, maxU, maxV);
    }

    /**
     * 设置电影过滤器开始颜色
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    public static setCineFilterStartColor(red: number, green: number, blue: number, alpha: number) {
        SetCineFilterStartColor(red, green, blue, alpha);
    }

    /**
     * 设置电影过滤器开始UV
     * @param minU
     * @param minV
     * @param maxU
     * @param maxV
     */
    public static setCineFilterStartUV(minU: number, minV: number, maxU: number, maxV: number) {
        SetCineFilterStartUV(minU, minV, maxU, maxV);
    }

    /**
     * 设置电影过滤器纹理映射标志
     * @param whichFlags
     */
    public static setCineFilterTexMapFlags(whichFlags: texmapflags) {
        SetCineFilterTexMapFlags(whichFlags);
    }

    /**
     * 设置电影过滤器纹理
     * @param fileName
     */
    public static setCineFilterTexture(fileName: string) {
        SetCineFilterTexture(fileName);
    }

    // public static setCinematicAudio(cinematicAudio: boolean) {
    //   SetCinematicAudio(cinematicAudio);
    // }
    /**
     * 播放电影镜头(所有玩家) [R]
     */
    public static setCinematicCamera(cameraModelFile: string) {
        SetCinematicCamera(cameraModelFile);
    }

    /**
     * 设置电影场景
     * @param portraitUnitId
     * @param color
     * @param speakerTitle
     * @param text
     * @param sceneDuration
     * @param voiceoverDuration
     * @constructor
     */
    public static SetCinematicScene(portraitUnitId: number | string, color: playercolor, speakerTitle: string, text: string, sceneDuration: number, voiceoverDuration: number) {
        SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration);
    }

    // public static setDepthOfFieldScale(scale: number) {
    //   CameraSetDepthOfFieldScale(scale);
    // }
    /**
     * 设置镜头属性(所有玩家)(限时) [R]
     */
    public static setField(whichField: camerafield, value: number, duration: number) {
        SetCameraField(whichField, value, duration);
    }

    // public static setFocalDistance(distance: number) {
    //   CameraSetFocalDistance(distance);
    // }
    /**
     * Camera API
     */
    public static setPos(x: number, y: number) {
        SetCameraPosition(x, y);
    }

    /**
     * 指定点旋转镜头(所有玩家)(弧度)(限时) [R]
     */
    public static setRotateMode(x: number, y: number, radiansToSweep: number, duration: number) {
        SetCameraRotateMode(x, y, radiansToSweep, duration);
    }

    /**
     * 相机设置平滑因子
     * @param factor
     */
    public static setSmoothingFactor(factor: number) {
        CameraSetSmoothingFactor(factor);
    }

    /**
     * 摇晃镜头源(所有玩家) [R]
     */
    public static setSourceNoise(mag: number, velocity: number, vertOnly = false) {
        CameraSetSourceNoiseEx(mag, velocity, vertOnly);
    }

    /**
     * 锁定镜头到单位(所有玩家) [R]
     */
    public static setTargetController(whichUnit: unit, xOffset: number, yOffset: number, inheritOrientation: boolean) {
        SetCameraTargetController(whichUnit, xOffset, yOffset, inheritOrientation);
    }

    /**
     * 摇晃镜头目标(所有玩家) [R]
     */
    public static setTargetNoise(mag: number, velocity: number, vertOnly = false) {
        CameraSetTargetNoiseEx(mag, velocity, vertOnly);
    }

    /**
     * 停止播放镜头(所有玩家) [R]
     */
    public static stop() {
        StopCamera();
    }

}

export class CameraSetup extends Handle<camerasetup> {

    constructor() {
        super(Handle.initFromHandle() ? undefined : CreateCameraSetup());
    }

    /**
     * 摄象机的目标
     */
    public get destPoint() {
        return CameraSetupGetDestPositionLoc(this.handle);
    }

    /**
     * 摄象机的目标x
     */
    public get destX() {
        return CameraSetupGetDestPositionX(this.handle);
    }

    /**
     * 摄象机的目标x
     */
    public set destX(x: number) {
        CameraSetupSetDestPosition(this.handle, x, this.destY, 0);
    }

    /**
     * 摄象机的目标y
     */
    public get destY() {
        return CameraSetupGetDestPositionY(this.handle);
    }

    /**
     * 摄象机的目标y
     */
    public set destY(y: number) {
        CameraSetupSetDestPosition(this.handle, this.destX, y, 0);
    }

    // public set label(label: string) {
    //   BlzCameraSetupSetLabel(this.handle, label);
    // }
    //
    // public get label() {
    //   return BlzCameraSetupGetLabel(this.handle);
    // }
    /**
     * 摄象机的目标
     */
    public apply(doPan: boolean, panTimed: boolean) {
        CameraSetupApply(this.handle, doPan, panTimed);
    }

    /**
     * 应用镜头(指定玩家)(限时)
     * @param doPan
     * @param forceDuration
     */
    public applyForceDuration(doPan: boolean, forceDuration: number) {
        CameraSetupApplyForceDuration(this.handle, doPan, forceDuration);
    }

    // public applyForceDurationSmooth(doPan: boolean, forcedDuration: number, easeInDuration: number, easeOutDuration: number, smoothFactor: number) {
    //   BlzCameraSetupApplyForceDurationSmooth(this.handle, doPan, forcedDuration, easeInDuration, easeOutDuration, smoothFactor);
    //
    // }

    /**
     * CameraSetupApplyForceDurationWithZ
     * @param doPan
     * @param forceDuration
     */
    public applyForceDurationZ(zDestOffset: number, forceDuration: number) {
        CameraSetupApplyForceDurationWithZ(this.handle, zDestOffset, forceDuration);
    }

    /**
     * 相机设置应用于Z
     * @param doPan
     * @param forceDuration
     */
    public applyZ(zDestOffset: number) {
        CameraSetupApplyWithZ(this.handle, zDestOffset);
    }

    /**
     * 镜头属性(指定镜头) [R]
     */
    public getField(whichField: camerafield) {
        return CameraSetupGetField(this.handle, whichField);
    }

    /**
     * 镜头属性(指定镜头) [R]
     */
    public setDestPos(x: number, y: number, duration: number) {
        CameraSetupSetDestPosition(this.handle, x, y, duration);
    }

    /**
     * 摄像头设置属性
     */
    public setField(whichField: camerafield, value: number, duration: number) {
        CameraSetupSetField(this.handle, whichField, value, duration);
    }

    /**
     * 从handle获取封装类
     */
    public static fromHandle(handle: camerasetup): camerasetup {
        return this.getObject(handle);
    }

}
