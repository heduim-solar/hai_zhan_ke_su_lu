local ____lualib = require("lualib_bundle")
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 43,["12"] = 49,["13"] = 51,["14"] = 51,["15"] = 64,["16"] = 65,["17"] = 66,["18"] = 67,["20"] = 69,["22"] = 51,["23"] = 80,["24"] = 81,["25"] = 82,["26"] = 83,["27"] = 84,["28"] = 84,["29"] = 84,["30"] = 84,["31"] = 84,["33"] = 86,["36"] = 51,["37"] = 101,["38"] = 102,["39"] = 103,["40"] = 104,["41"] = 104,["42"] = 106,["43"] = 107,["44"] = 104,["45"] = 104,["47"] = 111,["48"] = 112,["49"] = 113,["50"] = 113,["51"] = 115,["52"] = 116,["53"] = 113,["54"] = 113,["56"] = 51,["57"] = 51});
local ____exports = {}
function ____exports.default(all)
    all = all or __TS__New(Map)
    return {
        all = all,
        on = function(self, ____type, handler)
            local handlers = all:get(____type)
            if handlers then
                handlers[#handlers + 1] = handler
            else
                all:set(____type, {handler})
            end
        end,
        off = function(self, ____type, handler)
            local handlers = all:get(____type)
            if handlers then
                if handler and __TS__ArrayIndexOf(handlers, handler) >= 0 then
                    __TS__ArraySplice(
                        handlers,
                        __TS__ArrayIndexOf(handlers, handler),
                        1
                    )
                else
                    all:set(____type, {})
                end
            end
        end,
        emit = function(self, ____type, evt)
            local handlers = all:get(____type)
            if handlers then
                __TS__ArrayMap(
                    __TS__ArraySlice(handlers),
                    function(____, handler)
                        handler(evt)
                    end
                )
            end
            handlers = all:get("*")
            if handlers then
                __TS__ArrayMap(
                    __TS__ArraySlice(handlers),
                    function(____, handler)
                        handler(____type, evt)
                    end
                )
            end
        end
    }
end
return ____exports
