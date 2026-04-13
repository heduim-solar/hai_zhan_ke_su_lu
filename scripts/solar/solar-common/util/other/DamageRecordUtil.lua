local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 31,["20"] = 31,["21"] = 31,["23"] = 31,["24"] = 50,["25"] = 50,["26"] = 50,["28"] = 51,["29"] = 51,["31"] = 51,["32"] = 51,["34"] = 52,["35"] = 52,["37"] = 52,["38"] = 52,["40"] = 53,["41"] = 54,["42"] = 54,["43"] = 54,["44"] = 54,["45"] = 54,["46"] = 54,["47"] = 54,["48"] = 54,["49"] = 54,["50"] = 54,["51"] = 55,["52"] = 56,["53"] = 57,["54"] = 50,["55"] = 74,["56"] = 74,["57"] = 74,["59"] = 75,["60"] = 75,["62"] = 75,["63"] = 75,["65"] = 76,["66"] = 76,["68"] = 77,["69"] = 77,["71"] = 77,["72"] = 77,["74"] = 77,["75"] = 77,["77"] = 78,["78"] = 79,["79"] = 80,["80"] = 81,["81"] = 82,["82"] = 82,["83"] = 82,["84"] = 82,["85"] = 83,["86"] = 84,["88"] = 86,["90"] = 88,["91"] = 89,["92"] = 89,["93"] = 89,["94"] = 89,["95"] = 89,["96"] = 89,["97"] = 89,["98"] = 89,["99"] = 89,["100"] = 89,["101"] = 90,["102"] = 82,["103"] = 82,["104"] = 82,["105"] = 82,["106"] = 92,["107"] = 93,["108"] = 74,["109"] = 97,["110"] = 98,["113"] = 101,["114"] = 102,["115"] = 97,["116"] = 105,["117"] = 106,["118"] = 107,["119"] = 108,["120"] = 110,["121"] = 111,["122"] = 112,["124"] = 115,["125"] = 116,["126"] = 117,["127"] = 120,["129"] = 122,["130"] = 123,["131"] = 125,["132"] = 105,["133"] = 132,["134"] = 133,["137"] = 136,["138"] = 137,["140"] = 132,["141"] = 145,["142"] = 146,["145"] = 149,["146"] = 150,["147"] = 151,["149"] = 152,["150"] = 153,["152"] = 155,["153"] = 156,["154"] = 157,["156"] = 158,["157"] = 159,["159"] = 161,["160"] = 162,["161"] = 163,["162"] = 163,["163"] = 163,["164"] = 163,["165"] = 163,["173"] = 172,["174"] = 172,["175"] = 172,["176"] = 173,["177"] = 172,["178"] = 172,["179"] = 175,["180"] = 176,["182"] = 178,["183"] = 145,["184"] = 186,["185"] = 187,["188"] = 190,["189"] = 191,["190"] = 192,["192"] = 193,["193"] = 194,["195"] = 196,["196"] = 197,["197"] = 198,["198"] = 199,["199"] = 200,["200"] = 200,["201"] = 200,["202"] = 200,["203"] = 200,["207"] = 207,["208"] = 207,["209"] = 207,["210"] = 208,["211"] = 207,["212"] = 207,["213"] = 210,["214"] = 211,["216"] = 213,["217"] = 186,["218"] = 34,["219"] = 36});
local ____exports = {}
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____WeaponType = require("solar.solar-common.constant.WeaponType")
local WeaponType = ____WeaponType.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local DamageRecordUtil = ____exports.default
DamageRecordUtil.name = "DamageRecordUtil"
function DamageRecordUtil.prototype.____constructor(self)
end
function DamageRecordUtil.damage(self, recordName, whichUnit, target, damageOrFormula, damageTypeId, weaponTypeID, ranged, attack, attackType)
    if damageTypeId == nil then
        damageTypeId = DamageType.T4_NORMAL
    end
    if weaponTypeID == nil then
        weaponTypeID = WeaponType.T0_WHOKNOWS
    end
    if ranged == nil then
        ranged = true
    end
    if attack == nil then
        attack = false
    end
    if attackType == nil then
        attackType = ATTACK_TYPE_CHAOS
    end
    local oldLife = GetUnitState(target, UNIT_STATE_LIFE)
    DamageUtil:damage(
        whichUnit,
        target,
        damageOrFormula,
        damageTypeId,
        weaponTypeID,
        ranged,
        attack,
        attackType
    )
    local realDmg = oldLife - GetUnitState(target, UNIT_STATE_LIFE)
    ____exports.default:addRecord(whichUnit, recordName, realDmg)
    return realDmg
end
function DamageRecordUtil.damageEnemyUnitsInRange(self, recordName, whichUnit, radius, damageOrFormula, damageTypeId, x, y, weaponTypeId, ranged, attack, attackType)
    if damageTypeId == nil then
        damageTypeId = DamageType.T4_NORMAL
    end
    if x == nil then
        x = GetUnitX(whichUnit)
    end
    if y == nil then
        y = GetUnitY(whichUnit)
    end
    if weaponTypeId == nil then
        weaponTypeId = WeaponType.T0_WHOKNOWS
    end
    if ranged == nil then
        ranged = true
    end
    if attack == nil then
        attack = false
    end
    if attackType == nil then
        attackType = ATTACK_TYPE_CHAOS
    end
    local dt = DamageUtil.damageTypes[damageTypeId + 1]
    local wt = DamageUtil.weaponTypes[weaponTypeId + 1]
    local damage
    local realDmg = 0
    SelectUtil.forEnemyUnitsInRange(
        whichUnit,
        radius,
        function(____, enemy)
            if LangUtil:isNumber(damageOrFormula) then
                damage = damageOrFormula
            else
                damage = UnitStateUtil:calculateStateFormula(damageOrFormula, whichUnit, enemy)
            end
            local oldLife = GetUnitState(enemy, UNIT_STATE_LIFE)
            UnitDamageTarget(
                whichUnit,
                enemy,
                damage,
                attack,
                ranged,
                attackType,
                dt,
                wt
            )
            realDmg = realDmg + (oldLife - GetUnitState(enemy, UNIT_STATE_LIFE))
        end,
        x,
        y
    )
    ____exports.default:addRecord(whichUnit, recordName, realDmg)
    return realDmg
end
function DamageRecordUtil.addRecord(self, whichUnit, name, realDmg)
    if realDmg < 1 then
        return
    end
    ____exports.default:addRecord2RecordDatas(____exports.default.totalRecord, whichUnit, name, realDmg)
    ____exports.default:addRecord2RecordDatas(____exports.default.tempRecord, whichUnit, name, realDmg)
end
function DamageRecordUtil.addRecord2RecordDatas(self, recordDatas, whichUnit, name, realDmg)
    local pid = GetPlayerId(GetOwningPlayer(whichUnit))
    local unitTypeId = id2string(GetUnitTypeId(whichUnit))
    local recordDatum = recordDatas[pid]
    if recordDatum == nil then
        recordDatum = {}
        recordDatas[pid] = recordDatum
    end
    local nameElement = recordDatum[name]
    if nameElement == nil then
        nameElement = {total = 0}
        recordDatum[name] = nameElement
    end
    recordDatum.total = (recordDatum.total or 0) + realDmg
    nameElement.total = nameElement.total + realDmg
    nameElement[unitTypeId] = (nameElement[unitTypeId] or 0) + realDmg
end
function DamageRecordUtil.clearRecordDatas(self, recordDatas)
    if recordDatas == nil then
        return
    end
    for recordDatasKey in pairs(recordDatas) do
        recordDatas[recordDatasKey] = nil
    end
end
function DamageRecordUtil.getRecordsByName(self, recordDatas, filterPid)
    if recordDatas == nil then
        return
    end
    local result = {}
    local allTotal = 0
    for pid in pairs(recordDatas) do
        do
            if filterPid and tonumber(pid) ~= filterPid then
                goto __continue19
            end
            local pidData = recordDatas[pid]
            if pidData then
                for name in pairs(pidData) do
                    do
                        if "total" == name then
                            goto __continue22
                        end
                        local total = pidData[name].total
                        allTotal = allTotal + total
                        result[#result + 1] = {
                            pid = tonumber(pid),
                            name = name,
                            total = total
                        }
                    end
                    ::__continue22::
                end
            end
        end
        ::__continue19::
    end
    __TS__ArraySort(
        result,
        function(____, a, b)
            return b.total - a.total
        end
    )
    for ____, recordRankingData in ipairs(result) do
        recordRankingData.p = recordRankingData.total / allTotal
    end
    return result
end
function DamageRecordUtil.getRecordsByPlayer(self, recordDatas)
    if recordDatas == nil then
        return
    end
    local result = {}
    local allTotal = 0
    for pid in pairs(recordDatas) do
        do
            if "total" == pid then
                goto __continue31
            end
            local pidData = recordDatas[pid]
            local total = pidData.total
            allTotal = allTotal + total
            local pidn = tonumber(pid)
            result[#result + 1] = {
                pid = pidn,
                name = GetPlayerName(Player(pidn)),
                total = total
            }
        end
        ::__continue31::
    end
    __TS__ArraySort(
        result,
        function(____, a, b)
            return b.total - a.total
        end
    )
    for ____, recordRankingData in ipairs(result) do
        recordRankingData.p = recordRankingData.total / allTotal
    end
    return result
end
DamageRecordUtil.totalRecord = {}
DamageRecordUtil.tempRecord = {}
return ____exports
