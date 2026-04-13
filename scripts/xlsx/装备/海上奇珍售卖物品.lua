local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 97,["10"] = 98,["11"] = 98,["12"] = 98,["13"] = 98,["14"] = 98,["15"] = 98,["16"] = 98,["17"] = 98,["18"] = 98,["19"] = 98,["20"] = 98,["21"] = 98,["22"] = 97,["23"] = 113,["24"] = 117,["25"] = 119,["26"] = 120,["27"] = 121,["30"] = 125,["31"] = 126,["32"] = 127});
local ____exports = {}
local ____GradeUtil = require("solar.solar-common.util.other.GradeUtil")
local GradeUtil = ____GradeUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.data = {{
    id = "a3zx",
    _parent = "azhr",
    Name = "胶胶果实",
    type = "副炮",
    Art = "物品图标\\胶胶果实.blp",
    Ubertip = "死亡后5秒复活，复活后拥有3秒无敌。可堆叠10个",
    goldcost = 1400,
    Description = "死亡后5秒复活，复活后拥有3秒无敌。可堆叠10个",
    Tip = "胶胶果实",
    pawnable = 1,
    stockMax = 1,
    stockRegen = 0
}}
____exports["d_海上奇珍售卖物品"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id and datum.grade then
            GradeUtil:setItemTypeGrade(datum.id, datum.grade)
        end
    end
    for ____, datum in ipairs(____exports.data) do
        if datum and datum.id then
            AttributeUtil:setItemTypeAttribute(datum.id, datum)
        end
    end
end
return ____exports
