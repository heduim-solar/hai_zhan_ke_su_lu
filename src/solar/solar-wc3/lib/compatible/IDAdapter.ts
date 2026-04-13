/** @noSelf **/
export default class IDAdapter {

    static config: { [funName: string]: number } = {
        "CreateUnit": 1,
        "CreateUnitAtLoc": 1,
        "CreateCorpse": 1,
        "UnitAddItemById": 1,
        "UnitAddItemToSlotById": 1,
        "GetFoodMade": 1,
        "GetFoodUsed": 1,
        "IsHeroUnitId": 1,
        "IsUnitIdType": 1,
        "UnitAddAbility": 1,
        "UnitRemoveAbility": 1,
        "UnitMakeAbilityPermanent": 2,
        "UnitApplyTimedLife": 1,
        "IssueBuildOrderById": 1,
        "IssueNeutralImmediateOrderById": 2,
        "IssueNeutralPointOrderById": 2,
        "IssueNeutralTargetOrderById": 2,
        "AddItemToAllStock": 0,
        "AddItemToStock": 1,
        "AddUnitToAllStock": 0,
        "AddUnitToStock": 1,
        "RemoveItemFromAllStock": 0,
        "RemoveItemFromStock": 1,
        "RemoveUnitFromAllStock": 0,
        "RemoveUnitFromStock": 1,
        "SetPlayerTechMaxAllowed": 1,
        "GetPlayerTechMaxAllowed": 1,
        "AddPlayerTechResearched": 1,
        "SetPlayerTechResearched": 1,
        "GetPlayerTechResearched": 1,
        "GetPlayerTechCount": 1,
        "SetPlayerAbilityAvailable": 1,
        "UnitPoolAddUnitType": 1,
        "UnitPoolRemoveUnitType": 1,
        "ItemPoolAddItemType": 1,
        "ItemPoolRemoveItemType": 1,
        "SetCinematicScene": 0,
        "AddWeatherEffect": 0,
        "AddSpellEffectById": 0,
        "AddSpellEffectByIdLoc": 0,
        "AddSpellEffectTargetById": 0,
        "GetAbilityEffectById": 0,
        "GetAbilitySoundById": 0,
        "SetDoodadAnimation": 3,
        "SetDoodadAnimationRect": 1,
        "GetObjectName": 0,
        "CreateDestructable": 0,
        "CreateDestructableZ": 0,
        "CreateDeadDestructable": 0,
        "CreateDeadDestructableZ": 0,
        "CreateItem": 0,
        "IsItemIdPowerup": 0,
        "IsItemIdSellable": 0,
        "IsItemIdPawnable": 0,
        "SetItemDropID": 1,
        //code
        "SelectHeroSkill": 1,
        "GetUnitAbilityLevel": 1,
        "DecUnitAbilityLevel": 1,
        "IncUnitAbilityLevel": 1,
        "SetUnitAbilityLevel": 1,
        //japi
        "EXGetUnitAbility": 1,
        "EXSetAbilityString": 0,
        "EXGetItemDataString": 0,
        "EXSetItemDataString": 0,

    }


    /**
     * 重写部分需要id的函数
     */
    static init() {
        for (let funName in IDAdapter.config) {
            let oldFun: (this: void, ...args) => any = _G[funName];
            _G[funName] = function (this: void, ...args) {
                let idIndex: number = IDAdapter.config[funName];
                if (args && args.length >= idIndex) {
                    let id: any = args[idIndex];
                    if (id && typeof id == "string") {
                        if ((id as string).length != 4) {
                            log.errorWithTraceBack(funName + " : 你传的ID不是4个字符！id=[" + id + "]")
                            return null;
                        }
                        args[idIndex] = FourCC(id as string)
                    }
                }
                try {
                    //... 会丢失null参数
                    return oldFun(...args)
                } catch (e) {
                    print(e)
                    log.errorWithTraceBack(funName)
                    print_r(args)
                    throw e
                }
            }
        }
    }


}
