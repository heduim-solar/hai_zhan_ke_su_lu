local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 12,["14"] = 13,["15"] = 12,["16"] = 21,["17"] = 22,["18"] = 23,["20"] = 25,["21"] = 26,["22"] = 27,["23"] = 28,["26"] = 31,["27"] = 21,["28"] = 38,["29"] = 39,["30"] = 40,["32"] = 42,["33"] = 43,["34"] = 44,["35"] = 45,["36"] = 46,["38"] = 48,["39"] = 49,["40"] = 50,["41"] = 51,["42"] = 52,["44"] = 54,["45"] = 55,["46"] = 38,["47"] = 66,["48"] = 66,["49"] = 66,["51"] = 66,["52"] = 66,["54"] = 66,["55"] = 66,["57"] = 67,["58"] = 68,["59"] = 69,["60"] = 70,["61"] = 70,["62"] = 71,["63"] = 72,["64"] = 73,["65"] = 74,["66"] = 75,["67"] = 76,["69"] = 78,["70"] = 79,["72"] = 81,["75"] = 84,["76"] = 85,["78"] = 87,["79"] = 88,["80"] = 89,["82"] = 90,["83"] = 90,["84"] = 91,["85"] = 90,["88"] = 93,["89"] = 94,["90"] = 70,["91"] = 70,["92"] = 70,["93"] = 66});
local ____exports = {}
____exports.default = __TS__Class()
local DebugVmUtil = ____exports.default
DebugVmUtil.name = "DebugVmUtil"
function DebugVmUtil.prototype.____constructor(self)
end
function DebugVmUtil.sethook(self, hook, mask)
    debug.sethook(hook, mask, 0)
end
function DebugVmUtil.getTsLine(self, functionInfo)
    if functionInfo.short_src == nil then
        return functionInfo.linedefined
    end
    local tsLine = tostring(functionInfo.linedefined or 0)
    if _G.__TS__sourcemap then
        if _G.__TS__sourcemap[functionInfo.short_src] then
            tsLine = tostring(_G.__TS__sourcemap[functionInfo.short_src][tsLine] or tsLine)
        end
    end
    return tsLine
end
function DebugVmUtil.getTsSrcLineName(self, functionInfo)
    if not functionInfo then
        return ""
    end
    local src = functionInfo.source
    if not src then
        src = "<C>"
    elseif __TS__StringSubstring(src, #src - 4, #src) == ".lua" then
        src = __TS__StringSubstring(src, 0, #src - 4)
    end
    local name = functionInfo.name
    if not name then
        name = "匿名"
    elseif __TS__StringSubstring(name, #name - 2, #name) == "_l" then
        name = __TS__StringSubstring(name, 0, #name - 2)
    end
    local title = (((src .. ":") .. tostring(____exports.default:getTsLine(functionInfo))) .. ":") .. name
    return title
end
function DebugVmUtil.hookCRAndPrintInfo(self, writeFile, printMaxCount, mask)
    if writeFile == nil then
        writeFile = true
    end
    if printMaxCount == nil then
        printMaxCount = 2
    end
    if mask == nil then
        mask = "c"
    end
    local pt = {}
    local file = io.open("_sre/temp/hookCRAndPrintInfo.txt", "wb")
    local cLines = {}
    ____exports.default:sethook(
        function(e)
            local information = debug.getinfo(2, "nS")
            local tsSrcNameLine = ____exports.default:getTsSrcLineName(information)
            local count = (pt[tsSrcNameLine] or 0) + 1
            pt[tsSrcNameLine] = count
            if printMaxCount < 0 or count < printMaxCount then
                print(tsSrcNameLine)
            end
            if time % 1000 == 0 then
                pt = {}
            end
            if not writeFile then
                return
            end
            if #cLines > 1000 then
                cLines = __TS__ArraySlice(cLines, #cLines - 20, #cLines)
            end
            cLines[#cLines + 1] = tsSrcNameLine
            file:seek("set")
            file:write("﻿")
            do
                local i = math.max(#cLines - 20, 0)
                while i < #cLines do
                    file:write(tostring(cLines[i + 1]) .. "\r\n")
                    i = i + 1
                end
            end
            file:write("\r\n####结束####\r\n")
            file:flush()
        end,
        mask
    )
end
return ____exports
