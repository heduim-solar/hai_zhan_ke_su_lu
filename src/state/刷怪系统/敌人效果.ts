import {d_大触须} from "../../xlsx/单位/大触须";
import UnitUtil from "@/UnitUtil";
import RectUtil from "@/RectUtil";
import RandomUtil from "@/RandomUtil";
import ActorItemUtil from "@/ActorItemUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorUnit from "@/ActorUnit";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorBuff from "@/ActorBuff";
import DamageRecordUtil from "@/DamageRecordUtil";
import EffectUtil from "@/EffectUtil";
import DamageType from "@/DamageType";
import MathUtil from "@/MathUtil";

export default class 敌人效果 {


    constructor() {
        se.onEnterRect(gg_rct_left_top, e => {
            let trigUnitOwnerId = e.trigUnitOwnerId;
            if (trigUnitOwnerId > 6 && trigUnitOwnerId < 12) {
                let loc = RectUtil.getRandomDeepWaterXYInRect(gg_rct_right_down);
                IssuePointOrder(e.trigUnit, "patrol", loc.x, loc.y);
            }
        })
        se.onEnterRect(gg_rct_right_down, e => {
            let trigUnitOwnerId = e.trigUnitOwnerId;
            if (trigUnitOwnerId > 6 && trigUnitOwnerId < 12) {
                let loc = RectUtil.getRandomDeepWaterXYInRect(gg_rct_map);
                IssuePointOrder(e.trigUnit, "patrol", loc.x, loc.y);
            }
        })


        se.onUnitDeath(e => {
            let trigUnitOwnerId = e.trigUnitOwnerId;
            if (trigUnitOwnerId > 6 && trigUnitOwnerId < 12) {
                let trigUnit = e.trigUnit;
                if (UnitUtil.isHero(trigUnit)) {
                    if (RandomUtil.isInChance(0.1)) {
                        ActorItemUtil.createActorItem("解放之鼓", e.trigUnitX, e.trigUnitY)
                    }
                    let x = e.trigUnitX;
                    let y = e.trigUnitY;
                    BaseUtil.runLater(1, (count) => {
                        if (count == 3) {
                            CreateUnit(Player(11), d_大触须[0].id, x, y, 0)
                        }
                        TextTagUtil.textWarn("大触须" + (3 - count), trigUnit)
                    }, 3)

                }
            }
        });

        //
        let actorUnitType: AppActorType = null;
        //one case
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-外星堡垒伞兵");
        actorUnitType.onCreated = actor => {
            let au = actor as ActorUnit
            au.applyTimedLife(5)
        }
        //one case
        //攻击有15%概率击晕0.5s，并造成1000额外伤害。
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-海龟");
        actorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.15)) {
                event.resultDamage += 1000
                UnitStateUtil.stunUnit(enemy, 0.5);
            }
        }

        //one case
        //攻击20%3倍暴击并击晕1秒。
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-触手");
        actorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.2)) {
                event.resultDamage *= 3
                UnitStateUtil.stunUnit(enemy, 1);
            }
        }

        //one case
        //攻击附带30%的减速。
        ActorTypeUtil.registerActorType({
            id: "飞蛇怪减速",
            name: "飞蛇怪减速30%",
            icon: "ReplaceableTextures\\CommandButtons\\BTNAntiMagicShell.blp",
            attribute: {
                move_speed_p: -0.3
            },
            dur: 2,
        })
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-飞蛇");
        actorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            ActorBuffUtil.addActorBuff(enemy, "飞蛇怪减速")
        }
        //攻击20%击晕1秒。
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-深海眷族");
        actorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.2)) {
                UnitStateUtil.stunUnit(enemy, 1);
            }
        }


        // 攻击附带毒素，每秒攻击力x1的真实伤害，多个来源可叠加，持续5秒，这个毒素不致死。
        ActorTypeUtil.registerActorType({
            id: "刺蛇毒素",
            name: "刺蛇毒素",
            describe: "每秒受到刺蛇攻击力x1的真实伤害，可叠加，持续5秒，这个毒素不致死。",
            icon: "ReplaceableTextures\\CommandButtons\\BTNEnvenomedSpear.blp",
            interval: 1,
            model: "Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdx",
            dur: 5,
            levelMax: -1,
            onUnitInterval: actor => {
                let actorBuff = actor as ActorBuff;
                let life = UnitStateUtil.getLife(actorBuff.unit) - 1;
                if (life <= 0) {
                    return
                }
                if (!IsHandle(actorBuff.caster) || !UnitStateUtil.isAlive(actorBuff.caster)) {
                    return;
                }
                let damage = UnitStateUtil.getDamageMax(actorBuff.caster) * actorBuff.level;
                damage = Math.min(damage, life);
                UnitStateUtil.addLife(actorBuff.unit, -damage);
            }
        })
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-刺蛇");
        actorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            ActorBuffUtil.addActorBuff(enemy, "刺蛇毒素", actor.unit)
        }


        //被攻击时瞬移到目标身边，并增加100%攻速移速，冷却5秒。
        ActorTypeUtil.registerActorType({
            id: "黑影瞬移",
            name: "黑影瞬移",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBanish.blp",
            attribute: {
                attack_p: 1,
                move_speed_p: 1,
            },
            dur: 3,
        })
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-黑影");
        actorUnitType.onUnitDamaged = (actor, enemy, event) => {
            actor.ifReady(5, () => {
                SetUnitPosition(actor.unit, GetUnitX(enemy), GetUnitY(enemy))
                SetUnitFacing(actor.unit, MathUtil.angleBetweenCoords(actor.unitX, actor.unitY, GetUnitX(enemy), GetUnitY(enemy)))
                ActorBuffUtil.addActorBuff(actor.unit, "黑影瞬移")
            })
        }
        //特殊：死亡后，延迟2秒，对600范围造成攻击力x10的真实伤害。
        actorUnitType = ActorTypeUtil.getActorType("进攻怪-扭曲体");
        actorUnitType.onUnitDeath = (actor, killingUnit) => {
            let damage = UnitStateUtil.calculateStateFormula({attack: 10}, actor.unit);
            let x = actor.unitX;
            let y = actor.unitY;
            BaseUtil.runLater(2, (c) => {
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_真实伤害)
                EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\瘟疫号基础技能.mdx",
                    x, y, 1);
            });
        }


    }


}