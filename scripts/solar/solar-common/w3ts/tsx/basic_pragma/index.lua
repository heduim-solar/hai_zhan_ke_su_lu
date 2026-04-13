local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["10"] = 2,["11"] = 3,["12"] = 4,["15"] = 9,["16"] = 9,["17"] = 9,["20"] = 10,["21"] = 10,["24"] = 11,["25"] = 11,["26"] = 11,["29"] = 12,["30"] = 12,["33"] = 13,["34"] = 13});
local ____exports = {}
do
    local ____adapter = require("solar.solar-common.w3ts.tsx.basic_pragma.adapter")
    ____exports.setAdapter = ____adapter.setAdapter
end
do
    local ____element = require("solar.solar-common.w3ts.tsx.basic_pragma.element")
    ____exports.createElement = ____element.createElement
    ____exports.Fragment = ____element.Fragment
end
do
    local ____reconciler = require("solar.solar-common.w3ts.tsx.basic_pragma.reconciler")
    ____exports.render = ____reconciler.render
    ____exports.flushUpdates = ____reconciler.flushUpdates
end
do
    local ____useReducer = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.useReducer")
    ____exports.useReducer = ____useReducer.useReducer
end
do
    local ____useState = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.useState")
    ____exports.useState = ____useState.useState
    ____exports.useForceUpdate = ____useState.useForceUpdate
end
do
    local ____useEffect = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.useEffect")
    ____exports.useEffect = ____useEffect.useEffect
end
do
    local ____useRef = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.useRef")
    ____exports.useRef = ____useRef.useRef
end
return ____exports
