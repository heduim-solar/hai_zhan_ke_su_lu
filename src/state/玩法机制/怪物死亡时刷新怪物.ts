import BaseUtil from '@/BaseUtil';
import SelectUtil from "@/SelectUtil";
import DataBase from "@/DataBase";
import UnitUtil from "@/UnitUtil";
import PlayerUtil from "@/PlayerUtil";


declare global {

    interface AppUnitData {
        _sl_怪物死亡时刷新怪物_pid?: number
        _sl_怪物死亡时刷新怪物_type?: number
        _sl_怪物死亡时刷新怪物_x?: number
        _sl_怪物死亡时刷新怪物_y?: number
        _sl_怪物死亡时刷新怪物_face?: number
        _sl_怪物死亡时刷新怪物_time?: number
    }

}


export default class 怪物死亡时刷新怪物 {
    static config = {
        registrationTime: 0.5,
        playerIds: [10, 11],
        baseTime: 60, //小怪刷新时间
        heroTime: 60, //英雄刷新时间
    }


    constructor() {
        怪物死亡时刷新怪物.config.playerIds = [GetPlayerId(PlayerUtil.neutralAggressivePlayer())]
        BaseUtil.runLater(怪物死亡时刷新怪物.config.registrationTime, () => {
            for (let playerId of 怪物死亡时刷新怪物.config.playerIds) {
                SelectUtil.forPlayerUnits(u => {
                    let solarData: AppUnitData = DataBase.getUnitSolarData(u, true);
                    solarData._sl_怪物死亡时刷新怪物_pid = GetPlayerId(GetOwningPlayer(u));
                    solarData._sl_怪物死亡时刷新怪物_type = GetUnitTypeId(u);
                    solarData._sl_怪物死亡时刷新怪物_x = GetUnitX(u);
                    solarData._sl_怪物死亡时刷新怪物_y = GetUnitY(u);
                    solarData._sl_怪物死亡时刷新怪物_face = GetUnitFacing(u);
                    solarData._sl_怪物死亡时刷新怪物_time = UnitUtil.isHero(u) ? 怪物死亡时刷新怪物.config.heroTime : 怪物死亡时刷新怪物.config.baseTime
                }, playerId);
            }
        });


        se.onUnitDeath(e => {
            let solarData: AppUnitData = DataBase.getUnitSolarData(e.trigUnit, false);
            if (solarData?._sl_怪物死亡时刷新怪物_x != null) {
                let pid = solarData._sl_怪物死亡时刷新怪物_pid
                let type = solarData._sl_怪物死亡时刷新怪物_type
                let x = solarData._sl_怪物死亡时刷新怪物_x
                let y = solarData._sl_怪物死亡时刷新怪物_y
                let face = solarData._sl_怪物死亡时刷新怪物_face
                let time = solarData._sl_怪物死亡时刷新怪物_time

                BaseUtil.runLater(time, () => {
                    let newUnit = CreateUnit(Player(pid), type, x, y, face);
                    let newUnitSolarData: AppUnitData = DataBase.getUnitSolarData(newUnit, true);
                    newUnitSolarData._sl_怪物死亡时刷新怪物_pid = pid;
                    newUnitSolarData._sl_怪物死亡时刷新怪物_type = type;
                    newUnitSolarData._sl_怪物死亡时刷新怪物_x = x;
                    newUnitSolarData._sl_怪物死亡时刷新怪物_y = y;
                    newUnitSolarData._sl_怪物死亡时刷新怪物_face = face;
                    newUnitSolarData._sl_怪物死亡时刷新怪物_time = time;
                });
            }
        })


    }


}