/**
 * @brief 尺寸
 */

export default class Size {

    public width: number;
    public height: number;

    constructor(w: number = 0.0, h: number = 0.0) {
        this.width = w;
        this.height = h;
    }

    equals(another: Size): boolean {
        return math.abs(this.width - another.width) < 0.000001 && math.abs(this.height - another.height) < 0.000001;
    }

    public static readonly ZERO: Size = new Size(0, 0);
}