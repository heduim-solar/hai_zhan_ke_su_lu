local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 6,["20"] = 6,["21"] = 7,["22"] = 7,["23"] = 8,["24"] = 8,["25"] = 9,["26"] = 9,["27"] = 10,["28"] = 10,["29"] = 11,["30"] = 11,["31"] = 13,["32"] = 19,["33"] = 19,["34"] = 19,["36"] = 98,["37"] = 99,["38"] = 97,["39"] = 92,["41"] = 93,["42"] = 94,["43"] = 92,["44"] = 102,["45"] = 103,["47"] = 105,["48"] = 106,["49"] = 107,["51"] = 109,["52"] = 110,["53"] = 110,["54"] = 110,["55"] = 111,["56"] = 111,["57"] = 111,["58"] = 111,["61"] = 114,["62"] = 114,["63"] = 114,["64"] = 115,["65"] = 116,["67"] = 114,["68"] = 114,["69"] = 119,["70"] = 120,["71"] = 120,["72"] = 120,["73"] = 120,["74"] = 124,["75"] = 124,["77"] = 126,["78"] = 126,["79"] = 110,["80"] = 110,["82"] = 130,["83"] = 131,["86"] = 134,["89"] = 137,["90"] = 137,["91"] = 137,["92"] = 138,["93"] = 139,["95"] = 137,["96"] = 137,["97"] = 142,["98"] = 143,["99"] = 147,["100"] = 147,["102"] = 149,["103"] = 149,["104"] = 130,["105"] = 102,["106"] = 154,["107"] = 155,["108"] = 155,["109"] = 155,["110"] = 155,["111"] = 155,["112"] = 155,["113"] = 155,["114"] = 156,["115"] = 156,["116"] = 156,["117"] = 156,["118"] = 156,["119"] = 156,["120"] = 156,["121"] = 156,["122"] = 157,["123"] = 158,["124"] = 158,["125"] = 158,["126"] = 158,["127"] = 159,["128"] = 160,["129"] = 161,["130"] = 162,["131"] = 162,["132"] = 162,["133"] = 163,["134"] = 162,["135"] = 162,["136"] = 165,["138"] = 158,["139"] = 158,["140"] = 158,["141"] = 170,["142"] = 170,["143"] = 170,["144"] = 171,["145"] = 172,["146"] = 173,["147"] = 174,["148"] = 174,["149"] = 174,["150"] = 175,["151"] = 174,["152"] = 174,["153"] = 177,["155"] = 170,["156"] = 170,["157"] = 180,["158"] = 180,["159"] = 180,["160"] = 181,["161"] = 182,["162"] = 180,["163"] = 180,["164"] = 184,["165"] = 184,["166"] = 184,["167"] = 185,["168"] = 186,["169"] = 187,["171"] = 184,["172"] = 184,["173"] = 190,["174"] = 190,["175"] = 190,["176"] = 191,["177"] = 190,["178"] = 190,["179"] = 154,["180"] = 197,["181"] = 198,["182"] = 200,["183"] = 200,["184"] = 200,["185"] = 200,["186"] = 200,["187"] = 200,["188"] = 200,["189"] = 201,["190"] = 201,["191"] = 201,["192"] = 201,["193"] = 201,["194"] = 201,["195"] = 201,["196"] = 201,["197"] = 202,["198"] = 203,["199"] = 204,["200"] = 206,["201"] = 206,["202"] = 206,["203"] = 206,["204"] = 206,["205"] = 206,["206"] = 206,["207"] = 207,["208"] = 207,["209"] = 207,["210"] = 207,["211"] = 207,["212"] = 207,["213"] = 207,["214"] = 207,["215"] = 208,["216"] = 209,["217"] = 211,["218"] = 211,["219"] = 211,["220"] = 211,["221"] = 211,["222"] = 211,["223"] = 211,["224"] = 212,["225"] = 212,["226"] = 212,["227"] = 212,["228"] = 212,["229"] = 212,["230"] = 212,["231"] = 212,["232"] = 213,["233"] = 214,["234"] = 216,["235"] = 216,["236"] = 216,["237"] = 216,["238"] = 216,["239"] = 216,["240"] = 216,["241"] = 217,["242"] = 217,["243"] = 217,["244"] = 217,["245"] = 217,["246"] = 217,["247"] = 217,["248"] = 217,["249"] = 218,["250"] = 219,["251"] = 221,["252"] = 221,["253"] = 221,["254"] = 221,["255"] = 221,["256"] = 221,["257"] = 221,["258"] = 222,["259"] = 222,["260"] = 222,["261"] = 222,["262"] = 222,["263"] = 222,["264"] = 222,["265"] = 222,["266"] = 223,["267"] = 224,["268"] = 225,["269"] = 226,["270"] = 227,["271"] = 228,["272"] = 197,["273"] = 231,["274"] = 232,["275"] = 233,["276"] = 234,["278"] = 235,["279"] = 235,["280"] = 237,["281"] = 237,["282"] = 237,["283"] = 237,["284"] = 237,["285"] = 237,["286"] = 237,["287"] = 238,["288"] = 238,["289"] = 238,["290"] = 238,["291"] = 238,["292"] = 238,["293"] = 238,["294"] = 238,["295"] = 239,["296"] = 240,["297"] = 241,["298"] = 235,["301"] = 231,["302"] = 245,["303"] = 247,["304"] = 247,["305"] = 247,["306"] = 247,["307"] = 247,["308"] = 247,["309"] = 247,["310"] = 248,["311"] = 248,["312"] = 248,["313"] = 248,["314"] = 248,["315"] = 248,["316"] = 248,["317"] = 248,["318"] = 249,["319"] = 250,["320"] = 245,["321"] = 253,["322"] = 254,["323"] = 255,["324"] = 256,["325"] = 257,["327"] = 258,["328"] = 258,["329"] = 259,["330"] = 260,["331"] = 262,["332"] = 262,["333"] = 262,["334"] = 262,["335"] = 262,["336"] = 262,["337"] = 262,["338"] = 263,["339"] = 263,["340"] = 263,["341"] = 263,["342"] = 263,["343"] = 263,["344"] = 263,["345"] = 263,["346"] = 264,["347"] = 265,["348"] = 266,["349"] = 268,["350"] = 268,["351"] = 268,["352"] = 268,["353"] = 268,["354"] = 268,["355"] = 268,["356"] = 269,["357"] = 269,["358"] = 269,["359"] = 269,["360"] = 269,["361"] = 269,["362"] = 269,["363"] = 269,["364"] = 270,["365"] = 271,["366"] = 273,["367"] = 273,["368"] = 273,["369"] = 273,["370"] = 273,["371"] = 273,["372"] = 273,["373"] = 274,["374"] = 274,["375"] = 274,["376"] = 274,["377"] = 274,["378"] = 274,["379"] = 274,["380"] = 274,["381"] = 275,["382"] = 276,["383"] = 278,["384"] = 278,["385"] = 278,["386"] = 278,["387"] = 278,["388"] = 278,["389"] = 278,["390"] = 279,["391"] = 279,["392"] = 279,["393"] = 279,["394"] = 279,["395"] = 279,["396"] = 279,["397"] = 279,["398"] = 280,["399"] = 281,["400"] = 258,["403"] = 253,["404"] = 285,["405"] = 287,["406"] = 287,["407"] = 287,["408"] = 287,["409"] = 287,["410"] = 287,["411"] = 287,["412"] = 289,["413"] = 289,["414"] = 289,["415"] = 289,["416"] = 289,["417"] = 289,["418"] = 289,["419"] = 290,["420"] = 291,["421"] = 293,["422"] = 293,["423"] = 293,["424"] = 293,["425"] = 293,["426"] = 293,["427"] = 293,["428"] = 294,["429"] = 295,["430"] = 297,["431"] = 297,["432"] = 297,["433"] = 297,["434"] = 297,["435"] = 297,["436"] = 297,["437"] = 298,["438"] = 299,["439"] = 301,["440"] = 301,["441"] = 301,["442"] = 301,["443"] = 301,["444"] = 301,["445"] = 301,["446"] = 301,["447"] = 302,["448"] = 302,["449"] = 302,["450"] = 302,["451"] = 302,["452"] = 302,["453"] = 302,["454"] = 302,["455"] = 303,["456"] = 303,["457"] = 303,["458"] = 303,["459"] = 303,["460"] = 303,["461"] = 303,["462"] = 303,["463"] = 304,["464"] = 304,["465"] = 304,["466"] = 304,["467"] = 304,["468"] = 304,["469"] = 304,["470"] = 304,["471"] = 305,["472"] = 285,["473"] = 311,["474"] = 312,["475"] = 313,["476"] = 314,["477"] = 315,["478"] = 316,["479"] = 311,["480"] = 319,["481"] = 320,["483"] = 321,["484"] = 321,["485"] = 322,["486"] = 323,["487"] = 324,["488"] = 325,["489"] = 326,["490"] = 327,["491"] = 328,["492"] = 328,["493"] = 328,["494"] = 328,["495"] = 328,["496"] = 328,["497"] = 328,["498"] = 329,["499"] = 329,["500"] = 329,["501"] = 329,["502"] = 329,["503"] = 329,["504"] = 329,["505"] = 329,["506"] = 330,["507"] = 331,["508"] = 332,["509"] = 333,["510"] = 335,["511"] = 336,["512"] = 337,["513"] = 338,["514"] = 339,["515"] = 340,["516"] = 341,["517"] = 342,["518"] = 343,["519"] = 344,["520"] = 337,["521"] = 346,["522"] = 347,["523"] = 348,["526"] = 321,["530"] = 353,["531"] = 353,["532"] = 354,["533"] = 355,["534"] = 356,["535"] = 356,["536"] = 356,["537"] = 356,["538"] = 353,["541"] = 359,["542"] = 362,["544"] = 363,["545"] = 363,["546"] = 364,["547"] = 365,["548"] = 366,["549"] = 367,["550"] = 368,["551"] = 368,["552"] = 368,["553"] = 368,["554"] = 369,["555"] = 363,["558"] = 319,["559"] = 373,["560"] = 374,["561"] = 375,["562"] = 376,["563"] = 377,["564"] = 378,["565"] = 379,["566"] = 380,["567"] = 381,["568"] = 373,["569"] = 384,["570"] = 385,["572"] = 386,["573"] = 386,["574"] = 387,["575"] = 388,["576"] = 389,["577"] = 390,["578"] = 391,["579"] = 392,["580"] = 392,["581"] = 392,["582"] = 392,["583"] = 392,["584"] = 392,["585"] = 392,["586"] = 393,["587"] = 393,["588"] = 393,["589"] = 393,["590"] = 393,["591"] = 393,["592"] = 393,["593"] = 393,["594"] = 394,["595"] = 395,["596"] = 396,["597"] = 398,["598"] = 399,["599"] = 400,["600"] = 401,["601"] = 402,["602"] = 403,["603"] = 404,["604"] = 405,["605"] = 405,["606"] = 405,["607"] = 405,["608"] = 405,["610"] = 407,["611"] = 407,["612"] = 407,["613"] = 407,["614"] = 407,["615"] = 407,["617"] = 399,["618"] = 410,["619"] = 411,["620"] = 412,["621"] = 413,["622"] = 414,["623"] = 415,["624"] = 416,["625"] = 416,["626"] = 416,["627"] = 416,["628"] = 416,["630"] = 418,["631"] = 418,["632"] = 418,["633"] = 418,["634"] = 418,["635"] = 418,["637"] = 410,["638"] = 421,["639"] = 422,["640"] = 423,["641"] = 424,["642"] = 425,["643"] = 426,["644"] = 427,["645"] = 428,["646"] = 429,["647"] = 429,["648"] = 429,["650"] = 429,["652"] = 429,["653"] = 430,["655"] = 432,["656"] = 433,["657"] = 433,["658"] = 433,["659"] = 433,["661"] = 435,["662"] = 436,["663"] = 438,["664"] = 438,["665"] = 438,["666"] = 438,["667"] = 438,["668"] = 438,["669"] = 438,["670"] = 438,["671"] = 439,["672"] = 421,["673"] = 441,["674"] = 442,["675"] = 441,["677"] = 386,["680"] = 448,["681"] = 384,["682"] = 452,["683"] = 453,["684"] = 454,["685"] = 455,["686"] = 456,["689"] = 459,["691"] = 460,["692"] = 460,["693"] = 461,["694"] = 462,["695"] = 463,["696"] = 464,["697"] = 460,["700"] = 466,["702"] = 467,["703"] = 467,["704"] = 468,["705"] = 469,["706"] = 470,["707"] = 471,["708"] = 472,["709"] = 474,["710"] = 475,["711"] = 476,["713"] = 478,["715"] = 480,["716"] = 480,["717"] = 480,["719"] = 480,["721"] = 480,["722"] = 481,["723"] = 482,["724"] = 483,["725"] = 484,["727"] = 486,["728"] = 487,["729"] = 488,["731"] = 490,["732"] = 467,["735"] = 492,["736"] = 492,["737"] = 492,["738"] = 492,["739"] = 452,["740"] = 496,["741"] = 497,["743"] = 498,["744"] = 498,["745"] = 499,["746"] = 500,["747"] = 501,["748"] = 502,["749"] = 502,["750"] = 502,["751"] = 502,["752"] = 502,["753"] = 502,["754"] = 502,["755"] = 503,["756"] = 504,["757"] = 505,["758"] = 506,["759"] = 507,["760"] = 508,["761"] = 509,["763"] = 510,["765"] = 512,["768"] = 515,["769"] = 516,["770"] = 517,["773"] = 519,["776"] = 522,["777"] = 523,["778"] = 524,["780"] = 506,["781"] = 527,["782"] = 527,["783"] = 527,["784"] = 527,["785"] = 527,["786"] = 527,["787"] = 527,["788"] = 527,["789"] = 528,["791"] = 498,["794"] = 496,["795"] = 533,["796"] = 534,["798"] = 535,["799"] = 535,["800"] = 536,["801"] = 537,["802"] = 538,["803"] = 539,["804"] = 539,["805"] = 539,["806"] = 539,["807"] = 539,["808"] = 539,["809"] = 539,["810"] = 540,["811"] = 540,["812"] = 540,["813"] = 540,["814"] = 540,["815"] = 540,["816"] = 540,["817"] = 540,["818"] = 541,["819"] = 542,["820"] = 543,["821"] = 544,["822"] = 545,["823"] = 546,["824"] = 547,["827"] = 550,["828"] = 551,["829"] = 552,["830"] = 553,["831"] = 554,["834"] = 556,["837"] = 559,["838"] = 560,["840"] = 561,["842"] = 563,["845"] = 566,["847"] = 545,["849"] = 535,["852"] = 533,["853"] = 26,["854"] = 29,["855"] = 31,["856"] = 51,["857"] = 51,["858"] = 51,["859"] = 51,["860"] = 51,["861"] = 51,["862"] = 51,["863"] = 51,["864"] = 51,["865"] = 51,["866"] = 51,["867"] = 51,["868"] = 51,["869"] = 51,["870"] = 51,["871"] = 51,["872"] = 51,["873"] = 51,["874"] = 51,["875"] = 51,["876"] = 72,["877"] = 73,["878"] = 74,["879"] = 75,["880"] = 77,["881"] = 78,["882"] = 79,["883"] = 80,["884"] = 81,["885"] = 83,["886"] = 84,["887"] = 85,["888"] = 86,["889"] = 87,["890"] = 88,["891"] = 89});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____KeyCode = require("solar.solar-common.constant.KeyCode")
local KeyCode = ____KeyCode.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
DzLoadToc("UI\\ui_icon_toc.toc")
____exports.default = __TS__Class()
local _____56FE_6807_9762_677F = ____exports.default
_____56FE_6807_9762_677F.name = "图标面板"
function _____56FE_6807_9762_677F.prototype.____constructor(self)
    ____exports.default:UIcdbtn()
    ____exports.default:UIcddjm()
end
function _____56FE_6807_9762_677F.NewUIName(self)
    local ____exports_default_0, ____UI_IconName_1 = ____exports.default, "UI_IconName"
    ____exports_default_0[____UI_IconName_1] = ____exports_default_0[____UI_IconName_1] + 1
    return "UIico" .. I2S(____exports.default.UI_IconName)
end
function _____56FE_6807_9762_677F.refreshData(self)
    ____exports.default.data = {}
    --- 主控英雄单位的演员数据
    local hero = selection()
    if GetOwningPlayer(hero) ~= GetLocalPlayer() or not UnitUtil.isHero(hero) then
        hero = PlayerUtil:getHero(GetLocalPlayer())
    end
    if IsHandle(hero) then
        ActorBuffUtil:forUnitActorBuffs(
            hero,
            function(____, actor)
                if not __TS__ArrayIncludes(
                    ____exports.default.showActorClasss,
                    actor:get("class")
                ) then
                    return
                end
                local directory = __TS__ArrayFind(
                    ____exports.default.data,
                    function(____, it)
                        if it.name == actor:get("class") then
                            return it
                        end
                    end
                )
                if directory == nil then
                    directory = {
                        name = actor:get("class"),
                        items = {}
                    }
                    local ____exports_default_data_2 = ____exports.default.data
                    ____exports_default_data_2[#____exports_default_data_2 + 1] = directory
                end
                local ____directory_items_3 = directory.items
                ____directory_items_3[#____directory_items_3 + 1] = actor
            end
        )
    end
    ActorTypeUtil:forAllActorTypes(function(____, actorType)
        if not __TS__ArrayIncludes(____exports.default.uiShowTypes, actorType.uiShowType) then
            return
        end
        if actorType.hide == true and actorType.uiEnable ~= true then
            return
        end
        local directory = __TS__ArrayFind(
            ____exports.default.data,
            function(____, it)
                if it.name == actorType.class then
                    return it
                end
            end
        )
        if directory == nil then
            directory = {name = actorType.class, items = {}}
            local ____exports_default_data_4 = ____exports.default.data
            ____exports_default_data_4[#____exports_default_data_4 + 1] = directory
        end
        local ____directory_items_5 = directory.items
        ____directory_items_5[#____directory_items_5 + 1] = actorType
    end)
end
function _____56FE_6807_9762_677F.UIcdbtn(self)
    ____exports.default.UI_CDdz_XSAn_bt = DzCreateFrameByTagName(
        "GLUETEXTBUTTON",
        ____exports.default:NewUIName(),
        DzGetGameUI(),
        ____exports.default.UICdYsbl.UIcdanys1,
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_XSAn_bt,
        FramePoint.topLeft,
        DzGetGameUI(),
        FramePoint.topLeft,
        0.046,
        -0.026
    )
    DzFrameSetSize(____exports.default.UI_CDdz_XSAn_bt, 0.04, 0.04)
    DzFrameSetScriptByCode(
        ____exports.default.UI_CDdz_XSAn_bt,
        1,
        function()
            ____exports.default.UI_CDdz_DKZxs_bt = not ____exports.default.UI_CDdz_DKZxs_bt
            DzFrameShow(____exports.default.UI_CDdz_DKZ_ba[1], ____exports.default.UI_CDdz_DKZxs_bt)
            if ____exports.default.UI_CDdz_DKZxs_bt then
                BaseUtil.runLater(
                    0.01,
                    function()
                        ____exports.default:RefreshOne()
                    end
                )
                se:emit("打开UI", ____exports.default.name)
            end
        end,
        false
    )
    InputUtil:onKeyPressed(
        KeyCode.VK_F4,
        function()
            ____exports.default.UI_CDdz_DKZxs_bt = not ____exports.default.UI_CDdz_DKZxs_bt
            DzFrameShow(____exports.default.UI_CDdz_DKZ_ba[1], ____exports.default.UI_CDdz_DKZxs_bt)
            if ____exports.default.UI_CDdz_DKZxs_bt then
                BaseUtil.runLater(
                    0.01,
                    function()
                        ____exports.default:RefreshOne()
                    end
                )
                se:emit("打开UI", ____exports.default.name)
            end
        end
    )
    InputUtil:onKeyPressed(
        KeyCode.VK_ESCAPE,
        function()
            ____exports.default.UI_CDdz_DKZxs_bt = false
            DzFrameShow(____exports.default.UI_CDdz_DKZ_ba[1], ____exports.default.UI_CDdz_DKZxs_bt)
        end
    )
    se:on(
        "打开UI",
        function(id)
            if id ~= ____exports.default.name and ____exports.default.UI_CDdz_DKZxs_bt then
                ____exports.default.UI_CDdz_DKZxs_bt = false
                DzFrameShow(____exports.default.UI_CDdz_DKZ_ba[1], ____exports.default.UI_CDdz_DKZxs_bt)
            end
        end
    )
    se:on(
        "刷新图标面板",
        function()
            ____exports.default["刷新图标数据"](____exports.default)
        end
    )
end
function _____56FE_6807_9762_677F.UIcddjm(self)
    local obj = ____exports.default.UICdYsbl
    ____exports.default.UI_CDdz_DKZ_ba[1] = DzCreateFrameByTagName(
        "BACKDROP",
        ____exports.default:NewUIName(),
        DzGetGameUI(),
        "template",
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_DKZ_ba[1],
        FramePoint.topLeft,
        DzGetGameUI(),
        FramePoint.topLeft,
        0.09,
        -0.06
    )
    DzFrameSetTexture(____exports.default.UI_CDdz_DKZ_ba[1], obj.UITexture1, 0)
    DzFrameSetSize(____exports.default.UI_CDdz_DKZ_ba[1], 0.485, 0.37)
    DzFrameShow(____exports.default.UI_CDdz_DKZ_ba[1], ____exports.default.UI_CDdz_DKZxs_bt)
    ____exports.default.UI_CDdz_DKZ_ba[2] = DzCreateFrameByTagName(
        "BACKDROP",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_DKZ_ba[1],
        "template",
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_DKZ_ba[2],
        3,
        ____exports.default.UI_CDdz_DKZ_ba[1],
        3,
        0.005,
        0
    )
    DzFrameSetTexture(____exports.default.UI_CDdz_DKZ_ba[2], obj.UITexture1, 0)
    DzFrameSetSize(____exports.default.UI_CDdz_DKZ_ba[2], 0.06, 0.36)
    ____exports.default.UI_CDdz_DKZ_ba[5] = DzCreateFrameByTagName(
        "BACKDROP",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_DKZ_ba[1],
        "template",
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_DKZ_ba[5],
        FramePoint.topRight,
        ____exports.default.UI_CDdz_DKZ_ba[1],
        FramePoint.topRight,
        -0.005,
        -0.005
    )
    DzFrameSetTexture(____exports.default.UI_CDdz_DKZ_ba[5], obj.UITexture2, 0)
    DzFrameSetSize(____exports.default.UI_CDdz_DKZ_ba[5], 0.41, 0.36)
    ____exports.default.UI_CDdz_DKZ_ba[3] = DzCreateFrameByTagName(
        "BACKDROP",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_DKZ_ba[5],
        "template",
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_DKZ_ba[3],
        2,
        ____exports.default.UI_CDdz_DKZ_ba[5],
        2,
        0,
        0
    )
    DzFrameSetTexture(____exports.default.UI_CDdz_DKZ_ba[3], obj.UITexture3, 0)
    DzFrameSetSize(____exports.default.UI_CDdz_DKZ_ba[3], 0.41, 0.33)
    ____exports.default.UI_CDdz_DKZ_ba[4] = DzCreateFrameByTagName(
        "BACKDROP",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_DKZ_ba[3],
        "template",
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_DKZ_ba[4],
        0,
        ____exports.default.UI_CDdz_DKZ_ba[3],
        6,
        0,
        0
    )
    DzFrameSetTexture(____exports.default.UI_CDdz_DKZ_ba[4], obj.UITexture4, 0)
    DzFrameSetSize(____exports.default.UI_CDdz_DKZ_ba[4], 0.41, 0.03)
    ____exports.default:ZC_cddhlan()
    ____exports.default:ZC_cdyxcdl()
    ____exports.default:ZC_cdyxhyl()
    ____exports.default:ZC_cdcdtsk()
end
function _____56FE_6807_9762_677F.ZC_cddhlan(self)
    local obj = ____exports.default.UICdYsbl
    local kd = 0.06
    local gd = 0.3 / obj.UIdhls
    do
        local index = 0
        while index < obj.UIdhls do
            ____exports.default.UI_CDdz_dhn_ba[index + 1] = DzCreateFrameByTagName(
                "BACKDROP",
                ____exports.default:NewUIName(),
                ____exports.default.UI_CDdz_DKZ_ba[2],
                "template",
                0
            )
            DzFrameSetPoint(
                ____exports.default.UI_CDdz_dhn_ba[index + 1],
                1,
                ____exports.default.UI_CDdz_DKZ_ba[2],
                1,
                0,
                index * -gd
            )
            DzFrameSetTexture(____exports.default.UI_CDdz_dhn_ba[index + 1], obj.UIdhl_tb0, 0)
            DzFrameSetSize(____exports.default.UI_CDdz_dhn_ba[index + 1], kd, gd - 0.002)
            DzFrameShow(____exports.default.UI_CDdz_dhn_ba[index + 1], false)
            index = index + 1
        end
    end
end
function _____56FE_6807_9762_677F.ZC_cdyxhyl(self)
    ____exports.default.UI_CDdz_yxhy_an = DzCreateFrameByTagName(
        "TEXT",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_DKZ_ba[4],
        "template",
        0
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_yxhy_an,
        4,
        ____exports.default.UI_CDdz_DKZ_ba[4],
        4,
        0,
        0
    )
    DzFrameSetFont(____exports.default.UI_CDdz_yxhy_an, ____exports.default.UICdYsbl.fontStr, 0.014, 0)
    DzFrameSetText(____exports.default.UI_CDdz_yxhy_an, "1/1")
end
function _____56FE_6807_9762_677F.ZC_cdyxcdl(self)
    local obj = ____exports.default.UICdYsbl
    local ui = ____exports.default.UI_CDdz_DKZ_ba[3]
    local width = 0.04
    local heigh = 0.04
    do
        local index = 0
        while index < ____exports.default.dzCd_pageMax do
            local x = 0.01 + index % obj.UIcdlls * width * 1.1
            local y = -0.01 + R2I(index / obj.UIcdlls) * -heigh * 1.3
            ____exports.default.UI_CDdz_cdl_ba_1[index + 1] = DzCreateFrameByTagName(
                "BACKDROP",
                ____exports.default:NewUIName(),
                ui,
                "template",
                0
            )
            DzFrameSetPoint(
                ____exports.default.UI_CDdz_cdl_ba_1[index + 1],
                0,
                ui,
                0,
                x,
                y
            )
            DzFrameSetSize(____exports.default.UI_CDdz_cdl_ba_1[index + 1], width, heigh)
            DzFrameSetTexture(____exports.default.UI_CDdz_cdl_ba_1[index + 1], obj.UI_cdl_bk, 0)
            DzFrameShow(____exports.default.UI_CDdz_cdl_ba_1[index + 1], false)
            ____exports.default.UI_CDdz_cdl_ba_2[index + 1] = DzCreateFrameByTagName(
                "BACKDROP",
                ____exports.default:NewUIName(),
                ____exports.default.UI_CDdz_cdl_ba_1[index + 1],
                "template",
                0
            )
            DzFrameSetPoint(
                ____exports.default.UI_CDdz_cdl_ba_2[index + 1],
                4,
                ____exports.default.UI_CDdz_cdl_ba_1[index + 1],
                4,
                0,
                0
            )
            DzFrameSetTexture(____exports.default.UI_CDdz_cdl_ba_2[index + 1], obj.UI_cdl_bl, 0)
            DzFrameSetSize(____exports.default.UI_CDdz_cdl_ba_2[index + 1], width, heigh)
            ____exports.default.UI_CDdz_cdl_ba_3[index + 1] = DzCreateFrameByTagName(
                "BACKDROP",
                ____exports.default:NewUIName(),
                ____exports.default.UI_CDdz_cdl_ba_1[index + 1],
                "template",
                0
            )
            DzFrameSetPoint(
                ____exports.default.UI_CDdz_cdl_ba_3[index + 1],
                4,
                ____exports.default.UI_CDdz_cdl_ba_1[index + 1],
                4,
                0,
                0
            )
            DzFrameSetTexture(____exports.default.UI_CDdz_cdl_ba_3[index + 1], obj.UI_yyk_tb, 0)
            DzFrameSetSize(____exports.default.UI_CDdz_cdl_ba_3[index + 1], width, heigh)
            ____exports.default.UI_CDdz_cdl_text[index + 1] = DzCreateFrameByTagName(
                "TEXT",
                ____exports.default:NewUIName(),
                ____exports.default.UI_CDdz_cdl_ba_2[index + 1],
                "template",
                0
            )
            DzFrameSetPoint(
                ____exports.default.UI_CDdz_cdl_text[index + 1],
                1,
                ____exports.default.UI_CDdz_cdl_ba_2[index + 1],
                7,
                0,
                -0.001
            )
            DzFrameSetFont(____exports.default.UI_CDdz_cdl_text[index + 1], ____exports.default.UICdYsbl.fontStr, 0.008, 0)
            DzFrameSetText(____exports.default.UI_CDdz_cdl_text[index + 1], "")
            index = index + 1
        end
    end
end
function _____56FE_6807_9762_677F.ZC_cdcdtsk(self)
    ____exports.default.UI_CDdz_tip[1] = DzCreateFrameByTagName(
        "BACKDROP",
        ____exports.default:NewUIName(),
        DzGetGameUI(),
        ____exports.default.UICdYsbl.UI_cdts_fdf,
        0
    )
    ____exports.default.UI_CDdz_tip[2] = DzCreateFrameByTagName(
        "TEXT",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_tip[1],
        "template",
        0
    )
    DzFrameSetSize(____exports.default.UI_CDdz_tip[2], 0.16, 0)
    DzFrameSetFont(____exports.default.UI_CDdz_tip[2], ____exports.default.UICdYsbl.fontStr, 0.016, 0)
    ____exports.default.UI_CDdz_tip[3] = DzCreateFrameByTagName(
        "TEXT",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_tip[1],
        "template",
        0
    )
    DzFrameSetSize(____exports.default.UI_CDdz_tip[3], 0.16, 0)
    DzFrameSetFont(____exports.default.UI_CDdz_tip[3], ____exports.default.UICdYsbl.fontStr, 0.014, 0)
    ____exports.default.UI_CDdz_tip[4] = DzCreateFrameByTagName(
        "TEXT",
        ____exports.default:NewUIName(),
        ____exports.default.UI_CDdz_tip[1],
        "template",
        0
    )
    DzFrameSetSize(____exports.default.UI_CDdz_tip[4], 0.16, 0)
    DzFrameSetFont(____exports.default.UI_CDdz_tip[4], ____exports.default.UICdYsbl.fontStr, 0.012, 0)
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_tip[1],
        0,
        ____exports.default.UI_CDdz_tip[2],
        0,
        -0.005,
        0.006
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_tip[1],
        8,
        ____exports.default.UI_CDdz_tip[4],
        8,
        0.005,
        -0.005
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_tip[3],
        0,
        ____exports.default.UI_CDdz_tip[2],
        6,
        0,
        -0.002
    )
    DzFrameSetPoint(
        ____exports.default.UI_CDdz_tip[4],
        0,
        ____exports.default.UI_CDdz_tip[3],
        6,
        0,
        -0.002
    )
    DzFrameShow(____exports.default.UI_CDdz_tip[1], false)
end
function _____56FE_6807_9762_677F.RefreshOne(self)
    ____exports.default:refreshData()
    ____exports.default:Init_dhcj()
    ____exports.default["刷新图标数据"](____exports.default)
    ____exports.default:Refresh_LeftNavPan()
    ____exports.default:Refresh_RightDJPan()
end
function _____56FE_6807_9762_677F.Init_dhcj(self)
    local obj = ____exports.default.UICdYsbl
    do
        local i = 0
        while i < obj.UIdhls do
            local key = "fenLei:" .. tostring(i)
            local frame = ____exports.default.dzUI[key]
            if frame == nil or frame == 0 then
                local kd = 0.06
                local gd = 0.36 / obj.UIdhls
                local fontSize = 0.011
                frame = DzCreateFrameByTagName(
                    "TEXTBUTTON",
                    ____exports.default:NewUIName(),
                    ____exports.default.UI_CDdz_dhn_ba[i + 1],
                    obj.UIcdanys2,
                    0
                )
                DzFrameSetPoint(
                    frame,
                    4,
                    ____exports.default.UI_CDdz_dhn_ba[i + 1],
                    4,
                    0,
                    0
                )
                DzFrameSetSize(frame, kd, gd)
                DzFrameSetFont(frame, ____exports.default.UICdYsbl.fontStr, fontSize, 0)
                Frame:fromHandle(frame).solarData.Zui = ____exports.default.UI_CDdz_dhn_ba[i + 1]
                ____exports.default.dzUI[key] = frame
                local fenLeiBTN = Frame:fromHandle(frame)
                local index = i
                fenLeiBTN:setOnClick(function()
                    local uiid = DzGetTriggerUIEventFrame()
                    DzFrameSetTexture(____exports.default.uiBoxLastCurr, obj.UIdhl_tb0, 0)
                    ____exports.default.uiBoxLastCurr = Frame:fromHandle(uiid).solarData.Zui
                    DzFrameSetTexture(____exports.default.uiBoxLastCurr, obj.UIdhl_tb1, 0)
                    ____exports.default.dzCd_DhdqIdx = index
                    ____exports.default.dzCd_DjdqIdx = 0
                    ____exports.default:Refresh2_1()
                end)
                if i == 0 then
                    ____exports.default.uiBoxLastCurr = ____exports.default.UI_CDdz_dhn_ba[1]
                    DzFrameSetTexture(____exports.default.UI_CDdz_dhn_ba[1], obj.UIdhl_tb1, 0)
                end
            end
            i = i + 1
        end
    end
    do
        local in1 = 0
        while in1 < obj.UIdhls do
            local key = "fenLei:" .. tostring(in1)
            local frame = ____exports.default.dzUI[key]
            DzFrameShow(
                Frame:fromHandle(frame).solarData.Zui,
                false
            )
            in1 = in1 + 1
        end
    end
    local startDjdqIdx = R2I(____exports.default.dzCd_Dhys) * obj.UIdhls
    local index2 = startDjdqIdx
    do
        local index1 = 0
        while index1 < obj.UIdhls and index1 < #____exports.default.data - startDjdqIdx do
            local fenLei = ____exports.default.data[index2 + 1]
            local key = "fenLei:" .. tostring(index1)
            local frame = ____exports.default.dzUI[key]
            DzFrameSetText(frame, fenLei.name)
            DzFrameShow(
                Frame:fromHandle(frame).solarData.Zui,
                true
            )
            index2 = index2 + 1
            index1 = index1 + 1
        end
    end
end
function _____56FE_6807_9762_677F.Refresh_DHXZ(self, fenLeiIndex)
    local obj = ____exports.default.UICdYsbl
    local key = "fenLei:" .. tostring(fenLeiIndex)
    local uiid = ____exports.default.dzUI[key]
    DzFrameSetTexture(____exports.default.uiBoxLastCurr, obj.UIdhl_tb0, 0)
    ____exports.default.uiBoxLastCurr = Frame:fromHandle(uiid).solarData.Zui
    DzFrameSetTexture(____exports.default.uiBoxLastCurr, obj.UIdhl_tb1, 0)
    ____exports.default.dzCd_DhdqIdx = fenLeiIndex
    ____exports.default:Refresh2_1()
end
_____56FE_6807_9762_677F["刷新图标数据"] = function(self)
    local obj = ____exports.default.UICdYsbl
    do
        local i = 0
        while i < ____exports.default.dzCd_pageMax do
            local key = "daoju:" .. tostring(i)
            local frame = ____exports.default.dzUI[key]
            if frame == nil or frame == 0 then
                local width = 0.04
                local heigh = 0.04
                frame = DzCreateFrameByTagName(
                    "TEXTBUTTON",
                    ____exports.default:NewUIName(),
                    ____exports.default.UI_CDdz_cdl_ba_1[i + 1],
                    obj.UI_cdan_fdf,
                    0
                )
                DzFrameSetPoint(
                    frame,
                    4,
                    ____exports.default.UI_CDdz_cdl_ba_1[i + 1],
                    4,
                    0,
                    0
                )
                DzFrameSetSize(frame, width, heigh)
                local index = i
                ____exports.default.dzUI[key] = frame
                local fenLeiBTN = Frame:fromHandle(frame)
                fenLeiBTN:setOnClick(function()
                    local xlz = index + ____exports.default.dzCd_DjdqIdx * ____exports.default.dzCd_pageMax
                    local dyzs = ____exports.default.dzCd_DhdqIdx + ____exports.default.dzCd_Dhys * obj.UIdhls
                    local fenLei = ____exports.default.data[dyzs + 1]
                    local item = fenLei.items[xlz + 1]
                    if __TS__InstanceOf(item, Actor) then
                        item:localClick(
                            1,
                            InputUtil:getMouseSceneX(),
                            InputUtil:getMouseSceneY()
                        )
                    else
                        ActorFrameUtil:localClickActorType(
                            item,
                            1,
                            InputUtil:getMouseSceneX(),
                            InputUtil:getMouseSceneY()
                        )
                    end
                end)
                fenLeiBTN:addOnMouseRightUp(function()
                    local xlz = index + ____exports.default.dzCd_DjdqIdx * ____exports.default.dzCd_pageMax
                    local dyzs = ____exports.default.dzCd_DhdqIdx + ____exports.default.dzCd_Dhys * obj.UIdhls
                    local fenLei = ____exports.default.data[dyzs + 1]
                    local item = fenLei.items[xlz + 1]
                    if __TS__InstanceOf(item, Actor) then
                        item:localClick(
                            2,
                            InputUtil:getMouseSceneX(),
                            InputUtil:getMouseSceneY()
                        )
                    else
                        ActorFrameUtil:localClickActorType(
                            item,
                            2,
                            InputUtil:getMouseSceneX(),
                            InputUtil:getMouseSceneY()
                        )
                    end
                end)
                fenLeiBTN:setOnMouseEnter(function()
                    local xlz = index + ____exports.default.dzCd_DjdqIdx * ____exports.default.dzCd_pageMax
                    local uiid = DzGetTriggerUIEventFrame()
                    local dyzs = ____exports.default.dzCd_DhdqIdx + ____exports.default.dzCd_Dhys * obj.UIdhls
                    local fenLei = ____exports.default.data[dyzs + 1]
                    local item = fenLei.items[xlz + 1]
                    local name = __TS__InstanceOf(item, Actor) and item:getName() or item.name
                    DzFrameSetText(____exports.default.UI_CDdz_tip[2], name)
                    local ____temp_6
                    if __TS__InstanceOf(item, Actor) then
                        ____temp_6 = item:get("uiEnable", true)
                    else
                        ____temp_6 = item.uiEnable
                    end
                    if ____temp_6 == true then
                        DzFrameSetText(____exports.default.UI_CDdz_tip[3], "")
                    else
                        local requiredTip = __TS__InstanceOf(item, Actor) and item:get("requiredTip") or item.requiredTip
                        DzFrameSetText(
                            ____exports.default.UI_CDdz_tip[3],
                            ____exports.default.UICdYsbl.Tips_xq_qz .. tostring(requiredTip or name)
                        )
                    end
                    local describe = __TS__InstanceOf(item, Actor) and item:getDescribe(true) or item.describe
                    DzFrameSetText(____exports.default.UI_CDdz_tip[4], describe)
                    DzFrameSetPoint(
                        ____exports.default.UI_CDdz_tip[2],
                        3,
                        uiid,
                        5,
                        0.005,
                        -0.005
                    )
                    DzFrameShow(____exports.default.UI_CDdz_tip[1], true)
                end)
                fenLeiBTN:setOnMouseLeave(function()
                    DzFrameShow(____exports.default.UI_CDdz_tip[1], false)
                end)
            end
            i = i + 1
        end
    end
    ____exports.default:Refresh2_1()
end
function _____56FE_6807_9762_677F.Refresh2_1(self)
    local obj = ____exports.default.UICdYsbl
    local dqs = ____exports.default.dzCd_DhdqIdx + ____exports.default.dzCd_Dhys * obj.UIdhls
    local fenLei = ____exports.default.data[dqs + 1]
    if not fenLei then
        return
    end
    local startIndex = #fenLei.items - ____exports.default.dzCd_DjdqIdx * ____exports.default.dzCd_pageMax
    do
        local index = 0
        while index < ____exports.default.dzCd_pageMax do
            DzFrameShow(____exports.default.UI_CDdz_cdl_ba_1[index + 1], false)
            DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_ba_2[index + 1], 1)
            DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_ba_3[index + 1], 1)
            DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_text[index + 1], 200)
            index = index + 1
        end
    end
    local SFindex = ____exports.default.dzCd_DjdqIdx * ____exports.default.dzCd_pageMax
    do
        local i = 0
        while i < startIndex and i < ____exports.default.dzCd_pageMax do
            local item = fenLei.items[SFindex + 1]
            DzFrameShow(____exports.default.UI_CDdz_cdl_ba_1[i + 1], true)
            local icon = __TS__InstanceOf(item, Actor) and item:getIcon() or item.icon
            DzFrameSetTexture(____exports.default.UI_CDdz_cdl_ba_2[i + 1], icon, 0)
            local name = __TS__InstanceOf(item, Actor) and item:getName() or item.name
            if name and #name > 21 then
                local sName = string.sub(name, 0, 18) .. "..."
                DzFrameSetText(____exports.default.UI_CDdz_cdl_text[i + 1], sName)
            else
                DzFrameSetText(____exports.default.UI_CDdz_cdl_text[i + 1], name)
            end
            local ____temp_7
            if __TS__InstanceOf(item, Actor) then
                ____temp_7 = item:get("uiEnable", true)
            else
                ____temp_7 = item.uiEnable
            end
            local uiEnable = ____temp_7
            if uiEnable == true then
                DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_ba_2[i + 1], 255)
                DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_ba_3[i + 1], 1)
                DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_text[i + 1], 255)
            else
                DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_ba_2[i + 1], 200)
                DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_ba_3[i + 1], 155)
                DzFrameSetAlpha(____exports.default.UI_CDdz_cdl_text[i + 1], 230)
            end
            SFindex = SFindex + 1
            i = i + 1
        end
    end
    DzFrameSetText(
        ____exports.default.UI_CDdz_yxhy_an,
        (I2S(____exports.default.dzCd_DjdqIdx + 1) .. "/") .. tostring(math.ceil(#fenLei.items / ____exports.default.dzCd_pageMax))
    )
end
function _____56FE_6807_9762_677F.Refresh_LeftNavPan(self)
    local obj = ____exports.default.UICdYsbl
    do
        local i = 0
        while i < 2 do
            local key = "fenLeiHY:" .. tostring(i)
            local frame = ____exports.default.dzUI[key]
            if frame == nil or frame == 0 then
                frame = DzCreateFrameByTagName(
                    "GLUETEXTBUTTON",
                    ____exports.default:NewUIName(),
                    ____exports.default.UI_CDdz_DKZ_ba[2],
                    "CDbtn_dhhy_" .. tostring(i),
                    0
                )
                ____exports.default.dzUI[key] = frame
                local fenLeiHYBTN = Frame:fromHandle(frame)
                local index = i
                fenLeiHYBTN:setOnClick(function()
                    if #____exports.default.data > obj.UIdhls then
                        if index == 0 then
                            if ____exports.default.dzCd_Dhys < R2I(#____exports.default.data / obj.UIdhls) then
                                local ____exports_default_8, ____dzCd_Dhys_9 = ____exports.default, "dzCd_Dhys"
                                ____exports_default_8[____dzCd_Dhys_9] = ____exports_default_8[____dzCd_Dhys_9] + 1
                            else
                                ____exports.default.dzCd_Dhys = 0
                            end
                        end
                        if index == 1 then
                            if ____exports.default.dzCd_Dhys < 1 then
                                ____exports.default.dzCd_Dhys = R2I(#____exports.default.data / obj.UIdhls)
                            else
                                local ____exports_default_10, ____dzCd_Dhys_11 = ____exports.default, "dzCd_Dhys"
                                ____exports_default_10[____dzCd_Dhys_11] = ____exports_default_10[____dzCd_Dhys_11] - 1
                            end
                        end
                        ____exports.default.dzCd_DjdqIdx = 0
                        ____exports.default:Init_dhcj()
                        ____exports.default:Refresh_DHXZ(0)
                    end
                end)
                DzFrameSetPoint(
                    frame,
                    7,
                    ____exports.default.UI_CDdz_DKZ_ba[2],
                    7,
                    0,
                    i * 0.021
                )
                DzFrameSetSize(frame, 0.06, 0.02)
            end
            i = i + 1
        end
    end
end
function _____56FE_6807_9762_677F.Refresh_RightDJPan(self)
    local obj = ____exports.default.UICdYsbl
    do
        local i = 0
        while i < 2 do
            local key = "daojuHY:" .. tostring(i)
            local frame = ____exports.default.dzUI[key]
            if frame == nil or frame == 0 then
                frame = DzCreateFrameByTagName(
                    "TEXTBUTTON",
                    ____exports.default:NewUIName(),
                    ____exports.default.UI_CDdz_DKZ_ba[4],
                    "CDbtn_hy_" .. tostring(i),
                    0
                )
                DzFrameSetPoint(
                    frame,
                    4,
                    ____exports.default.UI_CDdz_DKZ_ba[4],
                    4,
                    -0.024 + i * 0.048,
                    0
                )
                DzFrameSetSize(frame, 0.02, 0.02)
                ____exports.default.dzUI[key] = frame
                local daojuHYBTN = Frame:fromHandle(frame)
                local index_zsz = i
                daojuHYBTN:setOnClick(function()
                    local dataDirectory = ____exports.default.data[____exports.default.dzCd_DhdqIdx + ____exports.default.dzCd_Dhys * obj.UIdhls + 1]
                    if not dataDirectory then
                        return
                    end
                    local djs = #dataDirectory.items
                    if djs > ____exports.default.dzCd_pageMax then
                        if index_zsz == 0 then
                            if ____exports.default.dzCd_DjdqIdx < 1 then
                                ____exports.default.dzCd_DjdqIdx = 0
                            else
                                local ____exports_default_12, ____dzCd_DjdqIdx_13 = ____exports.default, "dzCd_DjdqIdx"
                                ____exports_default_12[____dzCd_DjdqIdx_13] = ____exports_default_12[____dzCd_DjdqIdx_13] - 1
                            end
                        end
                        if index_zsz == 1 then
                            if ____exports.default.dzCd_DjdqIdx < R2I(djs / ____exports.default.dzCd_pageMax) then
                                local ____exports_default_14, ____dzCd_DjdqIdx_15 = ____exports.default, "dzCd_DjdqIdx"
                                ____exports_default_14[____dzCd_DjdqIdx_15] = ____exports_default_14[____dzCd_DjdqIdx_15] + 1
                            else
                                ____exports.default.dzCd_DjdqIdx = R2I(djs / ____exports.default.dzCd_pageMax)
                            end
                        end
                        ____exports.default:Refresh2_1()
                    end
                end)
            end
            i = i + 1
        end
    end
end
_____56FE_6807_9762_677F.data = {}
_____56FE_6807_9762_677F.showActorClasss = {"吞噬", "宝物"}
_____56FE_6807_9762_677F.uiShowTypes = {"图标面板", "通用图标面板", "存档商城", "羁绊"}
_____56FE_6807_9762_677F.UICdYsbl = {
    UITexture1 = "ui_icon_pane_texture\\UI_cdk_1.tga",
    UITexture2 = "ui_icon_pane_texture\\UI_cdk_2.tga",
    UITexture3 = "ui_icon_pane_texture\\UI_cdk_3.tga",
    UITexture4 = "ui_icon_pane_texture\\ui_icon_blank.tga",
    UIcdanys1 = "FBtn_Cd",
    UIcdanys2 = "FBtndh_cd",
    UI_cdl_bk = "ReplaceableTextures\\CommandButtons\\BTNHumanArtilleryUpOne.blp",
    UI_cdl_bl = "ui_icon_pane_texture\\ui_icon_blank.tga",
    UI_yyk_tb = "ui_icon_pane_texture\\ui_icon_yytp.tga",
    UI_cdan_fdf = "UI_cdan",
    UI_cdts_fdf = "UI_cdBK",
    UIdhl_tb0 = "ui_icon_pane_texture\\UI_cdk_4.tga",
    UIdhl_tb1 = "ui_icon_pane_texture\\UI_cdk_5.tga",
    Tips_xq_qz = "|cffff9900需要：|r",
    fontStr = "fonts\\font.ttf",
    UIcdlls = 9,
    UIcdlhs = 6,
    UIdhls = 11
}
_____56FE_6807_9762_677F.UI_CDdz_XSAn_bt = 0
_____56FE_6807_9762_677F.UI_CDdz_DKZxs_bt = false
_____56FE_6807_9762_677F.UI_CDdz_DKZ_ba = {}
_____56FE_6807_9762_677F.UI_CDdz_dhn_ba = {}
_____56FE_6807_9762_677F.UI_CDdz_cdl_ba_1 = {}
_____56FE_6807_9762_677F.UI_CDdz_cdl_ba_2 = {}
_____56FE_6807_9762_677F.UI_CDdz_cdl_ba_3 = {}
_____56FE_6807_9762_677F.UI_CDdz_cdl_text = {}
_____56FE_6807_9762_677F.UI_CDdz_tip = {}
_____56FE_6807_9762_677F.dzUI = {}
_____56FE_6807_9762_677F.dzCd_pageMax = ____exports.default.UICdYsbl.UIcdlls * ____exports.default.UICdYsbl.UIcdlhs
_____56FE_6807_9762_677F.dzCd_DhdqIdx = 0
_____56FE_6807_9762_677F.dzCd_Dhys = 0
_____56FE_6807_9762_677F.dzCd_DjdqIdx = 0
_____56FE_6807_9762_677F.uiBoxLastCurr = 0
_____56FE_6807_9762_677F.UI_IconName = 0
return ____exports
