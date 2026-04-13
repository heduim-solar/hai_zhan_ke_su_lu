local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 9,["18"] = 9,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 11,["23"] = 12,["24"] = 12,["25"] = 15,["26"] = 15,["27"] = 15,["29"] = 15,["30"] = 24,["31"] = 24,["32"] = 24,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 26,["40"] = 27,["42"] = 29,["43"] = 30,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 35,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["55"] = 37,["56"] = 37,["57"] = 38,["58"] = 39,["61"] = 42,["62"] = 47,["64"] = 49,["65"] = 37,["68"] = 52,["69"] = 32,["70"] = 32,["71"] = 55,["72"] = 56,["74"] = 59,["75"] = 24,["76"] = 66,["77"] = 67,["78"] = 68,["79"] = 69,["80"] = 70,["82"] = 67,["83"] = 66,["84"] = 82,["85"] = 82,["86"] = 82,["88"] = 82,["89"] = 82,["91"] = 83,["92"] = 84,["93"] = 85,["95"] = 86,["96"] = 86,["97"] = 87,["98"] = 88,["100"] = 86,["103"] = 91,["105"] = 93,["106"] = 94,["108"] = 96,["109"] = 82,["110"] = 103,["111"] = 103,["112"] = 103,["114"] = 104,["115"] = 105,["116"] = 106,["117"] = 107,["118"] = 108,["119"] = 109,["122"] = 112,["123"] = 103,["124"] = 119,["125"] = 119,["126"] = 119,["128"] = 120,["129"] = 121,["130"] = 122,["131"] = 123,["132"] = 124,["133"] = 125,["136"] = 128,["137"] = 119,["138"] = 135,["139"] = 136,["140"] = 137,["142"] = 140,["143"] = 140,["144"] = 140,["145"] = 140,["146"] = 140,["147"] = 141,["148"] = 142,["149"] = 143,["151"] = 145,["152"] = 146,["153"] = 147,["155"] = 149,["156"] = 135,["157"] = 155,["158"] = 156,["159"] = 156,["161"] = 156,["162"] = 156,["164"] = 157,["165"] = 158,["166"] = 158,["167"] = 158,["168"] = 158,["169"] = 158,["170"] = 158,["171"] = 158,["172"] = 159,["174"] = 160,["175"] = 160,["177"] = 161,["178"] = 162,["181"] = 166,["182"] = 167,["183"] = 168,["185"] = 170,["186"] = 171,["190"] = 160,["193"] = 174,["194"] = 155,["195"] = 180,["196"] = 181,["197"] = 181,["199"] = 181,["200"] = 181,["202"] = 182,["203"] = 183,["204"] = 183,["205"] = 183,["206"] = 183,["207"] = 183,["208"] = 183,["209"] = 183,["210"] = 184,["212"] = 185,["213"] = 185,["215"] = 186,["216"] = 187,["219"] = 191,["220"] = 192,["221"] = 193,["223"] = 195,["224"] = 196,["228"] = 185,["231"] = 199,["232"] = 180,["233"] = 205,["234"] = 205,["235"] = 205,["237"] = 205,["238"] = 205,["240"] = 205,["241"] = 205,["243"] = 206,["244"] = 206,["245"] = 206,["246"] = 206,["247"] = 206,["248"] = 206,["249"] = 206,["250"] = 207,["251"] = 208,["253"] = 211,["254"] = 211,["255"] = 211,["256"] = 212,["257"] = 212,["258"] = 212,["259"] = 212,["260"] = 212,["261"] = 212,["262"] = 213,["263"] = 213,["264"] = 213,["265"] = 213,["266"] = 213,["267"] = 213,["268"] = 214,["269"] = 211,["270"] = 211,["271"] = 216,["272"] = 205,["273"] = 222,["274"] = 222,["275"] = 222,["277"] = 222,["278"] = 222,["280"] = 222,["281"] = 222,["283"] = 223,["284"] = 224,["285"] = 224,["286"] = 224,["287"] = 224,["288"] = 224,["289"] = 224,["290"] = 224,["291"] = 225,["292"] = 226,["294"] = 227,["295"] = 227,["297"] = 228,["298"] = 229,["301"] = 232,["302"] = 233,["303"] = 234,["305"] = 236,["306"] = 237,["308"] = 239,["309"] = 240,["313"] = 227,["316"] = 243,["317"] = 244,["318"] = 222,["319"] = 251,["320"] = 252,["321"] = 253,["322"] = 253,["323"] = 253,["324"] = 253,["325"] = 253,["326"] = 253,["327"] = 253,["328"] = 254,["329"] = 255,["330"] = 251,["331"] = 261,["332"] = 262,["333"] = 262,["334"] = 262,["335"] = 262,["336"] = 262,["337"] = 262,["338"] = 262,["339"] = 263,["342"] = 266,["343"] = 267,["344"] = 268,["345"] = 269,["348"] = 261,["349"] = 277,["350"] = 278,["351"] = 278,["352"] = 278,["353"] = 278,["354"] = 278,["355"] = 278,["356"] = 278,["357"] = 279,["360"] = 282,["361"] = 283,["362"] = 284,["363"] = 285,["364"] = 286,["367"] = 289,["368"] = 277,["369"] = 301,["370"] = 302,["371"] = 302,["372"] = 302,["373"] = 302,["374"] = 302,["375"] = 302,["376"] = 302,["377"] = 303,["380"] = 306,["381"] = 307,["383"] = 301,["384"] = 319,["385"] = 320,["386"] = 321,["387"] = 322,["388"] = 323,["389"] = 324,["391"] = 325,["392"] = 325,["393"] = 326,["394"] = 327,["395"] = 328,["396"] = 329,["397"] = 329,["398"] = 329,["399"] = 329,["400"] = 329,["401"] = 329,["402"] = 329,["404"] = 330,["405"] = 330,["406"] = 331,["407"] = 332,["410"] = 335,["411"] = 336,["413"] = 338,["414"] = 330,["417"] = 325,["420"] = 341,["421"] = 342,["422"] = 319,["423"] = 350,["424"] = 351,["425"] = 352,["426"] = 353,["427"] = 354,["430"] = 350,["431"] = 364,["432"] = 365,["433"] = 366,["434"] = 367,["435"] = 368,["436"] = 369,["437"] = 370,["441"] = 374,["442"] = 375,["445"] = 364,["446"] = 385,["447"] = 386,["448"] = 387,["449"] = 388,["450"] = 388,["451"] = 388,["452"] = 388,["453"] = 388,["454"] = 389,["455"] = 390,["457"] = 391,["458"] = 391,["459"] = 392,["460"] = 393,["463"] = 396,["464"] = 397,["466"] = 399,["467"] = 391,["472"] = 402,["473"] = 402,["474"] = 403,["475"] = 404,["478"] = 407,["479"] = 408,["480"] = 402,["484"] = 411,["485"] = 412,["486"] = 385,["487"] = 421,["488"] = 422,["489"] = 423,["490"] = 423,["491"] = 423,["492"] = 423,["493"] = 423,["494"] = 424,["495"] = 425,["497"] = 426,["498"] = 426,["499"] = 427,["500"] = 428,["503"] = 431,["504"] = 432,["506"] = 434,["507"] = 426,["511"] = 437,["513"] = 439,["514"] = 421,["515"] = 448,["516"] = 449,["517"] = 450,["518"] = 450,["519"] = 450,["520"] = 450,["521"] = 450,["523"] = 451,["524"] = 451,["525"] = 452,["526"] = 453,["529"] = 456,["530"] = 457,["532"] = 459,["533"] = 451,["536"] = 461,["537"] = 448,["538"] = 471,["539"] = 471,["540"] = 471,["542"] = 472,["543"] = 473,["545"] = 474,["546"] = 474,["547"] = 475,["548"] = 476,["551"] = 479,["552"] = 480,["554"] = 482,["555"] = 474,["558"] = 484,["559"] = 471,["560"] = 488,["561"] = 489,["562"] = 490,["563"] = 488,["564"] = 494,["565"] = 495,["566"] = 496,["567"] = 497,["569"] = 499,["570"] = 500,["572"] = 502,["573"] = 503,["574"] = 504,["575"] = 505,["576"] = 507,["577"] = 508,["578"] = 508,["579"] = 508,["580"] = 508,["581"] = 508,["582"] = 508,["583"] = 509,["584"] = 510,["585"] = 511,["588"] = 514,["589"] = 494,["590"] = 518,["591"] = 519,["592"] = 520,["593"] = 521,["594"] = 522,["595"] = 523,["596"] = 523,["597"] = 523,["598"] = 523,["599"] = 523,["600"] = 523,["601"] = 524,["602"] = 525,["603"] = 526,["606"] = 529,["607"] = 518,["608"] = 537,["609"] = 537,["610"] = 537,["612"] = 537,["613"] = 537,["615"] = 537,["616"] = 537,["618"] = 537,["619"] = 537,["621"] = 538,["622"] = 539,["625"] = 543,["626"] = 545,["627"] = 547,["628"] = 548,["629"] = 549,["630"] = 550,["632"] = 551,["633"] = 551,["635"] = 552,["636"] = 553,["639"] = 556,["640"] = 557,["641"] = 558,["642"] = 559,["643"] = 560,["644"] = 561,["645"] = 562,["648"] = 565,["649"] = 566,["651"] = 568,["654"] = 551,["657"] = 537,["658"] = 16});
local ____exports = {}
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____GameCenter = require("solar.solar-common.common.GameCenter")
local GameCenter = ____GameCenter.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local SelectUtil = ____exports.default
SelectUtil.name = "SelectUtil"
function SelectUtil.prototype.____constructor(self)
end
function SelectUtil.getAnHero(playerIndex, clearCache)
    if clearCache == nil then
        clearCache = false
    end
    local ____opt_0 = DataBase:getPlayerSolarData(
        Player(playerIndex),
        false
    )
    local hero = ____opt_0 and ____opt_0.hero
    if hero then
        return hero
    end
    if clearCache then
        ____exports.default.cache:remove("PlayerHero:" .. tostring(playerIndex))
    end
    local cacheUnitHandle = ____exports.default.cache:get(
        "PlayerHero:" .. tostring(playerIndex),
        function()
            local group = _sl_tempGroup1
            GroupEnumUnitsOfPlayer(
                group,
                Player(playerIndex),
                nil
            )
            do
                local i = 0
                while i <= 1000000 do
                    local unitHandle = FirstOfGroup(group)
                    if not IsHandle(unitHandle) then
                        break
                    end
                    if IsUnitType(unitHandle, UNIT_TYPE_HERO) and not IsUnitType(unitHandle, UNIT_TYPE_PEON) and not IsUnitType(unitHandle, UNIT_TYPE_SUMMONED) and not IsUnitIllusion(unitHandle) and not IsUnitHidden(unitHandle) then
                        return unitHandle
                    end
                    GroupRemoveUnit(group, unitHandle)
                    i = i + 1
                end
            end
            return nil
        end
    )
    if IsHandle(cacheUnitHandle) then
        return cacheUnitHandle
    end
    return nil
end
function SelectUtil.forUserPlayerHero(callBack)
    PlayerUtil:forUsers(function(____, player)
        local anHero = ____exports.default.getAnHero(GetPlayerId(player))
        if IsHandle(anHero) then
            callBack(nil, anHero, player)
        end
    end)
end
function SelectUtil.getAnEnemy(playerIndex, canAttack)
    if playerIndex == nil then
        playerIndex = 0
    end
    if canAttack == nil then
        canAttack = true
    end
    local enemyUnits = ____exports.default.getAllEnemys(playerIndex)
    if canAttack then
        local canAttackEnemyUnits = {}
        do
            local i = 0
            while i < #enemyUnits do
                if not UnitStateUtil:isInvulnerable(enemyUnits[i + 1]) then
                    canAttackEnemyUnits[#canAttackEnemyUnits + 1] = enemyUnits[i + 1]
                end
                i = i + 1
            end
        end
        enemyUnits = canAttackEnemyUnits
    end
    if enemyUnits == nil or #enemyUnits == 0 then
        return nil
    end
    return enemyUnits[GetRandomInt(0, #enemyUnits - 1) + 1]
end
function SelectUtil.getAllEnemys(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local enemyUnits = {}
    local allUnits = GameCenter:getAllUnits()
    local player = Player(playerIndex)
    for ____, unit in ipairs(allUnits) do
        if IsUnitEnemy(unit, player) and UnitAlive(unit) and GetPlayerId(GetOwningPlayer(unit)) < 12 then
            enemyUnits[#enemyUnits + 1] = unit
        end
    end
    return enemyUnits
end
function SelectUtil.getAllEnemysLength(playerIndex)
    if playerIndex == nil then
        playerIndex = 0
    end
    local allUnits = GameCenter:getAllUnits()
    local player = Player(playerIndex)
    local count = 0
    for ____, unit in ipairs(allUnits) do
        if IsUnitEnemy(unit, player) and UnitAlive(unit) and GetPlayerId(GetOwningPlayer(unit)) < 12 then
            count = count + 1
        end
    end
    return count
end
function SelectUtil.getRealSelectUnit()
    if isEmbedJapi then
        return GetRealSelectUnit()
    end
    GroupEnumUnitsSelected(
        _tempGroup,
        GetLocalPlayer(),
        nil
    )
    local unit = FirstOfGroup(_tempGroup)
    if not IsHandle(unit) then
        return nil
    end
    GroupRemoveUnit(_tempGroup, unit)
    if IsHandle(FirstOfGroup(_tempGroup)) then
        return nil
    end
    return unit
end
function SelectUtil.forAllyUnitsInRange(center, radius, callback, x, y)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitAlive(unitHandle) then
                    goto __continue35
                end
                if IsUnitAlly(unitHandle, myPlayer) then
                    callback(nil, unitHandle)
                end
            end
            ::__continue35::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forEnemyUnitsInRange(center, radius, callback, x, y)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitAlive(unitHandle) then
                    goto __continue41
                end
                if IsUnitEnemy(unitHandle, myPlayer) then
                    callback(nil, unitHandle)
                end
            end
            ::__continue41::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.getEnemyUnitsInRangeOrderByDistance(center, radius, x, y, notInvulnerable)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    if notInvulnerable == nil then
        notInvulnerable = true
    end
    local enemyUnits = ____exports.default.getEnemyUnitsInRange(
        center,
        radius,
        x,
        y,
        notInvulnerable
    )
    if enemyUnits == nil or #enemyUnits == 0 then
        return enemyUnits
    end
    __TS__ArraySort(
        enemyUnits,
        function(____, a, b)
            local aD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(a),
                GetUnitY(a)
            )
            local bD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(b),
                GetUnitY(b)
            )
            return aD - bD
        end
    )
    return enemyUnits
end
function SelectUtil.getEnemyUnitsInRange(center, radius, x, y, notInvulnerable)
    if x == nil then
        x = GetUnitX(center)
    end
    if y == nil then
        y = GetUnitY(center)
    end
    if notInvulnerable == nil then
        notInvulnerable = true
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    local units = {}
    local myPlayer = GetOwningPlayer(center)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                GroupRemoveUnit(group, unitHandle)
                if not UnitStateUtil:isAlive(unitHandle) then
                    goto __continue50
                end
                if notInvulnerable and UnitStateUtil:isInvulnerable(unitHandle) then
                    goto __continue50
                end
                if IsUnitEnemy(unitHandle, myPlayer) then
                    units[#units + 1] = unitHandle
                end
            end
            ::__continue50::
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return units
end
function SelectUtil.forUnitsInRange(x, y, radius, callback)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRange(
        group,
        x,
        y,
        radius,
        nil
    )
    GroupUtil["for"](GroupUtil, group, callback)
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forEnemyUnitsInLine(whoEnemy, lineX, lineY, lineLen, lineFaceAngle, lineWidth, callback)
    local unitsInLine = ____exports.default.getUnitsInLine(
        lineX,
        lineY,
        lineLen,
        lineFaceAngle,
        lineWidth
    )
    if unitsInLine == nil or #unitsInLine == 0 then
        return
    end
    local myPlayer = GetOwningPlayer(whoEnemy)
    for ____, unit in ipairs(unitsInLine) do
        if IsUnitEnemy(unit, myPlayer) then
            callback(nil, unit)
        end
    end
end
function SelectUtil.getEnemyUnitsInLine(whoEnemy, lineX, lineY, lineLen, lineFaceAngle, lineWidth)
    local unitsInLine = ____exports.default.getUnitsInLine(
        lineX,
        lineY,
        lineLen,
        lineFaceAngle,
        lineWidth
    )
    if unitsInLine == nil or #unitsInLine == 0 then
        return
    end
    local result = {}
    local myPlayer = GetOwningPlayer(whoEnemy)
    for ____, unit in ipairs(unitsInLine) do
        if IsUnitEnemy(unit, myPlayer) then
            result[#result + 1] = unit
        end
    end
    return result
end
function SelectUtil.forUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth, callback)
    local unitsInLine = ____exports.default.getUnitsInLine(
        lineX,
        lineY,
        lineLen,
        lineFaceAngle,
        lineWidth
    )
    if unitsInLine == nil or #unitsInLine == 0 then
        return
    end
    for ____, unit in ipairs(unitsInLine) do
        callback(nil, unit)
    end
end
function SelectUtil.getUnitsInLine(lineX, lineY, lineLen, lineFaceAngle, lineWidth)
    local stepLen = lineWidth / 2
    local count = math.ceil(lineLen / stepLen)
    local result = {}
    local group = GroupUtil.groupObjectPool:borrowObject()
    local lineFaceHD = MathUtil.angle2radian(lineFaceAngle)
    do
        local i = 1
        while i < count do
            local dist = stepLen * i
            local x = lineX + dist * Cos(lineFaceHD)
            local y = lineY + dist * Sin(lineFaceHD)
            GroupEnumUnitsInRange(
                group,
                x,
                y,
                lineWidth,
                nil
            )
            do
                local j = 0
                while j <= 100000 do
                    local unitHandle = FirstOfGroup(group)
                    if not IsHandle(unitHandle) then
                        break
                    end
                    if not __TS__ArrayIncludes(result, unitHandle) then
                        result[#result + 1] = unitHandle
                    end
                    GroupRemoveUnit(group, unitHandle)
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return result
end
function SelectUtil.forAllAliveUnits(callback)
    local allUnits = GameCenter:getAllUnits()
    for ____, unitHandle in ipairs(allUnits) do
        if UnitAlive(unitHandle) then
            callback(nil, unitHandle)
        end
    end
end
function SelectUtil.forAllUnits(callback, unitType)
    local allUnits = GameCenter:getAllUnits()
    if unitType then
        local unitTypeNum = FourCC(unitType)
        for ____, unitHandle in ipairs(allUnits) do
            if unitTypeNum == GetUnitTypeId(unitHandle) then
                callback(nil, unitHandle)
            end
        end
    else
        for ____, unitHandle in ipairs(allUnits) do
            callback(nil, unitHandle)
        end
    end
end
function SelectUtil.getPlayerUnits(playerIndex, unitType)
    local resultUnits = {}
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    if unitType then
        local unitTypeNum = FourCC(unitType)
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                if unitTypeNum == GetUnitTypeId(unitHandle) then
                    resultUnits[#resultUnits + 1] = unitHandle
                end
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    else
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                resultUnits[#resultUnits + 1] = unitHandle
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
    return resultUnits
end
function SelectUtil.forPlayerUnits(callback, playerIndex, unitType)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    if unitType then
        local unitTypeNum = FourCC(unitType)
        do
            local i = 0
            while i <= 1000000 do
                local unitHandle = FirstOfGroup(group)
                if not IsHandle(unitHandle) then
                    break
                end
                if unitTypeNum == GetUnitTypeId(unitHandle) then
                    callback(nil, unitHandle)
                end
                GroupRemoveUnit(group, unitHandle)
                i = i + 1
            end
        end
    else
        GroupUtil["for"](GroupUtil, group, callback)
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forPlayerAliveUnits(callback, playerIndex)
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsOfPlayer(
        group,
        Player(playerIndex),
        nil
    )
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if UnitStateUtil:isAlive(unitHandle) then
                callback(nil, unitHandle)
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.forAllEnemyUnits(callback, whoseEnemy)
    if whoseEnemy == nil then
        whoseEnemy = Player(0)
    end
    local group = GroupUtil.groupObjectPool:borrowObject()
    GroupEnumUnitsInRect(group, bj_mapInitialPlayableArea, nil)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(group)
            if not IsHandle(unitHandle) then
                break
            end
            if IsUnitEnemy(unitHandle, whoseEnemy) then
                callback(nil, unitHandle)
            end
            GroupRemoveUnit(group, unitHandle)
            i = i + 1
        end
    end
    GroupUtil.groupObjectPool:returnObject(group)
end
function SelectUtil.getRandomEnemyInRange(whichUnit, range)
    local units = ____exports.default.getEnemyUnitsInRange(whichUnit, range)
    return ArrayUtil:randomElement(units)
end
function SelectUtil.getNearestEnemyInRange(whichUnit, maxRange)
    local enemyUnits = ____exports.default.getEnemyUnitsInRange(whichUnit, maxRange)
    if enemyUnits == nil then
        return nil
    end
    if #enemyUnits == 1 then
        return enemyUnits[1]
    end
    local minDis = maxRange
    local minDisUnit = enemyUnits[1]
    local bx = GetUnitX(whichUnit)
    local by = GetUnitY(whichUnit)
    for ____, enemyUnit in ipairs(enemyUnits) do
        local distance = MathUtil.distanceBetweenPoints(
            bx,
            by,
            GetUnitX(enemyUnit),
            GetUnitY(enemyUnit)
        )
        if distance < minDis then
            minDis = distance
            minDisUnit = enemyUnit
        end
    end
    return minDisUnit
end
function SelectUtil.getFarthestEnemyInRange(whichUnit, range)
    local units = ____exports.default.getEnemyUnitsInRange(whichUnit, range)
    local returnUnitHandle = nil
    local tempDistance = -1
    for ____, unitHandle in ipairs(units) do
        local distance = MathUtil.distanceBetweenPoints(
            GetUnitX(whichUnit),
            GetUnitY(whichUnit),
            GetUnitX(unitHandle),
            GetUnitY(unitHandle)
        )
        if tempDistance < 0 or distance > tempDistance then
            returnUnitHandle = unitHandle
            tempDistance = distance
        end
    end
    return returnUnitHandle
end
function SelectUtil.forLocalCameraUnits(inCameraUnitsCallback, outCameraUnitsCallback, frustumTop, frustumBottom, frustumLeft, frustumRight)
    if frustumTop == nil then
        frustumTop = 0.56
    end
    if frustumBottom == nil then
        frustumBottom = 0.13
    end
    if frustumLeft == nil then
        frustumLeft = 0
    end
    if frustumRight == nil then
        frustumRight = 0.8
    end
    if not isEmbedJapi then
        log.errorWithTraceBack("没有内置japi环境！")
        return
    end
    local minX, maxY = screen_to_world(frustumLeft, 0.6 - frustumTop)
    local maxX, max2Y = screen_to_world(frustumRight, 0.6 - frustumTop)
    local max2X, minY = screen_to_world(frustumRight, 0.6 - frustumBottom)
    local tempGroup = _sl_tempGroup2
    GroupClear(tempGroup)
    GroupEnumUnitsInRect(tempGroup, bj_mapInitialPlayableArea, nil)
    do
        local i = 0
        while i <= 1000000 do
            do
                local unitHandle = FirstOfGroup(tempGroup)
                if not IsHandle(unitHandle) then
                    break
                end
                local x = GetUnitX(unitHandle)
                if x > minX and x < maxX then
                    local y = GetUnitY(unitHandle)
                    if y > minY and y < maxY then
                        inCameraUnitsCallback(nil, unitHandle)
                        GroupRemoveUnit(tempGroup, unitHandle)
                        goto __continue130
                    end
                end
                if outCameraUnitsCallback then
                    outCameraUnitsCallback(nil, unitHandle)
                end
                GroupRemoveUnit(tempGroup, unitHandle)
            end
            ::__continue130::
            i = i + 1
        end
    end
end
SelectUtil.cache = __TS__New(Cache)
return ____exports
