local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["13"] = 11,["14"] = 12,["15"] = 15,["16"] = 16,["17"] = 21,["18"] = 15,["19"] = 24,["20"] = 25,["21"] = 26,["22"] = 27,["23"] = 27,["25"] = 15,["26"] = 30,["27"] = 31,["28"] = 34,["29"] = 34,["30"] = 35,["33"] = 39,["36"] = 37,["44"] = 45,["45"] = 45,["46"] = 46,["49"] = 50,["52"] = 48,["60"] = 15,["61"] = 15,["62"] = 58,["63"] = 59,["66"] = 60,["67"] = 61,["68"] = 61,["69"] = 61,["70"] = 61,["71"] = 61,["72"] = 62,["73"] = 63,["74"] = 61,["75"] = 61,["76"] = 15,["77"] = 15});
local ____exports = {}
local ____basic_pragma = require("solar.solar-common.w3ts.tsx.basic_pragma.index")
local flushUpdates = ____basic_pragma.flushUpdates
local ____AdapterUtil = require("solar.solar-common.w3ts.tsx.AdapterUtil")
local AdapterUtil = ____AdapterUtil.default
local tooltipMap = ____AdapterUtil.tooltipMap
local ____CreateFrameUtil = require("solar.solar-common.w3ts.tsx.CreateFrameUtil")
local CreateFrameUtil = ____CreateFrameUtil.default
--- Sets the UI scale for pixel measurements. Defaults to 1600.
local updateScheduled = false
local schedulingTimer = CreateTimer()
____exports.adapter = {
    createFrame = function(____, jsxType, parentFrame, props)
        return CreateFrameUtil.createFrame(jsxType, parentFrame, props)
    end,
    cleanupFrame = function(____, frame)
        DzDestroyFrame(frame)
        local existingTooltip = tooltipMap["FT_" .. tostring(frame)]
        if existingTooltip then
            ____exports.adapter:cleanupFrame(existingTooltip)
        end
    end,
    updateFrameProperties = function(____, frame, prevProps, nextProps)
        local prop
        for ____value in pairs(prevProps) do
            prop = ____value
            if not (nextProps[prop] ~= nil) then
                do
                    local function ____catch(err)
                        print(err)
                    end
                    local ____try, ____hasReturned = pcall(function()
                        AdapterUtil.setProp(frame, prop)
                    end)
                    if not ____try then
                        ____catch(____hasReturned)
                    end
                end
            end
        end
        for ____value in pairs(nextProps) do
            prop = ____value
            if nextProps[prop] ~= prevProps[prop] then
                do
                    local function ____catch(err)
                        print(err)
                    end
                    local ____try, ____hasReturned = pcall(function()
                        AdapterUtil.setProp(frame, prop, nextProps[prop], prevProps[prop])
                    end)
                    if not ____try then
                        ____catch(____hasReturned)
                    end
                end
            end
        end
    end,
    getParent = function(____, frame) return DzFrameGetParent(frame) end,
    scheduleUpdate = function()
        if updateScheduled then
            return
        end
        updateScheduled = true
        TimerStart(
            schedulingTimer,
            0,
            false,
            function()
                updateScheduled = false
                flushUpdates()
            end
        )
    end
}
return ____exports
