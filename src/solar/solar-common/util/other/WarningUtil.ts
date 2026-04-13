import BaseUtil from "@/util/BaseUtil";


export default class WarningUtil {


    // static warningModelPath = "Abilities\\Spells\\NightElf\\TrueshotAura\\TrueshotAura.mdx";
    // static warningModelPath = "Abilities\Spells\Undead\VampiricAura\VampiricAura.mdx";
    static warningModelPath = "Abilities\\Spells\\Orc\\CommandAura\\CommandAuraTarget.mdx";
    /**模型尺寸*/
    static warningModelSize: number = 100.0;

    /**在指定单位范围内显示数个不重合的预警框*/
    public static warningsInRange(whichUnit: unit, duration: number, range: number, smallRange: number = 200, count: number = 8, callback?: (x: number, y: number) => void, effectArt?: string): void {
        let points: { x: number, y: number }[] = [];
        let scale: number = smallRange / this.warningModelSize;
        for (let index: number = 0; index < 1000000; index++) {
            let distance: number = GetRandomReal(0.0, range);
            let angle: number = GetRandomReal(0.0, 360.0);
            let point: { x: number, y: number } = {x: 0, y: 0};
            point.x = GetUnitX(whichUnit) + distance * CosBJ(angle);
            point.y = GetUnitY(whichUnit) + distance * SinBJ(angle);
            let intersect: boolean = false;
            if (points.length > 0) {
                for (let p of points) {
                    let dx = point.x - p.x;
                    let dy = point.y - p.y;
                    let distance: number = math.sqrt(dx * dx + dy * dy);
                    if (distance < smallRange) {
                        intersect = true;
                        break;
                    }
                }
            }
            if (!intersect) {
                points.push(point);
            }
            if (points.length >= count) break;
        }
        for (let p of points) {
            let effectHandle: effect = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, p.x, p.y);
            EXEffectMatScale(effectHandle, scale, scale, scale);
            BaseUtil.runLater(duration, () => {
                DestroyEffect(effectHandle);
                if (callback) {
                    callback(p.x, p.y);
                }
            })
        }
    }

    /**在指定单位处显示一个预警框*/
    public static warningAtPoint(whichUnit: unit, duration: number, range: number = 1000, callback?: (x: number, y: number) => void, effectArt?: string): void {
        let x: number = GetUnitX(whichUnit);
        let y: number = GetUnitY(whichUnit);
        let angle: number = GetUnitFacing(whichUnit);
        let scale: number = range / this.warningModelSize;
        let effectHandle: effect = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, x, y);
        EXEffectMatScale(effectHandle, scale, scale, scale);
        EXEffectMatRotateZ(effectHandle, angle);
        BaseUtil.runLater(duration, () => {
            DestroyEffect(effectHandle);
            if (callback) {
                callback(x, y);
            }
        })
    }

    /**在指定单位前方显示数个直线型预警框*/
    public static warningsFacing(whichUnit: unit, duration: number, length: number = 1000, width: number = 100, callback?: (x: number, y: number) => void, effectArt?: string): void {
        let trigX: number = GetUnitX(whichUnit);
        let trigY: number = GetUnitY(whichUnit);
        let angle: number = GetUnitFacing(whichUnit);
        let distance: number = width / 2;
        let scale: number = width / this.warningModelSize;
        BaseUtil.onTimer(0.03, () => {
            if (distance < length) {
                let x: number = trigX + distance * CosBJ(angle);
                let y: number = trigY + distance * SinBJ(angle);
                let effectHandle: effect = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, x, y);
                EXEffectMatScale(effectHandle, scale, scale, scale);
                EXEffectMatRotateZ(effectHandle, angle);
                BaseUtil.runLater(duration, () => {
                    DestroyEffect(effectHandle);
                    if (callback) {
                        callback(x, y);
                    }
                })
            } else {
                return false;
            }
            distance += width;
            return true;
        })
    }

    /**在指定单位前方显示数个扇型预警框*/
    public static warningsSector(whichUnit: unit, duration: number, length: number = 1000, maxAngle: number = 120, interval?: number, callback?: (x: number, y: number) => void, effectArt?: string): void {
        let trigX: number = GetUnitX(whichUnit);
        let trigY: number = GetUnitY(whichUnit);
        let trigFacing: number = GetUnitFacing(whichUnit);
        let distance: number = 50;
        let scale: number = 100 / this.warningModelSize;
        let func1: (angle: number) => void = function (angle: number) {
            let x: number = trigX + distance * CosBJ(angle);
            let y: number = trigY + distance * SinBJ(angle);
            let effectHandle: effect = AddSpecialEffect(effectArt ?? WarningUtil.warningModelPath, x, y);
            EXEffectMatScale(effectHandle, scale, scale, scale);
            EXEffectMatRotateZ(effectHandle, angle);
            BaseUtil.runLater(duration, () => {
                DestroyEffect(effectHandle);
                if (callback) {
                    callback(x, y);
                }
            })
        }
        let func2: () => void = function () {
            func1(trigFacing);
            let delta: number = 2 * math.asin(50.0 / distance);
            for (let angle: number = trigFacing - delta; angle >= trigFacing - maxAngle / 2.0; angle -= delta) {
                func1(angle);
            }
            for (let angle: number = trigFacing + delta; angle <= trigFacing + maxAngle / 2.0; angle += delta) {
                func1(angle);
            }
        }
        if (interval) {
            BaseUtil.onTimer(interval, () => {
                if (distance < length) {
                    func2();
                } else {
                    return false;
                }
                distance += 100;
                return true;
            })
        } else {
            for (; distance < length; distance += 100) {
                func2();
            }
        }
    }
}