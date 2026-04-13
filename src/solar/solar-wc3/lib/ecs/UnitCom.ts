import {Component} from "./Ecs";
import {Unit} from "@/unit";


export type UnitDataType = {
    value: Unit;
}


export default  Component.register<UnitDataType>();