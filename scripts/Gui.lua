local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 9,["17"] = 13,["18"] = 14,["20"] = 15,["21"] = 15,["23"] = 16,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 22,["31"] = 26,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 22,["41"] = 29,["42"] = 33,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 34,["50"] = 34,["51"] = 29,["52"] = 37,["53"] = 40,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 46,["62"] = 47,["63"] = 48,["64"] = 48,["65"] = 48,["66"] = 48,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 46,["73"] = 16,["76"] = 15,["79"] = 55,["83"] = 57,["85"] = 59,["86"] = 60,["87"] = 60,["88"] = 60,["89"] = 60,["90"] = 60,["91"] = 60,["92"] = 60,["95"] = 69,["99"] = 71,["101"] = 73,["102"] = 74,["103"] = 73,["106"] = 90,["108"] = 91,["109"] = 95,["114"] = 98,["115"] = 99,["116"] = 100,["117"] = 101,["118"] = 102,["123"] = 13,["124"] = 111,["125"] = 111,["126"] = 111,["128"] = 114,["129"] = 114,["130"] = 114,["131"] = 114,["132"] = 115,["133"] = 115,["134"] = 115,["135"] = 115,["136"] = 115,["137"] = 115,["138"] = 115,["139"] = 117,["140"] = 118,["141"] = 119,["142"] = 112});
local ____exports = {}
local React = require("solar.solar-common.w3ts.tsx.index")
local ____tween = require("solar.solar-common.lib.tween.index")
local Easing = ____tween.Easing
local Tween = ____tween.Tween
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local bgRef = {current = 0}
local kaiGuan = {current = 0}
local function App(self)
    local child = {}
    do
        local i = 1
        while i < 5 do
            do
                local j = 1
                while j < 4 do
                    local name = ((("[" .. tostring(i)) .. ",") .. tostring(j)) .. "]"
                    local ref = {current = 0}
                    local x = 0.06 * i
                    local y = 0.06 * j
                    local coords = {x = x, y = y}
                    local tween = __TS__New(Tween, {x = x, y = y, a = 255}):to({x = 0, y = 0, a = 0}, 500):easing(Easing.Quadratic.Out):onUpdate(function(____, temp)
                        DzFrameSetAlpha(ref.current, temp.a)
                        DzFrameSetPoint(
                            ref.current,
                            FRAMEPOINT_BOTTOMLEFT,
                            bgRef.current,
                            FRAMEPOINT_BOTTOMLEFT,
                            temp.x,
                            temp.y
                        )
                    end)
                    local tween2 = __TS__New(Tween, {x = 0, y = 0, a = 0}):to({x = x, y = y, a = 255}, 500):easing(Easing.Quadratic.In):onUpdate(function(____, temp)
                        DzFrameSetAlpha(ref.current, temp.a)
                        DzFrameSetPoint(
                            ref.current,
                            FRAMEPOINT_BOTTOMLEFT,
                            bgRef.current,
                            FRAMEPOINT_BOTTOMLEFT,
                            temp.x,
                            temp.y
                        )
                    end)
                    tween:chain(tween2)
                    child[#child + 1] = React:createElement(
                        "text",
                        {
                            ["background-image"] = "ReplaceableTextures\\Selection\\SelectionCircleSmall.blp",
                            position = coords,
                            textAlignment = 2,
                            text = name,
                            ref = ref,
                            onClick = function()
                                tween:start()
                                DisplayTimedTextToPlayer(
                                    GetLocalPlayer(),
                                    0,
                                    0,
                                    60,
                                    "来自React tsx代码的onClick事件child=" .. name
                                )
                            end
                        }
                    )
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    child[#child + 1] = React:createElement(
        "gluetextbutton",
        {
            ["background-image"] = "ReplaceableTextures\\Selection\\SelectionCircleSmall.blp",
            position = {x = 0.06 * 5, y = 0.06 * 4},
            text = "显示开关",
            showRefOnClick = kaiGuan,
            onMouseEnter = function() return DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                "鼠标进来了"
            ) end
        }
    )
    child[#child + 1] = React:createElement(
        "gluetextbutton",
        {
            ["background-image"] = "ReplaceableTextures\\Selection\\SelectionCircleSmall.blp",
            position = {x = 0.06 * 5, y = 0.06 * 3},
            text = "同步数据",
            onClick = function()
                SyncUtil.syncData("gui_test")
            end
        }
    )
    return React:createElement(
        "backdrop",
        {position = {x = 0.3, y = 0.2}, size = {width = 0.4, height = 0.3}, texture = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp", ref = bgRef},
        child,
        React:createElement(
            "button",
            {
                inherits = "ScoreScreenTabButtonTemplate",
                position = {x = 0.4, y = 0.3},
                size = {width = 0.08, height = 0.08},
                visible = false,
                hideParentOnClick = true,
                ref = kaiGuan
            },
            React:createElement("backdrop", {position = "parent", texture = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"})
        )
    )
end
____exports.default = __TS__Class()
local Gui = ____exports.default
Gui.name = "Gui"
function Gui.prototype.____constructor(self)
    React.render(
        React:createElement(App, nil),
        DzGetGameUI()
    )
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        60,
        "按钮的Frame=" .. tostring(bgRef.current)
    )
    print("按钮的Frame=" .. tostring(bgRef.current))
    local frameGui = __TS__New(Frame, bgRef.current)
    frameGui:setScale(1.2)
end
return ____exports
