import Actor from "@/Actor";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import UnitUtil from "@/UnitUtil";
import BaseUtil from "@/BaseUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_主炮存档A} from "../../xlsx/存档/主炮存档A";
import {d_主炮存档B} from "../../xlsx/存档/主炮存档B";
import {d_主炮存档C} from "../../xlsx/存档/主炮存档C";
import PlatUtil from "@/PlatUtil";
import 魔改道具 from "../商城/魔改道具";
import 主炮演员属性实时刷新提示 from "./主炮演员属性实时刷新提示";

export default class 主炮基础事件 {
    static onUnitChange(actor: Actor, unit?: unit): AutoMissileAttackController {
        // print("onUnitChange"+actor.getName())
        //销毁旧的数据
        if (actor.autoMissileAttackController) {
            (actor.autoMissileAttackController as AutoMissileAttackController).destroy();
            actor.autoMissileAttackController = null;
        }
        //添加新的 自动攻击控制器
        if (unit != null && UnitUtil.isHero(unit)) {
            let actorType = actor.actorType;
            let ctrl = new AutoMissileAttackController(unit);
            // ctrl.onBeforeLaunchMissile = (c, t) => {
            //     if (!ActorAbilityUtil.isUnitHasActorAbility(c.unit, actorType.id)) {
            //         c.destroy();
            //         return false;
            //     }
            //     return true;
            // };
            ctrl.range = actorType.sc_射程;
            if (actorType.stateFormula == null) {
                log.errorWithTraceBack("没有伤害公式!")
            }

            ctrl.coolDown = actorType.ss_射速;
            ctrl.speed = Math.max(1000 / ctrl.coolDown, 1500);
            //复制一份 以免修改单独的主炮 影响到主炮类型了
            ctrl.damageStateFormula = {...actorType.stateFormula};
            ctrl.damageName = actorType.name;
            if (actorType.missileModel) {
                ctrl.projectileModelPath = actorType.missileModel;
            }
            ctrl.targetCount = actorType.最大目标数量 || 1;
            ctrl.colorR = actorType.colorR || 255;
            ctrl.colorG = actorType.colorG || 255
            ctrl.colorB = actorType.colorB || 255;
            ctrl.alpha = actorType.alpha || 255;
            actor.autoMissileAttackController = ctrl;
            ctrl.start();
            //延迟加强 以与其他修改了主炮效果的叠加 todo 麦哲伦可能会覆盖这个加强
            BaseUtil.runLater(0.1, () => {
                if (!IsHandle(actor.unit) || actor.isDestroyed()) {
                    return;
                }
                主炮基础事件.主炮存档道具加强(actor);
                if (actor.actorType.class == "主炮") {
                    魔改道具.主炮商城道具加强(actor);
                }
                主炮演员属性实时刷新提示.刷新提示(actor)
            })

        }
        return actor.autoMissileAttackController;
    };

    static onDestroy(actor: Actor) {
        if (actor.autoMissileAttackController) {
            (actor.autoMissileAttackController as AutoMissileAttackController).destroy();
            actor.autoMissileAttackController = null;
        }
    };


    /**
     * 主炮存档道具 加强
     */

    /*
    存档A（都是对应主炮）	"存档B（都是对应主炮）
射速=1时，+20%的射速，实际射速=1/1.2=0.833"	存档C（都是对应主炮）
主炮伤害+30%	主炮射速+20%	主炮射程+200

通关后随机获得主炮加强存档。\n" +
                "主炮存档属性可以升级，每次提升原本的10%，到达5级的时候额外获得本效果+100%，到达10级增加三维100，到达15级增加20%全属性加成\n" +
                "存档最大等级受到地图等级限制
     */
    private static 主炮存档道具加强(actor: Actor) {
        if (actor == null || actor.actorType.index == null || actor.unit == null) {
            return;
        }
        if (actor.actorType.class != "主炮") {
            return false;
        }
        let ctrl: AutoMissileAttackController = actor.autoMissileAttackController
        if (ctrl == null) {
            return
        }
        //
        let player = actor.unitOwner
        let index = actor.actorType.index
        let maxLimit = PlatUtil.getMapLevel(player) * 2;
        //存档A 主炮伤害+30%
        let cdVal = ArchiveUtil.get(player, "_zp_a_" + index);
        if (cdVal && cdVal > 0) {
            cdVal = Math.min(cdVal, maxLimit);
            //0.3
            let v = d_主炮存档A[index].value
            let xs = (1 + cdVal * 0.1);
            if (cdVal >= 5) {
                xs += 1;
            }
            主炮基础事件.属性附加效果(actor, cdVal);
            if (ctrl.damageStateFormula) {
                ctrl.damageStateFormula.increased = (ctrl.damageStateFormula.increased || 0) + (v * xs);
            }
            print(actor.getName() + "获得主炮存档伤害增强：" + v)
        }
        //存档B 主炮射速+20%
        cdVal = ArchiveUtil.get(player, "_zp_b_" + index);
        if (cdVal && cdVal > 0) {
            cdVal = Math.min(cdVal, maxLimit)
            let v = d_主炮存档B[index].value
            let xs = (1 + cdVal * 0.1);
            if (cdVal >= 5) {
                xs += 1;
            }
            主炮基础事件.属性附加效果(actor, cdVal);
            ctrl.coolDown *= (1 - v * xs);
            if (ctrl.coolDown < 0.05) {
                ctrl.coolDown = 0.05;
            }
            print(actor.getName() + "获得主炮射速：" + v)
        }
        //存档C 主炮射程+200
        cdVal = ArchiveUtil.get(player, "_zp_c_" + index);
        if (cdVal && cdVal > 0) {
            cdVal = Math.min(cdVal, maxLimit)
            let xs = (1 + cdVal * 0.1);
            if (cdVal >= 5) {
                xs += 1;
            }
            主炮基础事件.属性附加效果(actor, cdVal);
            let v = d_主炮存档C[index].value
            ctrl.range += (v * xs)
            print(actor.getName() + "获得主炮射程：" + v);
        }


    }

    static 属性附加效果(actor: Actor, level: number) {
        //到达10级增加三维1000，到达15级增加10%全属性加成
        if (level >= 10) {
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.full_property = (actor.attribute.full_property || 0) + 100
        }
        if (level >= 15) {
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.full_property_p = (actor.attribute.full_property_p || 0) + 0.2
        }

    }

}