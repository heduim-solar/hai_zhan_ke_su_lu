local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 40,["8"] = 41,["9"] = 41,["10"] = 41,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 41,["15"] = 41,["16"] = 41,["17"] = 41,["18"] = 41,["19"] = 41,["20"] = 41,["21"] = 41,["22"] = 41,["23"] = 41,["24"] = 40,["25"] = 60,["26"] = 64,["27"] = 66,["28"] = 67,["29"] = 68});
local ____exports = {}
local _____82F1_96C4_5C5E_6027_4E66 = require("state.物品.英雄属性书")
local _____82F1_96C4_5C5E_6027_4E66 = _____82F1_96C4_5C5E_6027_4E66.default
____exports.data = {{
    id = "a3nx",
    _parent = "manh",
    Name = "|cffEEE8AA知识之书+1000",
    type = "FULLP",
    val = 1000,
    HP = 100,
    goldcost = 100000,
    lumbercost = 0,
    Art = "ReplaceableTextures\\CommandButtons\\BTNTomeRed.blp",
    abilList = " ",
    Level = 8,
    stockMax = 99,
    stockRegen = 1,
    Ubertip = "|cffEEE8AA知识之书+1000",
    Description = "|cffEEE8AA知识之书+1000",
    Tip = "|cffEEE8AA知识之书+1000"
}}
____exports["d_属性书"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            _____82F1_96C4_5C5E_6027_4E66.config[datum.id] = {type = datum.type, val = datum.val}
        end
    end
end
return ____exports
