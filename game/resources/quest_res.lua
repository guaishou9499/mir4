-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   zengluolu
-- @email:    1819@qq.com
-- @date:     2023-10-16
-- @module:   quest_res 
-- @describe: 物品资源
-- @version:  v1.0


-------------------------------------------------------------------------------------
-- 任务模块资源
---@class quest_res
local quest_res = {
    -- 主线任务
    MAIN_QUEST = {
        [1] = { name = '漆黑的密道' },
        [2] = { name = '危险的救援计划', },
        [3] = { name = '武功修炼', },
        [4] = { name = '岁月静好', },
        [5] = { name = '燃烧的桃花谷', },
        [6] = { name = '追踪痕迹', },
        [7] = { name = '黑暗之影', },
        [8] = { name = '芊菲的下落', },
        [9] = { name = '寻求灵药', },
        [10] = { name = '逃离银杏谷', },
        [11] = { name = '比奇城风云', },--比奇城后巷
        [12] = { name = '再遭绑架的芊菲', },
        [13] = { name = '绑架的背后', },--古墓1层
        [14] = { name = '半兽古墓', },
        [15] = { name = '石室之秘', },-- 古墓2层
        [16] = { name = '师父的决断', },
        [17] = { name = '偶然发现的远古迷宫', },--迷宫1层

        [18] = { name = '可疑的随行', },
        [19] = { name = '半兽人遗迹宝物', },--古墓遗迹2层

        [20] = { name = '访问仙界精灵村', },
        [21] = { name = '重重危险', },-- 古墓2层
        [22] = { name = '江湖缘分', }, -- 比奇秘谷1层

        [23] = { name = '牛魔神殿的怪事', },
        [24] = { name = '被绑架的女人们', },-- 牛魔1层
        [25] = { name = '吸星大法之秘', },--沃玛山
        [26] = { name = '寻找龙身', },--牛魔23层

        [27] = { name = '芊菲的下落Ⅰ', },
        [28] = { name = '隐士谷的隐藏高手', }, -- idx 10 九阳 隐士谷
        [29] = { name = '毒蛇魔女与芊菲公主' }, --idx 6  达到40级
    },
    -- 其他任务
    OTHER_QUEST = {
        -- 11-1
        [1] = { name = '清除有害植物', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [2] = { name = '饿鬼不速之客', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [3] = { name = '维护银杏谷的治安', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [4] = { name = '银杏谷屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [5] = { name = '张氏的嘱托', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [6] = { name = '其他毒的材料', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [7] = { name = '研究蛇妖族毒术', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [8] = { name = '解铃还须系铃人', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [9] = { name = '黑云耍威风', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [10] = { name = '机动打击', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [11] = { name = '打压蛇妖族气势', task_type = '支线', task_type2 = '打怪', map_name = '银杏谷' },
        [12] = { name = '在银杏谷采集', task_type = '支线', task_type2 = '采集', map_name = '银杏谷' },
        [13] = { name = '采集的乐趣', task_type = '支线', task_type2 = '采集', map_name = '银杏谷' },
        [14] = { name = '在银杏谷采矿', task_type = '支线', task_type2 = '采矿', map_name = '银杏谷' },
        [15] = { name = '采矿的乐趣', task_type = '支线', task_type2 = '采矿', map_name = '银杏谷' },
        [16] = { name = '临危的银杏谷', task_type = '委托', task_type2 = '打怪', map_name = '银杏谷' },
        [17] = { name = '宝物的气息', task_type = '委托', task_type2 = '真气', map_name = '银杏谷' },
        [18] = { name = '勉强的工作', task_type = '委托', task_type2 = '采集', map_name = '银杏谷' },

        [19] = { name = '巨型圆花特殊', task_type = '委托', task_type2 = '特殊', map_name = '银杏谷', move_pos = { cx = 7889, cy = -6864, cz = 4433 }, gather_pos = { cx = 7367, cy = -5011, cz = 5785 } },
        [20] = { name = '为了出人头地特殊', task_type = '委托', task_type2 = '特殊', map_name = '银杏谷', move_pos = { cx = -18336, cy = -8495, cz = 4174 }, gather_pos = { cx = -20635, cy = -6631, cz = 5462 } },
        [21] = { name = '长生不老材料特殊', task_type = '委托', task_type2 = '特殊', map_name = '银杏谷', move_pos = { cx = -1131, cy = -3320, cz = 3753 }, gather_pos = { cx = -614, cy = -632, cz = 5677 } },
        [22] = { name = '狂人的痕迹特殊', task_type = '委托', task_type2 = '特殊', map_name = '银杏谷', move_pos = { cx = 4538, cy = 10598, cz = 2529 }, gather_pos = { cx = 5837, cy = 14174, cz = 3752 } },

        --13 - 18
        [23] = { name = '以眼还眼', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [24] = { name = '后巷痞子', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [25] = { name = '歹毒高利贷', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [26] = { name = '监视兵的痕迹', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [27] = { name = '比奇城后巷的屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [28] = { name = '掠夺兵的宝物', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [29] = { name = '血的代价', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [30] = { name = '双门帮监视队长', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [31] = { name = '以牙还牙', task_type = '支线', task_type2 = '打怪', map_name = '比奇城', pos = { map_id = 101003020.0, map_name = '比奇城后巷', x = 6863.2333984375, y = -5400.4140625, z = 120.39599609375 } },
        [32] = { name = '双门帮掠夺队长', task_type = '支线', task_type2 = '打怪', map_name = '比奇城后巷' },
        [33] = { name = '双门四天王1', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [34] = { name = '双门四天王2', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [35] = { name = '双门四天王4', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [36] = { name = '丹鹰的护卫部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [37] = { name = '千秋风的护卫部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [38] = { name = '白健的护卫部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [39] = { name = '双门帮帮主', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [40] = { name = '毁灭侦察队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [41] = { name = '毁灭守护队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [42] = { name = '帮主信物', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [43] = { name = '双门帮侦察队长', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [44] = { name = '双门帮守护队长', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [45] = { name = '双门帮高手1', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [46] = { name = '双门帮高手2', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [47] = { name = '双门帮高手4', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [48] = { name = '双门帮顶尖高手', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [49] = { name = '比奇城通缉犯', task_type = '委托', task_type2 = '打怪', map_name = '比奇城后巷' },
        [50] = { name = '隐秘的调查1', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [51] = { name = '体现正义', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [52] = { name = '隐秘的调查2', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [53] = { name = '隐秘的调查3', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [54] = { name = '隐秘的调查4', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [55] = { name = '隐秘的调查5', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [56] = { name = '厌烦的传闻特殊', task_type = '委托', task_type2 = '特殊', map_name = '比奇城后巷', move_pos = { cx = -480, cy = -5703, cz = 122 }, gather_pos = { cx = -1180, cy = -6466, cz = 851 } },
        [57] = { name = '朱千的护卫部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },

        [58] = { name = '双门四天王3', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },
        [59] = { name = '双门帮高手3', task_type = '支线', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },

        [60] = { name = '掠夺强盗', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [61] = { name = '掌握犯人', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [62] = { name = '比奇县屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [63] = { name = '善良地活着', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [64] = { name = '在比奇县采矿', task_type = '支线', task_type2 = '采矿', map_name = '比奇县' },
        [65] = { name = '采矿的乐趣', task_type = '支线', task_type2 = '采矿', map_name = '比奇县' },
        [66] = { name = '在比奇县采集', task_type = '支线', task_type2 = '采集', map_name = '比奇县' },
        [67] = { name = '采集的乐趣', task_type = '支线', task_type2 = '采集', map_name = '比奇县' },

        [68] = { name = '真气收集者', task_type = '支线', task_type2 = '真气', map_name = '比奇县' },
        [69] = { name = '新力量源泉', task_type = '支线', task_type2 = '真气', map_name = '比奇县' },
        [70] = { name = '隐藏宝物', task_type = '支线', task_type2 = '宝箱', map_name = '比奇县' },
        [71] = { name = '寻找线索', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓1层' },
        [72] = { name = '墓地看守人', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓1层' },
        [73] = { name = '确认毒雾原因', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓1层' },
        [74] = { name = '跟随生灵的团伙', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓1层' },
        [75] = { name = '半兽古墓1层屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓1层' },
        [76] = { name = '消失的宝物', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓1层' },
        [77] = { name = '某人的宝物', task_type = '支线', task_type2 = '宝箱', map_name = '半兽古墓1层' },

        ----
        [78] = { name = '玄黑半兽人佣兵队长', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [79] = { name = '玄黑半兽人长老', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [80] = { name = '佣兵队长部下们', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [81] = { name = '窟落部下们', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [82] = { name = '玄黑半兽人驯兽师', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [83] = { name = '玄黑半兽人注视者', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },

        [84] = { name = '玄黑部族长', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [85] = { name = '紫侃部下们', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [86] = { name = '焰鬼部下们', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [87] = { name = '佣兵队长信物', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [88] = { name = '窟落信物', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [89] = { name = '紫侃信物', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [90] = { name = '焰鬼信物', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },

        [91] = { name = '诡秘客人', task_type = '委托', task_type2 = '宝箱', map_name = '半兽古墓1层' },

        [92] = { name = '迅速的处世之道', task_type = '委托', task_type2 = '采矿', map_name = '比奇县' },
        [93] = { name = '神龙降临时', task_type = '委托', task_type2 = '宝箱', map_name = '比奇县' },
        --[0] = { name = '沃玛新娘1', task_type = '委托', task_type2 = '打怪', map_name = '【精英】比奇城后巷' },

        [94] = { name = '为了大义', task_type = '委托', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [95] = { name = '孙德的喜好', task_type = '委托', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [96] = { name = '好奇的反应', task_type = '委托', task_type2 = '打怪', map_name = '【精英】半兽古墓1层' },
        [97] = { name = '酒鬼禹玄真1', task_type = '委托', task_type2 = '打怪', map_name = '【精英】半兽古墓1层',pos = { map_id = 200022020.0, map_name = '【精英】半兽古墓1层', x = -3275, y = -1097, z = 1988 } },



        [98] = { name = '守护不利之罪', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓2层' },
        [99] = { name = '屠杀元凶', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓2层' },
        [100] = { name = '血海深仇', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓2层' },
        [101] = { name = '半兽古墓2层屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓2层' },
        [102] = { name = '半兽人之力', task_type = '支线', task_type2 = '打怪', map_name = '半兽古墓2层' },
        [103] = { name = '某人的宝物', task_type = '支线', task_type2 = '宝箱', map_name = '半兽古墓2层' },
        [104] = { name = '黑焰族奴隶团长', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [105] = { name = '黑焰族执行者', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [106] = { name = '尤鲁侃部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [107] = { name = '哈侃部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [108] = { name = '黑焰族邪灵魔', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [109] = { name = '黑焰族刽子手', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [110] = { name = '黑焰族族长', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [111] = { name = '马候部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [112] = { name = '拉侃部队', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [113] = { name = '奴隶团长的旗帜', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [114] = { name = '执行者的旗帜', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [115] = { name = '邪灵魔的旗帜', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },
        [116] = { name = '刽子手的旗帜', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽古墓2层' },



        [117] = { name = '豚豚崽随从', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [118] = { name = '警卫兵的指令', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [119] = { name = '半兽人中副将随从', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [120] = { name = '警戒兵的指令', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [121] = { name = '半兽人大队长随从', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [122] = { name = '巡查队的指令', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [123] = { name = '远古豚豚崽', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [124] = { name = '远古半兽人中副将', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [125] = { name = '远古半兽人大队长', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [126] = { name = '半兽人大副将随从', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [127] = { name = '侦察兵的指令', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [128] = { name = '瓜德随从', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [129] = { name = '战斗兵的指令', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [130] = { name = '远古豚豚大副将', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [131] = { name = '半兽人大神将', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [132] = { name = '豚豚崽随从', task_type = '支线', task_type2 = '打怪', map_name = '比奇迷宫1层' },
        [133] = { name = '讨伐赤狼队', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [134] = { name = '猛兽的证据', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [135] = { name = '调查通缉犯支线', task_type = '支线', task_type2 = '打怪', map_name = '比奇县' },
        [136] = { name = '规定的礼物', task_type = '委托', task_type2 = '打怪', map_name = '比奇县' },

        [137] = { name = '恢复原状', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },
        [138] = { name = '保护古迹', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },
        [139] = { name = '危险的巨大禽兽', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },

        [140] = { name = '半兽人之怒', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },
        [141] = { name = '真正的盗墓贼', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },
        [142] = { name = '半兽人遗迹1层屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },
        [143] = { name = '盗墓贼的隐情', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹1层' },
        [144] = { name = '某人的宝物', task_type = '支线', task_type2 = '宝箱', map_name = '半兽人遗迹1层' },

--{ map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', pos = { x = 4704.3217773438, y = -2332.06640625, z = 4910.8388671875 } },

        [145] = { name = '妖华追随者', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [146] = { name = '库鲁茨部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [147] = { name = '半兽人训练场', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [148] = { name = '女王的还生', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [149] = { name = '处决背德者', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [150] = { name = '憎恶半兽人之人', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [151] = { name = '野兽王部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },

        [152] = { name = '野兽中的野兽', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [153] = { name = '最强猎人', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },

        [154] = { name = '妖华的饰品', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [155] = { name = '库鲁茨的手爪', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [156] = { name = '猎人的武器', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },

        [157] = { name = '野兽王的陷阱', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [158] = { name = '吭吭部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' },
        [159] = { name = '吭吭的毛', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹1层' ,pos = { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = 4704, y = -2332, z = 4910 } },



        [160] = { name = '活尸之夜', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [161] = { name = '剧毒蜘蛛', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [162] = { name = '事已至此的骚乱', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [163] = { name = '守护不利之罪', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [164] = { name = '愤愤不平的半兽人', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [165] = { name = '碎渣宝物', task_type = '支线', task_type2 = '宝箱', map_name = '半兽人遗迹2层' },
        [166] = { name = '半兽人遗迹2层屠杀者', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [167] = { name = '可用的武器', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },
        [168] = { name = '消失的宝物', task_type = '支线', task_type2 = '打怪', map_name = '半兽人遗迹2层' },


        [169] = { name = '一丝不苟的门卫', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        [170] = { name = '沃玛的食材', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[171] = { name = '危险的家伙们', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[171] = { name = '危险的存在', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[172] = { name = '猛兽', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[173] = { name = '猛兽', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[174] = { name = '牛魔逃亡者', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[175] = { name = '牛魔追踪者', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[176] = { name = '奇怪的妖怪', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        --[177] = { name = '蘑菇妖怪', task_type = '支线', task_type2 = '打怪', map_name = '沃玛森林' },
        [171] = { name = '在沃玛森林采集', task_type = '支线', task_type2 = '采集', map_name = '沃玛森林' },
        [172] = { name = '在沃玛森林采矿', task_type = '支线', task_type2 = '采矿', map_name = '沃玛森林' },
        [173] = { name = '说书人的嘱托', task_type = '委托', task_type2 = '特殊', map_name = '隐藏的悬崖路' , move_pos = { cx = 6300, cy = 670, cz = 1729 }, gather_pos = { cx = 7630, cy = 3626, cz = 1811 } },


        --[169] = { name = '车道拉部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[170] = { name = '付宇部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[171] = { name = '真正的打手', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[172] = { name = '邪恶的法师', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[173] = { name = '乌洛部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[174] = { name = '库夏部下', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[175] = { name = '军长的权威', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },
        --[176] = { name = '被遗忘的征服者', task_type = '支线', task_type2 = '打怪', map_name = '【精英】半兽人遗迹2层' },

    },


    -- 采集任务
    GATHER_QUEST = {
        ['在银杏谷采集'] = '采集',
        ['在银杏谷采矿'] = '采矿',
        ['采集的乐趣'] = '采集',
        ['采矿的乐趣'] = '采矿',
        ['在比奇县采集'] = '采集',
        ['在比奇县采矿'] = '采矿',
        ['在沃玛森林采集'] = '采集',
        ['在沃玛森林采矿'] = '采矿',
        ['真气收集者'] = '真气',
        ['隐藏宝物'] = '宝箱',
        ['新力量源泉'] = '真气',
        ['某人的宝物'] = '宝箱',
        ['碎渣宝物'] = '宝箱',
    },
    WEITUO_GATHER_QUEST = {
        ['宝物的气息'] = '真气',
        ['勉强的工作'] = '采集',
        ['莫夜的宝物'] = '宝箱',
        ['底层人的隐情'] = '采矿'
    },

    SIDE_QUEST = {
        ['野外'] = {
            ['银杏谷'] = { '黑云耍威风', '清除有害植物', '饿鬼不速之客', '其他毒的材料', '张氏的嘱托', '维护银杏谷的治安', '解铃还须系铃人', '银杏谷屠杀者', '机动打击', '研究蛇妖族毒术', '打压蛇妖族气势' }, -- '采集的乐趣','在银杏谷采集','在银杏谷采矿'
            ['比奇城后巷'] = { '以眼还眼', '血的代价', '后巷痞子', '歹毒高利贷', '双门帮监视队长', '监视兵的痕迹', '以牙还牙', '比奇城后巷的屠杀者', '双门帮掠夺队长', '掠夺兵的宝物' },
            ['比奇县'] = { '掠夺强盗', '掌握犯人', '比奇县屠杀者', '善良地活着' }, -- '猛兽的证据', '调查通缉犯', '讨伐赤狼队'
            ['半兽古墓1层'] = { '寻找线索', '墓地看守人', '确认毒雾原因', '跟随生灵的团伙', '半兽古墓1层屠杀者', '消失的宝物' },
            ['半兽古墓2层'] = { '守护不利之罪', '血海深仇', '屠杀元凶', '半兽古墓2层屠杀者', '半兽人之力' },
            ['半兽人遗迹1层'] = { '恢复原状', '危险的巨大禽兽', '保护古迹', '半兽人之怒', '真正的盗墓贼', '半兽人遗迹1层屠杀者', '盗墓贼的隐情' }, --, '某人的宝物'
            ['半兽人遗迹2层'] = { '活尸之夜', '剧毒蜘蛛', '事已至此的骚乱', '愤愤不平的半兽人', '半兽人遗迹2层屠杀者', '消失的宝物', '可用的武器', '守护不利之罪' }, --'碎渣宝物',
            ['沃玛森林'] = { '一丝不苟的门卫', '沃玛的食材', '危险的家伙们', '危险的存在', '猛兽', '牛魔逃亡者', '牛魔追踪者', '奇怪的妖怪', '蘑菇妖怪' },
            ['牛魔神殿1层'] = { '屠杀元凶', '突变体牛魔族', '珍奇的甲胄', '钝化的武器', '材料商的嘱托', '红色沃玛战士', '沃玛战士训练兵', '武器商的嘱托', }, -- '红帽子'
            ['牛魔神殿2层'] = { '监视女人的家伙们', '结婚之日', '警卫兵的指令', '平息女人们的仇怨', '玄黑沃玛', '红色沃玛', '红色沃玛勇士', '苍蓝沃玛勇士', '玄黑沃玛勇士', '神殿管理员', '沃玛的魔力', '沃玛的印章', '沃玛之力' },
            ['牛魔神殿3层'] = { '突破牛魔神殿', '庞然大物', '巨型守护鬼看守人', '恶毒的猪妖群', '叛乱者', '猪妖监视官', '猪妖打手', '通往牛魔神的关口', '可疑地图', '调查可疑武器', '守护兵的指令', '粗糙的东西', '远古沃玛的痕迹', '猪妖叛乱军', '猪妖管理员' },
        },
        ['精英'] = {
            ['比奇城后巷'] = { '双门四天王1', '双门四天王2', '双门四天王3', '双门四天王4', '丹鹰的护卫部队', '朱千的护卫部队', '千秋风的护卫部队', '白健的护卫部队', '双门帮高手1', '双门帮高手2', '双门帮高手3', '双门帮高手4', '双门帮帮主', '毁灭侦察队', '毁灭守护队', '帮主信物', '双门帮侦察队长', '双门帮守护队长', '双门帮顶尖高手', },
            ['半兽古墓1层'] = { '玄黑半兽人佣兵队长', '玄黑半兽人长老', '佣兵队长部下们', '窟落部下们', '佣兵队长信物', '窟落信物', '玄黑半兽人驯兽师', '玄黑半兽人注视者', '玄黑部族长', '紫侃部下们', '焰鬼部下们', '紫侃信物', '焰鬼信物' },
            ['半兽古墓2层'] = { '黑焰族奴隶团长', '黑焰族执行者', '尤鲁侃部队', '哈侃部队', '奴隶团长的旗帜', '执行者的旗帜', '黑焰族邪灵魔', '黑焰族刽子手', '黑焰族族长', '马候部队', '拉侃部队', '邪灵魔的旗帜', '刽子手的旗帜', },
            ['半兽人遗迹1层'] = { '妖华追随者', '库鲁茨部下', '半兽人训练场', '女王的还生', '处决背德者', '憎恶半兽人之人', '妖华的饰品', '库鲁茨的手爪', '猎人的武器', '野兽王部下', '吭吭部下', '野兽中的野兽', '最强猎人', '野兽王的陷阱', '吭吭的毛' },
            ['半兽人遗迹2层'] = { '车道拉部下', '付宇部下', '真正的打手', '邪恶的法师', '车道拉的指令', '付宇的指令', '被抢走的铁矿石', '乌洛部下', '库夏部下', '军长的权威', '被遗忘的征服者', '乌洛的指令', '库夏的指令' },
            ['牛魔神殿1层'] = { '残忍的逃兵', '邪恶变节者', '流浪汉残兵', '逃兵头领', '变节者头领', '残兵头领', '诡秘的庭院', '黒师会的存在', '如门帮的存在', '黒师会团长' }, --, '如门帮团主'
            ['牛魔神殿2层'] = { '被占领的庭院', '被诅咒的亡灵', '邪法师的诅咒', '庭院破坏者', '被诅咒之人', '玄黑邪术师', '沃玛的秘密监牢', '游荡的冤魂', '灵魂收集家', '鬼城之恨', '亡灵支配者', '灵魂收集者', '鬼城之主' },
            ['牛魔神殿3层'] = { '可疑的厨师', '真实存在的食人群', '千夫长部下', '残忍的厨师', '食人魔队长', '千夫长', '阻挠登基仪式', '监牢看守人', '终极拷问', '牛鬼王部下', '牢头', '拷问专家', '牛鬼王' },
        },
        ['迷宫'] = {
            ['比奇迷宫1层'] = { '豚豚崽随从', '半兽人中副将随从', '半兽人大队长随从', '远古豚豚崽', '远古半兽人中副将', '远古半兽人大队长', '警卫兵的指令', '警戒兵的指令', '巡查队的指令', '半兽人大副将随从', '瓜德随从', '远古豚豚大副将', '半兽人大神将', '侦查兵的指令', '战斗兵的指令' },
            ['比奇迷宫2层'] = { '远古守卫队长', '远古走私队长', '远古打手队长', '远古狩猎队长', '守卫兵的宝物', '走私犯的宝物', '打手的宝物', '半兽人大神将', '猎人的宝物', '守护兵的宝物', '守卫队长随从', '走私队长随从', '打手队长随从', '狩猎队长随从', '守护队长随从', },
            ['比奇迷宫3层'] = { '恣睢队长随从', '盗墓队长随从', '掠夺队长随从', '恣睢队长', '盗墓队长', '掠夺队长', '追击队长随从', '精英半兽人群', '追击队长', '精英半兽人', },
            ['比奇迷宫4层'] = {},
            ['牛魔迷宫1层'] = { '沃玛魔兵随从', '沃玛法师随从', '秘密沃玛法师', '秘密沃玛魔兵', '警戒兵的指令', '警卫兵的指令', '传令人', '沃玛甲兵的随从', '沃玛士兵随从', '秘密沃玛甲兵', '秘密沃玛士兵', '巡查队的指令', '侦察兵的指令', '加勒达尔随从', '牛魔大神将', '战斗兵的指令' },
            ['牛魔迷宫2层'] = { '黑鬼团长随从', '白鬼团长随从', '秘密黑鬼团长', '秘密白鬼团长', '绿鬼团长随从', '黄鬼团长随从', '秘密绿鬼团长', '秘密黄鬼团长', '牛魔大神将', '琴高随从' },
            ['牛魔迷宫3层'] = { '铲除红鬼团', '铲除青鬼团', '红鬼团长', '青鬼团长', '铲除紫鬼团', '紫鬼团长', '铲除暗鬼团', '暗鬼团长', '铲除沃玛队', '沃玛队' },
            ['牛魔迷宫4层'] = {},
        },
    },
    WEITUO_QUEST = {
        ['银杏谷'] = { '巨型圆花', '勉强的工作', '宝物的气息', '临危的银杏谷', '为了出人头地', '狂人的痕迹', '长生不老材料', }, --'名胜渗透之毒',
        ['比奇城龙楼会'] = { '规定的礼物', '难忘的记忆', '底层人的隐情', '莫夜的宝物', '说书人的嘱托', }, --'酒是仇人',
        ['比奇城'] = { '比奇城通缉犯', '隐秘的调查1', '隐秘的调查2', '隐秘的调查3', '隐秘的调查4', '隐秘的调查5', },
        ['比奇县'] = {  },
        ['沃玛森林'] = {  },
    }

}

local this = quest_res
local quest_unit = quest_unit

--获取主线任务序号
function this.get_main_task_idx()
    local main_quest_idx = 0
    local main_quest_list = quest_res.MAIN_QUEST
    -- 主线任务名称
    local main_task_name = quest_unit.get_main_quest_name()
    for i = 1, #main_quest_list do
        if main_quest_list[i].name == main_task_name then
            main_quest_idx = i
            break
        end
    end

    return main_quest_idx, quest_unit.get_main_quest_idx()
end

-- 获取支线任务序号
function this.get_side_task_list()
    local idx1, idx2 = quest_res.get_main_task_idx()
    local list_idx = 0
    --13 - 18

    if false then
    elseif idx1 > 28 or (idx1 == 28 and idx2>=10) then
        list_idx = 173
    elseif idx1 > 23 or (idx1 == 23 and idx2>=15) then
        list_idx = 172
    elseif idx1 >= 20 then
        list_idx = 168
    elseif idx1 >= 19 then
        if actor_unit.char_combat_power() >= 18000 then
            list_idx = 159
        else
            list_idx = 156
        end
    elseif idx1 >= 17 then
        list_idx = 135
    elseif idx1 >= 15 then
        list_idx = 98
    elseif idx1 > 13 or (idx1 == 13 and idx2 >= 22) then
        list_idx = 59
    elseif idx1 > 13 or (idx1 == 13 and idx2 >= 20) then
        list_idx = 57
    elseif idx1 > 13 or (idx1 == 13 and idx2 >= 18) then
        list_idx = 56

    elseif idx1 >= 11 then
        list_idx = 22
    end
    local other_task = this.OTHER_QUEST
    local ret_t = {}
    for i = 1, list_idx do
        ret_t[i] = other_task[i]
    end

    return ret_t
end

function this.get_weituo_name_list()
    local main_quest_idx = 0

    local main_quest_list = quest_res.MAIN_QUEST
    -- 主线任务名称
    local main_task_name = quest_unit.get_main_quest_name()
    for i = 1, #main_quest_list do
        if main_quest_list[i].name == main_task_name then
            main_quest_idx = i
            break
        end
    end
    local side_quest_name_list = {}
    local side_quest_list = quest_res.WEITUO_QUEST
    if main_quest_idx >= 29 then
        local need_do_map = {
            '银杏谷',
            '比奇城龙楼会',
            '比奇城',
            '比奇县',
            '沃玛森林',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if _ == need_do_map[i] then
                    for j = 1, #v do
                        side_quest_name_list[v[j]] = true
                    end
                end
            end
        end
    elseif main_quest_idx >= 24 then

    elseif main_quest_idx >= 17 then
        local need_do_map = {
            '银杏谷',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if _ == need_do_map[i] then
                    for j = 1, #v do
                        side_quest_name_list[v[j]] = true
                    end
                end
            end
        end
    end
    return side_quest_name_list
end

function this.get_side_name_list()
    local main_quest_idx = 0

    local main_quest_list = quest_res.MAIN_QUEST
    -- 主线任务名称
    local main_task_name = quest_unit.get_main_quest_name()
    for i = 1, #main_quest_list do
        if main_quest_list[i].name == main_task_name then
            main_quest_idx = i
            break
        end
    end
    local side_quest_name_list = {}
    local side_quest_list = quest_res.SIDE_QUEST
    if main_quest_idx >= 30 then
        local need_do_map = {
            '银杏谷',
            '比奇城后巷',
            '比奇县',
            '半兽古墓1层',
            '半兽古墓2层',
            '半兽人遗迹1层',
            '半兽人遗迹2层',
            '比奇迷宫1层',
            '比奇迷宫2层',
            '沃玛森林',
            '牛魔神殿1层',
            --  '牛魔神殿2层',
            --     '牛魔神殿3层',
            '牛魔迷宫1层',
            --   '牛魔迷宫2层',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if v[need_do_map[i]] then
                    for j = 1, #v[need_do_map[i]] do
                        side_quest_name_list[v[need_do_map[i]][j]] = true
                    end
                end
            end
        end

    elseif main_quest_idx >= 24 then
        local need_do_map = {
            '银杏谷',
            '比奇城后巷',
            '比奇县',
            '半兽古墓1层',
            '半兽古墓2层',
            '半兽人遗迹1层',
            '半兽人遗迹2层',
            '比奇迷宫1层',
            '比奇迷宫2层',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if v[need_do_map[i]] then
                    for j = 1, #v[need_do_map[i]] do
                        side_quest_name_list[v[need_do_map[i]][j]] = true
                    end
                end
            end
        end
    elseif main_quest_idx >= 18 then
        local need_do_map = {
            '银杏谷',
            '比奇城后巷',
            '比奇县',
            '半兽古墓1层',
            '半兽古墓2层',
            --    '半兽人遗迹1层',
            --   '半兽人遗迹2层',
            '比奇迷宫1层',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if v[need_do_map[i]] then
                    for j = 1, #v[need_do_map[i]] do
                        side_quest_name_list[v[need_do_map[i]][j]] = true
                    end
                end
            end
        end
    elseif main_quest_idx >= 18 then
        local need_do_map = {
            '银杏谷',
            '比奇城后巷',
            '比奇县',
            '半兽古墓1层',

        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if v[need_do_map[i]] then
                    for j = 1, #v[need_do_map[i]] do
                        side_quest_name_list[v[need_do_map[i]][j]] = true
                    end
                end
            end
        end
    elseif main_quest_idx > 14 or (main_quest_idx == 14 and quest_unit.get_main_quest_idx() >= 18) then
        local need_do_map = {
            '银杏谷',
            '比奇城后巷',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if v[need_do_map[i]] then
                    for j = 1, #v[need_do_map[i]] do
                        side_quest_name_list[v[need_do_map[i]][j]] = true
                    end
                end
            end
        end
    elseif main_quest_idx >= 12 then
        local need_do_map = {
            '银杏谷',
        }
        for _, v in pairs(side_quest_list) do
            for i = 1, #need_do_map do
                if v[need_do_map[i]] then
                    for j = 1, #v[need_do_map[i]] do
                        side_quest_name_list[v[need_do_map[i]][j]] = true
                    end
                end
            end
        end
    end
    return side_quest_name_list
end

-------------------------------------------------------------------------------------
-- 返回对象
return quest_res

-------------------------------------------------------------------------------------