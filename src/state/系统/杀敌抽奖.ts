import ActorTypeUtil from "@/ActorTypeUtil";
import DataBase from "@/DataBase";
import MouseFrameUtil from "@/MouseFrameUtil";
import UnitStateUtil from "@/UnitStateUtil";
import HeroUtil from "@/HeroUtil";
import PlayerUtil from "@/PlayerUtil";
import RandomUtil from "@/RandomUtil";
import AsyncUtil from "@/AsyncUtil";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import DateUtil from "@/DateUtil";
import MapUtil from "../../util/MapUtil";
import BaseUtil from "@/BaseUtil";

declare global {

    interface AppPlayerData {
        杀敌抽奖次数?: number
    }

}

export default class 杀敌抽奖 {


    constructor() {

        /**
         * 消耗50/100/150/200/250/300……杀敌数进行抽奖。奖励如下。
         * 1、100经验 10%
         * 2、100~300杀敌数 10%
         * 3、船长（高级）-海贼王（2%）
         * 4、20~50永久航速 10%
         * 5、胶胶果实x1 10%
         * 6、胶胶果实x5 2%
         * 7、当前10%全属性 2%
         * 8、当前10%力量 5%
         * 9、当前10%敏捷 5%
         * 10、当前10%智力 5%
         * 11、当前10%攻击力 5%
         * 12、当前10%生命值 5%
         * 13、500~20000金币 2%
         * 14、当前10%护甲 5%
         * 15、500~1000杀敌数 2%
         * 16、  风平浪静10%（无事发生）
         * 17、   100点全属性 10%
         */
        let actorType = ActorTypeUtil.getActorType("杀敌抽奖");
        let as = ActorTypeShopUtil.warpActorItem2SellingAbility("杀敌抽奖");
        as.tooltipLabel3 = "100杀敌数"
        as.onCreated = (actor) => {
            //清空对象数据 以使用类型数据
            actor.set("tooltipLabel3", null)
            actor.extDescribeLast1 = "|cffcccccc右键点击可以10连抽"
        }

        actorType.onBuy = (actor, buyingUnit: unit) => {
            // let actorItem = actor as ActorItem
            actor.destroy();
            杀敌抽奖.抽奖(buyingUnit)
        }
        as.onClick = (actor, btn, triggerPlayer, actorType) => {
            if (btn == 1) {
                return
            }
            if (actor.isDisable()) {
                return;
            }
            actor.setDisable(true);
            let hero = PlayerUtil.getHero(triggerPlayer);
            BaseUtil.runLater(0.2, (count, maxCount) => {
                杀敌抽奖.抽奖(hero);
                if (count == maxCount) {
                    actor.setDisable(false);
                }
            }, 10, true);
        }


    }

    static qzxs = {
        1: 0.1,
        2: 0.1,
        3: 0.02,
        4: 0.1,
        5: 0.1,
        6: 0.02,
        7: 0.01,
        8: 0.01,
        9: 0.01,
        10: 0.01,
        11: 0.01,
        12: 0.01,
        13: 0.02,
        14: 0.05,
        15: 0.02,
        16: 0.1,
        17: 0.1,
    }

    static 抽奖(buyingUnit: unit) {
        if (!IsHandle(buyingUnit)) {
            return
        }
        let player = GetOwningPlayer(buyingUnit);
        if (!IsHandle(player)) {
            return
        }
        let unit = PlayerUtil.getHero(player)
        if (unit == null) {
            return
        }


        //
        let pData = DataBase.getPlayerSolarData(player, false);
        let needKillCount = (pData?.杀敌抽奖次数 || 1) * 100
        needKillCount = Math.min(needKillCount, 1000)
        if (pData == null || pData.killCount == null || pData.killCount < needKillCount) {
            MouseFrameUtil.showTipText("|cffff0000杀敌数不足!需要:" + needKillCount, 1, player)
            return;
        }
        pData.killCount -= needKillCount;
        pData.杀敌抽奖次数 = (pData.杀敌抽奖次数 || 1) + 1;
        AsyncUtil.run(() => {
            let nextText = Math.min((pData?.杀敌抽奖次数 || 1) * 100, 1000);
            ActorTypeShopUtil.warpActorItem2SellingAbility("杀敌抽奖").tooltipLabel3 = nextText + "杀敌数"
        }, player);
        //
        let randomKey = RandomUtil.getRandomKeyByWeight(杀敌抽奖.qzxs);
        let hero = unit;
        if (randomKey == 1) {
            AddHeroXP(hero, 100, true)
            MouseFrameUtil.showTipText("|cff00ff00获得100经验", 1, player)
        } else if (randomKey == 2) {
            //2、100~300杀敌数 10%
            let ak = GetRandomInt(1, 3) * 100
            pData.killCount += ak;
            MouseFrameUtil.showTipText("|cff00ff00获得" + ak + "杀敌数", 1, player)
        } else if (randomKey == 3) {
            let actorItem = MapUtil.addActorItemForUnit("海贼王", hero);
            actorItem.set("goldCost", 1000)
            MouseFrameUtil.showTipText("|cff00ff00获得船长-海贼王杀敌数", 1, player)
        } else if (randomKey == 4) {
            //
            let ak = GetRandomInt(2, 5) * 10
            UnitStateUtil.addMoveSpeed(hero, ak)
            MouseFrameUtil.showTipText("|cff00ff00获得" + ak + "永久航速", 1, player)
        } else if (randomKey == 5) {
            let actorItem = MapUtil.addActorItemForUnit("胶胶果实", hero)
            actorItem.set("goldCost", 100)
            MouseFrameUtil.showTipText("|cff00ff00获得胶胶果实x1", 1, player)
        } else if (randomKey == 6) {
            let actorItem = MapUtil.addActorItemForUnit("胶胶果实", hero, 5);
            actorItem.set("goldCost", 100)
            MouseFrameUtil.showTipText("|cff00ff00获得胶胶果实x5", 1, player)
        } else if (randomKey == 7) {
            HeroUtil.addHeroPropertyP(hero, false, 0.1)
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%全属性", 1, player)
        } else if (randomKey == 8) {
            HeroUtil.addHeroPropertyP(hero, false, 0.1, 0, 0)
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%力量", 1, player)
        } else if (randomKey == 9) {
            HeroUtil.addHeroPropertyP(hero, false, 0, 0.1, 0)
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%敏捷", 1, player)
        } else if (randomKey == 10) {
            HeroUtil.addHeroPropertyP(hero, false, 0, 0, 0.1)
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%智力", 1, player)
        } else if (randomKey == 11) {
            UnitStateUtil.addDamageBase(hero, UnitStateUtil.getDamageMax(hero) * 0.1)
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%攻击力", 1, player)
        } else if (randomKey == 12) {
            UnitStateUtil.addMaxLifeAndLife(hero, UnitStateUtil.getMaxLife(hero) * 0.1)
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%生命值", 1, player)
        } else if (randomKey == 13) {
            //13、10000~50000金币 2%
            let minutes = DateUtil.getGameMinutes();
            let ak = GetRandomInt(5, minutes * 5) * 100
            PlayerUtil.addGoldState(player, ak)
            MouseFrameUtil.showTipText("|cff00ff00获得" + ak + "金币", 1, player)
        } else if (randomKey == 14) {
            let av = UnitStateUtil.getArmor(hero) * 0.1;
            if (av > 0) {
                UnitStateUtil.addArmor(hero, av)
            }
            MouseFrameUtil.showTipText("|cff00ff00获得当前10%护甲", 1, player)
        } else if (randomKey == 15) {
            let ak = GetRandomInt(5, 10) * 100
            pData.killCount += ak;
            MouseFrameUtil.showTipText("|cff00ff00获得" + ak + "杀敌数", 1, player)
        } else if (randomKey == 16) {
            MouseFrameUtil.showTipText("|cff0000ff风平浪静", 1, player)
        } else if (randomKey == 17) {
            HeroUtil.addHeroProperty(hero, 100)
            MouseFrameUtil.showTipText("|cff00ff00获得100点全属性", 1, player)
        } else {
            MouseFrameUtil.showTipText("|cff0000ff无事发生", 1, player)
        }
    }


}