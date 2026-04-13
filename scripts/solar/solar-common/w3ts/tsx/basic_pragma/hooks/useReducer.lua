local ____lualib = require("lualib_bundle")
local WeakMap = ____lualib.WeakMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 7,["11"] = 11,["12"] = 11,["13"] = 11,["14"] = 11,["15"] = 12,["16"] = 13,["17"] = 13,["18"] = 14,["19"] = 14,["20"] = 13,["22"] = 13,["23"] = 16,["25"] = 17,["29"] = 19,["30"] = 21,["31"] = 22,["32"] = 22,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 27,["37"] = 28,["39"] = 22,["40"] = 22,["41"] = 33,["43"] = 36,["44"] = 7});
local ____exports = {}
local ____context = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.context")
local hookContext = ____context.hookContext
local hookMap = ____context.hookMap
require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.reconcilerHooks")
____exports.useReducer = function(reducer, initialState)
    local ____hookContext_0, ____currentIndex_1 = hookContext, "currentIndex"
    local ____hookContext_currentIndex_2 = ____hookContext_0[____currentIndex_1]
    ____hookContext_0[____currentIndex_1] = ____hookContext_currentIndex_2 + 1
    local index = ____hookContext_currentIndex_2
    local hooks = hookMap:get(hookContext.currentInstance)
    local ____hooks_index_4 = hooks[index + 1]
    if ____hooks_index_4 == nil then
        local ____temp_3 = {type = "reducer"}
        hooks[index + 1] = ____temp_3
        ____hooks_index_4 = ____temp_3
    end
    local state = ____hooks_index_4
    if state.type ~= "reducer" then
        error(
            (("Expected a reducer hook at index " .. tostring(index)) .. ", got ") .. state.type,
            0
        )
    end
    state.reducer = reducer
    if not state.instance then
        state.value = {
            initialState,
            function(action)
                local nextValue = state.reducer(state.value[1], action)
                if state.value[1] ~= nextValue then
                    state.value = {nextValue, state.value[2]}
                    state.instance:setState({})
                end
            end
        }
        state.instance = hookContext.currentInstance
    end
    return state.value
end
return ____exports
