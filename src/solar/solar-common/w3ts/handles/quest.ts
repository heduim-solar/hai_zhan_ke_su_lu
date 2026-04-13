/** @noSelfInFile **/

import {Handle} from "./handle";

export class QuestItem extends Handle<questitem> {

    constructor(whichQuest: Quest) {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(QuestCreateItem(whichQuest.handle));
        }
    }

    /**
     * 任务物品介绍
     */
    public setDescription(description: string) {
        QuestItemSetDescription(this.handle, description);
    }

    /**
     * 任务条件完成
     */
    public get completed() {
        return IsQuestItemCompleted(this.handle);
    }

    /**
     * 任务物品发货
     */
    public set completed(completed: boolean) {
        QuestItemSetCompleted(this.handle, completed);
    }
}

export class Quest extends Handle<quest> {

    constructor() {
        super(Handle.initFromHandle() ? undefined : CreateQuest());
    }

    /**
     * 任务完成
     */
    public get completed() {
        return IsQuestCompleted(this.handle);
    }

    /**
     * 任务完成
     */
    public set completed(completed: boolean) {
        QuestSetCompleted(this.handle, completed);
    }

    /**
     * 任务找到
     */
    public get discovered() {
        return IsQuestDiscovered(this.handle);
    }

    /**
     * 任务找到
     */
    public set discovered(discovered: boolean) {
        QuestSetDiscovered(this.handle, discovered);
    }

    /**
     * 允许任务
     */
    public get enabled() {
        return IsQuestEnabled(this.handle);
    }

    /**
     * 允许任务
     */
    public set enabled(enabled: boolean) {
        QuestSetEnabled(this.handle, enabled);
    }

    /**
     * 任务失败
     */
    public get failed() {
        return IsQuestFailed(this.handle);
    }

    /**
     * 任务失败
     */
    public set failed(failed: boolean) {
        QuestSetFailed(this.handle, failed);
    }

    /**
     * 任务是必须完成的
     */
    public get required() {
        return IsQuestRequired(this.handle);
    }

    /**
     * 任务是必须完成的
     */
    public set required(required: boolean) {
        QuestSetRequired(this.handle, required);
    }

    public addItem(description: string) {
        const questItem = new QuestItem(this);

        questItem.setDescription(description);

        return questItem;
    }

    public destroy() {
        DestroyQuest(this.handle);
    }

    public setDescription(description: string) {
        QuestSetDescription(this.handle, description);
    }

    public setIcon(iconPath: string) {
        QuestSetIconPath(this.handle, iconPath);
    }

    public setTitle(title: string) {
        QuestSetTitle(this.handle, title);
    }

    public static flashQuestDialogButton() {
        FlashQuestDialogButton();
    }

    public static forceQuestDialogUpdate() {
        ForceQuestDialogUpdate();
    }

    public static fromHandle(handle: quest): Quest {
        return this.getObject(handle);
    }

}
