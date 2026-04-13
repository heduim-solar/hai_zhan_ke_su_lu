declare interface SceneRect {
    /**  区域所在场景地图的索引 */
    index: number
    /**  区域名字 */
    name: string
    /**  区域所在地图的中心坐标x*/
    x: number
    /**  区域所在地图的中心坐标y*/
    y: number
    /**  区域宽度 */
    width: number
    /**  区域高度 */
    height: number


}

declare interface SceneData {
    /** 场景预置区域 坐标已根据加载到的中心点 转换 到实际地图的坐标*/
    rects?: { [name: string]: SceneRect }
    /** 场景预置单位 */
    units?: unit[]
    /** 场景宽度 */
    width: number
    /** 场景高度 */
    height: number
    minX: number
    maxX: number
    minY: number
    maxY: number
}