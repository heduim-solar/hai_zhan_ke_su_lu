import Projectile from "@/Projectile";
import STimer from "@/STimer";
import DamageType from "@/DamageType";
import WeaponType from "@/WeaponType";
import AttributeUtil from "@/AttributeUtil";
import SelectUtil from "@/SelectUtil";
import MathUtil from "@/MathUtil";
import UnitStateUtil from "@/UnitStateUtil";

declare global {
    interface AppAttribute {
        /** 最大目标数量增加  */
        autoMissileAttackTargetCount?: number
        /** 射速增幅 1=1倍  */
        autoMissileAttackSpeed?: number
        /** 范围增强   */
        autoMissileAttackRange?: number
        /** 范围增强比例  0.5=增加50%射程   */
        autoMissileAttackRange_p?: number
    }
}
/**
 * 自动弹道攻击 (比如凤凰火焰)
 */
export default class AutoMissileAttackController implements Destroyable {
    static defaultRangeMaxLimit: number = 3000
    unit: unit;
    rangeMaxLimit?: number;
    range: number = 1000
    /** 扩展的范围 实际范围=range+extRange 方便组装范围控制逻辑 如A杖类型的物品 提高部分技能的范围 */
    extRange: number = 0
    coolDown: number = 1;
    /** 投射物 速度 */
    speed: number = 1000;
    targetCount: number = 1
    //伤害公式不为空的时候会自动造成公式算法的伤害
    damageStateFormula: StateFormula
    damageName?: string
    projectileModelPath: string
    /** 投射物特效模型大小缩放 */
    projectileModelScale: number = 1;
    /** 颜色rgb max=255 */
    colorR: number = 255
    colorG: number = 255
    colorB: number = 255
    /** 透明度 max=255 */
    alpha: number = 255
    damageTypeId: number = DamageType.s_法术;
    weaponTypeID: number = WeaponType.T0_WHOKNOWS;
    attackType: attacktype = ATTACK_TYPE_CHAOS
    /** 当更新时 */
    onUpdate: (controller: AutoMissileAttackController) => void
    /** 当准备发射追踪投射物时 返回false取消发射 返回true继续*/
    onBeforeLaunchMissile: (controller: AutoMissileAttackController, target: unit) => boolean
    /** 当发射追踪投射物时 可在这里修改具体的 */
    onLaunchMissile: (controller: AutoMissileAttackController, projectile: Projectile) => void
    onHitTarget: (projectile: Projectile) => void
    //
    sTimer: STimer = new STimer();
    private _isDestroy: boolean = false;
    //上次发射时间
    private _lastLaunchTime: number = 0;

    /** 任意附加数据 */
    [key: string]: any

    constructor(unit: unit, projectileModelPath: string = "Abilities\\Weapons\\RocketMissile\\RocketMissile.mdx", damageStateFormula?: StateFormula, onHitTarget?: (projectile: Projectile) => void) {
        this.unit = unit;
        this.projectileModelPath = projectileModelPath;
        this.damageStateFormula = damageStateFormula;
        this.onHitTarget = onHitTarget;
    }


    start() {
        this.sTimer.start(0.05, () => {
            if (this._isDestroy) {
                this.sTimer.destroy();
                return
            }
            //
            if (!UnitStateUtil.isAlive(this.unit)) {
                return;
            }
            //
            this.onUpdate?.(this);
            //
            let autoMissileAttackSpeed = AttributeUtil.getUnitAttribute(this.unit, false)?.autoMissileAttackSpeed || 0
            let cd = this.coolDown / (autoMissileAttackSpeed + 1)
            //判断是否在cd中
            if (_g_time - this._lastLaunchTime < (cd * 1000)) {
                return;
            }
            //准备发射
            this.doLaunchMissile();
            this._lastLaunchTime = _g_time;
        }, true)

    }

    getRealRange(): number {
        let range = this.range + this.extRange;
        let unitAttribute = AttributeUtil.getUnitAttribute(this.unit, false);
        if (unitAttribute) {
            if (unitAttribute.autoMissileAttackRange) {
                range += unitAttribute.autoMissileAttackRange;
            }
            if (unitAttribute.autoMissileAttackRange_p) {
                range *= (1 + unitAttribute.autoMissileAttackRange_p);
            }
        }
        range = math.min(range, this.rangeMaxLimit || AutoMissileAttackController.defaultRangeMaxLimit)
        return range;
    }

    getRealTargetCount(): number {
        let targetCount = this.targetCount;
        let unitAttribute = AttributeUtil.getUnitAttribute(this.unit, false);
        if (unitAttribute) {
            if (unitAttribute.autoMissileAttackTargetCount) {
                targetCount += unitAttribute.autoMissileAttackTargetCount;
            }
        }
        return targetCount;
    }

    private doLaunchMissile() {
        let range = this.getRealRange();
        let enemyUnits = SelectUtil.getEnemyUnitsInRange(this.unit, range);
        if (enemyUnits == null || enemyUnits.length == 0) {
            return
        }
        let x = GetUnitX(this.unit)
        let y = GetUnitY(this.unit)
        //按距离 由近到远
        enemyUnits.sort((a, b) => {
            let aD: number = MathUtil.distanceBetweenPoints(x, y, GetUnitX(a), GetUnitY(a));
            let bD: number = MathUtil.distanceBetweenPoints(x, y, GetUnitX(b), GetUnitY(b));
            return aD - bD;
        });

        let realTargetCount = this.getRealTargetCount();
        for (let i = 0; i < realTargetCount && i < enemyUnits.length; i++) {
            let targetUnit = enemyUnits[i];
            //准备发射导弹
            if (this.onBeforeLaunchMissile) {
                let b = this.onBeforeLaunchMissile(this, targetUnit);
                //检查是否在监听里销毁了此类
                if (this._isDestroy) {
                    return;
                }
                if (b == false) {
                    continue;
                }
            }
            //发射导弹
            let damage = 0
            if (this.damageStateFormula) {
                damage = UnitStateUtil.calculateStateFormula(this.damageStateFormula, this.unit, targetUnit)
            }
            let projectile: Projectile = new Projectile(this.unit, targetUnit, damage, this.projectileModelPath, this.onHitTarget);
            projectile.speed = this.speed
            projectile.damageName = this.damageName
            projectile.projectileModelScale = this.projectileModelScale
            projectile.colorR = this.colorR
            projectile.colorG = this.colorG
            projectile.colorB = this.colorB
            projectile.alpha = this.alpha
            //
            if (this.onLaunchMissile) {
                this.onLaunchMissile(this, projectile);
                //检查是否在监听里销毁了此类
                if (this._isDestroy) {
                    return;
                }
            }
            projectile.start()
        }
    }


    destroy() {
        this._isDestroy = true;
        this.sTimer.destroy();
    }


}