import {Frame} from "@/frame";
import ImageColor from "@/ImageColor";
import FramePoint from "@/FramePoint";
import BaseUtil from "@/BaseUtil";

export default class FrameLoadingUtil {


    static showLoadingScreen(dur: number, bg: string = "UI\\Glues\\MainMenu\\MainMenu3d_Beta\\Arthas_Concept03.blp") {

        let backDrop = Frame.createBackDrop();
        backDrop.setSize(0.8, 0.6)
        backDrop.setAllPoints(DzGetGameUI());
        backDrop.setTexture(bg);

        let imageColor: ImageColor = new ImageColor();
        imageColor.setColor(2, 2, 2);
        imageColor.setSize(0.01, 0.016);
        imageColor.setAbsPoint(FramePoint.left, 0, 0.04)

        let text = Frame.createTEXT();
        text.setSize(-1, 0.02);
        text.setPoint(FramePoint.topRight, imageColor.rootFrame.handle, FramePoint.bottomRight, -0.01, -0.005)

        let ig = 0.1;
        let maxCount = Math.floor(dur / ig);
        BaseUtil.onTimer(ig, (count) => {
            if (count >= maxCount) {
                text.destroy();
                imageColor.destroy();
                backDrop.destroy();
                return false;
            }
            let p = count / maxCount;
            text.setText(math.floor(p * 100) + "%")
            imageColor.setColor(100 * (1 - p), 100 + (155 * p), 0, 100 + (155 * p));
            imageColor.setSize(0.8 * p, 0.016);
            return true;
        });


    }


}