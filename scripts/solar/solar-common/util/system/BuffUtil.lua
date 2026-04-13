local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 26,["14"] = 26,["15"] = 26,["17"] = 26,["18"] = 33,["19"] = 35,["20"] = 36,["21"] = 37,["22"] = 37,["24"] = 39,["26"] = 33,["27"] = 48,["28"] = 49,["29"] = 50,["30"] = 51,["33"] = 54,["34"] = 48,["35"] = 62,["36"] = 63,["37"] = 64,["38"] = 65,["41"] = 68,["42"] = 62,["43"] = 74,["44"] = 75,["45"] = 76,["46"] = 77,["49"] = 80,["50"] = 74,["51"] = 86,["52"] = 87,["53"] = 88,["54"] = 89,["57"] = 92,["58"] = 86,["59"] = 98,["60"] = 99,["61"] = 100,["62"] = 101,["65"] = 104,["66"] = 98,["67"] = 112,["68"] = 113,["69"] = 114,["70"] = 112,["71"] = 125,["72"] = 126,["73"] = 127,["74"] = 128,["75"] = 129,["77"] = 132,["78"] = 133,["79"] = 134,["80"] = 136,["81"] = 137,["82"] = 138,["83"] = 139,["84"] = 139,["85"] = 139,["86"] = 140,["87"] = 139,["88"] = 139,["92"] = 145,["93"] = 146,["95"] = 149,["96"] = 149,["97"] = 149,["98"] = 149,["99"] = 149,["100"] = 149,["101"] = 149,["102"] = 150,["103"] = 125,["104"] = 160,["105"] = 161,["107"] = 162,["108"] = 162,["109"] = 163,["110"] = 164,["113"] = 167,["114"] = 168,["115"] = 169,["117"] = 171,["118"] = 162,["121"] = 173,["122"] = 160,["123"] = 181,["124"] = 182,["125"] = 182,["126"] = 181,["127"] = 190,["128"] = 191,["129"] = 191,["130"] = 190,["131"] = 198,["132"] = 199,["133"] = 200,["134"] = 198,["135"] = 207,["136"] = 208,["137"] = 209,["138"] = 210,["139"] = 211,["141"] = 213,["142"] = 214,["143"] = 215,["144"] = 215,["145"] = 216,["146"] = 217,["149"] = 220,["150"] = 207,["151"] = 228,["152"] = 230,["153"] = 231,["154"] = 232,["155"] = 233,["158"] = 236,["161"] = 228,["162"] = 246,["163"] = 247,["164"] = 249,["165"] = 250,["166"] = 251,["167"] = 252,["168"] = 253,["169"] = 254,["170"] = 255,["174"] = 249,["176"] = 262,["177"] = 263,["178"] = 264,["179"] = 265,["180"] = 266,["183"] = 262,["185"] = 246,["186"] = 277,["187"] = 278,["188"] = 279,["191"] = 282,["192"] = 283,["193"] = 284,["194"] = 285,["197"] = 277,["198"] = 296,["199"] = 297,["201"] = 297,["203"] = 296,["204"] = 305,["205"] = 305,["206"] = 305,["208"] = 306,["209"] = 307,["212"] = 310,["213"] = 311,["214"] = 312,["215"] = 312,["216"] = 313,["219"] = 316,["221"] = 316,["225"] = 305,["226"] = 327,["227"] = 328,["228"] = 329,["231"] = 332,["232"] = 333,["233"] = 334,["234"] = 334,["235"] = 335,["238"] = 327,["239"] = 344,["240"] = 345,["241"] = 345,["242"] = 344,["243"] = 351,["244"] = 352,["245"] = 352,["246"] = 351,["247"] = 358,["248"] = 359,["249"] = 359,["250"] = 358,["251"] = 369,["252"] = 370,["255"] = 373,["256"] = 374,["257"] = 375,["260"] = 378,["261"] = 369,["262"] = 388,["263"] = 389,["266"] = 392,["267"] = 393,["268"] = 394,["271"] = 397,["272"] = 388,["273"] = 28});
local ____exports = {}
local ____Buff = require("solar.solar-common.tool.Buff")
local Buff = ____Buff.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local BuffUtil = ____exports.default
BuffUtil.name = "BuffUtil"
function BuffUtil.prototype.____constructor(self)
end
function BuffUtil.registerBuffType(self, buffType)
    if DataBase:getSolarBuffType(buffType.id) == nil then
        DataBase:setSolarBuffType(buffType.id, buffType)
        local ____exports_default_buffTypes_0 = ____exports.default.buffTypes
        ____exports_default_buffTypes_0[#____exports_default_buffTypes_0 + 1] = buffType
    else
        log.errorWithTraceBack((((("不能重复注册BuffType:" .. buffType.id) .. " -> ") .. tostring(buffType.name)) .. " -> ") .. DataBase:getSolarBuffType(buffType.id).name)
    end
end
function BuffUtil.registerBuffCreatedEvent(self, buffTypeId, onCreated)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType.onCreated then
        log.errorWithTraceBack("不能重复注册Buff事件:" .. buffTypeId)
        return
    end
    buffType.onCreated = onCreated
end
function BuffUtil.registerBuffUpdateEvent(self, buffTypeId, onUpdate)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType.onUpdate then
        log.errorWithTraceBack("不能重复注册Buff事件:" .. buffTypeId)
        return
    end
    buffType.onUpdate = onUpdate
end
function BuffUtil.registerBuffIntervalEvent(self, buffTypeId, onInterval)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType.onInterval then
        log.errorWithTraceBack("不能重复注册Buff事件:" .. buffTypeId)
        return
    end
    buffType.onInterval = onInterval
end
function BuffUtil.registerBuffStackCountChangeEvent(self, buffTypeId, onStackCountChange)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType.onStackCountChange then
        log.errorWithTraceBack("不能重复注册Buff事件:" .. buffTypeId)
        return
    end
    buffType.onStackCountChange = onStackCountChange
end
function BuffUtil.registerBuffDestroyEvent(self, buffTypeId, onDestroy)
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType.onDestroy then
        log.errorWithTraceBack("不能重复注册Buff事件:" .. buffTypeId)
        return
    end
    buffType.onDestroy = onDestroy
end
function BuffUtil.getBuffType(self, buffTypeId)
    local bt = DataBase:getSolarBuffType(buffTypeId)
    return bt
end
function BuffUtil.addBuff(self, unit, buffTypeId, caster, initBuff)
    local buffType = DataBase:getSolarBuffType(buffTypeId)
    if not buffType then
        log.errorWithTraceBack("buff不存在!请先使用registerBuffType注册Buff类型! id=" .. buffTypeId)
        return nil
    end
    local oldUnitBuff = ____exports.default:getUnitBuff(unit, buffTypeId)
    if oldUnitBuff then
        if buffType.stackCountMax and buffType.stackCountMax ~= 0 then
            if buffType.stackCountMax == -1 or oldUnitBuff.stackCount < buffType.stackCountMax then
                oldUnitBuff.stackCount = oldUnitBuff.stackCount + 1
                if buffType.stackDurMode then
                    BaseUtil.runLater(
                        buffType.dur,
                        function()
                            oldUnitBuff.stackCount = oldUnitBuff.stackCount - 1
                        end
                    )
                end
            end
        end
        oldUnitBuff:refresh()
        return oldUnitBuff
    end
    local buff = __TS__New(
        Buff,
        buffType,
        unit,
        caster,
        initBuff
    )
    return buff
end
function BuffUtil.getPlayerUnitBuff(self, player, buffTypeId)
    GroupEnumUnitsOfPlayer(_sl_tempGroup3, player, nil)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(_sl_tempGroup3)
            if not IsHandle(unitHandle) then
                break
            end
            local buff = ____exports.default:getUnitBuff(unitHandle, buffTypeId)
            if (buff and buff.buffType.id) == buffTypeId then
                return buff
            end
            GroupRemoveUnit(_sl_tempGroup3, unitHandle)
            i = i + 1
        end
    end
    return nil
end
function BuffUtil.getUnitBuff(self, unit, buffTypeId)
    local ____opt_3 = ____exports.default:getUnitBuffs(unit)
    return ____opt_3 and ____opt_3[buffTypeId]
end
function BuffUtil.hasUnitBuff(self, unit, buffTypeId)
    local ____opt_5 = ____exports.default:getUnitBuffs(unit)
    return (____opt_5 and ____opt_5[buffTypeId]) ~= nil
end
function BuffUtil.getUnitBuffs(self, unit)
    local unitSolarData = DataBase:getUnitSolarData(unit, false)
    return unitSolarData and unitSolarData._SL_solarBuffSet
end
function BuffUtil.getUnitBuffAttributes(self, unit)
    local unitSolarData = DataBase:getUnitSolarData(unit, false)
    local solarBuffSet = unitSolarData and unitSolarData._SL_solarBuffSet
    if not solarBuffSet then
        return nil
    end
    local attributes = {}
    for solarBuffSetKey in pairs(solarBuffSet) do
        local ____opt_11 = solarBuffSet[solarBuffSetKey]
        local attribute = ____opt_11 and ____opt_11.attribute
        if attribute then
            attributes[#attributes + 1] = attribute
        end
    end
    return attributes
end
function BuffUtil.forAllBuffTypes(self, callback, buffTypeClass)
    for ____, buffType in ipairs(____exports.default.buffTypes) do
        if buffTypeClass then
            if buffTypeClass == buffType.class then
                callback(nil, buffType)
            end
        else
            callback(nil, buffType)
        end
    end
end
function BuffUtil.forAllBuffs(self, callback, buffTypeId)
    if buffTypeId then
        DataBase:forUnitSolarDatas(function(____, id, solarData)
            local _SL_solarBuffSet = solarData and solarData._SL_solarBuffSet
            if _SL_solarBuffSet then
                for tempBuffTypeId in pairs(_SL_solarBuffSet) do
                    local buff = _SL_solarBuffSet[tempBuffTypeId]
                    if (buff and buff.buffType.id) == buffTypeId then
                        callback(nil, buff)
                    end
                end
            end
        end)
    else
        DataBase:forUnitSolarDatas(function(____, id, solarData)
            local _SL_solarBuffSet = solarData and solarData._SL_solarBuffSet
            if _SL_solarBuffSet then
                for tempBuffTypeId in pairs(_SL_solarBuffSet) do
                    callback(nil, _SL_solarBuffSet[tempBuffTypeId])
                end
            end
        end)
    end
end
function BuffUtil.forUnitBuffs(self, unit, callback)
    local buffSet = ____exports.default:getUnitBuffs(unit)
    if not buffSet then
        return
    end
    for buffTypeId in pairs(buffSet) do
        local buff = buffSet[buffTypeId]
        if buff then
            callback(nil, buff)
        end
    end
end
function BuffUtil.clearUnitBuff(self, unit, buffTypeId)
    local ____opt_19 = ____exports.default:getUnitBuff(unit, buffTypeId)
    if ____opt_19 ~= nil then
        ____opt_19:destroy()
    end
end
function BuffUtil.clearUnitBuffs(self, unit, onlyDeBuff)
    if onlyDeBuff == nil then
        onlyDeBuff = false
    end
    local buffs = ____exports.default:getUnitBuffs(unit)
    if not buffs then
        return
    end
    for buffsKey in pairs(buffs) do
        if onlyDeBuff then
            local ____opt_21 = buffs[buffsKey]
            if ____opt_21 and ____opt_21.buffType.isDebuff then
                buffs[buffsKey]:destroy()
            end
        else
            local ____opt_23 = buffs[buffsKey]
            if ____opt_23 ~= nil then
                ____opt_23:destroy()
            end
        end
    end
end
function BuffUtil.clearUnitBuffsByClass(self, unit, clazz)
    local buffs = ____exports.default:getUnitBuffs(unit)
    if not buffs then
        return
    end
    for buffsKey in pairs(buffs) do
        local buff = buffs[buffsKey]
        local ____opt_25 = buff and buff.buffType
        if (____opt_25 and ____opt_25.class) == clazz then
            buff:destroy()
        end
    end
end
function BuffUtil.addAnyBuffCreatedListener(self, onBuffCreatedListener)
    local ____Buff__sl_anyBuffCreatedListeners_29 = Buff._sl_anyBuffCreatedListeners
    ____Buff__sl_anyBuffCreatedListeners_29[#____Buff__sl_anyBuffCreatedListeners_29 + 1] = onBuffCreatedListener
end
function BuffUtil.addAnyBuffStackCountChangeListener(self, onBuffStackCountChangeListener)
    local ____Buff__sl_anyBuffStackCountChangeListeners_30 = Buff._sl_anyBuffStackCountChangeListeners
    ____Buff__sl_anyBuffStackCountChangeListeners_30[#____Buff__sl_anyBuffStackCountChangeListeners_30 + 1] = onBuffStackCountChangeListener
end
function BuffUtil.addAnyBuffDestroyListener(self, onBuffDestroyListener)
    local ____Buff__sl_anyBuffDestroyListeners_31 = Buff._sl_anyBuffDestroyListeners
    ____Buff__sl_anyBuffDestroyListeners_31[#____Buff__sl_anyBuffDestroyListeners_31 + 1] = onBuffDestroyListener
end
function BuffUtil.setUiEnable(self, buffTypeId, enable, player)
    if player ~= nil and GetLocalPlayer() ~= player then
        return
    end
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType == nil then
        print("设置未注册的Buff图标:" .. buffTypeId)
        return
    end
    buffType.uiEnable = enable
end
function BuffUtil.setBuffTypeUbertip(self, buffTypeId, ubertip, player)
    if player ~= nil and GetLocalPlayer() ~= player then
        return
    end
    local buffType = ____exports.default:getBuffType(buffTypeId)
    if buffType == nil then
        print("设置未注册的Buff提示:" .. buffTypeId)
        return
    end
    buffType.ubertip = ubertip
end
BuffUtil.buffTypes = {}
return ____exports
