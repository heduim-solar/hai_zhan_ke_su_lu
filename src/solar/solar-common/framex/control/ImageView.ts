import FrameControl from "@/FrameControl";

export default class ImageView extends FrameControl {


    constructor() {
        super();
        this.init();
    }

    protected init() {
        super.init();
        this.getBackgroundImageFrame().visible = false;
        this.getImageFrame().visible = false;
    }

    setBackgroundImage(imagePath: string) {
        this.getBackgroundImageFrame().setTexture(imagePath);
        this.getBackgroundImageFrame().visible = true;
    }

    setImage(imagePath: string) {
        this.getImageFrame().setTexture(imagePath);
        this.getImageFrame().visible = true;
    }


    setDisable(disable: boolean) {
        this.getDisableFrame().visible = disable;
    }

}