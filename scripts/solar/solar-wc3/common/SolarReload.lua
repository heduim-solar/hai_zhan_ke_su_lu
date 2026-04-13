local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 7,["18"] = 7,["19"] = 7,["21"] = 7,["22"] = 15,["23"] = 16,["26"] = 19,["27"] = 20,["32"] = 35,["35"] = 24,["36"] = 25,["37"] = 26,["44"] = 38,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 44,["49"] = 44,["50"] = 45,["51"] = 42,["52"] = 48,["53"] = 49,["54"] = 50,["55"] = 51,["56"] = 51,["57"] = 52,["58"] = 49,["59"] = 55,["60"] = 56,["61"] = 57,["62"] = 57,["63"] = 57,["64"] = 57,["65"] = 57,["66"] = 57,["67"] = 57,["68"] = 58,["69"] = 58,["70"] = 59,["71"] = 56,["72"] = 62,["73"] = 63,["74"] = 64,["75"] = 64,["76"] = 64,["77"] = 64,["78"] = 64,["79"] = 64,["80"] = 64,["81"] = 65,["82"] = 65,["83"] = 66,["84"] = 63,["85"] = 69,["86"] = 70,["87"] = 71,["88"] = 72,["89"] = 72,["90"] = 73,["91"] = 70,["92"] = 79,["93"] = 80,["94"] = 83,["95"] = 83,["96"] = 83,["97"] = 83,["98"] = 83,["99"] = 83,["100"] = 83,["101"] = 84,["102"] = 84,["103"] = 84,["104"] = 85,["105"] = 84,["106"] = 84,["108"] = 88,["109"] = 89,["110"] = 15,["111"] = 93,["112"] = 94,["113"] = 95,["116"] = 97,["119"] = 100,["120"] = 101,["121"] = 102,["122"] = 103,["123"] = 104,["126"] = 106,["129"] = 109,["130"] = 110,["131"] = 111,["132"] = 112,["133"] = 113,["134"] = 114,["135"] = 115,["138"] = 103,["139"] = 93,["140"] = 121,["141"] = 122,["142"] = 123,["143"] = 124,["144"] = 124,["145"] = 124,["146"] = 124,["147"] = 124,["148"] = 124,["149"] = 124,["150"] = 125,["151"] = 127,["153"] = 129,["154"] = 130,["156"] = 132,["160"] = 134,["161"] = 135,["162"] = 136,["163"] = 137,["164"] = 138,["165"] = 140,["166"] = 141,["167"] = 142,["168"] = 143,["170"] = 145,["171"] = 146,["173"] = 148,["174"] = 149,["176"] = 151,["177"] = 152,["179"] = 154,["180"] = 155,["183"] = 159,["186"] = 157,["194"] = 163,["195"] = 164,["196"] = 165,["197"] = 166,["198"] = 121,["199"] = 8,["200"] = 9,["201"] = 10,["202"] = 11,["203"] = 12,["204"] = 13});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
local ____FrameDebug = require("solar.solar-wc3.lib.debug.FrameDebug")
local FrameDebug = ____FrameDebug.default
____exports.default = __TS__Class()
local SolarReload = ____exports.default
SolarReload.name = "SolarReload"
function SolarReload.prototype.____constructor(self)
end
function SolarReload.init(self)
    if _G.SolarReloadInitED then
        return
    end
    _G.SolarReloadInitED = true
    if not local_map_dir_path then
        return
    end
    do
        local function ____catch(e)
            print(e)
        end
        local ____try, ____hasReturned = pcall(function()
            log.debug("local_map_dir_path=" .. local_map_dir_path)
            if isEmbedBrowser and webEngine then
                webEngine.path = (((((((((local_map_dir_path .. "webapp\\dist;") .. local_map_dir_path) .. "webapp\\public\\;") .. local_map_dir_path) .. "webapp;") .. local_map_dir_path) .. "frontend;") .. local_map_dir_path) .. "resource;") .. tostring(webEngine.path)
            end
        end)
        if not ____try then
            ____catch(____hasReturned)
        end
    end
    ____exports.default:autoReload()
    local jassCreateTrigger = CreateTrigger
    _G.CreateTrigger = function()
        local hdl = jassCreateTrigger()
        local ____exports_default_TriggerHandle_0 = ____exports.default.TriggerHandle
        ____exports_default_TriggerHandle_0[#____exports_default_TriggerHandle_0 + 1] = hdl
        return hdl
    end
    local jassCreateTimer = CreateTimer
    _G.CreateTimer = function()
        local hdl = jassCreateTimer()
        local ____exports_default_TimerHandle_1 = ____exports.default.TimerHandle
        ____exports_default_TimerHandle_1[#____exports_default_TimerHandle_1 + 1] = hdl
        return hdl
    end
    local jassDzCreateFrameByTagName = DzCreateFrameByTagName
    _G.DzCreateFrameByTagName = function(frameType, name, parent, template, id)
        local hdl = jassDzCreateFrameByTagName(
            frameType,
            name,
            parent,
            template,
            id
        )
        local ____exports_default_frameHandle_2 = ____exports.default.frameHandle
        ____exports_default_frameHandle_2[#____exports_default_frameHandle_2 + 1] = hdl
        return hdl
    end
    local jassCreateUnit = CreateUnit
    _G.CreateUnit = function(id, unitid, x, y, face)
        local hdl = jassCreateUnit(
            id,
            unitid,
            x,
            y,
            face
        )
        local ____exports_default_unitHandle_3 = ____exports.default.unitHandle
        ____exports_default_unitHandle_3[#____exports_default_unitHandle_3 + 1] = hdl
        return hdl
    end
    local jassCreateItem = CreateItem
    _G.CreateItem = function(itemid, x, y)
        local hdl = jassCreateItem(itemid, x, y)
        local ____exports_default_itemHandle_4 = ____exports.default.itemHandle
        ____exports_default_itemHandle_4[#____exports_default_itemHandle_4 + 1] = hdl
        return hdl
    end
    if DzTriggerRegisterKeyEventByCode and not _G.HasTriggerRegisterKeyEvent then
        local t = jassCreateTrigger()
        DzTriggerRegisterKeyEventByCode(
            t,
            KeyCode.VK_F9,
            1,
            true,
            nil
        )
        TriggerAddAction(
            t,
            function()
                ____exports.default:reload()
            end
        )
    end
    _G.HasTriggerRegisterKeyEvent = true
    _G.reloadCount = 1
end
function SolarReload.autoReload(self)
    _G.scripts_lastModified = -1
    PACKAGE.loaded._SLA_temp = nil
    do
        pcall(function()
            require("_SLA_temp")
        end)
    end
    _G.scripts_last_reload = _G.scripts_lastModified
    local trigger = __TS__New(Trigger)
    trigger:registerTimerEvent(0.5, true)
    trigger:addAction(function()
        PACKAGE.loaded._SLA_temp = nil
        do
            pcall(function()
                require("_SLA_temp")
            end)
        end
        if _G.scripts_lastModified > _G.scripts_last_reload then
            _G.scripts_last_reload = _G.scripts_lastModified
            if time > 3000 then
                print("======自动更新======")
                print("_G.scripts_lastModified=" .. tostring(_G.scripts_lastModified))
                print("_G.scripts_last_reload=" .. tostring(_G.scripts_last_reload))
                ____exports.default:reload()
            end
        end
    end)
end
function SolarReload.reload(self)
    _G.reloadCount = _G.reloadCount + 1
    local info = (("No." .. tostring(_G.reloadCount)) .. " [重新加载代码脚本]!") .. tostring(time)
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        60,
        info
    )
    print(info)
    for loadedKey in pairs(PACKAGE.loaded) do
        do
            if loadedKey and (string.find(loadedKey, "solar.", nil, true) or 0) - 1 >= 0 then
                goto __continue23
            end
            PACKAGE.loaded[loadedKey] = nil
        end
        ::__continue23::
    end
    se:clear()
    SingletonUtil.cache:clear()
    SingletonUtil._sl_cache = {}
    FrameDebug.frameName = {}
    DataBase.dataBaseContext = {}
    for ____, handleElement in ipairs(____exports.default.TriggerHandle) do
        TriggerClearActions(handleElement)
        DisableTrigger(handleElement)
        DestroyTrigger(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.TimerHandle) do
        DestroyTimer(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.unitHandle) do
        RemoveUnit(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.itemHandle) do
        RemoveItem(handleElement)
    end
    for ____, handleElement in ipairs(____exports.default.frameHandle) do
        if handleElement and handleElement > 0 then
            do
                local function ____catch(e)
                    print((("销毁Frame出错:" .. tostring(handleElement)) .. "=") .. tostring(e))
                end
                local ____try, ____hasReturned = pcall(function()
                    DzDestroyFrame(handleElement)
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    end
    ____exports.default.TriggerHandle = {}
    ____exports.default.TimerHandle = {}
    ____exports.default.frameHandle = {}
    require("App")
end
SolarReload.config = {}
SolarReload.TriggerHandle = {}
SolarReload.TimerHandle = {}
SolarReload.frameHandle = {}
SolarReload.unitHandle = {}
SolarReload.itemHandle = {}
return ____exports
