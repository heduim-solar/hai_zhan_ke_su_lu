local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 3,["10"] = 3,["11"] = 44,["12"] = 45,["13"] = 44,["14"] = 54,["15"] = 55,["16"] = 54,["17"] = 59,["18"] = 60,["19"] = 61,["21"] = 64,["22"] = 65,["24"] = 68,["25"] = 69,["27"] = 72,["28"] = 73,["30"] = 76,["31"] = 77,["33"] = 80,["34"] = 81,["36"] = 84,["37"] = 59,["38"] = 87,["39"] = 89,["40"] = 90,["42"] = 93,["43"] = 94,["45"] = 97,["46"] = 98,["48"] = 101,["49"] = 102,["51"] = 105,["52"] = 106,["54"] = 109,["55"] = 110,["57"] = 113,["58"] = 87,["59"] = 7,["60"] = 7,["61"] = 7,["62"] = 7,["63"] = 7,["64"] = 7,["65"] = 7,["66"] = 7,["67"] = 7,["68"] = 7,["69"] = 7,["70"] = 7,["71"] = 7,["72"] = 7,["73"] = 7,["74"] = 7,["75"] = 7,["76"] = 7,["77"] = 7,["78"] = 7,["79"] = 7,["80"] = 7,["81"] = 7,["82"] = 7,["83"] = 7,["84"] = 7,["85"] = 7,["86"] = 7,["87"] = 7,["88"] = 7,["89"] = 7,["90"] = 7,["91"] = 7,["92"] = 7,["93"] = 7});
local ____exports = {}
____exports.default = __TS__Class()
local ColorUtil = ____exports.default
ColorUtil.name = "ColorUtil"
function ColorUtil.prototype.____constructor(self)
end
function ColorUtil.getColor(self, g)
    return ____exports.default.config[g]
end
function ColorUtil.getColorIntByRGB(self, r, g, b)
    return 255 * 16777216 + r * 65536 + g * 256 + b
end
function ColorUtil.getTextColor(self, key)
    if not key or key == "" then
        return "|CFFFFFFFF"
    end
    if key == "C" then
        return "|cff66ff00"
    end
    if key == "B" then
        return "|cff0042ff"
    end
    if key == "A" then
        return "|cffbe00fe"
    end
    if key == "S" then
        return "|cffff0303"
    end
    if key == "SS" then
        return "|cfffe8a0e"
    end
    return "|CFFFFFFFF"
end
function ColorUtil.getTextColorByNumber(self, key)
    if not key or key == 0 then
        return "|CFFFFFFFF"
    end
    if key <= 10 then
        return "|CFF0042FF"
    end
    if key <= 20 then
        return "|CFFBE00FE"
    end
    if key <= 30 then
        return "|CFFFF0303"
    end
    if key <= 40 then
        return "|CFFFE8A0E"
    end
    if key <= 50 then
        return "|CFF000000"
    end
    return "|CFFFFFFFF"
end
ColorUtil.config = {
    red = "|cffff0303",
    blue = "|cff0042ff",
    teal = "|cff1ce6b9",
    purple = "|cff540081",
    yellow = "|cfffffc00",
    orange = "|cfffe8a0e",
    green = "|cff20c000",
    pink = "|cffe55bb0",
    gray = "|cff959697",
    lightblue = "|cff7ebff1",
    darkgreen = "|cff106246",
    brown = "|cff4a2a04",
    maroon = "|cff9b0000",
    navy = "|cff0000c3",
    turquoise = "|cff00eaff",
    violet = "|cffbe00fe",
    wheat = "|cffebcd87",
    peach = "|cfff8a48b",
    mint = "|cffbfff80",
    lavender = "|cffdcb9eb",
    coal = "|cff282828",
    snow = "|cffebf0ff",
    emerald = "|cff00781e",
    peanut = "|cffa46f33",
    sheepblue = "|CFF3F81F8",
    wolfred = "|CFFC00040",
    gold = "|CFFD9D919",
    string = "|cffce915b",
    number = "|cffdcdc8b",
    boolean = "|cff569cd6",
    white = "|cffffffff",
    handle = "|cff7ebff1",
    black = "|CFF000000"
}
return ____exports
