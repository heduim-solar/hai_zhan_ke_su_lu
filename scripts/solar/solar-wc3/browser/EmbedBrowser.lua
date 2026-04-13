local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 8,["14"] = 9,["15"] = 10,["16"] = 11,["17"] = 12,["18"] = 13,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 18,["26"] = 21,["27"] = 17,["28"] = 23,["29"] = 25,["30"] = 8,["31"] = 5});
local ____exports = {}
local ____IpcMain = require("solar.solar-wc3.browser.IpcMain")
local IpcMain = ____IpcMain.default
____exports.default = __TS__Class()
local EmbedBrowser = ____exports.default
EmbedBrowser.name = "EmbedBrowser"
function EmbedBrowser.prototype.____constructor(self)
end
function EmbedBrowser.init0(self)
    local _require = require
    webEngine = _require("javascript")
    local newPath = ";webapp;webapp\\dist;webapp\\public;frontend;resource;"
    if webEngine.path then
        newPath = tostring(webEngine.path) .. newPath
    end
    webEngine.path = newPath
    webEngine.events = {}
    webEngine.events.on_debugf = function(level, file_name, line, message)
        if not message or (string.find(message, "Access-Control-Allow-Origin", nil, true) or 0) - 1 >= 0 then
            return
        end
        print((("WebLog:" .. tostring(webEngine.events.trigger_handle)) .. " =>  ") .. message)
    end
    IpcMain:_init0()
    return true
end
EmbedBrowser.justInvoke = ____exports.default:init0()
return ____exports
