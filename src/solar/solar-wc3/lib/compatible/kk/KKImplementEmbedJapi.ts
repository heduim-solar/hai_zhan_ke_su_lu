export default class KKImplementEmbedJapi {

    private static is_init = false;

    static init() {
        if (KKImplementEmbedJapi.is_init) {
            return
        }
        KKImplementEmbedJapi.is_init = true;
        //
        if (GetStoreTarget == null) {
            _G.GetStoreTarget = DzGetActivePatron;
        }
        if (GetItemAbility == null) {
            _G.GetItemAbility = DzGetItemAbility;
        }
        if (GetFps == null) {
            _G.GetFps = DzGetFPS;
        }
        if (ShowFpsText == null) {
            _G.ShowFpsText = DzToggleFPS;
        }
        if (SetUnitMoveType == null) {
            _G.SetUnitMoveType = DzSetUnitMoveType;
        }
        if (SetUnitName == null) {
            _G.SetUnitName = DzSetUnitName;
        }
        if (SetUnitProperName == null) {
            _G.SetUnitProperName = DzSetUnitProperName;
        }
        if (SetUnitMissileModel == null) {
            _G.SetUnitMissileModel = DzSetUnitMissileModel;
        }
        if (SetUnitPortrait == null) {
            _G.SetUnitPortrait = DzSetUnitPortrait;
        }
        if (SetUnitPressUIVisible == null) {
            _G.SetUnitPressUIVisible = DzSetUnitPreselectUIVisible;
        }
        if (FrameSetViewPort == null) {
            _G.FrameSetViewPort = DzFrameSetClip;
        }
    }


}