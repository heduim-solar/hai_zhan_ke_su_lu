local ____lualib = require("lualib_bundle")
local WeakMap = ____lualib.WeakMap
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 7,["14"] = 9,["15"] = 10,["16"] = 12,["17"] = 13,["18"] = 15,["19"] = 15,["21"] = 9,["22"] = 18,["23"] = 19,["24"] = 21,["25"] = 23,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 24,["31"] = 18});
local ____exports = {}
local ____reconciler = require("solar.solar-common.w3ts.tsx.basic_pragma.reconciler")
local hooks = ____reconciler.hooks
local ____context = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.context")
local hookContext = ____context.hookContext
local hookMap = ____context.hookMap
local oldBeforeRender = hooks.beforeRender
local oldBeforeUnmount = hooks.beforeUnmount
hooks.beforeRender = function(instance)
    oldBeforeRender(instance)
    hookContext.currentInstance = instance
    hookContext.currentIndex = 0
    if not hookMap:has(instance) then
        hookMap:set(instance, {})
    end
end
hooks.beforeUnmount = function(instance)
    oldBeforeUnmount(instance)
    local hooks = hookMap:get(instance)
    if hooks then
        __TS__ArrayForEach(
            hooks,
            function(____, hook) return hook.type == "effect" and hook.cleanup and hook.cleanup() end
        )
    end
end
return ____exports
