local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 14,["14"] = 14,["15"] = 14,["16"] = 39,["17"] = 39,["18"] = 16,["19"] = 18,["20"] = 20,["21"] = 21,["22"] = 22,["23"] = 23,["24"] = 31,["25"] = 32,["26"] = 33,["27"] = 35,["28"] = 40,["29"] = 41,["30"] = 42,["31"] = 43,["33"] = 39,["34"] = 53,["35"] = 54,["36"] = 55,["37"] = 55,["39"] = 57,["40"] = 57,["42"] = 53,["43"] = 65,["44"] = 65,["45"] = 70,["46"] = 71,["47"] = 70,["48"] = 79,["49"] = 80,["50"] = 79,["51"] = 83,["52"] = 84,["53"] = 83,["54"] = 88,["55"] = 89,["56"] = 90,["57"] = 91,["58"] = 92,["59"] = 88,["60"] = 96,["61"] = 97,["62"] = 98,["65"] = 101,["66"] = 102,["67"] = 103,["68"] = 103,["69"] = 103,["70"] = 104,["71"] = 105,["73"] = 105,["75"] = 106,["78"] = 109,["79"] = 110,["80"] = 112,["81"] = 114,["82"] = 115,["83"] = 116,["84"] = 103,["85"] = 103,["86"] = 103,["87"] = 96,["88"] = 120,["89"] = 121,["90"] = 122,["92"] = 125,["93"] = 120,["94"] = 128,["95"] = 129,["96"] = 130,["97"] = 131,["98"] = 132,["99"] = 133,["100"] = 134,["101"] = 135,["102"] = 136,["103"] = 137,["104"] = 138,["105"] = 139,["109"] = 143,["110"] = 144,["111"] = 146,["112"] = 147,["113"] = 148,["114"] = 149,["116"] = 151,["117"] = 152,["118"] = 152,["119"] = 152,["120"] = 152,["121"] = 153,["122"] = 154,["123"] = 155,["125"] = 128});
local ____exports = {}
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
local ____InterpolationUtil = require("solar.solar-common.util.math.InterpolationUtil")
local InterpolationUtil = ____InterpolationUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local Motion = ____exports.default
Motion.name = "Motion"
function Motion.prototype.____constructor(self, duration, onUpdate, ...)
    local pathPoints = {...}
    self.pathPoints = {}
    self.cycle = false
    self.duration = 5
    self.speed = 1
    self.time = 0
    self.pathSplineType = "Linear"
    self.onUpdate = nil
    self.onDone = nil
    self.sTimer = __TS__New(STimer)
    self.updateInterval = 0.03
    self.duration = duration
    self.onUpdate = onUpdate
    if pathPoints ~= nil then
        self.pathPoints = pathPoints
    end
end
function Motion.prototype.addPathPoint(self, xOrVector, y, z)
    if y == nil then
        local ____self_pathPoints_0 = self.pathPoints
        ____self_pathPoints_0[#____self_pathPoints_0 + 1] = xOrVector
    else
        local ____self_pathPoints_1 = self.pathPoints
        ____self_pathPoints_1[#____self_pathPoints_1 + 1] = {x = xOrVector, y = y, z = z}
    end
end
function Motion.prototype.showDebugShape(self)
end
function Motion.prototype.setOnUpdate(self, onUpdate)
    self.onUpdate = onUpdate
end
function Motion.prototype.setPathSplineType(self, pathSplineType)
    self.pathSplineType = pathSplineType
end
function Motion.prototype.stop(self)
    self.sTimer:destroy()
end
function Motion.prototype.reset(self)
    self.time = 0
    self.x = self.pathPoints[1].x
    self.y = self.pathPoints[1].y
    self.z = self.pathPoints[1].z
end
function Motion.prototype.run(self)
    if self.onUpdate == nil then
        log.errorWithTraceBack("请先设置更新函数：setOnUpdate() 以接收运动器运动状态。")
        return
    end
    self:reset()
    self.sTimer:reset()
    self.sTimer:start(
        self.updateInterval,
        function()
            if self.time > self.duration then
                local ____opt_2 = self.onDone
                if ____opt_2 ~= nil then
                    ____opt_2(self, self)
                end
                self.sTimer:destroy()
                return
            end
            self.time = self.time + self.updateInterval
            self.progress = self.time / self.duration
            self:interpolation()
            self:onUpdate(self)
            self.last_x = self.x
            self.last_y = self.y
        end,
        true
    )
end
function Motion.prototype.getFaceAngle(self)
    if self.last_x == nil then
        return MathUtil.angleBetweenCoords(self.pathPoints[1].x, self.pathPoints[1].y, self.pathPoints[#self.pathPoints].x, self.pathPoints[#self.pathPoints].y)
    end
    return MathUtil.angleBetweenCoords(self.last_x, self.last_y, self.x, self.y)
end
function Motion.prototype.interpolation(self)
    if self.pathSplineType == "Linear" then
        local pathPointsIndex = self.progress * (#self.pathPoints - 1)
        pathPointsIndex = math.floor(pathPointsIndex)
        local startVector = self.pathPoints[pathPointsIndex + 1]
        local endVector = self.pathPoints[pathPointsIndex + 1 + 1]
        if startVector == nil or endVector == nil then
            endVector = self.pathPoints[#self.pathPoints]
            self.x = endVector.x
            self.y = endVector.y
            if endVector.z then
                self.z = endVector.z
            end
            return
        end
        local onePathPointDuration = self.duration / (#self.pathPoints - 1)
        local onePathPointProgress = self.time % onePathPointDuration / onePathPointDuration
        self.x = InterpolationUtil:line(startVector.x, endVector.x, onePathPointProgress)
        self.y = InterpolationUtil:line(startVector.y, endVector.y, onePathPointProgress)
        if startVector.z and endVector.z then
            self.z = InterpolationUtil:line(startVector.z, endVector.z, onePathPointProgress)
        end
    elseif self.pathSplineType == "Bezier" then
        local bezierResult = InterpolationUtil:bezier(
            self.progress,
            table.unpack(self.pathPoints)
        )
        self.x = bezierResult.x
        self.y = bezierResult.y
        self.z = bezierResult.z
    end
end
return ____exports
