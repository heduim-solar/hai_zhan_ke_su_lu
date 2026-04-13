import DamageType from "@/DamageType";
import WeaponType from "@/WeaponType";
import DamageUtil from "@/DamageUtil";
import SelectUtil from "@/SelectUtil";
import LangUtil from "@/LangUtil";
import UnitStateUtil from "@/UnitStateUtil";

/**
 * 伤害排行榜 伤害值记录工具
 */

export type RecordDataType = {
    [pid: number]: {
        //total number
        total?: any,

        [name: string]: {
            total: number,
            [unitTypeId: string]: number
        }
    }
}
export type RecordRankingDataType = {
    pid: number
    name: string
    total: number
    /**占总记录数总和的百分比*/
    p?: number
}

export default class DamageRecordUtil {

    /** 总计伤害  注意 考虑到会被本地玩家清空统计 通常这个数据是异步的 */
    static totalRecord: RecordDataType = {}
    /** 临时统计阶段伤害 注意 考虑到会被本地玩家清空统计 通常这个数据是异步的 */
    static tempRecord: RecordDataType = {}


    /**
     * @param recordName 统计伤害的key
     * @param whichUnit
     * @param target
     * @param damageOrFormula
     * @param damageTypeId
     * @param weaponTypeID
     * @param ranged
     * @param attack
     * @param attackType
     */
    static damage(recordName: string, whichUnit: unit, target: unit, damageOrFormula: number | StateFormula, damageTypeId: number = DamageType.T4_NORMAL,
                  weaponTypeID: number = WeaponType.T0_WHOKNOWS, ranged = true,
                  attack = false, attackType: attacktype = ATTACK_TYPE_CHAOS): number {
        let oldLife = GetUnitState(target, UNIT_STATE_LIFE)
        DamageUtil.damage(whichUnit, target, damageOrFormula, damageTypeId, weaponTypeID, ranged, attack, attackType)
        let realDmg = oldLife - GetUnitState(target, UNIT_STATE_LIFE)
        DamageRecordUtil.addRecord(whichUnit, recordName, realDmg);
        return realDmg;
    }

    /**
     * 伤害范围内的敌人
     * @param recordName
     * @param whichUnit 伤害来源
     * @param radius
     * @param damageOrFormula
     * @param damageTypeId
     * @param x 范围中心点x
     * @param y 范围中心点y
     * @param weaponTypeId
     * @param attackType
     * @param ranged
     * @param attack
     */
    static damageEnemyUnitsInRange(recordName: string, whichUnit: unit, radius: number, damageOrFormula: number | StateFormula, damageTypeId: number = DamageType.T4_NORMAL,
                                   x = GetUnitX(whichUnit), y = GetUnitY(whichUnit),
                                   weaponTypeId: number = WeaponType.T0_WHOKNOWS,
                                   ranged = true, attack = false, attackType: attacktype = ATTACK_TYPE_CHAOS) {
        let dt: damagetype = DamageUtil.damageTypes[damageTypeId]
        let wt: weapontype = DamageUtil.weaponTypes[weaponTypeId]
        let damage;
        let realDmg = 0;
        SelectUtil.forEnemyUnitsInRange(whichUnit, radius, (enemy) => {
            if (LangUtil.isNumber(damageOrFormula)) {
                damage = damageOrFormula as number;
            } else {
                damage = UnitStateUtil.calculateStateFormula(damageOrFormula as StateFormula, whichUnit, enemy as unit);
            }
            let oldLife = GetUnitState(enemy, UNIT_STATE_LIFE)
            UnitDamageTarget(whichUnit, enemy, damage, attack, ranged, attackType, dt, wt)
            realDmg = realDmg + (oldLife - GetUnitState(enemy, UNIT_STATE_LIFE))
        }, x, y)
        DamageRecordUtil.addRecord(whichUnit, recordName, realDmg);
        return realDmg;
    }


    static addRecord(whichUnit: unit, name: string, realDmg: number) {
        if (realDmg < 1) {
            return
        }
        DamageRecordUtil.addRecord2RecordDatas(DamageRecordUtil.totalRecord, whichUnit, name, realDmg);
        DamageRecordUtil.addRecord2RecordDatas(DamageRecordUtil.tempRecord, whichUnit, name, realDmg);
    }

    static addRecord2RecordDatas(recordDatas: RecordDataType, whichUnit: unit, name: string, realDmg) {
        let pid = GetPlayerId(GetOwningPlayer(whichUnit))
        let unitTypeId = id2string(GetUnitTypeId(whichUnit))
        let recordDatum = recordDatas[pid];
        //one case
        if (recordDatum == null) {
            recordDatum = {}
            recordDatas[pid] = recordDatum;
        }
        //one case
        let nameElement = recordDatum[name];
        if (nameElement == null) {
            nameElement = {
                total: 0
            }
            recordDatum[name] = nameElement;
        }
        recordDatum.total = (recordDatum.total || 0) + realDmg;
        nameElement.total += realDmg;
        //one case
        nameElement[unitTypeId] = (nameElement[unitTypeId] || 0) + realDmg

    }

    /**
     * 清空统计数据
     */
    static clearRecordDatas(recordDatas: RecordDataType) {
        if (recordDatas == null) {
            return
        }
        for (let recordDatasKey in recordDatas) {
            recordDatas[recordDatasKey] = null
        }
    }

    /**
     * 查询
     */

    static getRecordsByName(recordDatas: RecordDataType, filterPid?: number): RecordRankingDataType[] {
        if (recordDatas == null) {
            return
        }
        let result: RecordRankingDataType[] = []
        let allTotal = 0;
        for (let pid in recordDatas) {
            if (filterPid && tonumber(pid) != filterPid) {
                continue
            }
            let pidData = recordDatas[pid];
            if (pidData) {
                for (let name in pidData) {
                    if ("total" == name) {
                        continue
                    }
                    let total = pidData[name].total;
                    allTotal += total;
                    result.push({
                        pid: tonumber(pid),
                        name: name,
                        total: total,
                    });
                }
            }
        }
        //sort
        result.sort((a, b) => {
            return b.total - a.total
        })
        for (let recordRankingData of result) {
            recordRankingData.p = recordRankingData.total / allTotal
        }
        return result;
    }

    /**
     * 玩家总伤害排行
     * @param recordDatas
     * @param filterPid
     */
    static getRecordsByPlayer(recordDatas: RecordDataType): RecordRankingDataType[] {
        if (recordDatas == null) {
            return
        }
        let result: RecordRankingDataType[] = []
        let allTotal = 0;
        for (let pid in recordDatas) {
            if ("total" == pid) {
                continue
            }
            let pidData = recordDatas[pid];
            let total = pidData.total;
            allTotal += total;
            let pidn = tonumber(pid);
            result.push({
                pid: pidn,
                name: GetPlayerName(Player(pidn)),
                total: total,
            });
        }
        //sort
        result.sort((a, b) => {
            return b.total - a.total
        })
        for (let recordRankingData of result) {
            recordRankingData.p = recordRankingData.total / allTotal
        }
        return result;
    }


}

