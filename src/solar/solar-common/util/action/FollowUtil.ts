/**
 * @brief 一个单位跟随另一个单位
 */
import BaseUtil from '@//util/BaseUtil';
import MathUtil from '@//util/math/MathUtil';
import { OrderId } from "@/w3ts/globals/order";


export default class FollowUtil {

    /**跟随*/
    public static follow(pet: unit, captain: unit, timeout: number = 1.0, guardRanger: number = 200, returnRanger: number = 300, outRanger: number = 400, probability: number = 1.0) {
        handle_ref(pet);
        handle_ref(captain);
        BaseUtil.onTimer(timeout, () => {
            let captainX: number = GetUnitX(captain);
            let captainY: number = GetUnitY(captain);
            let petX: number = GetUnitX(pet);
            let petY: number = GetUnitY(pet);
            let distance: number = MathUtil.distanceBetweenPoints(petX, petY, captainX, captainY);
            let range: number = guardRanger;
            if (IsUnitAliveBJ(pet) && UnitAlive(captain)) {
                if (distance < range) {
                    if (!OrderId2String(GetUnitCurrentOrder(pet)) && GetRandomReal(0.0, 1.0) < probability) {
                        let randomDistance: number = GetRandomReal(0, distance);
                        let randomAngle: number = GetRandomReal(0, 360);
                        let x: number = GetUnitX(captain) + randomDistance * CosBJ(randomAngle);
                        let y: number = GetUnitY(captain) + randomDistance * SinBJ(randomAngle);
                        IssuePointOrder(pet, OrderId2String(OrderId.Patrol), x, y);
                    }
                } else {
                    range = returnRanger;
                    if (distance < range) {
                        if (!OrderId2String(GetUnitCurrentOrder(pet))) {
                            IssuePointOrder(pet, OrderId2String(OrderId.Patrol), GetUnitX(captain), GetUnitY(captain));
                        }
                    }
                    else {
                        range = outRanger;
                        if (distance != 0 && distance > range) {
                            SetUnitPosition(pet, GetUnitX(captain), GetUnitY(captain));
                            let effectHandle: effect = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest");
                            DestroyEffect(effectHandle);
                        }
                        else {
                            IssuePointOrder(pet, OrderId2String(OrderId.Move), GetUnitX(captain), GetUnitY(captain));
                        }
                    }
                }
            } else {
                IssuePointOrder(pet, OrderId2String(OrderId.Attack), GetUnitX(captain), GetUnitY(captain));
                handle_unref(pet);
                handle_unref(captain);
                return false;
            }

            return true;
        });
    }
}