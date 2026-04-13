local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 5,["12"] = 6,["15"] = 9,["16"] = 11,["17"] = 12,["19"] = 14,["20"] = 15,["22"] = 17,["23"] = 18,["25"] = 20,["26"] = 21,["28"] = 23,["29"] = 24,["31"] = 26,["32"] = 27,["34"] = 29,["35"] = 30,["37"] = 32,["38"] = 33,["40"] = 35,["41"] = 36,["43"] = 38,["44"] = 39,["46"] = 41,["47"] = 42,["49"] = 5,["50"] = 3});
local ____exports = {}
____exports.default = __TS__Class()
local KKImplementEmbedJapi = ____exports.default
KKImplementEmbedJapi.name = "KKImplementEmbedJapi"
function KKImplementEmbedJapi.prototype.____constructor(self)
end
function KKImplementEmbedJapi.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    if GetStoreTarget == nil then
        _G.GetStoreTarget = DzGetActivePatron
    end
    if GetItemAbility == nil then
        _G.GetItemAbility = DzGetItemAbility
    end
    if GetFps == nil then
        _G.GetFps = DzGetFPS
    end
    if ShowFpsText == nil then
        _G.ShowFpsText = DzToggleFPS
    end
    if SetUnitMoveType == nil then
        _G.SetUnitMoveType = DzSetUnitMoveType
    end
    if SetUnitName == nil then
        _G.SetUnitName = DzSetUnitName
    end
    if SetUnitProperName == nil then
        _G.SetUnitProperName = DzSetUnitProperName
    end
    if SetUnitMissileModel == nil then
        _G.SetUnitMissileModel = DzSetUnitMissileModel
    end
    if SetUnitPortrait == nil then
        _G.SetUnitPortrait = DzSetUnitPortrait
    end
    if SetUnitPressUIVisible == nil then
        _G.SetUnitPressUIVisible = DzSetUnitPreselectUIVisible
    end
    if FrameSetViewPort == nil then
        _G.FrameSetViewPort = DzFrameSetClip
    end
end
KKImplementEmbedJapi.is_init = false
return ____exports
