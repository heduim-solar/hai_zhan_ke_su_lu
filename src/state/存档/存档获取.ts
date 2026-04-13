import RandomUtil from "@/RandomUtil";
import PlayerUtil from "@/PlayerUtil";
import ArchiveUtil from "@/ArchiveUtil";
import {d_主炮存档A} from "../../xlsx/存档/主炮存档A";
import {d_主炮存档B} from "../../xlsx/存档/主炮存档B";
import {d_主炮存档C} from "../../xlsx/存档/主炮存档C";
import {d_击杀BOSS装备存档} from "../../xlsx/存档/击杀BOSS装备存档";
import AttributeUtil from "@/AttributeUtil";
import PlatUtil from "@/PlatUtil";
import MapUtil from "../../util/MapUtil";
import 海域工具 from "../深度海域/海域工具";

export default class 存档获取 {


    constructor() {

        // ActorTypeUtil.forAllActorTypes(actorType => {
        //     actorType.onUnitDeath = (actor, killingUnit) => {
        //
        //
        //     }
        // }, "进攻怪boss")

        se.on("游戏胜利", () => {
            //击杀BOSS装备存档
            存档获取.击杀BOSS装备存档(GetRandomInt(1, Math.min(settings.gameDifficulty, 5)));
            if (_g_time < 600000) {
                //
                PlayerUtil.message("通关时间小于10分钟！无法奖励主炮存档！")
                return
            }
            //获得主炮存档
            let chance = 0.01 * MapUtil.getRealNanduLevel()
            //保底获得一个存档
            存档获取.获得主炮存档();
            //几率获得多个存档
            if (RandomUtil.isInChance(chance)) {
                存档获取.获得主炮存档();
            }
            if (chance > 0.1) {
                if (RandomUtil.isInChance(chance)) {
                    存档获取.获得主炮存档();
                }
            }
            if (chance > 0.2) {
                if (RandomUtil.isInChance(chance)) {
                    存档获取.获得主炮存档();
                }
            }

            let 总存档掉率 = 0;
            let 有新人玩家 = false;
            let maxMapLv = 1;
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                if (!IsHandle(hero)) {
                    return
                }
                let 存档掉率 = AttributeUtil.getUnitAttribute(hero, false)?.存档掉率 || 0;
                总存档掉率 += 存档掉率;
                if (PlatUtil.getMapLevel(player) < 6) {
                    有新人玩家 = true;
                }
                maxMapLv = Math.max(maxMapLv, PlatUtil.getMapLevel(player))
            });
            PlayerUtil.forUsers(player => {
                if (maxMapLv - PlatUtil.getMapLevel(player) > 5) {
                    有新人玩家 = true;
                }
            });
            if (RandomUtil.isInChance(总存档掉率)) {
                存档获取.获得主炮存档();
            }
            if (有新人玩家) {
                PlayerUtil.message("|cffff0000带新福利！额外掉落一个存档:")
                存档获取.获得主炮存档();
            }
            if (MapUtil.getRealNanduLevel() > 9) {
                海域工具.增加玩家探索积分(MapUtil.getRealNanduLevel() * 2);
            }
        })

    }

    /**
     * 击杀BOSS装备存档    20%获得（任意难度）    10%获得（任意难度）    35%获得（N4~N9概率获得）    35%获得（N7~N9概率获得）
     */
    static 击杀BOSS装备存档(bossID: number) {
        //kb1a
        // kb1b
        // kb1c
        // kb1d
        //a
        if (RandomUtil.isInChance(0.2)) {
            let actorType = d_击杀BOSS装备存档[(bossID - 1) * 4 + 0]
            PlayerUtil.forUsers(player => {
                PlayerUtil.message("|cffff0000获得" + actorType.name, 10, player);
                ArchiveUtil.addNumber(player, actorType.requireKey, 1)
            })
        }
        //b
        if (RandomUtil.isInChance(0.1)) {
            let actorType = d_击杀BOSS装备存档[(bossID - 1) * 4 + 1]
            PlayerUtil.forUsers(player => {
                PlayerUtil.message("|cffff0000获得" + actorType.name, 10, player);
                ArchiveUtil.addNumber(player, actorType.requireKey, 1)
            })
        }
        //c
        if (settings.gameDifficulty >= 4 && RandomUtil.isInChance(0.35)) {
            let actorType = d_击杀BOSS装备存档[(bossID - 1) * 4 + 2]
            PlayerUtil.forUsers(player => {
                PlayerUtil.message("|cffff0000获得" + actorType.name, 10, player);
                ArchiveUtil.addNumber(player, actorType.requireKey, 1)
            })
        }
        //d
        if (settings.gameDifficulty >= 7 && RandomUtil.isInChance(0.35)) {
            let actorType = d_击杀BOSS装备存档[(bossID - 1) * 4 + 3]
            PlayerUtil.forUsers(player => {
                PlayerUtil.message("|cffff0000获得" + actorType.name, 10, player);
                ArchiveUtil.addNumber(player, actorType.requireKey, 1)
            })
        }


    }

    /**
     这是游戏核心存档，也就是天赋。存档ABC投放至局内，存档D投放至抽奖商店。命名规则=船名+设计图·伤害/射速/射程/魔改。
     目前只考虑普通模式，每个难度的每个BOSS有概率获得对应的设计图。
     N1BOSS1=5% BOSS2=6%BOSS3=7% BOSS4=8% BOSS5=10%(N1-N3没有这个BOSS）
     之后每个难度+1%
     重复获得可以分解为设计图碎片x1,5个设计图碎片可以兑换一个自己想要的设计图。在存档界面点击，二次确认兑换解锁。魔改设计图无法兑换。
     */

    static 获得主炮存档() {
        let randomInt = GetRandomInt(0, 100)
        let cdKey: string = "a";
        let cdName: string;
        let zhuPaoIndex = GetRandomInt(0, Math.min(d_主炮存档A.length - 1,   ))
        if (randomInt < 33) {
            cdKey = "a"
            cdName = d_主炮存档A[zhuPaoIndex].name
        } else if (randomInt < 66) {
            cdKey = "b"
            cdName = d_主炮存档B[zhuPaoIndex].name
        } else {
            cdKey = "c"
            cdName = d_主炮存档C[zhuPaoIndex].name
        }
        PlayerUtil.message("|cffff0000获得" + cdName);
        let fk = "_zp_" + cdKey + "_" + zhuPaoIndex;
        PlayerUtil.forUsers(player => {
            ArchiveUtil.addNumber(player, fk, 1);
            // if (oldVar && oldVar > 0) {
            //     PlayerUtil.message("|cffff0000检测到你已经拥有" + cdName + " 现自动转换为设计图碎片+1", 5, player);
            //     ArchiveUtil.addNumber(player, "_zp_sjt", 1)
            // } else {
            //     ArchiveUtil.set(player, fk, 1);
            // }
        })


    }

}