/** @noSelfInFile */
export default class CodecUtil {


    /**
     * @param content 需要加密的内容
     * @param password 密码 (当前实现为字典，如没有此字典的对应的字符，则起不到密码效果)
     */
    static saesEncode(content: string, password?: string): string {
        require("solar_aes")
        let fun: (content: string, password?: string) => string = _G.saesEncode;
        return CodecUtil.sBase64Encode(fun(content, password))
    }

    /**
     * @param ciphertext 密文
     * @param password 密码 (当前实现为字典，如没有此字典的对应的字符，则起不到密码效果)
     */
    static saesDecode(ciphertext: string, password?: string): string {
        require("solar_aes")
        let fun: (ciphertext: string, password?: string) => string = _G.saesDecode;
        return fun(CodecUtil.sBase64Decode(ciphertext), password)
    }

    /**
     * @param content 需要编码的内容
     */
    static sBase64Encode(content: string): string {
        let base64: NoSelf = require("base64")
        let fun: (content: string) => string = base64.encode;
        return fun(content)
    }

    /**
     * @param ciphertext 需要解码的内容
     */
    static sBase64Decode(ciphertext: string): string {
        let base64: NoSelf = require("base64")
        let fun: (ciphertext: string) => string = base64.decode;
        return fun(ciphertext)
    }

    /**
     * @param content 需要散列的内容
     */
    static md5hex(content: string): string {
        let md5: NoSelf = require("md5")
        return md5.sumhexa(content)
    }


}