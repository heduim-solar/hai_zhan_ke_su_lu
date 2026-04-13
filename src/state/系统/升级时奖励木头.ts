import PlayerUtil from "@/PlayerUtil";

export default class 升级时奖励木头 {


    constructor() {

        /**
         核心部件获取来源：到达10/15/20级给予1个木头。
         核心部件在海上奇珍商店用1个木头去随机获得。
         （这个道具要难度大于4才开启而且要在商店告诉玩家N4在海上奇珍购买，海上奇珍显示，难度4可购买）

         */
        se.onHeroLevelUp(e => {


            if (e.trigUnitOwnerId > 3) {
                return;
            }
            let heroLevel = GetHeroLevel(e.trigUnit);
            let player = e.trigUnitOwner;
            if (sd(player)["onHeroLevelUp" + heroLevel]) {
                return;
            }
            if (heroLevel == 10 || heroLevel == 15 || heroLevel == 20) {
                sd(player)["onHeroLevelUp" + heroLevel] = true
                PlayerUtil.addLumberState(player, 1)
                PlayerUtil.message("获得木头+1", 10, player)
            }


        })


    }


}