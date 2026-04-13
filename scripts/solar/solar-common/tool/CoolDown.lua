local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 15,["12"] = 8,["13"] = 16,["14"] = 15,["15"] = 24,["16"] = 24,["17"] = 24,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["24"] = 30,["25"] = 24,["26"] = 37,["27"] = 38,["28"] = 39,["30"] = 37,["31"] = 46,["32"] = 47,["33"] = 47,["34"] = 47,["35"] = 47,["36"] = 46});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local CoolDown = ____exports.default
CoolDown.name = "CoolDown"
function CoolDown.prototype.____constructor(self, cool)
    self.lastWorkTime = -1000000
    self.cool = cool
end
function CoolDown.prototype.isReady(self, doWork)
    if doWork == nil then
        doWork = true
    end
    local gameTime = BaseUtil.getGameTime()
    local r = gameTime - self.lastWorkTime > self.cool
    if r and doWork then
        self.lastWorkTime = gameTime
    end
    return r
end
function CoolDown.prototype.ifReady(self, callBack)
    if self:isReady() then
        callBack(nil)
    end
end
function CoolDown.prototype.getCooldown(self)
    return math.max(
        self.cool - (BaseUtil.getGameTime() - self.lastWorkTime),
        0
    )
end
return ____exports
