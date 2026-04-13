local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 8,["24"] = 13,["25"] = 13,["26"] = 13,["28"] = 13,["29"] = 44,["30"] = 44,["31"] = 44,["33"] = 44,["34"] = 44,["36"] = 45,["37"] = 45,["38"] = 45,["39"] = 45,["40"] = 45,["41"] = 45,["42"] = 45,["43"] = 44,["44"] = 48,["45"] = 48,["46"] = 48,["48"] = 48,["49"] = 48,["51"] = 49,["52"] = 49,["53"] = 49,["54"] = 49,["55"] = 49,["56"] = 49,["57"] = 49,["58"] = 48,["59"] = 52,["60"] = 52,["61"] = 52,["63"] = 52,["64"] = 52,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 53,["70"] = 53,["71"] = 53,["72"] = 53,["73"] = 52,["74"] = 64,["75"] = 64,["76"] = 64,["78"] = 64,["79"] = 64,["81"] = 65,["84"] = 68,["85"] = 69,["86"] = 70,["87"] = 71,["88"] = 72,["89"] = 73,["90"] = 74,["91"] = 75,["92"] = 76,["93"] = 77,["94"] = 78,["95"] = 79,["96"] = 80,["97"] = 81,["98"] = 82,["99"] = 83,["100"] = 84,["101"] = 85,["102"] = 86,["103"] = 87,["104"] = 88,["105"] = 89,["106"] = 90,["107"] = 91,["108"] = 92,["109"] = 93,["110"] = 94,["111"] = 95,["112"] = 96,["113"] = 97,["114"] = 98,["115"] = 99,["116"] = 100,["117"] = 101,["119"] = 103,["120"] = 103,["121"] = 103,["122"] = 104,["123"] = 105,["124"] = 103,["125"] = 103,["126"] = 103,["127"] = 103,["128"] = 108,["129"] = 108,["130"] = 108,["131"] = 109,["132"] = 110,["133"] = 111,["134"] = 108,["135"] = 108,["136"] = 113,["137"] = 64,["138"] = 127,["139"] = 127,["140"] = 127,["142"] = 127,["143"] = 127,["145"] = 127,["146"] = 127,["148"] = 131,["151"] = 134,["152"] = 135,["153"] = 136,["154"] = 137,["155"] = 139,["156"] = 140,["157"] = 141,["158"] = 143,["159"] = 143,["160"] = 143,["161"] = 144,["162"] = 145,["163"] = 146,["164"] = 147,["165"] = 148,["166"] = 149,["167"] = 150,["168"] = 151,["169"] = 152,["170"] = 153,["171"] = 154,["172"] = 155,["174"] = 143,["175"] = 143,["176"] = 143,["177"] = 143,["178"] = 158,["179"] = 127,["180"] = 171,["181"] = 171,["182"] = 171,["184"] = 171,["185"] = 171,["187"] = 171,["188"] = 171,["190"] = 171,["191"] = 171,["193"] = 171,["194"] = 171,["196"] = 175,["199"] = 178,["200"] = 179,["201"] = 180,["202"] = 181,["203"] = 183,["204"] = 185,["205"] = 190,["206"] = 191,["207"] = 192,["208"] = 185,["209"] = 194,["210"] = 195,["211"] = 196,["212"] = 197,["213"] = 185,["214"] = 199,["215"] = 200,["216"] = 171,["217"] = 19,["218"] = 19,["219"] = 19,["220"] = 20,["221"] = 21,["222"] = 22,["223"] = 23,["224"] = 24,["225"] = 25,["226"] = 19,["227"] = 26,["228"] = 27,["229"] = 19,["230"] = 19,["231"] = 33,["232"] = 33,["233"] = 33,["234"] = 34,["235"] = 35,["236"] = 36,["237"] = 37,["238"] = 37,["239"] = 37,["240"] = 37,["241"] = 37,["242"] = 37,["243"] = 37,["244"] = 38,["245"] = 33,["246"] = 39,["247"] = 40,["248"] = 33,["249"] = 33});
local ____exports = {}
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____CameraUtil = require("solar.solar-common.util.game.CameraUtil")
local CameraUtil = ____CameraUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____tween = require("solar.solar-common.lib.tween.index")
local Easing = ____tween.Easing
local Tween = ____tween.Tween
____exports.default = __TS__Class()
local TipFrameUtil = ____exports.default
TipFrameUtil.name = "TipFrameUtil"
function TipFrameUtil.prototype.____constructor(self)
end
function TipFrameUtil.showWarnText(self, tipText, framePoint, dur, fontSize, showPlayer)
    if dur == nil then
        dur = 1
    end
    if fontSize == nil then
        fontSize = 0.015
    end
    return ____exports.default:showTipText(
        SolarConfig.defaultWarnTextColor .. tipText,
        framePoint,
        dur,
        fontSize,
        showPlayer
    )
end
function TipFrameUtil.showFailText(self, tipText, framePoint, dur, fontSize, showPlayer)
    if dur == nil then
        dur = 1
    end
    if fontSize == nil then
        fontSize = 0.015
    end
    return ____exports.default:showTipText(
        SolarConfig.defaultFailTextColor .. tipText,
        framePoint,
        dur,
        fontSize,
        showPlayer
    )
end
function TipFrameUtil.showSuccessText(self, tipText, framePoint, dur, fontSize, showPlayer)
    if dur == nil then
        dur = 1
    end
    if fontSize == nil then
        fontSize = 0.015
    end
    return ____exports.default:showTipText(
        SolarConfig.defaultSuccessTextColor .. tipText,
        framePoint,
        dur,
        fontSize,
        showPlayer
    )
end
function TipFrameUtil.showTipText(self, tipText, framePoint, dur, fontSize, showPlayer)
    if dur == nil then
        dur = 1
    end
    if fontSize == nil then
        fontSize = 0.015
    end
    if showPlayer ~= nil and GetLocalPlayer() ~= showPlayer then
        return
    end
    local frame = ____exports.default._sl_tipTextFrameObjectPool:borrowObject()
    frame:setText(tipText)
    frame.visible = true
    frame:setFont(fontSize)
    DzFrameShow(frame.backdropFrame.handle, true)
    local startX = 0.8
    local startY = 0.4
    if framePoint == FramePoint.left then
        startX = 0.01
        startY = 0.3
    elseif framePoint == FramePoint.bottomLeft then
        startX = 0.05
        startY = 0.15
    elseif framePoint == FramePoint.bottom then
        startX = 0.4
        startY = 0.15
    elseif framePoint == FramePoint.bottomRight then
        startX = 0.78
        startY = 0.15
    elseif framePoint == FramePoint.right then
        startX = 0.78
        startY = 0.3
    elseif framePoint == FramePoint.topRight then
        startX = 0.78
        startY = 0.5
    elseif framePoint == FramePoint.top then
        startX = 0.4
        startY = 0.48
    elseif framePoint == FramePoint.topLeft then
        startX = 0.05
        startY = 0.5
    elseif framePoint == FramePoint.center then
        startX = 0.4
        startY = 0.38
    end
    BaseUtil.runLater(
        0.03,
        function(count, maxCount)
            local y = 0.01 + 0.002 * count
            frame:setAbsPoint(framePoint, startX, startY + y)
        end,
        30,
        true
    )
    BaseUtil.runLater(
        dur,
        function()
            frame.visible = false
            DzFrameShow(frame.backdropFrame.handle, false)
            ____exports.default._sl_tipTextFrameObjectPool:returnObject(frame)
        end
    )
    return frame
end
function TipFrameUtil.showIconTextOnUnit(self, icon, tipText, unit, dur, iconSize, fontSize, showPlayer)
    if dur == nil then
        dur = 1
    end
    if iconSize == nil then
        iconSize = 0.011
    end
    if fontSize == nil then
        fontSize = iconSize
    end
    if showPlayer ~= nil and GetLocalPlayer() ~= showPlayer then
        return
    end
    local frames = ____exports.default._sl_tipIconTextFrameObjectPool:borrowObject()
    frames.icon:setSize(iconSize, iconSize)
    frames.icon:setTexture(icon)
    frames.icon.visible = true
    frames.text:setText(tipText)
    frames.text.visible = true
    frames.text:setFont(fontSize)
    BaseUtil.runLater(
        0.03,
        function(count, maxCount)
            local y = 0.01 + 0.002 * math.min(count, 30)
            local ux = GetUnitX(unit)
            local uy = GetUnitY(unit)
            local tz = GameUtil:getTerrainHeight(ux, uy)
            local vector = CameraUtil:getScreenCoordinates(ux, uy, tz + 150)
            local startX = vector.x
            local startY = vector.y
            frames.icon:setAbsPoint(FramePoint.bottom, startX, startY + y)
            if count == maxCount then
                frames.icon.visible = false
                frames.text.visible = false
                ____exports.default._sl_tipIconTextFrameObjectPool:returnObject(frames)
            end
        end,
        math.floor(dur / 0.03),
        true
    )
    return frames
end
function TipFrameUtil.showIconMoveIntoAnimation(self, icon, startX, startY, toX, toY, dur, showPlayer)
    if startX == nil then
        startX = 0.4
    end
    if startY == nil then
        startY = 0.3
    end
    if toX == nil then
        toX = 0.08
    end
    if toY == nil then
        toY = 0.055
    end
    if dur == nil then
        dur = 0.5
    end
    if showPlayer ~= nil and GetLocalPlayer() ~= showPlayer then
        return
    end
    local frames = ____exports.default._sl_tipIconTextFrameObjectPool:borrowObject()
    frames.icon:setSize(0.06, 0.06)
    frames.icon:setTexture(icon)
    frames.icon.visible = true
    frames.text.visible = false
    local tween = __TS__New(Tween, {x = startX, y = startY, s = 0.06, a = 255}):to({x = toX, y = toY, s = 0.025, a = 155}, dur * 1000):easing(Easing.Linear.None):onUpdate(function(____, temp)
        DzFrameSetAlpha(frames.icon.current, temp.a)
        DzFrameSetAbsolutePoint(frames.icon.current, FRAMEPOINT_CENTER, temp.x, temp.y)
        DzFrameSetSize(frames.icon.current, temp.s, temp.s)
    end):onComplete(function(____, o)
        frames.icon:setSize(0.04, 0.04)
        frames.icon.visible = false
        frames.text.visible = false
        ____exports.default._sl_tipIconTextFrameObjectPool:returnObject(frames)
    end)
    tween:start()
    return frames
end
TipFrameUtil._sl_tipTextFrameObjectPool = __TS__New(
    ObjectPool,
    function()
        local backDrop = Frame:createBackDrop()
        backDrop:setTexture(SolarConfig.defaultTipBackgroundPath)
        local text = Frame:createTEXT()
        backDrop:setPoints(text.handle, 0.002, 0.001)
        text.backdropFrame = backDrop
        return text
    end,
    function(____, obj)
        obj:clearPoints()
    end
)
TipFrameUtil._sl_tipIconTextFrameObjectPool = __TS__New(
    ObjectPool,
    function()
        local icon = Frame:createBackDrop()
        icon:setTexture(SolarConfig.defaultTipBackgroundPath)
        local text = Frame:createTEXT()
        text:setPoint(
            FramePoint.left,
            icon.handle,
            FramePoint.right,
            0.001,
            0
        )
        return {icon = icon, text = text}
    end,
    function(____, obj)
        obj.icon:clearPoints()
    end
)
return ____exports
