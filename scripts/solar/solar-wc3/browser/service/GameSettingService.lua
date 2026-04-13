local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 7,["9"] = 7,["10"] = 7,["12"] = 10,["13"] = 11,["14"] = 9,["15"] = 15,["16"] = 16,["17"] = 16,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 20,["23"] = 21,["24"] = 22,["26"] = 16,["27"] = 16,["28"] = 15,["29"] = 27,["30"] = 28,["31"] = 28,["32"] = 28,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 32,["37"] = 33,["39"] = 35,["40"] = 28,["41"] = 28,["42"] = 27});
local ____exports = {}
local ____IpcMain = require("solar.solar-wc3.browser.IpcMain")
local IpcMain = ____IpcMain.default
____exports.default = __TS__Class()
local GameSettingService = ____exports.default
GameSettingService.name = "GameSettingService"
function GameSettingService.prototype.____constructor(self)
    self:regSetSettings()
    self:regSetPlayerIdSetting()
end
function GameSettingService.prototype.regSetSettings(self)
    IpcMain:onSync(
        "_SL_setSettings",
        function(____, t, dataStr)
            local data = JSON:parse(dataStr)
            settings[data.key] = data.value
            if "gameDifficulty" == data.key then
                se:emit("选择难度", data.value)
            elseif "gameMode" == data.key then
                se:emit("选择模式", data.value)
            end
        end
    )
end
function GameSettingService.prototype.regSetPlayerIdSetting(self)
    IpcMain:onSync(
        "_SL_setPlayerIdSetting",
        function(____, t, dataStr)
            local data = JSON:parse(dataStr)
            local obj = settings[data.key]
            if not obj then
                obj = {}
                settings[data.key] = obj
            end
            obj[GetPlayerId(t)] = data.value
        end
    )
end
return ____exports
