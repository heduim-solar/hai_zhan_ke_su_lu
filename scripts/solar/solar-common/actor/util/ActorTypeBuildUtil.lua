local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 10,["22"] = 10,["23"] = 10,["25"] = 10,["26"] = 19,["27"] = 20,["28"] = 21,["31"] = 25,["32"] = 26,["33"] = 27,["36"] = 30,["37"] = 31,["38"] = 32,["39"] = 33,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 39,["46"] = 40,["48"] = 42,["50"] = 44,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 36,["55"] = 50,["56"] = 51,["57"] = 52,["58"] = 53,["60"] = 55,["61"] = 56,["62"] = 56,["63"] = 56,["64"] = 57,["65"] = 58,["66"] = 59,["67"] = 59,["68"] = 59,["69"] = 59,["70"] = 60,["71"] = 61,["73"] = 63,["75"] = 65,["76"] = 66,["77"] = 66,["78"] = 66,["79"] = 66,["80"] = 67,["82"] = 69,["83"] = 70,["84"] = 70,["85"] = 70,["86"] = 70,["88"] = 72,["89"] = 73,["90"] = 74,["91"] = 74,["92"] = 74,["93"] = 74,["94"] = 75,["95"] = 75,["96"] = 75,["97"] = 75,["98"] = 76,["100"] = 78,["101"] = 56,["102"] = 56,["103"] = 80,["104"] = 50,["105"] = 82,["106"] = 83,["107"] = 84,["108"] = 85,["109"] = 86,["110"] = 86,["111"] = 86,["112"] = 86,["113"] = 86,["114"] = 86,["115"] = 86,["117"] = 88,["118"] = 88,["119"] = 88,["120"] = 88,["121"] = 88,["122"] = 88,["123"] = 88,["125"] = 90,["126"] = 90,["129"] = 92,["130"] = 92,["131"] = 92,["132"] = 92,["133"] = 92,["134"] = 92,["135"] = 92,["137"] = 94,["138"] = 95,["139"] = 96,["140"] = 96,["141"] = 96,["142"] = 96,["144"] = 82,["145"] = 19});
local ____exports = {}
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____CameraUtil = require("solar.solar-common.util.game.CameraUtil")
local CameraUtil = ____CameraUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____ActorUnit = require("solar.solar-common.actor.ActorUnit")
local ActorUnit = ____ActorUnit.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.default = __TS__Class()
local ActorTypeBuildUtil = ____exports.default
ActorTypeBuildUtil.name = "ActorTypeBuildUtil"
function ActorTypeBuildUtil.prototype.____constructor(self)
end
function ActorTypeBuildUtil.addBuildUnitType(self, actorTypeId, unitId, onLocalClickCheck, onBuild)
    if not isEmbedJapi then
        print("无内置不支持此模拟建造方法!")
        return
    end
    local actorType = ActorTypeUtil:getActorType(actorTypeId)
    if actorType == nil then
        log.errorWithTraceBack("请先注册此类型:" .. tostring(actorType))
        return
    end
    actorType.targetType = "点"
    actorType.area = 0
    if actorType.onCreated or actorType.onLocalClick or actorType.onAction then
        log.errorWithTraceBack("必须是空事件的模板才能注册模拟建造事件")
        return
    end
    actorType.onCreated = function(____, actor)
        local modelPath = nil
        local unitActorType = ActorTypeUtil:getActorType(unitId)
        if unitActorType ~= nil then
            modelPath = unitActorType.model
        else
            modelPath = ObjectDataUtil:getStandardModelPath(ObjectDataUtil:getUnitFile(unitId))
        end
        actor.effect = AddSpecialEffect(modelPath, 0, 0)
        EXEffectMatRotateZ(actor.effect, 270)
        EXSetEffectXY(actor.effect, 1, 1)
        EXSetEffectVisible(actor.effect, false)
    end
    actorType.onLocalClick = function(____, actor)
        local ccF = onLocalClickCheck and onLocalClickCheck(nil, actor)
        if ccF == false then
            return false
        end
        EXSetEffectVisible(actor.effect, true)
        actor.intervalTimer = BaseUtil.onTimer(
            0.05,
            function(____, count)
                local wordXY = CameraUtil:getWordCoordinates()
                EXSetEffectXY(actor.effect, wordXY.x, wordXY.y)
                EXSetEffectZ(
                    actor.effect,
                    GameUtil:getTerrainHeight(wordXY.x, wordXY.y)
                )
                if not IsTerrainPathable(wordXY.x, wordXY.y, PATHING_TYPE_BUILDABILITY) then
                    EXSetEffectColor(actor.effect, 2298478591)
                else
                    EXSetEffectColor(actor.effect, 4294901760)
                end
                if wordXY.x == 0 and wordXY.y == 0 then
                    FrameSetModelSize(
                        FrameGetMouse(),
                        1
                    )
                    EXSetEffectVisible(actor.effect, false)
                else
                    EXSetEffectVisible(actor.effect, true)
                    FrameSetModelSize(
                        FrameGetMouse(),
                        0.001
                    )
                end
                if not AbilityUtil:isSelectUi() or count > 1000 then
                    EXSetEffectVisible(actor.effect, false)
                    DzFrameShow(
                        FrameGetMouse(),
                        true
                    )
                    FrameSetModelSize(
                        FrameGetMouse(),
                        1
                    )
                    return false
                end
                return true
            end
        )
        return true
    end
    actorType.onAction = function(____, actor, x, y, targetUnit)
        if not IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY) then
            local unitActorType = ActorTypeUtil:getActorType(unitId)
            if unitActorType ~= nil then
                __TS__New(
                    ActorUnit,
                    unitId,
                    GetOwningPlayer(actor.unit),
                    x,
                    y
                )
            else
                CreateUnit(
                    GetOwningPlayer(actor.unit),
                    unitId,
                    x,
                    y,
                    270
                )
            end
            if onBuild ~= nil then
                onBuild(nil, actor)
            end
        else
            DisplayTimedTextToPlayer(
                GetOwningPlayer(actor.unit),
                0,
                0,
                5,
                "|cffff0000当前点不可建造!"
            )
        end
        if isEmbedJapi then
            EXSetEffectVisible(actor.effect, false)
            FrameSetModelSize(
                FrameGetMouse(),
                1
            )
        end
    end
end
return ____exports
