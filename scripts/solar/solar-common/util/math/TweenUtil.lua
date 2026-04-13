local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 5,["12"] = 5,["13"] = 5,["15"] = 5,["16"] = 20,["17"] = 20,["18"] = 20,["20"] = 20,["21"] = 20,["23"] = 20,["24"] = 20,["26"] = 20,["27"] = 20,["29"] = 20,["30"] = 20,["32"] = 21,["33"] = 21,["35"] = 21,["36"] = 21,["38"] = 21,["39"] = 21,["41"] = 22,["42"] = 23,["43"] = 23,["44"] = 23,["46"] = 23,["48"] = 23,["49"] = 24,["50"] = 24,["51"] = 24,["53"] = 24,["55"] = 24,["56"] = 25,["57"] = 25,["58"] = 25,["59"] = 25,["60"] = 25,["61"] = 25,["62"] = 25,["63"] = 26,["64"] = 26,["65"] = 26,["66"] = 26,["67"] = 26,["68"] = 26,["69"] = 26,["70"] = 33,["71"] = 33,["72"] = 33,["73"] = 33,["74"] = 38,["75"] = 39,["76"] = 39,["77"] = 39,["78"] = 39,["79"] = 39,["80"] = 39,["81"] = 39,["82"] = 39,["83"] = 40,["84"] = 33,["85"] = 42,["86"] = 43,["87"] = 48,["88"] = 49,["89"] = 49,["90"] = 49,["91"] = 49,["92"] = 49,["93"] = 49,["94"] = 49,["95"] = 49,["96"] = 50,["97"] = 43,["98"] = 52,["100"] = 54,["101"] = 55,["102"] = 20});
local ____exports = {}
local ____tween = require("solar.solar-common.lib.tween.index")
local Easing = ____tween.Easing
local Tween = ____tween.Tween
____exports.default = __TS__Class()
local TweenUtil = ____exports.default
TweenUtil.name = "TweenUtil"
function TweenUtil.prototype.____constructor(self)
end
function TweenUtil.frameTransition(frame, duration, x, y, w, h, a, delay, rollback)
    if duration == nil then
        duration = 200
    end
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if w == nil then
        w = 0
    end
    if h == nil then
        h = 0
    end
    if a == nil then
        a = 150
    end
    if delay == nil then
        delay = 0
    end
    if rollback == nil then
        rollback = false
    end
    local prop = frame.props
    local ____prop_position_x_0
    if prop.position.x then
        ____prop_position_x_0 = prop.position.x
    else
        ____prop_position_x_0 = 0
    end
    local ox = ____prop_position_x_0
    local ____prop_position_y_1
    if prop.position.y then
        ____prop_position_y_1 = prop.position.y
    else
        ____prop_position_y_1 = 0
    end
    local oy = ____prop_position_y_1
    local srcObj = {
        x = ox,
        y = oy,
        w = prop.size.width,
        h = prop.size.height,
        a = 255
    }
    local toObj = {
        x = ox + x,
        y = oy + y,
        w = prop.size.width + w,
        h = prop.size.height + h,
        a = a
    }
    local tween1 = __TS__New(
        Tween,
        __TS__ObjectAssign({}, srcObj)
    ):to(toObj, duration):delay(delay):easing(Easing.Quadratic.Out):onUpdate(function(____, temp)
        DzFrameSetAlpha(frame.current, temp.a)
        DzFrameSetPoint(
            frame.current,
            FRAMEPOINT_BOTTOMLEFT,
            DzFrameGetParent(frame.current),
            FRAMEPOINT_BOTTOMLEFT,
            temp.x,
            temp.y
        )
        DzFrameSetSize(frame.current, temp.w, temp.h)
    end)
    if rollback then
        local tween2 = __TS__New(Tween, toObj):to(srcObj, duration):delay(delay):easing(Easing.Quadratic.In):onUpdate(function(____, temp)
            DzFrameSetAlpha(frame.current, temp.a)
            DzFrameSetPoint(
                frame.current,
                FRAMEPOINT_BOTTOMLEFT,
                DzFrameGetParent(frame.current),
                FRAMEPOINT_BOTTOMLEFT,
                temp.x,
                temp.y
            )
            DzFrameSetSize(frame.current, temp.w, temp.h)
        end)
        tween1:chain(tween2)
    end
    DzFrameClearAllPoints(frame.current)
    tween1:start()
end
return ____exports
