local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 14,["12"] = 14,["13"] = 14,["15"] = 14,["16"] = 22,["17"] = 23,["18"] = 24,["19"] = 25,["20"] = 26,["22"] = 28,["23"] = 22,["24"] = 36,["25"] = 37,["26"] = 38,["27"] = 39,["28"] = 40,["30"] = 42,["31"] = 36,["32"] = 49,["33"] = 49,["34"] = 50,["35"] = 51,["36"] = 52,["37"] = 53,["40"] = 56,["41"] = 57,["42"] = 58,["43"] = 59,["45"] = 61,["47"] = 51,["48"] = 64,["49"] = 49,["50"] = 70,["51"] = 70,["52"] = 71,["53"] = 72,["54"] = 73,["55"] = 74,["58"] = 77,["59"] = 78,["60"] = 79,["61"] = 80,["63"] = 82,["65"] = 72,["66"] = 85,["67"] = 70,["68"] = 91,["69"] = 91,["70"] = 92,["71"] = 93,["72"] = 94,["73"] = 95,["76"] = 98,["77"] = 99,["78"] = 100,["79"] = 101,["81"] = 103,["83"] = 93,["84"] = 106,["85"] = 91,["86"] = 116,["87"] = 117,["88"] = 118,["89"] = 119,["90"] = 120,["92"] = 116,["93"] = 130,["94"] = 131,["95"] = 132,["96"] = 133,["97"] = 134,["99"] = 130,["100"] = 144,["101"] = 145,["102"] = 146,["103"] = 147,["104"] = 148,["106"] = 144,["107"] = 156,["108"] = 157,["109"] = 157,["110"] = 156,["111"] = 164,["112"] = 165,["113"] = 165,["114"] = 164});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
____exports.default = __TS__Class()
local GradeUtil = ____exports.default
GradeUtil.name = "GradeUtil"
function GradeUtil.prototype.____constructor(self)
end
function GradeUtil.getRandomUnitIdByGrade(self, grade, ...)
    local gradeIds = ____exports.default:getUnitGradeIds(...)
    local ids = gradeIds[grade]
    if ids == nil or #ids == 0 then
        return nil
    end
    return ArrayUtil:randomElement(ids)
end
function GradeUtil.getRandomItemIdByGrade(self, grade, ...)
    local gradeIds = ____exports.default:getItemGradeIds(...)
    local ids = gradeIds[grade]
    if ids == nil or #ids == 0 then
        return nil
    end
    return ArrayUtil:randomElement(ids)
end
function GradeUtil.getUnitGradeIds(self, ...)
    local clazzs = {...}
    local gradeIds = {}
    DataBase:forUnitTypeSolarDatas(function(____, id, solarData)
        if solarData.grade then
            if clazzs and #clazzs > 0 and not __TS__ArrayIncludes(clazzs, solarData.class) then
                return
            end
            local ids = gradeIds[solarData.grade]
            if ids == nil then
                ids = {}
                gradeIds[solarData.grade] = ids
            end
            ids[#ids + 1] = id
        end
    end)
    return gradeIds
end
function GradeUtil.getItemGradeIds(self, ...)
    local clazzs = {...}
    local gradeIds = {}
    DataBase:forItemTypeSolarDatas(function(____, id, solarData)
        if solarData.grade then
            if clazzs and #clazzs > 0 and not __TS__ArrayIncludes(clazzs, solarData.class) then
                return
            end
            local ids = gradeIds[solarData.grade]
            if ids == nil then
                ids = {}
                gradeIds[solarData.grade] = ids
            end
            ids[#ids + 1] = id
        end
    end)
    return gradeIds
end
function GradeUtil.getAbilityGradeIds(self, ...)
    local clazzs = {...}
    local gradeIds = {}
    DataBase:forAbilityTypeSolarDatas(function(____, id, solarData)
        if solarData.grade then
            if clazzs and #clazzs > 0 and not __TS__ArrayIncludes(clazzs, solarData.class) then
                return
            end
            local ids = gradeIds[solarData.grade]
            if ids == nil then
                ids = {}
                gradeIds[solarData.grade] = ids
            end
            ids[#ids + 1] = id
        end
    end)
    return gradeIds
end
function GradeUtil.setItemTypeGrade(self, id, grade, clazz)
    local solarData = DataBase:getItemTypeSolarData(id, true)
    solarData.grade = grade
    if clazz then
        solarData.class = clazz
    end
end
function GradeUtil.setUnitTypeGrade(self, id, grade, clazz)
    local solarData = DataBase:getUnitTypeSolarData(id, true)
    solarData.grade = grade
    if clazz then
        solarData.class = clazz
    end
end
function GradeUtil.setAbilityTypeGrade(self, id, grade, clazz)
    local solarData = DataBase:getAbilityTypeSolarData(id, true)
    solarData.grade = grade
    if clazz then
        solarData.class = clazz
    end
end
function GradeUtil.getUnitTypeGrade(self, id)
    local ____opt_0 = DataBase:getUnitTypeSolarData(id)
    return ____opt_0 and ____opt_0.grade
end
function GradeUtil.getItemTypeGrade(self, id)
    local ____opt_2 = DataBase:getItemTypeSolarData(id)
    return ____opt_2 and ____opt_2.grade
end
return ____exports
