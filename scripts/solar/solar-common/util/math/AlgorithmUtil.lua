local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 6,["10"] = 6,["11"] = 9,["12"] = 10,["13"] = 11,["14"] = 11,["17"] = 13,["18"] = 9,["19"] = 25,["20"] = 25,["21"] = 25,["23"] = 26,["25"] = 27,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 27,["34"] = 33,["35"] = 25,["36"] = 43,["37"] = 44,["38"] = 45,["39"] = 46,["40"] = 47,["41"] = 48,["42"] = 49,["43"] = 43,["44"] = 60,["45"] = 61,["47"] = 62,["48"] = 62,["49"] = 63,["50"] = 64,["51"] = 65,["52"] = 66,["53"] = 67,["54"] = 68,["55"] = 69,["56"] = 70,["57"] = 71,["62"] = 76,["63"] = 77,["65"] = 79,["68"] = 62,["71"] = 82,["72"] = 60,["73"] = 92,["74"] = 93,["75"] = 94,["76"] = 95,["77"] = 96,["78"] = 97,["80"] = 98,["81"] = 98,["83"] = 99,["84"] = 99,["85"] = 100,["86"] = 99,["89"] = 98,["92"] = 103,["93"] = 92});
local ____exports = {}
____exports.default = __TS__Class()
local AlgorithmUtil = ____exports.default
AlgorithmUtil.name = "AlgorithmUtil"
function AlgorithmUtil.prototype.____constructor(self)
end
function AlgorithmUtil.contains(self, item, arr)
    for ____, i in ipairs(arr) do
        if i == item then
            return true
        end
    end
    return false
end
function AlgorithmUtil.getPointsOnCircle(self, radius, x, y, count, isRandom)
    if isRandom == nil then
        isRandom = true
    end
    local points = {}
    do
        local index = 0
        while index < count do
            local angle = isRandom and GetRandomReal(0, 360) or index * (360 / count)
            local xx = x + radius * CosBJ(angle)
            local yy = y + radius * SinBJ(angle)
            points[#points + 1] = {x = xx, y = yy}
            index = index + 1
        end
    end
    return points
end
function AlgorithmUtil.getRandomPointInsideCircle(self, radius, x, y)
    local angle = GetRandomReal(0, 360)
    local distance = GetRandomReal(0, radius)
    local point = {x = 0, y = 0}
    point.x = x + distance * CosBJ(angle)
    point.y = y + distance * SinBJ(angle)
    return point
end
function AlgorithmUtil.getRandomPointsInsideCircle(self, R, x, y, r, count)
    local points = {}
    do
        local index = 0
        while index < 1000000 do
            local point = self:getRandomPointInsideCircle(R, x, y)
            local intersect = false
            if #points > 0 then
                for ____, p in ipairs(points) do
                    local dx = point.x - p.x
                    local dy = point.y - p.y
                    local distance = math.sqrt(dx * dx + dy * dy)
                    if distance < 2 * r then
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
    return points
end
function AlgorithmUtil.getCircleCenterPointsInsideRect(self, radius, whichRect)
    local points = {}
    local minX = GetRectMinX(whichRect)
    local minY = GetRectMinY(whichRect)
    local maxX = GetRectMaxX(whichRect)
    local maxY = GetRectMaxY(whichRect)
    do
        local x = minX + radius
        while x <= maxX - radius do
            do
                local y = minY + radius
                while x <= maxY - radius do
                    points[#points + 1] = {x = x, y = y}
                    y = y + 2 * radius
                end
            end
            x = x + 2 * radius
        end
    end
    return points
end
return ____exports
