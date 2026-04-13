local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 9,["13"] = 9,["14"] = 9,["16"] = 9,["17"] = 24,["18"] = 24,["19"] = 24,["21"] = 25,["22"] = 26,["23"] = 27,["25"] = 29,["27"] = 31,["28"] = 31,["29"] = 31,["30"] = 31,["31"] = 31,["32"] = 24,["33"] = 39,["34"] = 40,["35"] = 39,["36"] = 48,["37"] = 49,["38"] = 50,["39"] = 51,["40"] = 52,["43"] = 48,["44"] = 63,["45"] = 63,["46"] = 63,["48"] = 64,["49"] = 65,["50"] = 66,["51"] = 67,["53"] = 69,["54"] = 70,["56"] = 72,["57"] = 73,["58"] = 74,["59"] = 75,["60"] = 76,["62"] = 77,["63"] = 78,["66"] = 81,["67"] = 63,["68"] = 84,["69"] = 85,["70"] = 86,["71"] = 87,["72"] = 88,["73"] = 89,["75"] = 91,["76"] = 91,["77"] = 91,["78"] = 91,["79"] = 91,["80"] = 84,["81"] = 100,["82"] = 101,["83"] = 102,["84"] = 103,["85"] = 104,["87"] = 106,["90"] = 110,["91"] = 100,["92"] = 113,["93"] = 114,["94"] = 115,["95"] = 116,["96"] = 117,["97"] = 118,["99"] = 120,["100"] = 120,["101"] = 120,["102"] = 120,["103"] = 120,["104"] = 113,["105"] = 126,["106"] = 126,["107"] = 126,["109"] = 127,["110"] = 126,["111"] = 130,["112"] = 131,["113"] = 130,["114"] = 134,["115"] = 135,["116"] = 134,["117"] = 138,["118"] = 138,["119"] = 138,["121"] = 139,["122"] = 138,["123"] = 142,["124"] = 143,["125"] = 142,["126"] = 146,["127"] = 147,["128"] = 146,["129"] = 150,["130"] = 150,["131"] = 150,["133"] = 151,["134"] = 150,["135"] = 154,["136"] = 155,["137"] = 154,["138"] = 158,["139"] = 159,["140"] = 158,["141"] = 166,["142"] = 167,["143"] = 166,["144"] = 170,["145"] = 171,["146"] = 170,["147"] = 180,["148"] = 180,["149"] = 180,["151"] = 181,["152"] = 180,["153"] = 184,["154"] = 185,["155"] = 184,["156"] = 188,["157"] = 189,["158"] = 188,["159"] = 196,["160"] = 197,["161"] = 196,["162"] = 200,["163"] = 201,["164"] = 200,["165"] = 210,["166"] = 210,["167"] = 210,["169"] = 211,["170"] = 210,["171"] = 214,["172"] = 215,["173"] = 214,["174"] = 218,["175"] = 219,["176"] = 218,["177"] = 226,["178"] = 226,["179"] = 226,["181"] = 227,["182"] = 228,["183"] = 229,["185"] = 231,["186"] = 232,["187"] = 233,["188"] = 234,["189"] = 235,["190"] = 236,["192"] = 239,["193"] = 241,["194"] = 242,["195"] = 242,["196"] = 242,["197"] = 243,["198"] = 244,["199"] = 245,["200"] = 247,["201"] = 249,["202"] = 250,["203"] = 251,["204"] = 252,["206"] = 242,["207"] = 242,["210"] = 259,["211"] = 260,["212"] = 261,["213"] = 262,["215"] = 264,["216"] = 265,["219"] = 268,["220"] = 226,["221"] = 271,["222"] = 272,["223"] = 273,["224"] = 274,["225"] = 275,["226"] = 276,["228"] = 276,["232"] = 279,["234"] = 271,["235"] = 288,["236"] = 289,["237"] = 290,["240"] = 294,["241"] = 295,["242"] = 296,["243"] = 297,["244"] = 298,["247"] = 288,["248"] = 303,["249"] = 303,["250"] = 303,["252"] = 304,["253"] = 303,["254"] = 307,["255"] = 308,["256"] = 307,["257"] = 311,["258"] = 312,["259"] = 311,["260"] = 315,["261"] = 316,["262"] = 315,["263"] = 319,["264"] = 319,["265"] = 319,["267"] = 320,["268"] = 319,["269"] = 323,["270"] = 324,["271"] = 323,["272"] = 337,["273"] = 337,["274"] = 337,["276"] = 338,["277"] = 339,["278"] = 340,["280"] = 342,["281"] = 342,["282"] = 343,["283"] = 344,["284"] = 345,["285"] = 346,["287"] = 348,["288"] = 350,["290"] = 352,["291"] = 337,["292"] = 10,["293"] = 11,["294"] = 12,["295"] = 16});
local ____exports = {}
local ____GameCenter = require("solar.solar-common.common.GameCenter")
local GameCenter = ____GameCenter.default
local ____UnitDeathTimeUtil = require("solar.solar-common.util.unit.UnitDeathTimeUtil")
local UnitDeathTimeUtil = ____UnitDeathTimeUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local DataBase = ____exports.default
DataBase.name = "DataBase"
function DataBase.prototype.____constructor(self)
end
function DataBase.getDataByHandle(self, ____type, handle, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    if not IsHandle(handle) then
        if createDefault then
            log.errorWithTraceBack(("DataBase.getData():" .. ____type) .. ":你传的handle为空或0！不能为空hanlde创建SolarData")
        end
        return nil
    end
    return ____exports.default:getDataByTypeId(
        ____type,
        tostring(GetHandleId(handle)),
        createDefault
    )
end
function DataBase.getTypeData(self, ____type)
    return ____exports.default.dataBaseContext[____type]
end
function DataBase.forTypeDatas(self, ____type, callBack)
    local typeData = ____exports.default.dataBaseContext[____type]
    if typeData then
        for id in pairs(typeData) do
            callBack(nil, id, typeData[id])
        end
    end
end
function DataBase.getDataByTypeId(self, ____type, id, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    local typeData = ____exports.default.dataBaseContext[____type]
    if typeData == nil and createDefault then
        typeData = {}
        ____exports.default.dataBaseContext[____type] = typeData
    end
    if typeData == nil then
        return nil
    end
    local data = typeData[id]
    if not data and createDefault then
        data = {}
        typeData[id] = data
        if isDebug then
            local ____exports_default_0, ____sl_solarDataIdIndex_1 = ____exports.default, "_sl_solarDataIdIndex"
            ____exports_default_0[____sl_solarDataIdIndex_1] = ____exports_default_0[____sl_solarDataIdIndex_1] + 1
            data._SL_id = (____type .. ":") .. tostring(____exports.default._sl_solarDataIdIndex)
        end
    end
    return data
end
function DataBase.setDataByHandle(self, ____type, handle, obj)
    if not IsHandle(handle) then
        local tb = debug.traceback()
        log.error(("DataBase.setData():" .. ____type) .. ":你传的handle为空或0！")
        log.error(tb)
        return nil
    end
    return ____exports.default:setDataByTypeId(
        ____type,
        tostring(GetHandleId(handle)),
        obj
    )
end
function DataBase.setDataByTypeId(self, ____type, id, obj)
    local typeData = ____exports.default.dataBaseContext[____type]
    if typeData == nil and obj ~= nil then
        typeData = {}
        ____exports.default.dataBaseContext[____type] = typeData
    end
    if obj == nil and (typeData and typeData[id]) == nil then
        return
    end
    typeData[id] = obj
end
function DataBase.clearDataByHandle(self, ____type, handle)
    if not IsHandle(handle) then
        local tb = debug.traceback()
        log.error(("DataBase.clearData():" .. ____type) .. ":你传的handle为空或0！")
        log.error(tb)
        return nil
    end
    ____exports.default:setDataByTypeId(
        ____type,
        tostring(GetHandleId(handle)),
        nil
    )
end
function DataBase.getUnitTypeSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByTypeId("_SL_UnitType", id, createDefault)
end
function DataBase.setUnitTypeSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_UnitType", id, obj)
end
function DataBase.forUnitTypeSolarDatas(self, callback)
    ____exports.default:forTypeDatas("_SL_UnitType", callback)
end
function DataBase.getItemTypeSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByTypeId("_SL_ItemType", id, createDefault)
end
function DataBase.setItemTypeSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_ItemType", id, obj)
end
function DataBase.forItemTypeSolarDatas(self, callback)
    ____exports.default:forTypeDatas("_SL_ItemType", callback)
end
function DataBase.getAbilityTypeSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByTypeId("_SL_AbilityType", id, createDefault)
end
function DataBase.setAbilityTypeSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_AbilityType", id, obj)
end
function DataBase.forAbilityTypeSolarDatas(self, callback)
    ____exports.default:forTypeDatas("_SL_AbilityType", callback)
end
function DataBase.getSolarBuffType(self, sBuffTypeId)
    return ____exports.default:getDataByTypeId("_SL_SolarBuffType", sBuffTypeId, false)
end
function DataBase.setSolarBuffType(self, sBuffTypeId, appBuffType)
    ____exports.default:setDataByTypeId("_SL_SolarBuffType", sBuffTypeId, appBuffType)
end
function DataBase.getSolarBuffSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByTypeId("_SL_SolarBuff", id, createDefault)
end
function DataBase.setSolarBuffSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_SolarBuff", id, obj)
end
function DataBase.forSolarBuffSolarData(self, callBack)
    ____exports.default:forTypeDatas("_SL_SolarBuff", callBack)
end
function DataBase.getSolarActorType(self, sActorTypeId)
    return ____exports.default:getDataByTypeId("_SL_SolarActorType", sActorTypeId, false)
end
function DataBase.setSolarActorType(self, sActorTypeId, appActorType)
    ____exports.default:setDataByTypeId("_SL_SolarActorType", sActorTypeId, appActorType)
end
function DataBase.getSolarActorSolarData(self, id, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByTypeId("_SL_SolarActor", id, createDefault)
end
function DataBase.setSolarActorSolarData(self, id, obj)
    ____exports.default:setDataByTypeId("_SL_SolarActor", id, obj)
end
function DataBase.forSolarActorSolarData(self, callBack)
    ____exports.default:forTypeDatas("_SL_SolarActor", callBack)
end
function DataBase.getUnitSolarData(self, handle, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    if not IsHandle(handle) then
        log.errorWithTraceBack("你正在获取一个空单位handle的solarData!")
        return nil
    end
    if isDebug and createDefault then
        local info = handledef(handle)
        if info and info.type ~= nil and info.type ~= "+w3u" then
            print("handle= " .. tostring(GetHandleId(handle)))
            print_r(handledef(handle))
            log.errorWithTraceBack(tostring(time) .. "正在从一个不是单位的handle中 获取单位solarData。可能此handle已被底层销毁 或被其他类型的handle重用！")
        end
        if not UnitAlive(handle) and ____exports.default:getDataByHandle("+w3u", handle, false) == nil then
            local tb = debug.traceback()
            BaseUtil.runLater(
                0.01,
                function()
                    if not UnitDeathTimeUtil:hasDeathTime(handle) then
                        print("time=" .. tostring(time))
                        log.errorWithTraceBack((((tostring(time) .. "警告：正在给没有死亡时间的死亡单位新建SolarData: ") .. tostring(GetUnitName(handle))) .. "这可能是死亡单位已被RemoveUnit移除超过handle重用时间，请不要获取已被移除很久的单位的solarData数据。handle重用保护时间=") .. tostring(handleReuseMinTime))
                    elseif UnitDeathTimeUtil:isTimeOfDeathExceeded(handle, handleReuseMinTime) then
                        print("deathTime=" .. tostring(UnitDeathTimeUtil:getDeathTime(handle)))
                        print("time=" .. tostring(time))
                        print("baseTraceback=" .. tostring(tb))
                        log.errorWithTraceBack((((tostring(time) .. "警告：正在给超过handle重用保护时间的死亡单位新建SolarData: ") .. tostring(GetUnitName(handle))) .. ":这可能导致单位不会被正常清理solarData并造成solarData重用。handle重用保护时间=") .. tostring(handleReuseMinTime))
                    end
                end
            )
        end
    end
    local solarData = ____exports.default:getDataByHandle("+w3u", handle, createDefault)
    if isDebug and solarData then
        if not solarData._SL_name then
            solarData._SL_name = GetUnitName(handle)
        end
        if createDefault then
            solarData._SL_createDefaultGetTime = time
        end
    end
    return solarData
end
function DataBase.clearUnitSolarData(self, handle)
    local solarData = ____exports.default:getUnitSolarData(handle, false)
    if solarData then
        if solarData._SL_solarBuffSet then
            for buffTypeId in pairs(solarData._SL_solarBuffSet) do
                local ____opt_4 = solarData._SL_solarBuffSet[buffTypeId]
                if ____opt_4 ~= nil then
                    ____opt_4:destroy()
                end
            end
        end
        ____exports.default:clearDataByHandle("+w3u", handle)
    end
end
function DataBase.forUnitSolarDatas(self, callBack)
    local typeData = ____exports.default.dataBaseContext["+w3u"]
    if not typeData then
        return
    end
    local allUnits = GameCenter:getAllUnits()
    for ____, unitHandle in ipairs(allUnits) do
        local solarData = typeData[tostring(unitHandle)]
        if solarData then
            callBack(nil, unitHandle, solarData)
        end
    end
end
function DataBase.getItemSolarData(self, handle, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByHandle("item", handle, createDefault)
end
function DataBase.clearItemSolarData(self, handle)
    ____exports.default:clearDataByHandle("item", handle)
end
function DataBase.getDialogButtonSolarData(self, handle)
    return ____exports.default:getDataByHandle("+dlb", handle)
end
function DataBase.clearDialogButtonSolarData(self, handle)
    ____exports.default:clearDataByHandle("+dlb", handle)
end
function DataBase.getPlayerSolarData(self, handle, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    return ____exports.default:getDataByHandle("+ply", handle, createDefault)
end
function DataBase.clearPlayerSolarData(self, handle)
    ____exports.default:clearDataByHandle("+ply", handle)
end
function DataBase.sd(self, handle, createDefault)
    if createDefault == nil then
        createDefault = ____exports.default.DefaultCreateSolarData
    end
    if not IsHandle(handle) then
        log.errorWithTraceBack("sd:你传的handle为空或0！")
        return nil
    end
    local ____opt_6 = handledef(handle)
    local ____type = ____opt_6 and ____opt_6.type
    if not ____type then
        print("警告：你的handle数据已被底层回收!请实时获取handle,sd智能方法不能使用过时的handle")
        log.errorWithTraceBack((("sd:" .. tostring(____type)) .. ":你传的handle类型不存在！") .. tostring(handle))
        return nil
    end
    if ____type == "+w3u" then
        return ____exports.default:getUnitSolarData(handle, createDefault)
    end
    return ____exports.default:getDataByHandle(____type, handle, createDefault)
end
DataBase.idStrHandleMap = {}
DataBase.dataBaseContext = {}
DataBase._sl_solarDataIdIndex = 0
DataBase.DefaultCreateSolarData = true
return ____exports
