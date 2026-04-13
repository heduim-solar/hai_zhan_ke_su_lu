local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 43,["6"] = 44,["7"] = 44,["8"] = 44,["9"] = 44,["10"] = 44,["11"] = 44,["12"] = 44,["13"] = 44,["14"] = 44,["15"] = 44,["16"] = 44,["17"] = 44,["18"] = 44,["19"] = 44,["20"] = 44,["21"] = 44,["22"] = 44,["23"] = 43,["24"] = 79,["25"] = 83});
local ____exports = {}
____exports.data = {{
    id = "a45d",
    _parent = "AHmt",
    Name = "传送(F)",
    race = " ",
    Hotkey = "F",
    DataA = {[1] = "1", [2] = "1"},
    DataB = {[1] = "0.0", [2] = "0.0"},
    hero = 0,
    Cost = {[1] = "0", [2] = "0"},
    Cool = {[1] = "15.0", [2] = "8.0"},
    Buttonpos_1 = 2,
    Buttonpos_2 = 1,
    Ubertip = "传送到一个友军单位或者建筑物旁边。",
    targs = {[1] = "friend,ground,structure,invulnerable,allies", [2] = "friend,ground,structure,invulnerable,allies"},
    levels = 2,
    Researchubertip = "传送到一个友军单位或者建筑物旁边。",
    Tip = "传送(F)"
}}
____exports["d_传送"] = ____exports.data
function ____exports.default(self)
end
return ____exports
