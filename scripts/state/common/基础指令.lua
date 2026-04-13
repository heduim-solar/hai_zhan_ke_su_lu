local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 7,["19"] = 10,["20"] = 10,["21"] = 10,["22"] = 11,["23"] = 10,["24"] = 10,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 20,["31"] = 23,["32"] = 24,["33"] = 18,["34"] = 18,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 28,["39"] = 27,["40"] = 27,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 32,["45"] = 31,["46"] = 31,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 37,["51"] = 36,["52"] = 36,["53"] = 9,["54"] = 43,["55"] = 44,["58"] = 47,["59"] = 48,["60"] = 49,["61"] = 50,["62"] = 50,["63"] = 50,["64"] = 51,["65"] = 50,["66"] = 50,["67"] = 43});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local runtime = require("jass.runtime")
____exports.default = __TS__Class()
local _____57FA_7840_6307_4EE4 = ____exports.default
_____57FA_7840_6307_4EE4.name = "基础指令"
function _____57FA_7840_6307_4EE4.prototype.____constructor(self)
    InputUtil:onKeyPressed(
        KeyCode.VK_F7,
        function()
            ____exports.default["修复字体重叠"](____exports.default)
        end
    )
    se:onPlayerChat(
        "-end",
        function(e)
            if PlayerUtil:firstOfUsers() ~= e.triggerPlayer then
                return
            end
            PlayerUtil:message((((("玩家" .. tostring(e.triggerPlayerId)) .. 1) .. ":") .. e.triggerPlayerName) .. " 手动结束了游戏!")
            EndGame(true)
        end
    )
    se:onPlayerChat(
        "-open-console",
        function()
            runtime.console = true
        end
    )
    se:onPlayerChat(
        "-off-console",
        function()
            runtime.console = false
        end
    )
    BaseUtil.runLater(
        60 * 60 * 7 + 30,
        function()
            EndGame(true)
        end
    )
end
_____57FA_7840_6307_4EE4["修复字体重叠"] = function(self)
    if not DzIsWindowActive() then
        return
    end
    local windowWidth = DzGetWindowWidth()
    local windowHeight = DzGetWindowHeight()
    DzChangeWindowSize(80, 60)
    BaseUtil.runLater(
        0.01,
        function()
            DzChangeWindowSize(windowWidth, windowHeight)
        end
    )
end
return ____exports
