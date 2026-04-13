import 红色触手的灵魂碎片 from "./state/存档/红色触手的灵魂碎片";
import 深海巨兽的灵魂碎片 from "./state/存档/深海巨兽的灵魂碎片";
import 大副的灵魂碎片 from "./state/存档/大副的灵魂碎片";
import 古老者的灵魂碎片 from "./state/存档/古老者的灵魂碎片";
import 神话权柄 from "./state/存档/神话权柄";
import 地图等级奖励提示 from "./state/存档/地图等级奖励提示";
import 地图等级奖励 from "./xlsx/存档/地图等级奖励";
import 平台论坛点赞相关奖励 from "./xlsx/存档/平台论坛点赞相关奖励";
import 通关奖励 from "./xlsx/存档/通关奖励";
import 击杀BOSS装备存档 from "./xlsx/存档/击杀BOSS装备存档";
import 深度海域存档 from "./xlsx/存档/深度海域存档";
import 历史中的战舰碎片 from "./xlsx/存档/历史中的战舰碎片";
import 兑换初始属性存档 from "./xlsx/存档/兑换初始属性存档";
import 神话权柄累计解锁 from "./xlsx/存档/神话权柄累计解锁";
import 存档分类重组 from "./state/存档/存档分类重组";
import BaseUtil from "@/BaseUtil";
import 战舰碎片兑换 from "./state/存档/战舰碎片兑换";
import 探索点兑换 from "./state/存档/探索点兑换";
import 存档属性 from "./attribute/玩家属性/存档属性";
import 全服排行榜 from "./state/存档/全服排行榜";
import QQ群加群链接 from "./state/存档/QQ群加群链接";
import 商城 from "./xlsx/商城/商城";
import 牛币道具 from "./state/商城/牛币道具";
import ActorTypeUtil from "@/ActorTypeUtil";
import 魔改道具 from "./state/商城/魔改道具";
import 主炮存档ABC from "./state/存档/主炮存档ABC";
import 存档获取 from "./state/存档/存档获取";
import 存档查询指令 from "./state/存档/存档查询指令";
import 玩家设置特效等开关 from "./state/系统/玩家设置特效等开关";

export default class 初始化存档和商城 {


    constructor() {
        //one case
        new 存档查询指令()
        new 主炮存档ABC()
        new 存档获取()

        //cd
        new 红色触手的灵魂碎片();
        new 深海巨兽的灵魂碎片();
        new 大副的灵魂碎片();
        new 古老者的灵魂碎片();
        new 神话权柄();
        new 地图等级奖励提示();

        //存档
        // 主炮存档A();
        // 主炮存档B();
        // 主炮存档C();

        地图等级奖励();
        平台论坛点赞相关奖励();
        通关奖励();

        击杀BOSS装备存档();
        深度海域存档();
        历史中的战舰碎片();
        兑换初始属性存档();
        神话权柄累计解锁();
        new 存档分类重组();


        BaseUtil.runLater(0.5, () => {

            new 战舰碎片兑换();
            new 探索点兑换();
            new 存档属性();
            new 全服排行榜();

            new QQ群加群链接();
        });
        BaseUtil.runLater(1.2, () => {
            //商城
            商城();
            new 牛币道具();
            BaseUtil.runLater(0.2, () => {
                ActorTypeUtil.forAllActorTypes(actorType => {
                    actorType.class = "商城"
                }, "积分商城");
                ActorTypeUtil.forAllActorTypes(actorType => {
                    actorType.hide = true
                }, "商城", "船只魔改");
                //
                new 魔改道具();

                //游戏设置
                new 玩家设置特效等开关();
            });
        })


    }


}