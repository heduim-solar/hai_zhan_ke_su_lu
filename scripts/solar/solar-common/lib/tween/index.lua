local ____lualib = require("lualib_bundle")
local __TS__FunctionBind = ____lualib.__TS__FunctionBind
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 10,["7"] = 10,["8"] = 11,["9"] = 11,["10"] = 12,["11"] = 12,["12"] = 13,["13"] = 13,["14"] = 14,["15"] = 14,["16"] = 15,["17"] = 15,["18"] = 16,["19"] = 16,["20"] = 18,["25"] = 26,["26"] = 32,["27"] = 33,["28"] = 34,["29"] = 35,["30"] = 36,["31"] = 39,["32"] = 40,["33"] = 40,["34"] = 40,["35"] = 40,["36"] = 40,["37"] = 40,["38"] = 40,["39"] = 40,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 42,["46"] = 42,["47"] = 42,["48"] = 42,["49"] = 42,["50"] = 42,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 58});
local ____exports = {}
local ____Easing = require("solar.solar-common.lib.tween.Easing")
local Easing = ____Easing.default
local ____Group = require("solar.solar-common.lib.tween.Group")
local Group = ____Group.default
local ____Interpolation = require("solar.solar-common.lib.tween.Interpolation")
local Interpolation = ____Interpolation.default
local ____Now = require("solar.solar-common.lib.tween.Now")
local now = ____Now.default
local ____Sequence = require("solar.solar-common.lib.tween.Sequence")
local Sequence = ____Sequence.default
local ____Tween = require("solar.solar-common.lib.tween.Tween")
local Tween = ____Tween.default
local ____mainGroup = require("solar.solar-common.lib.tween.mainGroup")
local mainGroup = ____mainGroup.mainGroup
local nextId = Sequence.nextId
--- Controlling groups of tweens
-- 
-- Using the TWEEN singleton to manage your tweens can cause issues in large apps with many components.
-- In these cases, you may want to create your own smaller groups of tweens.
local TWEEN = mainGroup
local getAll = __TS__FunctionBind(TWEEN.getAll, TWEEN)
local removeAll = __TS__FunctionBind(TWEEN.removeAll, TWEEN)
local add = __TS__FunctionBind(TWEEN.add, TWEEN)
local remove = __TS__FunctionBind(TWEEN.remove, TWEEN)
local update = __TS__FunctionBind(TWEEN.update, TWEEN)
local VERSION = "18.6.4"
____exports.Easing = Easing
____exports.Group = Group
____exports.Interpolation = Interpolation
____exports.now = now
____exports.Sequence = Sequence
____exports.nextId = nextId
____exports.Tween = Tween
____exports.VERSION = VERSION
____exports.getAll = getAll
____exports.removeAll = removeAll
____exports.add = add
____exports.remove = remove
____exports.update = update
local exports = {
    Easing = Easing,
    Group = Group,
    Interpolation = Interpolation,
    now = now,
    Sequence = Sequence,
    nextId = nextId,
    Tween = Tween,
    VERSION = "18.6.4",
    getAll = getAll,
    removeAll = removeAll,
    add = add,
    remove = remove,
    update = update
}
____exports.default = exports
return ____exports
