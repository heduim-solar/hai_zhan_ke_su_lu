local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 14,["14"] = 14,["15"] = 14,["17"] = 14,["18"] = 14,["20"] = 15,["21"] = 16,["23"] = 17,["24"] = 17,["25"] = 18,["26"] = 19,["27"] = 20,["28"] = 21,["29"] = 22,["30"] = 23,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["42"] = 35,["43"] = 36,["45"] = 38,["48"] = 17,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 44,["58"] = 45,["59"] = 46,["61"] = 43,["62"] = 43,["64"] = 14,["65"] = 53,["66"] = 53,["67"] = 53,["69"] = 54,["70"] = 55,["71"] = 56,["72"] = 57,["73"] = 58,["74"] = 59,["75"] = 60,["76"] = 61,["77"] = 61,["78"] = 61,["79"] = 62,["80"] = 63,["81"] = 64,["83"] = 61,["84"] = 61,["85"] = 53,["86"] = 70,["87"] = 70,["88"] = 70,["90"] = 70,["91"] = 70,["93"] = 71,["94"] = 72,["95"] = 73,["96"] = 74,["97"] = 75,["98"] = 76,["99"] = 76,["100"] = 76,["101"] = 77,["102"] = 78,["103"] = 79,["104"] = 80,["105"] = 81,["106"] = 82,["107"] = 83,["108"] = 83,["109"] = 83,["110"] = 84,["111"] = 85,["112"] = 86,["114"] = 83,["115"] = 83,["117"] = 90,["119"] = 92,["120"] = 93,["121"] = 76,["122"] = 76,["123"] = 70,["124"] = 98,["125"] = 98,["126"] = 98,["128"] = 98,["129"] = 98,["131"] = 99,["132"] = 100,["133"] = 101,["134"] = 102,["135"] = 103,["136"] = 104,["137"] = 105,["138"] = 106,["139"] = 107,["140"] = 108,["141"] = 109,["142"] = 110,["143"] = 110,["144"] = 110,["145"] = 111,["146"] = 112,["147"] = 113,["149"] = 110,["150"] = 110,["151"] = 104,["152"] = 117,["153"] = 118,["154"] = 119,["156"] = 120,["157"] = 120,["158"] = 121,["159"] = 120,["163"] = 123,["164"] = 123,["165"] = 124,["166"] = 123,["169"] = 117,["170"] = 127,["171"] = 128,["172"] = 128,["173"] = 128,["174"] = 129,["175"] = 130,["177"] = 132,["179"] = 134,["180"] = 135,["181"] = 128,["182"] = 128,["185"] = 138,["186"] = 139,["187"] = 138,["191"] = 98,["192"] = 9,["193"] = 11});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local WarningUtil = ____exports.default
WarningUtil.name = "WarningUtil"
function WarningUtil.prototype.____constructor(self)
end
function WarningUtil.warningsInRange(self, whichUnit, duration, range, smallRange, count, callback, effectArt)
    if smallRange == nil then
        smallRange = 200
    end
    if count == nil then
        count = 8
    end
    local points = {}
    local scale = smallRange / self.warningModelSize
    do
        local index = 0
        while index < 1000000 do
            local distance = GetRandomReal(0, range)
            local angle = GetRandomReal(0, 360)
            local point = {x = 0, y = 0}
            point.x = GetUnitX(whichUnit) + distance * CosBJ(angle)
            point.y = GetUnitY(whichUnit) + distance * SinBJ(angle)
            local intersect = false
            if #points > 0 then
                for ____, p in ipairs(points) do
                    local dx = point.x - p.x
                    local dy = point.y - p.y
                    local distance = math.sqrt(dx * dx + dy * dy)
                    if distance < smallRange then
                        intersect = true
                        break
                    end
                end
            end
            if not intersect then
                points[#points + 1] = point
            end
            if #points >= count then
                break
            end
            index = index + 1
        end
    end
    for ____, p in ipairs(points) do
        local effectHandle = AddSpecialEffect(effectArt or ____exports.default.warningModelPath, p.x, p.y)
        EXEffectMatScale(effectHandle, scale, scale, scale)
        BaseUtil.runLater(
            duration,
            function()
                DestroyEffect(effectHandle)
                if callback then
                    callback(nil, p.x, p.y)
                end
            end
        )
    end
end
function WarningUtil.warningAtPoint(self, whichUnit, duration, range, callback, effectArt)
    if range == nil then
        range = 1000
    end
    local x = GetUnitX(whichUnit)
    local y = GetUnitY(whichUnit)
    local angle = GetUnitFacing(whichUnit)
    local scale = range / self.warningModelSize
    local effectHandle = AddSpecialEffect(effectArt or ____exports.default.warningModelPath, x, y)
    EXEffectMatScale(effectHandle, scale, scale, scale)
    EXEffectMatRotateZ(effectHandle, angle)
    BaseUtil.runLater(
        duration,
        function()
            DestroyEffect(effectHandle)
            if callback then
                callback(nil, x, y)
            end
        end
    )
end
function WarningUtil.warningsFacing(self, whichUnit, duration, length, width, callback, effectArt)
    if length == nil then
        length = 1000
    end
    if width == nil then
        width = 100
    end
    local trigX = GetUnitX(whichUnit)
    local trigY = GetUnitY(whichUnit)
    local angle = GetUnitFacing(whichUnit)
    local distance = width / 2
    local scale = width / self.warningModelSize
    BaseUtil.onTimer(
        0.03,
        function()
            if distance < length then
                local x = trigX + distance * CosBJ(angle)
                local y = trigY + distance * SinBJ(angle)
                local effectHandle = AddSpecialEffect(effectArt or ____exports.default.warningModelPath, x, y)
                EXEffectMatScale(effectHandle, scale, scale, scale)
                EXEffectMatRotateZ(effectHandle, angle)
                BaseUtil.runLater(
                    duration,
                    function()
                        DestroyEffect(effectHandle)
                        if callback then
                            callback(nil, x, y)
                        end
                    end
                )
            else
                return false
            end
            distance = distance + width
            return true
        end
    )
end
function WarningUtil.warningsSector(self, whichUnit, duration, length, maxAngle, interval, callback, effectArt)
    if length == nil then
        length = 1000
    end
    if maxAngle == nil then
        maxAngle = 120
    end
    local trigX = GetUnitX(whichUnit)
    local trigY = GetUnitY(whichUnit)
    local trigFacing = GetUnitFacing(whichUnit)
    local distance = 50
    local scale = 100 / self.warningModelSize
    local function func1(self, angle)
        local x = trigX + distance * CosBJ(angle)
        local y = trigY + distance * SinBJ(angle)
        local effectHandle = AddSpecialEffect(effectArt or ____exports.default.warningModelPath, x, y)
        EXEffectMatScale(effectHandle, scale, scale, scale)
        EXEffectMatRotateZ(effectHandle, angle)
        BaseUtil.runLater(
            duration,
            function()
                DestroyEffect(effectHandle)
                if callback then
                    callback(nil, x, y)
                end
            end
        )
    end
    local function func2(self)
        func1(nil, trigFacing)
        local delta = 2 * math.asin(50 / distance)
        do
            local angle = trigFacing - delta
            while angle >= trigFacing - maxAngle / 2 do
                func1(nil, angle)
                angle = angle - delta
            end
        end
        do
            local angle = trigFacing + delta
            while angle <= trigFacing + maxAngle / 2 do
                func1(nil, angle)
                angle = angle + delta
            end
        end
    end
    if interval then
        BaseUtil.onTimer(
            interval,
            function()
                if distance < length then
                    func2(nil)
                else
                    return false
                end
                distance = distance + 100
                return true
            end
        )
    else
        do
            while distance < length do
                func2(nil)
                distance = distance + 100
            end
        end
    end
end
WarningUtil.warningModelPath = "Abilities\\Spells\\Orc\\CommandAura\\CommandAuraTarget.mdx"
WarningUtil.warningModelSize = 100
return ____exports
