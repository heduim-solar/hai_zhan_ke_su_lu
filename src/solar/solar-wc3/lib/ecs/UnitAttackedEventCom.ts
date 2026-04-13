import {Component} from "./Ecs";
import {Unit} from "@/unit";


export type UnitAttackedDataType = {
    attacker: Unit;//攻击者
    attackedUnit: Unit;//被攻击者
}


export const UnitAttackedEventCom = Component.register<UnitAttackedDataType>()