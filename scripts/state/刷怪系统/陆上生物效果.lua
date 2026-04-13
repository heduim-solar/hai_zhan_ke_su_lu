local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 12,["30"] = 12,["31"] = 13,["32"] = 13,["33"] = 15,["34"] = 15,["35"] = 15,["37"] = 19,["38"] = 19,["39"] = 20,["40"] = 21,["41"] = 22,["42"] = 23,["43"] = 24,["44"] = 25,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 27,["49"] = 26,["50"] = 26,["51"] = 25,["54"] = 34,["55"] = 35,["56"] = 36,["57"] = 37,["58"] = 35,["61"] = 42,["62"] = 43,["63"] = 44,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 44,["69"] = 42,["70"] = 19,["71"] = 19,["72"] = 19,["74"] = 51,["75"] = 51,["76"] = 53,["77"] = 54,["78"] = 54,["79"] = 54,["80"] = 54,["81"] = 54,["82"] = 54,["83"] = 54,["84"] = 56,["85"] = 57,["86"] = 58,["87"] = 59,["88"] = 59,["89"] = 59,["90"] = 60,["91"] = 61,["92"] = 62,["93"] = 59,["94"] = 59,["95"] = 51,["98"] = 68,["99"] = 74,["100"] = 75,["101"] = 76,["102"] = 77,["103"] = 78,["104"] = 79,["105"] = 81,["107"] = 83,["108"] = 83,["109"] = 83,["110"] = 85,["111"] = 83,["112"] = 83,["113"] = 83,["114"] = 78,["116"] = 76,["117"] = 97,["118"] = 98,["119"] = 99,["120"] = 100,["121"] = 101,["123"] = 103,["124"] = 103,["125"] = 103,["127"] = 104,["128"] = 104,["129"] = 105,["130"] = 105,["131"] = 105,["132"] = 105,["133"] = 105,["134"] = 105,["135"] = 105,["136"] = 106,["137"] = 104,["140"] = 103,["141"] = 103,["142"] = 103,["143"] = 103,["144"] = 110,["145"] = 111,["146"] = 112,["147"] = 112,["148"] = 112,["149"] = 113,["150"] = 113,["151"] = 113,["152"] = 113,["153"] = 113,["154"] = 113,["155"] = 113,["156"] = 114,["157"] = 115,["158"] = 112,["159"] = 112,["160"] = 98,["161"] = 127,["162"] = 128,["163"] = 129,["164"] = 130,["165"] = 131,["166"] = 132,["167"] = 133,["170"] = 129,["171"] = 137,["172"] = 138,["173"] = 139,["174"] = 140,["175"] = 141,["177"] = 143,["179"] = 137,["180"] = 146,["181"] = 147,["182"] = 148,["184"] = 146,["185"] = 158,["186"] = 159,["187"] = 160,["188"] = 161,["189"] = 161,["190"] = 161,["191"] = 162,["192"] = 161,["193"] = 161,["194"] = 160,["195"] = 173,["196"] = 173,["197"] = 173,["198"] = 173,["199"] = 173,["200"] = 173,["201"] = 173,["202"] = 180,["203"] = 181,["204"] = 182,["205"] = 183,["206"] = 185,["208"] = 187,["209"] = 187,["210"] = 187,["211"] = 189,["212"] = 187,["213"] = 187,["214"] = 187,["215"] = 182,["216"] = 181,["217"] = 193,["218"] = 194,["219"] = 194,["220"] = 194,["221"] = 195,["222"] = 194,["223"] = 194,["224"] = 194,["225"] = 197,["226"] = 197,["227"] = 197,["228"] = 198,["229"] = 199,["230"] = 199,["231"] = 199,["232"] = 199,["233"] = 199,["234"] = 199,["235"] = 199,["236"] = 199,["237"] = 197,["238"] = 197,["239"] = 197,["240"] = 193,["241"] = 17});
local ____exports = {}
local _____9646_4E0A_751F_7269_5355_4F4D_6F14_5458 = require("xlsx.单位.陆上生物单位演员")
local ____d__9646_4E0A_751F_7269_5355_4F4D_6F14_5458 = _____9646_4E0A_751F_7269_5355_4F4D_6F14_5458["d_陆上生物单位演员"]
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____l__9646_4E0A_751F_7269 = require("_sl_editor.l_陆上生物")
local ____l__9646_4E0A_751F_7269 = ____l__9646_4E0A_751F_7269["l_陆上生物"]
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____88AB_653B_51FB_65F6_65E0_654C = require("state.组件.被攻击时无敌")
local _____88AB_653B_51FB_65F6_65E0_654C = _____88AB_653B_51FB_65F6_65E0_654C.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____VestAbilityUtil = require("solar.solar-common.util.unit.VestAbilityUtil")
local VestAbilityUtil = ____VestAbilityUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local _____9646_4E0A_751F_7269_6548_679C = ____exports.default
_____9646_4E0A_751F_7269_6548_679C.name = "陆上生物效果"
function _____9646_4E0A_751F_7269_6548_679C.prototype.____constructor(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            local appActorType = actorType
            appActorType.unitInRangeValue = 200
            appActorType.abilities = {"AInv"}
            if appActorType.bountyItems then
                for bountyItemsKey in pairs(appActorType.bountyItems) do
                    appActorType.onCreated = function(____, actor)
                        BaseUtil.runLater(
                            0.1,
                            function()
                                ActorItemUtil:addActorItemForUnit(bountyItemsKey, actor.unit)
                            end
                        )
                    end
                end
            end
            if actorType.id == "岛主" then
                appActorType.onUnitDeath = function(____, actor)
                    TextTagUtil.textWarn("岛主死亡", actor.unit)
                    PingMinimap(actor.unitX, actor.unitY, 5)
                end
                return
            end
            appActorType.onUnitInRange = function(____, actor, enteringUnit)
                if GetPlayerId(GetOwningPlayer(enteringUnit)) < 4 then
                    SetUnitOwner(
                        actor.unit,
                        PlayerUtil:neutralAggressivePlayer(),
                        true
                    )
                end
            end
        end,
        "陆上生物"
    )
    do
        local i = 0
        while i < #____d__9646_4E0A_751F_7269_5355_4F4D_6F14_5458 and i < 4 do
            local loc = ____l__9646_4E0A_751F_7269[i * 2 + 1]
            local actorUnit = ActorUnitUtil:createActorUnit(
                PlayerUtil:neutralPassivePlayer(),
                ____d__9646_4E0A_751F_7269_5355_4F4D_6F14_5458[i + 1].id,
                loc.x,
                loc.y,
                loc.face
            )
            local texttag = TextTagUtil.text("|cffff0000靠近激活挑战", actorUnit.unit)
            SetTextTagVelocity(texttag, 0, 0)
            SetTextTagPermanent(texttag, true)
            actorUnit:set(
                "onDestroy",
                function()
                    SetTextTagLifespan(texttag, 1)
                    SetTextTagVisibility(texttag, false)
                    SetTextTagPermanent(texttag, false)
                end
            )
            i = i + 1
        end
    end
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("强盗领主")
    actorType.onUnitDamaged = __TS__New(_____88AB_653B_51FB_65F6_65E0_654C).onUnitDamaged
    actorType.onUnitChange = function(____, actor, unit)
        if IsHandle(unit) then
            se:onUnitDeath(function(e)
                if e.trigUnitTypeIdStr == "A41b" then
                    actor:destroy()
                end
                ActorUnitUtil:ifHasActorUnit(
                    e.trigUnit,
                    function()
                        actor:destroy()
                    end,
                    "无敌战舰号"
                )
            end)
        end
    end
    actorType = ActorTypeUtil:getActorType("农场")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if IsHandle(killingUnit) then
            gv["打爆农场的玩家"] = GetOwningPlayer(killingUnit)
            TextTagUtil.text("你打爆了农场！等着岛主10分钟后来找你算账吧!", killingUnit)
        end
        BaseUtil.runLater(
            1,
            function()
                do
                    local i = 0
                    while i < 10 do
                        local actorUnit = ActorUnitUtil:createActorUnit(
                            PlayerUtil:neutralAggressivePlayer(),
                            "农民",
                            actor.unitX,
                            actor.unitY,
                            270
                        )
                        actorUnit:applyTimedLife(12)
                        i = i + 1
                    end
                end
            end,
            10,
            true
        )
        local x = actor.unitX
        local y = actor.unitY
        BaseUtil.runLater(
            600,
            function()
                ActorUnitUtil:createActorUnit(
                    PlayerUtil:neutralAggressivePlayer(),
                    "岛主",
                    x,
                    y,
                    270
                )
                PlayerUtil:message("|cffff0000岛主出现并将向你发动攻击了！请做好准备")
                PingMinimap(actor.unitX, actor.unitY, 3)
            end
        )
    end
    actorType = ActorTypeUtil:getActorType("岛主")
    actorType.interval = 10
    actorType.onCreated = function(____, actor)
        if IsHandle(gv["打爆农场的玩家"]) then
            local hero = PlayerUtil:getHero(gv["打爆农场的玩家"])
            if IsHandle(hero) then
                UnitStateUtil:orderAttackTarget(actor.unit, hero)
            end
        end
    end
    actorType.onUnitInterval = function(____, actor)
        if IsHandle(gv["打爆农场的玩家"]) then
            local hero = PlayerUtil:getHero(gv["打爆农场的玩家"])
            if IsHandle(hero) then
                UnitStateUtil:orderAttackTarget(actor.unit, hero)
            end
            PingMinimap(actor.unitX, actor.unitY, 3)
        end
    end
    actorType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.3) then
            UnitStateUtil:stunUnit(enemy, 0.5)
        end
    end
    actorType = ActorTypeUtil:getActorType("巫师")
    actorType.interval = 10
    actorType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        actor:ifReady(
            15,
            function()
                VestAbilityUtil:polymorph(enemy, 5)
            end
        )
    end
    ActorTypeUtil:registerActorType({
        id = "兽族酋长振奋Buff",
        name = "振奋",
        describe = "攻击+500%",
        attribute = {attack_p = 5},
        dur = 10
    })
    actorType = ActorTypeUtil:getActorType("兽族酋长")
    actorType.onCreated = function(____, actor)
        se:onUnitDeath(function(e)
            if e.trigUnitTypeIdStr == "A41c" then
                actor:destroy()
            end
            ActorUnitUtil:ifHasActorUnit(
                e.trigUnit,
                function()
                    actor:destroy()
                end,
                "巨型海怪"
            )
        end)
    end
    actorType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        actor:ifReady(
            20,
            function()
                ActorBuffUtil:addActorBuff(actor.unit, "兽族酋长振奋Buff")
            end,
            "振奋Buff"
        )
        actor:ifReady(
            30,
            function()
                local damage = UnitStateUtil:calculateStateFormula({attack = 5}, actor.unit)
                VestAbilityUtil:lightningChain(
                    actor.unit,
                    enemy,
                    damage,
                    7,
                    999999,
                    0.01
                )
            end,
            "闪电链"
        )
    end
end
return ____exports
