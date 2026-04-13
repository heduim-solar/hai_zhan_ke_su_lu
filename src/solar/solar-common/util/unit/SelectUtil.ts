/**
 * 选择器 工具
 */

import GroupUtil from "./GroupUtil";
import Cache from "@/tool/Cache";
import GameCenter from "@/common/GameCenter";
import DataBase from "../../common/DataBase";
import MathUtil from "@/MathUtil";
import ArrayUtil from "@/ArrayUtil";
import UnitStateUtil from "@/UnitStateUtil";
import PlayerUtil from "@/PlayerUtil";

/** @noSelf **/
export default class SelectUtil {
    static cache: Cache = new Cache()

    /**
     * 获取玩家的英雄
     * 会自动选择第一个玩家拥有的英雄单位 或使用玩家SolarData的hero属性为玩家指定一个英雄单位
     * @param playerIndex
     * @param clearCache
     */
    static getAnHero(playerIndex: number, clearCache = false): unit {
        let hero = DataBase.getPlayerSolarData(Player(playerIndex), false)?.hero;
        if (hero) {
            return hero;
        }
        if (clearCache) {
            SelectUtil.cache.remove("PlayerHero:" + playerIndex);
        }
        let cacheUnitHandle = SelectUtil.cache.get("PlayerHero:" + playerIndex, () => {
            //获取玩家一个英雄
            // let group = GroupUtil.groupObjectPool.borrowObject();
            let group = _sl_tempGroup1;
            GroupEnumUnitsOfPlayer(group, Player(playerIndex), null);
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                if (IsUnitType(unitHandle, UNIT_TYPE_HERO)
                    && !IsUnitType(unitHandle, UNIT_TYPE_PEON)
                    && !IsUnitType(unitHandle, UNIT_TYPE_SUMMONED)
                    && !IsUnitIllusion(unitHandle)
                    && !IsUnitHidden(unitHandle)) {
                    return unitHandle;
                }
                GroupRemoveUnit(group, unitHandle)
            }
            // GroupUtil.groupObjectPool.returnObject(group);
            return null;
        })
        //todo 如果删除单位后  此handle可能是另一个新单位
        if (IsHandle(cacheUnitHandle)) {
            return cacheUnitHandle;
        }

        return null;
    }

    /**
     * 遍历真人玩家英雄
     * @param callBack
     */
    static forUserPlayerHero(callBack: (hero: unit, player: player) => void): void {
        PlayerUtil.forUsers(player => {
            let anHero = SelectUtil.getAnHero(GetPlayerId(player));
            if (IsHandle(anHero)) {
                callBack(anHero, player)
            }
        });

    }


    /**
     * 获取敌人
     * @param playerIndex
     * @param canAttack
     */
    static getAnEnemy(playerIndex: number = 0, canAttack: boolean = true): unit {
        let enemyUnits = SelectUtil.getAllEnemys(playerIndex);
        if (canAttack) {
            let canAttackEnemyUnits = [];
            for (let i = 0; i < enemyUnits.length; i++) {
                if (!UnitStateUtil.isInvulnerable(enemyUnits[i])) {
                    canAttackEnemyUnits.push(enemyUnits[i]);
                }
            }
            enemyUnits = canAttackEnemyUnits;
        }
        if (enemyUnits == null || enemyUnits.length == 0) {
            return null;
        }
        return enemyUnits[GetRandomInt(0, enemyUnits.length - 1)];
    }

    /**
     * 获取指定玩家的所有敌人
     * @param playerIndex
     */
    static getAllEnemys(playerIndex: number = 0): unit[] {
        let enemyUnits = []
        let allUnits = GameCenter.getAllUnits();
        let player = Player(playerIndex)
        for (let unit of allUnits) {
            if (IsUnitEnemy(unit, player) && UnitAlive(unit) && GetPlayerId(GetOwningPlayer(unit)) < 12) {
                enemyUnits.push(unit);
            }
        }
        return enemyUnits;
    }

    /**
     * 获取指定玩家的所有敌人个数
     * @param playerIndex
     */
    static getAllEnemysLength(playerIndex: number = 0): number {
        let allUnits = GameCenter.getAllUnits();
        let player = Player(playerIndex)
        let count = 0;
        for (let unit of allUnits) {
            if (IsUnitEnemy(unit, player) && UnitAlive(unit) && GetPlayerId(GetOwningPlayer(unit)) < 12) {
                count++;
            }
        }
        return count;
    }

    /**
     * 异步获取本地玩家选择的单位 没有选择 或 超过1个时返回null
     * 主要给模拟当前本地玩家选择单位的UI使用
     */
    static getRealSelectUnit() {
        if (isEmbedJapi) {
            return GetRealSelectUnit();
        }
        //
        GroupEnumUnitsSelected(_tempGroup, GetLocalPlayer(), null)
        let unit = FirstOfGroup(_tempGroup);
        if (!IsHandle(unit)) {
            return null
        }
        GroupRemoveUnit(_tempGroup, unit);
        if (IsHandle(FirstOfGroup(_tempGroup))) {//说明选择了2个单位
            return null
        }
        return unit;
    }

    /**
     * 遍历 单位 (可手动指定范围中心点x,y)周围的友军方单位
     */
    static forAllyUnitsInRange(center: unit, radius: number, callback: (unit: unit) => void,
                               x = GetUnitX(center), y = GetUnitY(center)): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRange(group, x, y, radius, null);
        let myPlayer = GetOwningPlayer(center)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }

            GroupRemoveUnit(group, unitHandle)
            if (!UnitAlive(unitHandle)) {
                continue
            }
            if (IsUnitAlly(unitHandle, myPlayer)) {
                callback(unitHandle)
            }
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**
     * 遍历 单位 (可手动指定范围中心点x,y)周围的敌方单位
     */
    static forEnemyUnitsInRange(center: unit, radius: number, callback: (unit: unit) => void,
                                x = GetUnitX(center), y = GetUnitY(center)): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRange(group, x, y, radius, null);
        let myPlayer = GetOwningPlayer(center)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }

            GroupRemoveUnit(group, unitHandle)
            if (!UnitAlive(unitHandle)) {
                continue
            }
            if (IsUnitEnemy(unitHandle, myPlayer)) {
                callback(unitHandle)
            }
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**
     * 获取 单位 (可手动指定范围中心点x,y)周围的敌方单位 并根据距离由近到远排序 [0]为最近的单位 [len-1]为最远单位
     */
    static getEnemyUnitsInRangeOrderByDistance(center: unit, radius: number, x = GetUnitX(center), y = GetUnitY(center), notInvulnerable: boolean = true): unit[] {
        let enemyUnits = SelectUtil.getEnemyUnitsInRange(center, radius, x, y, notInvulnerable);
        if (enemyUnits == null || enemyUnits.length == 0) {
            return enemyUnits;
        }
        //按距离 由近到远
        enemyUnits.sort((a, b) => {
            let aD: number = MathUtil.distanceBetweenPoints(x, y, GetUnitX(a), GetUnitY(a));
            let bD: number = MathUtil.distanceBetweenPoints(x, y, GetUnitX(b), GetUnitY(b));
            return aD - bD;
        });
        return enemyUnits;
    }

    /**
     * 获取 单位 (可手动指定范围中心点x,y)周围的敌方单位
     */
    static getEnemyUnitsInRange(center: unit, radius: number, x = GetUnitX(center), y = GetUnitY(center), notInvulnerable: boolean = true): unit[] {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRange(group, x, y, radius, null);
        let units = []
        let myPlayer = GetOwningPlayer(center)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            GroupRemoveUnit(group, unitHandle)
            if (!UnitStateUtil.isAlive(unitHandle)) {
                continue
            }
            if (notInvulnerable && UnitStateUtil.isInvulnerable(unitHandle)) {
                continue
            }
            if (IsUnitEnemy(unitHandle, myPlayer)) {
                units.push(unitHandle)
            }
        }
        GroupUtil.groupObjectPool.returnObject(group);
        return units
    }


    /**
     * 遍历中心点x,y周围的所有单位
     */
    static forUnitsInRange(x: number, y: number, radius: number, callback: (unit: unit) => void): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRange(group, x, y, radius, null);
        GroupUtil.for(group, callback)
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**
     * 遍历一条有宽度的线范围中 的 指定单位的敌人单位
     */
    static forEnemyUnitsInLine(whoEnemy: unit, lineX: number, lineY: number, lineLen: number, lineFaceAngle: number, lineWidth: number, callback: (unit: unit) => void): void {
        let unitsInLine = SelectUtil.getUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth);
        if (unitsInLine == null || unitsInLine.length == 0) {
            return
        }
        let myPlayer = GetOwningPlayer(whoEnemy)
        for (let unit of unitsInLine) {
            if (IsUnitEnemy(unit, myPlayer)) {
                callback(unit);
            }
        }
    }

    /**
     * 获取一条有宽度的线范围中 的 指定单位的敌人单位
     */
    static getEnemyUnitsInLine(whoEnemy: unit, lineX: number, lineY: number, lineLen: number, lineFaceAngle: number, lineWidth: number): unit[] {
        let unitsInLine = SelectUtil.getUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth);
        if (unitsInLine == null || unitsInLine.length == 0) {
            return
        }
        let result: unit[] = []
        let myPlayer = GetOwningPlayer(whoEnemy)
        for (let unit of unitsInLine) {
            if (IsUnitEnemy(unit, myPlayer)) {
                result.push(unit);
            }
        }
        return result;
    }

    /**
     * 遍历一条有宽度的线范围中 的所有单位
     * @param lineX
     * @param lineY
     * @param lineLen
     * @param lineFaceAngle
     * @param lineWidth
     * @param callback
     */
    static forUnitsInLine(lineX: number, lineY: number, lineLen: number, lineFaceAngle: number, lineWidth: number, callback: (unit: unit) => void): void {
        let unitsInLine = SelectUtil.getUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth);
        if (unitsInLine == null || unitsInLine.length == 0) {
            return
        }
        for (let unit of unitsInLine) {
            callback(unit);
        }
    }

    /**
     * 获取 一条有宽度的线范围中 的所有单位
     * @param lineX
     * @param lineY
     * @param lineLen
     * @param lineFaceAngle
     * @param lineWidth
     */
    static getUnitsInLine(lineX: number, lineY: number, lineLen: number, lineFaceAngle: number, lineWidth: number): unit[] {
        let stepLen = lineWidth / 2;
        let count = Math.ceil(lineLen / stepLen)
        let result: unit[] = []
        let group = GroupUtil.groupObjectPool.borrowObject();
        let lineFaceHD = MathUtil.angle2radian(lineFaceAngle);
        for (let i = 1; i < count; i++) {
            let dist = stepLen * i
            let x = lineX + dist * Cos(lineFaceHD)
            let y = lineY + dist * Sin(lineFaceHD)
            GroupEnumUnitsInRange(group, x, y, lineWidth, null);
            for (let j = 0; j <= 100000; j++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                if (!result.includes(unitHandle)) {
                    result.push(unitHandle)
                }
                GroupRemoveUnit(group, unitHandle)
            }
        }
        GroupUtil.groupObjectPool.returnObject(group);
        return result;
    }

    /**
     * 高效率的遍历地图所有单位
     * @param callback
     * @param unitType
     */
    static forAllAliveUnits(callback: (unit: unit) => void): void {
        let allUnits = GameCenter.getAllUnits();
        for (let unitHandle of allUnits) {
            if (UnitAlive(unitHandle)) {
                callback(unitHandle)
            }
        }
    }

    /**
     * 如果需要遍历有自定义值得单位 可以使用DataBase.forUnitSolarDatas()
     * @param callback
     * @param unitType
     */
    static forAllUnits(callback: (unit: unit) => void, unitType?: string): void {
        let allUnits = GameCenter.getAllUnits();
        if (unitType) {//如果指定类型存在 则按指定类型遍历
            let unitTypeNum = FourCC(unitType)
            for (let unitHandle of allUnits) {
                if (unitTypeNum == GetUnitTypeId(unitHandle)) {
                    callback(unitHandle)
                }
            }
        } else {
            for (let unitHandle of allUnits) {
                callback(unitHandle)
            }
        }
    }

    /**
     * 获取玩家所有单位
     * @param playerIndex
     * @param unitType
     */
    static getPlayerUnits(playerIndex: number, unitType?: string): unit[] {
        let resultUnits = []
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, Player(playerIndex), null)
        if (unitType) {
            let unitTypeNum = FourCC(unitType)
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                if (unitTypeNum == GetUnitTypeId(unitHandle)) {
                    resultUnits.push(unitHandle)
                }
                GroupRemoveUnit(group, unitHandle)
            }
        } else {
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                resultUnits.push(unitHandle)
                GroupRemoveUnit(group, unitHandle)
            }
        }
        GroupUtil.groupObjectPool.returnObject(group);
        return resultUnits;
    }

    /**
     * 遍历玩家所有单位
     * @param callback
     * @param playerIndex
     * @param unitType 遍历指定单位类型 不传值则为所有类型
     */
    static forPlayerUnits(callback: (unit: unit) => void, playerIndex: number, unitType?: string) {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, Player(playerIndex), null)
        if (unitType) {//如果指定类型存在 则按指定类型遍历
            let unitTypeNum = FourCC(unitType)
            for (let i = 0; i <= 1000000; i++) {
                let unitHandle = FirstOfGroup(group)
                if (!IsHandle(unitHandle)) {
                    break
                }
                if (unitTypeNum == GetUnitTypeId(unitHandle)) {
                    callback(unitHandle)
                }
                GroupRemoveUnit(group, unitHandle)
            }
        } else {
            GroupUtil.for(group, callback)
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**
     * 遍历玩家所有活着的单位
     * @param callback
     * @param playerIndex
     * @param unitType 遍历指定单位类型 不传值则为所有类型
     */
    static forPlayerAliveUnits(callback: (unit: unit) => void, playerIndex: number) {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsOfPlayer(group, Player(playerIndex), null)
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            if (UnitStateUtil.isAlive(unitHandle)) {
                callback(unitHandle)
            }
            GroupRemoveUnit(group, unitHandle)
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }


    /**
     * 遍历所有敌人 Enemy
     * whoseEnemy 谁的敌人 （默认遍历玩家1的敌人）
     * @param callback
     * @param whoseEnemy
     */
    static forAllEnemyUnits(callback: (unit: unit) => void, whoseEnemy: player = Player(0)): void {
        let group = GroupUtil.groupObjectPool.borrowObject();
        GroupEnumUnitsInRect(group, bj_mapInitialPlayableArea, null);
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(group)
            if (!IsHandle(unitHandle)) {
                break
            }
            if (IsUnitEnemy(unitHandle, whoseEnemy)) {
                callback(unitHandle)
            }
            GroupRemoveUnit(group, unitHandle)
        }
        GroupUtil.groupObjectPool.returnObject(group);
    }

    /**查找指定单位周围范围内随机一个敌方单位*/
    static getRandomEnemyInRange(whichUnit: unit, range: number): unit {
        let units = SelectUtil.getEnemyUnitsInRange(whichUnit, range);
        return ArrayUtil.randomElement(units);
    }

    /**查找指定单位周围范围内最近的一个敌方单位*/
    public static getNearestEnemyInRange(whichUnit: unit, maxRange: number): unit {
        let enemyUnits = SelectUtil.getEnemyUnitsInRange(whichUnit, maxRange);
        if (enemyUnits == null) {
            return null;
        }
        if (enemyUnits.length == 1) {
            return enemyUnits[0];
        }
        let minDis = maxRange;
        let minDisUnit = enemyUnits[0];
        let bx = GetUnitX(whichUnit);
        let by = GetUnitY(whichUnit);
        //遍历获取最近的单位
        for (let enemyUnit of enemyUnits) {
            let distance = MathUtil.distanceBetweenPoints(bx, by, GetUnitX(enemyUnit), GetUnitY(enemyUnit));
            if (distance < minDis) {
                minDis = distance;
                minDisUnit = enemyUnit;
            }
        }
        return minDisUnit;
    }

    /**查找指定单位周围范围内最远的一个敌方单位*/
    public static getFarthestEnemyInRange(whichUnit: unit, range: number): unit {
        let units = SelectUtil.getEnemyUnitsInRange(whichUnit, range);
        let returnUnitHandle: unit = null;
        let tempDistance: number = -1;
        for (let unitHandle of units) {
            let distance: number = MathUtil.distanceBetweenPoints(GetUnitX(whichUnit), GetUnitY(whichUnit), GetUnitX(unitHandle), GetUnitY(unitHandle));
            if (tempDistance < 0 || distance > tempDistance) {
                returnUnitHandle = unitHandle;
                tempDistance = distance;
            }
        }
        return returnUnitHandle;
    }

    /**
     *
     * 遍历本地玩家的当前镜头可见的单位
     * （可以模拟血条类似情况下使用）
     */
    static forLocalCameraUnits(inCameraUnitsCallback: (unit: unit) => void, outCameraUnitsCallback: (unit: unit) => void = null, frustumTop = 0.56, frustumBottom = 0.13, frustumLeft = 0, frustumRight = 0.8): void {
        if (!isEmbedJapi) {
            log.errorWithTraceBack("没有内置japi环境！")
            return
        }
        //左上位置
        const [minX, maxY] = screen_to_world(frustumLeft, 0.6 - frustumTop);
        //右上位置
        const [maxX, max2Y] = screen_to_world(frustumRight, 0.6 - frustumTop);
        //右下位置
        const [max2X, minY] = screen_to_world(frustumRight, 0.6 - frustumBottom);
        let tempGroup = _sl_tempGroup2;
        GroupClear(tempGroup);
        GroupEnumUnitsInRect(tempGroup, bj_mapInitialPlayableArea, null);
        for (let i = 0; i <= 1000000; i++) {
            let unitHandle = FirstOfGroup(tempGroup)
            if (!IsHandle(unitHandle)) {
                break
            }
            let x = GetUnitX(unitHandle);
            if (x > minX && x < maxX) {
                let y = GetUnitY(unitHandle);
                if (y > minY && y < maxY) {
                    inCameraUnitsCallback(unitHandle)
                    GroupRemoveUnit(tempGroup, unitHandle)
                    continue;
                }
            }
            if (outCameraUnitsCallback) {
                outCameraUnitsCallback(unitHandle)
            }
            GroupRemoveUnit(tempGroup, unitHandle)
        }
    }
}
