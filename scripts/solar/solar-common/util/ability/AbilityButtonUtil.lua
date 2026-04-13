local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 8,["15"] = 8,["16"] = 8,["18"] = 8,["19"] = 49,["20"] = 50,["21"] = 51,["22"] = 52,["23"] = 53,["24"] = 54,["25"] = 49,["26"] = 66,["27"] = 67,["28"] = 68,["29"] = 69,["30"] = 70,["31"] = 71,["33"] = 73,["34"] = 74,["37"] = 77,["38"] = 78,["39"] = 66,["40"] = 83,["41"] = 84,["44"] = 87,["45"] = 87,["46"] = 87,["47"] = 87,["48"] = 87,["49"] = 87,["51"] = 93,["52"] = 93,["53"] = 94,["54"] = 95,["55"] = 93,["58"] = 97,["59"] = 98,["60"] = 99,["61"] = 83,["62"] = 105,["63"] = 107,["64"] = 108,["65"] = 112,["66"] = 114,["67"] = 115,["68"] = 116,["71"] = 119,["72"] = 120,["73"] = 121,["75"] = 122,["76"] = 122,["78"] = 123,["79"] = 124,["80"] = 125,["82"] = 127,["83"] = 128,["85"] = 132,["86"] = 133,["87"] = 134,["88"] = 135,["89"] = 136,["90"] = 136,["91"] = 136,["92"] = 136,["93"] = 136,["94"] = 136,["95"] = 136,["96"] = 136,["98"] = 138,["102"] = 122,["105"] = 142,["106"] = 143,["107"] = 144,["110"] = 147,["111"] = 149,["112"] = 150,["114"] = 151,["115"] = 151,["116"] = 152,["117"] = 153,["118"] = 154,["119"] = 155,["120"] = 155,["121"] = 155,["122"] = 155,["123"] = 155,["124"] = 155,["125"] = 155,["126"] = 155,["129"] = 151,["132"] = 159,["136"] = 163,["137"] = 164,["139"] = 105,["140"] = 169,["142"] = 170,["143"] = 170,["144"] = 171,["145"] = 172,["146"] = 172,["147"] = 172,["148"] = 172,["149"] = 172,["150"] = 172,["151"] = 172,["152"] = 172,["153"] = 170,["156"] = 169,["157"] = 178,["159"] = 179,["160"] = 179,["161"] = 180,["162"] = 181,["163"] = 181,["164"] = 181,["165"] = 181,["166"] = 181,["167"] = 181,["168"] = 181,["169"] = 181,["170"] = 179,["173"] = 178,["174"] = 194,["175"] = 195,["176"] = 196,["178"] = 198,["179"] = 199,["180"] = 200,["181"] = 194,["182"] = 209,["183"] = 210,["184"] = 211,["186"] = 213,["187"] = 214,["188"] = 215,["189"] = 216,["191"] = 218,["193"] = 220,["194"] = 209,["195"] = 229,["196"] = 230,["197"] = 231,["198"] = 232,["199"] = 233,["200"] = 234,["202"] = 236,["203"] = 237,["204"] = 238,["206"] = 240,["209"] = 243,["211"] = 245,["212"] = 229,["213"] = 255,["214"] = 256,["215"] = 257,["216"] = 258,["218"] = 260,["219"] = 261,["220"] = 262,["222"] = 264,["223"] = 255,["224"] = 283,["225"] = 284,["226"] = 285,["227"] = 286,["228"] = 283,["229"] = 10,["230"] = 11,["231"] = 19,["232"] = 20,["233"] = 31,["234"] = 38,["235"] = 81,["236"] = 102,["237"] = 103,["238"] = 268,["239"] = 269,["240"] = 270,["241"] = 271,["242"] = 272,["243"] = 273});
local ____exports = {}
local ____FrameCallbackUtil = require("solar.solar-common.util.frame.FrameCallbackUtil")
local FrameCallbackUtil = ____FrameCallbackUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local AbilityButtonUtil = ____exports.default
AbilityButtonUtil.name = "AbilityButtonUtil"
function AbilityButtonUtil.prototype.____constructor(self)
end
function AbilityButtonUtil.setAbilityBottomButtonXAndHotKey(self, unit, abilityIdStr, x)
    local player = GetOwningPlayer(unit)
    local keyCode = ____exports.default.qwerKeyCodes[x + 1]
    AbilityUtil:setUnitAbilityHotkey(unit, abilityIdStr, keyCode, false)
    AbilityUtil:setUnitAbilityName(unit, abilityIdStr, ((_g_objs.ability[abilityIdStr].Name .. "(") .. ____exports.default.qwerKeyNames[x + 1]) .. ")", true)
    return ____exports.default:setAbilityBottomButtonX(abilityIdStr, x, player)
end
function AbilityButtonUtil.setAbilityBottomButtonX(self, abilityIdStr, x, player)
    abilityIdStr = LangUtil:getIntId(abilityIdStr)
    local sABXMPD = ____exports.default.syncAbilityIdButtonXMap[GetPlayerId(player)]
    if not sABXMPD then
        sABXMPD = {}
        ____exports.default.syncAbilityIdButtonXMap[GetPlayerId(player)] = sABXMPD
    end
    sABXMPD[abilityIdStr] = x
    if player ~= GetLocalPlayer() then
        return
    end
    ____exports.default:_sl_init_bottomButton_system()
    ____exports.default.abilityIdButtonXMap[abilityIdStr] = x
end
function AbilityButtonUtil._sl_init_bottomButton_system(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    ____exports.default._sl_bottomButtonArray = {
        DzFrameGetCommandBarButton(2, 0),
        DzFrameGetCommandBarButton(2, 1),
        DzFrameGetCommandBarButton(2, 2),
        DzFrameGetCommandBarButton(2, 3)
    }
    do
        local index = 0
        while index < 4 do
            local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
            DzFrameClearAllPoints(uiid)
            index = index + 1
        end
    end
    ____exports.default:_sl_resetBottomButton()
    FrameCallbackUtil:addFrameSetUpdateCallback(____exports.default._sl_refreshButton)
    ____exports.default._sl_isInitialized = true
end
function AbilityButtonUtil._sl_refreshButton()
    local noQwer = true
    local xwz = {____exports.default.onlySetButtons[1], ____exports.default.onlySetButtons[2], ____exports.default.onlySetButtons[3], ____exports.default.onlySetButtons[4]}
    local frameSelection = selection()
    if frameSelection ~= ____exports.default.lastFrameSelection then
        ____exports.default:_sl_hideBottomButton()
        ____exports.default.lastFrameSelection = frameSelection
        return
    end
    ____exports.default.lastFrameSelection = frameSelection
    local add = {}
    local noAbility = true
    do
        local index = 0
        while index < 4 do
            do
                local skid = button(index, 2)
                if skid == 0 or not skid then
                    goto __continue14
                end
                noAbility = false
                local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
                --- 注意单位 不能拥有相同位置的技能 否则会重叠按钮
                local realButtonX = ____exports.default.abilityIdButtonXMap[skid]
                if realButtonX then
                    xwz[realButtonX + 1] = true
                    noQwer = false
                    DzFrameSetPoint(
                        uiid,
                        8,
                        DzGetGameUI(),
                        8,
                        realButtonX * 0.0435 - 0.144,
                        0.007
                    )
                else
                    add[#add + 1] = uiid
                end
            end
            ::__continue14::
            index = index + 1
        end
    end
    if noAbility and not ____exports.default.lastNoAbility then
        ____exports.default:_sl_hideBottomButton()
        ____exports.default.lastNoAbility = noAbility
        return
    end
    ____exports.default.lastNoAbility = noAbility
    for ____, uiid in ipairs(add) do
        local bol = true
        do
            local index = 0
            while index < #xwz do
                if not xwz[index + 1] then
                    bol = false
                    xwz[index + 1] = true
                    DzFrameSetPoint(
                        uiid,
                        8,
                        DzGetGameUI(),
                        8,
                        index * 0.0435 - 0.144,
                        0.007
                    )
                    break
                end
                index = index + 1
            end
        end
        if bol then
            break
        end
    end
    if noQwer then
        ____exports.default:_sl_resetBottomButton()
    end
end
function AbilityButtonUtil._sl_hideBottomButton(self)
    do
        local index = 0
        while index < 4 do
            local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
            DzFrameSetPoint(
                uiid,
                8,
                DzGetGameUI(),
                8,
                -1,
                -1
            )
            index = index + 1
        end
    end
end
function AbilityButtonUtil._sl_resetBottomButton(self)
    do
        local index = 0
        while index < 4 do
            local uiid = ____exports.default._sl_bottomButtonArray[index + 1]
            DzFrameSetPoint(
                uiid,
                8,
                DzGetGameUI(),
                8,
                index * 0.0435 - 0.144,
                0.007
            )
            index = index + 1
        end
    end
end
function AbilityButtonUtil.getPosByNumber(self, number)
    if number < 1 or number > 12 then
        return {x = 0, y = -11}
    end
    local x = (number - 1) % 4
    local y = math.floor((number - 1) / 4)
    return {x = x, y = y}
end
function AbilityButtonUtil.getNumberByPos(self, xOrPos, y)
    if xOrPos == nil then
        return 0
    end
    local x = 0
    if y == nil then
        x = xOrPos.x
        y = xOrPos.y
    else
        x = xOrPos
    end
    return y * 4 + x + 1
end
function AbilityButtonUtil.getPos(self, xOrPosOrNum, y)
    local x = 0
    if y == nil then
        if LangUtil:isNumber(xOrPosOrNum) then
            if xOrPosOrNum == -1 then
                return {x = 0, y = -11}
            end
            local x = (xOrPosOrNum - 1) % 4
            local y = math.floor((xOrPosOrNum - 1) / 4)
            return {x = x, y = y}
        else
            return xOrPosOrNum
        end
    else
        x = xOrPosOrNum
    end
    return {x = x, y = y}
end
function AbilityButtonUtil.getPosBySceneXY(self, sceneX, sceneY)
    local rY = 2 - math.floor((sceneY - 0.01) / 0.041)
    if rY < 0 or rY > 2 then
        return nil
    end
    local rX = math.floor((sceneX - 0.618) / 0.0425)
    if rX < 0 or rX > 3 then
        return nil
    end
    return {x = rX, y = rY}
end
function AbilityButtonUtil.getUIXYByPos(self, x, y)
    local uiX = 0.8 - (3 - x) * (____exports.default.btnUIWidth + ____exports.default.btnUIXGap) - ____exports.default.btnUIXMargin
    local uiY = (2 - y) * (____exports.default.btnUIHeight + ____exports.default.btnUIYGap) + ____exports.default.btnUIYMargin
    return {x = uiX, y = uiY}
end
AbilityButtonUtil.qwerKeyCodes = {KeyCode.VK_Q, KeyCode.VK_W, KeyCode.VK_E, KeyCode.VK_R}
AbilityButtonUtil.qwerKeyNames = {"Q", "W", "E", "R"}
AbilityButtonUtil.onlySetButtons = {false, false, false, false}
AbilityButtonUtil._sl_bottomButtonArray = nil
AbilityButtonUtil.abilityIdButtonXMap = {}
AbilityButtonUtil.syncAbilityIdButtonXMap = {}
AbilityButtonUtil._sl_isInitialized = false
AbilityButtonUtil.lastFrameSelection = nil
AbilityButtonUtil.lastNoAbility = false
AbilityButtonUtil.btnUIWidth = 0.04
AbilityButtonUtil.btnUIHeight = 0.04
AbilityButtonUtil.btnUIXGap = 0.0035
AbilityButtonUtil.btnUIYGap = 0.0035
AbilityButtonUtil.btnUIXMargin = 0.012
AbilityButtonUtil.btnUIYMargin = 0.007
return ____exports
