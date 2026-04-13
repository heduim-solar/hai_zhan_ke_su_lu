import MapHeroUtil from "./util/MapHeroUtil";
import PlayerUtil from "@/PlayerUtil";
import {d_玩家英雄船} from "./xlsx/单位/玩家英雄船";
import HeroUtil from "@/HeroUtil";
import {d_藏宝图} from "./xlsx/装备/藏宝图";
import 进化系统 from "./state/系统/进化系统";
import 游戏胜利 from "./state/刷怪系统/游戏胜利";
import 存档获取 from "./state/存档/存档获取";
import ActorItemUtil from "@/ActorItemUtil";
import {l_起始点} from "./_sl_editor/l_起始点";
import VestUtil from "@/VestUtil";
import SelectUtil from "@/SelectUtil";
import MathUtil from "@/MathUtil";
import 深度海域 from "./state/深度海域/深度海域";
import 海域工具 from "./state/深度海域/海域工具";
import PlatUtil from "@/PlatUtil";
import XlsxDataUtil from "@/XlsxDataUtil";
import ArchiveUtil from "@/ArchiveUtil";
import ObjectTemplateUtil from "@/ObjectTemplateUtil";
import AttributeUtil from "@/AttributeUtil";
import ActorAbility from "@/ActorAbility";
import ActorAbilityUtil from "@/ActorAbilityUtil";

export default class 地图测试 {

    constructor() {
        if (!isDebug) {
            return
        }


        print("输入q1测试第一个英雄 q2测试第2二个英雄")
        se.onPlayerChat("q", (e, ss) => {
            let c = e.eventPlayerChatString;
            if (c.length > 3) {
                return
            }
            let t = e.triggerPlayer;
            let s = c.substring(1);
            let newUnit = CreateUnit(t, d_玩家英雄船[tonumber(s) - 1].id, GetUnitX(PlayerUtil.getHero(t)), GetUnitY(PlayerUtil.getHero(t)), GetUnitFacing(PlayerUtil.getHero(t)))
            RemoveUnit(PlayerUtil.getHero(t))
            HeroUtil.addHeroProperty(newUnit, 50, 50, 50)

            MapHeroUtil.cshyx_初始化英雄(newUnit);


        }, false)
        se.onPlayerChat("sd", (e, ss) => {
            let c = e.eventPlayerChatString;
            if (c.length > 4) {
                return
            }
            let t = e.triggerPlayer;
            let s = c.substring(2);

            深度海域.进入深度海域(tonumber(s))


        }, false)
        se.onPlayerChat("jtsjf", () => {
            海域工具.增加玩家探索积分(10000)
            let data: t_历史中的战舰碎片 = XlsxDataUtil.getDataById("历史中的战舰碎片");
            PlayerUtil.forUsers(player => {
                PlatUtil.addStoreInt(player, data.requireKey, 1000);
            });
            PlayerUtil.message("|cff00ff00【存档】获得" + data.name + "+" + 1000)
        })
        se.onPlayerChat("tb", (e, ss) => {
            let c = e.eventPlayerChatString;
            if (c.length > 4) {
                return
            }
            let t = e.triggerPlayer;
            let s = c.substring(2);
            gv.enemyLevel = tonumber(s) * 4 - 1;


        }, false)
        se.onPlayerChat("cb", (t, c) => {
            for (let dataType of d_藏宝图) {
                let item = CreateItem(dataType.id, GetUnitX(PlayerUtil.getHero(Player(0))), GetUnitY(PlayerUtil.getHero(Player(0))))
            }
        })
        se.onPlayerChat("jzp", (t, c) => {
            ActorAbilityUtil.createActorAbility("深海之女",SelectUtil.getRealSelectUnit(),9)
            ActorAbilityUtil.createActorAbility("蓝色幻影",SelectUtil.getRealSelectUnit(),9)
            ActorAbilityUtil.createActorAbility("皇家宝藏号",SelectUtil.getRealSelectUnit(),9)
        })
        se.onPlayerChat("jh", (t, c) => {
            进化系统.do进化(t.triggerPlayer, 1);
        })
        se.onPlayerChat("jsd", (t, c) => {
            sd(Player(0)).killCount = 48;
        })
        se.onPlayerChat("jsd2", (t, c) => {
            sd(Player(0)).killCount = 10000;
        })
        se.onPlayerChat("cyb", (t, c) => {
            PlayerUtil.forUsers(p => {
                PlayerUtil.addGoldState(p, 500000)
                PlayerUtil.addLumberState(p, 1000)
                let hero = PlayerUtil.getHero(p);
                HeroUtil.addHeroProperty(hero, 1000000)
                sd(p).killCount = 100000;
                AttributeUtil.getUnitAttribute(hero,true).autoMissileAttackRange_p = 3000;
            })
        })
        se.onPlayerChat("cjx", (t, c) => {
            PlayerUtil.forUsers(p => {
                PlayerUtil.addGoldState(p, 500000)
                PlayerUtil.addLumberState(p, 1000)
                sd(p).killCount = 100000;
                print("英雄h=" + tostring(PlayerUtil.getHero(p)))
            })
            ActorItemUtil.createActorItem("炮姐", l_起始点[1].x, l_起始点[1].y);


        })
        se.onPlayerChat("jx", (t, c) => {
            let hero = PlayerUtil.getHero(Player(0));
            VestUtil.createPhantomUnit(hero, 5)


        })


        se.onPlayerChat("cyy", (t, c) => {
            ActorItemUtil.createActorItem("胶胶果实", l_起始点[1].x, l_起始点[1].y).setUses(5)
            ActorItemUtil.createActorItem("胶胶果实", l_起始点[1].x + 100, l_起始点[1].y).setUses(4)
            ActorItemUtil.createActorItem("胶胶果实", l_起始点[1].x + 200, l_起始点[1].y).setUses(5)
            ActorItemUtil.createActorItem("胶胶果实", l_起始点[1].x + 300, l_起始点[1].y).setUses(6)
            ActorItemUtil.createActorItem("胶胶果实", l_起始点[1].x + 400, l_起始点[1].y).setUses(7)
        })
        se.onPlayerChat("sl", (t, c) => {
            游戏胜利.victorys()
        })
        se.onPlayerChat("tcd", (t, c) => {
            ArchiveUtil.addNumber(Player(0), "sc_hscs", 10)
            ArchiveUtil.addNumber(Player(0), "sc_shjs", 15)
            ArchiveUtil.addNumber(Player(0), "sc_dfsp", 20)
            ArchiveUtil.addNumber(Player(0), "sc_glz", 20)
            ArchiveUtil.addNumber(Player(0), "kb1d", 20)
            ArchiveUtil.addNumber(Player(0), "n9", 100)
            ArchiveUtil.addNumber(Player(0), "shqb", 50)
            ArchiveUtil.addNumber(Player(0), "sc_xszx", 50)
            ArchiveUtil.addNumber(Player(0), "kb3b", 10)
            ArchiveUtil.addNumber(Player(0), "kb4b", 10)
            ArchiveUtil.addNumber(Player(0), "kb1b", 10)
            ArchiveUtil.addNumber(Player(0), "kb2b", 10)
            ArchiveUtil.addNumber(Player(0), "kb5a", 10)
            ArchiveUtil.addNumber(Player(0), "kb5b", 10)
            PlatUtil.addStoreInt(Player(0), "Izjsp", 1000)
            PlatUtil.addStoreInt(Player(0), "Itsjf", 10000)
        })
        se.onPlayerChat("jsb", (t, c) => {
            存档获取.获得主炮存档()
            存档获取.击杀BOSS装备存档(1)
            存档获取.击杀BOSS装备存档(2)
            存档获取.击杀BOSS装备存档(3)
            存档获取.击杀BOSS装备存档(4)
            存档获取.击杀BOSS装备存档(5)
        })
        se.onPlayerChat("kx", (t, c) => {
            for (let i = 1; i <= 12; i++) {
                let templateIdleCount = ObjectTemplateUtil.getTemplateIdleCount("主动" + i);
                print(i + "templateIdleCount=" + templateIdleCount)
            }

        })

        se.onPlayerChat("cj", (e, solarTrigger) => {
            let hero = PlayerUtil.getHero(e.triggerPlayer);

            let enemyUnits = SelectUtil.getEnemyUnitsInRange(hero, 2000);

            if (enemyUnits == null) {
                return null;
            }
            if (enemyUnits.length == 1) {
                return enemyUnits[0];
            }
            let bx = GetUnitX(hero);
            let by = GetUnitY(hero);
            //遍历获取最近的单位
            print("============")
            for (let enemyUnit of enemyUnits) {
                let distance = MathUtil.distanceBetweenPoints(bx, by, GetUnitX(enemyUnit), GetUnitY(enemyUnit));
                print("distance=" + distance)
            }

        });


        // DebugUtil.numKeyFrame(1, "1", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x00)
        //
        // })
        // DebugUtil.numKeyFrame(2, "0x01", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x01)
        // })
        // DebugUtil.numKeyFrame(3, "0x02", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x02)
        // })
        //
        // DebugUtil.numKeyFrame(4, "0x04", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x04)
        // })
        // DebugUtil.numKeyFrame(5, "0x08", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x08)
        // })
        // DebugUtil.numKeyFrame(6, "0x10", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x10)
        // })
        // DebugUtil.numKeyFrame(7, "0x20", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x20)
        // })
        // DebugUtil.numKeyFrame(8, "0x40", () => {
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x40)
        // })
        // DebugUtil.numKeyFrame(9, "0x80", () => {
        //
        //     EXSetUnitMoveType(SelectUtil.getRealSelectUnit(), 0x80)
        // })


    }


}