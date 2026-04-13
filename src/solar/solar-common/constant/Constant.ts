export default class Constant {
    static init() {
        this.initJapi0()
        /**
         *  FRAMEPOINT
         */
        FRAMEPOINT_TOPLEFT = 0

        FRAMEPOINT_TOP = 1

        FRAMEPOINT_TOPRIGHT = 2

        FRAMEPOINT_LEFT = 3

        FRAMEPOINT_CENTER = 4

        FRAMEPOINT_RIGHT = 5

        FRAMEPOINT_BOTTOMLEFT = 6

        FRAMEPOINT_BOTTOM = 7

        FRAMEPOINT_BOTTOMRIGHT = 8

        /**
         *  FRAME_EVENT
         */
        FRAMEEVENT_CONTROL_CLICK = 1

        FRAMEEVENT_MOUSE_ENTER = 2

        FRAMEEVENT_MOUSE_LEAVE = 3

        FRAMEEVENT_MOUSE_UP = 4

        FRAMEEVENT_MOUSE_DOWN = 5

        FRAMEEVENT_MOUSE_WHEEL = 6

        // FRAME_FOCUS_ENTER = FRAME_MOUSE_ENTER

        // FRAME_FOCUS_LEAVE = FRAME_MOUSE_LEAVE

        FRAMEEVENT_CHECKBOX_CHECKED = 7

        FRAMEEVENT_CHECKBOX_UNCHECKED = 8

        FRAMEEVENT_EDITBOX_TEXT_CHANGED = 9

        FRAMEEVENT_POPUPMENU_ITEM_CHANGED = 10

        // FRAME_POPUPMENU_ITEM_CHANGED = 11

        FRAMEEVENT_MOUSE_DOUBLECLICK = 12

        // FRAME_SPRITE_ANIM_UPDATE = 13

        /**
         *  TEXT_ALIGN
         */
        TEXTALIGN_TOPLEFT = 11 // 文本左上对齐
        TEXTALIGN_TOP = 17 // 文本上对齐
        TEXTALIGN_TOPRIGHT = 37 //文本右上对齐
        TEXTALIGN_CENTER = 18 // 文本对齐中
        TEXTALIGN_LEFT = 10 //文本对齐左
        TEXTALIGN_RIGHT = 34 //文本对齐右
        TEXTALIGN_BOTTOMLEFT = 12 //文本左下对齐
        TEXTALIGN_BOTTOM = 20 //文本下对齐
        TEXTALIGN_BOTTOMRIGHT = 36 //文本右下对齐

    }


    private static initJapi0() {
        ABILITY_STATE_COOLDOWN = 1

        ABILITY_DATA_TARGS = 100 // integer
        ABILITY_DATA_CAST = 101 // real
        ABILITY_DATA_DUR = 102 // real
        ABILITY_DATA_HERODUR = 103 // real
        ABILITY_DATA_COST = 104 // integer
        ABILITY_DATA_COOL = 105 // real
        ABILITY_DATA_AREA = 106 // real
        ABILITY_DATA_RNG = 107 // real
        ABILITY_DATA_DATA_A = 108 // real
        ABILITY_DATA_DATA_B = 109 // real
        ABILITY_DATA_DATA_C = 110 // real
        ABILITY_DATA_DATA_D = 111 // real
        ABILITY_DATA_DATA_E = 112 // real
        ABILITY_DATA_DATA_F = 113 // real
        ABILITY_DATA_DATA_G = 114 // real
        ABILITY_DATA_DATA_H = 115 // real
        ABILITY_DATA_DATA_I = 116 // real
        ABILITY_DATA_UNITID = 117 // integer

        ABILITY_DATA_HOTKET = 200 // integer
        ABILITY_DATA_UNHOTKET = 201 // integer
        ABILITY_DATA_RESEARCH_HOTKEY = 202 // integer
        ABILITY_DATA_NAME = 203 // string
        ABILITY_DATA_ART = 204 // string
        ABILITY_DATA_TARGET_ART = 205 // string
        ABILITY_DATA_CASTER_ART = 206 // string
        ABILITY_DATA_EFFECT_ART = 207 // string
        ABILITY_DATA_AREAEFFECT_ART = 208 // string
        ABILITY_DATA_MISSILE_ART = 209 // string
        ABILITY_DATA_SPECIAL_ART = 210 // string
        ABILITY_DATA_LIGHTNING_EFFECT = 211 // string
        ABILITY_DATA_BUFF_TIP = 212 // string
        ABILITY_DATA_BUFF_UBERTIP = 213 // string
        ABILITY_DATA_RESEARCH_TIP = 214 // string
        ABILITY_DATA_TIP = 215 // string
        ABILITY_DATA_UNTIP = 216 // string
        ABILITY_DATA_RESEARCH_UBERTIP = 217 // string
        ABILITY_DATA_UBERTIP = 218 // string
        ABILITY_DATA_UNUBERTIP = 219 // string
        ABILITY_DATA_UNART = 220 // string

        //damage
        EVENT_DAMAGE_DATA_VAILD = 0
        EVENT_DAMAGE_DATA_IS_PHYSICAL = 1
        EVENT_DAMAGE_DATA_IS_ATTACK = 2
        EVENT_DAMAGE_DATA_IS_RANGED = 3
        EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
        EVENT_DAMAGE_DATA_WEAPON_TYPE = 5
        EVENT_DAMAGE_DATA_ATTACK_TYPE = 6

        //单位 UnitState
        UnitStateDamageDice = ConvertUnitState(0x10);
        UnitStateDamageSide = ConvertUnitState(0x11);
        UnitStateDamageBase = ConvertUnitState(0x12);
        UnitStateDamageBonus = ConvertUnitState(0x13);
        UnitStateDamageMix = ConvertUnitState(0x14);
        UnitStateDamageMax = ConvertUnitState(0x15);
        UnitStateDamageRange = ConvertUnitState(0x16);
        UnitStateDamageCool = ConvertUnitState(0x25);
        UnitStateAttackSpeed = ConvertUnitState(0x51);
        UnitStateArmor = ConvertUnitState(0x20);


    }


}
