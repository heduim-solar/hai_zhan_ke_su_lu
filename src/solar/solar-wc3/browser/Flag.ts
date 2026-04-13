export default class Flag {

    //engine_config
    static ENGINE_DISABLE_GPU = 1 << 0;  // 关闭硬件加速  播放视频时不会黑屏闪烁
    static ENGINE_ENABLE_GPU_WEBGL = 1 << 1;  // 开启硬件加速  开启webgl 支持渲染模型 播放视频时，视频以外会黑屏闪烁 全屏播放即可
    static ENGINE_SINGLE_PROCESS = 1 << 2;  // 开启单进程模式    有时候多进程模式有bug的情况下 可以改换单进程模式  单进程会吃魔兽内存
    static ENGINE_ENABLE_COOKIES = 1 << 3;  // 开启cookie  开启后 会保存登陆账号 再次打开也会自动登陆


    //view_config
    static VIEW_NEW_WINDOW = 1 << 0;// 新窗口  会在魔兽上层覆盖新窗口，视频最好用新窗口 读图不卡
    static VIEW_DISABLE_TRANSPARENT = 1 << 1;// 关闭透明背景
}