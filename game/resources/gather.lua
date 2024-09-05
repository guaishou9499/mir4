---@class gather_re
local gather_re = {}
local this = gather_re
------------------------------------------------------------------------------------
this.gather_pos = {
    ['黑铁'] = {
        { x = 15119+math.random(1,10)+math.random(), y = 16763+math.random(1,10)+math.random(), z = 4152+math.random(1,10)+math.random(), map_id = 201003010 },--比奇秘谷1层
        { x = 10321+math.random(1,10)+math.random(), y = 17320+math.random(1,10)+math.random(), z = 4300+math.random(1,10)+math.random(), map_id = 201003010 }--比奇秘谷1层
    },
    ['矿石'] = { x = -6810+math.random(1,10)+math.random(), y = -185+math.random(1,10)+math.random(), z = -20421+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
    ['真气'] = { x = 5004+math.random(1,10)+math.random(), y = -22030+math.random(1,10)+math.random(), z = -19134+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
    ['3阶级'] = {
        { x = -3214+math.random(1,10)+math.random(), y = 1218+math.random(1,10)+math.random(), z = -20+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = 13159+math.random(1,10)+math.random(), y = 7987+math.random(1,10)+math.random(), z = -88+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = -2712+math.random(1,10)+math.random(), y = 7317+math.random(1,10)+math.random(), z = -188+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = 20390+math.random(1,10)+math.random(), y = 10971+math.random(1,10)+math.random(), z = 1295+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 18258+math.random(1,10)+math.random(), y = -13973+math.random(1,10)+math.random(), z = 1585+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = -16576+math.random(1,10)+math.random(), y = -8202+math.random(1,10)+math.random(), z = 2023+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 10767+math.random(1,10)+math.random(), y = 22378+math.random(1,10)+math.random(), z = 86+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
        { x = 12330+math.random(1,10)+math.random(), y = -17167+math.random(1,10)+math.random(), z = 1782+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
        { x = -17521+math.random(1,10)+math.random(), y = 9088+math.random(1,10)+math.random(), z = 4857+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
        { x = -40644+math.random(1,10)+math.random(), y = -664+math.random(1,10)+math.random(), z = 5727+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
        { x = -30474+math.random(1,10)+math.random(), y = -19373+math.random(1,10)+math.random(), z = -18806+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = 7382+math.random(1,10)+math.random(), y = -31141+math.random(1,10)+math.random(), z = -20643+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = -299+math.random(1,10)+math.random(), y = -9078+math.random(1,10)+math.random(), z = 239+math.random(1,10)+math.random(), map_id = 102004050 },--沃玛山
        { x = 1207+math.random(1,10)+math.random(), y = 4174+math.random(1,10)+math.random(), z = 1810+math.random(1,10)+math.random(), map_id = 102004050 },--沃玛山
        { x = 6825+math.random(1,10)+math.random(), y = 2042+math.random(1,10)+math.random(), z = 637+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -13354+math.random(1,10)+math.random(), y = 6137+math.random(1,10)+math.random(), z = 228+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
    }
}

--cls_id[48498C]  cls_name[MMNewGather_BP_C_13_17] sys_id[0x439f]       res_id[0xc47536b] name[미사용] gather_type[1.0]
-- 蛇谷

--cls_id[4850F8]  cls_name[MMNewGather_BP_C_13_18] sys_id[0x b0f]       res_id[0xc475753] name[미사용] gather_type[1.0]
--绝命谷上方

--cls_id[4A0950]  cls_name[MMNewGather_BP_C_13_25] sys_id[0x 6ab]       res_id[0xc475b3b] name[미사용] gather_type[1.0]
--绝命谷下方

--cls_id[4A05E2]  cls_name[MMNewGather_BP_C_13_24] sys_id[0x  26]       res_id[0xc3818fb] name[미사용] gather_type[1.0]
--沃玛山

--cls_id[4B782D]  cls_name[MMNewGather_BP_C_13_30] sys_id[0x78b3]       res_id[0xc198cab] name[미사용] gather_type[1.0]
-- 比奇县

--cls_id[4AE068]  cls_name[MMNewGather_BP_C_13_28] sys_id[0x15eb]       res_id[0xc4754fb] name[미사용] gather_type[1.0]
-- 蛇妖平原

--cls_id[4BAD13]  cls_name[MMNewGather_BP_C_13_31] sys_id[0x22bf]       res_id[0xc38112b] name[미사용] gather_type[1.0]
--沃玛森林

this.gather_list = {
    { -- 绝命谷下方-- 10
      --{ x = 449+math.random(1,10)+math.random(), y = 2858+math.random(1,10)+math.random(), z = 45+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方-- boss
      --{ x = 9091+math.random(1,10)+math.random(), y = 12891+math.random(1,10)+math.random(), z = 2026+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方-- 不可达
      { x = 21957+math.random(1,10)+math.random(), y = 5741+math.random(1,10)+math.random(), z = 1147+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      { x = 25218+math.random(1,10)+math.random(), y = 13168+math.random(1,10)+math.random(), z = 1163+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      { x = 19785+math.random(1,10)+math.random(), y = -11443+math.random(1,10)+math.random(), z = 1523+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      { x = 22478+math.random(1,10)+math.random(), y = -15706+math.random(1,10)+math.random(), z = 1221+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      { x = 16096+math.random(1,10)+math.random(), y = -16003+math.random(1,10)+math.random(), z = 1640+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      --{ x = 12452+math.random(1,10)+math.random(), y = -16713+math.random(1,10)+math.random(), z = 1837+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方-- 不可达
      { x = 20390+math.random(1,10)+math.random(), y = 10971+math.random(1,10)+math.random(), z = 1295+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      { x = 18258+math.random(1,10)+math.random(), y = -13973+math.random(1,10)+math.random(), z = 1585+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
      --{ x = -16576+math.random(1,10)+math.random(), y = -8202+math.random(1,10)+math.random(), z = 2023+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
    },

    { -- 绝命谷上方-- 9
      { x = -3152+math.random(1,10)+math.random(), y = 1195+math.random(1,10)+math.random(), z = -143+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = -2659+math.random(1,10)+math.random(), y = 6508+math.random(1,10)+math.random(), z = -311+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = -2784+math.random(1,10)+math.random(), y = -4472+math.random(1,10)+math.random(), z = -108+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = -4826+math.random(1,10)+math.random(), y = -10350+math.random(1,10)+math.random(), z = 835+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = 4351+math.random(1,10)+math.random(), y = -8902+math.random(1,10)+math.random(), z = 847+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = 11789+math.random(1,10)+math.random(), y = 4165+math.random(1,10)+math.random(), z = -210+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = -3214+math.random(1,10)+math.random(), y = 1218+math.random(1,10)+math.random(), z = -20+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = 13159+math.random(1,10)+math.random(), y = 7987+math.random(1,10)+math.random(), z = -88+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
      { x = -2712+math.random(1,10)+math.random(), y = 7317+math.random(1,10)+math.random(), z = -188+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
    },
    { -- 蛇谷-- 15
        { x = -15700+math.random(1,10)+math.random(), y = 5898+math.random(1,10)+math.random(), z = 237+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -15117+math.random(1,10)+math.random(), y = 6801+math.random(1,10)+math.random(), z = 176+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -13187+math.random(1,10)+math.random(), y = 5839+math.random(1,10)+math.random(), z = 104+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -10340+math.random(1,10)+math.random(), y = 10755+math.random(1,10)+math.random(), z = 722+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = -12247+math.random(1,10)+math.random(), y = 2705+math.random(1,10)+math.random(), z = 246+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = -16305+math.random(1,10)+math.random(), y = -6874+math.random(1,10)+math.random(), z = 600+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -1843+math.random(1,10)+math.random(), y = -1495+math.random(1,10)+math.random(), z = 335+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6764+math.random(1,10)+math.random(), y = 3337+math.random(1,10)+math.random(), z = 258+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6826+math.random(1,10)+math.random(), y = 1287+math.random(1,10)+math.random(), z = 597+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6207+math.random(1,10)+math.random(), y = 2883+math.random(1,10)+math.random(), z = 368+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = 13292+math.random(1,10)+math.random(), y = -4052+math.random(1,10)+math.random(), z = 828+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = 9140+math.random(1,10)+math.random(), y = -6694+math.random(1,10)+math.random(), z = 421+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -11767+math.random(1,10)+math.random(), y = 8464+math.random(1,10)+math.random(), z = 215+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 8073+math.random(1,10)+math.random(), y = 9827+math.random(1,10)+math.random(), z = 219+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -7228+math.random(1,10)+math.random(), y = -5724+math.random(1,10)+math.random(), z = 256+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
    },

    { -- 沃玛山
        -- 1.   野草_群集_3阶级   [211.00, -8454.00, 239.66]   -- 沃玛山
        -- 2.   野草_野外_3阶级   [-1079.00, -2015.00, 1159.00]   -- 沃玛山
      { x = -299+math.random(1,10)+math.random(), y = -9078+math.random(1,10)+math.random(), z = 239+math.random(1,10)+math.random(), map_id = 102004050 },--沃玛山
      { x = 1207+math.random(1,10)+math.random(), y = 4174+math.random(1,10)+math.random(), z = 1810+math.random(1,10)+math.random(), map_id = 102004050 },--沃玛山
    },
    { -- 蛇谷
        { x = -15700+math.random(1,10)+math.random(), y = 5898+math.random(1,10)+math.random(), z = 237+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -15117+math.random(1,10)+math.random(), y = 6801+math.random(1,10)+math.random(), z = 176+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -13187+math.random(1,10)+math.random(), y = 5839+math.random(1,10)+math.random(), z = 104+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -10340+math.random(1,10)+math.random(), y = 10755+math.random(1,10)+math.random(), z = 722+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = -12247+math.random(1,10)+math.random(), y = 2705+math.random(1,10)+math.random(), z = 246+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = -16305+math.random(1,10)+math.random(), y = -6874+math.random(1,10)+math.random(), z = 600+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -1843+math.random(1,10)+math.random(), y = -1495+math.random(1,10)+math.random(), z = 335+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6764+math.random(1,10)+math.random(), y = 3337+math.random(1,10)+math.random(), z = 258+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6826+math.random(1,10)+math.random(), y = 1287+math.random(1,10)+math.random(), z = 597+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6207+math.random(1,10)+math.random(), y = 2883+math.random(1,10)+math.random(), z = 368+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = 13292+math.random(1,10)+math.random(), y = -4052+math.random(1,10)+math.random(), z = 828+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = 9140+math.random(1,10)+math.random(), y = -6694+math.random(1,10)+math.random(), z = 421+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -11767+math.random(1,10)+math.random(), y = 8464+math.random(1,10)+math.random(), z = 215+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 8073+math.random(1,10)+math.random(), y = 9827+math.random(1,10)+math.random(), z = 219+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -7228+math.random(1,10)+math.random(), y = -5724+math.random(1,10)+math.random(), z = 256+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
    },
    { -- 蛇妖平原
        { x = 3142+math.random(1,10)+math.random(), y = -16964+math.random(1,10)+math.random(), z = 1907+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      --{ x = -10716+math.random(1,10)+math.random(), y = 17881+math.random(1,10)+math.random(), z = 1828+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原-- 不可达
      --{ x = -16396+math.random(1,10)+math.random(), y = -3407+math.random(1,10)+math.random(), z = -123+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原-- 不可达
      { x = -25231+math.random(1,10)+math.random(), y = -4819+math.random(1,10)+math.random(), z = -494+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      --{ x = -3963+math.random(1,10)+math.random(), y = -5583+math.random(1,10)+math.random(), z = 1008+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原-- 不可达
      { x = -1086+math.random(1,10)+math.random(), y = -17101+math.random(1,10)+math.random(), z = 1725+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 8854+math.random(1,10)+math.random(), y = -21220+math.random(1,10)+math.random(), z = 1713+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 7222+math.random(1,10)+math.random(), y = -16541+math.random(1,10)+math.random(), z = 1775+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 22933+math.random(1,10)+math.random(), y = 1587+math.random(1,10)+math.random(), z = 1185+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 8926+math.random(1,10)+math.random(), y = 20490+math.random(1,10)+math.random(), z = -183+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 12643+math.random(1,10)+math.random(), y = 21263+math.random(1,10)+math.random(), z = 118+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 13031+math.random(1,10)+math.random(), y = 26114+math.random(1,10)+math.random(), z = 963+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = -3482+math.random(1,10)+math.random(), y = 25736+math.random(1,10)+math.random(), z = -467+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 10393+math.random(1,10)+math.random(), y = -10610+math.random(1,10)+math.random(), z = 1486+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 18719+math.random(1,10)+math.random(), y = 2097+math.random(1,10)+math.random(), z = 1274+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 4975+math.random(1,10)+math.random(), y = -17990+math.random(1,10)+math.random(), z = 1784+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = -975+math.random(1,10)+math.random(), y = -3115+math.random(1,10)+math.random(), z = 538+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
      { x = 10499+math.random(1,10)+math.random(), y = 22079+math.random(1,10)+math.random(), z = 14+math.random(1,10)+math.random(), map_id = 103003070 },--蛇妖平原
    },
    { -- 蛇谷
        { x = -15700+math.random(1,10)+math.random(), y = 5898+math.random(1,10)+math.random(), z = 237+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -15117+math.random(1,10)+math.random(), y = 6801+math.random(1,10)+math.random(), z = 176+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -13187+math.random(1,10)+math.random(), y = 5839+math.random(1,10)+math.random(), z = 104+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -10340+math.random(1,10)+math.random(), y = 10755+math.random(1,10)+math.random(), z = 722+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = -12247+math.random(1,10)+math.random(), y = 2705+math.random(1,10)+math.random(), z = 246+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = -16305+math.random(1,10)+math.random(), y = -6874+math.random(1,10)+math.random(), z = 600+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -1843+math.random(1,10)+math.random(), y = -1495+math.random(1,10)+math.random(), z = 335+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6764+math.random(1,10)+math.random(), y = 3337+math.random(1,10)+math.random(), z = 258+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6826+math.random(1,10)+math.random(), y = 1287+math.random(1,10)+math.random(), z = 597+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6207+math.random(1,10)+math.random(), y = 2883+math.random(1,10)+math.random(), z = 368+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = 13292+math.random(1,10)+math.random(), y = -4052+math.random(1,10)+math.random(), z = 828+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = 9140+math.random(1,10)+math.random(), y = -6694+math.random(1,10)+math.random(), z = 421+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -11767+math.random(1,10)+math.random(), y = 8464+math.random(1,10)+math.random(), z = 215+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 8073+math.random(1,10)+math.random(), y = 9827+math.random(1,10)+math.random(), z = 219+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -7228+math.random(1,10)+math.random(), y = -5724+math.random(1,10)+math.random(), z = 256+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
    },
    { -- 比奇县
      { x = -30474+math.random(1,10)+math.random(), y = -19373+math.random(1,10)+math.random(), z = -18806+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
      { x = 3223+math.random(1,10)+math.random(), y = -11532+math.random(1,10)+math.random(), z = -20337+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
      { x = 10251+math.random(1,10)+math.random(), y = -30043+math.random(1,10)+math.random(), z = -21479+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
      --{ x = -3549+math.random(1,10)+math.random(), y = -25321+math.random(1,10)+math.random(), z = -20320+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县-- 不可达
      { x = -15592+math.random(1,10)+math.random(), y = -23371+math.random(1,10)+math.random(), z = -18210+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
      { x = -8027+math.random(1,10)+math.random(), y = -5416+math.random(1,10)+math.random(), z = -20592+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
      { x = 3268+math.random(1,10)+math.random(), y = -25451+math.random(1,10)+math.random(), z = -19495+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
      { x = -28973+math.random(1,10)+math.random(), y = -18821+math.random(1,10)+math.random(), z = -18797+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
    },
    { -- 沃玛森林
      { x = -6254+math.random(1,10)+math.random(), y = -17347+math.random(1,10)+math.random(), z = 5261+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
      --{ x = -19204+math.random(1,10)+math.random(), y = 6214+math.random(1,10)+math.random(), z = 6894+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林-- 不可达
      { x = -17521+math.random(1,10)+math.random(), y = 9088+math.random(1,10)+math.random(), z = 4875+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
      --{ x = -35774+math.random(1,10)+math.random(), y = 6984+math.random(1,10)+math.random(), z = 5230+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林-- 不可达
      { x = -36927+math.random(1,10)+math.random(), y = -649+math.random(1,10)+math.random(), z = 5727+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
      { x = -14703+math.random(1,10)+math.random(), y = 7575+math.random(1,10)+math.random(), z = 5011+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
      { x = -10656+math.random(1,10)+math.random(), y = -13422+math.random(1,10)+math.random(), z = 5183+math.random(1,10)+math.random(), map_id = 102003010 },--沃玛森林
    },
    { -- 比奇县
        { x = -30474+math.random(1,10)+math.random(), y = -19373+math.random(1,10)+math.random(), z = -18806+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = 3223+math.random(1,10)+math.random(), y = -11532+math.random(1,10)+math.random(), z = -20337+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = 10251+math.random(1,10)+math.random(), y = -30043+math.random(1,10)+math.random(), z = -21479+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        --{ x = -3549+math.random(1,10)+math.random(), y = -25321+math.random(1,10)+math.random(), z = -20320+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县-- 不可达
        { x = -15592+math.random(1,10)+math.random(), y = -23371+math.random(1,10)+math.random(), z = -18210+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = -8027+math.random(1,10)+math.random(), y = -5416+math.random(1,10)+math.random(), z = -20592+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = 3268+math.random(1,10)+math.random(), y = -25451+math.random(1,10)+math.random(), z = -19495+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
        { x = -28973+math.random(1,10)+math.random(), y = -18821+math.random(1,10)+math.random(), z = -18797+math.random(1,10)+math.random(), map_id = 101003030 },--比奇县
    },
    { -- 蛇谷
        { x = -15700+math.random(1,10)+math.random(), y = 5898+math.random(1,10)+math.random(), z = 237+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -15117+math.random(1,10)+math.random(), y = 6801+math.random(1,10)+math.random(), z = 176+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -13187+math.random(1,10)+math.random(), y = 5839+math.random(1,10)+math.random(), z = 104+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -10340+math.random(1,10)+math.random(), y = 10755+math.random(1,10)+math.random(), z = 722+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = -12247+math.random(1,10)+math.random(), y = 2705+math.random(1,10)+math.random(), z = 246+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = -16305+math.random(1,10)+math.random(), y = -6874+math.random(1,10)+math.random(), z = 600+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -1843+math.random(1,10)+math.random(), y = -1495+math.random(1,10)+math.random(), z = 335+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6764+math.random(1,10)+math.random(), y = 3337+math.random(1,10)+math.random(), z = 258+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6826+math.random(1,10)+math.random(), y = 1287+math.random(1,10)+math.random(), z = 597+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 6207+math.random(1,10)+math.random(), y = 2883+math.random(1,10)+math.random(), z = 368+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        --{ x = 13292+math.random(1,10)+math.random(), y = -4052+math.random(1,10)+math.random(), z = 828+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷-- 不可达
        { x = 9140+math.random(1,10)+math.random(), y = -6694+math.random(1,10)+math.random(), z = 421+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -11767+math.random(1,10)+math.random(), y = 8464+math.random(1,10)+math.random(), z = 215+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = 8073+math.random(1,10)+math.random(), y = 9827+math.random(1,10)+math.random(), z = 219+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
        { x = -7228+math.random(1,10)+math.random(), y = -5724+math.random(1,10)+math.random(), z = 256+math.random(1,10)+math.random(), map_id = 103003010 },--蛇谷
    },
    { -- 绝命谷上方
        { x = -3152+math.random(1,10)+math.random(), y = 1195+math.random(1,10)+math.random(), z = -143+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = -2659+math.random(1,10)+math.random(), y = 6508+math.random(1,10)+math.random(), z = -311+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = -2784+math.random(1,10)+math.random(), y = -4472+math.random(1,10)+math.random(), z = -108+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = -4826+math.random(1,10)+math.random(), y = -10350+math.random(1,10)+math.random(), z = 835+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = 4351+math.random(1,10)+math.random(), y = -8902+math.random(1,10)+math.random(), z = 847+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = 11789+math.random(1,10)+math.random(), y = 4165+math.random(1,10)+math.random(), z = -210+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = -3214+math.random(1,10)+math.random(), y = 1218+math.random(1,10)+math.random(), z = -20+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = 13159+math.random(1,10)+math.random(), y = 7987+math.random(1,10)+math.random(), z = -88+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
        { x = -2712+math.random(1,10)+math.random(), y = 7317+math.random(1,10)+math.random(), z = -188+math.random(1,10)+math.random(), map_id = 103003020 },--绝命谷上方
    },
    { -- 绝命谷下方
        --{ x = 449+math.random(1,10)+math.random(), y = 2858+math.random(1,10)+math.random(), z = 45+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方-- boss
        --{ x = 9091+math.random(1,10)+math.random(), y = 12891+math.random(1,10)+math.random(), z = 2026+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方-- 不可达
        { x = 21957+math.random(1,10)+math.random(), y = 5741+math.random(1,10)+math.random(), z = 1147+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 25218+math.random(1,10)+math.random(), y = 13168+math.random(1,10)+math.random(), z = 1163+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 19785+math.random(1,10)+math.random(), y = -11443+math.random(1,10)+math.random(), z = 1523+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 22478+math.random(1,10)+math.random(), y = -15706+math.random(1,10)+math.random(), z = 1221+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 16096+math.random(1,10)+math.random(), y = -16003+math.random(1,10)+math.random(), z = 1640+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        --{ x = 12452+math.random(1,10)+math.random(), y = -16713+math.random(1,10)+math.random(), z = 1837+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方-- 不可达
        { x = 20390+math.random(1,10)+math.random(), y = 10971+math.random(1,10)+math.random(), z = 1295+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        { x = 18258+math.random(1,10)+math.random(), y = -13973+math.random(1,10)+math.random(), z = 1585+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
        --{ x = -16576+math.random(1,10)+math.random(), y = -8202+math.random(1,10)+math.random(), z = 2023+math.random(1,10)+math.random(), map_id = 103003030 },--绝命谷下方
    },
}
------------------------------------------------------------------------------------
--1.   野草_野外_3阶级   [3223.00, -11532.00, -20337.60]-- 比奇县
--2.   野草_群集_3阶级   [10251.00, -30043.00, -21479.64]-- 比奇县
--3.   野草_野外_3阶级   [-5187.00, -27429.00, -18639.66]-- 比奇县
--4.   野草_群集_3阶级   [-30474.00, -19373.00, -18806.50]-- 比奇县
--5.   -15388.291992188  23452.23046875  18184.501953125-- 比奇县

-- 1.  野草_野外_3阶级   [-6254.00, -17347.00, 5261.31]   -- 沃玛森林
-- 2.  野草_野外_3阶级   [-18922.00, 5870.00, 7072.39]   -- 沃玛森林
-- 3.  野草_群集_3阶级   [-17521.00, 9088.00, 4875.88]   -- 沃玛森林
-- 4.  野草_群集_3阶级   [-35416.00, 4520.00, 8752.86]   -- 沃玛森林

-- 1.   野草_群集_3阶级   [-15700.00, 5898.00, 237.81]   -- 蛇谷
-- 2.   野草_野外_3阶级   [-16992.00, 5406.00, 2966.64]   -- 蛇谷
-- 3.   野草_群集_3阶级   [-15117.00, 6801.00, 176.03]   -- 蛇谷
-- 4.   野草_群集_3阶级   [-13187.00, 5839.00, 104.60]   -- 蛇谷
-- 5.   野草_野外_3阶级   [-10340.00, 10755.00, 722.35]   -- 蛇谷
-- 6.   野草_野外_3阶级   [-11764.00, 3296.00, 833.30]   -- 蛇谷
-- 7.   野草_野外_3阶级   [-16305.00, -6874.00, 600.50]   -- 蛇谷
-- 8.   野草_野外_3阶级   [-1843.00, -1495.00, 335.52]   -- 蛇谷
-- 9.   野草_群集_3阶级   [6764.00, 3337.00, 258.96]   -- 蛇谷
-- 10.  野草_群集_3阶级   [6826.00, 1287.00, 597.16]   -- 蛇谷
-- 11.  野草_群集_3阶级   [6207.00, 2883.00, 368.43]   -- 蛇谷
-- 12.  野草_野外_3阶级   [14563.00, -3639.00, 1750.94]   -- 蛇谷
-- 13.  野草_野外_3阶级   [9140.00, -6694.00, 421.76]   -- 蛇谷

-- 1.   野草_野外_3阶级   [-3152.00, 1195.00, -143.08]   -- 绝命谷上方
-- 2.   野草_野外_3阶级   [-2659.00, 6508.00, -311.04]   -- 绝命谷上方
-- 3.   野草_野外_3阶级   [-2784.00, -4472.00, -108.27]   -- 绝命谷上方
-- 4.   野草_野外_3阶级   [-4826.00, -10350.00, 835.57]   -- 绝命谷上方
-- 5.   野草_野外_3阶级   [4351.00, -8902.00, 847.42]   -- 绝命谷上方
-- 6.   野草_野外_3阶级   [11789.00, 4165.00, -210.34]   -- 绝命谷上方

-- 1.   野草_野外_3阶级   [449.00, 2858.00, 45.33]   --绝命谷下方
-- 2.   野草_野外_3阶级   [9603.00, 13128.00, 2138.74]   -- 绝命谷下方
-- 3.   野草_野外_3阶级   [21957.00, 5741.00, 1147.21]  -- 绝命谷下方
-- 4.   野草_野外_3阶级   [25218.00, 13168.00, 1163.41]   -- 绝命谷下方
-- 5.   野草_野外_3阶级   [19785.00, -11443.00, 1523.02]   -- 绝命谷下方
-- 6.   野草_野外_3阶级   [22478.00, -15706.00, 1221.81]   -- 绝命谷下方
-- 7.   野草_野外_3阶级   [16096.00, -16003.00, 1640.72]   -- 绝命谷下方
-- 8.   野草_野外_3阶级   [12011.00, -16413.00, 1884.86]   -- 绝命谷下方

-- 1.   野草_野外_3阶级   [-11833.00, 18294.00, 2988.67]   -- 蛇妖平原
-- 2.   野草_野外_3阶级   [-14437.00, -5043.00, -1703.40]   -- 蛇妖平原
-- 3.   野草_野外_3阶级   [-25231.00, -4819.00, -494.41]   -- 蛇妖平原
-- 4.   野草_野外_3阶级   [-3103.00, -5960.00, 1245.23]  -- 蛇妖平原
-- 5.   野草_野外_3阶级   [-1086.00, -17101.00, 1725.43]   -- 蛇妖平原
-- 6.   野草_群集_3阶级   [8854.00, -21220.00, 1713.26]   -- 蛇妖平原
-- 7.   野草_群集_3阶级   [3142.00, -16964.00, 1907.51]   -- 蛇妖平原
-- 8.   野草_群集_3阶级   [7222.00, -16541.00, 1775.03]   -- 蛇妖平原
-- 9.   野草_野外_3阶级   [22933.00, 1587.00, 1185.11]   -- 蛇妖平原
-- 10.  野草_群集_3阶级   [8926.00, 20490.00, -183.81]   -- 蛇妖平原
-- 11.  野草_群集_3阶级   [12643.00, 21263.00, 118.80]   -- 蛇妖平原
-- 12.  野草_群集_3阶级   [13031.00, 26114.00, 963.63]   -- 蛇妖平原
-- 13.  野草_野外_3阶级   [-3482.00, 25736.00, -467.43]   -- 蛇妖平原
-- 14.  野草_野外_3阶级   [10393.00, -10610.00, 1486.95]   -- 蛇妖平原

-- 1.   野草_群集_3阶级   [211.00, -8454.00, 239.66]   -- 沃玛山
-- 2.   野草_野外_3阶级   [-1079.00, -2015.00, 1159.00]   -- 沃玛山

------------------------------------------------------------------------------------

function gather_re.__tostring()
    return "mir4 pet package"
end

gather_re.__index = gather_re

function gather_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, gather_re)
end

return gather_re:new()