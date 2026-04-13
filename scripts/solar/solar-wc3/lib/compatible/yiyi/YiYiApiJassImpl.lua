local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 14,["12"] = 14,["13"] = 14,["15"] = 14,["16"] = 21,["17"] = 22,["18"] = 23,["19"] = 24,["20"] = 25,["21"] = 26,["22"] = 27,["23"] = 28,["24"] = 29,["25"] = 30,["26"] = 31,["27"] = 32,["28"] = 34,["29"] = 35,["30"] = 37,["31"] = 38,["32"] = 39,["33"] = 40,["34"] = 42,["35"] = 21,["36"] = 45,["37"] = 46,["38"] = 47,["39"] = 48,["40"] = 49,["41"] = 50,["42"] = 51,["44"] = 46,["45"] = 54,["46"] = 55,["47"] = 56,["48"] = 57,["49"] = 58,["50"] = 59,["51"] = 60,["54"] = 54,["55"] = 64,["56"] = 65,["57"] = 66,["58"] = 67,["59"] = 68,["60"] = 69,["61"] = 70,["64"] = 64,["65"] = 74,["66"] = 75,["67"] = 76,["69"] = 74,["70"] = 79,["71"] = 80,["72"] = 81,["74"] = 79,["75"] = 45,["76"] = 89,["77"] = 90,["78"] = 91,["79"] = 92,["80"] = 93,["81"] = 94,["82"] = 89,["83"] = 97,["84"] = 98,["85"] = 99,["86"] = 100,["87"] = 101,["88"] = 102,["89"] = 97,["90"] = 105,["91"] = 106,["92"] = 107,["93"] = 108,["94"] = 109,["95"] = 110,["96"] = 105,["97"] = 113,["98"] = 114,["99"] = 115,["100"] = 116,["101"] = 117,["102"] = 118,["103"] = 113,["104"] = 124,["105"] = 125,["106"] = 126,["107"] = 127,["108"] = 128,["109"] = 129,["110"] = 130,["111"] = 124,["112"] = 133,["113"] = 134,["114"] = 135,["115"] = 136,["116"] = 137,["117"] = 138,["118"] = 133,["119"] = 141,["120"] = 142,["121"] = 143,["122"] = 144,["123"] = 141,["124"] = 147,["125"] = 148,["126"] = 149,["127"] = 150,["128"] = 147,["129"] = 154,["130"] = 155,["131"] = 156,["132"] = 157,["133"] = 158,["134"] = 159,["135"] = 154,["136"] = 162,["137"] = 163,["138"] = 164,["140"] = 166,["141"] = 167,["142"] = 168,["143"] = 169,["144"] = 170,["145"] = 171,["146"] = 172,["147"] = 162,["148"] = 176,["149"] = 177,["150"] = 178,["151"] = 179,["152"] = 180,["153"] = 181,["154"] = 182,["156"] = 184,["157"] = 176,["158"] = 188,["159"] = 189,["160"] = 190,["161"] = 191,["162"] = 192,["163"] = 193,["165"] = 195,["166"] = 197,["167"] = 197,["170"] = 200,["171"] = 201,["172"] = 201,["173"] = 202,["174"] = 188,["175"] = 206,["176"] = 207,["177"] = 208,["178"] = 209,["179"] = 210,["180"] = 211,["182"] = 213,["183"] = 215,["184"] = 215,["187"] = 218,["188"] = 219,["189"] = 219,["190"] = 220,["191"] = 206,["192"] = 224,["193"] = 225,["194"] = 226,["195"] = 227,["197"] = 229,["198"] = 229,["199"] = 230,["200"] = 230,["201"] = 230,["202"] = 231,["203"] = 230,["204"] = 230,["205"] = 224,["206"] = 236,["207"] = 237,["208"] = 237,["209"] = 238,["210"] = 238,["211"] = 238,["212"] = 239,["213"] = 238,["214"] = 238,["215"] = 236,["216"] = 15,["217"] = 16,["218"] = 17,["219"] = 18,["220"] = 19});
local ____exports = {}
local ____JassBridgeUtil = require("solar.solar-wc3.util.game.JassBridgeUtil")
local JassBridgeUtil = ____JassBridgeUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local sl_bridge = nil
____exports.default = __TS__Class()
local YiYiApiJassImpl = ____exports.default
YiYiApiJassImpl.name = "YiYiApiJassImpl"
function YiYiApiJassImpl.prototype.____constructor(self)
end
function YiYiApiJassImpl.init()
    sl_bridge = require("jass.globals").sl_bridge
    JassBridgeUtil.sl_bridge = sl_bridge
    _G.InitGameCache = ____exports.default.sl_bridge_InitGameCache
    _G.SaveGameCache = ____exports.default.sl_bridge_SaveGameCache
    _G.DzCreateFrame = ____exports.default.sl_bridge_DzCreateFrame
    _G.DzCreateFrameByTagName = ____exports.default.sl_bridge_DzCreateFrameByTagName
    _G.DzFrameSetScriptByCode = ____exports.default.sl_bridge_DzFrameSetScriptByCode
    _G.DzTriggerRegisterKeyEventByCode = ____exports.default.sl_bridge_DzTriggerRegisterKeyEventByCode
    _G.DzTriggerRegisterMouseEventByCode = ____exports.default.sl_bridge_DzTriggerRegisterMouseEventByCode
    _G.DzTriggerRegisterMouseMoveEventByCode = ____exports.default.sl_bridge_DzTriggerRegisterMouseMoveEventByCode
    _G.DzFrameSetUpdateCallbackByCode = ____exports.default.sl_bridge_DzFrameSetUpdateCallbackByCode
    _G.StoreInteger = ____exports.default.sl_bridge_StoreInteger
    _G.StoreString = ____exports.default.sl_bridge_StoreString
    _G.GetStoredInteger = ____exports.default.sl_bridge_GetStoredInteger
    _G.GetStoredReal = ____exports.default.sl_bridge_GetStoredReal
    _G.GetStoredBoolean = ____exports.default.sl_bridge_GetStoredBoolean
    _G.GetStoredString = ____exports.default.sl_bridge_GetStoredString
    ____exports.default.hook_sl_bridge_ui_callback()
end
function YiYiApiJassImpl.hook_sl_bridge_ui_callback()
    _G.on_slbu_cb = function()
        local event_id = LoadInteger(sl_bridge, 3, 3)
        local triggerUIEventFrame = LoadInteger(sl_bridge, 3, 4)
        local callbackFun = ____exports.default.uiCallback[(tostring(event_id) .. "_") .. tostring(triggerUIEventFrame)]
        if callbackFun then
            callbackFun()
        end
    end
    _G.on_slbk_cb = function()
        local status = LoadInteger(sl_bridge, 4, 4)
        local key = LoadInteger(sl_bridge, 4, 5)
        local callbackFun = ____exports.default.keyCallback[(tostring(key) .. "_") .. tostring(status)]
        if callbackFun then
            for ____, fun in ipairs(callbackFun) do
                fun()
            end
        end
    end
    _G.on_slbm_cb = function()
        local status = LoadInteger(sl_bridge, 5, 5)
        local key = LoadInteger(sl_bridge, 5, 6)
        local callbackFun = ____exports.default.mouseCallback[(tostring(key) .. "_") .. tostring(status)]
        if callbackFun then
            for ____, fun in ipairs(callbackFun) do
                fun()
            end
        end
    end
    _G.on_slbmm_cb = function()
        for ____, fun in ipairs(____exports.default.mouseMoveEventCallbacks) do
            fun()
        end
    end
    _G.on_slbfu_cb = function()
        for ____, fun in ipairs(____exports.default.frameUpdateCallback) do
            fun()
        end
    end
end
function YiYiApiJassImpl.sl_bridge_GetStoredString(cache, missionKey, key)
    require("jass.globals").sl_bridge_gamecache = cache
    SaveStr(sl_bridge, 1, 2, missionKey)
    SaveStr(sl_bridge, 1, 3, key)
    DzExecuteFunc("sl_bridge_GetStoredString")
    return JassBridgeUtil.getResultAsStr()
end
function YiYiApiJassImpl.sl_bridge_GetStoredBoolean(cache, missionKey, key)
    require("jass.globals").sl_bridge_gamecache = cache
    SaveStr(sl_bridge, 1, 2, missionKey)
    SaveStr(sl_bridge, 1, 3, key)
    DzExecuteFunc("sl_bridge_GetStoredBoolean")
    return JassBridgeUtil.getResultAsBoolean()
end
function YiYiApiJassImpl.sl_bridge_GetStoredReal(cache, missionKey, key)
    require("jass.globals").sl_bridge_gamecache = cache
    SaveStr(sl_bridge, 1, 2, missionKey)
    SaveStr(sl_bridge, 1, 3, key)
    DzExecuteFunc("sl_bridge_GetStoredReal")
    return JassBridgeUtil.getResultAsReal()
end
function YiYiApiJassImpl.sl_bridge_GetStoredInteger(cache, missionKey, key)
    require("jass.globals").sl_bridge_gamecache = cache
    SaveStr(sl_bridge, 1, 2, missionKey)
    SaveStr(sl_bridge, 1, 3, key)
    DzExecuteFunc("sl_bridge_GetStoredInteger")
    return JassBridgeUtil.getResultAsInt()
end
function YiYiApiJassImpl.sl_bridge_StoreString(cache, missionKey, key, value)
    require("jass.globals").sl_bridge_gamecache = cache
    SaveStr(sl_bridge, 1, 2, missionKey)
    SaveStr(sl_bridge, 1, 3, key)
    SaveStr(sl_bridge, 1, 4, value)
    DzExecuteFunc("sl_bridge_StoreString")
    return true
end
function YiYiApiJassImpl.sl_bridge_StoreInteger(cache, missionKey, key, value)
    require("jass.globals").sl_bridge_gamecache = cache
    SaveStr(sl_bridge, 1, 2, missionKey)
    SaveStr(sl_bridge, 1, 3, key)
    SaveInteger(sl_bridge, 1, 4, value)
    DzExecuteFunc("sl_bridge_StoreInteger")
end
function YiYiApiJassImpl.sl_bridge_SaveGameCache(whichCache)
    require("jass.globals").sl_bridge_gamecache = whichCache
    DzExecuteFunc("sl_bridge_SaveGameCache")
    return JassBridgeUtil.getResultAsBoolean()
end
function YiYiApiJassImpl.sl_bridge_InitGameCache(campaignFile)
    SaveStr(sl_bridge, 1, 1, campaignFile)
    DzExecuteFunc("sl_bridge_InitGameCache")
    return require("jass.globals").sl_bridge_gamecache
end
function YiYiApiJassImpl.sl_bridge_DzCreateFrame(frame, parent, id)
    SaveStr(sl_bridge, 1, 1, frame)
    SaveInteger(sl_bridge, 1, 2, parent)
    SaveInteger(sl_bridge, 1, 3, id)
    DzExecuteFunc("sl_bridge_DzCreateFrame")
    return JassBridgeUtil.getResultAsInt()
end
function YiYiApiJassImpl.sl_bridge_DzCreateFrameByTagName(frameType, name, parent, template, id)
    if template == "" then
        template = " "
    end
    SaveStr(sl_bridge, 1, 1, frameType)
    SaveStr(sl_bridge, 1, 2, name)
    SaveInteger(sl_bridge, 1, 3, parent)
    SaveStr(sl_bridge, 1, 4, template)
    SaveInteger(sl_bridge, 1, 5, id)
    DzExecuteFunc("sl_bridge_DzCreateFrameByTagName")
    return JassBridgeUtil.getResultAsInt()
end
function YiYiApiJassImpl.sl_bridge_DzFrameSetScriptByCode(frame, eventId, funcHandle, sync)
    SaveInteger(sl_bridge, 1, 1, frame)
    SaveInteger(sl_bridge, 1, 2, eventId)
    ____exports.default.uiCallback[(tostring(eventId) .. "_") .. tostring(frame)] = funcHandle
    SaveBoolean(sl_bridge, 1, 4, sync)
    if sync == true then
        print("此环境下FrameSetScriptByCode sync只能为false，如需同步请自行手动同步。")
    end
    DzExecuteFunc("sl_bridge_DzFrameSetScriptByCode")
end
function YiYiApiJassImpl.sl_bridge_DzTriggerRegisterKeyEventByCode(trig, key, status, sync, funcHandle)
    SaveInteger(sl_bridge, 1, 2, key)
    SaveInteger(sl_bridge, 1, 3, status)
    SaveBoolean(sl_bridge, 1, 4, sync)
    if sync == true then
        print("此环境下TriggerRegisterKeyEventByCode sync只能为false，如需同步请自行手动同步。")
    end
    if ____exports.default.keyCallback[(tostring(key) .. "_") .. tostring(status)] ~= nil then
        local ____exports_default_keyCallback_index_0 = ____exports.default.keyCallback[(tostring(key) .. "_") .. tostring(status)]
        ____exports_default_keyCallback_index_0[#____exports_default_keyCallback_index_0 + 1] = funcHandle
        return
    end
    ____exports.default.keyCallback[(tostring(key) .. "_") .. tostring(status)] = {}
    local ____exports_default_keyCallback_index_1 = ____exports.default.keyCallback[(tostring(key) .. "_") .. tostring(status)]
    ____exports_default_keyCallback_index_1[#____exports_default_keyCallback_index_1 + 1] = funcHandle
    DzExecuteFunc("sl_bridge_DzTriggerRegisterKeyEventByCode")
end
function YiYiApiJassImpl.sl_bridge_DzTriggerRegisterMouseEventByCode(trig, btn, status, sync, funcHandle)
    SaveInteger(sl_bridge, 1, 2, btn)
    SaveInteger(sl_bridge, 1, 3, status)
    SaveBoolean(sl_bridge, 1, 4, sync)
    if sync == true then
        print("此环境下TriggerRegisterMouseEventByCode sync只能为false，如需同步请自行手动同步。")
    end
    if ____exports.default.mouseCallback[(tostring(btn) .. "_") .. tostring(status)] ~= nil then
        local ____exports_default_mouseCallback_index_2 = ____exports.default.mouseCallback[(tostring(btn) .. "_") .. tostring(status)]
        ____exports_default_mouseCallback_index_2[#____exports_default_mouseCallback_index_2 + 1] = funcHandle
        return
    end
    ____exports.default.mouseCallback[(tostring(btn) .. "_") .. tostring(status)] = {}
    local ____exports_default_mouseCallback_index_3 = ____exports.default.mouseCallback[(tostring(btn) .. "_") .. tostring(status)]
    ____exports_default_mouseCallback_index_3[#____exports_default_mouseCallback_index_3 + 1] = funcHandle
    DzExecuteFunc("sl_bridge_DzTriggerRegisterMouseEventByCode")
end
function YiYiApiJassImpl.sl_bridge_DzTriggerRegisterMouseMoveEventByCode(trig, sync, funcHandle)
    SaveBoolean(sl_bridge, 1, 2, sync)
    if sync == true then
        print("此环境下TriggerRegisterMouseMoveEventByCode sync只能为false，如需同步请自行手动同步。")
    end
    local ____exports_default_mouseMoveEventCallbacks_4 = ____exports.default.mouseMoveEventCallbacks
    ____exports_default_mouseMoveEventCallbacks_4[#____exports_default_mouseMoveEventCallbacks_4 + 1] = funcHandle
    SingletonUtil:executeOnce(
        "init_sl_bridge_DzTriggerRegisterMouseMoveEventByCode",
        function()
            DzExecuteFunc("init_sl_bridge_DzTriggerRegisterMouseMoveEventByCode")
        end
    )
end
function YiYiApiJassImpl.sl_bridge_DzFrameSetUpdateCallbackByCode(funcHandle)
    local ____exports_default_frameUpdateCallback_5 = ____exports.default.frameUpdateCallback
    ____exports_default_frameUpdateCallback_5[#____exports_default_frameUpdateCallback_5 + 1] = funcHandle
    SingletonUtil:executeOnce(
        "init_sl_bridge_DzFrameSetUpdateCallbackByCode",
        function()
            DzExecuteFunc("init_sl_bridge_DzFrameSetUpdateCallbackByCode")
        end
    )
end
YiYiApiJassImpl.uiCallback = {}
YiYiApiJassImpl.keyCallback = {}
YiYiApiJassImpl.mouseCallback = {}
YiYiApiJassImpl.mouseMoveEventCallbacks = {}
YiYiApiJassImpl.frameUpdateCallback = {}
return ____exports
