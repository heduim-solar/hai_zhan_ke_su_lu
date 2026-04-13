local ____lualib = require("lualib_bundle")
local WeakMap = ____lualib.WeakMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 6,["12"] = 8,["13"] = 12,["14"] = 12,["15"] = 12,["16"] = 12,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 15,["21"] = 16,["22"] = 16,["23"] = 15,["25"] = 15,["26"] = 18,["28"] = 19,["32"] = 22,["33"] = 25,["34"] = 25,["36"] = 26,["37"] = 27,["39"] = 8});
local ____exports = {}
local ____context = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.context")
local hookContext = ____context.hookContext
local hookMap = ____context.hookMap
local ____helpers = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.helpers")
local argsChanged = ____helpers.argsChanged
require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.reconcilerHooks")
____exports.useEffect = function(callback, inputs)
    local ____hookContext_0, ____currentIndex_1 = hookContext, "currentIndex"
    local ____hookContext_currentIndex_2 = ____hookContext_0[____currentIndex_1]
    ____hookContext_0[____currentIndex_1] = ____hookContext_currentIndex_2 + 1
    local index = ____hookContext_currentIndex_2
    local hooks = hookMap:get(hookContext.currentInstance)
    local oldState = hooks[index + 1]
    local ____oldState_4 = oldState
    if ____oldState_4 == nil then
        local ____temp_3 = {type = "effect"}
        hooks[index + 1] = ____temp_3
        ____oldState_4 = ____temp_3
    end
    local state = ____oldState_4
    if state.type ~= "effect" then
        error(
            (("Expected an effect hook at index " .. tostring(index)) .. ", got ") .. state.type,
            0
        )
    end
    if not oldState or state.lastInputs and inputs and argsChanged(state.lastInputs, inputs) then
        if state.cleanup then
            state.cleanup()
        end
        state.lastInputs = inputs
        state.cleanup = callback()
    end
end
return ____exports
