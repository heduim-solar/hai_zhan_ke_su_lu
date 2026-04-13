local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 14,["24"] = 14,["25"] = 15,["26"] = 15,["27"] = 16,["28"] = 16,["29"] = 23,["30"] = 23,["31"] = 23,["33"] = 46,["34"] = 47,["38"] = 51,["39"] = 52,["40"] = 53,["41"] = 55,["42"] = 56,["43"] = 55,["44"] = 53,["45"] = 60,["46"] = 60,["47"] = 60,["48"] = 62,["49"] = 63,["50"] = 62,["51"] = 60,["52"] = 60,["53"] = 67,["54"] = 68,["55"] = 69,["57"] = 67,["58"] = 75,["59"] = 76,["60"] = 76,["61"] = 76,["62"] = 76,["63"] = 76,["64"] = 76,["65"] = 76,["66"] = 76,["67"] = 78,["68"] = 79,["69"] = 80,["70"] = 83,["71"] = 85,["72"] = 86,["73"] = 89,["74"] = 90,["75"] = 91,["77"] = 45,["78"] = 96,["79"] = 97,["80"] = 98,["81"] = 99,["82"] = 100,["83"] = 101,["84"] = 102,["86"] = 104,["87"] = 105,["88"] = 106,["89"] = 107,["91"] = 96,["92"] = 111,["93"] = 112,["94"] = 113,["95"] = 111,["96"] = 119,["97"] = 120,["98"] = 121,["99"] = 122,["102"] = 127,["103"] = 128,["104"] = 129,["107"] = 133,["108"] = 134,["109"] = 135,["110"] = 136,["112"] = 137,["113"] = 138,["114"] = 139,["116"] = 141,["117"] = 142,["118"] = 143,["119"] = 144,["120"] = 145,["121"] = 147,["122"] = 148,["126"] = 151,["127"] = 152,["128"] = 151,["129"] = 119,["130"] = 161,["131"] = 162,["132"] = 163,["133"] = 162,["134"] = 161,["135"] = 175,["136"] = 177,["139"] = 180,["140"] = 181,["141"] = 181,["142"] = 182,["143"] = 183,["147"] = 187,["149"] = 192,["150"] = 193,["151"] = 194,["153"] = 197,["154"] = 198,["155"] = 200,["156"] = 202,["157"] = 175,["158"] = 26,["159"] = 33,["160"] = 33,["161"] = 33,["162"] = 34,["163"] = 35,["164"] = 36,["165"] = 37,["166"] = 38,["167"] = 39,["168"] = 33,["169"] = 33,["170"] = 41,["171"] = 42,["172"] = 43});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BuffUtil = require("solar.solar-common.util.system.BuffUtil")
local BuffUtil = ____BuffUtil.default
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ColorStr = require("solar.solar-common.constant.ColorStr")
local ColorStr = ____ColorStr.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local SolarBuffState = ____exports.default
SolarBuffState.name = "SolarBuffState"
function SolarBuffState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarBuffState()")
        return
    end
    --- buff 属性更新到单位属性
    local trigger2 = __TS__New(Trigger)
    trigger2:registerTimerEvent(0.83, true)
    trigger2:addAction(function()
        DataBase:forUnitSolarDatas(function(____, u, solarData)
            ____exports.default:refreshBuffAttributes2UnitSolarAttribute(u)
        end)
    end)
    se:on(
        "属性刷新",
        function()
            DataBase:forUnitSolarDatas(function(____, u, solarData)
                ____exports.default:refreshBuffAttributes2UnitSolarAttribute(u)
            end)
        end
    )
    BuffUtil:addAnyBuffCreatedListener(function(____, buff)
        if buff.attribute then
            ____exports.default:refreshBuffAttributes2UnitSolarAttribute(buff:getParent())
        end
    end)
    if ____exports.default.config.showSolarBuffUI then
        ____exports.default.ubertipFrameBD = __TS__New(
            Frame,
            "BACKDROP",
            nil,
            nil,
            "_sl_border_backdrop",
            0
        )
        ____exports.default.ubertipFrameText = Frame:createTEXT()
        ____exports.default.ubertipFrameText:setAbsPoint(FRAMEPOINT_BOTTOMRIGHT, 0.78, 0.17)
        ____exports.default.ubertipFrameText:setSize(0.16, 0)
        ____exports.default.ubertipFrameBD:setPoints(____exports.default.ubertipFrameText.current, 0.01, 0.01)
        ____exports.default.ubertipFrameBD.visible = false
        ____exports.default.ubertipFrameText.visible = false
        local trigger = __TS__New(Trigger)
        trigger:registerTimerEvent(0.1, true)
        trigger:addAction(self.refreshSolarBuffUI)
    end
end
function SolarBuffState.showUbertip()
    local frameH = DzGetTriggerUIEventFrame()
    local buff = ____exports.default.frameBuffMap["f" .. tostring(frameH)]
    if buff then
        local buffTips = (ColorStr.yellow .. (buff:getName() or "")) .. "|n|n"
        if buff.stackCount and buff.stackCount ~= 1 then
            buffTips = (((buffTips .. ColorStr.green) .. "等级: ") .. tostring(buff.stackCount or "1")) .. "|n|n"
        end
        buffTips = (buffTips .. ColorStr.white) .. (buff:getUbertip() or "")
        ____exports.default.ubertipFrameText:setText(buffTips)
        ____exports.default.ubertipFrameBD.visible = true
        ____exports.default.ubertipFrameText.visible = true
    end
end
function SolarBuffState.hideUbertip()
    ____exports.default.ubertipFrameBD.visible = false
    ____exports.default.ubertipFrameText.visible = false
end
function SolarBuffState.prototype.refreshSolarBuffUI()
    local realSelectUnit = SelectUtil.getRealSelectUnit()
    if not IsHandle(realSelectUnit) then
        ____exports.default:showBuffsUI(false)
        return
    end
    local unitBuffs = BuffUtil:getUnitBuffs(realSelectUnit)
    if not unitBuffs then
        ____exports.default:showBuffsUI(false)
        return
    end
    local objectPool = ____exports.default.objectPool
    objectPool:setAllIdleStatus(true)
    local index = 0
    for buffTypeId in pairs(unitBuffs) do
        do
            local buff = unitBuffs[buffTypeId]
            if buff.buffType.class and buff.buffType.class ~= "基础" and buff.buffType.class ~= "羁绊" and buff.buffType.uiShowType ~= "单位状态栏" then
                goto __continue18
            end
            local frames = objectPool:borrowObject()
            local frame = frames[1]
            frame.visible = true
            frames[2]:setTexture(buff.buffType.art)
            frame:setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + index * 0.016, 0.007)
            ____exports.default.frameBuffMap["f" .. tostring(frame.current)] = buff
            index = index + 1
        end
        ::__continue18::
    end
    objectPool:forDirtyObjects(function(____, frames)
        frames[1].visible = false
    end)
end
function SolarBuffState.showBuffsUI(self, show)
    ____exports.default.objectPool:forActiveObjects(function(____, frames)
        frames[1].visible = show
    end)
end
function SolarBuffState.refreshBuffAttributes2UnitSolarAttribute(self, unitHandle)
    if not UnitStateUtil:isAlive(unitHandle) then
        return
    end
    local attributes = BuffUtil:getUnitBuffAttributes(unitHandle)
    local ____opt_0 = DataBase:getUnitSolarData(unitHandle, false)
    local unitOldBuffsAttr = ____opt_0 and ____opt_0._SL_totalBuffsSolarAttribute
    if unitOldBuffsAttr == nil then
        if attributes == nil or #attributes == 0 then
            return
        end
    end
    local totalAttribute = AttributeUtil:sumAttributes(attributes)
    --- dmg system
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAttribute, unitOldBuffsAttr)
    AttributeUtil:add(solarData._SL_solarAttribute, totalAttribute)
    solarData._SL_totalBuffsSolarAttribute = totalAttribute
    UnitAttributeState:refreshUnitSolarAttribute(unitHandle)
end
SolarBuffState.config = {showSolarBuffUI = true}
SolarBuffState.objectPool = __TS__New(
    ObjectPool,
    function()
        local frame = Frame:createBUTTON()
        local backgroundImage = frame:addBackgroundImage("")
        frame:setOnMouseEnter(____exports.default.showUbertip)
        frame:setOnMouseLeave(____exports.default.hideUbertip)
        frame:setSize(0.015, 0.015)
        return {frame, backgroundImage}
    end
)
SolarBuffState.frameBuffMap = {}
SolarBuffState.ubertipFrameBD = nil
SolarBuffState.ubertipFrameText = nil
return ____exports
