local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 8,["21"] = 8,["22"] = 11,["23"] = 11,["24"] = 12,["25"] = 12,["26"] = 17,["27"] = 17,["28"] = 17,["30"] = 17,["31"] = 44,["32"] = 45,["33"] = 46,["34"] = 47,["35"] = 48,["38"] = 44,["39"] = 58,["40"] = 59,["41"] = 60,["42"] = 61,["43"] = 62,["46"] = 58,["47"] = 72,["48"] = 73,["49"] = 74,["50"] = 75,["51"] = 76,["52"] = 77,["54"] = 79,["55"] = 81,["56"] = 82,["58"] = 72,["59"] = 91,["60"] = 92,["61"] = 93,["62"] = 94,["65"] = 97,["66"] = 97,["67"] = 97,["68"] = 97,["69"] = 98,["70"] = 99,["71"] = 100,["72"] = 101,["74"] = 91,["75"] = 107,["76"] = 108,["79"] = 111,["80"] = 112,["82"] = 114,["83"] = 115,["84"] = 116,["85"] = 117,["87"] = 114,["88"] = 120,["89"] = 121,["90"] = 121,["91"] = 121,["92"] = 122,["93"] = 121,["94"] = 121,["95"] = 120,["96"] = 125,["97"] = 107,["98"] = 128,["99"] = 130,["100"] = 131,["101"] = 132,["103"] = 134,["106"] = 137,["107"] = 138,["111"] = 141,["112"] = 141,["114"] = 142,["115"] = 142,["117"] = 143,["118"] = 144,["119"] = 145,["121"] = 147,["122"] = 148,["123"] = 149,["124"] = 149,["125"] = 149,["126"] = 149,["127"] = 150,["129"] = 152,["131"] = 154,["132"] = 154,["133"] = 154,["134"] = 154,["135"] = 155,["137"] = 157,["139"] = 160,["140"] = 161,["141"] = 162,["142"] = 163,["143"] = 163,["144"] = 163,["145"] = 163,["146"] = 163,["147"] = 163,["148"] = 163,["149"] = 164,["150"] = 165,["151"] = 166,["152"] = 167,["153"] = 168,["155"] = 170,["158"] = 142,["161"] = 141,["164"] = 128,["165"] = 21,["166"] = 24,["167"] = 33,["168"] = 36,["169"] = 105});
local ____exports = {}
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local AbilityLampEffectUtil = ____exports.default
AbilityLampEffectUtil.name = "AbilityLampEffectUtil"
function AbilityLampEffectUtil.prototype.____constructor(self)
end
function AbilityLampEffectUtil.addAbilityLampEffectForPlayer(self, abilityId, player)
    local playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player))
    for ____, playerUnit in ipairs(playerUnits) do
        if GetUnitAbilityLevel(playerUnit, abilityId) > 0 then
            ____exports.default:addUnitObjIdLampEffect(abilityId, playerUnit)
        end
    end
end
function AbilityLampEffectUtil.removeAbilityLampEffectForPlayer(self, abilityId, player)
    local playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player))
    for ____, playerUnit in ipairs(playerUnits) do
        if GetUnitAbilityLevel(playerUnit, abilityId) > 0 then
            ____exports.default:removeUnitObjIdLampEffect(abilityId, playerUnit)
        end
    end
end
function AbilityLampEffectUtil.addUnitObjIdLampEffect(self, abilityIdOrUnitId, unit)
    ____exports.default:_sl_init_lampEffect_system()
    local abilityIdStrs = ____exports.default._sl_unitObjIdLampEffectInfo[GetHandleId(unit)]
    if abilityIdStrs == nil then
        abilityIdStrs = {}
        ____exports.default._sl_unitObjIdLampEffectInfo[GetHandleId(unit)] = abilityIdStrs
    end
    abilityIdStrs[#abilityIdStrs + 1] = LangUtil:getStringId(abilityIdOrUnitId)
    if GetLocalPlayer() == GetOwningPlayer(unit) then
        ____exports.default:refreshUnitAbilityLampEffect(selection())
    end
end
function AbilityLampEffectUtil.removeUnitObjIdLampEffect(self, abilityIdOrUnitId, unit)
    ____exports.default:_sl_init_lampEffect_system()
    local abilityIdStrs = ____exports.default._sl_unitObjIdLampEffectInfo[GetHandleId(unit)]
    if abilityIdStrs == nil then
        return
    end
    local index = __TS__ArrayIndexOf(
        abilityIdStrs,
        LangUtil:getStringId(abilityIdOrUnitId)
    )
    __TS__ArraySplice(abilityIdStrs, index, 1)
    ____exports.default._sl_unitObjIdLampEffectInfo[GetHandleId(unit)] = abilityIdStrs
    if GetLocalPlayer() == GetOwningPlayer(unit) then
        ____exports.default:refreshUnitAbilityLampEffect(selection())
    end
end
function AbilityLampEffectUtil._sl_init_lampEffect_system(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    if isAsync then
        log.errorWithTraceBack("不能异步初始化")
    end
    se:onUnitSelected(function(e)
        local selectUnit = e.trigUnit
        if GetLocalPlayer() == GetTriggerPlayer() then
            ____exports.default:refreshUnitAbilityLampEffect(selectUnit)
        end
    end)
    InputUtil:onMouseLeftButtonReleased(function()
        BaseUtil.runLater(
            0.05,
            function()
                ____exports.default:refreshUnitAbilityLampEffect(selection())
            end
        )
    end)
    ____exports.default._sl_isInitialized = true
end
function AbilityLampEffectUtil.refreshUnitAbilityLampEffect(self, selectUnit)
    for key in pairs(____exports.default._sl_lampEffectFrames) do
        local frame = ____exports.default._sl_lampEffectFrames[key]
        DzFrameShow(frame, false)
    end
    if GetLocalPlayer() ~= GetOwningPlayer(selectUnit) then
        return
    end
    local objIds = ____exports.default._sl_unitObjIdLampEffectInfo[GetHandleId(selectUnit)]
    if objIds == nil or #objIds == 0 then
        return
    end
    do
        local x = 0
        while x < 4 do
            do
                local y = 0
                while y < 3 do
                    do
                        local button_abilityId, orderID, orderType = button(x, y)
                        if button_abilityId == nil then
                            goto __continue32
                        end
                        local show = false
                        if orderType == 8 and AbilityUtil:isBookUi() then
                            if __TS__ArrayIncludes(
                                objIds,
                                id2string(orderID)
                            ) then
                                show = true
                            else
                                goto __continue32
                            end
                        elseif __TS__ArrayIncludes(
                            objIds,
                            id2string(button_abilityId)
                        ) then
                            show = true
                        else
                            goto __continue32
                        end
                        local btnXYId = (tostring(x) .. "_") .. tostring(y)
                        local frame = ____exports.default._sl_lampEffectFrames[btnXYId]
                        if frame == nil then
                            frame = DzCreateFrameByTagName(
                                "SPRITE",
                                "refreshUnitAbilityLampEffect_" .. tostring(AsyncUtil:getUUIDAsync()),
                                DzGetGameUI(),
                                "",
                                0
                            )
                            DzFrameSetModel(frame, ____exports.default.lampEffect, 0, 0)
                            DzFrameSetSize(frame, AbilityButtonUtil.btnUIWidth, AbilityButtonUtil.btnUIHeight)
                            local uiPos = AbilityButtonUtil:getUIXYByPos(x, y)
                            DzFrameSetAbsolutePoint(frame, 8, uiPos.x, uiPos.y)
                            ____exports.default._sl_lampEffectFrames[btnXYId] = frame
                        end
                        DzFrameShow(frame, show)
                    end
                    ::__continue32::
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
end
AbilityLampEffectUtil.lampEffect = "UI\\Feedback\\Autocast\\UI-ModalButtonOn.mdl"
AbilityLampEffectUtil.cache = __TS__New(Cache)
AbilityLampEffectUtil._sl_unitObjIdLampEffectInfo = {}
AbilityLampEffectUtil._sl_lampEffectFrames = {}
AbilityLampEffectUtil._sl_isInitialized = false
return ____exports
