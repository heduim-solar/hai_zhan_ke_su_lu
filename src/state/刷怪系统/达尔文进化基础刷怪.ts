//#sl-final
import BaseUtil from '@/BaseUtil';
import RandomUtil from '@/RandomUtil';
import SelectUtil from '@/SelectUtil';
import TimerDialogUtil from '@/TimerDialogUtil';
import UnitStateUtil from "@/UnitStateUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import ArrayUtil from "@/ArrayUtil";
import GameUtil from "@/GameUtil";
import RectUtil from "@/RectUtil";
import {l_中心旋涡点} from "../../_sl_editor/l_中心旋涡点";
import PlayerUtil from "@/PlayerUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import VectorUtil from "@/VectorUtil";
import STimer from "@/STimer";
import ForceUtil from "@/ForceUtil";
import TipFrameUtil from "@/TipFrameUtil";
import FramePoint from "@/FramePoint";
import 购买核心部件 from "../核心部件/购买核心部件";
import MapModel from "../../MapModel";

interface UnitIds {
    //单位类型 与刷新概率
    [unitId: string]: number
}

/***
 *
 * 此刷怪可以保证场上最低存在多少数量怪物 让玩家的杀敌上限由自己决定 而不是由刷怪数量决定 玩家自主操作空间更大
 *
 *
 *
 */
export default class 达尔文进化基础刷怪 {
    /**
     * config
     * 选择难度后可根据难度修改此处配置的值
     */
    static config: {
        start_time: number,//刷兵开始时间
        creeper_palyer_nos: number[],//怪物的所属玩家号 0=玩家1 11=玩家12 考虑到单玩家超过200单位会卡顿 所以分多个电脑玩家来创建怪物
        creeper_min: number,  //场上最低存在数量 可在中途根据时长动态修改此值 以加快游戏节奏
        creeper_max: number,  //场上怪物最大存在数量 超过此数量时  不再创建新怪物(boss不受此限制)
        create_creeper_pers: number,  //每秒创建怪物数量 达到creeper_max则不再创建了 怪物总数量总是在 creeper_min与creeper_max之间浮动
        wave_time: number,//每波时长
        wave_level_max: number,//刷兵最大波数
        regions: string[],//刷怪区域
        unit_ids: UnitIds[],//普通怪物 必须配置
        elite_unit_ids: string[],//精英怪物 缺省值会取unit_ids
        elite_wave: number,//0=没有精英怪 1=每波都有 5=每5波有
        elite_count: number,//精英怪数量
        boss_unit_ids: string[],//boss怪物 缺省值会取unit_ids
        boss_kill_limit_time: number
        patrolProbability: number
        createOnDeepWater: boolean
    } = {
        start_time: 2,
        creeper_palyer_nos: [10, 11],
        creeper_min: 50,
        creeper_max: 500,
        create_creeper_pers: 1,
        wave_time: 240,
        wave_level_max: 16,
        regions: [],
        unit_ids: [],
        elite_unit_ids: [],
        elite_wave: 0,
        elite_count: 0,
        boss_unit_ids: [],
        boss_kill_limit_time: 0,
        patrolProbability: 0.2,
        createOnDeepWater: false
    };

    //var
    static creeperLevel = 1;
    static levelSTimer: STimer = null;
    static updateCreepersSTimer: STimer = null;

    constructor() {
        if (达尔文进化基础刷怪.config.unit_ids.length == 0) {
            return;
        }
        gv.enemyLevel = 1;
        达尔文进化基础刷怪.creeperLevel = gv.enemyLevel;
        达尔文进化基础刷怪.config.creeper_palyer_nos.forEach(no => {
            CreateFogModifierRectBJ(true, Player(no), FOG_OF_WAR_VISIBLE, GetPlayableMapRect());
        })
        达尔文进化基础刷怪.updateCreepersSTimer = BaseUtil.onTimer(1, (c) => {
            达尔文进化基础刷怪.updateCreepers();
            return true;
        });

        //wave
        //下一波的计时器窗口提示
        TimerDialogUtil.show("下一波", 达尔文进化基础刷怪.config.wave_time)
        达尔文进化基础刷怪.levelSTimer = BaseUtil.onTimer(达尔文进化基础刷怪.config.wave_time, (level) => {
            if (level >= 达尔文进化基础刷怪.config.wave_level_max) {
                return false;
            }
            达尔文进化基础刷怪.刷下一波怪(level)
            return true;
        });
    }

    static stop() {
        达尔文进化基础刷怪.updateCreepersSTimer?.destroy();
        达尔文进化基础刷怪.levelSTimer?.destroy();
    }

    static 刷下一波怪(level: number) {
        gv.enemyLevel++;
        PlayerUtil.message("|cffff0000大海上出现了新的敌人，污染浓度更深了。");
        se.emit("敌人波数改变", gv.enemyLevel)
        if (gv.enemyLevel < 3 || (gv.enemyLevel - 1) % 3 != 0) {
            达尔文进化基础刷怪.creeperLevel = gv.enemyLevel;
            return true;
        }
        let bossType = 达尔文进化基础刷怪.config.boss_unit_ids[(Math.floor(level / 3)) - 1];
        let region = globals[ArrayUtil.randomElement(达尔文进化基础刷怪.config.regions)];
        // let oneWaterLoc = this.getOneLoc(region);
        let oneWaterLoc = VectorUtil.getRandomXY(l_中心旋涡点[0], 512);
        if (level == 16) {
            //最后一波刷怪
            oneWaterLoc = l_中心旋涡点[0];
        }
        let unit = this.createCreeper(达尔文进化基础刷怪.config.creeper_palyer_nos[0],
            bossType, region, oneWaterLoc.x, oneWaterLoc.y);
        PingMinimap(GetUnitX(unit), GetUnitY(unit), 10);
        //
        UnitSetUsesAltIcon(unit, true);
        DzWidgetSetMinimapIconEnable?.(unit, true);
        DzWidgetSetMinimapIcon?.(unit, "进攻怪图标\\boss.blp");


        //Boss击杀剩余时间
        let timerdialog = TimerDialogUtil.show("Boss击杀剩余时间", 180);
        BaseUtil.onTimer(1, (count) => {
            if (gv.深度海域层数 && gv.深度海域层数 > 0) {
                TimerDialogDisplay(timerdialog, false);
                return false;
            }
            if (UnitStateUtil.isAlive(unit)) {
                if (count >= 180 && settings.gameMode != MapModel.模式0_教学模式) {
                    GameUtil.defeats("未在指定时间击杀boss!")
                    return false
                }
            } else {
                TimerDialogDisplay(timerdialog, false);
                达尔文进化基础刷怪.creeperLevel = gv.enemyLevel;
                if (settings.gameDifficulty > 3 || settings.gameMode != MapModel.模式1_普通模式) {
                    购买核心部件.gmhxbjs.forEach(ac => {
                        ac.setDisable(false);
                    });
                }
                return false;
            }
            let sysj = 180 - count;
            if (count % 60 == 0) {
                TipFrameUtil.showWarnText("Boss击杀剩余时间" + sysj, FramePoint.center, 3, 0.018);
            } else if (sysj < 30) {
                TipFrameUtil.showWarnText("Boss击杀剩余时间" + sysj, FramePoint.center, 1, 0.022);
            }
            return true;
        });


        //
        if (level < 达尔文进化基础刷怪.config.wave_level_max - 1) {
            TimerDialogUtil.show("下一波Boss到来", 达尔文进化基础刷怪.config.wave_time * 3)
        }
    }


    static updateCreepers() {
        let config = 达尔文进化基础刷怪.config;
        //
        gv.enemyCount = SelectUtil.getAllEnemysLength(0)
        //刷新小怪
        if (gv.enemyCount >= config.creeper_max) {
            return;
        }

        let count = (config.create_creeper_pers + ForceUtil.getUserAndComputerCount(4)) + 达尔文进化基础刷怪.creeperLevel;
        //先满足最低怪物数量要求
        if (gv.enemyCount < config.creeper_min) {
            count = count + (config.creeper_min - gv.enemyCount)
        }
        this.createCurrentCreeper(count)
    }

    static createCurrentCreeper(count: number, onCreateCreeper?: (u: unit) => void) {
        let config = 达尔文进化基础刷怪.config;

        let level = RandomUtil.nextInt(Math.max(1, 达尔文进化基础刷怪.creeperLevel - 4), 达尔文进化基础刷怪.creeperLevel)
        let unitIdObj = config.unit_ids[(level - 1) % config.unit_ids.length]
        let unitId = RandomUtil.getRandomKeyByWeight(unitIdObj as any)

        //one case  elite
        if (config.elite_wave > 0 && gv.enemyLevel % config.elite_wave == 0) {
            //one case  最后几个 刷精英怪
            unitId = config.elite_unit_ids[(gv.enemyLevel - 1) % (config.elite_unit_ids.length - 1)]
        }
        //开始刷兵（按所有玩家共享怪物刷）
        let regionValName: string = config.regions[RandomUtil.nextInt(0, config.regions.length - 1)];
        if (regionValName == null) {
            log.errorWithTraceBack("请配置刷怪出生点区域:" + config.regions)
            return;
        }
        let region: rect = globals[regionValName];
        if (region == null) {
            log.errorWithTraceBack("出生点区域不存在:" + regionValName)
            return;
        }

        for (let i = 0; i < Math.floor(count / 10); i++) {
            BaseUtil.runLater(0.02 * (i + 1), () => {
                for (let j = 0; j < 10; j++) {
                    let unit = this.createCreeper(ArrayUtil.randomElement(达尔文进化基础刷怪.config.creeper_palyer_nos), unitId, region);
                    onCreateCreeper?.(unit);
                }
            });
        }
        for (let i = 0; i < count % 10; i++) {
            let unit = this.createCreeper(ArrayUtil.randomElement(达尔文进化基础刷怪.config.creeper_palyer_nos), unitId, region);
            onCreateCreeper?.(unit)
        }
    }

    static createCreeper(creeper_palyerIndex: number, unitIdStr: string, region: rect, x?: number, y?: number): unit {
        if (y == null) {
            let oneWaterLoc = this.getOneLoc(region);
            x = oneWaterLoc.x;
            y = oneWaterLoc.y;
        }
        // let unit = new Unit(creeper_palyerIndex, unitIdStr, x, y, 0)
        let unitHandle: unit = null;
        if (ActorTypeUtil.hasActorType(unitIdStr)) {
            let actorUnit = ActorUnitUtil.createActorUnit(Player(creeper_palyerIndex), unitIdStr, x, y);
            unitHandle = actorUnit.unit
        } else {
            unitHandle = CreateUnit(Player(creeper_palyerIndex), unitIdStr, x, y, 0)
        }
        if (settings.valueCoefficient && settings.valueCoefficient != 1) {
            let multiple = settings.valueCoefficient;
            // new hp
            UnitStateUtil.setMaxLife(unitHandle, UnitStateUtil.getMaxLife(unitHandle) * multiple)
            UnitStateUtil.setUnitLifeP(unitHandle, 1)
            //  new_dmg
            UnitStateUtil.setDamageBase(unitHandle, UnitStateUtil.getDamageMax(unitHandle) * multiple)
            // new hj
            UnitStateUtil.setArmor(unitHandle, UnitStateUtil.getArmor(unitHandle) * settings.gameDifficulty)
        }
        //
        if (settings.isEndlessMode && gv.enemyLevel > 达尔文进化基础刷怪.config.wave_level_max) {
            let lastUnitTypeObj = 达尔文进化基础刷怪.config.unit_ids[达尔文进化基础刷怪.config.wave_level_max - 1]
            let lastUnitType = RandomUtil.getRandomKeyByWeight(lastUnitTypeObj as any)
            let multiple = gv.enemyLevel - 达尔文进化基础刷怪.config.wave_level_max;
            multiple = multiple * (settings.gameDifficulty - 1) * settings.gameDifficulty;
            // new hp
            UnitStateUtil.addMaxLifeAndLife(unitHandle, ObjectDataUtil.getUnitHP(lastUnitType) * multiple)
            //  new_dmg
            UnitStateUtil.addDamageBase(unitHandle, ObjectDataUtil.getUnitDmgplus1(lastUnitType) * multiple)
            // new hj
            UnitStateUtil.addArmor(unitHandle, ObjectDataUtil.getUnitDef(lastUnitType) * settings.gameDifficulty)
        }
        //随机命令巡逻几率
        if (RandomUtil.isInChance(达尔文进化基础刷怪.config.patrolProbability)) {
            let loc = this.getOneLoc(region);
            IssuePointOrder(unitHandle, "patrol", loc.x, loc.y);
        }

        return unitHandle;
    }


    static getOneLoc(region: rect): Vector {
        if (达尔文进化基础刷怪.config.createOnDeepWater) {            //海上点刷兵
            for (let i = 0; i < 100000; i++) {
                let x = GetRandomReal(GetRectMinX(region), GetRectMaxX(region));
                let y = GetRandomReal(GetRectMinY(region), GetRectMaxY(region));
                if (RectUtil.isContainsCoords(gg_rct_base, x, y)) {
                    continue
                }
                if (RectUtil.isContainsCoords(gg_rct_left_top, x, y)) {
                    continue
                }
                if (RectUtil.isContainsCoords(gg_rct_right_down, x, y)) {
                    continue
                }
                if (!IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                    return {x, y}
                }
            }
        } else {
            return RectUtil.getRandomXYInRect(region)
        }
    }


}