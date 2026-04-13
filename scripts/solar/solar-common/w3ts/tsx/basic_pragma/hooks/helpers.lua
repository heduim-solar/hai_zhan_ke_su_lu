local ____lualib = require("lualib_bundle")
local __TS__ArraySome = ____lualib.__TS__ArraySome
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 7,["8"] = 7,["9"] = 5});
local ____exports = {}
____exports.argsChanged = function(oldArgs, newArgs) return #oldArgs ~= #newArgs or __TS__ArraySome(
    newArgs,
    function(____, arg, index) return arg ~= oldArgs[index + 1] end
) end
return ____exports
