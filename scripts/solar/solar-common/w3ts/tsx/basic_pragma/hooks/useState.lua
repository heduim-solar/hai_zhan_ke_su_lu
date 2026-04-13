local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 5,["8"] = 8,["9"] = 9,["10"] = 9,["12"] = 10,["13"] = 8,["14"] = 8,["15"] = 5,["16"] = 13,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 15,["25"] = 18,["26"] = 13});
local ____exports = {}
local ____useReducer = require("solar.solar-common.w3ts.tsx.basic_pragma.hooks.useReducer")
local useReducer = ____useReducer.useReducer
____exports.useState = function(initialState) return useReducer(
    function(oldState, v)
        if type(v) ~= "function" then
            return v
        end
        return v(oldState)
    end,
    initialState
) end
____exports.useForceUpdate = function()
    local ____, setTick = table.unpack(
        ____exports.useState(0),
        1,
        2
    )
    local function update()
        setTick(function(tick) return tick + 1 end)
    end
    return update
end
return ____exports
