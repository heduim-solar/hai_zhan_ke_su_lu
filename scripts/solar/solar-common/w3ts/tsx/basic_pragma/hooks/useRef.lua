local ____lualib = require("lualib_bundle")
local WeakMap = ____lualib.WeakMap
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 7,["12"] = 8,["13"] = 11,["14"] = 13,["15"] = 7,["16"] = 16,["17"] = 17,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 19,["24"] = 20,["25"] = 20,["26"] = 19,["28"] = 19,["29"] = 22,["31"] = 23,["35"] = 26,["36"] = 16});
local ____exports = {}
local ____context = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.context")
local hookContext = ____context.hookContext
local hookMap = ____context.hookMap
require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.reconcilerHooks")
local function initializeRef(initial)
    local state = {type = "ref", current = initial}
    __TS__ObjectDefineProperty(state, "type", {enumerable = false, value = "ref"})
    return state
end
____exports.useRef = function(initial)
    local ____hookContext_0, ____currentIndex_1 = hookContext, "currentIndex"
    local ____hookContext_currentIndex_2 = ____hookContext_0[____currentIndex_1]
    ____hookContext_0[____currentIndex_1] = ____hookContext_currentIndex_2 + 1
    local index = ____hookContext_currentIndex_2
    local hooks = hookMap:get(hookContext.currentInstance)
    local ____hooks_index_4 = hooks[index + 1]
    if ____hooks_index_4 == nil then
        local ____initializeRef_result_3 = initializeRef(initial)
        hooks[index + 1] = ____initializeRef_result_3
        ____hooks_index_4 = ____initializeRef_result_3
    end
    local state = ____hooks_index_4
    if state.type ~= "ref" then
        error(
            (("Expected a ref hook at index " .. tostring(index)) .. ", got ") .. state.type,
            0
        )
    end
    return state
end
return ____exports
