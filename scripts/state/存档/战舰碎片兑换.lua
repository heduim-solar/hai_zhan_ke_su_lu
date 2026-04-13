local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 9,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 16,["28"] = 17,["29"] = 17,["30"] = 17,["31"] = 17,["32"] = 18,["33"] = 19,["35"] = 21,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["41"] = 27,["44"] = 30,["45"] = 31,["47"] = 33,["48"] = 34,["51"] = 37,["52"] = 38,["53"] = 21,["55"] = 14,["56"] = 14,["57"] = 14,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 46,["62"] = 47,["64"] = 49,["65"] = 49,["66"] = 50,["67"] = 49,["68"] = 49,["69"] = 49,["70"] = 52,["71"] = 53,["73"] = 44,["74"] = 58,["75"] = 59,["76"] = 12,["77"] = 62,["78"] = 64,["79"] = 65,["80"] = 66,["83"] = 62,["84"] = 72,["85"] = 75,["86"] = 75,["87"] = 76,["88"] = 77,["89"] = 78,["90"] = 78,["91"] = 78,["92"] = 78,["93"] = 79,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 80,["101"] = 75,["102"] = 75,["103"] = 75,["104"] = 84,["105"] = 72,["106"] = 87,["107"] = 88,["108"] = 88,["109"] = 89,["110"] = 90,["111"] = 91,["112"] = 92,["113"] = 93,["114"] = 94,["115"] = 95,["117"] = 97,["120"] = 88,["121"] = 88,["122"] = 88,["123"] = 102,["124"] = 103,["125"] = 104,["126"] = 104,["127"] = 104,["128"] = 104,["129"] = 105,["130"] = 106,["132"] = 108,["133"] = 110,["134"] = 87,["135"] = 113,["136"] = 114,["137"] = 115,["138"] = 115,["139"] = 116,["140"] = 117,["142"] = 115,["143"] = 115,["144"] = 115,["145"] = 121,["146"] = 121,["147"] = 121,["148"] = 121,["149"] = 123,["150"] = 113,["151"] = 126,["152"] = 127,["153"] = 128,["154"] = 128,["155"] = 129,["156"] = 130,["158"] = 128,["159"] = 128,["160"] = 128,["161"] = 134,["162"] = 134,["163"] = 134,["164"] = 134,["165"] = 136,["166"] = 126});
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
local _____6218_8230_788E_7247_5151_6362 = ____exports.default
_____6218_8230_788E_7247_5151_6362.name = "战舰碎片兑换"
function _____6218_8230_788E_7247_5151_6362.prototype.____constructor(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.base_describe = actorType.describe
            if actorType["兑换需要点数"] and actorType["兑换需要点数"] > 0 then
                local tscfgVal = ArchiveUtil:get(
                    GetLocalPlayer(),
                    actorType.requireKey
                )
                if tscfgVal and tscfgVal > 0 then
                    actorType.level = tscfgVal
                end
                actorType.onLocalClick = function(____, actor, btn, x, y, actorType)
                    if btn == 1 then
                        if ____exports.default["检查积分是否足够"](____exports.default, actorType["兑换需要点数"] * ((actorType.level or 0) + 1)) then
                            actorType.level = (actorType.level or 0) + 1
                            MouseFrameUtil:showSuccessText((("增加等级到:" .. tostring(actorType.level)) .. " 剩余可用:") .. tostring(____exports.default["获取剩余可用战舰碎片"](____exports.default)))
                        else
                            MouseFrameUtil:showFailText("可用战舰碎片不足!剩余可用:" .. tostring(____exports.default["获取剩余可用战舰碎片"](____exports.default)))
                        end
                    else
                        if actorType.level == nil or actorType.level <= 0 then
                            MouseFrameUtil:showFailText("已经是0级了!")
                        else
                            actorType.level = actorType.level - 1
                            MouseFrameUtil:showSuccessText((("降低等级到:" .. tostring(actorType.level)) .. " 剩余可用:") .. tostring(____exports.default["获取剩余可用战舰碎片"](____exports.default)))
                        end
                    end
                    ____exports.default["保存兑换配置"](____exports.default)
                    ____exports.default["刷新探索扩展提示"](____exports.default)
                end
            end
        end,
        "战舰碎片"
    )
    local appActorType = ActorTypeUtil:getActorType("历史中的战舰碎片")
    appActorType.onLocalClick = function(____, actor, btn, x, y, actorType)
        if btn == 1 then
            ____exports.default["保存兑换配置"](____exports.default)
            MouseFrameUtil:showSuccessText("保存成功!")
        else
            ActorTypeUtil:forAllActorTypes(
                function(____, actorType)
                    actorType.level = 0
                end,
                "战舰碎片"
            )
            ____exports.default["保存兑换配置"](____exports.default)
            MouseFrameUtil:showSuccessText("清空成功!")
        end
    end
    ____exports.default["刷新探索扩展提示"](____exports.default)
    self["基础其他杂项"](self)
end
_____6218_8230_788E_7247_5151_6362.prototype["基础其他杂项"] = function(self)
    if not ____exports.default["检查积分是否足够"](____exports.default, -1) then
        PlayerUtil:message("存档校验出错!请退出游戏！或使用空存档继续游玩!输入'-清空存档'可以清空存档")
        ArchiveUtil.playerDatas["P" .. tostring(GetPlayerId(GetLocalPlayer()))] = {}
        return
    end
end
_____6218_8230_788E_7247_5151_6362["保存兑换配置"] = function(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要点数"] and actorType["兑换需要点数"] > 0 and actorType.level and actorType.level >= 0 then
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
        "战舰碎片"
    )
    ____exports.default["刷新探索扩展提示"](____exports.default)
end
_____6218_8230_788E_7247_5151_6362["刷新探索扩展提示"] = function(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要点数"] and actorType["兑换需要点数"] > 0 then
                local base_describe = actorType.base_describe
                base_describe = ((base_describe .. "|n需要战舰碎片:|cffff0000") .. tostring(actorType["兑换需要点数"] * ((actorType.level or 0) + 1))) .. "|r|n"
                actorType.describe = base_describe
                if actorType.level and actorType.level > 0 then
                    actorType.uiEnable = true
                    actorType.describe = (("当前等级:|cff00ff00" .. tostring(actorType.level)) .. "|r|n") .. base_describe
                else
                    actorType.uiEnable = false
                end
            end
        end,
        "战舰碎片"
    )
    local appActorType = ActorTypeUtil:getActorType("历史中的战舰碎片")
    local base_describe = appActorType.base_describe
    local storeInt = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "Izjsp"
    ) or 0
    if storeInt > 0 then
        appActorType.uiEnable = true
    end
    appActorType.describe = (((((("总计数量:|cff00ff00" .. tostring(storeInt)) .. "|r|n") .. "剩余可用数量:|cff00ff00") .. tostring(____exports.default["获取剩余可用战舰碎片"](____exports.default))) .. "|r|n") .. base_describe) .. "|n修改后下一局开始生效!"
    _____56FE_6807_9762_677F["刷新图标数据"](_____56FE_6807_9762_677F)
end
_____6218_8230_788E_7247_5151_6362["获取剩余可用战舰碎片"] = function(self)
    local _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = 0
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要点数"] and actorType["兑换需要点数"] > 0 and actorType.level and actorType.level > 0 then
                _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF + MapMathUtil["获得当前等级需要的总资源"](MapMathUtil, actorType["兑换需要点数"], actorType.level)
            end
        end,
        "战舰碎片"
    )
    local storeInt = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "Izjsp"
    )
    return storeInt - _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF
end
_____6218_8230_788E_7247_5151_6362["检查积分是否足够"] = function(self, needJfAddon)
    local _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = needJfAddon
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            if actorType["兑换需要点数"] and actorType["兑换需要点数"] > 0 and actorType.level and actorType.level > 0 then
                _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF = _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF + MapMathUtil["获得当前等级需要的总资源"](MapMathUtil, actorType["兑换需要点数"], actorType.level)
            end
        end,
        "战舰碎片"
    )
    local storeInt = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "Izjsp"
    )
    return storeInt >= _____5DF2_7ECF_4F7F_7528_7684_79EF_5206_6570_91CF
end
return ____exports
