import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "../主炮/主炮基础事件";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorItem from "@/ActorItem";
import RandomUtil from "@/RandomUtil";
import ActorItemUtil from "@/ActorItemUtil";
import UnitStateUtil from "@/UnitStateUtil";
import UnitUtil from "@/UnitUtil";
import TextTagUtil from "@/TextTagUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import MathUtil from "@/MathUtil";
import TerrainUtil from "@sl-wc3/TerrainUtil";
import RectUtil from "@/RectUtil";
import BaseUtil from "@/BaseUtil";
import SelectUtil from "@/SelectUtil";

export default class 船长物品2 {


    constructor() {

        let actorType: AppActorType = null;
        /**
         * 攻击力+6666
         * 射程：600
         * 伤害：5000+攻击力x8
         * 射速：2
         * 特殊：索隆的伤害会攻击600范围内所有单位，被索隆攻击的单位会受到30%的额外伤害，持续2秒。
         */

        actorType = ActorTypeUtil.getActorType("啦啦啦呀·索隆");
        ActorTypeUtil.registerActorType({
            id: "索隆额外伤害附加",
            icon: actorType.icon,
            attribute: {
                damage_reduction: -0.3,
            },
            model: "Abilities\\Spells\\Undead\\UnholyFrenzy\\UnholyFrenzyTarget.mdx",
            dur: 2

        })
        actorType.onUnitChange = (actor, unit) => {
            let controller = 主炮基础事件.onUnitChange(actor, unit);
            if (controller == null) {
                return
            }
            controller.onHitTarget = projectile => {
                let actorBuff = ActorBuffUtil.addActorBuff(projectile.target, "索隆额外伤害附加");
            }
        }
        //携带啦啦啦呀·索隆，每次攻击有0.5%的概率升级
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            if (RandomUtil.isInChance(0.005)) {
                //进阶黑胡子
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("月光·索隆", unit)
            }
        }

        actorType = ActorTypeUtil.getActorType("月光·索隆");
        actorType.onUnitChange = (actor, unit) => {
            let controller = 主炮基础事件.onUnitChange(actor, unit);
            if (controller == null) {
                return
            }
            controller.onHitTarget = projectile => {
                let actorBuff = ActorBuffUtil.addActorBuff(projectile.target, "索隆额外伤害附加");
                actorBuff.attribute.damage_reduction = -0.45;
            }
        }

        /**
         * 力量敏捷智力+5000，BOSS登场后，会立刻被削弱20%生命值并进入眩晕状态5秒。
         */
        actorType = ActorTypeUtil.getActorType("Nico·罗宾");
        actorType.onCreated = (actor) => {
            //会在演员销毁时 自动停止销毁这个触发器
            let solarTrigger = se.onUnitEnterMapRect((e, solarTrigger) => {
                if (!IsHandle(actor.unit)) {//检查是否被携带 buff 跟技能必定存在单位 物品形态可能在地上无单位
                    return
                }
                if (e.isHeroUnitTrig && e.trigUnitOwnerId > 4 && UnitStateUtil.getUnitLifeP(e.trigUnit) > 0.8) {
                    UnitStateUtil.setUnitLifeP(e.trigUnit, 0.8);
                    UnitStateUtil.stunUnit(e.trigUnit, 5);
                }
            });
            actor.childDestroyList.push(solarTrigger)
        };
        //携带Nico·罗宾击杀1个BOSS后进化
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            if (UnitUtil.isHero(deathEnemy)) {
                //进阶黑胡子
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("恶魔之子·罗宾", unit)
            }
        }
        /**
         * 力量敏捷智力+1W，BOSS登场后，会立刻被削弱25%生命值并进入眩晕状态5秒，击杀BOSS必定掉落解放之鼓。
         */
        actorType = ActorTypeUtil.getActorType("恶魔之子·罗宾");
        actorType.onCreated = (actor) => {
            //会在演员销毁时 自动停止销毁这个触发器
            let solarTrigger = se.onUnitEnterMapRect((e) => {
                if (!IsHandle(actor.unit)) {//检查是否被携带 buff 跟技能必定存在单位 物品形态可能在地上无单位
                    return
                }
                if (e.isHeroUnitTrig && e.trigUnitOwnerId > 5 && UnitStateUtil.getUnitLifeP(e.trigUnit) > 0.75) {
                    UnitStateUtil.setUnitLifeP(e.trigUnit, 0.75);
                    UnitStateUtil.stunUnit(e.trigUnit, 5);
                    //
                    let solarTrigger2 = se.onUnitDeath((e2) => {
                        ActorItemUtil.createActorItem("解放之鼓", e2.trigUnitX, e2.trigUnitY)
                    }, e.trigUnit);
                    actor.childDestroyList.push(solarTrigger2);
                }
            });
            actor.childDestroyList.push(solarTrigger);
        };
        /**
         * 力量+8000，生命值+50000，受到技能伤害减少50%，生命值即将归0的时，以1点血的状态生存5秒并免疫死亡，冷却30秒。
         */
        actorType = ActorTypeUtil.getActorType("咔噗");
        //被击杀时强行拥有1点生命值不死，持续5秒，每局生效一次。
        ActorTypeUtil.registerActorType({
            id: "咔噗免死",
            dur: 5,
            icon: actorType.icon,
            modelAttach: "Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl",
            onUnitDamaged: (actor, damageSource, event) => {
                EXSetEventDamage(0);
                event.consumed = true;
            }
        } as AppActorBuffType);
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (event.resultDamage < UnitStateUtil.getLife(actor.unit)) {
                return;
            }
            actor.ifReady(30, () => {
                EXSetEventDamage(0);
                event.consumed = true;
                UnitStateUtil.setLife(actor.unit, 1);
                ActorBuffUtil.addActorBuff(actor.unit, "咔噗免死");
                TextTagUtil.textWarn("咔噗免死5秒", actor.unit);
            })
        }
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(3000)
        }
        actorType.onUnitDamageEnemy = (actor) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            let actorItem = actor as ActorItem
            if (actorItem.addUses(-1) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("英雄·咔噗", unit)
            }
        }
        actorType = ActorTypeUtil.getActorType("英雄·咔噗");
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (event.resultDamage < UnitStateUtil.getLife(actor.unit)) {
                return;
            }
            actor.ifReady(20, () => {
                EXSetEventDamage(0);
                event.consumed = true;
                UnitStateUtil.setLife(actor.unit, 1);
                ActorBuffUtil.addActorBuff(actor.unit, "咔噗免死");
                TextTagUtil.textWarn("英雄·咔噗免死5秒", actor.unit);
            })
        }
        /**
         * 航速最大化，并且每秒对身边的敌人造成持续伤害，伤害为2500+15%生命值。
         */
        actorType = ActorTypeUtil.getActorType("山只");
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(100000)
        }
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 2500, hp: 0.15}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_物理, actor.unitX, actor.unitY)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model\\基本技能\\地震.mdx"), actor.unitX, actor.unitY,
                actor.get("modelScale", 0.9));
            //进阶
            if (!(actor instanceof ActorItem)) {
                return
            }
            let x = actor.unitX;
            let y = actor.unitY;
            //移动后
            let jl = MathUtil.distanceBetweenPoints(x, y, actor.lastX || x, actor.lastY || y);
            let actorItem = actor as ActorItem
            if (actorItem.addUses(-Math.floor(jl)) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("文斯莫克·山只", unit)
            }
            actor.lastX = x;
            actor.lastY = y;
        }
        /**
         * 航速最大化，免疫减速。并且每秒对身边的敌人造成持续伤害，伤害为5500+20%生命值。
         */
        actorType = ActorTypeUtil.getActorType("文斯莫克·山只");
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 5500, hp: 0.2}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_物理, actor.unitX, actor.unitY)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model\\基本技能\\地震.mdx"), actor.unitX, actor.unitY,
                actor.get("modelScale", 0.9));
        }
        /**
         * 获得神出鬼没的能力，点击使用可以朝一个方向位移距离800，冷却6秒。
         */
        actorType = ActorTypeUtil.getActorType("布鲁克");
        actorType.onAction = (actor, x, y, targetUnit) => {
            if (TerrainUtil.isTerrainLand(x, y)) {
                for (let i = 0; i < 10000; i++) {
                    x = x + GetRandomInt(-500, 500);
                    y = y + GetRandomInt(-500, 500);
                    if (!TerrainUtil.isTerrainLand(x, y) && RectUtil.isContainsCoords(bj_mapInitialPlayableArea, x, y)) {
                        break;
                    }
                }
            }
            let trigUnit = actor.unit;
            BaseUtil.runLater(0.1, () => {
                UnitUtil.transfer(trigUnit, x, y);
            })
        }
        actorType.onCreated = (actor) => {
            actor.sTimer = BaseUtil.runLater(15 * 60, () => {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("幽魂·布鲁克", unit)
            });

        }
        /**
         * 获得神出鬼没的能力，点击使用可以朝一个方向位移距离800，冷却6秒。
         */
        actorType = ActorTypeUtil.getActorType("幽魂·布鲁克");
        actorType.onAction = (actor, x, y, targetUnit) => {
            if (TerrainUtil.isTerrainLand(x, y)) {
                for (let i = 0; i < 10000; i++) {
                    x = x + GetRandomInt(-500, 500);
                    y = y + GetRandomInt(-500, 500);
                    if (!TerrainUtil.isTerrainLand(x, y) && RectUtil.isContainsCoords(bj_mapInitialPlayableArea, x, y)) {
                        break;
                    }
                }
            }
            let trigUnit = actor.unit;
            BaseUtil.runLater(0.1, () => {
                UnitUtil.transfer(trigUnit, x, y);
            })
        }
        /**
         * 减少2000范围内怪物攻击力40%，免疫低于自身生命值10%的伤害。
         */
        actorType = ActorTypeUtil.getActorType("香科四");
        ActorTypeUtil.registerActorType({
            id: "香科四减少攻击",
            icon: actorType.icon,
            describe: "减少周围攻击力40%",
            attribute: {
                attack_p: -0.4,
            },
            dur: 3,
        })
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (event.resultDamage < UnitStateUtil.getMaxLife(actor.unit) * 0.1) {
                EXSetEventDamage(0);
                event.consumed = true;
            }
            if (!(actor instanceof ActorItem)) {
                return
            }
            if (RandomUtil.isInChance(0.001)) {
                //进阶黑胡子
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("红发·香科四", unit)
            }
        }
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            SelectUtil.forEnemyUnitsInRange(actor.unit, 2000, u => {
                ActorBuffUtil.addActorBuff(u, "香科四减少攻击")
            });
        }
        /**
         * 减少全图范围内怪物攻击力65%，免疫低于自身生命值15%的伤害。（减攻效果宠物可携带生效）
         */
        actorType = ActorTypeUtil.getActorType("红发·香科四");
        ActorTypeUtil.registerActorType({
            id: "红发香科四减少攻击",
            icon: actorType.icon,
            describe: "减少周围攻击力65%",
            attribute: {
                attack_p: -0.65,
            }
        })
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (event.resultDamage < UnitStateUtil.getMaxLife(actor.unit) * 0.15) {
                EXSetEventDamage(0);
                event.consumed = true;
            }
        }
        actorType.onCreated = (actor) => {
            //会在演员销毁时 自动停止销毁这个触发器
            let solarTrigger = se.onUnitEnterMapRect((e) => {
                if (!IsHandle(actor.unit)) {//检查是否被携带 buff 跟技能必定存在单位 物品形态可能在地上无单位
                    return
                }
                if (e.trigUnitOwnerId > 5) {
                    ActorBuffUtil.addActorBuff(e.trigUnit, "红发香科四减少攻击")
                }
            });
            actor.childDestroyList.push(solarTrigger);
        };
        /**
         *
         */
        actorType = ActorTypeUtil.getActorType("暮年雷利");
        actorType.onCreated = (actor) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            let actorItem = actor as ActorItem
            actorItem.setUses(3000)
        }
        actorType.onUnitKillEnemy = (actor) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            let actorItem = actor as ActorItem
            if (actorItem.addUses(-1) < 1) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("雷利", unit)
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("雷利");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            if (UnitUtil.isHero(deathEnemy) && RandomUtil.isInChance(0.8)) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("壮年雷利", unit)
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("壮年雷利");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            if (UnitUtil.isHero(deathEnemy) && RandomUtil.isInChance(0.6)) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("西尔巴兹·雷利", unit)
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("西尔巴兹·雷利");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (!(actor instanceof ActorItem)) {
                return
            }
            if (UnitUtil.isHero(deathEnemy) && RandomUtil.isInChance(0.4)) {
                //进阶
                let unit = actor.unit;
                actor.destroy();
                ActorItemUtil.addActorItemForUnit("冥王·雷利", unit)
            }
        }
        //one case


    }


}