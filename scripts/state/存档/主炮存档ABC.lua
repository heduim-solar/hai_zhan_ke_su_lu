local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 12,["21"] = 12,["22"] = 12,["24"] = 16,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 16,["29"] = 16,["30"] = 15,["31"] = 23,["32"] = 23,["33"] = 23,["35"] = 24,["37"] = 25,["38"] = 25,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 27,["44"] = 28,["45"] = 29,["47"] = 31,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 35,["54"] = 36,["55"] = 37,["56"] = 38,["58"] = 40,["61"] = 44,["62"] = 44,["63"] = 44,["64"] = 44,["65"] = 45,["66"] = 46,["67"] = 47,["69"] = 49,["72"] = 25,["75"] = 53,["76"] = 23,["77"] = 57,["78"] = 58,["79"] = 58,["80"] = 58,["81"] = 58,["82"] = 58,["83"] = 58,["84"] = 58,["85"] = 58,["86"] = 58,["88"] = 70,["89"] = 70,["90"] = 71,["91"] = 72,["92"] = 73,["93"] = 74,["94"] = 75,["95"] = 76,["96"] = 70,["99"] = 80,["100"] = 82,["101"] = 83,["102"] = 83,["103"] = 84,["104"] = 85,["105"] = 86,["106"] = 86,["107"] = 86,["108"] = 86,["109"] = 87,["110"] = 88,["111"] = 89,["112"] = 90,["114"] = 92,["117"] = 96,["118"] = 83,["119"] = 83,["120"] = 83,["121"] = 98,["122"] = 100,["123"] = 100,["124"] = 101,["125"] = 102,["126"] = 103,["127"] = 103,["128"] = 103,["129"] = 103,["130"] = 104,["131"] = 105,["132"] = 106,["133"] = 107,["135"] = 109,["138"] = 112,["139"] = 100,["140"] = 100,["141"] = 100,["142"] = 114,["143"] = 116,["144"] = 116,["145"] = 117,["146"] = 118,["147"] = 119,["148"] = 119,["149"] = 119,["150"] = 119,["151"] = 120,["152"] = 121,["153"] = 122,["154"] = 123,["156"] = 125,["159"] = 128,["160"] = 116,["161"] = 116,["162"] = 116,["163"] = 57});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local _____4E3B_70AE_5B58_6863A = require("xlsx.存档.主炮存档A")
local ____d__4E3B_70AE_5B58_6863A = _____4E3B_70AE_5B58_6863A["d_主炮存档A"]
local _____4E3B_70AE_5B58_6863B = require("xlsx.存档.主炮存档B")
local ____d__4E3B_70AE_5B58_6863B = _____4E3B_70AE_5B58_6863B["d_主炮存档B"]
local _____4E3B_70AE_5B58_6863C = require("xlsx.存档.主炮存档C")
local ____d__4E3B_70AE_5B58_6863C = _____4E3B_70AE_5B58_6863C["d_主炮存档C"]
____exports.default = __TS__Class()
local _____4E3B_70AE_5B58_6863ABC = ____exports.default
_____4E3B_70AE_5B58_6863ABC.name = "主炮存档ABC"
function _____4E3B_70AE_5B58_6863ABC.prototype.____constructor(self)
    BaseUtil.runLater(
        1.1,
        function()
            ____exports.default:init()
        end
    )
end
_____4E3B_70AE_5B58_6863ABC["获取激活的存档设计图数量"] = function(self, player, _____5305_62EC_91CD_590D_7684_6570_91CF)
    if _____5305_62EC_91CD_590D_7684_6570_91CF == nil then
        _____5305_62EC_91CD_590D_7684_6570_91CF = false
    end
    local count = 0
    do
        local i = 0
        while i < #____d__4E3B_70AE_5B58_6863A do
            local cdVal = ArchiveUtil:get(
                player,
                "_zp_a_" .. tostring(i)
            )
            if cdVal and cdVal > 0 then
                if _____5305_62EC_91CD_590D_7684_6570_91CF then
                    count = count + cdVal
                else
                    count = count + 1
                end
            end
            cdVal = ArchiveUtil:get(
                player,
                "_zp_b_" .. tostring(i)
            )
            if cdVal and cdVal > 0 then
                if _____5305_62EC_91CD_590D_7684_6570_91CF then
                    count = count + cdVal
                else
                    count = count + 1
                end
            end
            cdVal = ArchiveUtil:get(
                player,
                "_zp_c_" .. tostring(i)
            )
            if cdVal and cdVal > 0 then
                if _____5305_62EC_91CD_590D_7684_6570_91CF then
                    count = count + cdVal
                else
                    count = count + 1
                end
            end
            i = i + 1
        end
    end
    return count
end
function _____4E3B_70AE_5B58_6863ABC.init(self)
    local zpTipsActorType = ActorTypeUtil:registerActorType({
        id = "主炮存档提示",
        name = "主炮存档提示",
        class = "主炮存档",
        uiShowType = "通用图标面板",
        uiEnable = true,
        icon = "图标\\存档\\主炮存档.blp",
        describe = ("通关后随机获得主炮加强存档。\n" .. "主炮存档可以叠加，每个数量提升原本的10%，到达5个数量的时候额外获得本效果+100%，到达10个数量时增加三维100，到达15个数量时增加20%全属性加成\n") .. "存档数量最大生效数量=地图等级"
    })
    do
        local i = 0
        while i < #____d__4E3B_70AE_5B58_6863A do
            local data = ____d__4E3B_70AE_5B58_6863A[i + 1]
            ActorTypeUtil:registerActorType(data)
            data = ____d__4E3B_70AE_5B58_6863B[i + 1]
            ActorTypeUtil:registerActorType(data)
            data = ____d__4E3B_70AE_5B58_6863C[i + 1]
            ActorTypeUtil:registerActorType(data)
            i = i + 1
        end
    end
    local index = 0
    local mapLevel = PlatUtil:getMapLevel(GetLocalPlayer())
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "主炮存档"
            actorType.hide = true
            local cdVal = ArchiveUtil:get(
                GetLocalPlayer(),
                "_zp_a_" .. tostring(index)
            )
            if cdVal and cdVal > 0 then
                actorType.uiEnable = true
                if cdVal > mapLevel then
                    actorType.describe = (((("|cff00ff00当前数量*" .. tostring(cdVal)) .. "(受到地图等级最大限制:") .. tostring(mapLevel)) .. ")|r|n") .. actorType.describe
                else
                    actorType.describe = (("|cff00ff00当前数量*" .. tostring(cdVal)) .. "|r|n") .. actorType.describe
                end
            end
            index = index + 1
        end,
        "主炮存档A"
    )
    index = 0
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "主炮存档"
            actorType.hide = true
            local cdVal = ArchiveUtil:get(
                GetLocalPlayer(),
                "_zp_b_" .. tostring(index)
            )
            if cdVal and cdVal > 0 then
                actorType.uiEnable = true
                if cdVal > mapLevel then
                    actorType.describe = (((("|cff00ff00当前数量*" .. tostring(cdVal)) .. "(受到地图等级最大限制:") .. tostring(mapLevel)) .. ")|r|n") .. actorType.describe
                else
                    actorType.describe = (("|cff00ff00当前数量*" .. tostring(cdVal)) .. "|r|n") .. actorType.describe
                end
            end
            index = index + 1
        end,
        "主炮存档B"
    )
    index = 0
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "主炮存档"
            actorType.hide = true
            local cdVal = ArchiveUtil:get(
                GetLocalPlayer(),
                "_zp_c_" .. tostring(index)
            )
            if cdVal and cdVal > 0 then
                actorType.uiEnable = true
                if cdVal > mapLevel then
                    actorType.describe = (((("|cff00ff00当前数量*" .. tostring(cdVal)) .. "(受到地图等级最大限制:") .. tostring(mapLevel)) .. ")|r|n") .. actorType.describe
                else
                    actorType.describe = (("|cff00ff00当前数量*" .. tostring(cdVal)) .. "|r|n") .. actorType.describe
                end
            end
            index = index + 1
        end,
        "主炮存档C"
    )
end
return ____exports
