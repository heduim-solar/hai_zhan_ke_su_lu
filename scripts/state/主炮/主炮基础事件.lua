local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 13,["33"] = 14,["34"] = 17,["35"] = 18,["36"] = 19,["38"] = 22,["39"] = 23,["40"] = 24,["41"] = 32,["42"] = 33,["43"] = 34,["45"] = 37,["46"] = 38,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 43,["52"] = 45,["53"] = 46,["54"] = 47,["55"] = 48,["56"] = 49,["57"] = 50,["58"] = 51,["59"] = 53,["60"] = 53,["61"] = 53,["62"] = 54,["65"] = 57,["66"] = 58,["67"] = 59,["69"] = 61,["70"] = 53,["71"] = 53,["73"] = 65,["74"] = 14,["75"] = 68,["76"] = 69,["77"] = 70,["78"] = 71,["80"] = 68,["81"] = 89,["82"] = 90,["85"] = 93,["86"] = 94,["88"] = 96,["89"] = 97,["92"] = 101,["93"] = 102,["94"] = 103,["95"] = 105,["96"] = 105,["97"] = 105,["98"] = 105,["99"] = 106,["100"] = 107,["101"] = 109,["102"] = 110,["103"] = 111,["104"] = 112,["106"] = 114,["107"] = 115,["108"] = 116,["110"] = 118,["112"] = 121,["113"] = 121,["114"] = 121,["115"] = 121,["116"] = 122,["117"] = 123,["118"] = 124,["119"] = 125,["120"] = 126,["121"] = 127,["123"] = 129,["124"] = 130,["125"] = 131,["126"] = 132,["128"] = 134,["130"] = 137,["131"] = 137,["132"] = 137,["133"] = 137,["134"] = 138,["135"] = 139,["136"] = 140,["137"] = 141,["138"] = 142,["140"] = 144,["141"] = 145,["142"] = 146,["143"] = 147,["145"] = 89,["146"] = 153,["147"] = 155,["148"] = 156,["149"] = 157,["151"] = 159,["153"] = 161,["154"] = 162,["155"] = 163,["157"] = 165,["159"] = 153});
local ____exports = {}
local ____AutoMissileAttackController = require("solar.solar-common.controller.AutoMissileAttackController")
local AutoMissileAttackController = ____AutoMissileAttackController.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local _____4E3B_70AE_5B58_6863A = require("xlsx.存档.主炮存档A")
local ____d__4E3B_70AE_5B58_6863A = _____4E3B_70AE_5B58_6863A["d_主炮存档A"]
local _____4E3B_70AE_5B58_6863B = require("xlsx.存档.主炮存档B")
local ____d__4E3B_70AE_5B58_6863B = _____4E3B_70AE_5B58_6863B["d_主炮存档B"]
local _____4E3B_70AE_5B58_6863C = require("xlsx.存档.主炮存档C")
local ____d__4E3B_70AE_5B58_6863C = _____4E3B_70AE_5B58_6863C["d_主炮存档C"]
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
local _____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A = require("state.主炮.主炮演员属性实时刷新提示")
local _____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A = _____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A.default
____exports.default = __TS__Class()
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = ____exports.default
_____4E3B_70AE_57FA_7840_4E8B_4EF6.name = "主炮基础事件"
function _____4E3B_70AE_57FA_7840_4E8B_4EF6.prototype.____constructor(self)
end
function _____4E3B_70AE_57FA_7840_4E8B_4EF6.onUnitChange(self, actor, unit)
    if actor.autoMissileAttackController then
        actor.autoMissileAttackController:destroy()
        actor.autoMissileAttackController = nil
    end
    if unit ~= nil and UnitUtil.isHero(unit) then
        local actorType = actor.actorType
        local ctrl = __TS__New(AutoMissileAttackController, unit)
        ctrl.range = actorType["sc_射程"]
        if actorType.stateFormula == nil then
            log.errorWithTraceBack("没有伤害公式!")
        end
        ctrl.coolDown = actorType["ss_射速"]
        ctrl.speed = math.max(1000 / ctrl.coolDown, 1500)
        ctrl.damageStateFormula = __TS__ObjectAssign({}, actorType.stateFormula)
        ctrl.damageName = actorType.name
        if actorType.missileModel then
            ctrl.projectileModelPath = actorType.missileModel
        end
        ctrl.targetCount = actorType["最大目标数量"] or 1
        ctrl.colorR = actorType.colorR or 255
        ctrl.colorG = actorType.colorG or 255
        ctrl.colorB = actorType.colorB or 255
        ctrl.alpha = actorType.alpha or 255
        actor.autoMissileAttackController = ctrl
        ctrl:start()
        BaseUtil.runLater(
            0.1,
            function()
                if not IsHandle(actor.unit) or actor:isDestroyed() then
                    return
                end
                ____exports.default["主炮存档道具加强"](____exports.default, actor)
                if actor.actorType.class == "主炮" then
                    _____9B54_6539_9053_5177["主炮商城道具加强"](_____9B54_6539_9053_5177, actor)
                end
                _____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A["刷新提示"](_____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A, actor)
            end
        )
    end
    return actor.autoMissileAttackController
end
function _____4E3B_70AE_57FA_7840_4E8B_4EF6.onDestroy(self, actor)
    if actor.autoMissileAttackController then
        actor.autoMissileAttackController:destroy()
        actor.autoMissileAttackController = nil
    end
end
_____4E3B_70AE_57FA_7840_4E8B_4EF6["主炮存档道具加强"] = function(self, actor)
    if actor == nil or actor.actorType.index == nil or actor.unit == nil then
        return
    end
    if actor.actorType.class ~= "主炮" then
        return false
    end
    local ctrl = actor.autoMissileAttackController
    if ctrl == nil then
        return
    end
    local player = actor.unitOwner
    local index = actor.actorType.index
    local maxLimit = PlatUtil:getMapLevel(player) * 2
    local cdVal = ArchiveUtil:get(
        player,
        "_zp_a_" .. tostring(index)
    )
    if cdVal and cdVal > 0 then
        cdVal = math.min(cdVal, maxLimit)
        local v = ____d__4E3B_70AE_5B58_6863A[index + 1].value
        local xs = 1 + cdVal * 0.1
        if cdVal >= 5 then
            xs = xs + 1
        end
        ____exports.default["属性附加效果"](____exports.default, actor, cdVal)
        if ctrl.damageStateFormula then
            ctrl.damageStateFormula.increased = (ctrl.damageStateFormula.increased or 0) + v * xs
        end
        print((actor:getName() .. "获得主炮存档伤害增强：") .. tostring(v))
    end
    cdVal = ArchiveUtil:get(
        player,
        "_zp_b_" .. tostring(index)
    )
    if cdVal and cdVal > 0 then
        cdVal = math.min(cdVal, maxLimit)
        local v = ____d__4E3B_70AE_5B58_6863B[index + 1].value
        local xs = 1 + cdVal * 0.1
        if cdVal >= 5 then
            xs = xs + 1
        end
        ____exports.default["属性附加效果"](____exports.default, actor, cdVal)
        ctrl.coolDown = ctrl.coolDown * (1 - v * xs)
        if ctrl.coolDown < 0.05 then
            ctrl.coolDown = 0.05
        end
        print((actor:getName() .. "获得主炮射速：") .. tostring(v))
    end
    cdVal = ArchiveUtil:get(
        player,
        "_zp_c_" .. tostring(index)
    )
    if cdVal and cdVal > 0 then
        cdVal = math.min(cdVal, maxLimit)
        local xs = 1 + cdVal * 0.1
        if cdVal >= 5 then
            xs = xs + 1
        end
        ____exports.default["属性附加效果"](____exports.default, actor, cdVal)
        local v = ____d__4E3B_70AE_5B58_6863C[index + 1].value
        ctrl.range = ctrl.range + v * xs
        print((actor:getName() .. "获得主炮射程：") .. tostring(v))
    end
end
_____4E3B_70AE_57FA_7840_4E8B_4EF6["属性附加效果"] = function(self, actor, level)
    if level >= 10 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.full_property = (actor.attribute.full_property or 0) + 100
    end
    if level >= 15 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.full_property_p = (actor.attribute.full_property_p or 0) + 0.2
    end
end
return ____exports
