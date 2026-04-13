local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 5,["10"] = 5,["11"] = 9,["12"] = 11,["14"] = 12,["15"] = 12,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 14,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 15,["30"] = 15,["31"] = 15,["32"] = 16,["33"] = 16,["34"] = 16,["35"] = 16,["36"] = 16,["37"] = 16,["38"] = 16,["39"] = 16,["40"] = 17,["41"] = 17,["42"] = 12,["45"] = 9,["46"] = 26,["47"] = 26,["48"] = 26,["50"] = 27,["51"] = 28,["52"] = 29,["53"] = 30,["55"] = 32,["56"] = 33,["58"] = 35,["59"] = 26,["60"] = 43,["61"] = 43,["62"] = 43,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 44,["68"] = 43,["69"] = 7});
local ____exports = {}
____exports.default = __TS__Class()
local FrameLayerUtil = ____exports.default
FrameLayerUtil.name = "FrameLayerUtil"
function FrameLayerUtil.prototype.____constructor(self)
end
function FrameLayerUtil._sl_init(self)
    ____exports.default.father_UI_array = {}
    do
        local i = 0
        while i < 10 do
            local temp_ui = DzCreateFrameByTagName(
                "BACKDROP",
                "_sl_FrameLayerUtil" .. tostring(i),
                DzGetGameUI(),
                "",
                0
            )
            DzFrameSetTexture(temp_ui, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", 0)
            DzFrameSetPoint(
                temp_ui,
                0,
                DzGetGameUI(),
                0,
                0,
                0
            )
            DzFrameSetPoint(
                temp_ui,
                8,
                DzGetGameUI(),
                8,
                0,
                0
            )
            local ____exports_default_father_UI_array_0 = ____exports.default.father_UI_array
            ____exports_default_father_UI_array_0[#____exports_default_father_UI_array_0 + 1] = temp_ui
            i = i + 1
        end
    end
end
function FrameLayerUtil.getLayerParentUI(self, layer)
    if layer == nil then
        layer = 0
    end
    if layer < 0 then
        layer = 0
    elseif layer > 9 then
        layer = 9
    end
    if ____exports.default.father_UI_array == nil then
        ____exports.default:_sl_init()
    end
    return ____exports.default.father_UI_array[layer + 1]
end
function FrameLayerUtil.setLayerParent(self, frame, layer)
    if layer == nil then
        layer = 0
    end
    DzFrameSetParent(
        frame,
        ____exports.default:getLayerParentUI(layer)
    )
end
FrameLayerUtil.father_UI_array = nil
return ____exports
