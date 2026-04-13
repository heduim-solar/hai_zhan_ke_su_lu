export default class VmUtil {


    /**
     * 地图文件里是否拥有某资源（某文件）
     * @param resourcePath
     */
    static hasResource(resourcePath: string): boolean {
        let [file] = io.open(resourcePath, "r")
        if (file) {
            return true;
        }
        return false;
    }

    /**
     * 从地图文件里读取字符串内容
     * @param strResourcePath
     */
    static getResourceAsString(strResourcePath: string): string {
        let [file] = io.open(strResourcePath, "rb");
        if (!file) {
            return
        }
        let str = file.read("*a" as any) as string;
        file.close();
        return str;
    }


    /**
     * 从地图文件里读取Json内容
     * @param jsonResourcePath
     */
    static getResourceAsJson(jsonResourcePath: string): any {
        return JSON.parse(VmUtil.getResourceAsString(jsonResourcePath));
    }


    /**
     * 写文件
     * @param filename
     * @param content
     */
    static writeFile(filename: string, content: string) {
        let [file] = io.open(filename, "wb");
        file.write(content)
        file.close()
    }

}