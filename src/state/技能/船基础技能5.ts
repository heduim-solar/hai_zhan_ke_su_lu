import ActorTypeUtil from "@/ActorTypeUtil";
import PlayerUtil from "@/PlayerUtil";
import AttributeUtil from "@/AttributeUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";
import DataBase from "@/DataBase";
import 魔改道具 from "../商城/魔改道具";
import EffectUtil from "@/EffectUtil";
import UnitStateUtil from "@/UnitStateUtil";
import MathUtil from "@/MathUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import GameUtil from "@/GameUtil";
import ActorUtil from "@/ActorUtil";

export default class 船基础技能5 {


    constructor() {
        let actorType: AppActorType = null;

        /**
         * 团结号
         * 全图队友造成伤害+50%，受到伤害-10%"
         */
        actorType = ActorTypeUtil.getActorType("团结号基础技能");
        actorType.onCreated = (actor) => {
            PlayerUtil.forUsers(player => {
                if (sd(player).团结号基础技能加成 != true) {
                    let playerAttribute = AttributeUtil.getPlayerAttribute(player, true);
                    playerAttribute.damage_increased = (playerAttribute.damage_increased || 0) + 0.5;
                    playerAttribute.damage_reduction = (playerAttribute.damage_increased || 0) + 0.1;
                    sd(player).团结号基础技能加成 = true;
                }

            })
        }
        actorType.onDestroy = (actor) => {
            let hasAbili = false;
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                if (ActorUtil.isUnitHasActor(hero, "团结号基础技能")) {
                    hasAbili = true;
                }

            })
            if (hasAbili == false) {
                PlayerUtil.forUsers(player => {
                    if (sd(player).团结号基础技能加成 == true) {
                        let playerAttribute = AttributeUtil.getPlayerAttribute(player, true);
                        playerAttribute.damage_increased = (playerAttribute.damage_increased || 0) - 0.5;
                        playerAttribute.damage_reduction = (playerAttribute.damage_increased || 0) - 0.1;
                        sd(player).团结号基础技能加成 = false;
                    }
                });
            }
        }


        /**
         * "萧炎号
         * 如果是10级后进化成萧炎号，当前属性立马翻倍，仅生效一次。"
         */
        actorType = ActorTypeUtil.getActorType("萧炎号基础技能");
        actorType.onCreated = (actor) => {
            if (actor.unitLevel >= 10 && DataBase.getPlayerSolarData(actor.unitOwner, false)?.萧炎号基础技能属性翻倍 == null) {
                DataBase.getPlayerSolarData(actor.unitOwner, true).萧炎号基础技能属性翻倍 = true
                HeroUtil.addHeroPropertyP(actor.unit, false, 1);
                TextTagUtil.textWarn("属性翻倍!", actor.unit);
            }
        }
        /**
         * 练习生基础技能
         */
        actorType = ActorTypeUtil.getActorType("练习生基础技能");
        actorType.interval = 0.05
        actorType.onUnitChange = (actor, unit) => {
            if (IsHandle(unit)) {
                let modelPath = "单位\\练习生\\篮球.mdx"
                actor.effect = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY)
                actor.effect2 = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY)
                actor.effect3 = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY)
            } else {
                if (actor.effect != null) {
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect)
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect2)
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect3)
                    actor.effect = null;
                }
            }
        }
        actorType.onUnitInterval = (actor) => {
            actor.aface = (actor.aface || 0) + 8;
            if (actor.aface <= -360) {
                actor.aface = 0;
            }
            if (actor.effect) {
                //
                let damage = UnitStateUtil.calculateStateFormula({agi: 1}, actor.unit);
                //
                let loc: Vector = null;

                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface)
                EXSetEffectXY(actor.effect, loc.x, loc.y);
                let gd = GameUtil.getTerrainHeight(loc.x, loc.y) + 50
                EXSetEffectZ(actor.effect, gd);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 120)
                EXSetEffectXY(actor.effect2, loc.x, loc.y);
                EXSetEffectZ(actor.effect2, gd);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 240)
                EXSetEffectXY(actor.effect3, loc.x, loc.y)
                EXSetEffectZ(actor.effect3, gd);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)

            }


        }

    }


}