import ActorTypeUtil from "@/ActorTypeUtil";
import Actor from "@/Actor";
import PlayerUtil from "@/PlayerUtil";
import DataBase from "@/DataBase";
import MouseFrameUtil from "@/MouseFrameUtil";
import DialogUtil from "@/DialogUtil";
import HeroUtil from "@/HeroUtil";
import AttributeUtil from "@/AttributeUtil";
import BaseUtil from "@/BaseUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import AsyncUtil from "@/AsyncUtil";
import TextUtil from "@/TextUtil";
import MapModel from "../../MapModel";

declare global {

    interface AppPlayerData {
        修炼次数?: number
    }

}
export default class 修炼 {


    constructor() {
        /**
         * 第一层：2000金币    全属性+50    杀敌金币+2    3分钟后获得1W金币
         * 第二层：2W金币    全属性强化+10%    杀敌时有50%概率获得1额外经验    魔抗+20%（BOSS技能减伤）
         * 第三层：4W金币    杀敌金币+5    全属性+500    魔抗+30%
         * 8W    死亡后立刻复活机会+3    攻击强化+30%    存档掉率+5%（加算）
         * 10W    力量强化+30%    敏捷强化+30%    智力强化+30%
         * 20W    伤害强化+50%    当前护甲翻倍    存档掉率+5%（加算）
         * 40W    当前力量+20%    当前敏捷+20%    当前智力+20%
         * 80W    当前力量+30%    当前敏捷+30%    当前智力+30%
         * 100W    当前力量+50%    当前敏捷+50%    当前智力+50%
         */
        let actorType = ActorTypeUtil.getActorType("修炼");
        if (settings.gameDifficulty < 2 && settings.gameMode == MapModel.模式1_普通模式) {
            let actorAbilityType = ActorTypeShopUtil.warpActorItem2SellingAbility(actorType.id);
            actorAbilityType.disable = true;
            actorAbilityType.requiredTip = "难2"
        }
        let as = ActorTypeShopUtil.warpActorItem2SellingAbility(actorType.id);
        as.tooltipLabel1 = "2000"
        as.onCreated = (actor) => {
            //清空对象数据 以使用类型数据
            actor.set("tooltipLabel1", null)
        }
        actorType.onBuy = (actor, buyingUnit) => {
            修炼.三选一(actor, buyingUnit)
        }


    }


    static 三选一(actor: Actor, buyingUnit: unit) {
        let player = GetOwningPlayer(buyingUnit);
        if (!IsHandle(player)) {
            return
        }
        let pid = GetPlayerId(player);
        let unit = PlayerUtil.getHero(player)
        if (unit == null) {
            return
        }
        // let actorItem = actor as ActorItem
        actor.destroy();

        //
        let pData = DataBase.getPlayerSolarData(player, true);
        let needGold = 2000
        if (pData.修炼次数 != null && pData.修炼次数 > 0) {
            needGold = 20000 * (2 ** (pData.修炼次数 - 1))
        }
        needGold = Math.min(needGold, 1000000)
        if (!PlayerUtil.costEnoughState(player, needGold)) {
            MouseFrameUtil.showTipText("|cffff0000金币不足!需要:" + needGold, 1, player);
            return;
        }

        pData.修炼次数 = (pData.修炼次数 || 0) + 1;
        AsyncUtil.run(() => {
            let nextText = Math.min(20000 * (2 ** (pData.修炼次数 - 1)), 1000000);
            ActorTypeShopUtil.warpActorItem2SellingAbility("修炼").tooltipLabel1 = TextUtil.toCnUnit(nextText)
        }, player);
        let level = pData.修炼次数;
        //
        let hero = unit;
        let attribute: AppAttribute = AttributeUtil.getPlayerAttribute(GetOwningPlayer(hero), true);
        if (level == 1) {
            //全属性+50    杀敌金币+5    3分钟后获得1W金币
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    HeroUtil.addHeroProperty(hero, 50)
                } else if (index == 1) {
                    attribute.add_gold_on_kill = (attribute.add_gold_on_kill || 0) + 2
                } else if (index == 2) {
                    BaseUtil.runLater(180, () => {
                        PlayerUtil.message("修炼：获得1W金币!", 5, player)
                        PlayerUtil.addGoldState(player, 10000)
                    })
                }
            }, "全属性+50", "杀敌金币+2", "3分钟后获得1W金币")


        } else if (level == 2) {
            //第二层：2W金币    全属性强化+10%    杀敌时有50%概率获得1额外经验    魔抗+20%（BOSS技能减伤）
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    // HeroUtil.addHeroPropertyP(hero, false, 0.1)
                    attribute.full_property_p = (attribute.full_property_p || 0) + 0.1
                } else if (index == 1) {
                    attribute.经验倍率 = (attribute.经验倍率 || 0) + 1
                } else if (index == 2) {
                    attribute.magic_damage_reduction = (attribute.magic_damage_reduction || 0) + 0.2
                }
            }, "全属性强化+10% ", "经验倍率x2", "魔抗+20%（BOSS技能减伤）")
        } else if (level == 3) {
            //第三层：4W金币    杀敌金币+20    全属性+500    魔抗+30%
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    attribute.add_gold_on_kill = (attribute.add_gold_on_kill || 0) + 5
                } else if (index == 1) {
                    HeroUtil.addHeroProperty(hero, 500)
                } else if (index == 2) {
                    attribute.magic_damage_reduction = (attribute.magic_damage_reduction || 0) + 0.3
                }
            }, "杀敌金币+5 ", "全属性+500", "魔抗+30%")
        } else if (level == 4) {
            //  死亡后立刻复活机会+3    攻击强化+30%    存档掉率+5%（加算）
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    attribute.死亡后立刻复活 = (attribute.死亡后立刻复活 || 0) + 3
                } else if (index == 1) {
                    attribute.attack_p = (attribute.attack_p || 0) + 0.3
                } else if (index == 2) {
                    attribute.存档掉率 = (attribute.存档掉率 || 0) + 0.05
                }
            }, "死亡后立刻复活机会+3", "攻击强化+30%", "存档掉率+5%（加算）")
        } else if (level == 5) {
            //力量强化+30%    敏捷强化+30%    智力强化+30%
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    attribute.strength_p = (attribute.strength_p || 0) + 0.3
                } else if (index == 1) {
                    attribute.agility_p = (attribute.agility_p || 0) + 0.3
                } else if (index == 2) {
                    attribute.intelligence_p = (attribute.intelligence_p || 0) + 0.3
                }
            }, "力量增幅+30%", "敏捷增幅+30%", "智力增幅+30%")
        } else if (level == 6) {
            //伤害强化+50%    当前护甲翻倍    存档掉率+5%（加算）
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    attribute.damage_increased = (attribute.damage_increased || 0) + 0.5
                } else if (index == 1) {
                    let armor = UnitStateUtil.getArmor(hero);
                    if (armor > 0) {
                        UnitStateUtil.addArmor(hero, armor)
                    }
                } else if (index == 2) {
                    attribute.存档掉率 = (attribute.存档掉率 || 0) + 0.05
                }
            }, "伤害强化+50%", "当前护甲翻倍", "存档掉率+5%（加算）")
        } else if (level == 7) {
            //当前力量+20%    当前敏捷+20%    当前智力+20%
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    HeroUtil.addHeroPropertyP(hero, false, 0.1, 0, 0)
                } else if (index == 1) {
                    HeroUtil.addHeroPropertyP(hero, false, 0, 0.1, 0)
                } else if (index == 2) {
                    HeroUtil.addHeroPropertyP(hero, false, 0, 0, 0.1)
                }
            }, "当前力量+10%", "当前敏捷+10% ", "当前智力+10%")
        } else if (level == 8) {
            //80W    当前力量+30%    当前敏捷+30%    当前智力+30%
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 0) {
                    HeroUtil.addHeroPropertyP(hero, false, 0.15, 0, 0)
                } else if (index == 1) {
                    HeroUtil.addHeroPropertyP(hero, false, 0, 0.15, 0)
                } else if (index == 2) {
                    HeroUtil.addHeroPropertyP(hero, false, 0, 0, 0.15)
                }
            }, "当前力量+15%", "当前敏捷+15% ", "当前智力+15%")
        } else if (level >= 9) {

            // 100W    当前力量+50%    当前敏捷+50%    当前智力+50%
            DialogUtil.show(pid, "修炼LV" + level, (index, text) => {
                if (index == 9) {
                    HeroUtil.addHeroPropertyP(hero, false, 0.2, 0, 0)
                } else if (index == 1) {
                    HeroUtil.addHeroPropertyP(hero, false, 0, 0.2, 0)
                } else if (index == 2) {
                    HeroUtil.addHeroPropertyP(hero, false, 0, 0, 0.2)
                }
            }, "当前力量+20%", "当前敏捷+20% ", "当前智力+20%")
        } else {
            print("搞什么?")
        }
        se.emit("属性刷新")

    }


}