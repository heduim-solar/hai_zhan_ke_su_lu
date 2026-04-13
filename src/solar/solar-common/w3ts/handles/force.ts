/** @noSelfInFile **/

import {Handle} from "./handle";
import {MapPlayer} from "./player";

export class Force extends Handle<force> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateForce());
        }
    }

    /**
     * 添加玩家 [R]
     */
    public addPlayer(whichPlayer: MapPlayer) {
        ForceAddPlayer(this.handle, whichPlayer.handle);
    }

    /**
     * 清除玩家
     */
    public clear() {
        ForceClear(this.handle);
    }

    /**
     * 删除玩家组 [R]
     */
    public destroy() {
        DestroyForce(this.handle);
    }

    /**
     * 匹配联盟
     */
    public enumAllies(whichPlayer: MapPlayer, filter: boolexpr) {
        ForceEnumAllies(this.handle, whichPlayer.handle, filter);
    }

    /**
     * 匹配敌对
     */
    public enumEnemies(whichPlayer: MapPlayer, filter: boolexpr) {
        ForceEnumEnemies(this.handle, whichPlayer.handle, filter);
    }

    /**
     * 匹配玩家
     */
    public enumPlayers(filter: boolexpr) {
        ForceEnumPlayers(this.handle, filter);
    }

    /**
     * 匹配玩家 [countLimit 上限]
     */
    public enumPlayersCounted(filter: boolexpr, countLimit: number) {
        ForceEnumPlayersCounted(this.handle, filter, countLimit);
    }

    /**
     * 选取所有玩家在玩家组做动作(单一的)
     */
    public for(callback: () => void) {
        ForForce(this.handle, callback);
    }

    /**
     * 选取所有玩家在玩家组做动作(单一的)
     */
    public getPlayers() {
        const players: MapPlayer[] = [];

        ForForce(this.handle, () => players.push(MapPlayer.fromEnum()));

        return players;
    }

    /**
     * 玩家在玩家组
     */
    public hasPlayer(whichPlayer: MapPlayer) {
        return IsPlayerInForce(whichPlayer.handle, this.handle);
    }

    /**
     * 移除玩家 [R]
     */
    public removePlayer(whichPlayer: MapPlayer) {
        ForceRemovePlayer(this.handle, whichPlayer.handle);
    }

    /**
     * 从handle获取封装类
     */
    public static fromHandle(handle: force): Force {
        return this.getObject(handle);
    }

}
