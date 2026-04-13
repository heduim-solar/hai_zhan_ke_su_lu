import ActorTypeUtil from "@/ActorTypeUtil";
import EffectUtil from "@/EffectUtil";
import UnitStateUtil from "@/UnitStateUtil";
import MathUtil from "@/MathUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import ActorUtil from "@/ActorUtil";
import 魔改道具 from "../商城/魔改道具";

export default class 旋转飞轮号基础技能 {


    constructor() {
        /**
         * "旋转飞轮号
         * 每拥有一个主炮，旋转飞轮号会拥有一个飞轮进行环绕。飞轮伤害频率为0.3s/次。
         * 每次触碰造成攻击力x1的伤害。"
         */
        let actorType = ActorTypeUtil.getActorType("旋转飞轮号基础技能");
        actorType.interval = 0.05
        actorType.onUnitChange = (actor, unit) => {
            let effects: effect[] = actor.effects;
            if (IsHandle(unit)) {
                if (effects == null) {
                    effects = [];
                    actor.effects = effects;
                }
                let modelPath = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdl"
                let modelScale = actor.get("modelScale", 1);
                let zpCount = ActorUtil.getUnitAllActorListByClass(actor.unit, "主炮")?.length || 0;
                if (魔改道具.主炮是否拥有魔改道具(actor)) {
                    zpCount += 3;
                }
                for (let i = 0; i < zpCount; i++) {
                    let effect = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale);
                    effects.push(effect);
                }
            } else {
                if (effects) {
                    for (let effect of effects) {
                        EffectUtil.destroyEffectNoDeathAnim(effect);
                    }
                    actor.effects = null;
                }
            }
        }
        actorType.onUnitInterval = (actor) => {
            actor.aface = (actor.aface || 0) - 10;
            if (actor.aface <= -360) {
                actor.aface = 0;
            }
            let effects: effect[] = actor.effects;
            let faceGap = 360 / effects.length;
            if (effects) {
                //
                let damage = UnitStateUtil.calculateStateFormula({attack: 0.2}, actor.unit);
                //
                let loc: Vector = null;
                for (let i = 0; i < effects.length; i++) {
                    let effect = effects[i];
                    loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + (faceGap * i));
                    EXSetEffectXY(effect, loc.x, loc.y);
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y);
                }
            }


        }


    }


}