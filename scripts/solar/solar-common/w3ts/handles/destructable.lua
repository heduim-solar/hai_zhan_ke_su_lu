local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 6,["16"] = 10,["17"] = 11,["18"] = 6,["20"] = 6,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 14,["30"] = 14,["31"] = 14,["33"] = 10,["34"] = 66,["35"] = 67,["36"] = 66,["37"] = 70,["38"] = 71,["39"] = 70,["40"] = 74,["41"] = 75,["42"] = 74,["43"] = 78,["44"] = 79,["45"] = 78,["46"] = 82,["47"] = 83,["48"] = 82,["49"] = 86,["50"] = 87,["51"] = 86,["52"] = 90,["53"] = 91,["54"] = 90,["55"] = 94,["56"] = 95,["57"] = 94,["58"] = 98,["59"] = 99,["60"] = 98,["66"] = 23,["68"] = 18,["69"] = 19,["79"] = 27,["81"] = 30,["82"] = 31,["92"] = 35,["94"] = 38,["95"] = 39,["104"] = 43,["113"] = 47,["115"] = 50,["116"] = 51,["125"] = 55,["133"] = 59,["141"] = 63});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____widget = require("solar.solar-common.w3ts.handles.widget")
local Widget = ____widget.Widget
____exports.Destructable = __TS__Class()
local Destructable = ____exports.Destructable
Destructable.name = "Destructable"
__TS__ClassExtends(Destructable, Widget)
function Destructable.prototype.____constructor(self, objectId, x, y, z, face, scale, varation)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        Widget.prototype.____constructor(
            self,
            CreateDestructableZ(
                objectId,
                x,
                y,
                z,
                face,
                scale,
                varation
            )
        )
    end
end
function Destructable.prototype.destroy(self)
    RemoveDestructable(self.handle)
end
function Destructable.prototype.heal(self, life, birth)
    DestructableRestoreLife(self.handle, life, birth)
end
function Destructable.prototype.kill(self)
    KillDestructable(self.handle)
end
function Destructable.prototype.queueAnim(self, whichAnimation)
    QueueDestructableAnimation(self.handle, whichAnimation)
end
function Destructable.prototype.setAnim(self, whichAnimation)
    SetDestructableAnimation(self.handle, whichAnimation)
end
function Destructable.prototype.setAnimSpeed(self, speedFactor)
    SetDestructableAnimationSpeed(self.handle, speedFactor)
end
function Destructable.prototype.show(self, flag)
    ShowDestructable(self.handle, flag)
end
function Destructable.fromEvent(self)
    return self:fromHandle(GetTriggerDestructable())
end
function Destructable.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Destructable.prototype,
    "invulnerable",
    {
        get = function(self)
            return IsDestructableInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetDestructableInvulnerable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "life",
    {
        get = function(self)
            return GetDestructableLife(self.handle)
        end,
        set = function(self, value)
            SetDestructableLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "maxLife",
    {
        get = function(self)
            return GetDestructableMaxLife(self.handle)
        end,
        set = function(self, value)
            SetDestructableMaxLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "name",
    {get = function(self)
        return GetDestructableName(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "occluderHeight",
    {
        get = function(self)
            return GetDestructableOccluderHeight(self.handle)
        end,
        set = function(self, value)
            SetDestructableOccluderHeight(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "typeId",
    {get = function(self)
        return GetDestructableTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "x",
    {get = function(self)
        return GetDestructableX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Destructable.prototype,
    "y",
    {get = function(self)
        return GetDestructableY(self.handle)
    end},
    true
)
return ____exports
