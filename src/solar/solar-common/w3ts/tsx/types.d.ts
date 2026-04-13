/** @noSelfInFile **/

declare type RelativeFrame =
    | number
    // | "previous"
    | "parent"
// | "children"
// | "children-reverse";

declare type Pos =
    | {
    point?: number;
    relative?: RelativeFrame;
    relativePoint?: number;
    x?: number;
    y?: number;
}
    | "parent"
    | "clear";

declare type AbsPos =
    | {
    point: number;
    x?: number;
    y?: number;
}
    | "clear";

declare type Handler = (() => void) | null;

// Props shared by all frame types
declare type CommonFrameProps = {
    // immutable props
    id?: string;
    name?: string;
    priority?: number;
    isSimple?: boolean;
    typeName?: string | null;
    inherits?: string;
    context?: number;
    key?: string | number | null;
    // mutable props
    alpha?: number;
    enabled?: boolean;
    font?: { fileName?: string; height?: number; flags?: number };
    level?: number;
    maxLength?: number;
    minMaxValue?: { min?: number; max?: number };
    scale?: number;
    text?: string;
    textAlignment?: number;
    textColor?: number;
    texture?: { texFile?: string; flag?: number; blend?: boolean } | string;
    value?: number;
    vertexColor?: number;
    visible?: boolean;
    size?: { width?: number; height?: number };
    position?: Pos | Pos[] | null;
    absPosition?: AbsPos | AbsPos[] | null;
    ref?: Ref | null;
    //japi addons
    modelSize?: number
    modelPariticleSize?: number
    modelSpeed?: number
    //solar addons
    [key: string]: any
    hideParentOnClick?: boolean
    showRefOnClick?: Ref
    "background-image"?: string
    "frametip"?: { frametipRef: Ref, pos?: number, onTip?: (tipHandle: number, triggerHandle: number) => void }
};

declare type Ref = {
    current: number
}
// Props shared by all simple frames
declare type SimpleFrameProps = CommonFrameProps;

// Props shared by all frames that are not simple frames
declare type ComplexFrameProps = CommonFrameProps & {
    tooltip?: number | null;
};

declare type FrameProps = ComplexFrameProps & {
    model?: { modelFile?: string; cameraIndex?: number };
    spriteAnimate?: { primaryProp: number; flags: number };
    stepSize?: number;
    onClick?: Handler;
    onClickSync?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onCheckboxChecked?: Handler;
    onCheckboxUnchecked?: Handler;
    onEditboxTextChanged?: Handler;
    onPopupmenuItemChanged?: Handler;
    onDoubleClick?: Handler;
    onSpriteAnimUpdate?: Handler;
    onSliderChanged?: Handler;
    onDialogCancel?: Handler;
    onDialogAccept?: Handler;
    onEditboxEnter?: Handler;
};

declare type BackdropProps = ComplexFrameProps;

declare type ButtonProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onDoubleClick?: Handler;
};

declare type ChatDisplayProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onDoubleClick?: Handler;
};

declare type CheckboxProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onCheckboxChecked?: Handler;
    onCheckboxUnchecked?: Handler;
    onDoubleClick?: Handler;
};

declare type ControlProps = ComplexFrameProps & {
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
};

declare type DialogProps = ComplexFrameProps & {
    onDialogCancel?: Handler;
    onDialogAccept?: Handler;
};

declare type EditBoxProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onEditboxTextChanged?: Handler;
    onDoubleClick?: Handler;
    onEditboxEnter?: Handler;
};

declare type ContainerProps = ComplexFrameProps;

declare type GlueButtonProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
};

declare type GlueCheckboxProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onCheckboxChecked?: Handler;
    onCheckboxUnchecked?: Handler;
    onDoubleClick?: Handler;
};

declare type GlueEditBoxProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onEditboxTextChanged?: Handler;
    onDoubleClick?: Handler;
    onEditboxEnter?: Handler;
};

declare type GluePopupMenuProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseWheel?: Handler;
    onPopupmenuItemChanged?: Handler;
    onDoubleClick?: Handler;
};

declare type GlueTextButtonProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onDoubleClick?: Handler;
};

declare type HighlightProps = ComplexFrameProps;

declare type ListBoxProps = ComplexFrameProps & {
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
};

declare type MenuProps = ComplexFrameProps & {
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
};

declare type ModelProps = ComplexFrameProps & {
    model?: { modelFile?: string; cameraIndex?: number };
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
};

declare type PopupMenuProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseWheel?: Handler;
    onPopupmenuItemChanged?: Handler;
    onDoubleClick?: Handler;
};

declare type ScrollbarProps = ComplexFrameProps & {
    stepSize?: number;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onSliderChanged?: Handler;
};

declare type SimpleButtonProps = SimpleFrameProps & {
    tooltip?: number | null;
    onClick?: Handler;
};

declare type SimpleCheckboxProps = SimpleFrameProps;

declare type SimpleContainerProps = SimpleFrameProps;

declare type SimpleStatusBarProps = SimpleFrameProps;

declare type SlashChatboxProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onEditboxTextChanged?: Handler;
    onDoubleClick?: Handler;
    onEditboxEnter?: Handler;
};

declare type SliderProps = ComplexFrameProps & {
    stepSize?: number;
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onSliderChanged?: Handler;
    onDoubleClick?: Handler;
};

declare type SpriteProps = ComplexFrameProps & {
    spriteAnimate?: { primaryProp: number; flags: number };
    model?: { modelFile: string; cameraIndex: number };
    onSpriteAnimUpdate?: Handler;
};

declare type TextProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onDoubleClick?: Handler;
};

declare type TextAreaProps = ComplexFrameProps & {
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
};

declare type TextButtonProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onDoubleClick?: Handler;
};

declare type TimerTextProps = ComplexFrameProps & {
    onClick?: Handler;
    onMouseEnter?: Handler;
    onMouseLeave?: Handler;
    onMouseUp?: Handler;
    onMouseDown?: Handler;
    onMouseWheel?: Handler;
    onDoubleClick?: Handler;
};

declare namespace JSX {
    interface IntrinsicElements {
        // addons
        root: ContainerProps;
        div: ContainerProps;
        img: ContainerProps;
        //base
        frame: FrameProps;
        "simple-frame": FrameProps;
        backdrop: BackdropProps;
        button: ButtonProps;
        chatdisplay: ChatDisplayProps;
        checkbox: CheckboxProps;
        control: ControlProps;
        dialog: DialogProps;
        editbox: EditBoxProps;
        container: ContainerProps;
        gluebutton: GlueButtonProps;
        gluecheckbox: GlueCheckboxProps;
        glueeditbox: GlueEditBoxProps;
        gluepopupmenu: GluePopupMenuProps;
        gluetextbutton: GlueTextButtonProps;
        heightlight: HighlightProps;
        listbox: ListBoxProps;
        menu: MenuProps;
        model: ModelProps;
        popupmenu: PopupMenuProps;
        scrollbar: ScrollbarProps;
        "simple-button": SimpleButtonProps;
        "simple-checkbox": SimpleCheckboxProps;
        "simple-container": SimpleContainerProps;
        "simple-statusbar": SimpleStatusBarProps;
        slashchatbox: SlashChatboxProps;
        slider: SliderProps;
        sprite: SpriteProps;
        text: TextProps;
        textarea: TextAreaProps;
        textbutton: TextButtonProps;
        timertext: TimerTextProps;
    }
}
