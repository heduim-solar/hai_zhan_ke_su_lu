local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["9"] = 22,["10"] = 6,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 13,["17"] = 14,["18"] = 23,["19"] = 24,["20"] = 22,["21"] = 30,["22"] = 30,["23"] = 30,["25"] = 31,["27"] = 32,["28"] = 32,["29"] = 33,["32"] = 36,["33"] = 37,["34"] = 38,["35"] = 39,["36"] = 40,["37"] = 41,["39"] = 32,["42"] = 30,["43"] = 51,["45"] = 52,["46"] = 52,["47"] = 53,["48"] = 54,["49"] = 55,["50"] = 56,["51"] = 57,["52"] = 58,["53"] = 59,["54"] = 60,["55"] = 61,["57"] = 52,["60"] = 66,["61"] = 51,["62"] = 74,["63"] = 75,["64"] = 76,["65"] = 77,["66"] = 78,["67"] = 79,["71"] = 82,["72"] = 82,["73"] = 83,["74"] = 84,["75"] = 85,["77"] = 82,["80"] = 88,["81"] = 74,["82"] = 94,["83"] = 94,["84"] = 94,["86"] = 95,["87"] = 96,["88"] = 97,["90"] = 99,["93"] = 101,["94"] = 101,["95"] = 102,["96"] = 101,["99"] = 94,["100"] = 110,["102"] = 111,["103"] = 111,["104"] = 112,["105"] = 113,["106"] = 114,["108"] = 111,["111"] = 110,["112"] = 123,["114"] = 124,["115"] = 124,["116"] = 125,["117"] = 126,["118"] = 127,["119"] = 128,["122"] = 124,["125"] = 123,["126"] = 138,["128"] = 139,["129"] = 139,["130"] = 140,["131"] = 141,["132"] = 142,["133"] = 143,["136"] = 139,["139"] = 138,["140"] = 153,["141"] = 154,["142"] = 156,["143"] = 157,["146"] = 164,["147"] = 164,["148"] = 165,["149"] = 166,["150"] = 164,["153"] = 168,["154"] = 153,["155"] = 174,["156"] = 175,["158"] = 176,["159"] = 176,["160"] = 177,["161"] = 178,["163"] = 176,["166"] = 181,["167"] = 174,["168"] = 187,["169"] = 188,["171"] = 189,["172"] = 189,["173"] = 190,["174"] = 191,["176"] = 189,["179"] = 194,["180"] = 187});
local ____exports = {}
____exports.default = __TS__Class()
local ObjectPool = ____exports.default
ObjectPool.name = "ObjectPool"
function ObjectPool.prototype.____constructor(self, create, returnCallBack)
    self.objects = {}
    self.objectIdleStatus = {}
    self._before_lastBorrowObjectIndex = -1
    self.lastBorrowObjectIndex = -1
    self.create = nil
    self.returnCallBack = nil
    self.maxTotal = 1000000
    self.minIdle = 1
    self.create = create
    self.returnCallBack = returnCallBack
end
function ObjectPool.prototype.preparePool(self, idleCount)
    if idleCount == nil then
        idleCount = self.minIdle
    end
    local tempIdleCount = 0
    do
        local i = 0
        while i < self.maxTotal do
            if tempIdleCount >= idleCount then
                return
            end
            if self.objectIdleStatus[i + 1] == true then
                tempIdleCount = tempIdleCount + 1
            elseif self.objects[i + 1] == nil then
                self.objects[i + 1] = self:create()
                self.objectIdleStatus[i + 1] = true
                tempIdleCount = tempIdleCount + 1
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.borrowObject(self)
    do
        local i = 0
        while i < self.maxTotal do
            if self.objectIdleStatus[i + 1] == true then
                self.lastBorrowObjectIndex = i
                self.objectIdleStatus[i + 1] = false
                return self.objects[i + 1]
            elseif self.objects[i + 1] == nil then
                self.objects[i + 1] = self:create()
                self.lastBorrowObjectIndex = i
                self.objectIdleStatus[i + 1] = false
                return self.objects[i + 1]
            end
            i = i + 1
        end
    end
    return nil
end
function ObjectPool.prototype.returnObject(self, obj)
    local isIdle = true
    if self.returnCallBack then
        local flag = self:returnCallBack(obj)
        if flag ~= nil then
            isIdle = flag
        end
    end
    do
        local i = 0
        while i < self.maxTotal do
            if obj == self.objects[i + 1] then
                self.objectIdleStatus[i + 1] = isIdle
                return true
            end
            i = i + 1
        end
    end
    return false
end
function ObjectPool.prototype.setAllIdleStatus(self, isIdle)
    if isIdle == nil then
        isIdle = true
    end
    self._before_lastBorrowObjectIndex = self.lastBorrowObjectIndex
    if isIdle then
        self.lastBorrowObjectIndex = -1
    else
        self.lastBorrowObjectIndex = #self.objects - 1
    end
    do
        local i = 0
        while i < #self.objects do
            self.objectIdleStatus[i + 1] = isIdle
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forObjects(self, callBack)
    do
        local i = 0
        while i < #self.objects do
            local isIdle = callBack(nil, self.objects[i + 1])
            if isIdle ~= nil then
                self.objectIdleStatus[i + 1] = isIdle
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forIdleObjects(self, callBack)
    do
        local i = 0
        while i < #self.objectIdleStatus do
            if self.objectIdleStatus[i + 1] == true then
                local isIdle = callBack(nil, self.objects[i + 1])
                if isIdle ~= nil then
                    self.objectIdleStatus[i + 1] = isIdle
                end
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forActiveObjects(self, callBack)
    do
        local i = 0
        while i < #self.objects do
            if self.objectIdleStatus[i + 1] == false then
                local isIdle = callBack(nil, self.objects[i + 1])
                if isIdle ~= nil then
                    self.objectIdleStatus[i + 1] = isIdle
                end
            end
            i = i + 1
        end
    end
end
function ObjectPool.prototype.forDirtyObjects(self, callBack)
    local clearNum = 0
    if self.lastBorrowObjectIndex >= self._before_lastBorrowObjectIndex then
        return clearNum
    end
    do
        local i = self.lastBorrowObjectIndex + 1
        while i <= self._before_lastBorrowObjectIndex do
            callBack(nil, self.objects[i + 1])
            clearNum = clearNum + 1
            i = i + 1
        end
    end
    return clearNum
end
function ObjectPool.prototype.getNumActive(self)
    local num = 0
    do
        local i = 0
        while i < #self.objectIdleStatus do
            if self.objectIdleStatus[i + 1] == false then
                num = num + 1
            end
            i = i + 1
        end
    end
    return num
end
function ObjectPool.prototype.getNumIdle(self)
    local num = 0
    do
        local i = 0
        while i < #self.objectIdleStatus do
            if self.objectIdleStatus[i + 1] == true then
                num = num + 1
            end
            i = i + 1
        end
    end
    return num
end
return ____exports
