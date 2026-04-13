import Cache from "../../tool/Cache";

export default class HookUtil {

    static cache = new Cache();


    /**调整玩家属性值*/
    public static onAdjustPlayerStateBJ(listener: (this: void, delta: number, whichPlayer: player, whichPlayerState: playerstate) => void) {
        let listeners: any[] = HookUtil.cache.get("onAdjustPlayerStateBJ", () => {
            let callbacks: ((this: void, delta: number, whichPlayer: player, whichPlayerState: playerstate) => void)[] = [];
            let oldCallback = AdjustPlayerStateBJ;
            _G.AdjustPlayerStateBJ = function (this: void, delta: number, whichPlayer: player, whichPlayerState: playerstate) {
                for (let callback of callbacks) {
                    callback(delta, whichPlayer, whichPlayerState);
                }
                return oldCallback(delta, whichPlayer, whichPlayerState);
            }
            return callbacks;
        });
        listeners.push(listener);
    }

    /**增加科技等级*/
    public static onAddPlayerTechResearched(listener: (this: void, whichPlayer: player, techid: number | string, levels: number) => void) {
        let listeners: any[] = HookUtil.cache.get("onAddPlayerTechResearched", () => {
            let callbacks: ((this: void, whichPlayer: player, techid: number | string, levels: number) => void)[] = [];
            let oldCallback = AddPlayerTechResearched;
            _G.AddPlayerTechResearched = function (this: void, whichPlayer: player, techid: number | string, levels: number) {
                for (let callback of callbacks) {
                    callback(whichPlayer, techid, levels);
                }
                return oldCallback(whichPlayer, techid, levels);
            }
            return callbacks;
        });
        listeners.push(listener);
    }

    static onUnitAddAbility(listener: (this: void, whichUnit: unit, abilityid: number | string) => void) {
        let cs: any[] = HookUtil.cache.get("onUnitAddAbility", () => {
            let cst: ((this: void, whichUnit: unit, abilityid: number | string) => void)[] = []
            let old = UnitAddAbility;
            _G.UnitAddAbility = function (this: void, whichUnit: unit, abilityid: number | string) {
                for (let c of cst) {
                    c(whichUnit, abilityid)
                }
                return old(whichUnit, abilityid)
            }
            return cst;
        });
        cs.push(listener)
    }

    static onUnitRemoveAbility(listener: (this: void, whichUnit: unit, abilityid: number | string) => void) {
        let cs: any[] = HookUtil.cache.get("onUnitRemoveAbility", () => {
            let cst: ((this: void, whichUnit: unit, abilityid: number | string) => void)[] = []
            let old = UnitRemoveAbility;
            _G.UnitRemoveAbility = function (this: void, whichUnit: unit, abilityid: number | string) {
                for (let c of cst) {
                    c(whichUnit, abilityid)
                }
                return old(whichUnit, abilityid)
            }
            return cst;
        });
        cs.push(listener)
    }


    /**  Hook a function with your own logic that will execute after the original function. */
    static hookArguments<Args extends any[], T>(oldFunc: (...args: Args) => T, newFunc: (...args: Args) => void) {
        return (...args: Args) => {
            let val = oldFunc(...args);
            newFunc(...args);
            return val;
        };
    }

    /**  Hook a function with your own logic that will execute before the original function. */
    static hookArgumentsBefore<Args extends any[], T>(oldFunc: (...args: Args) => T, newFunc: (...args: Args) => void) {
        return (...args: Args) => {
            newFunc(...args);
            return oldFunc(...args);
        };
    }

    /**  Hook a function that will execute your own function and passes the result of the original to the new function. */
    static hookResult<Args extends any[], T>(hookFunc: (...args: Args) => T, passFunc: (value: T) => void) {
        return (...args: Args) => {
            let value = hookFunc(...args);
            passFunc(value);
            return value;
        }
    }
}
