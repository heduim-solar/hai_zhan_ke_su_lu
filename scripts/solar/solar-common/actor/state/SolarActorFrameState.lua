local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 16,["31"] = 16,["32"] = 16,["34"] = 25,["35"] = 26,["38"] = 29,["41"] = 32,["42"] = 33,["43"] = 34,["44"] = 35,["45"] = 32,["46"] = 38,["47"] = 39,["48"] = 40,["51"] = 44,["53"] = 38,["55"] = 52,["56"] = 52,["58"] = 53,["59"] = 53,["60"] = 54,["61"] = 55,["62"] = 56,["63"] = 57,["64"] = 58,["65"] = 59,["66"] = 58,["67"] = 61,["68"] = 53,["71"] = 52,["75"] = 67,["76"] = 67,["77"] = 68,["78"] = 69,["79"] = 70,["80"] = 71,["81"] = 72,["82"] = 71,["83"] = 74,["84"] = 67,["87"] = 77,["88"] = 78,["89"] = 79,["91"] = 77,["92"] = 82,["93"] = 82,["94"] = 82,["95"] = 83,["96"] = 84,["97"] = 85,["98"] = 86,["100"] = 82,["101"] = 82,["102"] = 24,["103"] = 92,["104"] = 93,["105"] = 94,["108"] = 97,["109"] = 98,["110"] = 99,["111"] = 100,["112"] = 101,["114"] = 92,["115"] = 105,["116"] = 106,["117"] = 107,["120"] = 110,["121"] = 111,["122"] = 112,["125"] = 115,["126"] = 116,["127"] = 117,["128"] = 105,["129"] = 120,["130"] = 121,["131"] = 122,["132"] = 123,["133"] = 120,["134"] = 127,["135"] = 129,["137"] = 130,["138"] = 130,["139"] = 131,["140"] = 132,["141"] = 133,["142"] = 134,["143"] = 135,["144"] = 136,["147"] = 139,["148"] = 141,["149"] = 142,["150"] = 143,["151"] = 144,["152"] = 145,["154"] = 147,["155"] = 148,["156"] = 149,["157"] = 150,["159"] = 152,["162"] = 130,["165"] = 127,["166"] = 159,["168"] = 161,["169"] = 161,["171"] = 162,["172"] = 163,["173"] = 164,["174"] = 165,["175"] = 166,["176"] = 167,["178"] = 169,["180"] = 171,["181"] = 172,["182"] = 173,["183"] = 174,["184"] = 175,["187"] = 178,["188"] = 180,["189"] = 181,["190"] = 182,["191"] = 183,["192"] = 184,["194"] = 186,["195"] = 187,["196"] = 188,["197"] = 189,["199"] = 191,["204"] = 161,["207"] = 159,["208"] = 198,["209"] = 200,["211"] = 201,["212"] = 202,["213"] = 203,["215"] = 205,["216"] = 206,["219"] = 209,["220"] = 210,["221"] = 211,["223"] = 213,["224"] = 214,["225"] = 215,["226"] = 216,["227"] = 217,["229"] = 219,["231"] = 222,["232"] = 223,["233"] = 224,["234"] = 225,["236"] = 227,["237"] = 228,["238"] = 229,["240"] = 231,["241"] = 232,["245"] = 198,["246"] = 18,["247"] = 19,["248"] = 20,["249"] = 21});
local ____exports = {}
local ____FrameCallbackUtil = require("solar.solar-common.util.frame.FrameCallbackUtil")
local FrameCallbackUtil = ____FrameCallbackUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____ActorUnit = require("solar.solar-common.actor.ActorUnit")
local ActorUnit = ____ActorUnit.default
local ____CameraUtil = require("solar.solar-common.util.game.CameraUtil")
local CameraUtil = ____CameraUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
____exports.default = __TS__Class()
local SolarActorFrameState = ____exports.default
SolarActorFrameState.name = "SolarActorFrameState"
function SolarActorFrameState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorFrameState()")
        return
    end
    if DzFrameGetCommandBarButton == nil then
        return
    end
    FrameCallbackUtil:addFrameSetUpdateCallback(function()
        ____exports.default:updateItemFrame()
        ____exports.default:updateAbilityFrame()
        ____exports.default:updateUnitFrame()
    end)
    InputUtil:onMouseRightButtonReleased(function()
        if ____exports.default.mouseFocusActor then
            if ____exports.default.mouseFocusActor:isDisable() or ____exports.default.mouseFocusActor:isHide() then
                return
            end
            ____exports.default.mouseFocusActor:localClick(2, 0, 0)
        end
    end)
    do
        local x = 0
        while x <= 3 do
            do
                local y = 0
                while y <= 2 do
                    local cmdButton = DzFrameGetCommandBarButton(y, x)
                    local cmdButtonFrame = Frame:fromHandle(cmdButton)
                    local fx = x
                    local fy = y
                    cmdButtonFrame:addOnMouseEnter(function()
                        ____exports.default.showAbilityTooltip(fx, fy)
                    end)
                    cmdButtonFrame:addOnMouseLeave(____exports.default.hideTooltip)
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
    do
        local i = 0
        while i < 6 do
            local cmdButton = DzFrameGetItemBarButton(i)
            local cmdButtonFrame = Frame:fromHandle(cmdButton)
            local fi = i
            cmdButtonFrame:addOnMouseEnter(function()
                ____exports.default.showItemTooltip(fi)
            end)
            cmdButtonFrame:addOnMouseLeave(____exports.default.hideTooltip)
            i = i + 1
        end
    end
    se:onUnitSelected(function(e)
        if ____exports.default._sl_mouseFocusItemIndex >= 0 then
            ____exports.default.showItemTooltip(____exports.default._sl_mouseFocusItemIndex)
        end
    end)
    se:on(
        "刷新UI",
        function()
            if ____exports.default._sl_mouseFocusItemIndex >= 0 then
                ____exports.default.showItemTooltip(____exports.default._sl_mouseFocusItemIndex)
            elseif ____exports.default.mouseFocusActor ~= nil then
                ActorFrameUtil:showTooltip(____exports.default.mouseFocusActor)
            end
        end
    )
end
function SolarActorFrameState.showItemTooltip(i)
    local u = selection()
    if not IsHandle(u) then
        return
    end
    ____exports.default._sl_mouseFocusItemIndex = i
    local item = UnitItemInSlot(u, i)
    local actorItem = ActorItemUtil:getActorItem(item)
    if actorItem ~= nil then
        ActorFrameUtil:showTooltip(actorItem)
    end
end
function SolarActorFrameState.showAbilityTooltip(x, y)
    local ability, order = button(x, y)
    if ability == nil or ability == 0 then
        return
    end
    local abilityIdStr = id2string(ability)
    local actorAbility = ActorAbilityUtil:getActorAbility(abilityIdStr)
    if actorAbility == nil then
        return
    end
    ____exports.default._sl_mouseFocusItemIndex = -1
    ____exports.default.mouseFocusActor = actorAbility
    ActorFrameUtil:showTooltip(actorAbility)
end
function SolarActorFrameState.hideTooltip()
    ActorFrameUtil:hideTooltip()
    ____exports.default.mouseFocusActor = nil
    ____exports.default._sl_mouseFocusItemIndex = -1
end
function SolarActorFrameState.updateItemFrame(self)
    local unit = selection()
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            local actorItem = ActorItemUtil:getActorItem(item)
            if actorItem == nil then
                if ____exports.default.itemBarButtonActorFrames[i] then
                    ____exports.default.itemBarButtonActorFrames[i].rootFrame.visible = false
                    ____exports.default.itemBarButtonActorFrames[i] = nil
                end
            else
                local buttonFrame = DzFrameGetItemBarButton(i)
                local frame = actorItem:getRootFrameControl(false)
                if frame ~= ____exports.default.itemBarButtonActorFrames[i] then
                    if ____exports.default.itemBarButtonActorFrames[i] then
                        ____exports.default.itemBarButtonActorFrames[i].rootFrame.visible = false
                        ____exports.default.itemBarButtonActorFrames[i] = nil
                    end
                    if frame then
                        frame.rootFrame:clearPoints()
                        frame.rootFrame:setAllPoints(buttonFrame)
                        frame.rootFrame.visible = true
                    end
                    ____exports.default.itemBarButtonActorFrames[i] = frame
                end
            end
            i = i + 1
        end
    end
end
function SolarActorFrameState.updateAbilityFrame(self)
    do
        local i = 1
        while i <= 12 do
            do
                local pos = AbilityButtonUtil:getPosByNumber(i)
                local button_abilityId, orderID, orderType = button(pos.x, pos.y)
                if button_abilityId == nil or button_abilityId == 0 then
                    if ____exports.default.commandBarButtonActorFrames[i] then
                        ____exports.default.commandBarButtonActorFrames[i].rootFrame.visible = false
                        ____exports.default.commandBarButtonActorFrames[i] = nil
                    end
                    goto __continue40
                end
                local actorAbility = ActorAbilityUtil:getActorAbility(id2string(button_abilityId))
                if actorAbility == nil then
                    if ____exports.default.commandBarButtonActorFrames[i] then
                        ____exports.default.commandBarButtonActorFrames[i].rootFrame.visible = false
                        ____exports.default.commandBarButtonActorFrames[i] = nil
                    end
                else
                    local buttonFrame = DzFrameGetCommandBarButton(pos.y, pos.x)
                    local frame = actorAbility:getRootFrameControl(false)
                    if frame ~= ____exports.default.commandBarButtonActorFrames[i] then
                        if ____exports.default.commandBarButtonActorFrames[i] then
                            ____exports.default.commandBarButtonActorFrames[i].rootFrame.visible = false
                            ____exports.default.commandBarButtonActorFrames[i] = nil
                        end
                        if frame then
                            frame.rootFrame:clearPoints()
                            frame.rootFrame:setAllPoints(buttonFrame)
                            frame.rootFrame.visible = true
                        end
                        ____exports.default.commandBarButtonActorFrames[i] = frame
                    end
                end
            end
            ::__continue40::
            i = i + 1
        end
    end
end
function SolarActorFrameState.updateUnitFrame(self)
    for actorUuid in pairs(ActorUnit._sl_hasFrameActorUnits) do
        do
            local actorUnit = ActorUnit._sl_hasFrameActorUnits[actorUuid]
            if actorUnit == nil or actorUnit:isDestroyed() then
                goto __continue50
            end
            local rootFrame = actorUnit:getRootFrameControl(false)
            if rootFrame == nil then
                return
            end
            if not UnitAlive(actorUnit.unit) then
                rootFrame.rootFrame.visible = false
                goto __continue50
            end
            local x = actorUnit.unitX
            local y = actorUnit.unitY
            local z = GameUtil:getTerrainHeight(x, y)
            if unit_overhead then
                z = z + unit_overhead(actorUnit.unit) - 50
            else
                z = z + 150
            end
            local scoordinates = CameraUtil:getScreenCoordinates(x, y, z)
            if scoordinates.x <= 0 or scoordinates.x >= 0.8 then
                rootFrame.rootFrame.visible = false
                goto __continue50
            end
            if scoordinates.y <= 0.13 or scoordinates.y >= 0.56 then
                rootFrame.rootFrame.visible = false
                goto __continue50
            end
            rootFrame.rootFrame:setAbsPoint(FramePoint.bottom, scoordinates.x, scoordinates.y)
            rootFrame.rootFrame.visible = true
        end
        ::__continue50::
    end
end
SolarActorFrameState.mouseFocusActor = nil
SolarActorFrameState._sl_mouseFocusItemIndex = -1
SolarActorFrameState.commandBarButtonActorFrames = {}
SolarActorFrameState.itemBarButtonActorFrames = {}
return ____exports
