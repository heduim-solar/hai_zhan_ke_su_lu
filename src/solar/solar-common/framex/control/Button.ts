import FrameControl from "@/FrameControl";
import TextAlign from "@/TextAlign";

export default class Button extends FrameControl {


    constructor(text?: string, onClick?: () => void) {
        super();
        this.init();
        //
        if (text) {
            this.setText(text)
        }
        if (onClick) {
            this.setOnClick(onClick)
        }
    }

    protected init() {
        super.init();
        this.getBackgroundImageFrame().visible = false;
        this.getImageFrame().visible = false;
        this.getTextFrame().setTextAlignment(TextAlign.center);
        this.getTextFrame().visible = false;
        this.getButtonFrame(true, true);
    }

    setBackgroundImage(imagePath: string) {
        this.getBackgroundImageFrame().setTexture(imagePath);
        this.getBackgroundImageFrame().visible = true;
    }

    setImage(imagePath: string) {
        this.getImageFrame().setTexture(imagePath);
        this.getImageFrame().visible = true;
    }

    setText(text: string) {
        this.getTextFrame().setText(text);
        this.getTextFrame().visible = true;
    }


    setOnClick(callback: () => void) {
        this.getButtonFrame().setOnClick(() => {
            callback();
        }, false);
    }


    setDisable(disable: boolean) {
        this.getDisableFrame().visible = disable;
    }

}