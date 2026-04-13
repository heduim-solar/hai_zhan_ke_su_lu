local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 9,["25"] = 9,["26"] = 10,["27"] = 10,["28"] = 11,["29"] = 11,["30"] = 12,["31"] = 12,["32"] = 13,["33"] = 13,["34"] = 14,["35"] = 14,["36"] = 15,["37"] = 15,["38"] = 16,["39"] = 16,["40"] = 17,["41"] = 17,["42"] = 19,["43"] = 20,["44"] = 21,["45"] = 22,["46"] = 23,["47"] = 24,["48"] = 25,["49"] = 26,["50"] = 27,["51"] = 28,["52"] = 29,["53"] = 31,["54"] = 31,["55"] = 31,["57"] = 31,["58"] = 40,["59"] = 40,["60"] = 40,["62"] = 40,["63"] = 40,["65"] = 41,["68"] = 44,["69"] = 46,["70"] = 47,["71"] = 48,["72"] = 49,["73"] = 51,["74"] = 52,["76"] = 54,["79"] = 57,["81"] = 59,["82"] = 60,["83"] = 40,["84"] = 63,["85"] = 64,["86"] = 65,["87"] = 66,["88"] = 67,["90"] = 70,["91"] = 72,["92"] = 73,["94"] = 76,["95"] = 77,["97"] = 63,["98"] = 82,["99"] = 83,["100"] = 84,["102"] = 86,["105"] = 88,["108"] = 91,["109"] = 92,["110"] = 93,["112"] = 95,["113"] = 97,["114"] = 98,["115"] = 99,["116"] = 100,["117"] = 101,["118"] = 102,["119"] = 103,["120"] = 105,["121"] = 107,["124"] = 111,["125"] = 114,["126"] = 117,["127"] = 119,["128"] = 121,["129"] = 122,["130"] = 123,["131"] = 124,["132"] = 125,["133"] = 126,["134"] = 126,["136"] = 127,["137"] = 82,["138"] = 131,["139"] = 133,["141"] = 135,["142"] = 136,["144"] = 139,["148"] = 131,["149"] = 146,["150"] = 147,["151"] = 148,["152"] = 150,["153"] = 151,["154"] = 150,["155"] = 154,["156"] = 155,["157"] = 157,["158"] = 158,["159"] = 159,["161"] = 162,["162"] = 164,["163"] = 165,["164"] = 166,["166"] = 171,["167"] = 172,["168"] = 146,["169"] = 176,["170"] = 177,["171"] = 178,["172"] = 179,["173"] = 180,["174"] = 181,["175"] = 182,["176"] = 183,["177"] = 186,["178"] = 187,["179"] = 188,["180"] = 189,["181"] = 190,["182"] = 191,["183"] = 193,["184"] = 195,["185"] = 196,["186"] = 195,["187"] = 199,["188"] = 200,["189"] = 201,["190"] = 202,["193"] = 205,["194"] = 207,["195"] = 208,["198"] = 212,["199"] = 200,["200"] = 214,["201"] = 215,["202"] = 216,["203"] = 217,["206"] = 220,["207"] = 222,["208"] = 223,["211"] = 226,["212"] = 215,["213"] = 228,["214"] = 229,["218"] = 232,["219"] = 232,["220"] = 233,["221"] = 234,["225"] = 232,["228"] = 228,["229"] = 240,["230"] = 242,["231"] = 243,["232"] = 240,["233"] = 246,["234"] = 248,["235"] = 249,["237"] = 246,["238"] = 252,["239"] = 253,["240"] = 254,["241"] = 255,["242"] = 256,["243"] = 257,["244"] = 253,["245"] = 260,["246"] = 261,["247"] = 262,["249"] = 264,["250"] = 265,["251"] = 266,["253"] = 268,["254"] = 260,["255"] = 176,["256"] = 32,["257"] = 33});
local ____exports = {}
local ____SolveLuaAsyn = require("solar.solar-wc3.lib.compatible.SolveLuaAsyn")
local SolveLuaAsyn = ____SolveLuaAsyn.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EmbedJapi = require("solar.solar-wc3.lib.compatible.EmbedJapi")
local EmbedJapi = ____EmbedJapi.default
local ____DzApiHelper = require("solar.solar-wc3.lib.compatible.DzApiHelper")
local DzApiHelper = ____DzApiHelper.default
local ____Constant = require("solar.solar-common.constant.Constant")
local Constant = ____Constant.default
local ____Log = require("solar.solar-wc3.common.Log")
local Log = ____Log.default
local ____Develop = require("solar.solar-wc3.common.Develop")
local Develop = ____Develop.default
local ____Es = require("solar.solar-wc3.lib.compatible.Es")
local Es = ____Es.default
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local ____IDAdapter = require("solar.solar-wc3.lib.compatible.IDAdapter")
local IDAdapter = ____IDAdapter.default
local ____YDWE = require("solar.solar-wc3.lib.compatible.YDWE")
local YDWE = ____YDWE.default
local ____SolarDataClearState = require("solar.solar-common.attribute.SolarDataClearState")
local SolarDataClearState = ____SolarDataClearState.default
local ____YiYiEnv = require("solar.solar-wc3.lib.compatible.yiyi.YiYiEnv")
local YiYiEnv = ____YiYiEnv.default
local ____SolarReload = require("solar.solar-wc3.common.SolarReload")
local SolarReload = ____SolarReload.default
local ____SolarGlobalVars = require("solar.solar-common.common.SolarGlobalVars")
local SolarGlobalVars = ____SolarGlobalVars.default
local ____KKImplementEmbedJapi = require("solar.solar-wc3.lib.compatible.kk.KKImplementEmbedJapi")
local KKImplementEmbedJapi = ____KKImplementEmbedJapi.default
local ____ErrorFrame = require("solar.solar-common.common.ErrorFrame")
local ErrorFrame = ____ErrorFrame.default
local CJ = require("jass.common")
local globals = require("jass.globals")
local japi = require("jass.japi")
local ai = require("jass.ai")
local slk = require("jass.slk")
local runtime = require("jass.runtime")
local jConsole = require("jass.console")
local jDebug = require("jass.debug")
local jMessage = require("jass.message")
local storm = require("jass.storm")
_G.log = __TS__New(Log)
____exports.default = __TS__Class()
local GlobalVars = ____exports.default
GlobalVars.name = "GlobalVars"
function GlobalVars.prototype.____constructor(self)
end
function GlobalVars.init(self, ____debug, egp_enable)
    if ____debug == nil then
        ____debug = isDebug
    end
    if egp_enable == nil then
        egp_enable = ____debug
    end
    if _G.GlobalVars_init then
        return
    end
    SolarGlobalVars:init(____debug, egp_enable)
    _G.isDebug = ____debug
    Develop._sl_egp_enable = egp_enable
    if isDebug then
        Develop:open()
        if DzTriggerRegisterSyncData then
            SolarReload:init()
        else
            log.debug("本地Dzapi环境不存在！未启动热加载模块！")
        end
    else
        Develop:close()
    end
    ErrorFrame:init()
    _G.GlobalVars_init = true
end
function GlobalVars.initOnMain(self)
    ____exports.default:set2G(globals)
    if isEmbedJapi then
        EmbedJapi:initInEnd()
        print("初始化内置Japi环境")
    end
    SolveLuaAsyn.init()
    if is_11Platform then
        YiYiEnv:initInEnd()
    end
    if DzGetActivePatron ~= nil then
        KKImplementEmbedJapi:init()
    end
end
function GlobalVars.init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    do
        pcall(function()
            require("env_vars")
        end)
    end
    isDebug = storm.load(local_map_dir_path .. "/src/App.ts") ~= nil and storm.load("war3mapunits.doo") ~= nil
    if isDebug then
        runtime.console = true
    end
    ____exports.default:initBaseLuaEnv()
    ____exports.default:set2G(jDebug)
    ____exports.default:set2G(CJ)
    ____exports.default:set2G(ai)
    ____exports.default:set2G(japi)
    _g_objs = slk
    ____exports.default:set2G(jMessage)
    for gk in pairs(DzApiHelper) do
        if __TS__StringStartsWith(gk, "Dz") or __TS__StringStartsWith(gk, "KK") then
            _G[gk] = DzApiHelper[gk]
        end
    end
    ____exports.default:initBaseVars()
    require("blizzard")
    require("solar_addons")
    SolveLuaAsyn.SolveMathAsyn()
    BaseUtil.init()
    Constant:init()
    IDAdapter.init()
    YDWE:_sl_init()
    SolarDataClearState:_sl_hookClearHandle()
    if DzLoadToc ~= nil then
        DzLoadToc("solar_asset\\ui\\base.toc")
    end
    return true
end
function GlobalVars.set2G(self, obj)
    for gk in pairs(obj) do
        do
            if "table" == gk then
                goto __continue21
            end
            _G[gk] = obj[gk]
        end
        ::__continue21::
    end
end
function GlobalVars.initBaseLuaEnv(self)
    Es:init()
    targetLanguage = "lua"
    _G.print = function(...)
        jConsole.write(...)
    end
    runtime.error_handle = ErrorMsgHelper.error_handle
    runtime.handle_level = 0
    isEmbedJapi = japi.GetPluginVersion ~= nil
    if isEmbedJapi then
        EmbedJapi:init()
    end
    isEmbedBrowser = japi.InitHtml5Plugin ~= nil
    is_11Platform = japi.EXNetIsYYHighLadder ~= nil
    if is_11Platform then
        YiYiEnv:init()
    end
    require("base")
    require("json")
end
function GlobalVars.initBaseVars(self)
    isBigAttributeMode = false
    StrHpBonus = S2R(_g_objs.misc.Misc.StrHitPointBonus)
    AgiDefenseBonus = S2R(_g_objs.misc.Misc.AgiDefenseBonus)
    IntManaBonus = S2R(_g_objs.misc.Misc.IntManaBonus)
    PrimaryAttackBonus = S2R(_g_objs.misc.Misc.StrAttackBonus)
    ArmorReducesDamageFactor = S2R(_g_objs.misc.Misc.DefenseArmor)
    PawnItemRate = S2R(_g_objs.misc.Misc.PawnItemRate or "0.5")
    tempLocation = Location(0, 0)
    tempGroup = CreateGroup()
    _tempGroup = CreateGroup()
    _sl_tempGroup1 = CreateGroup()
    _sl_tempGroup2 = CreateGroup()
    _sl_tempGroup3 = CreateGroup()
    _G.globals = globals
    _G.UnitAlive = function(unit)
        return GetUnitState(unit, UNIT_STATE_LIFE) > 0.405 and not IsUnitType(unit, UNIT_TYPE_DEAD)
    end
    local old_handle_ref = handle_ref
    _G.handle_ref = function(h)
        if not IsHandle(h) then
            log.errorWithTraceBack("无法增加一个空handle的引用!")
            return
        end
        local defInfo = handledef(h)
        if not defInfo.reference or defInfo.reference <= 0 then
            log.errorWithTraceBack(("无法增加一个0引用的handle的引用!请提前增加引用。" .. "因为此handle已经是空闲的handle了，马上就会被底层重用了！") .. tostring(defInfo and defInfo.reference))
            return
        end
        old_handle_ref(h)
    end
    local old_handle_unref = handle_unref
    _G.handle_unref = function(h)
        if not IsHandle(h) then
            log.errorWithTraceBack("无法减少一个空handle的引用!")
            return
        end
        local defInfo = handledef(h)
        if not defInfo.reference or defInfo.reference <= 0 then
            log.errorWithTraceBack("无法减少一个0引用的handle的引用!请提前使用handle_ref增加引用!" .. tostring(defInfo and defInfo.reference))
            return
        end
        old_handle_unref(h)
    end
    _G.handle_clearref = function(h)
        if not IsHandle(h) then
            return
        end
        do
            local i = 0
            while i < 10000 do
                if handledef(h).reference > 0 then
                    handle_unref(h)
                else
                    return
                end
                i = i + 1
            end
        end
    end
    _G.char2number = function(char)
        local t = string
        return t.byte(char, 1)
    end
    _G.deleteKey = function(obj, key)
        if obj then
            obj[key] = nil
        end
    end
    local oldUnitDropItemSlot = UnitDropItemSlot
    _G.UnitDropItemSlot = function(whichUnit, whichItem, slot)
        gv.isUnitDropItemSlotExecIng = true
        local b = oldUnitDropItemSlot(whichUnit, whichItem, slot)
        gv.isUnitDropItemSlotExecIng = false
        return b
    end
    _G.HttpRequest = function(url, post, onResult)
        if post_message then
            return post_message(url, post, onResult)
        else
            local info = "此函数暂时未兼容你的脚本环境!"
            print(info)
            onResult(info)
        end
        return false
    end
end
GlobalVars.isInit = false
GlobalVars.justInvoke = ____exports.default:init0()
return ____exports
