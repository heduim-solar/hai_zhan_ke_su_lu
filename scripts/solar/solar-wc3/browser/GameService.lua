local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 7,["14"] = 5});
local ____exports = {}
local ____GameSettingService = require("solar.solar-wc3.browser.service.GameSettingService")
local GameSettingService = ____GameSettingService.default
____exports.default = __TS__Class()
local GameService = ____exports.default
GameService.name = "GameService"
function GameService.prototype.____constructor(self)
    __TS__New(GameSettingService)
end
return ____exports
