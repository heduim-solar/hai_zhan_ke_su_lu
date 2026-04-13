local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 10,["13"] = 11,["14"] = 11,["15"] = 11,["16"] = 25,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 28,["29"] = 25,["30"] = 31,["31"] = 32,["32"] = 32,["33"] = 31,["34"] = 38,["35"] = 39,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 38,["41"] = 45,["42"] = 46,["43"] = 45,["44"] = 50,["45"] = 51,["46"] = 52,["49"] = 55,["52"] = 59,["53"] = 59,["54"] = 60,["55"] = 61,["57"] = 59,["58"] = 59,["59"] = 59,["60"] = 64,["61"] = 50,["62"] = 68,["63"] = 69,["64"] = 70,["66"] = 70,["68"] = 71,["69"] = 72,["70"] = 73,["71"] = 68,["72"] = 79,["73"] = 80,["74"] = 79,["75"] = 12});
local ____exports = {}
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local index = 0
____exports.default = __TS__Class()
local SolarTrigger = ____exports.default
SolarTrigger.name = "SolarTrigger"
function SolarTrigger.prototype.____constructor(self, actionFunc, solarTriggers)
    local ____index_1 = index
    index = ____index_1 + 1
    self.uuid = "stri" .. tostring(____index_1)
    self.enable = true
    self.onDestroy = nil
    self.actionFuncs = {}
    self.solarTriggers = nil
    self._sl_isDestroyed = false
    self:addAction(actionFunc)
    self.solarTriggers = solarTriggers
    local ____self_solarTriggers_0 = self.solarTriggers
    ____self_solarTriggers_0[#____self_solarTriggers_0 + 1] = self
end
function SolarTrigger.prototype.addAction(self, actionFunc)
    local ____self_actionFuncs_2 = self.actionFuncs
    ____self_actionFuncs_2[#____self_actionFuncs_2 + 1] = actionFunc
end
function SolarTrigger.prototype.removeAction(self, actionFunc)
    __TS__ArraySplice(
        self.actionFuncs,
        __TS__ArrayIndexOf(self.actionFuncs, actionFunc),
        1
    )
end
function SolarTrigger.prototype.removeActions(self)
    self.actionFuncs = {}
end
function SolarTrigger.prototype.exec(self, data)
    ____exports.default._sl_TriggeringSolarTrigger = self
    if self._sl_isDestroyed then
        return
    end
    if self.enable == false then
        return
    end
    xpcall(
        function()
            for ____, actionFunc in ipairs(self.actionFuncs) do
                actionFunc(self, data)
            end
        end,
        ErrorMsgHelper.error_handle
    )
    ____exports.default._sl_TriggeringSolarTrigger = nil
end
function SolarTrigger.prototype.destroy(self)
    self._sl_isDestroyed = true
    local ____opt_3 = self.onDestroy
    if ____opt_3 ~= nil then
        ____opt_3(self)
    end
    self.actionFuncs = nil
    ArrayUtil:removeElement(self.solarTriggers, self)
    self.solarTriggers = nil
end
function SolarTrigger.getTriggeringSolarTrigger(self)
    return ____exports.default._sl_TriggeringSolarTrigger
end
SolarTrigger._sl_TriggeringSolarTrigger = nil
return ____exports
