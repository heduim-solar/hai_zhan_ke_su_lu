local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 7,["8"] = 7,["9"] = 7,["11"] = 7,["12"] = 13,["13"] = 13,["14"] = 13,["16"] = 14,["17"] = 15,["19"] = 17,["20"] = 13,["21"] = 20,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 22,["26"] = 20,["27"] = 29,["28"] = 30,["29"] = 31,["32"] = 34,["33"] = 35,["34"] = 36,["35"] = 36,["36"] = 36,["37"] = 37,["38"] = 38,["39"] = 39,["40"] = 36,["41"] = 36,["42"] = 29,["43"] = 49,["44"] = 50,["45"] = 51,["48"] = 54,["49"] = 55,["50"] = 56,["51"] = 56,["52"] = 56,["53"] = 57,["54"] = 58,["55"] = 60,["56"] = 61,["57"] = 56,["58"] = 56,["59"] = 49,["60"] = 76,["61"] = 77,["62"] = 78,["65"] = 81,["66"] = 82,["67"] = 83,["68"] = 84,["69"] = 84,["70"] = 84,["71"] = 85,["72"] = 86,["73"] = 88,["74"] = 90,["75"] = 91,["76"] = 92,["77"] = 93,["79"] = 95,["80"] = 97,["83"] = 101,["84"] = 102,["85"] = 103,["86"] = 104,["87"] = 105,["89"] = 107,["90"] = 108,["92"] = 110,["93"] = 112,["94"] = 84,["95"] = 84,["96"] = 76,["97"] = 119,["98"] = 119,["99"] = 119,["101"] = 120,["102"] = 121,["103"] = 122,["104"] = 123,["106"] = 124,["107"] = 124,["108"] = 125,["109"] = 126,["110"] = 127,["112"] = 129,["113"] = 130,["114"] = 135,["115"] = 135,["116"] = 135,["117"] = 135,["118"] = 124,["121"] = 119,["122"] = 8,["123"] = 69});
local ____exports = {}
____exports.default = __TS__Class()
local SyncUtil = ____exports.default
SyncUtil.name = "SyncUtil"
function SyncUtil.prototype.____constructor(self)
end
function SyncUtil.syncData(key, data)
    if data == nil then
        data = ""
    end
    if #data > ____exports.default.data_length_max then
        log.error("同步数据的长度超过976!可能会无法同步成功！")
    end
    DzSyncData(key, data)
end
function SyncUtil.syncObjData(key, data)
    DzSyncData(
        key,
        JSON:stringify(data)
    )
end
function SyncUtil.onSyncData(key, actionFunc)
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    local trigger = CreateTrigger()
    DzTriggerRegisterSyncData(trigger, key, false)
    TriggerAddAction(
        trigger,
        function()
            local triggerPlayer = DzGetTriggerSyncPlayer()
            local data = DzGetTriggerSyncData()
            actionFunc(nil, triggerPlayer, data)
        end
    )
end
function SyncUtil.onSyncObjData(key, actionFunc)
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    local trigger = CreateTrigger()
    DzTriggerRegisterSyncData(trigger, key, false)
    TriggerAddAction(
        trigger,
        function()
            local triggerPlayer = DzGetTriggerSyncPlayer()
            local dataStr = DzGetTriggerSyncData()
            local data = JSON:parse(dataStr)
            actionFunc(nil, triggerPlayer, data)
        end
    )
end
function SyncUtil.onSyncBigData(key, actionFunc)
    if isAsync then
        log.errorWithTraceBack("不能在异步中调用此方法！请在同步方法中执行！")
        return
    end
    key = "SL:BD:" .. key
    local trigger = CreateTrigger()
    DzTriggerRegisterSyncData(trigger, key, false)
    TriggerAddAction(
        trigger,
        function()
            local triggerPlayer = DzGetTriggerSyncPlayer()
            local dataStr = DzGetTriggerSyncData()
            local dataPacket = JSON:parse(dataStr)
            local keyDataPackets = ____exports.default.bigDataBuffer[key]
            if not keyDataPackets then
                keyDataPackets = {}
                ____exports.default.bigDataBuffer[key] = keyDataPackets
            end
            keyDataPackets[#keyDataPackets + 1] = dataPacket
            if #keyDataPackets < dataPacket.t then
                return
            end
            local bigData = ""
            local index = 0
            for ____, keyDataPacket in ipairs(keyDataPackets) do
                if keyDataPacket.i ~= index then
                    print((("数据包错乱:No." .. tostring(index)) .. " = ") .. tostring(keyDataPacket.i))
                end
                bigData = bigData .. keyDataPacket.d
                index = index + 1
            end
            actionFunc(nil, triggerPlayer, bigData)
            ____exports.default.bigDataBuffer[key] = {}
        end
    )
end
function SyncUtil.syncBigData(key, data)
    if data == nil then
        data = ""
    end
    key = "SL:BD:" .. key
    local oneDataMaxSize = ____exports.default.data_length_max - 276
    local length = #data
    local keyLength = math.floor(length / oneDataMaxSize) + 1
    do
        local i = 0
        while i < keyLength do
            local endIndex = (i + 1) * oneDataMaxSize
            if endIndex > length then
                endIndex = length
            end
            local oneData = __TS__StringSubstring(data, i * oneDataMaxSize, endIndex)
            local dataPacket = {i = i, t = keyLength, d = oneData}
            DzSyncData(
                key,
                JSON:stringify(dataPacket)
            )
            i = i + 1
        end
    end
end
SyncUtil.data_length_max = 976
SyncUtil.bigDataBuffer = {}
return ____exports
