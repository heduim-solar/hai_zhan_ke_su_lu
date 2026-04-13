local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 6,["9"] = 6,["10"] = 6,["12"] = 6,["13"] = 9,["14"] = 10,["15"] = 11,["16"] = 11,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 9,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 19,["29"] = 27,["30"] = 28,["31"] = 30,["33"] = 31,["34"] = 31,["35"] = 32,["36"] = 33,["39"] = 31,["42"] = 37,["43"] = 38,["45"] = 40,["46"] = 27,["47"] = 44,["48"] = 44,["49"] = 44,["51"] = 45,["52"] = 46,["54"] = 47,["55"] = 47,["56"] = 48,["57"] = 49,["60"] = 47,["63"] = 53,["64"] = 54,["66"] = 56,["67"] = 57,["69"] = 59,["71"] = 60,["72"] = 60,["73"] = 61,["74"] = 62,["77"] = 60,["80"] = 66,["81"] = 67,["83"] = 69,["84"] = 44});
local ____exports = {}
____exports.default = __TS__Class()
local FileUtil = ____exports.default
FileUtil.name = "FileUtil"
function FileUtil.prototype.____constructor(self)
end
function FileUtil.getDataFromFile(self, filePath)
    local file = io.open(filePath, "r+")
    if not file then
        return nil
    end
    local jsonDataStr = file:read("*a")
    local data = JSON:parse(jsonDataStr)
    file:close()
    return data
end
function FileUtil.writeToFile(self, data, filePath)
    local jsonDataStr = JSON:stringify(data)
    local file = io.open(filePath, "w+")
    file:write(jsonDataStr)
    file:close()
end
function FileUtil.getFileExtension(self, filePath)
    local fileExtension = ""
    local index = -1
    do
        local i = #filePath - 1
        while i >= 0 do
            if "." == __TS__StringAccess(filePath, i) then
                index = i
                break
            end
            i = i - 1
        end
    end
    if -1 ~= index then
        fileExtension = __TS__StringSubstring(filePath, index)
    end
    return fileExtension
end
function FileUtil.getFilename(self, filePath, containExtension)
    if containExtension == nil then
        containExtension = true
    end
    local filename = ""
    local index = -1
    do
        local i = #filePath - 1
        while i >= 0 do
            if "\\" == __TS__StringAccess(filePath, i) then
                index = i
                break
            end
            i = i - 1
        end
    end
    if -1 ~= index then
        filename = __TS__StringSubstring(filePath, index + 1)
    end
    if containExtension then
        return filename
    end
    index = -1
    do
        local i = #filename - 1
        while i >= 0 do
            if "." == __TS__StringAccess(filename, i) then
                index = i
                break
            end
            i = i - 1
        end
    end
    if -1 ~= index then
        filename = __TS__StringSubstring(filename, 0, index)
    end
    return filename
end
return ____exports
