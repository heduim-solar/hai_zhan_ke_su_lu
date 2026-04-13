local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 7,["13"] = 7,["14"] = 7,["16"] = 7,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["22"] = 24,["23"] = 26,["24"] = 27,["25"] = 28,["27"] = 30,["28"] = 30,["29"] = 30,["30"] = 30,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 33,["36"] = 36,["37"] = 37,["38"] = 38,["41"] = 41,["42"] = 43,["43"] = 44,["44"] = 53,["45"] = 53,["46"] = 53,["47"] = 53,["48"] = 54,["49"] = 54,["50"] = 55,["51"] = 60,["52"] = 62,["53"] = 63,["57"] = 68,["58"] = 69,["59"] = 70,["61"] = 72,["62"] = 73,["63"] = 74,["64"] = 75,["67"] = 78,["68"] = 19,["69"] = 81,["70"] = 82,["73"] = 85,["74"] = 87,["75"] = 88,["77"] = 91,["78"] = 92,["79"] = 93,["80"] = 94,["81"] = 95,["82"] = 94,["84"] = 98,["85"] = 99,["86"] = 100,["87"] = 102,["89"] = 104,["90"] = 98,["92"] = 108,["93"] = 109,["94"] = 110,["95"] = 111,["96"] = 125,["97"] = 126,["98"] = 127,["99"] = 128,["100"] = 129,["101"] = 129,["102"] = 129,["103"] = 129,["104"] = 129,["105"] = 130,["106"] = 131,["107"] = 132,["113"] = 140,["114"] = 108,["115"] = 81,["116"] = 11,["117"] = 14});
local ____exports = {}
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local MessageUtil = ____exports.default
MessageUtil.name = "MessageUtil"
function MessageUtil.prototype.____constructor(self)
end
function MessageUtil._sl_onHookMsg(self, msg)
    local ____type = msg.type
    if ____type == nil then
        return true
    end
    if ____type == "key_down" then
    elseif ____type == "mouse_ability" then
        if msg.ability == nil then
            return true
        end
        local ____opt_0 = DataBase:getAbilityTypeSolarData(
            id2string(msg.ability),
            false
        )
        local actor = ____opt_0 and ____opt_0._SL_solarActorAbility
        if actor ~= nil then
            if actor:isPassive() or actor:isDisable() or actor:isHide() then
                return false
            end
            local b = actor:localClick(msg.code == 4 and 2 or 1, msg.x, msg.y)
            if b == false then
                return false
            end
        end
    elseif ____type == "mouse_item" then
        local order = msg.order
        local itemIndex = order - 852008
        local item = UnitItemInSlot(
            selection(),
            itemIndex
        )
        local ____opt_2 = DataBase:getItemSolarData(item, false)
        local actor = ____opt_2 and ____opt_2._SL_solarActorItem
        if actor ~= nil then
            local b = actor:localClick(msg.code == 4 and 2 or 1, msg.x, msg.y)
            if b == false then
                return false
            end
        end
    end
    local hookEventCallBacks = ____exports.default.hookEventCallBacks[____type]
    if hookEventCallBacks == nil then
        return true
    end
    for ____, callBack in ipairs(hookEventCallBacks) do
        local f = callBack(nil, msg)
        if f == false then
            return f
        end
    end
    return true
end
function MessageUtil._sl_init_message_hook(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    ____exports.default._sl_isInitialized = true
    if isEmbedJapi == false and isDebug then
        print("提示：部分we注册message.hook事件会导致释放技能崩溃!(标准ydwe不会！)")
    end
    local message = require("jass.message")
    local hook = message.hook
    if hook == nil then
        message.hook = function(msg)
            return ____exports.default:_sl_onHookMsg(msg)
        end
    else
        message.hook = function(msg)
            local flag = ____exports.default:_sl_onHookMsg(msg)
            if flag == false then
                return flag
            end
            return hook(msg)
        end
    end
    _G.WindowEventCallBack = function(eventId)
        if eventId == 1 then
            local sceneX = InputUtil:getMouseSceneX()
            local sceneY = InputUtil:getMouseSceneY()
            local xyObj = AbilityButtonUtil:getPosBySceneXY(sceneX, sceneY)
            if xyObj ~= nil then
                local abilityId = button(xyObj.x, xyObj.y)
                if abilityId ~= nil and abilityId ~= 0 then
                    local ____opt_4 = DataBase:getAbilityTypeSolarData(
                        id2string(abilityId),
                        false
                    )
                    local actor = ____opt_4 and ____opt_4._SL_solarActorAbility
                    if actor ~= nil then
                        if actor:isPassive() or actor:isDisable() or actor:isHide() then
                            return true
                        end
                    end
                end
            end
        end
        return false
    end
end
MessageUtil.hookEventCallBacks = {}
MessageUtil._sl_isInitialized = false
return ____exports
