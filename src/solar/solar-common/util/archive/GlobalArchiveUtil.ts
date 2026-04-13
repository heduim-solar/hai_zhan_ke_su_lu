// /** @noSelf **/
// import CodecUtil from "../math/CodecUtil";
//
// /**
//  将存档key 与存档值 作为Json字符串 统一存储到平台服务器上
//  因此请尽量减少key的长度 以多存内容
//
//  需要手动在作者之家后台 全局存档 创建可读可写的 _SLGA_0 -> _SLGA_15 key值
//  @deprecated 正在测试中...
//  */
// export default class GlobalArchiveUtil {
//     //加密 请在地图发布前就确定是否需要加密以及加密的方式。发布后不能更改此选项 否则会造成旧存档被清空
//     static encrypt: boolean = true;
//     static ArchiveKeyCountMax: number = 15;
//     static salt: string = "s_l_g_a_z_b_s_q_j";
//     static baseArchiveKeyPrefix: string = "_SLGA_";
//     //
//     static data: { [key: string]: any } = {}
//
//
//     /**
//      *
//      * @param key
//      */
//     static get(key: string) {
//         GlobalArchiveUtil._init0();
//         return GlobalArchiveUtil.data[key];
//     }
//
//     static set(key: string, value: any) {
//         GlobalArchiveUtil._init0();
//         GlobalArchiveUtil.data[key] = value;
//         GlobalArchiveUtil.save()
//     }
//
//     /**
//      *获取所有存档
//      */
//     static getAllArchive(): any {
//         GlobalArchiveUtil._init0();
//         return GlobalArchiveUtil.data;
//     }
//
//     /**
//      * 打印所有存档 调试时用
//      * @param whichPlayer
//      */
//     static printAllArchive(): void {
//         GlobalArchiveUtil._init0();
//         let data = GlobalArchiveUtil.data;
//         if (!data) {
//             return;
//         }
//         print("========打印全局存档 开始========")
//         for (let dataKey in data) {
//             print(dataKey + "=[" + data[dataKey] + "]")
//         }
//         print("========打印全局存档 结束========")
//     }
//
//     /**
//      * base
//      * 清空所有全局存档
//      */
//     static clearAllArchive(): void {
//         for (let i = 0; i < GlobalArchiveUtil.ArchiveKeyCountMax; i++) {
//             let key: string = GlobalArchiveUtil.baseArchiveKeyPrefix + i;
//             DzAPI_Map_Global_StoreString(key, "");
//         }
//         print("已清理全部全局存档!")
//     }
//
//     /**
//      * 保存所有全局存档数据
//      */
//     static save(): void {
//         let data = GlobalArchiveUtil.data;
//         let dataJsonStr: string = JSON.stringify(data);
//         if (GlobalArchiveUtil.encrypt) {
//             dataJsonStr = CodecUtil.saesEncode(dataJsonStr, gameName + GlobalArchiveUtil.salt)
//         }
//         let dataJsonStrLength = dataJsonStr.length;
//         let keyLength = math.floor(dataJsonStrLength / 64) + 1;
//         log.debug("全局存档栏位大小为:" + keyLength)
//         if (keyLength > GlobalArchiveUtil.ArchiveKeyCountMax) {
//             log.errorWithTraceBack("全局栏位大小超过" + GlobalArchiveUtil.ArchiveKeyCountMax + "！" + keyLength)
//             return;
//         }
//         for (let i = 0; i < keyLength; i++) {
//             let endIndex = (i + 1) * 64;
//             if (endIndex > dataJsonStrLength) {
//                 endIndex = dataJsonStrLength;
//             }
//             let oneData = dataJsonStr.substring(i * 64, endIndex)
//             let key: string = GlobalArchiveUtil.baseArchiveKeyPrefix + i;
//             DzAPI_Map_Global_StoreString(key, oneData);
//         }
//         //清空后一个存档栏位 以标记结束
//         let key: string = GlobalArchiveUtil.baseArchiveKeyPrefix + keyLength;
//         if (keyLength < GlobalArchiveUtil.ArchiveKeyCountMax) {
//             DzAPI_Map_Global_StoreString(key, "");
//         }
//
//     }
//
//
//     /**
//      * 初始化存档数据
//      * @private
//      */
//     private static isInit = false;
//
//     private static _init0(): boolean {
//         if (GlobalArchiveUtil.isInit) {
//             return true;
//         }
//         GlobalArchiveUtil.isInit = true;
//         let data: any = {};
//         let dataJsonStr: string = "";
//         for (let i = 0; i < GlobalArchiveUtil.ArchiveKeyCountMax; i++) {
//             let key: string = GlobalArchiveUtil.baseArchiveKeyPrefix + i;
//             let serverValue: string = DzAPI_Map_Global_GetStoreString(key);
//             if (serverValue && serverValue.length > 0) {
//                 dataJsonStr = dataJsonStr + serverValue;
//             } else {
//                 break;
//             }
//         }
//         //转json了
//         if (dataJsonStr.length < 2) {
//             return true;
//         }
//         try {
//             if (GlobalArchiveUtil.encrypt) {
//                 dataJsonStr = CodecUtil.saesDecode(dataJsonStr, gameName + GlobalArchiveUtil.salt)
//             }
//             data = JSON.parse(dataJsonStr);
//             log.debug("全局存档数据为:" + dataJsonStr)
//             //设置
//             GlobalArchiveUtil.data = data;
//             return true;
//         } catch (e) {
//             log.errorWithTraceBack("全局存档Json解析出错!")
//             DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, '全局存档Json解析出错！');
//             print("需要解析的Json字符串为[" + dataJsonStr + "]")
//         }
//         return true;
//     }
// }
