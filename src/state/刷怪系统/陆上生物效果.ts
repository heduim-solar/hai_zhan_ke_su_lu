import {d_陆上生物单位演员} from "../../xlsx/单位/陆上生物单位演员";
import ActorUnitUtil from "@/ActorUnitUtil";
import PlayerUtil from "@/PlayerUtil";
import {l_陆上生物} from "../../_sl_editor/l_陆上生物";
import TextTagUtil from "@/TextTagUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import 被攻击时无敌 from "../组件/被攻击时无敌";
import BaseUtil from "@/BaseUtil";
import UnitStateUtil from "@/UnitStateUtil";
import RandomUtil from "@/RandomUtil";
import VestAbilityUtil from "@/VestAbilityUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorItemUtil from "@/ActorItemUtil";

export default class 陆上生物效果 {

    constructor() {

        ActorTypeUtil.forAllActorTypes(actorType => {
            let appActorType = actorType as AppActorUnitType
            appActorType.unitInRangeValue = 200
            appActorType.abilities = ["AInv"]
            if (appActorType.bountyItems) {
                for (let bountyItemsKey in appActorType.bountyItems) {
                    appActorType.onCreated = (actor) => {
                        BaseUtil.runLater(0.1, () => {
                            ActorItemUtil.addActorItemForUnit(bountyItemsKey, actor.unit)
                        })
                    }

                }

            }
            if (actorType.id == "岛主") {
                appActorType.onUnitDeath = (actor) => {
                    TextTagUtil.textWarn("岛主死亡", actor.unit)
                    PingMinimap(actor.unitX, actor.unitY, 5)
                }
                return
            }

            appActorType.onUnitInRange = (actor, enteringUnit) => {
                if (GetPlayerId(GetOwningPlayer(enteringUnit)) < 4) {
                    SetUnitOwner(actor.unit, PlayerUtil.neutralAggressivePlayer(), true);
                }
            };
        }, "陆上生物")


        //
        for (let i = 0; i < d_陆上生物单位演员.length && i < 4; i++) {

            let loc = l_陆上生物[i * 2]
            let actorUnit = ActorUnitUtil.createActorUnit(PlayerUtil.neutralPassivePlayer(), d_陆上生物单位演员[i].id, loc.x, loc.y, loc.face);

            let texttag = TextTagUtil.text("|cffff0000靠近激活挑战", actorUnit.unit);
            SetTextTagVelocity(texttag, 0, 0);
            SetTextTagPermanent(texttag, true);
            actorUnit.set("onDestroy", () => {
                SetTextTagLifespan(texttag, 1);
                SetTextTagVisibility(texttag, false)
                SetTextTagPermanent(texttag, false);
            })

        }

        //
        let actorType: AppActorType = null;
        /***
         * 无敌：被攻击时无敌30秒，冷却45秒。
         * 中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。
         * 特殊：第二个BOSS死亡后会消失。
         */
        actorType = ActorTypeUtil.getActorType("强盗领主");
        actorType.onUnitDamaged = new 被攻击时无敌().onUnitDamaged;
        actorType.onUnitChange = (actor, unit) => {
            if (IsHandle(unit)) {
                se.onUnitDeath(e => {
                    if (e.trigUnitTypeIdStr == "A41b") {
                        //删除单位时  太阳框架底层会自动销毁对应的演员数据
                        actor.destroy()
                    }
                    ActorUnitUtil.ifHasActorUnit(e.trigUnit, () => {
                        //删除单位时  太阳框架底层会自动销毁对应的演员数据
                        actor.destroy()
                    }, "无敌战舰号")

                })
            }
        }
        /***
         * 中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。
         * 被摧毁：被摧毁后，每秒刷新10个农民农民持续5秒后消失，每个农民击杀金币100，刷10秒。
         * 农民属性：2000生命值，护甲0。
         * 农民刷新完后，10分钟在原地会出现岛主。
         */
        actorType = ActorTypeUtil.getActorType("农场");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (IsHandle(killingUnit)) {
                gv.打爆农场的玩家 = GetOwningPlayer(killingUnit);
                TextTagUtil.text("你打爆了农场！等着岛主10分钟后来找你算账吧!", killingUnit)
            }
            BaseUtil.runLater(1, () => {
                for (let i = 0; i < 10; i++) {
                    let actorUnit = ActorUnitUtil.createActorUnit(PlayerUtil.neutralAggressivePlayer(), "农民", actor.unitX, actor.unitY, 270);
                    actorUnit.applyTimedLife(12)
                }
            }, 10, true)
            //临时保存一下刷新需要的变量 刷新时此死亡的演员数据已被回收了(至少主要单位数据可能已重用了)
            let x = actor.unitX;
            let y = actor.unitY
            BaseUtil.runLater(600, () => {
                ActorUnitUtil.createActorUnit(PlayerUtil.neutralAggressivePlayer(), "岛主", x, y, 270);
                PlayerUtil.message("|cffff0000岛主出现并将向你发动攻击了！请做好准备")
                PingMinimap(actor.unitX, actor.unitY, 3)

            })

        }
        /***
         *
         * 岛主
         *
         * 两栖，会不断追着打爆农场的人打。
         * 技能：攻击30%概率击晕0.5秒。
         */
        actorType = ActorTypeUtil.getActorType("岛主");
        actorType.interval = 10;
        actorType.onCreated = (actor) => {
            if (IsHandle(gv.打爆农场的玩家)) {
                let hero = PlayerUtil.getHero(gv.打爆农场的玩家);
                if (IsHandle(hero)) {
                    UnitStateUtil.orderAttackTarget(actor.unit, hero)
                }
            }
        }
        actorType.onUnitInterval = (actor) => {
            if (IsHandle(gv.打爆农场的玩家)) {
                let hero = PlayerUtil.getHero(gv.打爆农场的玩家);
                if (IsHandle(hero)) {
                    UnitStateUtil.orderAttackTarget(actor.unit, hero)
                }
                PingMinimap(actor.unitX, actor.unitY, 3)
            }
        }
        actorType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (RandomUtil.isInChance(0.3)) {
                UnitStateUtil.stunUnit(enemy, 0.5)
            }
        }
        /***
         *
         * 巫师
         *
         * 中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。
         * 变羊：将目标变样5秒，冷却15秒。
         */
        actorType = ActorTypeUtil.getActorType("巫师");
        actorType.interval = 10;
        actorType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            actor.ifReady(15, () => {
                VestAbilityUtil.polymorph(enemy, 5)
            });
        }
        /***
         *
         * 兽族酋长
         * 中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。
         * 振奋：10秒内攻击+500%。冷却20秒。
         * 特殊：闪电链，造成攻击力x5的伤害，全地图弹射7次。（稍有不慎直接团灭）冷却30s。
         * 特殊：第三个BOSS死亡后会消失。
         */
        ActorTypeUtil.registerActorType({
            id: "兽族酋长振奋Buff",
            name: "振奋",
            describe: "攻击+500%",
            attribute: {attack_p: 5},
            dur: 10,
        })
        actorType = ActorTypeUtil.getActorType("兽族酋长");
        actorType.onCreated = (actor) => {
            se.onUnitDeath(e => {
                if (e.trigUnitTypeIdStr == "A41c") {
                    //销毁  太阳框架底层会自动销毁对应的单位 如果单位已经死亡 销毁演员单位也是安全的 因为此时的演员单位已经是销毁过的空unit演员数据了
                    actor.destroy()
                }
                ActorUnitUtil.ifHasActorUnit(e.trigUnit, () => {
                    //删除单位时  太阳框架底层会自动销毁对应的演员数据
                    actor.destroy()
                }, "巨型海怪")
            })
        };
        actorType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            actor.ifReady(20, () => {
                ActorBuffUtil.addActorBuff(actor.unit, "兽族酋长振奋Buff")
            }, "振奋Buff");
            actor.ifReady(30, () => {
                let damage = UnitStateUtil.calculateStateFormula({attack: 5}, actor.unit);
                VestAbilityUtil.lightningChain(actor.unit, enemy, damage, 7, 999999, 0.01)
            }, "闪电链");


        }

    }

}