local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__TypeOf = ____lualib.__TS__TypeOf
local __TS__FunctionBind = ____lualib.__TS__FunctionBind
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local __TS__ParseFloat = ____lualib.__TS__ParseFloat
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["15"] = 11,["16"] = 11,["17"] = 13,["18"] = 13,["19"] = 14,["20"] = 14,["21"] = 15,["22"] = 15,["23"] = 16,["24"] = 16,["25"] = 19,["26"] = 19,["27"] = 19,["28"] = 49,["29"] = 49,["30"] = 49,["32"] = 49,["33"] = 49,["34"] = 20,["35"] = 21,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 27,["42"] = 29,["43"] = 30,["44"] = 31,["45"] = 32,["46"] = 33,["47"] = 34,["48"] = 35,["49"] = 37,["50"] = 39,["51"] = 41,["52"] = 46,["53"] = 47,["54"] = 334,["55"] = 49,["56"] = 51,["57"] = 52,["58"] = 51,["59"] = 55,["60"] = 56,["61"] = 55,["62"] = 59,["63"] = 60,["64"] = 59,["65"] = 63,["66"] = 68,["67"] = 70,["68"] = 71,["70"] = 74,["71"] = 63,["72"] = 77,["73"] = 77,["74"] = 77,["76"] = 78,["77"] = 79,["78"] = 77,["79"] = 82,["80"] = 82,["81"] = 82,["83"] = 83,["84"] = 84,["86"] = 88,["87"] = 90,["88"] = 92,["89"] = 96,["90"] = 98,["91"] = 99,["92"] = 100,["95"] = 104,["96"] = 106,["97"] = 108,["98"] = 109,["99"] = 111,["100"] = 113,["101"] = 114,["102"] = 116,["103"] = 118,["104"] = 82,["105"] = 121,["106"] = 127,["108"] = 128,["109"] = 129,["110"] = 130,["111"] = 131,["112"] = 135,["113"] = 136,["115"] = 140,["116"] = 141,["117"] = 143,["118"] = 144,["120"] = 148,["121"] = 148,["122"] = 148,["123"] = 148,["124"] = 151,["126"] = 155,["127"] = 156,["128"] = 159,["129"] = 162,["131"] = 165,["132"] = 169,["134"] = 172,["135"] = 173,["137"] = 176,["138"] = 179,["140"] = 182,["141"] = 185,["143"] = 187,["149"] = 121,["150"] = 193,["151"] = 194,["152"] = 195,["153"] = 196,["155"] = 199,["156"] = 200,["158"] = 204,["159"] = 206,["160"] = 208,["161"] = 210,["162"] = 211,["164"] = 214,["165"] = 193,["166"] = 217,["167"] = 218,["168"] = 219,["169"] = 220,["170"] = 217,["171"] = 223,["172"] = 223,["173"] = 223,["175"] = 224,["176"] = 225,["178"] = 228,["179"] = 230,["180"] = 233,["181"] = 235,["182"] = 223,["183"] = 238,["184"] = 238,["185"] = 238,["187"] = 239,["188"] = 240,["190"] = 243,["191"] = 245,["192"] = 247,["193"] = 250,["194"] = 252,["195"] = 238,["196"] = 255,["198"] = 256,["199"] = 256,["200"] = 256,["201"] = 257,["202"] = 256,["205"] = 259,["206"] = 255,["207"] = 262,["208"] = 262,["209"] = 262,["211"] = 263,["212"] = 264,["213"] = 262,["214"] = 267,["215"] = 267,["216"] = 267,["218"] = 268,["219"] = 269,["220"] = 267,["221"] = 272,["222"] = 272,["223"] = 272,["225"] = 273,["226"] = 274,["227"] = 275,["228"] = 272,["229"] = 278,["230"] = 279,["231"] = 280,["232"] = 278,["233"] = 283,["234"] = 283,["235"] = 283,["237"] = 284,["238"] = 285,["239"] = 283,["240"] = 288,["241"] = 288,["242"] = 288,["244"] = 289,["245"] = 290,["246"] = 288,["247"] = 293,["248"] = 293,["249"] = 293,["251"] = 294,["252"] = 295,["253"] = 293,["254"] = 299,["255"] = 299,["256"] = 300,["257"] = 301,["258"] = 299,["259"] = 304,["260"] = 305,["261"] = 306,["262"] = 304,["263"] = 309,["264"] = 310,["265"] = 311,["266"] = 309,["267"] = 314,["268"] = 315,["269"] = 316,["270"] = 314,["271"] = 319,["272"] = 320,["273"] = 321,["274"] = 319,["275"] = 324,["276"] = 325,["277"] = 326,["278"] = 324,["279"] = 329,["280"] = 330,["281"] = 331,["282"] = 329,["283"] = 341,["284"] = 341,["285"] = 341,["287"] = 341,["288"] = 341,["290"] = 342,["291"] = 342,["293"] = 344,["294"] = 345,["295"] = 347,["296"] = 349,["297"] = 350,["298"] = 350,["300"] = 351,["301"] = 351,["304"] = 354,["305"] = 356,["306"] = 357,["308"] = 360,["309"] = 361,["310"] = 362,["312"] = 365,["314"] = 368,["315"] = 369,["316"] = 370,["318"] = 373,["320"] = 376,["321"] = 377,["322"] = 379,["323"] = 382,["324"] = 384,["325"] = 385,["327"] = 388,["328"] = 389,["329"] = 390,["330"] = 391,["332"] = 395,["333"] = 395,["334"] = 396,["335"] = 397,["337"] = 403,["338"] = 404,["340"] = 407,["342"] = 410,["343"] = 411,["345"] = 414,["346"] = 415,["348"] = 417,["350"] = 420,["351"] = 421,["353"] = 424,["354"] = 426,["356"] = 428,["357"] = 429,["360"] = 432,["361"] = 432,["362"] = 432,["363"] = 435,["364"] = 432,["367"] = 438,["368"] = 440,["371"] = 444,["372"] = 341,["373"] = 447,["374"] = 453,["376"] = 455,["377"] = 456,["379"] = 459,["380"] = 460,["381"] = 461,["382"] = 462,["383"] = 463,["384"] = 465,["385"] = 466,["386"] = 467,["387"] = 470,["389"] = 473,["390"] = 476,["391"] = 479,["397"] = 447,["398"] = 485,["399"] = 486,["400"] = 487,["402"] = 490,["403"] = 491,["405"] = 493,["407"] = 485,["408"] = 497,["409"] = 498,["410"] = 499,["411"] = 501,["412"] = 502,["414"] = 504,["416"] = 507,["417"] = 497,["418"] = 514});
local ____exports = {}
local ____Easing = require("solar.solar-common.lib.tween.Easing")
local Easing = ____Easing.default
local ____Interpolation = require("solar.solar-common.lib.tween.Interpolation")
local Interpolation = ____Interpolation.default
local ____mainGroup = require("solar.solar-common.lib.tween.mainGroup")
local mainGroup = ____mainGroup.mainGroup
local ____Sequence = require("solar.solar-common.lib.tween.Sequence")
local Sequence = ____Sequence.default
local ____Now = require("solar.solar-common.lib.tween.Now")
local now = ____Now.default
____exports.Tween = __TS__Class()
local Tween = ____exports.Tween
Tween.name = "Tween"
function Tween.prototype.____constructor(self, _object, _group)
    if _group == nil then
        _group = mainGroup
    end
    self._object = _object
    self._group = _group
    self._isPaused = false
    self._pauseStart = 0
    self._valuesStart = {}
    self._valuesEnd = {}
    self._valuesStartRepeat = {}
    self._duration = 1000
    self._initialRepeat = 0
    self._repeat = 0
    self._yoyo = false
    self._isPlaying = false
    self._reversed = false
    self._delayTime = 0
    self._startTime = 0
    self._easingFunction = Easing.Linear.None
    self._interpolationFunction = Interpolation.Linear
    self._chainedTweens = {}
    self._onStartCallbackFired = false
    self._onEveryStartCallbackFired = false
    self._id = Sequence:nextId()
    self._isChainStopped = false
    self._goToEnd = false
end
function Tween.prototype.getId(self)
    return self._id
end
function Tween.prototype.isPlaying(self)
    return self._isPlaying
end
function Tween.prototype.isPaused(self)
    return self._isPaused
end
function Tween.prototype.to(self, properties, duration)
    self._valuesEnd = __TS__ObjectAssign({}, properties)
    if duration ~= nil then
        self._duration = duration
    end
    return self
end
function Tween.prototype.duration(self, d)
    if d == nil then
        d = 1000
    end
    self._duration = d
    return self
end
function Tween.prototype.start(self, time)
    if time == nil then
        time = now(nil)
    end
    if self._isPlaying then
        return self
    end
    local ____ = self._group and self._group:add(self)
    self._repeat = self._initialRepeat
    if self._reversed then
        self._reversed = false
        for property in pairs(self._valuesStartRepeat) do
            self:_swapEndStartRepeatValues(property)
            self._valuesStart[property] = self._valuesStartRepeat[property]
        end
    end
    self._isPlaying = true
    self._isPaused = false
    self._onStartCallbackFired = false
    self._onEveryStartCallbackFired = false
    self._isChainStopped = false
    self._startTime = time
    self._startTime = self._startTime + self._delayTime
    self:_setupProperties(self._object, self._valuesStart, self._valuesEnd, self._valuesStartRepeat)
    return self
end
function Tween.prototype._setupProperties(self, _object, _valuesStart, _valuesEnd, _valuesStartRepeat)
    for property in pairs(_valuesEnd) do
        do
            local startValue = _object[property]
            local startValueIsArray = __TS__ArrayIsArray(startValue)
            local propType = startValueIsArray and "array" or __TS__TypeOf(startValue)
            local isInterpolationList = not startValueIsArray and __TS__ArrayIsArray(_valuesEnd[property])
            if propType == "undefined" or propType == "function" then
                goto __continue15
            end
            if isInterpolationList then
                local endValues = _valuesEnd[property]
                if #endValues == 0 then
                    goto __continue15
                end
                endValues = __TS__ArrayMap(
                    endValues,
                    __TS__FunctionBind(self._handleRelativeValue, self, startValue)
                )
                _valuesEnd[property] = __TS__ArrayConcat({startValue}, endValues)
            end
            if (propType == "object" or startValueIsArray) and startValue and not isInterpolationList then
                _valuesStart[property] = startValueIsArray and ({}) or ({})
                for prop in pairs(startValue) do
                    _valuesStart[property][prop] = startValue[prop]
                end
                _valuesStartRepeat[property] = startValueIsArray and ({}) or ({})
                self:_setupProperties(startValue, _valuesStart[property], _valuesEnd[property], _valuesStartRepeat[property])
            else
                if type(_valuesStart[property]) == "nil" then
                    _valuesStart[property] = startValue
                end
                if not startValueIsArray then
                    _valuesStart[property] = _valuesStart[property] * 1
                end
                if isInterpolationList then
                    _valuesStartRepeat[property] = _valuesEnd[property]:slice():reverse()
                else
                    _valuesStartRepeat[property] = _valuesStart[property] or 0
                end
            end
        end
        ::__continue15::
    end
end
function Tween.prototype.stop(self)
    if not self._isChainStopped then
        self._isChainStopped = true
        self:stopChainedTweens()
    end
    if not self._isPlaying then
        return self
    end
    local ____ = self._group and self._group:remove(self)
    self._isPlaying = false
    self._isPaused = false
    if self._onStopCallback then
        self:_onStopCallback(self._object)
    end
    return self
end
Tween.prototype["end"] = function(self)
    self._goToEnd = true
    self:update(math.huge)
    return self
end
function Tween.prototype.pause(self, time)
    if time == nil then
        time = now(nil)
    end
    if self._isPaused or not self._isPlaying then
        return self
    end
    self._isPaused = true
    self._pauseStart = time
    local ____ = self._group and self._group:remove(self)
    return self
end
function Tween.prototype.resume(self, time)
    if time == nil then
        time = now(nil)
    end
    if not self._isPaused or not self._isPlaying then
        return self
    end
    self._isPaused = false
    self._startTime = self._startTime + (time - self._pauseStart)
    self._pauseStart = 0
    local ____ = self._group and self._group:add(self)
    return self
end
function Tween.prototype.stopChainedTweens(self)
    do
        local i = 0
        local numChainedTweens = #self._chainedTweens
        while i < numChainedTweens do
            self._chainedTweens[i + 1]:stop()
            i = i + 1
        end
    end
    return self
end
function Tween.prototype.group(self, group)
    if group == nil then
        group = mainGroup
    end
    self._group = group
    return self
end
function Tween.prototype.delay(self, amount)
    if amount == nil then
        amount = 0
    end
    self._delayTime = amount
    return self
end
Tween.prototype["repeat"] = function(self, times)
    if times == nil then
        times = 0
    end
    self._initialRepeat = times
    self._repeat = times
    return self
end
function Tween.prototype.repeatDelay(self, amount)
    self._repeatDelayTime = amount
    return self
end
function Tween.prototype.yoyo(self, yoyo)
    if yoyo == nil then
        yoyo = false
    end
    self._yoyo = yoyo
    return self
end
function Tween.prototype.easing(self, easingFunction)
    if easingFunction == nil then
        easingFunction = Easing.Linear.None
    end
    self._easingFunction = easingFunction
    return self
end
function Tween.prototype.interpolation(self, interpolationFunction)
    if interpolationFunction == nil then
        interpolationFunction = Interpolation.Linear
    end
    self._interpolationFunction = interpolationFunction
    return self
end
function Tween.prototype.chain(self, ...)
    local tweens = {...}
    self._chainedTweens = tweens
    return self
end
function Tween.prototype.onStart(self, callback)
    self._onStartCallback = callback
    return self
end
function Tween.prototype.onEveryStart(self, callback)
    self._onEveryStartCallback = callback
    return self
end
function Tween.prototype.onUpdate(self, callback)
    self._onUpdateCallback = callback
    return self
end
function Tween.prototype.onRepeat(self, callback)
    self._onRepeatCallback = callback
    return self
end
function Tween.prototype.onComplete(self, callback)
    self._onCompleteCallback = callback
    return self
end
function Tween.prototype.onStop(self, callback)
    self._onStopCallback = callback
    return self
end
function Tween.prototype.update(self, time, autoStart)
    if time == nil then
        time = now(nil)
    end
    if autoStart == nil then
        autoStart = true
    end
    if self._isPaused then
        return true
    end
    local property
    local elapsed
    local endTime = self._startTime + self._duration
    if not self._goToEnd and not self._isPlaying then
        if time > endTime then
            return false
        end
        if autoStart then
            self:start(time)
        end
    end
    self._goToEnd = false
    if time < self._startTime then
        return true
    end
    if self._onStartCallbackFired == false then
        if self._onStartCallback then
            self:_onStartCallback(self._object)
        end
        self._onStartCallbackFired = true
    end
    if self._onEveryStartCallbackFired == false then
        if self._onEveryStartCallback then
            self:_onEveryStartCallback(self._object)
        end
        self._onEveryStartCallbackFired = true
    end
    elapsed = (time - self._startTime) / self._duration
    elapsed = (self._duration == 0 or elapsed > 1) and 1 or elapsed
    local value = self:_easingFunction(elapsed)
    self:_updateProperties(self._object, self._valuesStart, self._valuesEnd, value)
    if self._onUpdateCallback then
        self:_onUpdateCallback(self._object, elapsed)
    end
    if elapsed == 1 then
        if self._repeat > 0 then
            if __TS__NumberIsFinite(__TS__Number(self._repeat)) then
                self._repeat = self._repeat - 1
            end
            for ____value in pairs(self._valuesStartRepeat) do
                property = ____value
                if not self._yoyo and type(self._valuesEnd[property]) == "string" then
                    self._valuesStartRepeat[property] = self._valuesStartRepeat[property] + __TS__ParseFloat(self._valuesEnd[property])
                end
                if self._yoyo then
                    self:_swapEndStartRepeatValues(property)
                end
                self._valuesStart[property] = self._valuesStartRepeat[property]
            end
            if self._yoyo then
                self._reversed = not self._reversed
            end
            if self._repeatDelayTime ~= nil then
                self._startTime = time + self._repeatDelayTime
            else
                self._startTime = time + self._delayTime
            end
            if self._onRepeatCallback then
                self:_onRepeatCallback(self._object)
            end
            self._onEveryStartCallbackFired = false
            return true
        else
            if self._onCompleteCallback then
                self:_onCompleteCallback(self._object)
            end
            do
                local i = 0
                local numChainedTweens = #self._chainedTweens
                while i < numChainedTweens do
                    self._chainedTweens[i + 1]:start(self._startTime + self._duration)
                    i = i + 1
                end
            end
            self._isPlaying = false
            return false
        end
    end
    return true
end
function Tween.prototype._updateProperties(self, _object, _valuesStart, _valuesEnd, value)
    for property in pairs(_valuesEnd) do
        do
            if _valuesStart[property] == nil then
                goto __continue81
            end
            local start = _valuesStart[property] or 0
            local ____end = _valuesEnd[property]
            local startIsArray = __TS__ArrayIsArray(_object[property])
            local endIsArray = __TS__ArrayIsArray(____end)
            local isInterpolationList = not startIsArray and endIsArray
            if isInterpolationList then
                _object[property] = self:_interpolationFunction(____end, value)
            elseif type(____end) == "table" and ____end then
                self:_updateProperties(_object[property], start, ____end, value)
            else
                ____end = self:_handleRelativeValue(start, ____end)
                if type(____end) == "number" then
                    _object[property] = start + (____end - start) * value
                end
            end
        end
        ::__continue81::
    end
end
function Tween.prototype._handleRelativeValue(self, start, ____end)
    if type(____end) ~= "string" then
        return ____end
    end
    if string.sub(____end, 1, 1) == "+" or string.sub(____end, 1, 1) == "-" then
        return start + __TS__ParseFloat(____end)
    else
        return __TS__ParseFloat(____end)
    end
end
function Tween.prototype._swapEndStartRepeatValues(self, property)
    local tmp = self._valuesStartRepeat[property]
    local endValue = self._valuesEnd[property]
    if type(endValue) == "string" then
        self._valuesStartRepeat[property] = self._valuesStartRepeat[property] + __TS__ParseFloat(endValue)
    else
        self._valuesStartRepeat[property] = self._valuesEnd[property]
    end
    self._valuesEnd[property] = tmp
end
____exports.default = ____exports.Tween
return ____exports
