local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 9,["24"] = 16,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 20,["33"] = 21,["35"] = 23,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 27,["41"] = 29,["44"] = 32,["45"] = 33,["47"] = 35,["48"] = 36,["51"] = 39,["52"] = 40,["53"] = 23,["55"] = 16,["56"] = 16,["57"] = 16,["58"] = 45,["59"] = 46,["60"] = 47,["61"] = 48,["62"] = 49,["64"] = 51,["65"] = 51,["66"] = 52,["67"] = 51,["68"] = 51,["69"] = 51,["70"] = 54,["71"] = 55,["73"] = 46,["74"] = 60,["75"] = 61,["76"] = 12,["77"] = 64,["78"] = 66,["79"] = 67,["80"] = 68,["83"] = 64,["84"] = 75,["85"] = 78,["86"] = 78,["87"] = 79,["88"] = 80,["89"] = 81,["90"] = 81,["91"] = 81,["92"] = 81,["93"] = 82,["94"] = 83,["95"] = 83,["96"] = 83,["97"] = 83,["98"] = 83,["101"] = 78,["102"] = 78,["103"] = 78,["104"] = 87,["105"] = 75,["106"] = 90,["107"] = 91,["108"] = 91,["109"] = 92,["110"] = 93,["111"] = 94,["112"] = 95,["113"] = 96,["114"] = 97,["115"] = 98,["117"] = 100,["120"] = 91,["121"] = 91,["122"] = 91,["123"] = 105,["124"] = 106,["125"] = 107,["126"] = 107,["127"] = 107,["128"] = 107,["129"] = 108,["130"] = 109,["132"] = 111,["133"] = 113,["134"] = 90,["135"] = 116,["136"] = 117,["137"] = 118,["138"] = 118,["139"] = 119,["140"] = 120,["142"] = 118,["143"] = 118,["144"] = 118,["145"] = 124,["146"] = 124,["147"] = 124,["148"] = 124,["149"] = 126,["150"] = 116,["151"] = 129,["152"] = 130,["153"] = 131,["154"] = 131,["155"] = 132,["156"] = 133,["158"] = 131,["159"] = 131,["160"] = 131,["161"] = 137,["162"] = 137,["163"] = 137,["164"] = 137,["165"] = 139,["166"] = 129});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local _____56FE_6807_9762_677F = require("界面.图标面板.图标面板")
local _____56FE_6807_9762_677F = _____56FE_6807_9762_677F.default
local ____MapMathUtil = require("util.MapMathUtil")
local MapMathUtil = ____MapMathUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____63A2_7D22_70B9_5151_6362 = ____exports.default
_____63A2_7D22_70B9_5151_6362.name = "探索点兑换"
function _____63A2_7D22_70B9_5151_6362.prototype.____constructor(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.base_describe = actorType.describe
            if actorType["兑换需要探索点"] and actorType["兑换需要探索点"] > 0 then
                local tscfgVal = ArchiveUtil:get(
                    GetLocalPlayer(),
                    actorType.requireKey
                )
                if tscfgVal and tscfgVal > 0 then
                    actorType.level = tscfgVal
                end
                actorType.onLocalClick = function(____, actor, btn, x, y, actorType)
                    if btn == 1 then
                        if ____exports.default["检查积分是否足够"](____exports.default, actorType["兑换需要探索点"] * ((actorType.level or 0) + 1)) then
                            actorType.level = (actorType.level or 0) + 1
                            MouseFrameUtil:showSuccessText((("增加等级到:" .. tostring(actorType.level)) .. " 剩余可用:") .. tostring(____exports.default["获取剩余可用探索点"](____exports.default)))
                        else
                            MouseFrameUtil:showFailText("可用探索点不足!剩余可用:" .. tostring(____exports.default["获取剩余可用探索点"](____exports.default)))
                        end
                    else
                        if actorType.level == nil or actorType.level <= 0 then
                            MouseFrameUtil:showFailText("已经是0级了!")
                        else
                            actorType.level = actorType.level - 1
                            MouseFrameUtil:showSuccessText((("降低等级到:" .. tostring(actorType.level)) .. " 剩余可用:") .. tostring(____exports.default["获取剩余可用探索点"](____exports.default)))
                        end
                    end
                    ____exports.default["保存兑换配置"](____exports.default)
                    ____exports.default["刷新探索扩展提示"](____exports.default)
                end
            end
        end,
        "探索点兑换"
    )
    local appActorType = ActorTypeUtil:getActorType("探索积分")
    appActorType.onLocalClick = function(____, actor, btn, x, y, actorType)
        if btn == 1 then
            ____exports.default["保存兑换配置"](____exports.default)
            MouseFrameUtil:showSuccessText("保存成功!")
        else
            ActorTypeUtil:forAllActorTypes(
                function(____, actorType)
                    actorType.level = 0
                end,
                "探索点兑换"
            )
            ____exports.default["保存兑换配置"](____exports.default)
            MouseFrameUtil:showSuccessText("清空成功!")
        end
    end
    ____exports.default["刷新探索扩展提示"](____exports.default)
    self["基础其他杂项"](self)
end
_____63A2_7D22_70B9_5151_6362.prototype["基础其他杂项"] = function(self)
    if not ____exports.default["检查积分是否足够"](____exports.default, -1) then
        PlayerUtil:message("存档校验出错!请退出游戏！或使用空存档继续游玩!输入'-清空存档'可以清空存档")
        ArchiveUtil.playerDatas["P" .. tostring(GetPlayerId(GetLocalPlayer()))] = {}
        return
    end
end
_____63A2_7D22_70B9_5151_6362["保存兑换配置"] = function(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要探索点"] and actorType["兑换需要探索点"] > 0 and actorType.level and actorType.level >= 0 then
                local dt = actorType
                local baseVar = ArchiveUtil:get(
                    GetLocalPlayer(),
                    dt.requireKey
                )
                if baseVar == nil or baseVar ~= actorType.level then
                    ArchiveUtil:set(
                        GetLocalPlayer(),
                        dt.requireKey,
                        actorType.level
                    )
                end
            end
        end,
        "探索点兑换"
    )
    ____exports.default["刷新探索扩展提示"](____exports.default)
end
_____63A2_7D22_70B9_5151_6362["刷新探索扩展提示"] = function(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要探索点"] and actorType["兑换需要探索点"] > 0 then
                local base_describe = actorType.base_describe
                base_describe = ((base_describe .. "|n需要探索积分:|cffff0000") .. tostring(actorType["兑换需要探索点"] * ((actorType.level or 0) + 1))) .. "|r|n"
                actorType.describe = base_describe
                if actorType.level and actorType.level > 0 then
                    actorType.uiEnable = true
                    actorType.describe = (("当前等级:|cff00ff00" .. tostring(actorType.level)) .. "|r|n") .. base_describe
                else
                    actorType.uiEnable = false
                end
            end
        end,
        "探索点兑换"
    )
    local appActorType = ActorTypeUtil:getActorType("探索积分")
    local base_describe = appActorType.base_describe
    local storeInt = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "Itsjf"
    ) or 0
    if storeInt > 0 then
        appActorType.uiEnable = true
    end
    appActorType.describe = (((((("总计数量:|cff00ff00" .. tostring(storeInt)) .. "|r|n") .. "剩余可用数量:|cff00ff00") .. tostring(____exports.default["获取剩余可用探索点"](____exports.default))) .. "|r|n") .. base_describe) .. "|n修改后下一局开始生效!"
    _____56FE_6807_9762_677F["刷新图标数据"](_____56FE_6807_9762_677F)
end
_____63A2_7D22_70B9_5151_6362["获取剩余可用探索点"] = function(self)
    local _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = 0
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要探索点"] and actorType["兑换需要探索点"] > 0 and actorType.level and actorType.level > 0 then
                _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF + MapMathUtil["获得当前等级需要的总资源"](MapMathUtil, actorType["兑换需要探索点"], actorType.level)
            end
        end,
        "探索点兑换"
    )
    local storeInt = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "Itsjf"
    )
    return storeInt - _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF
end
_____63A2_7D22_70B9_5151_6362["检查积分是否足够"] = function(self, needJfAddon)
    local _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = needJfAddon
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要探索点"] and actorType["兑换需要探索点"] > 0 and actorType.level and actorType.level > 0 then
                _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF + MapMathUtil["获得当前等级需要的总资源"](MapMathUtil, actorType["兑换需要探索点"], actorType.level)
            end
        end,
        "探索点兑换"
    )
    local storeInt = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "Itsjf"
    )
    return storeInt >= _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF
end
return ____exports
