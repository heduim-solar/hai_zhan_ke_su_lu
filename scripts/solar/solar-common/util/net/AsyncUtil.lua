local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 8,["13"] = 8,["14"] = 8,["16"] = 8,["17"] = 17,["19"] = 18,["20"] = 19,["21"] = 17,["22"] = 25,["23"] = 25,["24"] = 25,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 29,["30"] = 30,["32"] = 25,["33"] = 41,["34"] = 42,["35"] = 43,["38"] = 46,["39"] = 47,["40"] = 49,["41"] = 49,["42"] = 49,["43"] = 50,["44"] = 49,["45"] = 49,["46"] = 52,["47"] = 52,["48"] = 53,["49"] = 53,["50"] = 53,["51"] = 53,["52"] = 54,["53"] = 53,["54"] = 53,["55"] = 52,["56"] = 52,["57"] = 52,["58"] = 41,["59"] = 11});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
____exports.default = __TS__Class()
local AsyncUtil = ____exports.default
AsyncUtil.name = "AsyncUtil"
function AsyncUtil.prototype.____constructor(self)
end
function AsyncUtil.getUUIDAsync(self)
    local ____exports_default_0, ____uuidAsync_1 = ____exports.default, "uuidAsync"
    ____exports_default_0[____uuidAsync_1] = ____exports_default_0[____uuidAsync_1] + 1
    return ____exports.default.uuidAsync
end
function AsyncUtil.run(self, fun, runPlayer)
    if runPlayer == nil then
        runPlayer = GetTriggerPlayer()
    end
    if runPlayer == GetLocalPlayer() then
        local old = isAsync
        isAsync = true
        fun(nil)
        isAsync = old
    end
end
function AsyncUtil.asyncHttpSyncResult(self, url, data, onResult)
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    local firstOfUsers = PlayerUtil:firstOfUsers()
    local key = "AsyncUtil:asyncHttpSyncResult:" .. tostring(BaseUtil.getUUID())
    SyncUtil.onSyncData(
        key,
        function(____, triggerPlayer, syncData)
            onResult(nil, syncData)
        end
    )
    ____exports.default:run(
        function()
            HttpRequest(
                url,
                data,
                function(result)
                    SyncUtil.syncData(key, result)
                end
            )
        end,
        firstOfUsers
    )
end
AsyncUtil.uuidAsync = 1
return ____exports
