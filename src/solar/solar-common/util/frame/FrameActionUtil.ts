/**
 * @name  Frame动作工具
 * @brief 处理Frame动作
 */
import BaseUtil from "@/BaseUtil";
import DataBase from "@/DataBase";
import { Frame } from "@/frame";
import MathUtil from "@/MathUtil";


export type BezierConfig = {
    controlPoint_1: {
        x: number,
        y: number,
    },
    controlPoint_2: {
        x: number,
        y: number,
    },
    endPosition: {
        x: number,
        y: number,
    },
}

export default class FrameActionUtil {

    /**
     * @brief 将Frame的位置移动(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x 位置x的变化量
     * @param y 位置y的变化量
     * @param callback 动作结束后的回调函数
     */
    public static moveBy(frame: Frame, duration: number, x: number, y: number, callback?: () => void) {
        assert(duration >= 0.01, 'moveBy持续时间不能小于0.01秒');
        let frameX: number = frame.getPoint()?.x ?? 0;
        let frameY: number = frame.getPoint()?.y ?? 0;
        let point: number = frame.getPoint()?.point ?? 4;
        let loopCount: number = R2I(duration / 0.01);
        let deltaX: number = 1.0 * x / loopCount;
        let deltaY: number = 1.0 * y / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameX += deltaX;
            frameY += deltaY;
            frame.clearPoints();
            frame.setAbsPoint(point, frameX, frameY);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }

    /**
     * @brief 将Frame的位置移动到(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x Frame的最终x位置
     * @param y Frame的最终y位置
     * @param callback 动作结束后的回调函数
     */
    public static moveTo(frame: Frame, duration: number, x: number, y: number, callback?: () => void) {
        assert(duration >= 0.01, 'moveTo持续时间不能小于0.01秒');
        let frameX: number = frame.getPoint()?.x ?? 0;
        let frameY: number = frame.getPoint()?.y ?? 0;
        let point: number = frame.getPoint()?.point ?? 4;
        let distance: number = MathUtil.distanceBetweenPoints(frameX, frameY, x, y);
        let angle: number = MathUtil.angleBetweenCoords(frameX, frameY, x, y);
        let loopCount: number = R2I(duration / 0.01);
        let deltaX: number = distance * CosBJ(angle) / loopCount;
        let deltaY: number = distance * SinBJ(angle) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameX += deltaX;
            frameY += deltaY;
            frame.clearPoints();
            frame.setAbsPoint(point, frameX, frameY);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }

    /**
     * @brief 将Frame的尺寸变化(w,h)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param w 宽度的变化量
     * @param h 高度的变化量
     * @param callback 动作结束后的回调函数
     */
    public static resizeBy(frame: Frame, duration: number, w: number, h: number, callback?: () => void) {
        assert(duration >= 0.01, 'resizeBy持续时间不能小于0.01秒');
        let width: number = frame.width ?? 0;
        let height: number = frame.height ?? 0;
        let loopCount: number = R2I(duration / 0.01);
        let deltaW: number = 1.0 * w / loopCount;
        let deltaH: number = 1.0 * h / loopCount;
        BaseUtil.onTimer(0.01, count => {
            width += deltaW;
            height += deltaH;
            frame.setSize(width, height);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }

    /**
     * @brief 将Frame的尺寸变化到(w,h)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param w Frame的最终宽度
     * @param h Frame的最终高度
     * @param callback 动作结束后的回调函数
     */
    public static resizeTo(frame: Frame, duration: number, width: number, height: number, callback?: () => void) {
        assert(duration >= 0.01, 'resizeTo持续时间不能小于0.01秒');
        let frameWidth: number = frame.width ?? 0;
        let frameHeight: number = frame.height ?? 0;
        let loopCount: number = R2I(duration / 0.01);
        let deltaW: number = 1.0 * (width - frameWidth) / loopCount;
        let deltaH: number = 1.0 * (height - frameHeight) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameWidth += deltaW;
            frameHeight += deltaH;
            frame.setSize(frameWidth, frameHeight);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }

    /**
     * @brief 将Frame缩放(scale)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param scale 缩放的变化量
     * @param callback 动作结束后的回调函数
     */
    public static scaleBy(frame: Frame, duration: number, scale: number, callback?: () => void) {
        assert(duration >= 0.01, 'scaleBy持续时间不能小于0.01秒');
        let frameScale: number = frame.getScale() ?? 1.0;
        let loopCount: number = R2I(duration / 0.01);
        let deltaScale: number = 1.0 * scale / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameScale += deltaScale;
            frame.setScale(frameScale);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }

    /**
     * @brief 将Frame缩放到(scale)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param scale Frame的最终缩放
     * @param callback 动作结束后的回调函数
     */
    public static scaleTo(frame: Frame, duration: number, scale: number, callback?: () => void) {
        assert(duration >= 0.01, 'scaleTo持续时间不能小于0.01秒');
        let frameScale: number = frame.getScale() ?? 1.0;
        let loopCount: number = R2I(duration / 0.01);
        let deltaScale: number = 1.0 * (scale - frameScale) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameScale += deltaScale;
            frame.setScale(frameScale);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        });
    }

    /**
     * @brief 将Frame闪烁times次
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param times 闪烁的次数
     * @param callback 动作结束后的回调函数
     */
    public static blink(frame: Frame, duration: number, times: number, callback?: () => void) {
        assert(duration >= 0.01, 'blink持续时间不能小于0.01秒');
        let frameVisible: boolean = frame.visible;
        BaseUtil.onTimer(0.01, count => {
            let slice: number = 1.0 / times;
            let m = ModuloReal(0.01 * count, slice);
            frame.setVisible(m > slice / 2 ? true : false);
            if (0.01 * count >= duration) {
                frame.setVisible(frameVisible);
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        })
    }

    /**
     * @brief 淡入淡出到透明度alpha
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param alpha Frame的最终透明度
     * @param callback 动作结束后的回调函数
     */
    public static fadeTo(frame: Frame, duration: number, alpha: number, callback?: () => void) {
        assert(duration >= 0.01, 'fadeTo持续时间不能小于0.01秒');
        let frameAlpha: number = frame.alpha;
        let loopCount: number = R2I(duration / 0.01);
        let deltaAlpha: number = 1.0 * (alpha - frameAlpha) / loopCount;
        BaseUtil.onTimer(0.01, count => {
            frameAlpha += deltaAlpha;
            frame.setAlpha(frameAlpha);
            if (count >= loopCount) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        })
    }

    /**
     * @brief 淡入
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param callback 动作结束后的回调函数
     */
    public static fadeIn(frame: Frame, duration: number, callback?: () => void) {
        this.fadeTo(frame, duration, 255, callback);
    }

    /**
     * @brief 淡出
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param callback 动作结束后的回调函数
     */
    public static fadeOut(frame: Frame, duration: number, callback?: () => void) {
        this.fadeTo(frame, duration, 0, callback);
    }

    /**
     * @brief 动画
     * @param frame 执行动作的Frame,必须是backdrop
     * @param textures 动画纹理集
     * @param interval 间隔时间
     * @param loopCount 循环次数
     * @param isRestore 是否恢复到初始纹理
     * @param callback 动作结束后的回调函数
     */
    public static animate(frame: Frame, textures: string[], interval: number, loopCount: number = -1, isRestore: boolean = true, callback?: () => void) {
        if (textures.length <= 0) return;
        let frameTexture: string = frame.getTexture() as string;
        let index: number = 0;
        let execCount: number = 0;
        BaseUtil.onTimer(interval, () => {
            index++;
            if (index < textures.length) {
                let texture: string = textures[index];
                frame.setTexture(texture);
                if (index == textures.length - 1) {
                    execCount++;
                    index = 0;
                }
            }
            if (execCount == loopCount) {
                if (isRestore) {
                    frame.setTexture(frameTexture);
                }
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        })
    }

    /**
     * @brief Frame跳跃一段距离(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x 位置x的变化量
     * @param y 位置y的变化量
     * @param height 跳跃高度
     * @param jumps 跳跃次数
     * @param callback 动作结束后的回调函数
     */
    public static jumpBy(frame: Frame, duration: number, x: number, y: number, height: number, jumps: number, callback?: () => void) {
        assert(duration >= 0.01, 'jumpBy持续时间不能小于0.01秒');
        assert(jumps >= 0, 'jumpBy跳跃次数不能小于0');
        let frameX: number = frame.getPoint()?.x ?? 0;
        let frameY: number = frame.getPoint()?.y ?? 0;
        let point: number = frame.getPoint()?.point ?? 4;
        BaseUtil.onTimer(0.01, count => {
            let escapedTime: number = 0.01 * count;
            let xx: number = x * escapedTime * (1.0 / duration);
            let frac: number = ModuloReal(escapedTime * jumps, 1.0);
            let yy: number = height * 4 * frac * (1 - frac);
            yy += y * escapedTime * (1.0 / duration);
            frame.clearPoints();
            frame.setAbsPoint(point, frameX + xx, frameY + yy);
            if (escapedTime >= duration) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        })
    }

    /**
     * @brief Frame跳跃一段距离到(x,y)
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param x Frame的最终x位置
     * @param y Frame的最终y位置
     * @param height 跳跃高度
     * @param jumps 跳跃次数
     * @param callback 动作结束后的回调函数
     */
    public static jumpTo(frame: Frame, duration: number, x: number, y: number, height: number, jumps: number, callback?: () => void) {
        assert(duration >= 0.01, 'jumpTo持续时间不能小于0.01秒');
        assert(jumps >= 0, 'jumpTo跳跃次数不能小于0');
        let frameX: number = frame.getPoint()?.x ?? 0;
        let frameY: number = frame.getPoint()?.y ?? 0;
        let deltaX: number = x - frameX;
        let deltaY: number = y - frameY;
        this.jumpBy(frame, duration, deltaX, deltaY, height, jumps, callback);
    }

    /**
     * @brief 将Frame的位置按贝塞尔曲线移动某一位置
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param bezierConfig 贝塞尔曲线配置
     * @param callback 动作结束后的回调函数
     */
    public static bezierBy(frame: Frame, duration: number, bezierConfig: BezierConfig, callback?: () => void) {
        assert(duration >= 0.01, 'bezierBy持续时间不能小于0.01秒');
        let frameX: number = frame.getPoint()?.x ?? 0;
        let frameY: number = frame.getPoint()?.y ?? 0;
        let point: number = frame.getPoint()?.point ?? 4;
        BaseUtil.onTimer(0.01, count => {
            let escapedTime: number = 0.01 * count;
            let xa: number = 0;
            let xb: number = bezierConfig.controlPoint_1.x;
            let xc: number = bezierConfig.controlPoint_2.x;
            let xd: number = bezierConfig.endPosition.x;
            let ya: number = 0;
            let yb: number = bezierConfig.controlPoint_1.y;
            let yc: number = bezierConfig.controlPoint_2.y;
            let yd: number = bezierConfig.endPosition.y;
            let x: number = this.bezierAt(xa, xb, xc, xd, escapedTime);
            let y: number = this.bezierAt(ya, yb, yc, yd, escapedTime);
            frame.clearPoints();
            frame.setAbsPoint(point, frameX + x, frameY + y);
            if (escapedTime >= duration) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        })
    }

    /**
     * @brief 将Frame的位置按贝塞尔曲线移动到某一位置
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param bezierConfig 贝塞尔曲线配置
     * @param callback 动作结束后的回调函数
     */
    public static bezierTo(frame: Frame, duration: number, bezierConfig: BezierConfig, callback?: () => void) {
        assert(duration >= 0.01, 'bezierTo持续时间不能小于0.01秒');
        let frameX: number = frame.getPoint()?.x ?? 0;
        let frameY: number = frame.getPoint()?.y ?? 0;
        let bc: BezierConfig = {
            controlPoint_1: {
                x: bezierConfig.controlPoint_1.x - frameX,
                y: bezierConfig.controlPoint_1.y - frameY,
            },
            controlPoint_2: {
                x: bezierConfig.controlPoint_2.x - frameX,
                y: bezierConfig.controlPoint_2.y - frameY,
            },
            endPosition: {
                x: bezierConfig.endPosition.x - frameX,
                y: bezierConfig.endPosition.y - frameY,
            },
        };
        this.bezierBy(frame, duration, bc, callback);
    }

    /**贝塞尔曲线*/
    private static bezierAt(a: number, b: number, c: number, d: number, t: number): number {
        return (math.pow(1 - t, 3) * a + 3 * t * (math.pow(1 - t, 2)) * b + 3 * math.pow(t, 2) * (1 - t) * c + math.pow(t, 3) * d);
    }

    /**
     * @brief 将Frame的色调变化某值
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param r 色调r的变化量
     * @param g 色调g的变化量
     * @param b 色调b的变化量
     * @param callback 动作结束后的回调函数
     */
    public static tintBy(frame: Frame, duration: number, r: number, g: number, b: number, callback?: () => void) {
        assert(duration >= 0.01, 'tintBy持续时间不能小于0.01秒');
        let frameData = DataBase.getDataByTypeId('Frame', tostring(frame.current), true);
        let frameR: number = frameData?.r ?? 0;
        let frameG: number = frameData?.g ?? 0;
        let frameB: number = frameData?.b ?? 0;
        let frameAlpha: number = frame.alpha;
        BaseUtil.onTimer(0.01, count => {
            let escapedTime: number = 0.01 * count;
            let rr: number = frameR + r * escapedTime;
            let gg: number = frameG + g * escapedTime;
            let bb: number = frameB + b * escapedTime;
            frameData.r = rr;
            frameData.g = gg;
            frameData.b = bb;
            let color: number = DzGetColor(rr, gg, bb, frameAlpha);
            frame.setVertexColor(color);
            if (escapedTime >= duration) {
                if (callback) {
                    callback();
                }
                return false;
            }
            return true;
        })
    }

    /**
     * @brief 将Frame的色调变化到某值
     * @param frame 执行动作的Frame
     * @param duration 持续时间
     * @param r Frame的最终色调r
     * @param g Frame的最终色调g
     * @param b Frame的最终色调b
     * @param callback 动作结束后的回调函数
     */
    public static tintTo(frame: Frame, duration: number, r: number, g: number, b: number, callback?: () => void) {
        assert(duration >= 0.01, 'tintTo持续时间不能小于0.01秒');
        let frameData = DataBase.getDataByTypeId('Frame', tostring(frame.current), true);
        let frameR: number = frameData?.r ?? 0;
        let frameG: number = frameData?.g ?? 0;
        let frameB: number = frameData?.b ?? 0;
        let deltaR: number = r - frameR;
        let deltaG: number = g - frameG;
        let deltaB: number = b - frameB;
        this.tintBy(frame, duration, deltaR, deltaG, deltaB, callback);
    }
}