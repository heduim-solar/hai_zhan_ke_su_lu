local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 11,["19"] = 11,["20"] = 11,["22"] = 11,["23"] = 27,["24"] = 28,["25"] = 29,["26"] = 30,["27"] = 30,["28"] = 30,["29"] = 27,["30"] = 36,["31"] = 37,["32"] = 38,["33"] = 39,["34"] = 40,["35"] = 41,["36"] = 42,["37"] = 43,["38"] = 44,["39"] = 45,["40"] = 46,["41"] = 47,["43"] = 49,["46"] = 52,["47"] = 52,["48"] = 52,["49"] = 53,["50"] = 54,["51"] = 55,["52"] = 52,["53"] = 52,["54"] = 57,["55"] = 58,["56"] = 59,["57"] = 60,["58"] = 61,["59"] = 62,["60"] = 63,["61"] = 65,["62"] = 65,["63"] = 65,["64"] = 65,["65"] = 65,["66"] = 65,["67"] = 65,["68"] = 65,["69"] = 65,["70"] = 66,["71"] = 67,["72"] = 68,["74"] = 36,["75"] = 88,["76"] = 89,["77"] = 90,["78"] = 92,["79"] = 93,["80"] = 88,["81"] = 102,["82"] = 103,["83"] = 104,["84"] = 105,["85"] = 106,["87"] = 109,["89"] = 110,["90"] = 110,["91"] = 111,["92"] = 112,["95"] = 110,["99"] = 117,["100"] = 118,["101"] = 119,["102"] = 120,["103"] = 121,["104"] = 122,["106"] = 124,["107"] = 126,["109"] = 102,["110"] = 136,["111"] = 137,["112"] = 137,["113"] = 138,["114"] = 139,["115"] = 140,["116"] = 141,["120"] = 145,["121"] = 146,["122"] = 147,["123"] = 136,["124"] = 155,["125"] = 155,["126"] = 155,["128"] = 156,["129"] = 157,["130"] = 158,["133"] = 161,["134"] = 161,["135"] = 162,["136"] = 163,["138"] = 161,["141"] = 166,["142"] = 167,["143"] = 155,["144"] = 175,["145"] = 176,["146"] = 178,["147"] = 179,["148"] = 180,["149"] = 181,["150"] = 181,["151"] = 181,["152"] = 182,["153"] = 183,["154"] = 184,["155"] = 185,["156"] = 186,["157"] = 187,["158"] = 188,["159"] = 189,["160"] = 191,["162"] = 194,["163"] = 181,["164"] = 181,["165"] = 196,["166"] = 200,["168"] = 202,["169"] = 175,["170"] = 211,["171"] = 212,["172"] = 213,["175"] = 216,["176"] = 211,["177"] = 226,["178"] = 227,["181"] = 230,["182"] = 231,["183"] = 232,["184"] = 233,["185"] = 234,["186"] = 235,["189"] = 238,["190"] = 239,["191"] = 240,["192"] = 241,["195"] = 244,["196"] = 245,["197"] = 246,["198"] = 247,["201"] = 251,["202"] = 252,["203"] = 253,["204"] = 254,["206"] = 256,["207"] = 256,["208"] = 256,["209"] = 257,["210"] = 256,["211"] = 256,["212"] = 226,["213"] = 261,["214"] = 262,["215"] = 263,["216"] = 264,["217"] = 265,["219"] = 267,["220"] = 261,["221"] = 14,["222"] = 20,["223"] = 224});
local ____exports = {}
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____DebugUtil = require("solar.solar-common.util.debug.DebugUtil")
local DebugUtil = ____DebugUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
____exports.default = __TS__Class()
local ObjectTemplateUtil = ____exports.default
ObjectTemplateUtil.name = "ObjectTemplateUtil"
function ObjectTemplateUtil.prototype.____constructor(self)
end
function ObjectTemplateUtil.getTemplateIdleCount(self, templateType)
    local strings = ____exports.default.templateInfo[templateType]
    local state = ____exports.default._sl_templateStateInfo[templateType]
    local ____temp_6 = #strings - ((state and state.useIndex or -1) + 1)
    local ____opt_2 = state and state.objectPool
    return ____temp_6 + (____opt_2 and ____opt_2:getNumIdle() or 0)
end
function ObjectTemplateUtil.printTemplateInfo(self)
    ____exports.default:_sl_init()
    print("=======ObjectTemplate Start======")
    BJDebugMsg("=======ObjectTemplate Start======")
    local itemKey = {}
    local abilityKey = {}
    local unitKey = {}
    for templateInfoKey in pairs(____exports.default.templateInfo) do
        if (string.find(templateInfoKey, "物品", nil, true) or 0) - 1 >= 0 then
            itemKey[#itemKey + 1] = templateInfoKey
        elseif (string.find(templateInfoKey, "主动", nil, true) or 0) - 1 >= 0 then
            abilityKey[#abilityKey + 1] = templateInfoKey
        else
            unitKey[#unitKey + 1] = templateInfoKey
        end
    end
    __TS__ArraySort(
        abilityKey,
        function(____, a, b)
            local an = __TS__StringSubstring(a, 6)
            local bn = __TS__StringSubstring(b, 6)
            return tonumber(an) - tonumber(bn)
        end
    )
    local allKey = {}
    __TS__ArrayPushArray(allKey, itemKey)
    __TS__ArrayPushArray(allKey, abilityKey)
    for ____, templateInfoKey in ipairs(allKey) do
        local strings = ____exports.default.templateInfo[templateInfoKey]
        local state = ____exports.default._sl_templateStateInfo[templateInfoKey]
        local nameCol = TextUtil:rightPad(templateInfoKey, 8, " ")
        local ____TextUtil_13 = TextUtil
        local ____TextUtil_rightPad_14 = TextUtil.rightPad
        local ____opt_7 = state and state.objectPool
        local useInfo = ____TextUtil_rightPad_14(
            ____TextUtil_13,
            (((tostring(____opt_7 and ____opt_7:getNumActive() or 0) .. " / ") .. tostring((state and state.useIndex or -1) + 1)) .. " / ") .. tostring(#strings),
            6,
            " "
        )
        local info = ((((nameCol .. "    [ ") .. useInfo) .. " ]:  ") .. strings[1]) .. "  ......"
        print(info)
        BJDebugMsg(info)
    end
end
function ObjectTemplateUtil.cleanAbility(self, ability)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_COOL, 0.5)
    EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HOTKET, 0)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
end
function ObjectTemplateUtil.addUnitAbilityTemplate(self, unit, abilityNum)
    local abilityTemplate = DataBase:getUnitSolarData(unit)._SL_abilityTemplate
    if abilityTemplate == nil then
        abilityTemplate = {}
        DataBase:getUnitSolarData(unit)._SL_abilityTemplate = abilityTemplate
    end
    if abilityNum == nil or abilityNum <= 0 then
        do
            local i = 1
            while i <= 12 do
                if abilityTemplate[i] == nil then
                    abilityNum = i
                    break
                end
                i = i + 1
            end
        end
    end
    if abilityTemplate[abilityNum] == nil then
        local templateType = "主动" .. tostring(abilityNum)
        abilityTemplate[abilityNum] = ____exports.default:borrowTemplate(templateType)
        UnitAddAbility(unit, abilityTemplate[abilityNum])
        ____exports.default:cleanAbility(EXGetUnitAbility(unit, abilityTemplate[abilityNum]))
        return abilityTemplate[abilityNum]
    else
        log.errorWithTraceBack((((("这个位置已经有模板实例了。请先销毁这个位置的技能引用实例。" .. GetUnitName(unit)) .. "->") .. tostring(abilityNum)) .. "=") .. abilityTemplate[abilityNum])
        return nil
    end
end
function ObjectTemplateUtil.removeUnitAbilityTemplate(self, unit, abilityId)
    local ____opt_15 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_15 and ____opt_15._SL_abilityTemplate
    if abilityTemplate ~= nil then
        for key in pairs(abilityTemplate) do
            if abilityTemplate[key] == abilityId then
                abilityTemplate[key] = nil
            end
        end
    end
    UnitRemoveAbility(unit, abilityId)
    local abilityObj = _g_objs.ability[abilityId]
    ____exports.default:returnTemplate(abilityObj.Tip1 or abilityObj.Tip, abilityId)
end
function ObjectTemplateUtil.getUnitAbilityTemplateNextNumber(self, unit, startNum)
    if startNum == nil then
        startNum = 1
    end
    local abilityTemplate = DataBase:getUnitSolarData(unit)._SL_abilityTemplate
    if abilityTemplate == nil then
        return startNum
    end
    do
        local i = startNum
        while i <= 12 do
            if abilityTemplate[i] == nil then
                return i
            end
            i = i + 1
        end
    end
    log.errorWithTraceBack(((("单位" .. GetUnitName(unit)) .. "从起始位置") .. tostring(startNum)) .. "开始已经没有多余的空位置了!")
    return 12
end
function ObjectTemplateUtil.borrowTemplate(self, templateType)
    ____exports.default:_sl_init()
    local stateInfo = ____exports.default._sl_templateStateInfo[templateType]
    if stateInfo == nil then
        local objTemplates = ____exports.default.templateInfo[templateType]
        local objectPool = __TS__New(
            ObjectPool,
            function()
                stateInfo.useIndex = stateInfo.useIndex + 1
                if objTemplates == nil or stateInfo.useIndex >= #objTemplates then
                    local info = (("模板不足!请增加基础模板物编的数量!当前类型的模板数量:" .. templateType) .. " -> ") .. tostring(objTemplates and #objTemplates)
                    BJDebugMsg(info)
                    print("请检查是否有模板泄漏的情况。即移除物品时未归还模板id。")
                    log.errorWithTraceBack(info)
                    return nil
                elseif #objTemplates > 10 and stateInfo.useIndex + 3 > #objTemplates then
                    BJDebugMsg((((("|cffff0000【太阳TS框架提示】《" .. templateType) .. "》(") .. tostring(#objTemplates)) .. ")模板不足！") .. "请作者增加模板!玩家可减少场上存在的技能或物品等，以免地图逻辑出错！")
                end
                return objTemplates[stateInfo.useIndex + 1]
            end
        )
        stateInfo = {useIndex = -1, objectPool = objectPool}
        ____exports.default._sl_templateStateInfo[templateType] = stateInfo
    end
    return stateInfo.objectPool:borrowObject()
end
function ObjectTemplateUtil.returnTemplate(self, templateType, objIdStr)
    local stateInfo = ____exports.default._sl_templateStateInfo[templateType]
    if stateInfo == nil then
        return
    end
    return stateInfo.objectPool:returnObject(objIdStr)
end
function ObjectTemplateUtil._sl_init(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    DebugUtil.refreshCodeExecStartTime()
    local _sl_templateName = "[$ST]"
    for objId in pairs(_g_objs.ability) do
        local objInfo = _g_objs.ability[objId]
        if objInfo.Name == _sl_templateName then
            self:addTemplate(objInfo.Tip1 or objInfo.Tip, objId)
        end
    end
    for objId in pairs(_g_objs.item) do
        local objInfo = _g_objs.item[objId]
        if objInfo.Name == _sl_templateName then
            self:addTemplate(objInfo.Tip, objId)
        end
    end
    for objId in pairs(_g_objs.unit) do
        local objInfo = _g_objs.unit[objId]
        if objInfo.Name == _sl_templateName then
            self:addTemplate(objInfo.Tip, objId)
        end
    end
    ____exports.default._sl_isInitialized = true
    local number = DebugUtil.countCodeExecuteTime()
    if number > 0.01 then
        print("模板初始化耗时:" .. tostring(number))
    end
    se:playerChat(
        "-sl-tmpl",
        function()
            ____exports.default:printTemplateInfo()
        end
    )
end
function ObjectTemplateUtil.addTemplate(self, template, objIdStr)
    local templates = ____exports.default.templateInfo[template]
    if templates == nil then
        templates = {}
        ____exports.default.templateInfo[template] = templates
    end
    templates[#templates + 1] = objIdStr
end
ObjectTemplateUtil.templateInfo = {}
ObjectTemplateUtil._sl_templateStateInfo = {}
ObjectTemplateUtil._sl_isInitialized = false
return ____exports
