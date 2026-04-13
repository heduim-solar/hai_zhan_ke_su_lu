import ActorUnitUtil from "@/ActorUnitUtil";
import {d_擂台单位挑战NPC} from "../../xlsx/单位/擂台单位挑战NPC";
import {l_挑战怪} from "../../_sl_editor/l_挑战怪";
import {d_擂台挑战怪} from "../../xlsx/单位/擂台挑战怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import PlayerUtil from "@/PlayerUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import TextTagUtil from "@/TextTagUtil";
import UnitStateUtil from "@/UnitStateUtil";
import BaseUtil from "@/BaseUtil";
import AttributeUtil from "@/AttributeUtil";
import UnitRewardUtil from "@/UnitRewardUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import MapHeroUtil from "../../util/MapHeroUtil";
import {d_玩家英雄船} from "../../xlsx/单位/玩家英雄船";
import PlayerAttributeState from "@/PlayerAttributeState";
import MapUtil from "../../util/MapUtil";

export default class 擂台挑战系统 {


    constructor() {
        BaseUtil.runLater(gv.上手入门模式 ? 60 : 1, () => {
            this.init();
        });
    }

    init() {
        let loc = l_挑战怪[0]

        let tzNpcActorUnit = ActorUnitUtil.createActorUnit(Player(4), d_擂台单位挑战NPC[0].id, loc.x, loc.y);

        /**
         * 演员单位是 演员数据   。  演员数据可以在任意单位 技能 物品 buff 任意切换。
         */

        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.maxCd = 30;
            actorType.onAction = (actor) => {
                let loc = l_挑战怪[GetRandomInt(1, l_挑战怪.length - 1)]
                let actorUnit = ActorUnitUtil.createActorUnit(PlayerUtil.neutralAggressivePlayer(),
                    actor.actorTypeId, tzNpcActorUnit.unitX, tzNpcActorUnit.unitY);
                actorUnit.setXY(loc.x, loc.y)
                //
                MapUtil.根据难度数值加强怪物(actorUnit.unit)
                // actorUnit.set("flyHeight", 200)
                actorUnit.applyTimedLife(30)
                se.onUnitDeath(e => {
                    //被杀死的
                    if (IsHandle(e.killingUnit)) {
                        ActorAbilityUtil.destroyUnitAllActorAbility(actor.unit);
                        let nextActorId = 擂台挑战系统.findNextActorId(actor.actorTypeId);
                        if (nextActorId) {
                            let actorAbility = ActorAbilityUtil.createActorAbility(nextActorId, actor.lastUnit);
                            actorAbility.setName("点击挑战:" + actorAbility.actorType.name)
                            tzNpcActorUnit.set("model", actorAbility.get("model"))
                        }
                        if (MapUtil.getRealNanduLevel() > 5) {
                            tzNpcActorUnit.addActorAbility("超级挑战");
                        }
                    }
                }, actorUnit.unit)
            }

        }, "擂台挑战怪")
        //
        tzNpcActorUnit.addActorAbility(d_擂台挑战怪[0].id);


        //
        擂台挑战系统.擂台挑战奖励();
    }


    static 擂台挑战奖励() {
        let actorType: AppActorType = null;
        //one case
        /**
         * 奖励全队2000金币
         */
        actorType = ActorTypeUtil.getActorType("擂台小木船");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台小木船！奖励全队2000金币！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                UnitRewardUtil.addGoldWithEarnGoldP(hero, 2000);
            })
            TextTagUtil.textGold("奖励全队2000金币!", actor.unit)
        }
        /**
         * 奖励全队30秒内无敌
         */
        actorType = ActorTypeUtil.getActorType("擂台驱逐舰");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台驱逐舰！奖励全队30秒内无敌！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                if (!UnitStateUtil.isInvulnerable(hero)) {
                    UnitStateUtil.setInvulnerable(hero, true)
                    BaseUtil.runLater(30, () => {
                        UnitStateUtil.setInvulnerable(hero, false)
                    })
                }
            })
            TextTagUtil.textGold("奖励全队30秒内无敌!", actor.unit)
        }
        /**
         * 奖励全队金币收益+25%
         */
        actorType = ActorTypeUtil.getActorType("擂台护卫舰");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台护卫舰！奖励全队金币收益+25%！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                let unitAttribute = AttributeUtil.getPlayerAttribute(player, true);
                unitAttribute.earn_gold_p = (unitAttribute.earn_gold_p || 0) + 0.25;
            })
            PlayerAttributeState.refresh();
            TextTagUtil.textGold("奖励全队金币收益+25%!", actor.unit)
        }
        /**
         * 奖励全队5000金币
         */
        actorType = ActorTypeUtil.getActorType("擂台巡洋舰");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台巡洋舰！奖励全队5000金币！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                UnitRewardUtil.addGoldWithEarnGoldP(hero, 5000);
            })
            TextTagUtil.textGold("奖励全队5000金币!", actor.unit)
        }

        /**
         * 奖励全队20%攻击力加成
         */
        actorType = ActorTypeUtil.getActorType("擂台重舰");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台重舰！奖励全队20%攻击力加成！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                let unitAttribute = AttributeUtil.getPlayerAttribute(player, true);
                unitAttribute.attack_p = (unitAttribute.attack_p || 0) + 0.2;
            })
            PlayerAttributeState.refresh();
            TextTagUtil.textGold("奖励全队20%攻击力加成!", actor.unit)
        }
        /**
         * 奖励全队15秒内护甲+999
         */
        ActorTypeUtil.registerActorType({
            id: "擂台海龟奖励Buff",
            name: "擂台海龟Buff",
            icon: "ReplaceableTextures\\CommandButtons\\BTNSeaTurtleRed.blp",
            attribute: {
                def: 999
            },
            dur: 15
        })
        actorType = ActorTypeUtil.getActorType("擂台海龟");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台海龟！奖励全队15秒内护甲+999！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                ActorBuffUtil.addActorBuff(hero, "擂台海龟奖励Buff")
            })
            TextTagUtil.textGold("奖励全队15秒内护甲+999!", actor.unit)
        }
        /**
         * 奖励击杀者进化为剑圣
         */
        actorType = ActorTypeUtil.getActorType("擂台石像鬼");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            MapHeroUtil.do进化ByType(GetOwningPlayer(killingUnit), 2, d_玩家英雄船[45].id)
        }
        /**
         * 奖励当前全队15秒内无敌
         */
        actorType = ActorTypeUtil.getActorType("擂台九头蛇");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台九头蛇！奖励当前全队15秒内无敌！")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                if (!UnitStateUtil.isInvulnerable(hero)) {
                    UnitStateUtil.setInvulnerable(hero, true)
                    BaseUtil.runLater(15, () => {
                        UnitStateUtil.setInvulnerable(hero, false)
                    })
                }
            })
            TextTagUtil.textGold("奖励当前全队15秒内无敌!", actor.unit)
        }

        /**
         * 奖励当前全队15秒内攻击力+300%
         */
        ActorTypeUtil.registerActorType({
            id: "擂台触手奖励Buff",
            name: "擂台触手Buff",
            icon: "ReplaceableTextures\\CommandButtons\\BTNDaggerOfEscape.blp",
            attribute: {
                attack_p: 3
            },
            dur: 15
        })
        actorType = ActorTypeUtil.getActorType("擂台触手");
        actorType.onUnitDeath = (actor, killingUnit) => {
            if (!IsHandle(killingUnit)) {
                return
            }
            PlayerUtil.message("|cffff0000【系统提示】击杀了擂台触手！奖励当前全队15秒内攻击力+300%!")
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                ActorBuffUtil.addActorBuff(hero, "擂台触手奖励Buff")
            })
            TextTagUtil.textGold("奖励当前全队15秒内攻击力+300%!", actor.unit)
        }
    }


    static findNextActorId(actorTypeId: string, defaultVal?: string): string {
        for (let i = 0; i < d_擂台挑战怪.length; i++) {
            if (d_擂台挑战怪[i].id == actorTypeId) {
                if (i + 1 < d_擂台挑战怪.length) {
                    return d_擂台挑战怪[i + 1].id
                }
            }
        }
        return defaultVal;
    }


}