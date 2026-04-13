local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 20,["24"] = 11,["25"] = 22,["26"] = 23,["27"] = 25,["28"] = 26,["29"] = 27,["31"] = 29,["32"] = 31,["33"] = 33,["34"] = 33,["36"] = 35,["37"] = 36,["38"] = 36,["39"] = 36,["40"] = 36,["41"] = 36,["43"] = 11,["44"] = 41,["45"] = 42,["46"] = 43,["48"] = 20,["49"] = 48,["50"] = 11,["51"] = 48,["52"] = 52,["53"] = 53,["54"] = 53,["55"] = 53,["56"] = 54,["59"] = 58,["60"] = 59,["63"] = 63,["64"] = 63,["65"] = 63,["66"] = 64,["67"] = 65,["68"] = 66,["70"] = 68,["71"] = 63,["72"] = 63,["73"] = 53,["74"] = 53,["75"] = 52,["76"] = 84,["77"] = 85,["78"] = 87,["79"] = 88,["80"] = 89,["81"] = 90,["82"] = 90,["83"] = 90,["84"] = 91,["85"] = 90,["86"] = 90,["87"] = 90,["89"] = 95,["90"] = 96,["91"] = 97,["92"] = 98,["93"] = 99,["95"] = 84,["96"] = 106,["97"] = 107,["98"] = 108,["100"] = 108,["102"] = 106,["103"] = 114,["104"] = 115,["105"] = 114,["106"] = 121,["107"] = 122,["108"] = 121,["109"] = 128,["110"] = 129,["111"] = 11,["112"] = 132,["113"] = 134,["114"] = 135,["115"] = 136,["118"] = 128,["123"] = 78});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
____exports.default = __TS__Class()
local ActorBuff = ____exports.default
ActorBuff.name = "ActorBuff"
__TS__ClassExtends(ActorBuff, Actor)
function ActorBuff.prototype.____constructor(self, actorTypeId, unit, creator, initActorBuff)
    Actor.prototype.____constructor(self, actorTypeId)
    self.unit = unit
    self.creator = creator
    local solarData = DataBase:getUnitSolarData(unit)
    if not solarData._SL_solarActorBuffSet then
        solarData._SL_solarActorBuffSet = {}
    end
    solarData._SL_solarActorBuffSet[actorTypeId] = self
    self:update()
    if initActorBuff ~= nil then
        initActorBuff(nil, self)
    end
    if self:get("modelAttach") ~= nil and #self:get("modelAttach") > 4 then
        self.effect = AddSpecialEffectTarget(
            self:get("modelAttach"),
            unit,
            self:get("modelAttachTarget", TargetAttach.origin)
        )
    end
    Actor.prototype._sl_init(self)
    local dur = self:get("dur")
    if dur ~= nil and dur > 0 then
        self:initDur(dur)
    end
end
function ActorBuff.prototype.get(self, key, defaultValue)
    return Actor.prototype.get(self, key, defaultValue)
end
function ActorBuff.prototype.initDur(self, dur)
    BaseUtil.runLater(
        dur,
        function()
            if self._sl_isDestroyed then
                return
            end
            if self:getRemainingTime() <= 0 then
                self:destroy()
                return
            end
            BaseUtil.onTimer(
                1,
                function(____, count)
                    if self:getRemainingTime() <= 0 then
                        self:destroy()
                        return false
                    end
                    return true
                end
            )
        end
    )
end
function ActorBuff.prototype.setTimerInterval(self, timeS)
    self:set("interval", timeS)
    if timeS > 0 then
        if self._sl_intervalTimer == nil then
            self._sl_intervalTimer = __TS__New(STimer)
            self._sl_intervalTimer:start(
                timeS,
                function()
                    self:interval()
                end,
                true
            )
        end
        self._sl_intervalTimer.timeout = timeS
    elseif self._sl_intervalTimer then
        log.errorWithTraceBack("buff间隔必须 > 0")
        self._sl_intervalTimer:destroy()
        self._sl_intervalTimer = nil
    end
end
function ActorBuff.prototype.update(self)
    self.creationTime = _g_time / 1000
    local ____opt_2 = self:get("onUpdate")
    if ____opt_2 ~= nil then
        ____opt_2(nil, self)
    end
end
function ActorBuff.prototype.getDieTime(self)
    return self.creationTime + self:get("dur", 0)
end
function ActorBuff.prototype.getRemainingTime(self)
    return self.creationTime + self:get("dur", 0) - _g_time / 1000
end
function ActorBuff.prototype.destroy(self)
    local unit = self.unit
    Actor.prototype.destroy(self)
    if self._sl_isDestroyed and IsHandle(unit) then
        local solarData = DataBase:getUnitSolarData(unit, false)
        if solarData and solarData._SL_solarActorBuffSet then
            solarData._SL_solarActorBuffSet[self.actorType.id] = nil
        end
    end
end
__TS__SetDescriptor(
    ActorBuff.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
