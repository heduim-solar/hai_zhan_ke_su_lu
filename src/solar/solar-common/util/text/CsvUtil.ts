import Cache from "@/Cache";

declare type Ftcsv = {

    parse: (this: void, fileName: string, delimiter: string) => LuaMultiReturn<[any[], string[]]>

}
let _require = require;
let ftcsv: Ftcsv = _require("ftcsv")
export default class CsvUtil {
    private static cache = new Cache();


    /**
     * 解析一个csv文件 返回csv第二行开始的数据  第一行当做数据的key
     * @param csvPath
     */
    static parse(csvPath: string): { [key: string]: any }[] {
        return CsvUtil.cache.get(csvPath, () => {
            let [file] = io.open(csvPath, "r")
            if (!file) {
                return null;
            }
            let [data, headers] = ftcsv.parse(csvPath, ",");
            return data;
        });
    }
}