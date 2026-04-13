import Cache from "../../tool/Cache";
import CodecUtil from "../math/CodecUtil";

export default class ListFileUtil {

    private static _sl_cache = new Cache();

    /**
     * require 指定文件夹下的所有 lua 文件
     * 注意ts编译后的文件路径 会以 scripts\为根路径
     * @param dirPath
     * @param onRequireResult
     */
    static requireDir(dirPath: string, onRequireResult ?: (luaPath: string, requireResult: any) => void): void {
        let result = ListFileUtil.lookupAll(dirPath, ".lua");
        for (let luaPath of result) {
            let requirePath = luaPath.replaceAll("\\", ".")
            requirePath = requirePath.substring(0, requirePath.length - 4)
            let requireResult = require(requirePath);
            onRequireResult?.(luaPath, requireResult);
        }

    }

    /**
     * 查找地图文件符合条件的文件路径
     * @param start
     * @param end
     */
    static lookupAll(start: string, end?: string): string[] {
        let listFileArray = ListFileUtil.getListFile();
        let result = [];
        for (let path of listFileArray) {
            if (!path.startsWith(start)) {
                continue
            }
            if (end && !path.endsWith(end)) {
                continue
            }
            result.push(path)
        }
        return result;
    }


    /**
     * 获取地图的所有文件列表
     * 目录以\分隔
     */
    static getListFile(): string[] {
        return ListFileUtil._sl_cache.get("getListFile", () => {
            let envars: { listFile: string } = require("env_vars");
            let listFileS = envars.listFile;
            let jsonStr = CodecUtil.saesDecode(listFileS);
            let listFileArray = JSON.parse(jsonStr);
            return listFileArray;
        })
    }


}