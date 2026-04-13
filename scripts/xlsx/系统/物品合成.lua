local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 21,["8"] = 21,["9"] = 21,["10"] = 21,["11"] = 21,["12"] = 21,["13"] = 21,["14"] = 21,["15"] = 21,["16"] = 21,["17"] = 63,["18"] = 67,["19"] = 68,["20"] = 69,["21"] = 70,["22"] = 71,["23"] = 72,["24"] = 73,["25"] = 74,["26"] = 75});
local ____exports = {}
local ____SolarNewItemsFormulaState = require("state.common.SolarNewItemsFormulaState")
local SolarNewItemsFormulaState = ____SolarNewItemsFormulaState.default
____exports.data = {
    {id = "船身Lv10", NewItemsFormulaState_materials = "船身Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.船身Lv10 = {material:{\"船身Lv9\":2}}"},
    {id = "甲板Lv10", NewItemsFormulaState_materials = "甲板Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.甲板Lv10 = {material:{\"甲板Lv9\":2}}"},
    {id = "马达Lv10", NewItemsFormulaState_materials = "马达Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.马达Lv10 = {material:{\"马达Lv9\":2}}"},
    {id = "炮弹Lv10", NewItemsFormulaState_materials = "炮弹Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.炮弹Lv10 = {material:{\"炮弹Lv9\":2}}"},
    {id = "船头Lv10", NewItemsFormulaState_materials = "船头Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.船头Lv10 = {material:{\"船头Lv9\":2}}"},
    {id = "船帆Lv10", NewItemsFormulaState_materials = "船帆Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.船帆Lv10 = {material:{\"船帆Lv9\":2}}"},
    {id = "桅杆Lv10", NewItemsFormulaState_materials = "桅杆Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.桅杆Lv10 = {material:{\"桅杆Lv9\":2}}"},
    {id = "修理工Lv10", NewItemsFormulaState_materials = "修理工Lv9:2", ["#<%1%>#"] = "SolarNewItemsFormulaState.config.修理工Lv10 = {material:{\"修理工Lv9\":2}}"}
}
____exports["d_物品合成"] = ____exports.data
function ____exports.default(self)
    SolarNewItemsFormulaState.config["船身Lv10"] = {material = {["船身Lv9"] = 2}}
    SolarNewItemsFormulaState.config["甲板Lv10"] = {material = {["甲板Lv9"] = 2}}
    SolarNewItemsFormulaState.config["马达Lv10"] = {material = {["马达Lv9"] = 2}}
    SolarNewItemsFormulaState.config["炮弹Lv10"] = {material = {["炮弹Lv9"] = 2}}
    SolarNewItemsFormulaState.config["船头Lv10"] = {material = {["船头Lv9"] = 2}}
    SolarNewItemsFormulaState.config["船帆Lv10"] = {material = {["船帆Lv9"] = 2}}
    SolarNewItemsFormulaState.config["桅杆Lv10"] = {material = {["桅杆Lv9"] = 2}}
    SolarNewItemsFormulaState.config["修理工Lv10"] = {material = {["修理工Lv9"] = 2}}
end
return ____exports
