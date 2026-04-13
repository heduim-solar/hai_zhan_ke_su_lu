local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 17,["29"] = 20,["30"] = 20,["31"] = 20,["33"] = 43,["34"] = 44,["37"] = 49,["38"] = 50,["41"] = 53,["42"] = 54,["43"] = 55,["44"] = 53,["45"] = 57,["46"] = 58,["47"] = 59,["48"] = 57,["49"] = 61,["50"] = 62,["51"] = 63,["52"] = 61,["53"] = 65,["54"] = 66,["55"] = 67,["56"] = 65,["57"] = 71,["58"] = 72,["61"] = 75,["62"] = 75,["63"] = 75,["64"] = 77,["65"] = 78,["67"] = 75,["68"] = 75,["69"] = 71,["70"] = 85,["71"] = 86,["72"] = 86,["73"] = 86,["74"] = 86,["75"] = 86,["76"] = 86,["77"] = 86,["78"] = 86,["79"] = 88,["80"] = 89,["81"] = 90,["82"] = 93,["83"] = 95,["84"] = 96,["85"] = 99,["86"] = 100,["87"] = 101,["89"] = 42,["90"] = 106,["91"] = 107,["92"] = 108,["93"] = 109,["94"] = 110,["95"] = 111,["96"] = 112,["98"] = 114,["99"] = 116,["100"] = 117,["102"] = 120,["103"] = 121,["104"] = 122,["106"] = 106,["107"] = 126,["108"] = 127,["109"] = 128,["110"] = 126,["111"] = 134,["112"] = 135,["113"] = 136,["114"] = 137,["117"] = 142,["118"] = 143,["119"] = 144,["122"] = 148,["123"] = 149,["124"] = 150,["125"] = 151,["127"] = 152,["128"] = 153,["129"] = 154,["130"] = 155,["131"] = 156,["132"] = 160,["134"] = 162,["135"] = 163,["136"] = 164,["137"] = 165,["138"] = 166,["139"] = 168,["140"] = 169,["144"] = 172,["145"] = 173,["146"] = 172,["147"] = 134,["148"] = 182,["149"] = 183,["150"] = 184,["151"] = 183,["152"] = 182,["153"] = 23,["154"] = 30,["155"] = 30,["156"] = 30,["157"] = 31,["158"] = 32,["159"] = 33,["160"] = 34,["161"] = 35,["162"] = 36,["163"] = 30,["164"] = 30,["165"] = 38,["166"] = 39,["167"] = 40});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ColorStr = require("solar.solar-common.constant.ColorStr")
local ColorStr = ____ColorStr.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____SolarBuffState = require("solar.solar-common.attribute.SolarBuffState")
local SolarBuffState = ____SolarBuffState.default
local ____BuffUtil = require("solar.solar-common.util.system.BuffUtil")
local BuffUtil = ____BuffUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local SolarActorBuffState = ____exports.default
SolarActorBuffState.name = "SolarActorBuffState"
function SolarActorBuffState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorBuffState()")
        return
    end
    if SingletonUtil:notFirstTime(SolarBuffState) then
        print("演员buff系统不能与旧buff系统同时使用!")
        return
    end
    BuffUtil.registerBuffType = function(____, buffType)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    BuffUtil.getBuffType = function(____, buffTypeId)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    BuffUtil.forAllBuffTypes = function(____, callback, buffTypeClass)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    BuffUtil.addBuff = function(____, unit, buffTypeId, caster, initBuff)
        log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
        return nil
    end
    ActorBuffUtil:addAnyActorBuffLevelChangeListener(function(____, buff, delta)
        if buff.attribute == nil or buff.actorType.attribute == nil then
            return
        end
        BaseUtil.runLater(
            0.1,
            function()
                if AttributeUtil:isEquals(buff.attribute, buff.actorType.attribute) then
                    buff.attribute = AttributeUtil:multiply(buff.actorType.attribute, buff.level)
                end
            end
        )
    end)
    if ____exports.default.config.showSolarActorBuffUI then
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
function SolarActorBuffState.showUbertip()
    local frameH = DzGetTriggerUIEventFrame()
    local actorBuff = ____exports.default.frameBuffMap["f" .. tostring(frameH)]
    if actorBuff then
        local buffTips = (ColorStr.yellow .. (actorBuff:getName() or "")) .. "|n|n"
        if actorBuff.level and actorBuff.level ~= 1 then
            buffTips = (((buffTips .. ColorStr.green) .. "等级: ") .. tostring(actorBuff.level or "1")) .. "|n|n"
        end
        buffTips = (buffTips .. ColorStr.white) .. (actorBuff:getDescribe() or "")
        if actorBuff:get("dur") and actorBuff:get("dur") > 3 then
            buffTips = ((buffTips .. "|n剩余时间:") .. tostring(math.ceil(actorBuff:getRemainingTime()))) .. "秒"
        end
        ____exports.default.ubertipFrameText:setText(buffTips)
        ____exports.default.ubertipFrameBD.visible = true
        ____exports.default.ubertipFrameText.visible = true
    end
end
function SolarActorBuffState.hideUbertip()
    ____exports.default.ubertipFrameBD.visible = false
    ____exports.default.ubertipFrameText.visible = false
end
function SolarActorBuffState.prototype.refreshSolarBuffUI()
    local realSelectUnit = SelectUtil.getRealSelectUnit()
    if not IsHandle(realSelectUnit) then
        ____exports.default:showBuffsUI(false)
        return
    end
    local unitBuffs = ActorBuffUtil:getUnitActorBuffs(realSelectUnit)
    if not unitBuffs then
        ____exports.default:showBuffsUI(false)
        return
    end
    local objectPool = ____exports.default.objectPool
    objectPool:setAllIdleStatus(true)
    local index = 0
    for actorTypeId in pairs(unitBuffs) do
        do
            local actorBuff = unitBuffs[actorTypeId]
            local uiShowType = actorBuff:get("uiShowType")
            if uiShowType ~= nil and uiShowType ~= "单位状态栏" then
                goto __continue22
            elseif actorBuff:get("class") and actorBuff:get("class") ~= "基础" and actorBuff:get("class") ~= "演员buff" and actorBuff:get("class") ~= "羁绊" and uiShowType ~= "单位状态栏" then
                goto __continue22
            end
            local frames = objectPool:borrowObject()
            local frame = frames[1]
            frame.visible = true
            frames[2]:setTexture(actorBuff:get("icon", "ReplaceableTextures\\CommandButtons\\BTNTemp.blp"))
            frame:setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + index * 0.016, 0.007)
            ____exports.default.frameBuffMap["f" .. tostring(frame.current)] = actorBuff
            index = index + 1
        end
        ::__continue22::
    end
    objectPool:forDirtyObjects(function(____, frames)
        frames[1].visible = false
    end)
end
function SolarActorBuffState.showBuffsUI(self, show)
    ____exports.default.objectPool:forActiveObjects(function(____, frames)
        frames[1].visible = show
    end)
end
SolarActorBuffState.config = {showSolarActorBuffUI = true}
SolarActorBuffState.objectPool = __TS__New(
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
SolarActorBuffState.frameBuffMap = {}
SolarActorBuffState.ubertipFrameBD = nil
SolarActorBuffState.ubertipFrameText = nil
return ____exports
