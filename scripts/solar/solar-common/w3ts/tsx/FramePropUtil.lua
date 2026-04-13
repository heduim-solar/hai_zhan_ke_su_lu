local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 6,["14"] = 7,["15"] = 7,["16"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 10,["26"] = 12,["27"] = 13,["29"] = 15,["30"] = 16,["31"] = 18,["32"] = 19,["33"] = 20,["35"] = 21,["36"] = 22,["38"] = 23,["39"] = 24,["42"] = 26,["44"] = 27,["45"] = 28,["48"] = 30,["50"] = 31,["51"] = 32,["54"] = 34,["56"] = 35,["57"] = 36,["60"] = 38,["62"] = 39,["63"] = 40,["66"] = 42,["68"] = 43,["69"] = 44,["72"] = 46,["74"] = 47,["75"] = 48,["78"] = 50,["80"] = 51,["81"] = 52,["84"] = 54,["86"] = 55,["87"] = 56,["91"] = 60,["92"] = 60,["93"] = 60,["94"] = 60,["95"] = 60,["96"] = 60,["97"] = 60,["98"] = 60,["99"] = 8,["100"] = 8,["101"] = 8,["102"] = 62,["103"] = 62,["104"] = 62,["105"] = 62,["106"] = 63,["107"] = 62,["108"] = 62,["109"] = 62,["110"] = 6});
local ____exports = {}
local ____FrameDefault = require("solar.solar-common.w3ts.tsx.FrameDefault")
local frameDefaults = ____FrameDefault.frameDefaults
____exports.default = __TS__Class()
local FramePropUtil = ____exports.default
FramePropUtil.name = "FramePropUtil"
function FramePropUtil.prototype.____constructor(self)
end
function FramePropUtil.setProp_frametip(self, frame, prop, value)
    local ____value_0 = value
    if ____value_0 == nil then
        ____value_0 = frameDefaults[prop]
    end
    local val = ____value_0
    DzFrameSetScriptByCode(
        frame,
        2,
        function()
            if not val.pos then
                val.pos = 7
            end
            if val.onTip then
                val:onTip(val.frametipRef.current, frame)
            end
            DzFrameShow(val.frametipRef.current, true)
            DzFrameClearAllPoints(val.frametipRef.current)
            local gap = 0.01
            local x = 0
            local y = 0
            repeat
                local ____switch7 = val.pos
                local ____cond7 = ____switch7 == 0
                if ____cond7 then
                    x = -gap
                    y = gap
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 1
                if ____cond7 then
                    x = 0
                    y = gap
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 2
                if ____cond7 then
                    x = gap
                    y = gap
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 3
                if ____cond7 then
                    x = -gap
                    y = 0
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 4
                if ____cond7 then
                    x = 0
                    y = 0
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 5
                if ____cond7 then
                    x = gap
                    y = 0
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 6
                if ____cond7 then
                    x = -gap
                    y = -gap
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 7
                if ____cond7 then
                    x = 0
                    y = -gap
                    break
                end
                ____cond7 = ____cond7 or ____switch7 == 8
                if ____cond7 then
                    x = gap
                    y = -gap
                    break
                end
            until true
            DzFrameSetPoint(
                val.frametipRef.current,
                8 - val.pos,
                frame,
                val.pos,
                x,
                y
            )
        end,
        false
    )
    DzFrameSetScriptByCode(
        frame,
        3,
        function()
            DzFrameShow(val.frametipRef.current, false)
        end,
        false
    )
end
return ____exports
