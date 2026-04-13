import ActorTypeUtil from "@/ActorTypeUtil";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";
import BaseUtil from "@/BaseUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageType from "@/DamageType";
import RandomUtil from "@/RandomUtil";
import MathUtil from "@/MathUtil";
import Projectile from "@/Projectile";
import ActorAbility from "@/ActorAbility";
import TargetAttach from "@/TargetAttach";
import VestUtil from "@/VestUtil";
import TextTagUtil from "@/TextTagUtil";
import 魔改道具 from "../商城/魔改道具";
import UnitRewardUtil from "@/UnitRewardUtil";
import MapUtil from "../../util/MapUtil";
import HeroUtil from "@/HeroUtil";

export default class 船基础技能4 {


    //new add
    constructor() {

        let actorType: AppActorType = null;

        /**
         * 雷雨号
         * 将天气锁定为雷雨天持续30秒，冷却60。
         */
        ActorTypeUtil.registerActorType({
            id: "雷雨天气",
            name: "雷雨天气",
            describe: "该单位受到雷雨天气影响，会受到部分技能额外效果！",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBlizzard.blp",
            dur: 3,
        })
        //one case
        actorType = ActorTypeUtil.getActorType("雷雨号基础技能");
        actorType.onAction = (actor) => {
            let effect = EffectUtil.addSpecialEffect(actor.get("model", "model\\特效\\下雨.mdx"), actor.unitX, actor.unitY,
                actor.get("modelScale", 5));
            let x = actor.unitX;
            let y = actor.unitY;
            BaseUtil.runLater(2, (c) => {
                SelectUtil.forUnitsInRange(x, y, 2000, u => {
                    ActorBuffUtil.addActorBuff(u, "雷雨天气")
                })
                if (c >= 15) {
                    EffectUtil.destroyEffectNoDeathAnim(effect)
                }
            }, 15, true)

        }
        /**
         * 狂风呼啸号
         * 在目标点生成龙卷风，对450范围内的敌人每0.1秒造成200+敏捷x0.5的伤害，持续20秒。冷却20秒。
         */
        actorType = ActorTypeUtil.getActorType("狂风呼啸号基础技能");
        actorType.onAction = (actor, x, y, targetUnit) => {
            let effect = EffectUtil.addSpecialEffect(actor.get("model", "model\\特效\\龙卷风.mdx"), x, y,
                actor.get("modelScale", 1));
            BaseUtil.runLater(0.1, (c) => {
                let damage = UnitStateUtil.calculateStateFormula({base: 200, agi: 0.5}, actor.unit)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 450, damage, DamageType.s_法术, x, y)
                if (c >= 200) {
                    EffectUtil.destroyEffectNoDeathAnim(effect)
                }
            }, 200, true)

        }
        /**
         * 刀扇号
         * 被攻击时15%概率触发刀扇。
         */
        actorType = ActorTypeUtil.getActorType("刀扇号基础技能");
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (RandomUtil.isInChance(0.15)) {
                let baseDamage = UnitStateUtil.calculateStateFormula({attack: 5}, actor.unit);
                let projectile = new Projectile(actor.unit, damageSource)
                projectile.projectileModelPath = "model\\主炮投射物\\循环刀扇光.mdx"
                projectile.speed = 400
                projectile.onHitTarget = p => {
                    SelectUtil.forEnemyUnitsInRange(projectile.source, 600, u => {
                        let distance = MathUtil.distanceBetweenPoints(projectile.x, projectile.y, GetUnitX(u), GetUnitY(u));
                        let damage = baseDamage + ((600 - distance) / 100 * 0.5 * baseDamage)
                        DamageRecordUtil.damage(actor.getName(), projectile.source, u, damage)
                    }, projectile.x, projectile.y)
                }
                projectile.start();
            }
        }
        /**
         * 兽族兵营号
         * 耐久光环：范围攻速移速+50%
         */
        ActorTypeUtil.registerActorType({
            id: "兽族兵营号耐久光环",
            icon: "ReplaceableTextures\\PassiveButtons\\PASBTNCommand.blp",
            describe: "范围攻速移速+50%",
            attribute: {
                attack_p: 0.5,
                move_speed_p: 0.5,
            },
            dur: 3,
        })
        actorType = ActorTypeUtil.getActorType("兽族兵营号基础技能");
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            SelectUtil.forAllyUnitsInRange(actor.unit, 600, u => {
                ActorBuffUtil.addActorBuff(u, "兽族兵营号耐久光环")
            })
        }
        /**
         * 人族兵营号
         * 专注光环：范围护甲+500
         */
        ActorTypeUtil.registerActorType({
            id: "人族兵营号专注光环",
            icon: "ReplaceableTextures\\PassiveButtons\\PASBTNDevotion.blp",
            describe: "范围护甲+500",
            attribute: {
                def: 500,
            },
            dur: 3,
        })
        actorType = ActorTypeUtil.getActorType("人族兵营号基础技能");
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            SelectUtil.forAllyUnitsInRange(actor.unit, 600, u => {
                ActorBuffUtil.addActorBuff(u, "人族兵营号专注光环")
            })
        }

        /**
         * 科多号
         * 选中一个非BOSS单位吞噬并击杀，获得该单位的攻击和血量。持续45s。冷却60s。
         */
        ActorTypeUtil.registerActorType({
            id: "科多号吞噬buff",
            icon: "ReplaceableTextures\\CommandButtons\\BTNDevour.blp",
            describe: "该家伙吞噬了一个单位 获得该单位的一些攻击和血量",
            dur: 45,
        })
        actorType = ActorTypeUtil.getActorType("科多号基础技能");
        actorType.targetAllow = "ground,nonhero,enemy,organic,neutral,mechanical"
        actorType.onAction = (actor, x, y, targetUnit) => {
            if (GetPlayerId(GetOwningPlayer(targetUnit)) > 11) {
                TextTagUtil.textWarn("不能吞噬中立单位!", actor.unit)
                return
            }
            //科多号吞噬的单位可以提供50倍金钱。
            if (魔改道具.主炮是否拥有魔改道具(actor)) {
                let unitBounty = MapUtil.getUnitBounty(targetUnit);
                if (unitBounty && unitBounty > 0) {
                    let addGoldWithEarnGoldP = UnitRewardUtil.addGoldWithEarnGoldP(actor.unit, unitBounty);
                    TextTagUtil.textGold("+" + addGoldWithEarnGoldP, actor.unit)
                }
            }
            let add = HeroUtil.getHeroPrimaryValue(actor.unit, false) * 0.005;
            add = Math.floor(add) + 1;
            HeroUtil.addHeroProperty(actor.unit, add);
            TextTagUtil.text("提升基础属性+" + add, actor.unit)

            KillUnit(targetUnit)
            let actorBuff = ActorBuffUtil.addActorBuff(actor.unit, "科多号吞噬buff");
            actorBuff.attribute = {
                attack: MathUtil.min(UnitStateUtil.getDamageMax(targetUnit) / 10, UnitStateUtil.getDamageMax(actor.unit) * 5),
                life: MathUtil.min(UnitStateUtil.getMaxLife(targetUnit) / 100, UnitStateUtil.getDamageMax(actor.unit) * 5),
            }

        }
        /**
         * 冰霜巨龙
         * 每3秒冻结800范围1秒，造成智力x5的伤害
         */
        actorType = ActorTypeUtil.getActorType("冰霜巨龙基础技能");
        actorType.interval = 3;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({int: 5}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 800), damage)
            SelectUtil.forEnemyUnitsInRange(actor.unit, 800, u => {
                UnitStateUtil.stunUnit(u, 1)
            })
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\海皇波塞冬基础技能.mdx",
                actor.unitX, actor.unitY, 2)

        }
        /**
         * 黑龙
         * 黑龙死亡时会对600范围内敌人造成每秒攻击力x10的伤害，持续5秒。冷却20s。
         */
        actorType = ActorTypeUtil.getActorType("黑龙基础技能");
        actorType.onUnitDeath = (actor, killingUnit) => {
            actor.ifReady(20, () => {
                let damage = UnitStateUtil.calculateStateFormula({attack: 10}, actor.unit);
                let x = actor.unitX;
                let y = actor.unitY
                BaseUtil.runLater(1, (c) => {
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage)
                    EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\瘟疫号基础技能.mdx",
                        x, y, 1);
                }, 5, true);
                //可能被吞噬为buff了
                if(actor instanceof ActorAbility){
                    (actor as ActorAbility).setMaxCd(20);
                    (actor as ActorAbility).setCooldown(20);
                }

            })
        }

        /**
         * 神之号
         * 每秒对1000范围内的一个随机敌人造成攻击力x20的真实伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("神之号基础技能");
        actorType.interval = 1
        actorType.onUnitInterval = actor => {
            let enemyInRange = SelectUtil.getRandomEnemyInRange(actor.unit, 1000);
            if (!IsHandle(enemyInRange)) {
                return
            }
            let damage = UnitStateUtil.calculateStateFormula({attack: 20}, actor.unit);
            DamageRecordUtil.damage(actor.getName(), actor.unit, enemyInRange, damage, DamageType.s_物理)
            EffectUtil.addSpecialEffectTargetAndDestroy("圆形范围伤害特效\\devilslam.mdx", enemyInRange, TargetAttach.origin, 0.1)
        }
        /**
         * 剑圣
         * 允许普通攻击，攻击造成500%伤害，攻击时3%概率造成50倍暴击。
         * 分身：制造3个继承100%攻击，只受到50%伤害的分身。
         * 允许上岸
         */
        //one case
        actorType = ActorTypeUtil.getActorType("剑圣基础技能");
        actorType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            event.resultDamage *= 5;
            if (RandomUtil.isInChance(0.03)) {
                event.resultDamage *= 50;
                TextTagUtil.textWarn("暴击" + event.resultDamage, enemy)
            }
        }
        actorType.onAction = (actor) => {
            for (let i = 0; i < 3; i++) {
                VestUtil.createPhantomUnit(actor.unit, 15, 1, 0.5)
            }
        }
    }


}