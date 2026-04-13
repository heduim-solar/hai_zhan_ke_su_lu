import Actor from "@/Actor";
import ObjectDataUtil from "@/ObjectDataUtil";
import BaseUtil from "@/BaseUtil";
import CameraUtil from "@/CameraUtil";
import GameUtil from "@/GameUtil";
import AbilityUtil from "@/AbilityUtil";
import ActorUnit from "@/ActorUnit";
import ActorTypeUtil from "@/ActorTypeUtil";

export default class ActorTypeBuildUtil {
    /**
     * 技能物品类型可以使用这个 来模拟建造
     * 添加建造单位类型
     * @param actorTypeId
     * @param unitId 可以为原始4字符串单位物编id  也可以为 ActorUnit类型的id
     * @param onLocalClickCheck
     * @param onBuild
     */
    static addBuildUnitType(actorTypeId: string, unitId: string, onLocalClickCheck?: (actor: Actor) => boolean, onBuild?: (actor: Actor) => void) {
        if (!isEmbedJapi) {
            print("无内置不支持此模拟建造方法!")
            return
        }
        //这里保存一下保证读取时快速根据ID读取
        let actorType = ActorTypeUtil.getActorType(actorTypeId);
        if (actorType == null) {
            log.errorWithTraceBack("请先注册此类型:" + actorType)
            return;
        }
        actorType.targetType = "点"
        actorType.area = 0
        if (actorType.onCreated || actorType.onLocalClick || actorType.onAction) {
            log.errorWithTraceBack("必须是空事件的模板才能注册模拟建造事件")
            return;
        }
        actorType.onCreated = (actor) => {
            let modelPath = null;
            let unitActorType = ActorTypeUtil.getActorType(unitId);
            if (unitActorType != null) {
                modelPath = unitActorType.model
            } else {
                modelPath = ObjectDataUtil.getStandardModelPath(ObjectDataUtil.getUnitFile(unitId))
            }
            actor.effect = AddSpecialEffect(modelPath, 0, 0)
            EXEffectMatRotateZ(actor.effect, 270);
            EXSetEffectXY(actor.effect, 1, 1);
            EXSetEffectVisible(actor.effect, false);
        }

        actorType.onLocalClick = (actor) => {
            let ccF = onLocalClickCheck?.(actor);
            if (ccF == false) {
                return false
            }
            EXSetEffectVisible(actor.effect, true);
            actor.intervalTimer = BaseUtil.onTimer(0.05, count => {
                let wordXY = CameraUtil.getWordCoordinates();
                EXSetEffectXY(actor.effect, wordXY.x, wordXY.y);
                EXSetEffectZ(actor.effect, GameUtil.getTerrainHeight(wordXY.x, wordXY.y));
                if (!IsTerrainPathable(wordXY.x, wordXY.y, PATHING_TYPE_BUILDABILITY)) {
                    EXSetEffectColor(actor.effect, 0x88ffffff)//半透明
                } else {
                    EXSetEffectColor(actor.effect, 0xffff0000)//红色提示不可建造
                }
                if (wordXY.x == 0 && wordXY.y == 0) {//鼠标移入控制台了
                    FrameSetModelSize(FrameGetMouse(), 1)
                    EXSetEffectVisible(actor.effect, false);
                } else {
                    EXSetEffectVisible(actor.effect, true);
                    FrameSetModelSize(FrameGetMouse(), 0.001)
                }
                if (!AbilityUtil.isSelectUi() || count > 1000) {//取消施法、最大显示限制。
                    EXSetEffectVisible(actor.effect, false);
                    DzFrameShow(FrameGetMouse(), true)
                    FrameSetModelSize(FrameGetMouse(), 1)
                    return false;
                }
                return true;
            })
            return true;
        }
        actorType.onAction = (actor, x, y, targetUnit) => {
            if (!IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)) {
                let unitActorType = ActorTypeUtil.getActorType(unitId);
                if (unitActorType != null) {
                    new ActorUnit(unitId, GetOwningPlayer(actor.unit), x, y)
                } else {
                    CreateUnit(GetOwningPlayer(actor.unit), unitId, x, y, 270)
                }
                onBuild?.(actor);
            } else {
                DisplayTimedTextToPlayer(GetOwningPlayer(actor.unit), 0, 0, 5, "|cffff0000当前点不可建造!");
            }
            if (isEmbedJapi) {
                EXSetEffectVisible(actor.effect, false);
                FrameSetModelSize(FrameGetMouse(), 1)
            }
        }

    }

}