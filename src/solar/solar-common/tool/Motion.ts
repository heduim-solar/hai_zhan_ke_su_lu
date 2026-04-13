import STimer from "@/STimer";
import InterpolationUtil from "@/InterpolationUtil";
import MathUtil from "@/MathUtil";

declare global {

    type   SplineType = "Linear" | "Bezier";// | "CatmullRom" | "Nurb"

}

/**
 * 运动器
 */
export default class Motion {
    /** 路径点 */
    pathPoints: Vector[] = []
    /** 是否循环模式 */
    cycle: boolean = false

    duration: number = 5;
    speed: number = 1;
    time: number = 0;
    pathSplineType: SplineType = "Linear";
    private last_x: number
    private last_y: number
    /** 当前运动器所在位置 运行后这些值会动态变化 */
    x: number
    y: number
    z?: number

    onUpdate: ((motion: Motion) => void) = null;
    onDone: ((motion: Motion) => void) = null;
    sTimer = new STimer();
    /** 更新间隔 */
    updateInterval: number = 0.03
    /** 进度 */
    progress: number;

    constructor(duration: number, onUpdate: ((motion: Motion) => void), ...pathPoints: Vector[]) {
        this.duration = duration;
        this.onUpdate = onUpdate;
        if (pathPoints != null) {
            this.pathPoints = pathPoints;
        }
    }

    /**
     * 添加路径点
     * @param v
     */
    addPathPoint(v: Vector);
    addPathPoint(x: number, y: number, z?: number);
    addPathPoint(xOrVector: number | Vector, y?: number, z?: number) {
        if (y == null) {
            this.pathPoints.push(xOrVector as Vector)
        } else {
            this.pathPoints.push({x: xOrVector as number, y: y, z: z})
        }
    }


    /**
     * 显示debug 路径
     */
    showDebugShape() {

    }


    setOnUpdate(onUpdate: () => void) {
        this.onUpdate = onUpdate;
    }


    /**
     * 设置路径曲线类型
     * @param pathSplineType
     */
    setPathSplineType(pathSplineType: SplineType) {
        this.pathSplineType = pathSplineType;
    }

    stop(): void {
        this.sTimer.destroy();
    }


    reset(): void {
        this.time = 0;
        this.x = this.pathPoints[0].x
        this.y = this.pathPoints[0].y
        this.z = this.pathPoints[0].z
    }


    run() {
        if (this.onUpdate == null) {
            log.errorWithTraceBack("请先设置更新函数：setOnUpdate() 以接收运动器运动状态。")
            return
        }
        this.reset();
        this.sTimer.reset();
        this.sTimer.start(this.updateInterval, () => {
            if (this.time > this.duration) {
                this.onDone?.(this)
                this.sTimer.destroy();
                return
            }
            this.time += this.updateInterval;
            this.progress = this.time / this.duration;
            //
            this.interpolation()
            //
            this.onUpdate(this);
            this.last_x = this.x;
            this.last_y = this.y;
        }, true)
    }

    getFaceAngle(): number {
        if (this.last_x == null) {
            return MathUtil.angleBetweenCoords(this.pathPoints[0].x, this.pathPoints[0].y,
                this.pathPoints[this.pathPoints.length - 1].x, this.pathPoints[this.pathPoints.length - 1].y);
        }
        return MathUtil.angleBetweenCoords(this.last_x, this.last_y, this.x, this.y);
    }

    private interpolation(): void {
        if (this.pathSplineType == "Linear") {
            let pathPointsIndex = this.progress * (this.pathPoints.length - 1)
            pathPointsIndex = Math.floor(pathPointsIndex);
            let startVector = this.pathPoints[pathPointsIndex];
            let endVector = this.pathPoints[pathPointsIndex + 1];
            if (startVector == null || endVector == null) {//最后一帧
                endVector = this.pathPoints[this.pathPoints.length - 1];
                this.x = endVector.x
                this.y = endVector.y
                if (endVector.z) {
                    this.z = endVector.z
                }
                return
            }
            let onePathPointDuration = this.duration / (this.pathPoints.length - 1)
            let onePathPointProgress = (this.time % onePathPointDuration) / onePathPointDuration
            //
            this.x = InterpolationUtil.line(startVector.x, endVector.x, onePathPointProgress)
            this.y = InterpolationUtil.line(startVector.y, endVector.y, onePathPointProgress)
            if (startVector.z && endVector.z) {
                this.z = InterpolationUtil.line(startVector.z, endVector.z, onePathPointProgress)
            }
        } else if (this.pathSplineType == "Bezier") {
            let bezierResult = InterpolationUtil.bezier(this.progress, ...this.pathPoints);
            this.x = bezierResult.x
            this.y = bezierResult.y
            this.z = bezierResult.z

        }

    }


}