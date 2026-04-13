//#sl-final
import BaseUtil from '@/BaseUtil';
import TimerDialogUtil from '@/TimerDialogUtil';
import UnitStateUtil from '@/UnitStateUtil';
import UnitUtil from "@/UnitUtil";
import {l_起始点} from "../../_sl_editor/l_起始点";
import ActorItemUtil from "@/ActorItemUtil";
import AttributeUtil from "@/AttributeUtil";
import TextTagUtil from "@/TextTagUtil";
import ActorUtil from "@/ActorUtil";

export default class HeroReviveOnDeath {


    constructor() {

        se.onUnitDeath(e => {
            if (e.trigUnitOwnerId < 4 && e.isHeroUnitTrig) {

                let hero = e.trigUnit;
                let playerAttribute = AttributeUtil.getPlayerAttribute(GetOwningPlayer(hero), false);
                if (playerAttribute?.死亡后立刻复活 && playerAttribute.死亡后立刻复活 > 0) {
                    ReviveHero(hero, GetUnitX(hero), GetUnitY(hero), true);
                    SetUnitLifePercentBJ(hero, 100)
                    SetUnitManaPercentBJ(hero, 100)
                    playerAttribute.死亡后立刻复活--;
                    TextTagUtil.textWarn("消耗一次死亡后立刻复活", hero)
                    return
                }


                BaseUtil.runLater(0.11, () => {
                    if (!UnitAlive(hero) && !IsUnitType(hero, UNIT_TYPE_STRUCTURE)) {//如果已经重生了 则不需要走基础复活系统

                        //
                        let time = 1 + GetHeroLevel(hero)
                        if (ActorUtil.isUnitHasActor(hero, "鲁灰") ||
                            ActorUtil.isUnitHasActor(hero, "尼卡·鲁灰")
                        ) {
                            time = 3;
                        } else if (ActorItemUtil.isUnitHasActorItem(hero, "胶胶果实")) {
                            time = 5;
                            let actorItem = ActorItemUtil.getUnitActorItem(hero, "胶胶果实");
                            actorItem.addUses(-1);
                        } else if (ActorItemUtil.isUnitHasActorItem(hero, "重生十字章")) {
                            time = 1;
                            let actorItem = ActorItemUtil.getUnitActorItem(hero, "重生十字章");
                            actorItem.addUses(-1);
                        }
                        //神之号主炮 排斥，无法携带胶胶果实、鲁灰、尼卡·鲁灰，死亡无法复活
                        if (ActorUtil.isUnitHasActor(hero, "神之号主炮")) {
                            time * 2 + 10;
                        }
                        if (gv.深度海域层数 && gv.深度海域层数 > 0 && time > 5) {
                            //深度海域 不复活了
                            time += 10;
                        }

                        TimerDialogUtil.show(GetUnitName(hero), time)
                        BaseUtil.runLater(time, () => {
                            if (gv.深度海域层数 == null || gv.深度海域层数 == 0) {
                                UnitUtil.transfer(hero, l_起始点[0].x, l_起始点[0].y)
                            }
                            ReviveHero(hero, GetUnitX(hero), GetUnitY(hero), true);

                            SetUnitLifePercentBJ(hero, 100)
                            SetUnitManaPercentBJ(hero, 100)
                            BJDebugMsg(tostring(GetUnitName(hero)) + "复活了!")
                            //复活后无敌3秒
                            UnitStateUtil.addInvulnerableIfNot(hero, 3);
                        });
                    }

                });

            }
        });
    }


}