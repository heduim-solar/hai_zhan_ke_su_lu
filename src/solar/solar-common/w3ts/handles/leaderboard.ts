/** @noSelfInFile **/

import {Handle} from "./handle";
import {MapPlayer} from "./player";

export class Leaderboard extends Handle<leaderboard> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateLeaderboard());
        }
    }

    /**
     * 添加玩家
     * @param label
     * @param value
     * @param p
     */
    public addItem(label: string, value: number, p: MapPlayer) {
        LeaderboardAddItem(this.handle, label, value, p.handle);
    }

    /**
     * 清空 [R]
     */
    public clear() {
        LeaderboardClear(this.handle);
    }

    /**
     * 删除排行榜
     */
    public destroy() {
        DestroyLeaderboard(this.handle);
    }

    /**
     * 显示/隐藏 [R]
     */
    public display(flag: boolean = true) {
        LeaderboardDisplay(this.handle, flag);
    }

    /**
     * 是否显示排行榜
     */
    public get displayed() {
        return IsLeaderboardDisplayed(this.handle);
    }

    /**
     * 行数
     */
    public get itemCount() {
        return LeaderboardGetItemCount(this.handle);
    }

    /**
     * 排行榜设置大小（按项目计数）
     * @param count
     */
    public set itemCount(count: number) {
        LeaderboardSetSizeByItemCount(this.handle, count);
    }

    /**
     * 排行榜获取玩家指数
     * @param p
     */
    public getPlayerIndex(p: MapPlayer) {
        return LeaderboardGetPlayerIndex(this.handle, p.handle);
    }

    /**
     * 排行榜有玩家项目
     * @param p
     */
    public hasPlayerItem(p: MapPlayer) {
        LeaderboardHasPlayerItem(this.handle, p.handle);
    }

    /**
     * 排行榜删除项目
     * @param index
     */
    public removeItem(index: number) {
        LeaderboardRemoveItem(this.handle, index);
    }

    /**
     * 排行榜删除玩家项目
     * @param index
     */
    public removePlayerItem(p: MapPlayer) {
        LeaderboardRemovePlayerItem(this.handle, p.handle);
    }

    /**
     * 排行榜集合项目标签
     * @param item
     * @param label
     */
    public setItemLabel(item: number, label: string) {
        LeaderboardSetItemLabel(this.handle, item, label);
    }

    /**
     * 排行榜设置项目标签颜色
     * @param item
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    public setItemLabelColor(item: number, red: number, green: number, blue: number, alpha: number) {
        LeaderboardSetItemLabelColor(this.handle, item, red, green, blue, alpha);
    }

    /**
     * 排行榜集合项目样式
     * @param item
     * @param showLabel
     * @param showValues
     * @param showIcons
     */
    public setItemStyle(item: number, showLabel: boolean = true, showValues: boolean = true, showIcons: boolean = true) {
        LeaderboardSetItemStyle(this.handle, item, showLabel, showValues, showIcons);
    }

    /**
     * 排行榜设置项目值
     * @param item
     * @param value
     */
    public setItemValue(item: number, value: number) {
        LeaderboardSetItemValue(this.handle, item, value);
    }

    /**
     * 排行榜设置项目值颜色
     * @param item
     * @param red
     * @param green
     * @param blue
     * @param alpha
     */
    public setItemValueColor(item: number, red: number, green: number, blue: number, alpha: number) {
        LeaderboardSetItemValueColor(this.handle, item, red, green, blue, alpha);
    }

    /**
     * 设置文字颜色 [R]
     */
    public setLabelColor(red: number, green: number, blue: number, alpha: number) {
        LeaderboardSetLabelColor(this.handle, red, green, blue, alpha);
    }

    /**
     * 设置玩家使用的排行榜 [R]
     */
    public setPlayerBoard(p: MapPlayer) {
        PlayerSetLeaderboard(p.handle, this.handle);
    }

    /**
     * 排行榜设置样式
     * @param showLabel
     * @param showNames
     * @param showValues
     * @param showIcons
     */
    public setStyle(showLabel: boolean = true, showNames: boolean = true, showValues: boolean = true, showIcons: boolean = true) {
        LeaderboardSetStyle(this.handle, showLabel, showNames, showValues, showIcons);
    }

    /**
     * 设置数值颜色 [R]
     */
    public setValueColor(red: number, green: number, blue: number, alpha: number) {
        LeaderboardSetValueColor(this.handle, red, green, blue, alpha);
    }

    /**
     * 根据标签排行
     * @param asc
     */
    public sortByLabel(asc: boolean = true) {
        LeaderboardSortItemsByLabel(this.handle, asc);
    }

    /**
     * 根据玩家排行
     * @param asc
     */
    public sortByPlayer(asc: boolean = true) {
        LeaderboardSortItemsByPlayer(this.handle, asc);
    }

    /**
     * 根据值排行
     * @param asc
     */
    public sortByValue(asc: boolean = true) {
        LeaderboardSortItemsByValue(this.handle, asc);
    }

    /**
     * 设置标签
     * @param asc
     */
    public set label(value: string) {
        LeaderboardSetLabel(this.handle, value);
    }

    /**
     * 标签
     * @param asc
     */
    public get label() {
        return LeaderboardGetLabelText(this.handle);
    }

    public static fromHandle(handle: leaderboard): Leaderboard {
        return this.getObject(handle);
    }

    public static fromPlayer(p: MapPlayer) {
        return this.fromHandle(PlayerGetLeaderboard(p.handle));
    }
}
