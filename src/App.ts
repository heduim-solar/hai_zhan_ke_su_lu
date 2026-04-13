//base
import GlobalVars from '@sl-wc3/GlobalVars';
// app imports
import StateInit from "./StateInit";
import StateConfigInit from "./StateConfigInit";
import BaseUtil from '@/BaseUtil';
import SolarDataClearState from "@/SolarDataClearState";
import UnitAttributeState from "@/UnitAttributeState";
import SolarDamageState from "@/SolarDamageState";
import ItemAttributeState from "@/ItemAttributeState";
import PlayerAttributeState from "@/PlayerAttributeState";
import PlayerUtil from "@/PlayerUtil";
import SolarActorState from "@/SolarActorState";
import 初始化 from "./初始化";
import GameUtil from "@/GameUtil";
import 地图测试 from "./地图测试";
import 达尔文进化基础刷怪 from "./state/刷怪系统/达尔文进化基础刷怪";
import XlsxDataUtil from "@/XlsxDataUtil";
import {d_玩家英雄船} from "./xlsx/单位/玩家英雄船";
import ForceUtil from "@/ForceUtil";
import GameDifficultyChooseDialogState from "./state/common/GameDifficultyChooseDialogState";
import {d_进攻怪演员} from "./xlsx/单位/进攻怪演员";
import {d_进攻怪boss} from "./xlsx/单位/进攻怪boss";
import MapBaseInitState from "./state/module/MapBaseInitState";
import SolarActorUnitState from "@/SolarActorUnitState";
import MapRectUtil from "./util/MapRectUtil";
import MapModel from "./MapModel";
import 初始化存档和商城 from "./初始化存档和商城";
//这里可传入的isDebug 布尔值为是否打开控制台日志方便开发，
//若不传值则自动推测当前地图是否为测试环境（slk后的地图不测试 在太阳编辑器打开此地图的机器测试）
GlobalVars.init()

export default class App {

    constructor() {

        //先打印一个文本 让我们知道已运行到了TS入口代码
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, "|cff00ff00升级可进行进化，进化可选择性保留主炮，快去构筑最强船只吧！");
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, "|cffff0000一定要准备个马达和甲板，跑图速度和防秒很重要。");
        gv.bossAbilityLimit = 1;
        gv.上手入门模式 = true;
        /**
         * 地图脚本推荐由2部分组成
         * 1、数据 （推荐从xlsx编译获得）
         * 2、功能模块（通用的逻辑代码）
         * 通常每张图的数据都不一样 可由xlsx配置这些数据（物编、数值等）
         * 地图的功能模块逻辑通用性很强（请沉淀此部分代码）
         */
        //配置此地图的功能模块运转的数据 (可从xlsx表格编译获得)
        StateConfigInit();
        XlsxDataUtil.registerData(d_玩家英雄船)
        //刷怪设置
        达尔文进化基础刷怪.config.createOnDeepWater = true;
        达尔文进化基础刷怪.config.creeper_palyer_nos = [8, 9, 10, 11];
        BaseUtil.runLater(300, () => {
            达尔文进化基础刷怪.config.creeper_min += 100;
            达尔文进化基础刷怪.config.create_creeper_pers += ForceUtil.getUserCount();
        })
        达尔文进化基础刷怪.config.regions = ["gg_rct_map"];
        for (let data of d_进攻怪演员) {
            if (data?.id) {
                let u = {}
                u[data.id] = 1;
                达尔文进化基础刷怪.config.unit_ids.push(u);
            }
        }
        for (let data of d_进攻怪boss) {
            if (data?.id) {
                达尔文进化基础刷怪.config.boss_unit_ids.push(data.id);
            }
        }
        达尔文进化基础刷怪.config.regions = ["gg_rct_map"];

        // DebugUtil.openShopArchiveMapLv()
        //启动基本的 数据清理排泄
        new SolarDataClearState();

        /**【可选】启用太阳属性相关系统 */
        new SolarDamageState();//太阳伤害系统
        new ItemAttributeState();//太阳物品属性
        new PlayerAttributeState();//太阳玩家属性
        new UnitAttributeState();//太阳单位属性系统
        /**【可选】启用太阳演员系统 (可以轻易使用各种物编模拟功能)
         * 使用前需添加基础物编模板（可在太阳编辑器文件树右键新建中一键添加） */
        SolarActorUnitState.config.openBounty = false;
        new SolarActorState()

        //
        new GameDifficultyChooseDialogState();
        //启动此地图需要的功能模块 (推荐高内聚，低耦合的编码方式以沉淀这些逻辑代码)
        // DebugUtil.openShop();

        se.on("选择难度", () => {
            if (settings.gameDifficulty > 1 || settings.gameMode != MapModel.模式1_普通模式) {
                gv.上手入门模式 = false;
            }
            达尔文进化基础刷怪.config.creeper_min = 50 + (settings.gameDifficulty * 5);
            达尔文进化基础刷怪.config.create_creeper_pers = 1 + Math.floor(settings.gameDifficulty / 3);
            if (settings.gameMode == MapModel.模式2_寄生模式) {
                达尔文进化基础刷怪.config.creeper_min *= 2;
                达尔文进化基础刷怪.config.create_creeper_pers += 2;
                达尔文进化基础刷怪.config.create_creeper_pers *= 2;
            } else if (settings.gameMode == MapModel.模式3_献祭模式) {
                达尔文进化基础刷怪.config.creeper_min *= 3;
                达尔文进化基础刷怪.config.create_creeper_pers += 3;
                达尔文进化基础刷怪.config.create_creeper_pers *= 3;
            } else if (settings.gameMode == MapModel.模式4_真实难度) {
                达尔文进化基础刷怪.config.creeper_min *= 4;
                达尔文进化基础刷怪.config.create_creeper_pers += 5;
                达尔文进化基础刷怪.config.create_creeper_pers *= 3;
            }

            new MapBaseInitState();
            new 初始化();
            new 初始化存档和商城();
            StateInit();
            MapRectUtil.setMapRect(0)
        })

        GameUtil.openFullMapView()

        //测试区
        // new AppTest();
        new 地图测试()

    }

}

// new App();//这里的代码是在地图初始化执行 修改或隐藏原生UI通常需要在这里执行
BaseUtil.runLater(0.01, () => {
    DzSetWar3MapMap("区域小地图\\主图.blp")
})
//如果初始化执行的触发报错提示不全 可换以下代码使用中心计时器延迟执行逻辑代码 以显示完整的报错堆栈信息
BaseUtil.runLater(0.02, () => {
    // GlobalVars.set2G(require('jass.globals')); //如果Ts与Jass混用 可以在这里再次刷新一下jass全局变量到 TS全局环境变量中
    if (isEmbedJapi) {
        //内置lua可以等uid同步完成后启动 以兼容使用uid的函数
        PlayerUtil.onUsersUidReady(() => {
            new App();
        })
    } else {
        //ydlua 直接启动
        new App();
    }

});