local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 7,["14"] = 8,["17"] = 11,["18"] = 14,["19"] = 15,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 16,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 23,["30"] = 24,["31"] = 25,["33"] = 28,["34"] = 15,["35"] = 7,["36"] = 5});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local HandleDebug = ____exports.default
HandleDebug.name = "HandleDebug"
function HandleDebug.prototype.____constructor(self)
end
function HandleDebug.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    local oldCreateUnit = CreateUnit
    _G.CreateUnit = function(id, unitid, x, y, face)
        local hdl = oldCreateUnit(
            id,
            unitid,
            x,
            y,
            face
        )
        local solarData = DataBase:getUnitSolarData(hdl, false)
        if solarData ~= nil then
            print((((tostring(time) .. ":发现handle对应的solarData重用:") .. GetUnitName(hdl)) .. " hId=") .. tostring(GetHandleId(hdl)))
            print_r(solarData)
            log.errorWithTraceBack("发现solarData重用。请检查已被回收的handle是否及时清理对应的solarData。" .. "(或单位死亡后清理solarData后又给死亡单位新建了solarData).不需要的英雄单位可以使用RemoveUnit移除英雄")
        end
        return hdl
    end
end
HandleDebug.is_init = false
return ____exports
