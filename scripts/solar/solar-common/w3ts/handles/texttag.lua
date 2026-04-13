local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 6,["10"] = 6,["11"] = 6,["12"] = 6,["14"] = 9,["15"] = 6,["18"] = 13,["19"] = 14,["20"] = 6,["22"] = 8,["23"] = 23,["24"] = 24,["25"] = 23,["26"] = 30,["27"] = 31,["28"] = 30,["29"] = 37,["30"] = 38,["31"] = 38,["32"] = 38,["33"] = 38,["34"] = 38,["35"] = 38,["36"] = 38,["37"] = 37,["38"] = 45,["39"] = 46,["40"] = 45,["41"] = 53,["42"] = 54,["43"] = 53,["44"] = 61,["45"] = 62,["46"] = 61,["47"] = 68,["48"] = 69,["49"] = 68,["50"] = 75,["51"] = 76,["52"] = 75,["53"] = 84,["54"] = 85,["55"] = 84,["56"] = 91,["57"] = 91,["58"] = 91,["60"] = 92,["61"] = 93,["63"] = 95,["64"] = 91,["65"] = 101,["66"] = 102,["67"] = 101,["68"] = 108,["69"] = 109,["70"] = 110,["71"] = 110,["72"] = 110,["73"] = 110,["74"] = 108,["75"] = 116,["76"] = 117,["77"] = 116,["78"] = 120,["79"] = 121,["80"] = 120});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.TextTag = __TS__Class()
local TextTag = ____exports.TextTag
TextTag.name = "TextTag"
__TS__ClassExtends(TextTag, Handle)
function TextTag.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
        return
    end
    local textTagHandle = CreateTextTag()
    if textTagHandle then
        Handle.prototype.____constructor(self, textTagHandle)
    end
end
function TextTag.prototype.destroy(self)
    DestroyTextTag(self.handle)
end
function TextTag.prototype.setAge(self, age)
    SetTextTagAge(self.handle, age)
end
function TextTag.prototype.setColor(self, red, green, blue, alpha)
    SetTextTagColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function TextTag.prototype.setFadepoint(self, fadepoint)
    SetTextTagFadepoint(self.handle, fadepoint)
end
function TextTag.prototype.setLifespan(self, lifespan)
    SetTextTagLifespan(self.handle, lifespan)
end
function TextTag.prototype.setPermanent(self, flag)
    SetTextTagPermanent(self.handle, flag)
end
function TextTag.prototype.setPos(self, x, y, heightOffset)
    SetTextTagPos(self.handle, x, y, heightOffset)
end
function TextTag.prototype.setPosUnit(self, u, heightOffset)
    SetTextTagPosUnit(self.handle, u.handle, heightOffset)
end
function TextTag.prototype.setSuspended(self, flag)
    SetTextTagSuspended(self.handle, flag)
end
function TextTag.prototype.setText(self, s, height, adjustHeight)
    if adjustHeight == nil then
        adjustHeight = false
    end
    if adjustHeight then
        height = height * 0.0023
    end
    SetTextTagText(self.handle, s, height)
end
function TextTag.prototype.setVelocity(self, xvel, yvel)
    SetTextTagVelocity(self.handle, xvel, yvel)
end
function TextTag.prototype.setVelocityAngle(self, speed, angle)
    local vel = speed * 0.071 / 128
    self:setVelocity(
        vel * Cos(angle * 0.017),
        vel * Sin(angle * 0.017)
    )
end
function TextTag.prototype.setVisible(self, flag)
    SetTextTagVisibility(self.handle, flag)
end
function TextTag.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
