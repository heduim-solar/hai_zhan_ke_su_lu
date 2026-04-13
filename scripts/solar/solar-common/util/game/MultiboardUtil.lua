local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 11,["12"] = 13,["13"] = 14,["14"] = 15,["15"] = 16,["17"] = 18,["18"] = 19,["20"] = 20,["21"] = 20,["23"] = 21,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 24,["28"] = 21,["31"] = 20,["35"] = 11,["36"] = 37,["37"] = 38,["38"] = 39,["39"] = 40,["40"] = 37,["41"] = 50,["42"] = 51,["43"] = 52,["44"] = 53,["45"] = 50,["46"] = 66,["47"] = 67,["48"] = 68,["49"] = 68,["50"] = 68,["51"] = 68,["52"] = 68,["53"] = 68,["54"] = 68,["55"] = 69,["56"] = 66});
local ____exports = {}
____exports.default = __TS__Class()
local MultiboardUtil = ____exports.default
MultiboardUtil.name = "MultiboardUtil"
function MultiboardUtil.prototype.____constructor(self)
end
function MultiboardUtil.forMultiboardItems(self, mb, callback, row, column)
    if row and column then
        local mbitem = MultiboardGetItem(mb, row, column)
        callback(nil, mbitem, row, column)
        MultiboardReleaseItem(mbitem)
    else
        local maxRows = MultiboardGetRowCount(mb)
        local maxCols = MultiboardGetColumnCount(mb)
        do
            local r = 0
            while r < maxRows do
                do
                    local c = 0
                    while c < maxCols do
                        local mbitem = MultiboardGetItem(mb, r, c)
                        callback(nil, mbitem, r, c)
                        MultiboardReleaseItem(mbitem)
                        c = c + 1
                    end
                end
                r = r + 1
            end
        end
    end
end
function MultiboardUtil.setItemWidth(self, mb, row, column, width)
    local mbitem = MultiboardGetItem(mb, row, column)
    MultiboardSetItemWidth(mbitem, width)
    MultiboardReleaseItem(mbitem)
end
function MultiboardUtil.setItemValue(self, mb, row, column, value)
    local mbitem = MultiboardGetItem(mb, row, column)
    MultiboardSetItemValue(mbitem, value)
    MultiboardReleaseItem(mbitem)
end
function MultiboardUtil.setItemColor(self, mb, row, column, red, green, blue, alpha)
    local mbitem = MultiboardGetItem(mb, row, column)
    MultiboardSetItemValueColor(
        mbitem,
        red,
        green,
        blue,
        alpha
    )
    MultiboardReleaseItem(mbitem)
end
return ____exports
