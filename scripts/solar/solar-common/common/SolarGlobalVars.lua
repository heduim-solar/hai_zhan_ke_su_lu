local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 6,["14"] = 6,["15"] = 6,["17"] = 6,["18"] = 15,["19"] = 15,["20"] = 15,["22"] = 15,["23"] = 15,["25"] = 16,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 18,["30"] = 17,["31"] = 17,["32"] = 15,["33"] = 23,["34"] = 24,["35"] = 25,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 33,["44"] = 34,["45"] = 35,["47"] = 30,["48"] = 38,["49"] = 39,["50"] = 23,["51"] = 46,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 51,["57"] = 52,["58"] = 53,["60"] = 55,["61"] = 56,["63"] = 58,["64"] = 59,["66"] = 61,["67"] = 62,["68"] = 63,["69"] = 65,["70"] = 63,["71"] = 67,["72"] = 68,["73"] = 69,["75"] = 71,["76"] = 67,["77"] = 73,["78"] = 46,["79"] = 77,["80"] = 79,["81"] = 77,["82"] = 7,["83"] = 8,["84"] = 85});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____FourCC = require("solar.solar-common.common.FourCC")
local FourCC = ____FourCC.default
local ____SolarEvent = require("solar.solar-common.common.SolarEvent")
local SolarEvent = ____SolarEvent.default
____exports.default = __TS__Class()
local SolarGlobalVars = ____exports.default
SolarGlobalVars.name = "SolarGlobalVars"
function SolarGlobalVars.prototype.____constructor(self)
end
function SolarGlobalVars.init(self, ____debug, egp_enable)
    if ____debug == nil then
        ____debug = isDebug
    end
    if egp_enable == nil then
        egp_enable = ____debug
    end
    ____exports.default:printLogo()
    se:playerChat(
        "-sl-version",
        function()
            BJDebugMsg("当前游戏的太阳TS框架版本号为:" .. tostring(_sl_version))
        end
    )
end
function SolarGlobalVars.init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    _G.FourCC = FourCC.string2id
    _G.id2string = FourCC.id2string
    _G.asyncExec = function(asyncPlayer, fun)
        if asyncPlayer == GetLocalPlayer() then
            local old = isAsync
            isAsync = true
            fun(nil)
            isAsync = old
        end
    end
    ____exports.default:initBaseVars()
    return true
end
function SolarGlobalVars.initBaseVars(self)
    gameName = "太阳TS地图"
    _sl_version = 6.25
    isBigAttributeMode = false
    handleReuseMinTime = 2.99
    isAsync = false
    if settings == nil then
        settings = {fontPath = "Fonts\\dfst-m3u.ttf"}
    end
    if gv == nil then
        gv = {}
    end
    if globals == nil then
        globals = _G
    end
    db = DataBase
    sd = DataBase.sd
    _G.deleteKey = function(obj, key)
        obj[key] = nil
    end
    _G.IsHandle = function(h)
        if h == nil or h == 0 then
            return false
        end
        return true
    end
    se = __TS__New(SolarEvent)
end
function SolarGlobalVars.printLogo(self)
    print(____exports.default.logoText)
end
SolarGlobalVars.isInit = false
SolarGlobalVars.justInvoke = ____exports.default:init0()
SolarGlobalVars.logoText = (((((("\n     ________      ________     ___          ________     ________\n" .. "    |\\   ____\\    |\\   __  \\   |\\  \\        |\\   __  \\   |\\   __  \\\n") .. "    \\ \\  \\___|_   \\ \\  \\|\\  \\  \\ \\  \\       \\ \\  \\|\\  \\  \\ \\  \\|\\  \\\n") .. "     \\ \\_____  \\   \\ \\  \\\\\\  \\  \\ \\  \\       \\ \\   __  \\  \\ \\   _  _\\\n") .. "      \\|____|\\  \\   \\ \\  \\\\\\  \\  \\ \\  \\       \\ \\  \\ \\  \\  \\ \\  \\\\  \\|\n") .. "        ____\\_\\  \\   \\ \\  \\\\\\  \\  \\ \\  \\____   \\ \\  \\ \\  \\  \\ \\  \\\\  \\\n") .. "       |\\_________\\   \\ \\_______\\  \\ \\_______\\  \\ \\__\\ \\__\\  \\ \\__\\\\ _\\\n") .. "       \\|_________|    \\|_______|   \\|_______|   \\|__|\\|__|   \\|__|\\|__|\n"
return ____exports
