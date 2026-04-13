import BaseUtil from "@/BaseUtil";
import SelectUtil from "@/SelectUtil";
import PlayerUtil from "@/PlayerUtil";
import AttributeUtil from "@/AttributeUtil";
import MapHeroUtil from "../../util/MapHeroUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "../主炮/主炮基础事件";
import {l_中心旋涡点} from "../../_sl_editor/l_中心旋涡点";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import {d_擂台单位挑战NPC} from "../../xlsx/单位/擂台单位挑战NPC";
import ActorUnitUtil from "@/ActorUnitUtil";
import {l_起始点} from "../../_sl_editor/l_起始点";
import UnitUtil from "@/UnitUtil";
import TextTagUtil from "@/TextTagUtil";
import PlatUtil from "@/PlatUtil";
import UnitStateUtil from "@/UnitStateUtil";
import XlsxDataUtil from "@/XlsxDataUtil";
import {d_深度海域存档} from "../../xlsx/存档/深度海域存档";
import {d_历史中的战舰碎片} from "../../xlsx/存档/历史中的战舰碎片";
import {d_兑换初始属性存档} from "../../xlsx/存档/兑换初始属性存档";
import BaseMultiboardState from "../module/BaseMultiboardState";
import 达尔文进化基础刷怪 from "../刷怪系统/达尔文进化基础刷怪";
import GameUtil from "@/GameUtil";


export default class 游戏设置 {


    constructor() {
        BaseMultiboardState.config.showPlayerHeroName = true;
        BaseMultiboardState.config.showPlayerHeroLevel = true;
        BaseMultiboardState.config.showSwallowCount = true;
        se.onPlayerChat("-gj", (e, solarTrigger) => {
            BJDebugMsg("停止刷怪系统!");
            达尔文进化基础刷怪.stop();
            BaseUtil.runLater(60 * 60 * 7, () => {
                GameUtil.defeats();
                EndGame(true);
            });

        });

        ActorTypeShopUtil.autoDisableSellingAbilityOnNoStoreTarget(d_擂台单位挑战NPC[0].id)
        // for (let data of d_演员物品售卖NPC) {
        //     ActorTypeShopUtil.autoDisableSellingAbilityOnNoStoreTarget(data.id)
        // }


        ActorTypeUtil.forAllActorTypes((actorType: AppActorType & t_船主炮) => {
            if (actorType.sc_射程 && actorType.sc_射程 > 0 && actorType.ss_射速 && actorType.sc_射程 > 0) {
                if (actorType.stateFormula == null && actorType.shgs_伤害公式) {
                    actorType.stateFormula = actorType.shgs_伤害公式;
                }
                actorType.onUnitChange = (actor, unit) => {
                    主炮基础事件.onUnitChange(actor, unit)
                }
                // print("注册主炮单位改变事件:"+actorType.name)
                actorType.onDestroy = actor => {
                    主炮基础事件.onDestroy(actor)
                }
            }
        })
        //基础设置
        BaseUtil.runLater(1, () => {
            PlayerUtil.forPlayingPlayers(player => {
                if (GetPlayerId(player) > 3) {
                    return
                }
                let playerAttribute = AttributeUtil.getPlayerAttribute(player, true);
                playerAttribute.每秒金币 = (playerAttribute.每秒金币 || 0) + 1;
                let anHero = SelectUtil.getAnHero(GetPlayerId(player));
                MapHeroUtil.cshyx_初始化英雄(anHero);
                if (settings.gameDifficulty == 1 && PlatUtil.getMapLevel(player) < 3) {
                    playerAttribute.死亡后立刻复活 = (playerAttribute.死亡后立刻复活 || 0) + 2;
                    PlayerUtil.message("|cffff0000【萌新福利】检测到你的地图等级不超过2级.所以奖励你额外生命2条。以免你被怪物暴虐！", 10, player)
                }


                sd(player).assistant = ActorUnitUtil.createActorUnit(player, "宝宝助手", l_起始点[0].x, l_起始点[0].y).unit
            });

        })

        // 右键移动时闪现到目的地.cfg = [];
        se.onLeaveRect(gg_rct_base, e => {
            if (ActorUnitUtil.isActorUnitType(e.trigUnit, "宝宝助手")) {
                UnitUtil.transfer(e.trigUnit, l_起始点[0].x, l_起始点[0].y)
                TextTagUtil.textWarn("宝宝不能离开基地！右键双击物品可以传送到英雄!", e.trigUnit, 10, 5)
            }


        })


        PlayerUtil.allianceWithNeutralAggressive(8, 9, 10, 11)
        //boss


        let zxd = CreateUnit(Player(11), "A45g", l_中心旋涡点[0].x, l_中心旋涡点[0].y, 0);
        UnitStateUtil.addArmor(zxd, UnitStateUtil.getArmor(zxd) * settings.valueCoefficient)
        UnitStateUtil.addMaxLifeAndLife(zxd, UnitStateUtil.getMaxLife(zxd) * settings.valueCoefficient)


        //
        XlsxDataUtil.registerData(d_深度海域存档)
        XlsxDataUtil.registerData(d_历史中的战舰碎片)
        XlsxDataUtil.registerData(d_兑换初始属性存档)


    }
}