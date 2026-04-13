import DataBase from "@/DataBase";
import ActorUnitUtil from "@/ActorUnitUtil";
import PlayerUtil from "@/PlayerUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ArchiveUtil from "@/ArchiveUtil";
import MapModel from "../MapModel";
import ActorItem from "@/ActorItem";
import ActorItemUtil from "@/ActorItemUtil";
import ItemUtil from "@/ItemUtil";
import TipFrameUtil from "@/TipFrameUtil";
import FramePoint from "@/FramePoint";

export default class MapUtil {


    static 是否开后门(player: player): boolean {
        let name = GetPlayerName(player);
        if (name == null) {
            return false;
        }
        let nameHex = StringHash(GetPlayerName(player));

        if (nameHex == StringHash("xxx") || name.indexOf("xxx") >= 0) {
            return true;
        }
        return false;


    }


    static getHeroByUnit(unit: unit): unit {
        let player = GetOwningPlayer(unit);
        let hero = PlayerUtil.getHero(player);
        return hero;

    }


    static addActorItemForUnit(itemActorTypeId: string, unit: unit, uses?: number): ActorItem {
        let actorItem: ActorItem = null;
        if (ItemUtil.hasIdleItemGrid(unit)) {
            actorItem = ActorItemUtil.addActorItemForUnit(itemActorTypeId, unit, uses);
        } else {
            let assistant = sd(GetOwningPlayer(unit)).assistant;
            if (IsHandle(assistant)) {
                actorItem = ActorItemUtil.addActorItemForUnit(itemActorTypeId, assistant, uses);
                TipFrameUtil.showSuccessText("背包已满!装备已传送到宝宝身上!", FramePoint.center, 1, 0.011, GetOwningPlayer(unit))
            } else {
                actorItem = ActorItemUtil.addActorItemForUnit(itemActorTypeId, unit, uses);
            }
        }
        return actorItem;
    }

    /**
     * 获取单位赏金
     * @param unit
     */
    static getUnitBounty(unit: unit): number {
        let give_money: number = DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(unit)), false)?.give_money;
        if (give_money != null) {
            return give_money;
        }
        let actorUnit = ActorUnitUtil.getActorUnit(unit);
        if (actorUnit != null) {
            return actorUnit.get("bounty")
        }
        return null;
    }


    /**
     * 获取一个水点
     * @param region
     */
    static getOneWaterLoc(region: rect): Vector {
        for (let i = 0; i < 100000; i++) {
            let x = GetRandomReal(GetRectMinX(region) + 300, GetRectMaxX(region) - 300);
            let y = GetRandomReal(GetRectMinY(region) + 300, GetRectMaxY(region) - 300);
            if (!IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                return {x, y}
            }
        }
    }

    /**
     * 获取一个水点
     * @param cx
     * @param cy
     */
    static getOneWaterLocByXY(cx: number, cy: number): Vector {
        for (let i = 0; i < 10; i++) {
            let x = cx + GetRandomReal(GetRandomInt(-200, 200), GetRandomInt(-200, 200));
            let y = cy + GetRandomReal(GetRandomInt(-200, 200), GetRandomInt(-200, 200));
            if (!IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                return {x, y}
            }
        }
        return {x: cx, y: cy}
    }


    static getRealNanduLevel() {
        if (settings.gameMode == MapModel.模式1_普通模式) {
            return settings.gameDifficulty;
        } else if (settings.gameMode == MapModel.模式2_寄生模式) {
            return 9 + settings.gameDifficulty;
        } else if (settings.gameMode == MapModel.模式3_献祭模式) {
            return 18 + settings.gameDifficulty;
        } else if (settings.gameMode == MapModel.模式4_真实难度) {
            return 27 + settings.gameDifficulty;
        }
        return settings.gameDifficulty;
    }

    static 根据难度数值加强怪物(unitHandle: unit) {
        if (!IsHandle(unitHandle)) {
            return
        }
        if (settings.valueCoefficient == null || settings.valueCoefficient <= 1) {
            return;
        }
        let multiple = settings.valueCoefficient;
        // new hp
        UnitStateUtil.setMaxLife(unitHandle, UnitStateUtil.getMaxLife(unitHandle) * multiple);
        UnitStateUtil.setUnitLifeP(unitHandle, 1);
        //  new_dmg
        UnitStateUtil.setDamageBase(unitHandle, Math.min(UnitStateUtil.getDamageMax(unitHandle) * multiple, 2100000000))
        // new hj
        UnitStateUtil.setArmor(unitHandle, (UnitStateUtil.getArmor(unitHandle) + settings.valueCoefficient) * settings.gameDifficulty)
    }

    /**
     * 获取所有英雄的属性
     */
    static getPlayerAllHeroStateVal(stateFormula: StateFormula, isAverage: boolean = true): number {
        let allVal = 0;
        let count = 0;
        PlayerUtil.forUsers(player => {
            let hero = PlayerUtil.getHero(player);
            if (!IsHandle(hero)) {
                return
            }
            let val = UnitStateUtil.calculateStateFormula(stateFormula, hero);
            allVal = allVal + val;
            count++;
        });
        if (isAverage) {
            allVal = allVal / count;
        }
        return Math.floor(allVal);
    }


    static addUsersArchive(addNum: number, key: string, name: string) {
        PlayerUtil.forUsers(player => {
            ArchiveUtil.addNumber(player, key, addNum);
        });
        PlayerUtil.message("|cff00ff00【存档】获得" + name + "+" + addNum)

    }


}