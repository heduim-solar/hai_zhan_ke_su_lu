local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 4,["15"] = 4,["16"] = 4,["17"] = 4,["19"] = 4,["20"] = 5,["21"] = 7,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 11,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 16,["30"] = 21,["31"] = 22,["32"] = 23,["34"] = 25,["35"] = 21,["36"] = 28,["37"] = 29,["38"] = 28,["39"] = 33,["41"] = 34,["42"] = 34,["43"] = 35,["44"] = 36,["45"] = 37,["47"] = 34,["50"] = 33});
local ____exports = {}
local ____FrameNode = require("solar.solar-common.framex.FrameNode")
local FrameNode = ____FrameNode.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
____exports.default = __TS__Class()
local FrameParent = ____exports.default
FrameParent.name = "FrameParent"
__TS__ClassExtends(FrameParent, FrameNode)
function FrameParent.prototype.____constructor(self)
    FrameNode.prototype.____constructor(self)
    self.children = {}
end
function FrameParent.prototype.attachChild(self, ...)
    __TS__ArrayPush(self.children, ...)
    self:layout()
end
function FrameParent.prototype.attachChilds(self, nodes)
    __TS__ArrayPushArray(self.children, nodes)
    self:layout()
end
function FrameParent.prototype.detachChild(self, node)
    if node == nil then
        return false
    end
    return ArrayUtil:removeElement(self.children, node)
end
function FrameParent.prototype.detachAllChildren(self)
    self.children = {}
end
function FrameParent.prototype.layout(self)
    do
        local i = 0
        while i < #self.children do
            local child = self.children[i + 1]
            if __TS__InstanceOf(child, ____exports.default) then
                child:layout()
            end
            i = i + 1
        end
    end
end
return ____exports
