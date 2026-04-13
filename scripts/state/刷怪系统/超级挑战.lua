local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 11,["26"] = 13,["27"] = 13,["28"] = 13,["30"] = 19,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 22,["38"] = 22,["39"] = 25,["40"] = 26,["41"] = 28,["42"] = 29,["43"] = 30,["44"] = 30,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 30,["49"] = 30,["50"] = 33,["51"] = 34,["52"] = 34,["53"] = 34,["54"] = 34,["55"] = 35,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 37,["60"] = 37,["61"] = 37,["62"] = 37,["63"] = 39,["64"] = 39,["65"] = 39,["66"] = 39,["67"] = 41,["68"] = 43,["69"] = 43,["70"] = 45,["73"] = 49,["74"] = 50,["75"] = 43,["76"] = 43,["77"] = 43,["78"] = 20,["79"] = 16,["80"] = 85,["81"] = 86,["82"] = 88,["84"] = 90,["85"] = 90,["86"] = 91,["87"] = 92,["88"] = 93,["89"] = 94,["90"] = 95,["91"] = 96,["92"] = 97,["94"] = 99,["96"] = 101,["97"] = 102,["99"] = 104,["100"] = 105,["101"] = 106,["102"] = 106,["103"] = 106,["104"] = 106,["105"] = 90,["108"] = 85,["109"] = 115,["110"] = 116,["111"] = 117,["112"] = 118,["113"] = 124,["114"] = 125,["115"] = 132,["116"] = 133,["117"] = 134,["118"] = 135,["119"] = 136,["120"] = 137,["121"] = 138,["122"] = 139,["123"] = 140,["124"] = 141,["125"] = 142,["127"] = 144,["128"] = 115,["129"] = 77,["130"] = 77,["131"] = 77,["132"] = 77,["133"] = 77,["134"] = 77,["135"] = 77,["136"] = 77,["137"] = 77,["138"] = 77,["139"] = 77,["140"] = 77,["141"] = 77,["142"] = 77,["143"] = 77,["144"] = 77,["145"] = 77,["146"] = 77,["147"] = 80,["148"] = 80,["149"] = 80,["150"] = 80,["151"] = 80,["152"] = 80,["153"] = 80,["154"] = 80,["155"] = 80,["156"] = 80,["157"] = 80,["158"] = 80,["159"] = 80,["160"] = 80,["161"] = 80,["162"] = 80,["163"] = 80,["164"] = 80});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____l__6311_6218_602A = require("_sl_editor.l_挑战怪")
local ____l__6311_6218_602A = ____l__6311_6218_602A["l_挑战怪"]
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local _____8FDB_653B_602A_6F14_5458 = require("xlsx.单位.进攻怪演员")
local ____d__8FDB_653B_602A_6F14_5458 = _____8FDB_653B_602A_6F14_5458["d_进攻怪演员"]
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
____exports.default = __TS__Class()
local _____8D85_7EA7_6311_6218 = ____exports.default
_____8D85_7EA7_6311_6218.name = "超级挑战"
function _____8D85_7EA7_6311_6218.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("超级挑战")
    actorType.onAction = function(____, actor, x, y, targetUnit)
        local loc = ____l__6311_6218_602A[GetRandomInt(1, #____l__6311_6218_602A - 1) + 1]
        local actorUnit = ActorUnitUtil:createActorUnit(
            PlayerUtil:neutralAggressivePlayer(),
            ____d__8FDB_653B_602A_6F14_5458[math.min(gv.enemyLevel - 1, #____d__8FDB_653B_602A_6F14_5458 - 1) + 1].id,
            loc.x,
            loc.y
        )
        MapUtil["根据难度数值加强怪物"](MapUtil, actorUnit.unit)
        local unitHandle = actorUnit.unit
        TextTagUtil.textWarn("超级挑战", unitHandle)
        SetUnitScale(unitHandle, 5, 5, 5)
        SetUnitVertexColor(
            unitHandle,
            255,
            100,
            100,
            200
        )
        local multiple = 100
        UnitStateUtil:setMaxLife(
            unitHandle,
            UnitStateUtil:getMaxLife(unitHandle) * multiple
        )
        UnitStateUtil:setUnitLifeP(unitHandle, 1)
        UnitStateUtil:setDamageBase(
            unitHandle,
            math.min(
                UnitStateUtil:getDamageMax(unitHandle) * multiple,
                2100000000
            )
        )
        UnitStateUtil:setArmor(
            unitHandle,
            (UnitStateUtil:getArmor(unitHandle) + settings.valueCoefficient) * settings.gameDifficulty
        )
        actorUnit:applyTimedLife(90)
        se:onUnitDeath(
            function(e)
                if not IsHandle(e.killingUnit) then
                    return
                end
                local actorItem = ActorItemUtil:createActorItem("污染的航海器", e.trigUnitX, e.trigUnitY)
                ____exports.default["初始化污染的航海器"](____exports.default, actorItem)
            end,
            actorUnit.unit
        )
    end
end
_____8D85_7EA7_6311_6218["初始化污染的航海器"] = function(self, actorItem)
    local Lv = GetRandomInt(1, 6)
    actorItem:setName("污染的航海器Lv" .. tostring(Lv))
    do
        local i = 1
        while i <= Lv do
            local randomIndex = GetRandomInt(0, #self.ctKeys - 1)
            local key = self.ctKeys[randomIndex + 1]
            local name = self.ctNames[randomIndex + 1]
            local val = ____exports.default:getRandomVal(key, i)
            local valStrInfo = ""
            if val < 10 then
                valStrInfo = TextUtil:toPercentage(val)
            else
                valStrInfo = TextUtil:toCnUnit(val)
            end
            if actorItem.attribute == nil then
                actorItem.attribute = {}
            end
            actorItem.attribute[key] = (actorItem.attribute[key] or 0) + val
            actorItem.extDescribeLast1 = "(PS:此装备不能被吞噬)"
            actorItem:setExtDescribe(
                ((("No." .. tostring(i)) .. ": ") .. name) .. " + |cff00ff00",
                valStrInfo
            )
            i = i + 1
        end
    end
end
function _____8D85_7EA7_6311_6218.getRandomVal(self, key, lv)
    local ri = GetRandomInt(lv, 10)
    local nandu = MapUtil:getRealNanduLevel()
    if key == "strength" or key == "agility" or key == "intelligence" or key == "attack" or key == "life" then
        return ri * nandu * 10 * gv.enemyLevel
    elseif key == "strength_p" or key == "agility_p" or key == "intelligence_p" or key == "attack_p" or key == "damage_increased" or key == "life_p" then
        return ri * 0.1
    elseif key == "def" then
        return ri * nandu
    elseif key == "def_p" then
        return ri * 0.05
    elseif key == "damage_reduction" then
        return GetRandomInt(lv, 10) * 0.01
    elseif key == "physical_critical_chance" then
        return GetRandomInt(lv, 10) * 0.02
    elseif key == "physical_critical_damage" then
        return ri * 0.5
    end
    return 1
end
_____8D85_7EA7_6311_6218.ctNames = {
    "力量",
    "敏捷",
    "智力",
    "攻击力",
    "力量增幅",
    "敏捷增幅",
    "智力增幅",
    "攻击力增幅",
    "伤害增幅",
    "伤害减免",
    "护甲",
    "护甲增幅",
    "生命值",
    "生命增幅",
    "暴击率",
    "暴击伤害"
}
_____8D85_7EA7_6311_6218.ctKeys = {
    "strength",
    "agility",
    "intelligence",
    "attack",
    "strength_p",
    "agility_p",
    "intelligence_p",
    "attack_p",
    "damage_increased",
    "damage_reduction",
    "def",
    "def_p",
    "life",
    "life_p",
    "physical_critical_chance",
    "physical_critical_damage"
}
return ____exports
