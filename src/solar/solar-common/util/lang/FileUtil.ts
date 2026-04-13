/**
 * @name  文件工具
 * @brief 处理本地文件读写
 */

export default class FileUtil {

    /**从文件中读取数据*/
    public static getDataFromFile(filePath: string): any {
        let [file] = io.open(filePath, "r+");
        if (!file) return null;
        let jsonDataStr: string = file.read("*a" as any) as string;
        let data: any = JSON.parse(jsonDataStr);
        file.close();
        return data;
    }

    /**写入数据到文件中(会覆盖掉同名文件中的数据)*/
    public static writeToFile(data: any, filePath: string): void {
        let jsonDataStr: string = JSON.stringify(data);
        let [file] = io.open(filePath, "w+");
        file.write(jsonDataStr);
        file.close();
    }

    /**获取文件扩展名*/
    public static getFileExtension(filePath: string): string {
        let fileExtension: string = '';
        //let index: number = filePath.lastIndexOf('.');   
        let index: number = -1;
        for (let i: number = filePath.length - 1; i >= 0; i--) {
            if ('.' == filePath[i]) {
                index = i;
                break;
            }
        }
        if (-1 != index) {
            fileExtension = filePath.substring(index);
        }
        return fileExtension;
    }

    /**获取文件名*/
    public static getFilename(filePath: string, containExtension: boolean = true): string {
        let filename: string = ''; 
        let index: number = -1;
        for (let i: number = filePath.length - 1; i >= 0; i--) {
            if ('\\' == filePath[i]) {
                index = i;
                break;
            }
        }
        if (-1 != index) {
            filename = filePath.substring(index + 1);
        }
        if (containExtension) {
            return filename;
        }
        index = -1;
        for (let i: number = filename.length - 1; i >= 0; i--) {
            if ('.' == filename[i]) {
                index = i;
                break;
            }
        }
        if (-1 != index) {
            filename = filename.substring(0, index);
        }
        return filename;
    }
}