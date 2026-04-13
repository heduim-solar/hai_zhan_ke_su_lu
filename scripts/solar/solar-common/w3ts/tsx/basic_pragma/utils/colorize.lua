local ____lualib = require("lualib_bundle")
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 7,["9"] = 7,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 7,["18"] = 7,["19"] = 7,["20"] = 7,["21"] = 7,["22"] = 7,["23"] = 7,["24"] = 7,["25"] = 7,["26"] = 7,["27"] = 7,["28"] = 7,["29"] = 7,["30"] = 7,["31"] = 7,["32"] = 7,["33"] = 7,["34"] = 7,["35"] = 7,["36"] = 7,["37"] = 7,["38"] = 7,["39"] = 7,["40"] = 7,["41"] = 7,["42"] = 48,["43"] = 49,["44"] = 49,["45"] = 50,["46"] = 50,["47"] = 50,["48"] = 50,["49"] = 50,["50"] = 52,["51"] = 53,["52"] = 52,["53"] = 52,["54"] = 52,["55"] = 49,["56"] = 49});
local ____exports = {}
____exports.hex = {mana = 12835839, health = 65280, healthHigh = 65280}
local color = {
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
    handle = "|cff7ebff1"
}
____exports.colorize = {}
__TS__ArrayForEach(
    __TS__ObjectEntries(color),
    function(____, ____bindingPattern0)
        local code
        local color
        color = ____bindingPattern0[1]
        code = ____bindingPattern0[2]
        local function ____temp_0(____, ____string)
            return (code .. tostring(____string)) .. "|r"
        end
        ____exports.colorize[color] = ____temp_0
        return ____temp_0
    end
)
return ____exports
