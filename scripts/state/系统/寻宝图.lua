local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 19,["33"] = 19,["34"] = 19,["36"] = 20,["37"] = 20,["38"] = 21,["39"] = 22,["40"] = 23,["41"] = 24,["42"] = 25,["43"] = 26,["44"] = 27,["46"] = 29,["48"] = 20,["51"] = 19,["52"] = 19,["53"] = 19,["54"] = 19,["55"] = 34,["56"] = 35,["57"] = 36,["58"] = 37,["59"] = 38,["60"] = 39,["61"] = 40,["62"] = 42,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["67"] = 43,["68"] = 43,["69"] = 43,["70"] = 43,["72"] = 45,["74"] = 47,["75"] = 48,["76"] = 50,["77"] = 51,["78"] = 51,["79"] = 51,["80"] = 51,["81"] = 51,["82"] = 51,["83"] = 51,["84"] = 51,["86"] = 53,["88"] = 55,["89"] = 56,["90"] = 58,["91"] = 59,["92"] = 60,["93"] = 60,["94"] = 60,["95"] = 60,["96"] = 60,["97"] = 60,["98"] = 60,["99"] = 60,["101"] = 62,["103"] = 64,["104"] = 65,["105"] = 67,["106"] = 68,["107"] = 68,["108"] = 68,["109"] = 68,["110"] = 68,["111"] = 68,["112"] = 68,["113"] = 68,["115"] = 70,["118"] = 73,["119"] = 34,["120"] = 16,["121"] = 80,["122"] = 81,["123"] = 82,["124"] = 83,["125"] = 83,["126"] = 83,["127"] = 83,["128"] = 85,["129"] = 80});
local ____exports = {}
local ____l__6C34_624B_5BFB_5B9D_56FE = require("_sl_editor.l_水手寻宝图")
local ____l__6C34_624B_5BFB_5B9D_56FE = ____l__6C34_624B_5BFB_5B9D_56FE["l_水手寻宝图"]
local _____85CF_5B9D_56FE = require("xlsx.装备.藏宝图")
local ____d__85CF_5B9D_56FE = _____85CF_5B9D_56FE["d_藏宝图"]
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____l__51B0_971C_5BFB_5B9D_56FE = require("_sl_editor.l_冰霜寻宝图")
local ____l__51B0_971C_5BFB_5B9D_56FE = ____l__51B0_971C_5BFB_5B9D_56FE["l_冰霜寻宝图"]
local ____l__9EC4_91D1_5BFB_5B9D_56FE = require("_sl_editor.l_黄金寻宝图")
local ____l__9EC4_91D1_5BFB_5B9D_56FE = ____l__9EC4_91D1_5BFB_5B9D_56FE["l_黄金寻宝图"]
local ____l__9ED1_8272_5BFB_5B9D_56FE = require("_sl_editor.l_黑色寻宝图")
local ____l__9ED1_8272_5BFB_5B9D_56FE = ____l__9ED1_8272_5BFB_5B9D_56FE["l_黑色寻宝图"]
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MapHeroUtil = require("util.MapHeroUtil")
local MapHeroUtil = ____MapHeroUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____l__8D77_59CB_70B9 = require("_sl_editor.l_起始点")
local ____l__8D77_59CB_70B9 = ____l__8D77_59CB_70B9["l_起始点"]
____exports.default = __TS__Class()
local _____5BFB_5B9D_56FE = ____exports.default
_____5BFB_5B9D_56FE.name = "寻宝图"
function _____5BFB_5B9D_56FE.prototype.____constructor(self)
    BaseUtil.runLater(
        120,
        function()
            do
                local i = 0
                while i < 1 do
                    local nextInt = RandomUtil.nextInt(0, 4)
                    if nextInt == 0 then
                        ____exports.default:createItem(____l__6C34_624B_5BFB_5B9D_56FE, ____d__85CF_5B9D_56FE[1].id)
                    elseif nextInt == 1 then
                        ____exports.default:createItem(____l__51B0_971C_5BFB_5B9D_56FE, ____d__85CF_5B9D_56FE[2].id)
                    elseif nextInt == 2 then
                        ____exports.default:createItem(____l__9ED1_8272_5BFB_5B9D_56FE, ____d__85CF_5B9D_56FE[3].id)
                    else
                        ____exports.default:createItem(____l__9EC4_91D1_5BFB_5B9D_56FE, ____d__85CF_5B9D_56FE[4].id)
                    end
                    i = i + 1
                end
            end
        end,
        16,
        false
    )
    se:onUnitPickupItem(function(e, solarTrigger)
        local itemTypeIdStr = e.manipulatedItemTypeIdStr
        local unitTypeIdStr = e.trigUnitTypeIdStr
        local trigUnitOwner = e.trigUnitOwner
        solarTrigger.enable = false
        if itemTypeIdStr == ____d__85CF_5B9D_56FE[1].id then
            if unitTypeIdStr == "A400" then
                RemoveItem(e.manipulatedItem)
                MapHeroUtil["do进化ByTypeAndKeepAbility"](
                    MapHeroUtil,
                    trigUnitOwner,
                    2,
                    "A401",
                    false,
                    false
                )
            else
                PlayerUtil:text(trigUnitOwner, "只有水手号才能拾取此藏宝图进阶!")
            end
        elseif itemTypeIdStr == ____d__85CF_5B9D_56FE[2].id then
            if unitTypeIdStr == "A402" then
                RemoveItem(e.manipulatedItem)
                MapHeroUtil["do进化ByTypeAndKeepAbility"](
                    MapHeroUtil,
                    trigUnitOwner,
                    2,
                    "A403",
                    false,
                    false
                )
            else
                PlayerUtil:text(trigUnitOwner, "只有铁达尼号才能拾取此藏宝图进阶!")
            end
        elseif itemTypeIdStr == ____d__85CF_5B9D_56FE[3].id then
            if unitTypeIdStr == "A404" then
                RemoveItem(e.manipulatedItem)
                UnitUtil.transfer(e.trigUnit, ____l__8D77_59CB_70B9[1].x, ____l__8D77_59CB_70B9[1].y)
                MapHeroUtil["do进化ByTypeAndKeepAbility"](
                    MapHeroUtil,
                    trigUnitOwner,
                    2,
                    "A405",
                    false,
                    false
                )
            else
                PlayerUtil:text(trigUnitOwner, "只有黑珍珠号才能拾取此藏宝图进阶!")
            end
        elseif itemTypeIdStr == ____d__85CF_5B9D_56FE[4].id then
            if unitTypeIdStr == "A406" then
                RemoveItem(e.manipulatedItem)
                MapHeroUtil["do进化ByTypeAndKeepAbility"](
                    MapHeroUtil,
                    trigUnitOwner,
                    2,
                    "A407",
                    false,
                    false
                )
            else
                PlayerUtil:text(trigUnitOwner, "只有桑尼号才能拾取此藏宝图进阶!")
            end
        end
        solarTrigger.enable = true
    end)
end
function _____5BFB_5B9D_56FE.createItem(self, vectors, itemType)
    local d = vectors[RandomUtil.nextInt(0, #vectors - 1) + 1]
    local item = CreateItem(itemType, d.x, d.y)
    PlayerUtil:text(
        GetLocalPlayer(),
        "藏宝图出现在地图中了,快去寻找吧!:" .. GetItemName(item)
    )
    print((((((((GetItemName(item) .. " => ") .. tostring(d.x)) .. ",") .. tostring(d.y)) .. " -> ") .. tostring(GetItemX(item))) .. ",") .. tostring(GetItemY(item)))
end
return ____exports
