local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 10,["13"] = 10,["14"] = 10,["16"] = 11,["17"] = 15,["18"] = 10,["19"] = 19,["20"] = 20,["21"] = 20,["22"] = 20,["23"] = 21,["24"] = 20,["25"] = 20,["26"] = 19,["27"] = 25,["28"] = 26,["29"] = 25,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 29,["34"] = 34,["35"] = 35,["36"] = 35,["37"] = 35,["38"] = 35,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 34,["44"] = 39,["45"] = 39,["46"] = 39,["48"] = 39,["49"] = 39,["51"] = 40,["52"] = 42,["53"] = 43,["55"] = 51,["56"] = 52,["57"] = 53,["58"] = 53,["59"] = 53,["60"] = 54,["61"] = 53,["62"] = 53,["64"] = 56,["65"] = 56,["66"] = 57,["67"] = 58,["68"] = 60,["69"] = 61,["71"] = 56,["74"] = 65,["76"] = 68,["77"] = 39});
local ____exports = {}
local ____Now = require("solar.solar-common.lib.tween.Now")
local now = ____Now.default
____exports.default = __TS__Class()
local Group = ____exports.default
Group.name = "Group"
function Group.prototype.____constructor(self)
    self._tweens = {}
    self._tweensAddedDuringUpdate = {}
end
function Group.prototype.getAll(self)
    return __TS__ArrayMap(
        __TS__ObjectKeys(self._tweens),
        function(____, tweenId)
            return self._tweens[tweenId]
        end
    )
end
function Group.prototype.removeAll(self)
    self._tweens = {}
end
function Group.prototype.add(self, tween)
    self._tweens[tween:getId()] = tween
    self._tweensAddedDuringUpdate[tween:getId()] = tween
end
function Group.prototype.remove(self, tween)
    __TS__Delete(
        self._tweens,
        tween:getId()
    )
    __TS__Delete(
        self._tweensAddedDuringUpdate,
        tween:getId()
    )
end
function Group.prototype.update(self, time, preserve)
    if time == nil then
        time = now(nil)
    end
    if preserve == nil then
        preserve = false
    end
    local tweenIds = __TS__ObjectKeys(self._tweens)
    if #tweenIds == 0 then
        return false
    end
    while #tweenIds > 0 do
        self._tweensAddedDuringUpdate = {}
        __TS__ArraySort(
            tweenIds,
            function(____, a, b)
                return a - b
            end
        )
        do
            local i = 0
            while i < #tweenIds do
                local tween = self._tweens[tweenIds[i + 1]]
                local autoStart = not preserve
                if tween and tween:update(time, autoStart) == false and not preserve then
                    __TS__Delete(self._tweens, tweenIds[i + 1])
                end
                i = i + 1
            end
        end
        tweenIds = __TS__ObjectKeys(self._tweensAddedDuringUpdate)
    end
    return true
end
return ____exports
