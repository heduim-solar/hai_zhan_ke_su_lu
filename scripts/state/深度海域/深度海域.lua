local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 10,["24"] = 10,["25"] = 11,["26"] = 11,["27"] = 12,["28"] = 12,["29"] = 13,["30"] = 13,["31"] = 14,["32"] = 14,["33"] = 15,["34"] = 15,["35"] = 16,["36"] = 16,["37"] = 17,["38"] = 17,["39"] = 18,["40"] = 18,["41"] = 19,["42"] = 19,["43"] = 20,["44"] = 20,["45"] = 21,["46"] = 21,["47"] = 22,["48"] = 22,["49"] = 23,["50"] = 23,["51"] = 24,["52"] = 24,["53"] = 25,["54"] = 25,["55"] = 26,["56"] = 26,["57"] = 27,["58"] = 27,["59"] = 28,["60"] = 28,["61"] = 29,["62"] = 29,["63"] = 30,["64"] = 30,["65"] = 32,["66"] = 32,["67"] = 32,["69"] = 32,["70"] = 36,["71"] = 38,["72"] = 38,["73"] = 38,["74"] = 39,["75"] = 39,["76"] = 39,["77"] = 39,["78"] = 40,["79"] = 41,["80"] = 42,["81"] = 43,["82"] = 44,["83"] = 45,["85"] = 47,["86"] = 38,["87"] = 38,["88"] = 36,["89"] = 53,["90"] = 54,["91"] = 55,["94"] = 58,["95"] = 59,["96"] = 60,["97"] = 61,["98"] = 62,["99"] = 63,["100"] = 64,["101"] = 65,["102"] = 65,["103"] = 65,["104"] = 65,["106"] = 59,["108"] = 69,["109"] = 70,["111"] = 70,["113"] = 71,["114"] = 72,["115"] = 72,["116"] = 72,["117"] = 73,["118"] = 74,["119"] = 75,["120"] = 76,["121"] = 73,["122"] = 72,["123"] = 72,["124"] = 79,["125"] = 80,["126"] = 80,["127"] = 80,["128"] = 81,["129"] = 80,["130"] = 80,["131"] = 53,["132"] = 86,["133"] = 87,["134"] = 88,["135"] = 89,["136"] = 90,["137"] = 91,["138"] = 92,["139"] = 93,["140"] = 94,["141"] = 95,["142"] = 96,["143"] = 97,["144"] = 98,["145"] = 99,["146"] = 100,["147"] = 101,["148"] = 102,["149"] = 103,["150"] = 104,["151"] = 105,["152"] = 106,["153"] = 107,["154"] = 108,["155"] = 109,["156"] = 110,["157"] = 111,["158"] = 112,["159"] = 113,["160"] = 114,["161"] = 115,["162"] = 116,["163"] = 117,["164"] = 118,["165"] = 119,["168"] = 86,["169"] = 128,["170"] = 129,["171"] = 130,["172"] = 131,["173"] = 132,["174"] = 132,["175"] = 132,["176"] = 132,["177"] = 132,["178"] = 132,["179"] = 134,["180"] = 135,["182"] = 130,["183"] = 138,["184"] = 128});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____l__4E2D_5FC3_65CB_6DA1_70B9 = require("_sl_editor.l_中心旋涡点")
local ____l__4E2D_5FC3_65CB_6DA1_70B9 = ____l__4E2D_5FC3_65CB_6DA1_70B9["l_中心旋涡点"]
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____MapRectUtil = require("util.MapRectUtil")
local MapRectUtil = ____MapRectUtil.default
local _____6DF1_5EA6_6D77_57DF1 = require("state.深度海域.深度海域1")
local _____6DF1_5EA6_6D77_57DF1 = _____6DF1_5EA6_6D77_57DF1.default
local _____6DF1_5EA6_6D77_57DF2 = require("state.深度海域.深度海域2")
local _____6DF1_5EA6_6D77_57DF2 = _____6DF1_5EA6_6D77_57DF2.default
local _____6DF1_5EA6_6D77_57DF3 = require("state.深度海域.深度海域3")
local _____6DF1_5EA6_6D77_57DF3 = _____6DF1_5EA6_6D77_57DF3.default
local _____6DF1_5EA6_6D77_57DF4 = require("state.深度海域.深度海域4")
local _____6DF1_5EA6_6D77_57DF4 = _____6DF1_5EA6_6D77_57DF4.default
local _____6DF1_5EA6_6D77_57DF5 = require("state.深度海域.深度海域5")
local _____6DF1_5EA6_6D77_57DF5 = _____6DF1_5EA6_6D77_57DF5.default
local _____6DF1_5EA6_6D77_57DF6 = require("state.深度海域.深度海域6")
local _____6DF1_5EA6_6D77_57DF6 = _____6DF1_5EA6_6D77_57DF6.default
local _____6DF1_5EA6_6D77_57DF7 = require("state.深度海域.深度海域7")
local _____6DF1_5EA6_6D77_57DF7 = _____6DF1_5EA6_6D77_57DF7.default
local _____6DF1_5EA6_6D77_57DF8 = require("state.深度海域.深度海域8")
local _____6DF1_5EA6_6D77_57DF8 = _____6DF1_5EA6_6D77_57DF8.default
local _____6DF1_5EA6_6D77_57DF9 = require("state.深度海域.深度海域9")
local _____6DF1_5EA6_6D77_57DF9 = _____6DF1_5EA6_6D77_57DF9.default
local _____6DF1_5EA6_6D77_57DF10 = require("state.深度海域.深度海域10")
local _____6DF1_5EA6_6D77_57DF10 = _____6DF1_5EA6_6D77_57DF10.default
local _____6DF1_5EA6_6D77_57DF11 = require("state.深度海域.深度海域11")
local _____6DF1_5EA6_6D77_57DF11 = _____6DF1_5EA6_6D77_57DF11.default
local _____6DF1_5EA6_6D77_57DF12 = require("state.深度海域.深度海域12")
local _____6DF1_5EA6_6D77_57DF12 = _____6DF1_5EA6_6D77_57DF12.default
local _____6DF1_5EA6_6D77_57DF13 = require("state.深度海域.深度海域13")
local _____6DF1_5EA6_6D77_57DF13 = _____6DF1_5EA6_6D77_57DF13.default
local _____6DF1_5EA6_6D77_57DF14 = require("state.深度海域.深度海域14")
local _____6DF1_5EA6_6D77_57DF14 = _____6DF1_5EA6_6D77_57DF14.default
local _____6DF1_5EA6_6D77_57DF15 = require("state.深度海域.深度海域15")
local _____6DF1_5EA6_6D77_57DF15 = _____6DF1_5EA6_6D77_57DF15.default
local _____6DF1_5EA6_6D77_57DF16 = require("state.深度海域.深度海域16")
local _____6DF1_5EA6_6D77_57DF16 = _____6DF1_5EA6_6D77_57DF16.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____FrameLoadingUtil = require("solar.solar-common.util.frame.FrameLoadingUtil")
local FrameLoadingUtil = ____FrameLoadingUtil.default
____exports.default = __TS__Class()
local _____6DF1_5EA6_6D77_57DF = ____exports.default
_____6DF1_5EA6_6D77_57DF.name = "深度海域"
function _____6DF1_5EA6_6D77_57DF.prototype.____constructor(self)
end
_____6DF1_5EA6_6D77_57DF["开启深度海域之门"] = function(self)
    ____exports.default.sTimer = BaseUtil.onTimer(
        1,
        function(____, count)
            TipFrameUtil:showTipText(
                "|cff00ff00等待所有船只集合到中心漩涡!|cffff0000剩余" .. tostring(30 - count),
                FramePoint.center
            )
            if ____exports.default["是否集合"](____exports.default) then
                ____exports.default["进入深度海域"](____exports.default, 1)
                return false
            elseif count >= 30 then
                ____exports.default["进入深度海域"](____exports.default, 1)
                return false
            end
            return true
        end
    )
end
_____6DF1_5EA6_6D77_57DF["进入深度海域"] = function(self, index)
    if gv["深度海域层数"] and index <= gv["深度海域层数"] then
        BJDebugMsg("已经进入深度海域:" .. tostring(gv["深度海域层数"]))
        return
    end
    if index == 1 then
        PlayerUtil:forUsers(function(____, player)
            RemoveUnit(sd(nil, player).assistant)
            local hero = PlayerUtil:getHero(player)
            local attribute = AttributeUtil:getUnitAttribute(hero)
            if attribute["进入深度海域时加全属性"] then
                HeroUtil:addHeroPropertyP(hero, false, attribute["进入深度海域时加全属性"])
                TextTagUtil.textSuccess(
                    "进入深度海域时加全属性+" .. TextUtil:toPercentage(attribute["进入深度海域时加全属性"]),
                    hero
                )
            end
        end)
    end
    gv["深度海域层数"] = index
    local ____opt_0 = ____exports.default.sTimer
    if ____opt_0 ~= nil then
        ____opt_0:destroy()
    end
    MapRectUtil:setMapRect(gv["深度海域层数"])
    BaseUtil.runLater(
        0.2,
        function()
            PlayerUtil:forUsers(function(____, player)
                local hero = PlayerUtil:getHero(player)
                local vector = MapRectUtil.rectLines[index + 1][3]
                UnitUtil.transfer(hero, vector.x, vector.y)
            end)
        end
    )
    FrameLoadingUtil:showLoadingScreen(2, "区域小地图\\深海区域载入图.tga")
    BaseUtil.runLater(
        2,
        function()
            ____exports.default["_sl_执行逻辑"](____exports.default)
        end
    )
end
_____6DF1_5EA6_6D77_57DF["_sl_执行逻辑"] = function(self)
    gv.enemyLevel = gv["深度海域层数"]
    if gv["深度海域层数"] == 1 then
        __TS__New(_____6DF1_5EA6_6D77_57DF1)
    elseif gv["深度海域层数"] == 2 then
        __TS__New(_____6DF1_5EA6_6D77_57DF2)
    elseif gv["深度海域层数"] == 3 then
        __TS__New(_____6DF1_5EA6_6D77_57DF3)
    elseif gv["深度海域层数"] == 4 then
        __TS__New(_____6DF1_5EA6_6D77_57DF4)
    elseif gv["深度海域层数"] == 5 then
        __TS__New(_____6DF1_5EA6_6D77_57DF5)
    elseif gv["深度海域层数"] == 6 then
        __TS__New(_____6DF1_5EA6_6D77_57DF6)
    elseif gv["深度海域层数"] == 7 then
        __TS__New(_____6DF1_5EA6_6D77_57DF7)
    elseif gv["深度海域层数"] == 8 then
        __TS__New(_____6DF1_5EA6_6D77_57DF8)
    elseif gv["深度海域层数"] == 9 then
        __TS__New(_____6DF1_5EA6_6D77_57DF9)
    elseif gv["深度海域层数"] == 10 then
        __TS__New(_____6DF1_5EA6_6D77_57DF10)
    elseif gv["深度海域层数"] == 11 then
        __TS__New(_____6DF1_5EA6_6D77_57DF11)
    elseif gv["深度海域层数"] == 12 then
        __TS__New(_____6DF1_5EA6_6D77_57DF12)
    elseif gv["深度海域层数"] == 13 then
        __TS__New(_____6DF1_5EA6_6D77_57DF13)
    elseif gv["深度海域层数"] == 14 then
        __TS__New(_____6DF1_5EA6_6D77_57DF14)
    elseif gv["深度海域层数"] == 15 then
        __TS__New(_____6DF1_5EA6_6D77_57DF15)
    elseif gv["深度海域层数"] == 16 then
        __TS__New(_____6DF1_5EA6_6D77_57DF16)
    else
    end
end
_____6DF1_5EA6_6D77_57DF["是否集合"] = function(self)
    local flag = true
    PlayerUtil:forUsers(function(____, player)
        local hero = PlayerUtil:getHero(player)
        local distance = MathUtil.distanceBetweenPoints(
            GetUnitX(hero),
            GetUnitY(hero),
            ____l__4E2D_5FC3_65CB_6DA1_70B9[1].x,
            ____l__4E2D_5FC3_65CB_6DA1_70B9[1].y
        )
        if distance > 1000 then
            flag = false
        end
    end)
    return flag
end
return ____exports
