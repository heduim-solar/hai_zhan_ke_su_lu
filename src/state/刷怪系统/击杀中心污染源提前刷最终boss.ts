import 达尔文进化基础刷怪 from "./达尔文进化基础刷怪";
import SolarDamageState from "@/SolarDamageState";
import UnitStateUtil from "@/UnitStateUtil";
import TextTagUtil from "@/TextTagUtil";
import CoolDown from "@/CoolDown";
import BaseUtil from "@/BaseUtil";
import TipFrameUtil from "@/TipFrameUtil";
import FramePoint from "@/FramePoint";
import MathUtil from "@/MathUtil";
import PlayerUtil from "@/PlayerUtil";

export default class 击杀中心污染源提前刷最终boss {


    constructor() {


        se.onUnitDeath(e => {
            if (e.trigUnitTypeIdStr == "A45g") {
                达尔文进化基础刷怪.stop();
                BaseUtil.runLater(1, (count, maxCount) => {
                    if (count == maxCount) {
                        if (settings.gameDifficulty <= 3) {
                            gv.enemyLevel = 达尔文进化基础刷怪.config.wave_level_max - 4;
                        } else {
                            gv.enemyLevel = 达尔文进化基础刷怪.config.wave_level_max - 1;
                        }
                        达尔文进化基础刷怪.creeperLevel = gv.enemyLevel;
                        达尔文进化基础刷怪.刷下一波怪(gv.enemyLevel)
                    }
                    TipFrameUtil.showWarnText("最终BOSS:" + (maxCount - count), FramePoint.center, 1, 0.026)

                }, 3);


            }
        })
        //污染核心
        /**
         * 建筑物，每次至多受到5%的伤害。不会受到魔法伤害。每秒回血2%，击杀后终止一切阶段直接刷新当前难度下的最终BOSS。
         */
        let coolDown = new CoolDown(60);
        let coolDown2 = new CoolDown(30);
        let coolDown3 = new CoolDown(15);
        //保证是最后执行的伤害计时器
        SolarDamageState.addEventHandlerLast(event => {
            if (id2string(GetUnitTypeId(event.unit0)) == "A45g") {
                if (MathUtil.distanceBetweenUnits(event.unit0, event.unit1) > 800) {
                    event.resultDamage = 0;
                    EXSetEventDamage(0)
                    event.consumed = true;
                    return;
                }
                event.resultDamage = Math.min(event.resultDamage, UnitStateUtil.getMaxLife(event.unit0) * 0.05);
                let unitLifeP = UnitStateUtil.getUnitLifeP(event.unit0);
                if (unitLifeP < 0.1) {
                    coolDown3.ifReady(() => {
                        UnitStateUtil.addInvulnerableIfNot(event.unit0, 5);
                    });
                } else if (unitLifeP < 0.5) {
                    coolDown2.ifReady(() => {
                        达尔文进化基础刷怪.config.creeper_min += 10;
                        达尔文进化基础刷怪.config.create_creeper_pers += 5;
                        PlayerUtil.message("|cffff0000当前刷怪速率:最低" + 达尔文进化基础刷怪.config.creeper_min + "+" + 达尔文进化基础刷怪.config.create_creeper_pers + "/s")
                        TextTagUtil.textWarn("无敌保护!5s", event.unit0);
                        UnitStateUtil.addInvulnerableIfNot(event.unit0, 5);
                    });
                } else if (unitLifeP < 0.8) {
                    coolDown.ifReady(() => {
                        TextTagUtil.textWarn("竟敢伤我！召唤大波小怪。。。", event.unit0);
                        UnitStateUtil.addInvulnerableIfNot(event.unit0, 3)
                        达尔文进化基础刷怪.createCurrentCreeper(150, unit => {
                            UnitStateUtil.orderAttackTarget(unit, event.unit1);
                        })
                    });
                }

            }
        })


    }


}