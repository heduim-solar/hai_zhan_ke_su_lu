local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 7,["7"] = 7,["8"] = 9,["9"] = 10,["10"] = 10,["11"] = 10,["13"] = 10,["14"] = 15,["15"] = 16,["16"] = 17,["17"] = 16,["18"] = 15,["19"] = 26,["20"] = 27,["21"] = 26,["22"] = 35,["23"] = 36,["24"] = 37,["25"] = 37,["26"] = 37,["27"] = 38,["28"] = 37,["29"] = 37,["30"] = 35,["31"] = 51,["32"] = 52,["33"] = 51,["34"] = 57,["36"] = 58,["37"] = 59,["38"] = 63,["39"] = 65,["40"] = 66,["42"] = 57,["43"] = 74,["44"] = 75,["45"] = 79,["46"] = 74,["47"] = 86,["48"] = 86,["49"] = 87,["50"] = 88,["51"] = 89,["53"] = 90,["54"] = 90,["55"] = 91,["56"] = 92,["57"] = 93,["58"] = 94,["59"] = 95,["60"] = 96,["61"] = 97,["62"] = 98,["64"] = 100,["67"] = 106,["69"] = 108,["70"] = 90,["73"] = 110,["74"] = 111,["75"] = 86,["76"] = 118,["77"] = 119,["78"] = 120,["79"] = 118,["80"] = 126,["81"] = 127,["82"] = 128,["83"] = 129,["84"] = 130,["85"] = 126,["86"] = 133,["87"] = 134,["88"] = 134,["89"] = 134,["90"] = 135,["91"] = 136,["92"] = 134,["93"] = 134,["94"] = 133,["95"] = 140,["96"] = 141,["97"] = 141,["98"] = 141,["101"] = 150,["104"] = 143,["105"] = 144,["106"] = 145,["107"] = 146,["109"] = 148,["115"] = 141,["116"] = 141,["117"] = 140,["118"] = 156,["119"] = 157,["120"] = 157,["121"] = 157,["124"] = 167,["127"] = 159,["128"] = 160,["129"] = 161,["130"] = 162,["132"] = 164,["133"] = 165,["139"] = 157,["140"] = 157,["141"] = 156,["142"] = 173,["143"] = 174,["144"] = 174,["145"] = 174,["148"] = 178,["151"] = 176,["157"] = 174,["158"] = 174,["159"] = 173,["160"] = 44,["161"] = 55});
local ____exports = {}
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local luaScriptFunCache = {}
____exports.default = __TS__Class()
local IpcMain = ____exports.default
IpcMain.name = "IpcMain"
function IpcMain.prototype.____constructor(self)
end
function IpcMain.onObjData(self, channel, listener)
    webEngine.events[channel] = function(dataStr)
        listener(JSON:parse(dataStr))
    end
end
function IpcMain.on(self, channel, listener)
    webEngine.events[channel] = listener
end
function IpcMain.onSync(self, channel, actionFunc)
    SyncUtil.onSyncData(channel, actionFunc)
    ____exports.default:on(
        channel,
        function(dataStr)
            SyncUtil.syncData(channel, dataStr)
        end
    )
end
function IpcMain.onRequest(self, channel, listener)
    ____exports.default:onObjData(channel, listener)
end
function IpcMain.request(self, channel, onResponse, data)
    local ____exports_default_0, ____sl_reqIdIndex_1 = ____exports.default, "_sl_reqIdIndex"
    ____exports_default_0[____sl_reqIdIndex_1] = ____exports_default_0[____sl_reqIdIndex_1] + 1
    local reqData = {id = ____exports.default._sl_reqIdIndex, data = data}
    ____exports.default:send(channel, reqData)
    if onResponse ~= nil then
        ____exports.default.onResponseMap[reqData.id] = onResponse
    end
end
function IpcMain.response(self, reqId, data)
    local objData = {id = reqId, data = data}
    ____exports.default:send("_SL_RES", objData)
end
function IpcMain.send(self, channel, ...)
    local data = {...}
    local args = {...}
    local buffer = {}
    local paramCount = #data
    do
        local i = 0
        while i < paramCount do
            local value = args[i + 1]
            local s = value
            if type(value) == "table" then
                s = JSON:stringify(value)
            elseif type(value) == "number" then
                local int, float = math.modf(value)
                if float == 0 then
                    s = tostring(int)
                else
                    s = tostring(value)
                end
            else
                s = tostring(value)
            end
            buffer[#buffer + 1] = s:gsub("\\", "\\\\"):gsub("blp", "bmp")
            i = i + 1
        end
    end
    local executeFun = webEngine[channel]
    executeFun(table.unpack(buffer))
end
function IpcMain.executeJavaScript(self, javaScript)
    local executeFun = webEngine.execute
    executeFun(javaScript .. "\r\n")
end
function IpcMain._init0(self)
    ____exports.default:initOnResponseListener()
    ____exports.default:initOnExecuteLuaScript()
    ____exports.default:initOnExecuteLuaScriptAndReturnValue()
    ____exports.default:initOnGetGV()
end
function IpcMain.initOnResponseListener(self)
    ____exports.default:onObjData(
        "_SL_RES",
        function(objData)
            ____exports.default.onResponseMap[objData.id](objData.data)
            ____exports.default.onResponseMap[objData.id] = nil
        end
    )
end
function IpcMain.initOnExecuteLuaScript(self)
    ____exports.default:on(
        "_SL_ELS",
        function(luaScript)
            do
                local function ____catch(e)
                    print(e)
                end
                local ____try, ____hasReturned = pcall(function()
                    local fun = luaScriptFunCache[luaScript]
                    if not fun then
                        fun = load(luaScript)
                        luaScriptFunCache[luaScript] = fun
                    end
                    fun(nil)
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    )
end
function IpcMain.initOnExecuteLuaScriptAndReturnValue(self)
    ____exports.default:onRequest(
        "_SL_ELSARV",
        function(reqData)
            do
                local function ____catch(e)
                    print(e)
                end
                local ____try, ____hasReturned = pcall(function()
                    local fun = luaScriptFunCache[reqData.data]
                    if not fun then
                        fun = load(reqData.data)
                        luaScriptFunCache[reqData.data] = fun
                    end
                    local result = fun(nil)
                    ____exports.default:response(reqData.id, result)
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    )
end
function IpcMain.initOnGetGV(self)
    ____exports.default:onRequest(
        "_SL_GGV",
        function(reqData)
            do
                local function ____catch(e)
                    print(e)
                end
                local ____try, ____hasReturned = pcall(function()
                    ____exports.default:response(reqData.id, gv[reqData.data])
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    )
end
IpcMain.onResponseMap = {}
IpcMain._sl_reqIdIndex = 0
return ____exports
