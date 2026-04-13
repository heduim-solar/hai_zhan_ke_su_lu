local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["11"] = 10,["12"] = 10,["15"] = 12,["16"] = 12,["19"] = 14,["20"] = 16,["21"] = 18,["22"] = 20,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 24});
local ____exports = {}
local ____adapter = require("solar.solar-common.w3ts.tsx.adapter")
local adapter = ____adapter.adapter
local ____basic_pragma = require("solar.solar-common.w3ts.tsx.basic_pragma.index")
local setAdapter = ____basic_pragma.setAdapter
setAdapter(adapter)
do
    local ____AdapterUtil = require("solar.solar-common.w3ts.tsx.AdapterUtil")
    ____exports.setPixelScale = ____AdapterUtil.setPixelScale
end
do
    local ____CreateFrameUtil = require("solar.solar-common.w3ts.tsx.CreateFrameUtil")
    ____exports.data = ____CreateFrameUtil.data
end
do
    local ____basic_pragma = require("solar.solar-common.w3ts.tsx.basic_pragma.index")
    ____exports.createElement = ____basic_pragma.createElement
    ____exports.Fragment = ____basic_pragma.Fragment
    ____exports.render = ____basic_pragma.render
    ____exports.useEffect = ____basic_pragma.useEffect
    ____exports.useForceUpdate = ____basic_pragma.useForceUpdate
    ____exports.useRef = ____basic_pragma.useRef
    ____exports.useState = ____basic_pragma.useState
end
return ____exports
