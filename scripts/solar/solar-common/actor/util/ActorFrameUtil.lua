local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 15,["27"] = 15,["28"] = 15,["30"] = 15,["31"] = 33,["32"] = 33,["33"] = 33,["35"] = 34,["36"] = 33,["37"] = 37,["38"] = 37,["39"] = 37,["41"] = 38,["42"] = 37,["43"] = 41,["44"] = 41,["45"] = 41,["47"] = 42,["48"] = 41,["49"] = 52,["50"] = 52,["51"] = 52,["53"] = 53,["56"] = 56,["57"] = 57,["58"] = 58,["59"] = 59,["60"] = 60,["61"] = 60,["62"] = 60,["63"] = 61,["64"] = 62,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 62,["71"] = 60,["72"] = 60,["73"] = 60,["74"] = 60,["75"] = 64,["76"] = 64,["77"] = 64,["78"] = 65,["79"] = 66,["80"] = 67,["81"] = 64,["82"] = 64,["83"] = 52,["84"] = 77,["85"] = 78,["88"] = 81,["89"] = 82,["90"] = 83,["91"] = 84,["92"] = 87,["93"] = 89,["94"] = 90,["95"] = 91,["96"] = 92,["97"] = 93,["99"] = 95,["101"] = 97,["102"] = 98,["103"] = 99,["104"] = 100,["106"] = 102,["107"] = 103,["109"] = 106,["110"] = 107,["111"] = 108,["112"] = 109,["113"] = 110,["114"] = 111,["116"] = 113,["117"] = 114,["119"] = 116,["120"] = 117,["121"] = 118,["122"] = 119,["123"] = 120,["125"] = 122,["126"] = 123,["128"] = 125,["129"] = 126,["130"] = 127,["131"] = 128,["132"] = 129,["134"] = 131,["135"] = 132,["137"] = 134,["138"] = 135,["139"] = 77,["140"] = 138,["141"] = 139,["142"] = 141,["143"] = 142,["144"] = 143,["145"] = 143,["146"] = 143,["147"] = 143,["148"] = 147,["149"] = 148,["150"] = 149,["151"] = 150,["153"] = 152,["155"] = 154,["156"] = 158,["157"] = 159,["158"] = 160,["159"] = 160,["160"] = 160,["161"] = 160,["164"] = 168,["165"] = 169,["166"] = 170,["167"] = 170,["168"] = 170,["169"] = 170,["170"] = 174,["171"] = 175,["172"] = 176,["173"] = 177,["175"] = 179,["177"] = 181,["178"] = 185,["179"] = 186,["180"] = 186,["181"] = 186,["182"] = 186,["184"] = 193,["185"] = 194,["186"] = 195,["187"] = 195,["188"] = 195,["189"] = 195,["190"] = 199,["191"] = 200,["192"] = 200,["193"] = 200,["194"] = 200,["195"] = 205,["196"] = 206,["197"] = 206,["198"] = 206,["199"] = 206,["201"] = 211,["202"] = 138,["203"] = 215,["204"] = 216,["207"] = 219,["208"] = 220,["209"] = 221,["210"] = 222,["211"] = 215,["212"] = 225,["213"] = 227,["216"] = 231,["217"] = 231,["218"] = 231,["219"] = 231,["220"] = 231,["221"] = 231,["222"] = 231,["223"] = 231,["224"] = 232,["225"] = 233,["226"] = 234,["227"] = 235,["228"] = 236,["229"] = 236,["230"] = 236,["231"] = 236,["232"] = 236,["233"] = 236,["234"] = 236,["235"] = 238,["236"] = 239,["237"] = 240,["238"] = 240,["239"] = 240,["240"] = 240,["241"] = 240,["242"] = 240,["243"] = 240,["244"] = 242,["245"] = 243,["246"] = 244,["247"] = 244,["248"] = 244,["249"] = 244,["250"] = 244,["251"] = 244,["252"] = 244,["253"] = 248,["254"] = 249,["255"] = 250,["256"] = 251,["257"] = 252,["258"] = 252,["259"] = 252,["260"] = 252,["261"] = 252,["262"] = 252,["263"] = 252,["264"] = 253,["265"] = 253,["266"] = 253,["267"] = 253,["268"] = 253,["269"] = 253,["270"] = 253,["271"] = 255,["272"] = 256,["273"] = 257,["274"] = 258,["275"] = 259,["276"] = 259,["277"] = 259,["278"] = 259,["279"] = 259,["280"] = 259,["281"] = 259,["282"] = 260,["283"] = 260,["284"] = 260,["285"] = 260,["286"] = 260,["287"] = 260,["288"] = 260,["289"] = 262,["290"] = 263,["291"] = 264,["292"] = 265,["293"] = 266,["294"] = 266,["295"] = 266,["296"] = 266,["297"] = 266,["298"] = 266,["299"] = 266,["300"] = 267,["301"] = 267,["302"] = 267,["303"] = 267,["304"] = 267,["305"] = 267,["306"] = 267,["307"] = 270,["308"] = 271,["309"] = 272,["310"] = 274,["311"] = 275,["312"] = 275,["313"] = 275,["314"] = 275,["315"] = 275,["316"] = 275,["317"] = 275,["318"] = 276,["319"] = 278,["320"] = 278,["321"] = 278,["322"] = 278,["323"] = 278,["324"] = 278,["325"] = 278,["326"] = 278,["327"] = 279,["328"] = 279,["329"] = 279,["330"] = 279,["331"] = 279,["332"] = 279,["333"] = 279,["334"] = 279,["335"] = 282,["336"] = 284,["337"] = 284,["338"] = 284,["339"] = 284,["340"] = 284,["341"] = 284,["342"] = 284,["343"] = 284,["344"] = 284,["345"] = 284,["346"] = 284,["347"] = 284,["348"] = 284,["349"] = 284,["350"] = 225,["351"] = 301,["352"] = 302,["354"] = 303,["355"] = 303,["356"] = 303,["357"] = 303,["358"] = 303,["359"] = 303,["360"] = 303,["361"] = 303,["362"] = 303,["363"] = 303,["364"] = 304,["365"] = 305,["366"] = 306,["368"] = 309,["369"] = 310,["371"] = 315,["372"] = 301});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
____exports.default = __TS__Class()
local ActorFrameUtil = ____exports.default
ActorFrameUtil.name = "ActorFrameUtil"
function ActorFrameUtil.prototype.____constructor(self)
end
function ActorFrameUtil.showWarnText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(actor, SolarConfig.defaultWarnTextColor .. tipText, dur, showPlayer)
end
function ActorFrameUtil.showFailText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(actor, SolarConfig.defaultFailTextColor .. tipText, dur, showPlayer)
end
function ActorFrameUtil.showSuccessText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(actor, SolarConfig.defaultSuccessTextColor .. tipText, dur, showPlayer)
end
function ActorFrameUtil.showTipText(self, actor, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    if showPlayer ~= nil and GetLocalPlayer() ~= showPlayer then
        return
    end
    local frame = TipFrameUtil._sl_tipTextFrameObjectPool:borrowObject()
    frame:setText(tipText)
    frame.visible = true
    DzFrameShow(frame.backdropFrame.handle, true)
    BaseUtil.runLater(
        0.03,
        function(count, maxCount)
            local y = 0.01 + 0.002 * count
            frame:setPoint(
                FramePoint.bottom,
                actor:getRootFrameControl().rootFrame.handle,
                FramePoint.top,
                0,
                y
            )
        end,
        30,
        true
    )
    BaseUtil.runLater(
        dur,
        function()
            frame.visible = false
            DzFrameShow(frame.backdropFrame.handle, false)
            TipFrameUtil._sl_tipTextFrameObjectPool:returnObject(frame)
        end
    )
end
function ActorFrameUtil.showTooltip(self, actor)
    if actor == nil then
        return
    end
    ____exports.default:_sl_initTooltip()
    local tooltip = DzFrameGetTooltip()
    DzFrameClearAllPoints(tooltip)
    DzFrameSetAbsolutePoint(tooltip, FramePoint.bottomLeft, 0.81, 0)
    local tooltipFrames = ____exports.default._sl_tooltipFrames
    tooltipFrames.name:setText(actor:getName())
    local hotKey = actor:get("hotKey")
    if hotKey ~= nil and #hotKey > 0 and __TS__InstanceOf(actor, ActorAbility) and not actor:isPassive() then
        tooltipFrames.hotKey:setText(("(|cffeeee00" .. hotKey) .. "|r)")
        tooltipFrames.hotKey.visible = true
    else
        tooltipFrames.hotKey.visible = false
    end
    tooltipFrames.icon:setTexture(actor:getIcon())
    if actor:isDisable() and actor:get("requiredTip") ~= nil then
        tooltipFrames.requiredTip:setText("|cffffff00需要:|n - " .. actor:get("requiredTip"))
        tooltipFrames.requiredTip.visible = true
    else
        tooltipFrames.requiredTip:setText("")
        tooltipFrames.requiredTip.visible = false
    end
    local labelInfos = ____exports.default:getActorCostLabelInfo(actor)
    if #labelInfos > 0 then
        tooltipFrames.labelIcon1:setTexture(labelInfos[1].icon)
        tooltipFrames.label1:setText(labelInfos[1].text)
        tooltipFrames.labelIcon1.visible = true
        tooltipFrames.label1.visible = true
    else
        tooltipFrames.labelIcon1.visible = false
        tooltipFrames.label1.visible = false
    end
    if #labelInfos > 1 then
        tooltipFrames.labelIcon2:setTexture(labelInfos[2].icon)
        tooltipFrames.label2:setText(labelInfos[2].text)
        tooltipFrames.labelIcon2.visible = true
        tooltipFrames.label2.visible = true
    else
        tooltipFrames.labelIcon2.visible = false
        tooltipFrames.label2.visible = false
    end
    if #labelInfos > 2 then
        tooltipFrames.labelIcon3:setTexture(labelInfos[3].icon)
        tooltipFrames.label3:setText(labelInfos[3].text)
        tooltipFrames.labelIcon3.visible = true
        tooltipFrames.label3.visible = true
    else
        tooltipFrames.labelIcon3.visible = false
        tooltipFrames.label3.visible = false
    end
    tooltipFrames.describe:setText(actor:getDescribe(true))
    tooltipFrames.root.visible = true
end
function ActorFrameUtil.getActorCostLabelInfo(self, actor)
    local labelInfo = {}
    local goldCost = actor:get("goldCost")
    if actor:get("tooltipLabel1") then
        labelInfo[#labelInfo + 1] = {
            icon = actor:get("tooltipLabelIcon1") or SolarConfig.defaultResourceGoldPath,
            text = actor:get("tooltipLabel1")
        }
    elseif goldCost and goldCost > 0 then
        local text = nil
        if __TS__InstanceOf(actor, ActorItem) then
            text = TextUtil:toCnUnit(goldCost * PawnItemRate)
        else
            text = TextUtil:toCnUnit(goldCost)
        end
        labelInfo[#labelInfo + 1] = {icon = SolarConfig.defaultResourceGoldPath, text = text}
    elseif __TS__InstanceOf(actor, ActorAbility) then
        if not actor:isPassive() and actor:get("maxCd") ~= nil and actor:get("maxCd") > 2 then
            labelInfo[#labelInfo + 1] = {
                icon = "UI\\Widgets\\ToolTips\\Human\\ToolTipStonesIcon.blp",
                text = tostring(actor:get("maxCd")) .. "秒"
            }
        end
    end
    local lumberCost = actor:get("lumberCost")
    if actor:get("tooltipLabel2") then
        labelInfo[#labelInfo + 1] = {
            icon = actor:get("tooltipLabelIcon2") or SolarConfig.defaultResourceLumberPath,
            text = actor:get("tooltipLabel2")
        }
    elseif lumberCost and lumberCost > 0 then
        local text = nil
        if __TS__InstanceOf(actor, ActorItem) then
            text = TextUtil:toCnUnit(lumberCost * PawnItemRate)
        else
            text = TextUtil:toCnUnit(lumberCost)
        end
        labelInfo[#labelInfo + 1] = {icon = SolarConfig.defaultResourceLumberPath, text = text}
    elseif actor:get("manaCost") ~= nil and actor:get("manaCost") > 0 then
        labelInfo[#labelInfo + 1] = {
            icon = "UI\\Widgets\\ToolTips\\Human\\ToolTipManaIcon.blp",
            text = tostring(actor:get("manaCost")) .. "魔法"
        }
    end
    local foodCost = actor:get("foodCost")
    if actor:get("tooltipLabel3") then
        labelInfo[#labelInfo + 1] = {
            icon = actor:get("tooltipLabelIcon3") or "UI\\Feedback\\Resources\\ResourceUndead.blp",
            text = actor:get("tooltipLabel3")
        }
    elseif foodCost and foodCost > 0 then
        labelInfo[#labelInfo + 1] = {
            icon = "UI\\Widgets\\ToolTips\\Human\\ToolTipSupplyIcon.blp",
            text = tostring(foodCost) .. ""
        }
    elseif actor:get("killsCost") ~= nil and actor:get("killsCost") > 0 then
        labelInfo[#labelInfo + 1] = {
            icon = "UI\\Feedback\\Resources\\ResourceUndead.blp",
            text = tostring(actor:get("killsCost")) .. "杀敌数"
        }
    end
    return labelInfo
end
function ActorFrameUtil.hideTooltip(self)
    if ____exports.default._sl_tooltipFrames == nil then
        return
    end
    ____exports.default._sl_tooltipFrames.root.visible = false
    local tooltip = DzFrameGetTooltip()
    DzFrameClearAllPoints(tooltip)
    DzFrameSetAbsolutePoint(tooltip, FramePoint.bottomRight, 0.8, 0.16)
end
function ActorFrameUtil._sl_initTooltip(self)
    if ____exports.default._sl_tooltipFrames ~= nil then
        return
    end
    local root = __TS__New(
        Frame,
        "BACKDROP",
        nil,
        DzGetGameUI(),
        "_sl_border_backdrop",
        0
    )
    local gap = 0.008
    local fontSize = 0.0113
    local icon = Frame:createBackDrop(root.handle)
    icon:setSize(0.03, 0.04)
    icon:setPoint(
        FramePoint.topLeft,
        root.handle,
        FramePoint.topLeft,
        gap,
        -gap
    )
    local name = Frame:createTEXT(root.handle)
    name:setFont(fontSize)
    name:setPoint(
        FramePoint.topLeft,
        icon.handle,
        FramePoint.topRight,
        gap,
        0
    )
    local hotKey = Frame:createTEXT(root.handle)
    hotKey:setFont(fontSize)
    hotKey:setPoint(
        FramePoint.left,
        name.handle,
        FramePoint.right,
        0.001,
        0
    )
    local labelIcon1 = Frame:createBackDrop(root.handle)
    local label1 = Frame:createTEXT(root.handle)
    label1:setFont(fontSize)
    labelIcon1:setSize(0.009, 0.012)
    labelIcon1:setPoint(
        FramePoint.topLeft,
        name.handle,
        FramePoint.bottomLeft,
        0,
        -gap
    )
    label1:setPoint(
        FramePoint.left,
        labelIcon1.handle,
        FramePoint.right,
        0.002,
        0
    )
    local labelIcon2 = Frame:createBackDrop(root.handle)
    local label2 = Frame:createTEXT(root.handle)
    label2:setFont(fontSize)
    labelIcon2:setSize(0.009, 0.012)
    labelIcon2:setPoint(
        FramePoint.left,
        label1.handle,
        FramePoint.right,
        gap,
        0
    )
    label2:setPoint(
        FramePoint.left,
        labelIcon2.handle,
        FramePoint.right,
        0.002,
        0
    )
    local labelIcon3 = Frame:createBackDrop(root.handle)
    local label3 = Frame:createTEXT(root.handle)
    label3:setFont(fontSize)
    labelIcon3:setSize(0.009, 0.012)
    labelIcon3:setPoint(
        FramePoint.left,
        label2.handle,
        FramePoint.right,
        gap,
        0
    )
    label3:setPoint(
        FramePoint.left,
        labelIcon3.handle,
        FramePoint.right,
        0.002,
        0
    )
    local describe = Frame:createTEXT(root.handle)
    describe:setFont(fontSize)
    DzFrameSetSize(describe.handle, 0.2, -1)
    local requiredTip = Frame:createTEXT(root.handle)
    requiredTip:setPoint(
        FramePoint.bottomLeft,
        describe.handle,
        FramePoint.topLeft,
        0,
        gap
    )
    DzFrameSetSize(requiredTip.handle, 0.2, -1)
    DzFrameSetPoint(
        root.handle,
        FRAMEPOINT_TOPLEFT,
        requiredTip.handle,
        FRAMEPOINT_TOPLEFT,
        -gap,
        0.055
    )
    DzFrameSetPoint(
        root.handle,
        FRAMEPOINT_BOTTOMRIGHT,
        describe.handle,
        FRAMEPOINT_BOTTOMRIGHT,
        gap,
        -gap
    )
    describe:setAbsPoint(FramePoint.bottomRight, SolarConfig.defaultTooltipFrameAbsX, SolarConfig.defaultTooltipFrameAbsY)
    ____exports.default._sl_tooltipFrames = {
        root = root,
        name = name,
        hotKey = hotKey,
        icon = icon,
        requiredTip = requiredTip,
        describe = describe,
        labelIcon1 = labelIcon1,
        label1 = label1,
        labelIcon2 = labelIcon2,
        label2 = label2,
        labelIcon3 = labelIcon3,
        label3 = label3
    }
end
function ActorFrameUtil.localClickActorType(self, actorType, btn, x, y)
    isAsync = true
    local ____this_1
    ____this_1 = actorType
    local ____opt_0 = ____this_1.onLocalClick
    local b = ____opt_0 and ____opt_0(
        ____this_1,
        nil,
        btn,
        x,
        y,
        actorType
    )
    isAsync = false
    if b == false then
        return false
    end
    if actorType.onClick ~= nil then
        SyncUtil.syncObjData("_sl_:at:onClick", {i = actorType.id, b = btn})
    end
    return true
end
return ____exports
