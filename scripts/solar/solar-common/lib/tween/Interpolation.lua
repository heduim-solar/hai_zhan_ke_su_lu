local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 9,["6"] = 9,["7"] = 10,["8"] = 11,["9"] = 12,["10"] = 13,["11"] = 14,["12"] = 16,["13"] = 17,["15"] = 20,["16"] = 21,["18"] = 24,["19"] = 9,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 31,["26"] = 33,["27"] = 33,["28"] = 34,["29"] = 33,["32"] = 37,["33"] = 9,["34"] = 40,["35"] = 41,["36"] = 42,["37"] = 43,["38"] = 44,["39"] = 46,["40"] = 47,["41"] = 48,["42"] = 48,["44"] = 51,["45"] = 51,["46"] = 51,["47"] = 51,["48"] = 51,["49"] = 51,["50"] = 51,["51"] = 51,["53"] = 53,["54"] = 54,["55"] = 54,["56"] = 54,["57"] = 54,["58"] = 54,["59"] = 54,["60"] = 54,["61"] = 54,["63"] = 57,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 58,["68"] = 58,["69"] = 58,["70"] = 58,["71"] = 58,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 61,["79"] = 61,["80"] = 61,["82"] = 9,["83"] = 65,["84"] = 66,["85"] = 67,["86"] = 65,["87"] = 69,["88"] = 70,["89"] = 72,["90"] = 65,["91"] = 74,["92"] = 75,["93"] = 77,["94"] = 78,["95"] = 80,["96"] = 81,["99"] = 84,["100"] = 84,["101"] = 85,["102"] = 84,["105"] = 88,["106"] = 89,["107"] = 77,["108"] = 65,["109"] = 93,["110"] = 94,["111"] = 95,["112"] = 96,["113"] = 97,["114"] = 99,["115"] = 65,["116"] = 9,["117"] = 9,["118"] = 104});
local ____exports = {}
local Interpolation
Interpolation = {
    Linear = function(self, v, k)
        local m = #v - 1
        local f = m * k
        local i = math.floor(f)
        local fn = Interpolation.Utils.Linear
        if k < 0 then
            return fn(nil, v[1], v[2], f)
        end
        if k > 1 then
            return fn(nil, v[m + 1], v[m], m - f)
        end
        return fn(nil, v[i + 1], v[(i + 1 > m and m or i + 1) + 1], f - i)
    end,
    Bezier = function(self, v, k)
        local b = 0
        local n = #v - 1
        local pw = math.pow
        local bn = Interpolation.Utils.Bernstein
        do
            local i = 0
            while i <= n do
                b = b + pw(1 - k, n - i) * pw(k, i) * v[i + 1] * bn(nil, n, i)
                i = i + 1
            end
        end
        return b
    end,
    CatmullRom = function(self, v, k)
        local m = #v - 1
        local f = m * k
        local i = math.floor(f)
        local fn = Interpolation.Utils.CatmullRom
        if v[1] == v[m + 1] then
            if k < 0 then
                f = m * (1 + k)
                i = math.floor(f)
            end
            return fn(
                nil,
                v[(i - 1 + m) % m + 1],
                v[i + 1],
                v[(i + 1) % m + 1],
                v[(i + 2) % m + 1],
                f - i
            )
        else
            if k < 0 then
                return v[1] - (fn(
                    nil,
                    v[1],
                    v[1],
                    v[2],
                    v[2],
                    -f
                ) - v[1])
            end
            if k > 1 then
                return v[m + 1] - (fn(
                    nil,
                    v[m + 1],
                    v[m + 1],
                    v[m],
                    v[m],
                    f - m
                ) - v[m + 1])
            end
            return fn(
                nil,
                v[(i and i - 1 or 0) + 1],
                v[i + 1],
                v[(m < i + 1 and m or i + 1) + 1],
                v[(m < i + 2 and m or i + 2) + 1],
                f - i
            )
        end
    end,
    Utils = {
        Linear = function(self, p0, p1, t)
            return (p1 - p0) * t + p0
        end,
        Bernstein = function(self, n, i)
            local fc = Interpolation.Utils.Factorial
            return fc(nil, n) / fc(nil, i) / fc(nil, n - i)
        end,
        Factorial = (function(self)
            local a = {1}
            return function(self, n)
                local s = 1
                if a[n + 1] then
                    return a[n + 1]
                end
                do
                    local i = n
                    while i > 1 do
                        s = s * i
                        i = i - 1
                    end
                end
                a[n + 1] = s
                return s
            end
        end)(nil),
        CatmullRom = function(self, p0, p1, p2, p3, t)
            local v0 = (p2 - p0) * 0.5
            local v1 = (p3 - p1) * 0.5
            local t2 = t * t
            local t3 = t * t2
            return (2 * p1 - 2 * p2 + v0 + v1) * t3 + (-3 * p1 + 3 * p2 - 2 * v0 - v1) * t2 + v0 * t + p1
        end
    }
}
____exports.default = Interpolation
return ____exports
