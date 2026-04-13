local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 23,["15"] = 24,["16"] = 23,["17"] = 27,["18"] = 28,["19"] = 27,["25"] = 8,["27"] = 11,["28"] = 12,["37"] = 16,["45"] = 20});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Widget = __TS__Class()
local Widget = ____exports.Widget
Widget.name = "Widget"
__TS__ClassExtends(Widget, Handle)
function Widget.fromEvent(self)
    return self:fromHandle(GetTriggerWidget())
end
function Widget.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Widget.prototype,
    "life",
    {
        get = function(self)
            return GetWidgetLife(self.handle)
        end,
        set = function(self, value)
            SetWidgetLife(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Widget.prototype,
    "x",
    {get = function(self)
        return GetWidgetX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Widget.prototype,
    "y",
    {get = function(self)
        return GetWidgetY(self.handle)
    end},
    true
)
return ____exports
