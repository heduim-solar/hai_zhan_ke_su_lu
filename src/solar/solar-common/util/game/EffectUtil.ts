import TargetAttach from "@/TargetAttach";
import BaseUtil from "@/BaseUtil";

export default class EffectUtil {


    /**
     * 新建特效(创建到坐标)
     */
    static addSpecialEffect(modelName: string, x: number, y: number, size?: number, displayPlayer?: player): effect {
        if (displayPlayer == null) {//没有指定显示玩家
            //判断游戏设置 是否关闭了特效显示
            if (settings.isEffectDisplay == false) {
                return AddSpecialEffect("", x, y)
            } else {
                let e = AddSpecialEffect(modelName, x, y)
                if (size != null) {
                    EXSetEffectSize(e, size);
                    SetPariticle2Size?.(e, size);
                }
                return e;
            }
        } else {//指定了显示玩家
            //判断游戏设置 是否关闭了特效显示
            if (displayPlayer == GetLocalPlayer()) {
                let e = AddSpecialEffect(modelName, x, y)
                if (size != null) {
                    EXSetEffectSize(e, size);
                    SetPariticle2Size?.(e, size);
                }
                return e;
            } else {
                return AddSpecialEffect("", x, y)
            }
        }
    }

    /**
     * 新建特效(创建到坐标) 并且销毁它 (显示其动画)
     */
    static addSpecialEffectAndDestroy(modelName: string, x: number, y: number, size?: number, lifeTime?: number): void {
        let effect = EffectUtil.addSpecialEffect(modelName, x, y, size);
        if (lifeTime == null || lifeTime == 0) {
            DestroyEffect(effect);
        } else {
            BaseUtil.runLater(lifeTime, () => {
                DestroyEffect(effect);
            })
        }
    }

    /**
     * 新建特效(创建到单位)
     */
    static addSpecialEffectTarget(modelName: string, targetWidget: widget, attachPointName: string = TargetAttach.origin, size?: number): effect {
        if (settings.isEffectDisplay == false) {
            return AddSpecialEffectTarget("", targetWidget, attachPointName)
        } else {
            let e = AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
            if (size != null) {
                EXSetEffectSize(e, size);
                SetPariticle2Size?.(e, size);
            }
            return e;
        }
    }

    /**
     * 新建特效(创建到单位) 并且销毁它 (显示其动画)
     */
    static addSpecialEffectTargetAndDestroy(modelName: string, targetWidget: widget, attachPointName: string = TargetAttach.origin,
                                            size?: number, lifeTime?: number): void {
        let effect = EffectUtil.addSpecialEffectTarget(modelName, targetWidget, attachPointName, size);
        if (lifeTime == null || lifeTime == 0) {
            DestroyEffect(effect);
        } else {
            BaseUtil.runLater(lifeTime, () => {
                DestroyEffect(effect);
            })
        }
    }


    /**
     * 设置特效朝向 注意会清空旋转旧值
     * @param effect
     * @param facingAngle
     */
    static setEffectFacing(effect: effect, facingAngle: number) {
        EXEffectMatReset(effect)
        EXEffectMatRotateZ(effect, facingAngle)
    }

    /**
     * 销毁特效 不显示死亡动画 (目前通过缩放并 移动到地面一下来实现)
     * @param effect
     */
    static destroyEffectNoDeathAnim(effect: effect) {
        EXSetEffectSize(effect, 0)
        // SetPariticle2Size?.(effect, 0)
        EXSetEffectZ(effect, -5000)
        DestroyEffect(effect)
    }

}