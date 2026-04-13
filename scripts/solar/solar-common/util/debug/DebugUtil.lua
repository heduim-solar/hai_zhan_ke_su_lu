local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 13,["28"] = 13,["29"] = 13,["31"] = 13,["32"] = 20,["33"] = 21,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 20,["44"] = 32,["45"] = 32,["46"] = 32,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 33,["53"] = 33,["54"] = 33,["55"] = 33,["56"] = 32,["57"] = 41,["58"] = 41,["59"] = 41,["61"] = 42,["64"] = 45,["65"] = 46,["66"] = 47,["67"] = 48,["68"] = 41,["69"] = 59,["70"] = 61,["71"] = 62,["72"] = 59,["73"] = 68,["74"] = 70,["75"] = 71,["76"] = 72,["77"] = 68,["78"] = 79,["79"] = 79,["80"] = 79,["82"] = 81,["83"] = 82,["84"] = 82,["85"] = 82,["86"] = 82,["87"] = 83,["88"] = 83,["89"] = 83,["90"] = 83,["91"] = 83,["92"] = 83,["93"] = 83,["94"] = 84,["95"] = 79,["96"] = 92,["97"] = 92,["98"] = 92,["100"] = 94,["101"] = 95,["102"] = 96,["103"] = 97,["104"] = 99,["105"] = 100,["106"] = 101,["107"] = 101,["108"] = 101,["109"] = 101,["110"] = 101,["111"] = 101,["112"] = 101,["113"] = 102,["114"] = 103,["115"] = 92,["116"] = 112,["117"] = 113,["118"] = 114,["119"] = 115,["120"] = 112,["121"] = 123,["122"] = 124,["123"] = 125,["124"] = 126,["125"] = 123,["126"] = 130,["127"] = 131,["128"] = 132,["129"] = 132,["130"] = 132,["131"] = 132,["132"] = 132,["133"] = 132,["134"] = 132,["135"] = 133,["136"] = 130,["137"] = 145,["138"] = 146,["139"] = 147,["141"] = 149,["142"] = 150,["144"] = 152,["145"] = 153,["146"] = 145,["147"] = 159,["149"] = 160,["150"] = 160,["151"] = 161,["152"] = 162,["155"] = 165,["156"] = 166,["157"] = 160,["160"] = 159,["161"] = 174,["162"] = 175,["163"] = 176,["164"] = 175,["165"] = 174,["166"] = 183,["167"] = 184,["168"] = 184,["169"] = 184,["170"] = 184,["171"] = 185,["172"] = 184,["173"] = 184,["174"] = 183,["175"] = 193,["176"] = 194,["177"] = 195,["178"] = 194,["179"] = 197,["180"] = 198,["181"] = 197,["182"] = 193,["183"] = 205,["184"] = 205,["185"] = 205,["187"] = 205,["188"] = 205,["190"] = 205,["191"] = 205,["193"] = 206,["194"] = 207,["195"] = 208,["196"] = 209,["197"] = 210,["198"] = 211,["199"] = 212,["201"] = 214,["202"] = 209,["204"] = 217,["205"] = 218,["206"] = 219,["207"] = 218,["208"] = 221,["209"] = 222,["210"] = 221,["212"] = 225,["213"] = 226,["214"] = 227,["215"] = 226,["217"] = 232,["218"] = 233,["219"] = 232,["220"] = 235,["221"] = 236,["222"] = 235,["223"] = 238,["224"] = 239,["225"] = 238,["226"] = 241,["227"] = 242,["228"] = 241,["229"] = 205,["230"] = 247,["231"] = 248,["232"] = 248,["233"] = 248,["234"] = 249,["235"] = 248,["236"] = 248,["237"] = 251,["238"] = 252,["239"] = 253,["240"] = 254,["241"] = 255,["242"] = 256,["243"] = 258,["244"] = 259,["245"] = 261,["246"] = 262,["247"] = 263,["248"] = 264,["250"] = 266,["251"] = 267,["252"] = 268,["253"] = 269,["254"] = 269,["255"] = 269,["256"] = 269,["257"] = 269,["258"] = 269,["259"] = 269,["260"] = 271,["261"] = 272,["262"] = 273,["263"] = 271,["264"] = 276,["265"] = 277,["266"] = 278,["267"] = 276,["268"] = 280,["269"] = 280,["270"] = 280,["271"] = 281,["272"] = 282,["273"] = 283,["274"] = 284,["275"] = 285,["276"] = 286,["278"] = 280,["279"] = 280,["280"] = 289,["281"] = 290,["282"] = 289,["283"] = 292,["284"] = 293,["285"] = 293,["286"] = 293,["287"] = 293,["288"] = 247,["289"] = 14,["290"] = 54,["291"] = 138});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____unit = require("solar.solar-common.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
____exports.default = __TS__Class()
local DebugUtil = ____exports.default
DebugUtil.name = "DebugUtil"
function DebugUtil.prototype.____constructor(self)
end
function DebugUtil.showText(text)
    if ____exports.default.noDebug then
        return
    end
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        30,
        text
    )
end
function DebugUtil.createUnit(unitId)
    if unitId == nil then
        unitId = "Hamg"
    end
    return __TS__New(
        Unit,
        0,
        unitId,
        0,
        0,
        0
    )
end
function DebugUtil.showTexture(texFile, size)
    if size == nil then
        size = 0.04
    end
    if ____exports.default.noDebug then
        return
    end
    local frame = Frame:createBackDrop()
    frame:setSize(size, size)
    frame:setAbsPoint(4, 0.3, 0.3)
    frame:setTexture(texFile, 0)
end
function DebugUtil.refreshCodeExecStartTime()
    local o = os
    ____exports.default.codeExecStartTime = o.clock()
end
function DebugUtil.countCodeExecuteTime()
    local o = os
    local useTime = o.clock() - ____exports.default.codeExecStartTime
    return useTime
end
function DebugUtil.printCodeExecuteTime(title)
    if title == nil then
        title = "函数"
    end
    local stringTs = string
    local info = ((title .. "执行时间=") .. tostring(stringTs.format(
        "%.3f",
        ____exports.default.countCodeExecuteTime() * 1000
    ))) .. "毫秒"
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        20,
        info
    )
    print(info)
end
function DebugUtil.countExecuteTime(func, title)
    if title == nil then
        title = "函数"
    end
    local o = os
    local start = o.clock()
    func(nil)
    local useTime = o.clock() - start
    local stringTs = string
    local info = ((title .. "执行时间=") .. tostring(stringTs.format("%.3f", useTime * 1000))) .. "毫秒"
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        20,
        info
    )
    print(info)
    return useTime
end
function DebugUtil.onTime(time, actionFunc)
    local trigger = __TS__New(Trigger)
    trigger:registerTimerEvent(time, false)
    trigger:addAction(actionFunc)
end
function DebugUtil.onChat(char, actionFunc)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyPlayerChatEvent(char, true)
    trigger:addAction(actionFunc)
end
function DebugUtil.onKeyEvent(key, actionFunc)
    local t = CreateTrigger()
    DzTriggerRegisterKeyEventByCode(
        t,
        key,
        1,
        true,
        nil
    )
    TriggerAddAction(t, actionFunc)
end
function DebugUtil.isLimitTime(key, time)
    if not ____exports.default.limitTimeCache[key] then
        ____exports.default.limitTimeCache[key] = 1
    end
    if ____exports.default.limitTimeCache[key] > time then
        return true
    end
    ____exports.default.limitTimeCache[key] = ____exports.default.limitTimeCache[key] + 1
    return false
end
function DebugUtil.printLocalVars()
    do
        local i = 1
        while i < 1000000 do
            local name, value = debug.getlocal(2, i)
            if not name then
                break
            end
            print(name .. " :")
            print_r(value)
            i = i + 1
        end
    end
end
function DebugUtil.removeAllUnits()
    SelectUtil.forAllUnits(function(____, unit)
        RemoveUnit(unit)
    end)
end
function DebugUtil.removeAllItems()
    EnumItemsInRect(
        bj_mapInitialPlayableArea,
        nil,
        function()
            RemoveItem(GetEnumItem())
        end
    )
end
function DebugUtil.openShop()
    _G.DzAPI_Map_HasMallItem = function(whichPlayer, key)
        return true
    end
    _G.DzAPI_Map_GetMallItemCount = function(whichPlayer, key)
        return 100
    end
end
function DebugUtil.openShopArchiveMapLv(shop, Archive, mapLv)
    if shop == nil then
        shop = true
    end
    if Archive == nil then
        Archive = true
    end
    if mapLv == nil then
        mapLv = true
    end
    BJDebugMsg("打开商城与太阳存档权限：地图等级设置为100Lv")
    if Archive then
        local oldGet = ArchiveUtil.get
        ArchiveUtil.get = function(self, whichPlayer, key, mapLevelLimit)
            local val = oldGet(nil, whichPlayer, key, mapLevelLimit)
            if val == nil then
                val = 100
            end
            return val
        end
    end
    if shop then
        _G.DzAPI_Map_HasMallItem = function(whichPlayer, key)
            return true
        end
        _G.DzAPI_Map_GetMallItemCount = function(whichPlayer, key)
            return 100
        end
    end
    if mapLv then
        _G.DzAPI_Map_GetMapLevel = function(whichPlayer)
            return 100
        end
    end
    _G.DzAPI_Map_ContinuousCount = function(whichPlayer, id)
        return 100
    end
    _G.DzAPI_Map_GetForumData = function(whichPlayer, id)
        return 100
    end
    _G.DzAPI_Map_Returns = function(whichPlayer, id)
        return true
    end
    _G.DzAPI_Map_GetGuildName = function(whichPlayer)
        return "太阳公会"
    end
end
function DebugUtil.numKeyFrame(num, name, callBack, info)
    SingletonUtil:executeOnce(
        "_sl_debug_test:numKeyFrame:tips",
        function()
            BJDebugMsg("按下键盘对应的数字可以执行测试示例!")
        end
    )
    local frame = Frame:createTEXTWithBorderBackDrop()
    local frameWidth = 0.06
    frame:setAbsPoint(FramePoint.topLeft, (frameWidth + 0.025) * (num - 1) + 0.06, 0.55)
    frame:setText((tostring(num) .. "、") .. name)
    frame:setFont(0.013)
    frame:setWidth(frameWidth)
    local button = Frame:createBUTTON(frame.current)
    button:setAllPoints(frame.current)
    local frameTip = Frame:createTEXTWithBorderBackDrop()
    local text = name
    if info then
        text = (text .. "|n|n") .. info
    end
    frameTip:setText(text)
    DzFrameShow(frameTip.current, false)
    DzFrameShow(frameTip.backdropFrame.handle, false)
    frameTip:setPoint(
        FramePoint.topLeft,
        frame.handle,
        FramePoint.bottom,
        0.02,
        -0.02
    )
    button:setOnMouseEnter(function()
        DzFrameShow(frameTip.current, true)
        DzFrameShow(frameTip.backdropFrame.handle, true)
    end)
    button:addOnMouseLeave(function()
        DzFrameShow(frameTip.current, false)
        DzFrameShow(frameTip.backdropFrame.handle, false)
    end)
    SyncUtil.onSyncData(
        "_sl_debug_test_:" .. tostring(num),
        function(____, t, d)
            callBack(nil, t)
            print("执行完毕:" .. name)
            BJDebugMsg("执行完毕:" .. name)
            if info then
                print(info)
                BJDebugMsg(info)
            end
        end
    )
    local function cb()
        SyncUtil.syncData("_sl_debug_test_:" .. tostring(num))
    end
    button:setOnClick(cb)
    InputUtil:onKeyPressed(
        KeyCode["VK_" .. tostring(num)],
        cb
    )
end
DebugUtil.noDebug = false
DebugUtil.codeExecStartTime = 0
DebugUtil.limitTimeCache = {}
return ____exports
