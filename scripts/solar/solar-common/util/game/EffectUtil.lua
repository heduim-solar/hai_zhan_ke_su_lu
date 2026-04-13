local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 10,["16"] = 11,["17"] = 13,["18"] = 14,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 19,["27"] = 21,["30"] = 25,["31"] = 26,["32"] = 27,["33"] = 28,["34"] = 29,["35"] = 29,["38"] = 31,["40"] = 33,["43"] = 10,["44"] = 41,["45"] = 42,["46"] = 43,["47"] = 44,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 47,["53"] = 46,["54"] = 46,["56"] = 41,["57"] = 55,["58"] = 55,["59"] = 55,["61"] = 56,["62"] = 57,["64"] = 59,["65"] = 60,["66"] = 61,["67"] = 62,["68"] = 62,["71"] = 64,["73"] = 55,["74"] = 71,["75"] = 71,["76"] = 71,["78"] = 73,["79"] = 74,["80"] = 75,["82"] = 77,["83"] = 77,["84"] = 77,["85"] = 78,["86"] = 77,["87"] = 77,["89"] = 71,["90"] = 89,["91"] = 90,["92"] = 91,["93"] = 89,["94"] = 98,["95"] = 99,["96"] = 101,["97"] = 102,["98"] = 98});
local ____exports = {}
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local EffectUtil = ____exports.default
EffectUtil.name = "EffectUtil"
function EffectUtil.prototype.____constructor(self)
end
function EffectUtil.addSpecialEffect(self, modelName, x, y, size, displayPlayer)
    if displayPlayer == nil then
        if settings.isEffectDisplay == false then
            return AddSpecialEffect("", x, y)
        else
            local e = AddSpecialEffect(modelName, x, y)
            if size ~= nil then
                EXSetEffectSize(e, size)
                if SetPariticle2Size ~= nil then
                    SetPariticle2Size(e, size)
                end
            end
            return e
        end
    else
        if displayPlayer == GetLocalPlayer() then
            local e = AddSpecialEffect(modelName, x, y)
            if size ~= nil then
                EXSetEffectSize(e, size)
                if SetPariticle2Size ~= nil then
                    SetPariticle2Size(e, size)
                end
            end
            return e
        else
            return AddSpecialEffect("", x, y)
        end
    end
end
function EffectUtil.addSpecialEffectAndDestroy(self, modelName, x, y, size, lifeTime)
    local effect = ____exports.default:addSpecialEffect(modelName, x, y, size)
    if lifeTime == nil or lifeTime == 0 then
        DestroyEffect(effect)
    else
        BaseUtil.runLater(
            lifeTime,
            function()
                DestroyEffect(effect)
            end
        )
    end
end
function EffectUtil.addSpecialEffectTarget(self, modelName, targetWidget, attachPointName, size)
    if attachPointName == nil then
        attachPointName = TargetAttach.origin
    end
    if settings.isEffectDisplay == false then
        return AddSpecialEffectTarget("", targetWidget, attachPointName)
    else
        local e = AddSpecialEffectTarget(modelName, targetWidget, attachPointName)
        if size ~= nil then
            EXSetEffectSize(e, size)
            if SetPariticle2Size ~= nil then
                SetPariticle2Size(e, size)
            end
        end
        return e
    end
end
function EffectUtil.addSpecialEffectTargetAndDestroy(self, modelName, targetWidget, attachPointName, size, lifeTime)
    if attachPointName == nil then
        attachPointName = TargetAttach.origin
    end
    local effect = ____exports.default:addSpecialEffectTarget(modelName, targetWidget, attachPointName, size)
    if lifeTime == nil or lifeTime == 0 then
        DestroyEffect(effect)
    else
        BaseUtil.runLater(
            lifeTime,
            function()
                DestroyEffect(effect)
            end
        )
    end
end
function EffectUtil.setEffectFacing(self, effect, facingAngle)
    EXEffectMatReset(effect)
    EXEffectMatRotateZ(effect, facingAngle)
end
function EffectUtil.destroyEffectNoDeathAnim(self, effect)
    EXSetEffectSize(effect, 0)
    EXSetEffectZ(effect, -5000)
    DestroyEffect(effect)
end
return ____exports
