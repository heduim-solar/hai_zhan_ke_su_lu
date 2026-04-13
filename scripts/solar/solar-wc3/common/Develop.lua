local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 10,["25"] = 11,["26"] = 12,["27"] = 14,["28"] = 14,["29"] = 14,["31"] = 14,["32"] = 22,["33"] = 24,["34"] = 25,["35"] = 26,["36"] = 27,["37"] = 28,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 29,["48"] = 32,["49"] = 33,["50"] = 34,["53"] = 38,["54"] = 39,["55"] = 40,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["62"] = 47,["64"] = 49,["65"] = 50,["66"] = 51,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 50,["72"] = 59,["73"] = 59,["74"] = 59,["75"] = 60,["78"] = 68,["81"] = 62,["82"] = 65,["83"] = 66,["90"] = 59,["91"] = 59,["92"] = 73,["93"] = 74,["94"] = 74,["95"] = 74,["96"] = 74,["97"] = 74,["98"] = 75,["99"] = 76,["100"] = 75,["101"] = 79,["102"] = 80,["103"] = 80,["104"] = 80,["105"] = 80,["106"] = 80,["107"] = 81,["108"] = 82,["109"] = 81,["110"] = 85,["111"] = 86,["112"] = 87,["113"] = 22,["114"] = 91,["115"] = 92,["116"] = 93,["117"] = 94,["118"] = 95,["119"] = 91,["120"] = 99,["121"] = 100,["122"] = 99,["123"] = 103,["124"] = 104,["125"] = 105,["126"] = 106,["127"] = 108,["128"] = 109,["129"] = 110,["130"] = 111,["131"] = 112,["133"] = 114,["134"] = 115,["135"] = 116,["136"] = 117,["137"] = 118,["138"] = 119,["139"] = 120,["140"] = 121,["141"] = 122,["142"] = 123,["143"] = 124,["145"] = 126,["146"] = 126,["147"] = 126,["148"] = 127,["149"] = 126,["150"] = 126,["151"] = 129,["152"] = 130,["154"] = 132,["155"] = 133,["156"] = 134,["157"] = 135,["158"] = 103,["159"] = 138,["160"] = 139,["161"] = 140,["163"] = 141,["164"] = 141,["166"] = 142,["167"] = 143,["168"] = 144,["170"] = 146,["171"] = 147,["172"] = 148,["173"] = 148,["174"] = 148,["175"] = 148,["176"] = 148,["178"] = 150,["179"] = 151,["180"] = 152,["182"] = 154,["185"] = 141,["188"] = 157,["189"] = 138,["190"] = 205,["191"] = 206,["192"] = 207,["193"] = 207,["194"] = 207,["196"] = 207,["198"] = 207,["199"] = 208,["200"] = 209,["202"] = 211,["203"] = 205,["204"] = 15,["205"] = 16,["206"] = 20,["207"] = 161,["208"] = 161,["209"] = 161,["210"] = 161,["211"] = 161,["212"] = 161,["213"] = 161,["214"] = 161,["215"] = 161,["216"] = 161,["217"] = 161,["218"] = 161,["219"] = 161,["220"] = 161,["221"] = 161,["222"] = 161,["223"] = 161,["224"] = 161,["225"] = 161,["226"] = 161,["227"] = 161,["228"] = 161,["229"] = 161,["230"] = 161,["231"] = 161,["232"] = 161,["233"] = 161,["234"] = 161,["235"] = 161,["236"] = 161,["237"] = 161,["238"] = 161,["239"] = 161,["240"] = 161,["241"] = 161,["242"] = 161,["243"] = 161,["244"] = 161,["245"] = 161,["246"] = 161,["247"] = 161,["248"] = 161,["249"] = 161});
local ____exports = {}
local ____Log = require("solar.solar-wc3.common.Log")
local Log = ____Log.default
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____ClosureCounter = require("solar.solar-wc3.lib.debug.ClosureCounter")
local ClosureCounter = ____ClosureCounter.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____FrameDebug = require("solar.solar-wc3.lib.debug.FrameDebug")
local FrameDebug = ____FrameDebug.default
local ____HandleDebug = require("solar.solar-wc3.lib.debug.HandleDebug")
local HandleDebug = ____HandleDebug.default
local runtime = require("jass.runtime")
local jDebug = require("jass.debug")
local jass = require("jass.common")
____exports.default = __TS__Class()
local Develop = ____exports.default
Develop.name = "Develop"
function Develop.prototype.____constructor(self)
end
function Develop.open(self)
    runtime.debugger = ____exports.default.debuggerPort
    runtime.console = true
    isDebug = true
    if not DzTriggerRegisterSyncData then
        print("本地开发环境DzApi不存在!请检查编辑器与相关辅助程序是否安装正确(请使用推荐的版本),加入QQ群941442872了解更多信息！")
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            5,
            "当前环境无完整Japi！"
        )
    end
    do
        pcall(function()
            require("_SLA_temp")
            local _SL_version_info = "编译版本号:" .. tostring(_G._SL_version_info)
            print(_SL_version_info)
        end)
    end
    if isEmbedJapi then
        local pv = tostring(GetPluginVersion())
        if _G.CreateDoodad then
            pv = pv .. "_sp3"
        elseif _G.DzGetPlayerSelectedHero then
            pv = pv .. "_sp2"
        elseif _G.GetRealSelectItem then
            pv = pv .. "_sp1"
        end
        print("内置Japi版本=" .. pv)
    end
    if ____exports.default.isSocketDebug then
        pcall(function()
            local dbg = require("debugger")
            dbg:io("listen:127.0.0.1:" .. tostring(____exports.default.debuggerPort))
            dbg:start()
            print("启动Lua Socket调试 " .. tostring(____exports.default.debuggerPort))
        end)
    end
    BaseUtil.runLater(
        0.01,
        function()
            if ____exports.default._sl_egp_enable then
                do
                    local function ____catch(e)
                        print("提示：更新此地图太阳TS框架可以启用编辑器调试工具插件!")
                    end
                    local ____try, ____hasReturned = pcall(function()
                        PACKAGE.path = ((((local_map_dir_path .. "scripts\\?.lua;") .. local_map_dir_path) .. "\\?.lua;") .. tostring(PACKAGE.path)) .. ";_sre\\?.lua;"
                        local _require = require
                        _require("_sl_egp._sl_egp")
                    end)
                    if not ____try then
                        ____catch(____hasReturned)
                    end
                end
            end
        end
    )
    local trigger = __TS__New(Trigger)
    trigger:registerPlayerChatEvent(
        MapPlayer:fromIndex(0),
        "d",
        true
    )
    trigger:addAction(function()
        ____exports.default:showDebugInfo()
    end)
    local trigger2 = __TS__New(Trigger)
    trigger2:registerPlayerChatEvent(
        MapPlayer:fromIndex(0),
        "stop",
        true
    )
    trigger2:addAction(function()
        log.debug("暂停Lua垃圾回收:" .. tostring(collectgarbage("stop")))
    end)
    ClosureCounter:init()
    FrameDebug:init()
    HandleDebug:init()
end
function Develop.close(self)
    runtime.console = false
    isDebug = false
    Log.enable = false
    Log.enablePrint = false
end
function Develop.showDebugInfo(self)
    log.debug(____exports.default:getDebugInfo())
end
function Develop.getDebugInfo(self)
    local str = "========Develop.showJassDebugInfo():Start========\r\n"
    str = ((str .. "垃圾收集器在运行为：") .. tostring(collectgarbage("isrunning"))) .. "\r\n"
    local lua_memory = collectgarbage("count")
    local stringTs = string
    local lm = stringTs.format("%.3f", lua_memory / 1024)
    str = ((str .. "脚本引擎占用内存[") .. tostring(lm)) .. "m]"
    if GetUsedMemory then
        str = ((str .. " GetUsedMemory=[") .. tostring(GetUsedMemory())) .. "]"
    end
    collectgarbage("collect")
    str = ((str .. "\r\nhandle最大值 =") .. tostring(jDebug.handlemax())) .. "\r\n"
    str = ((str .. "handle总数 =") .. tostring(jDebug.handlecount())) .. "\r\n"
    str = (str .. "========Handle信息:========") .. "\r\n"
    local handleInfoObj = ____exports.default:calculateHandleInfoObj()
    local handleInfoObjs = {}
    for handleInfoObjKey in pairs(handleInfoObj) do
        local obj = handleInfoObj[handleInfoObjKey]
        obj.type = handleInfoObjKey
        obj.typeName = ____exports.default:getTypeCnName(handleInfoObjKey)
        handleInfoObjs[#handleInfoObjs + 1] = obj
    end
    __TS__ArraySort(
        handleInfoObjs,
        function(self, a, b)
            return b.count - a.count
        end
    )
    for ____, obj in ipairs(handleInfoObjs) do
        str = (((((str .. ____exports.default:getTypeCnName(obj.type)) .. "    数量: ") .. tostring(obj.count)) .. "    引用计数: ") .. tostring(obj.reference)) .. "\r\n"
    end
    str = (str .. "========Develop.showJassDebugInfo():End========") .. "\r\n"
    str = ((str .. "GroupUtil.groupObjectPool.getNumActive()=") .. tostring(GroupUtil.groupObjectPool:getNumActive())) .. "\r\n"
    str = ((str .. "GroupUtil.groupObjectPool.getNumIdle()=") .. tostring(GroupUtil.groupObjectPool:getNumIdle())) .. "\r\n"
    return str
end
function Develop.calculateHandleInfoObj(self)
    local startIndex = 1048575
    local handleInfoObj = {}
    do
        local i = startIndex
        while i < startIndex + jDebug.handlemax() do
            do
                local handledefInfo = handledef(i2h(i))
                if not handledefInfo or not handledefInfo.type then
                    goto __continue29
                end
                local infoObj = handleInfoObj[handledefInfo.type]
                if not infoObj then
                    infoObj = {
                        count = 0,
                        reference = 0,
                        typeName = ____exports.default:getTypeCnName(handledefInfo.type)
                    }
                end
                infoObj.count = infoObj.count + 1
                if handledefInfo.reference then
                    infoObj.reference = infoObj.reference + handledefInfo.reference
                end
                handleInfoObj[handledefInfo.type] = infoObj
            end
            ::__continue29::
            i = i + 1
        end
    end
    return handleInfoObj
end
function Develop.getTypeCnName(self, ____type)
    local name = ____exports.default.typeName[____type]
    local ____name_0
    if name then
        ____name_0 = name
    else
        ____name_0 = ____type
    end
    name = ____name_0
    if "事件" == name then
        name = ((tostring(name) .. "(") .. ____type) .. ")"
    end
    return name
end
Develop.debuggerPort = 4279
Develop.isSocketDebug = false
Develop._sl_egp_enable = true
Develop.typeName = {
    ["+loc"] = "点",
    ["+EIP"] = "点特效",
    ["+EIm"] = "附着特效",
    ["+EIf"] = "特效III",
    ["+tmr"] = "计时器",
    item = "物品",
    ["+w3u"] = "单位",
    ["+grp"] = "单位组",
    ["+dlb"] = "按钮",
    ["+dlg"] = "对话框",
    ["+w3d"] = "可破坏物",
    ["+rev"] = "事件",
    alvt = "事件",
    bevt = "事件",
    devt = "事件",
    gevt = "事件",
    gfvt = "事件",
    pcvt = "玩家聊天事件",
    pevt = "玩家事件",
    psvt = "事件",
    tmet = "事件",
    tmvt = "事件",
    uevt = "单位事件",
    wdvt = "可破坏物事件",
    ["+flt"] = "过滤器",
    ["+fgm"] = "可见度修正器",
    ["+frc"] = "玩家组",
    ghth = "哈希表",
    ["+mdb"] = "多面板",
    ["+ply"] = "玩家",
    ["+rct"] = "矩形区域",
    ["+agr"] = "范围",
    ["+snd"] = "声音",
    ["+tid"] = "计时器窗口",
    ["+trg"] = "触发器",
    ["+tac"] = "触发器动作",
    tcnd = "触发器条件",
    ipol = "物品池",
    ["+mbi"] = "多面板项目",
    gcch = "缓存",
    ["+que"] = "任务"
}
return ____exports
