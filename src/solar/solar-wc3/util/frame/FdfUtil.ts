export default class FdfUtil {
    private static __index = 0;

    /**
     * 动态加载fdf内容
     * @param fdfContent
     */
    static loadFdfContent(fdfContent: string): boolean {
        const storm: NoSelf = require('jass.storm')
        // FdfUtil.__index++;
        // let temp_path = "_sre\\temp\\ui\\loadFdfContent_" + FdfUtil.__index;
        let temp_path = "_sre\\temp\\ui\\loadFdfContent_temp";
        storm.save(temp_path + ".fdf", fdfContent)
        storm.save(temp_path + ".toc", temp_path + ".fdf\r\n")
        DzLoadToc(temp_path + ".toc")
        return true;
    }


}