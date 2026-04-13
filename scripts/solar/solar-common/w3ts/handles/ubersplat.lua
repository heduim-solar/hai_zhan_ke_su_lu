local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 7,["14"] = 8,["15"] = 5,["17"] = 5,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 11,["29"] = 11,["30"] = 11,["32"] = 7,["33"] = 15,["34"] = 16,["35"] = 15,["36"] = 19,["37"] = 20,["38"] = 19,["39"] = 23,["40"] = 23,["41"] = 23,["43"] = 24,["44"] = 25,["46"] = 27,["48"] = 23,["49"] = 31,["50"] = 32,["51"] = 31,["52"] = 35,["53"] = 36,["54"] = 35,["55"] = 39,["56"] = 40,["57"] = 39});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Ubersplat = __TS__Class()
local Ubersplat = ____exports.Ubersplat
Ubersplat.name = "Ubersplat"
__TS__ClassExtends(Ubersplat, Handle)
function Ubersplat.prototype.____constructor(self, x, y, name, red, green, blue, alpha, forcePaused, noBirthTime)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateUbersplat(
                x,
                y,
                name,
                red,
                green,
                blue,
                alpha,
                forcePaused,
                noBirthTime
            )
        )
    end
end
function Ubersplat.prototype.destroy(self)
    DestroyUbersplat(self.handle)
end
function Ubersplat.prototype.finish(self)
    FinishUbersplat(self.handle)
end
function Ubersplat.prototype.render(self, flag, always)
    if always == nil then
        always = false
    end
    if always then
        SetUbersplatRenderAlways(self.handle, flag)
    else
        SetUbersplatRender(self.handle, flag)
    end
end
function Ubersplat.prototype.reset(self)
    ResetUbersplat(self.handle)
end
function Ubersplat.prototype.show(self, flag)
    ShowUbersplat(self.handle, flag)
end
function Ubersplat.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
