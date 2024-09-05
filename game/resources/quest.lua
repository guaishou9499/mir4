---@class quest_re
local quest_re = {}
local this = quest_re
------------------------------------------------------------------------------------
this.relation_list = {
    { { name = '血光半兽人角', t = 7, }, { name = '太初贤者', t = 9, s = 4 }, { name = '俏丽的莫夜师妹', t = 6, s = 5 }, { name = '半兽人的珍珠', t = 8, s = 8 } },-- 半兽人角笛
    --{ { name = '红药师的真面目', t = 7 }, { name = '比金子名贵的药材', t = 8 }, { name = '父亲的贪婪', t =  10 } }-- 白花金针
}
this.relation_pos_list = {
    { id = 50103, x = 21480+math.random(1,10)+math.random(), y = -26883+math.random(1,10)+math.random(), z = 1347+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 50104, x = 21480+math.random(1,10)+math.random(), y = -26883+math.random(1,10)+math.random(), z = 1347+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 50209, x = 14523+math.random(1,10)+math.random(), y = -13694+math.random(1,10)+math.random(), z = 3161+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 50407, x = 37+math.random(1,10)+math.random(), y = 4355+math.random(1,10)+math.random(), z = 642+math.random(1,10)+math.random(), map_id = 300140 },
    { id = 50408, x = 37+math.random(1,10)+math.random(), y = 4355+math.random(1,10)+math.random(), z = 642+math.random(1,10)+math.random(), map_id = 300140 },
}
this.collect_quest_list = {
    { id = 4090700, name = "植物", x = 8270+math.random(1,10)+math.random(), y = -254+math.random(1,10)+math.random(), z = 2055+math.random(1,10)+math.random(), map_id = 101003040, fx = 8383+math.random(1,10), fy = -7382+math.random(1,10), fz = 2330+math.random(1,10) },
    { id = 4090800, name = "植物", x = 1896+math.random(1,10)+math.random(), y = -1326+math.random(1,10)+math.random(), z = 1508+math.random(1,10)+math.random(), map_id = 101003040, fx = -4145+math.random(1,10), fy = -2819+math.random(1,10), fz = 1424+math.random(1,10) },
    { id = 4090400, name = "植物", x = -627+math.random(1,10)+math.random(), y = -924+math.random(1,10)+math.random(), z = 1399+math.random(1,10)+math.random(), map_id = 102004050, fx = -5278+math.random(1,10), fy = 78+math.random(1,10), fz = 2939+math.random(1,10) },
    { id = 1007025.0, name = '矿石', x = 0,res_id =201001301.0 },
    --
    { id = 2007027.0, name = '真气', res_id =401001501.0,x = 21480+math.random(1,10)+math.random(), y = -26883+math.random(1,10)+math.random(), z = 1347+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 1007028.0, name = '野草', x = 0  ,res_id =201001001.0},
    { id = 1007029.0, name = '矿石', x = 0 ,res_id =201001301.0 },
    { id = 101101800, name = '牢门', x = 0 },
    { id = 100000700, name = "岩窟花", x = 0 },
    { id = 100002480, name = "囚犯牢门", x = 0 },
    { id = 100002500, name = "铁窗牢门", x = 0 },
    { id = 100007900, name = "蛊疾草", x = 0 },
    --{ id = 101001000, name = "森林蘑菇", x = -1915+math.random(1,10)+math.random(), y = 20451+math.random(1,10)+math.random(), z = 2356+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 101001000, name = "森林蘑菇", x = 0 },
    { id = 101003270, name = "金银花", x = 0 },
    --{ id = 101004700, name = "千年果", x = 23345+math.random(1,10)+math.random(), y = -27826+math.random(1,10)+math.random(), z = 1826+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 101004700, name = "千年果", x = 0 },
    --res_id =201001301.0
--
    { id = 101013470, name = "矿石", x = 0,res_id =201001301 },
    { id = 101103400, name = "草", x = 0 },
    { id = 101103450, name = "草", x = 0 },
    { id = 101103500, name = "石门", x = 0 },
    { id = 101106300, name = "铁门", x = 0 },
    { id = 101106500, name = "石室门设备", x = 0 },
    { id = 102000700, name = "铁窗牢门", x = 0 },
    { id = 102000800, name = "铁窗牢门", x = 0 },
    { id = 102001600, name = "铁窗牢门", x = 0 },
    { id = 102100950, name = "尸体", x = 0 },
    { id = 102101010, name = "牢门", x = 0 },
    { id = 102101300, name = "沃玛尸体", x = 0 },
    { id = 102102600, name = "牢门", x = 0 },
    { id = 102102700, name = "牢门", x = 0 },
    { id = 102103800, name = "痕迹", x = 0 },
    { id = 102104060, name = "沃玛上将", x = 0 },
    { id = 102104150, name = "门", x = 0 },
    { id = 102104300, name = "箱子", x = 0 },
    { id = 103000300, name = "箱子", x = 0 },
    { id = 103001400, name = "很深的脚印", x = 0 },
    { id = 102003400, name = "陈旧的坛子", x = 0 },
    { id = 102003900, name = "杂物2", x = 0 },
    { id = 102004900, name = "铁门", x = 0 },
    { id = 102005800, name = "蕴含毒气的矿石", x = 0 },
    { id = 102006750, name = "半兽人的宝箱", x = 0,res_id =104004017.0 },
    { id = 102007400, name = "半兽人的宝箱", x = 0 ,res_id =104004009.0},
    { id = 102010280, name = "黑铁", x = 0 },
    { id = 4000200, name = "真气",res_id =401001501.0, x = 0 },
    { id = 4000300, name = "植物", x = 268+math.random(1,10)+math.random(), y = -2088+math.random(1,10)+math.random(), z = 3711+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 4000400, name = "石像", x = 1743+math.random(1,10)+math.random(), y = 15457+math.random(1,10)+math.random(), z = 2760+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 4000500, name = "真气",res_id =401001501.0, x = -18358+math.random(1,10)+math.random(), y = -7655+math.random(1,10)+math.random(), z = 4269+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 4100100, name = "宝箱", x = 0 },
    { id = 4100200, name = "矿石", x = 0 ,res_id =203001301.0 },
    { id = 4100300, name = "宝箱", x = 0 },
    { id = 4100400, name = "石像", x = 6595+math.random(1,10)+math.random(), y = 771+math.random(1,10)+math.random(), z = 1799+math.random(1,10)+math.random(), map_id = 101003040 },
    { id = 4100500, name = "植物", x = 6499+math.random(1,10)+math.random(), y = -4593+math.random(1,10)+math.random(), z = 580+math.random(1,10)+math.random(), map_id = 101004020 },
    { id = 4100600, name = "植物", x = -12767+math.random(1,10)+math.random(), y = -10870+math.random(1,10)+math.random(), z = 2417+math.random(1,10)+math.random(), map_id = 101004030 },
    { id = 4014100, name = "石像", x = -3186+math.random(1,10)+math.random(), y = -13820+math.random(1,10)+math.random(), z = -20212+math.random(1,10)+math.random(), map_id = 101003030 },
    { id = 4012300, name = "宝箱", x = 0 },
    { id = 4000600, name = "野草", x = 0  ,res_id =201001001.0},
    { id = 4000700, name = "植物", x = 9460+math.random(1,10)+math.random(), y = -6131+math.random(1,10)+math.random(), z = 4360+math.random(1,10)+math.random(), map_id = 101003010 },
    { id = 4010800, name = "矿石", x = 0 ,res_id =203001302.0 },
    { id = 4010900, name = "宝箱", x = 0 },
    { id = 4011800, name = "宝箱", x = 0 },
    { id = 4012000, name = "宝箱", x = 0 },
    { id = 4012500, name = "矿石", x = 0 ,res_id =201001301.0 },
    { id = 4012600, name = "矿石", x = 0 ,res_id =201001301.0 },
    { id = 4013100, name = "植物", x = 6162+math.random(1,10)+math.random(), y = -17632+math.random(1,10)+math.random(), z = -18411+math.random(1,10)+math.random(), map_id = 101003030 },
    { id = 4013200, name = "石像", x = -6720+math.random(1,10)+math.random(), y = -3304+math.random(1,10)+math.random(), z = 1971+math.random(1,10)+math.random(), map_id = 101004010 },
    { id = 4013300, name = "植物", x = -9108+math.random(1,10)+math.random(), y = -11861+math.random(1,10)+math.random(), z = 857+math.random(1,10)+math.random(), map_id = 101004010 },
    { id = 4013400, name = "石碑", x = -7116+math.random(1,10)+math.random(), y = -582+math.random(1,10)+math.random(), z = 3443+math.random(1,10)+math.random(), map_id = 101004030 },
    { id = 4013500, name = "石像", x = 5952+math.random(1,10)+math.random(), y = 9615+math.random(1,10)+math.random(), z = 3854+math.random(1,10)+math.random(), map_id = 101004040 },
    { id = 4013600, name = "植物", x = -8901+math.random(1,10)+math.random(), y = 1110+math.random(1,10)+math.random(), z = 1524+math.random(1,10)+math.random(), map_id = 101004040 },
    { id = 4013700, name = "植物", x = 383+math.random(1,10)+math.random(), y = -5669+math.random(1,10)+math.random(), z = 1958+math.random(1,10)+math.random(), map_id = 101004040 },
    { id = 4013800, name = "植物", x = 8051+math.random(1,10)+math.random(), y = -14820+math.random(1,10)+math.random(), z = 2967+math.random(1,10)+math.random(), map_id = 101004040 },
    { id = 4013900, name = "植物", x = 4931+math.random(1,10)+math.random(), y = 3514+math.random(1,10)+math.random(), z = 986+math.random(1,10)+math.random(), map_id = 101004020 },
    { id = 4014000, name = "石像", x = -287+math.random(1,10)+math.random(), y = -5375+math.random(1,10)+math.random(), z = 122+math.random(1,10)+math.random(), map_id = 101003020 },
    { id = 4014300, name = "石像", x = 0 },
    { id = 1007025, name = "矿石", x = 0 ,res_id =201001301.0 },
    { id = 1009015, name = "矿石", x = 0 ,res_id =203001301.0 },
    --res_id =203001301.0
    { id = 1007026, name = "野草", x = 0 ,res_id =201001001.0},
    { id = 1007028, name = "野草", x = 0 ,res_id =201001001.0},
    { id = 1009016, name = "野草", x = 0 ,res_id =203001001.0},

    { id = 1009017, name = "真气", x = 0 ,res_id =403001501.0},
    { id = 1009020, name = "野草", x = 0  ,res_id =203001001.0},
    { id = 1009021, name = "矿石", x = 0 ,res_id =203001301.0 },

    { id = 1009022, name = "宝箱", x = 0 },
    { id = 4012200, name = "宝箱", x = 0 },
    { id = 4032200, name = "石像", x = -3940+math.random(1,10)+math.random(), y = 859+math.random(1,10)+math.random(), z = 76+math.random(1,10)+math.random(), map_id = 103003040 },
    { id = 4032300, name = "真气",res_id =401001501.0, x = -3084+math.random(1,10)+math.random(), y = 7318+math.random(1,10)+math.random(), z = 76+math.random(1,10)+math.random(), map_id = 103003040 },
    { id = 4032400, name = "真气",res_id =401001501.0, x = -2694+math.random(1,10)+math.random(), y = -21271+math.random(1,10)+math.random(), z = 6093+math.random(1,10)+math.random(), map_id = 102003010 },
    { id = 4033200, name = "石像", x = -18713+math.random(1,10)+math.random(), y = -18617+math.random(1,10)+math.random(), z = 4737+math.random(1,10)+math.random(), map_id = 102003010 },
    { id = 1009023, name = "真气", res_id =403001501.0,x = 0 },
    { id = 1010015, name = "宝箱", x = 0 },
    { id = 1012016, name = "宝箱", x = 0 },
    { id = 1011014, name = "宝箱", x = 0 },
    { id = 1013018, name = "宝箱", x = 0 },
    { id = 1013018, name = "宝箱", x = 0 },
    --res_id =203001302.0
    { id = 1019025, name = "矿石", x = 0 ,res_id =201001301.0 },
    { id = 1019026, name = "野草", x = 0 ,res_id =201001001.0},
    { id = 4031100, name = "植物", x = -15079+math.random(1,10)+math.random(), y = -9554+math.random(1,10)+math.random(), z = 4740+math.random(1,10)+math.random(), map_id = 102003010 },
    { id = 4031300, name = "石墓", x = -8352+math.random(1,10)+math.random(), y = 5176+math.random(1,10)+math.random(), z = 290+math.random(1,10)+math.random(), map_id = 102004040 },
    { id = 4031700, name = "植物", x = -2700+math.random(1,10)+math.random(), y = 5948+math.random(1,10)+math.random(), z = -808+math.random(1,10)+math.random(), map_id = 102004010 },
    { id = 4031800, name = "石碑", x = 0 },
    { id = 4031900, name = "石碑", x = 9308+math.random(1,10)+math.random(), y = -1965+math.random(1,10)+math.random(), z = 169+math.random(1,10)+math.random(), map_id = 102004070 },
    { id = 4032000, name = "石像", x = 22659+math.random(1,10)+math.random(), y = 18883+math.random(1,10)+math.random(), z = -128+math.random(1,10)+math.random(), map_id = 102004070 },
    { id = 4090100, name = "植物", x = -29769+math.random(1,10)+math.random(), y = -17818+math.random(1,10)+math.random(), z = -18860+math.random(1,10)+math.random(), map_id = 101003030 },
    -------------------------------------
   -- [68] = { id = 100002300, name = "通道", x = 0 },
   -- [69] = { id = 101003310, name = "制造高级防具", x = 0 },
   -- [70] = { id = 101011850, name = "强化装备", x = 0 },
   -- [71] = { id = 101013490, name = "制造高级武器", x = 0 },
}



------------------------------------------------------------------------------------
function quest_re.__tostring()
    return "mir4 pet package"
end

quest_re.__index = quest_re

function quest_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, quest_re)
end

return quest_re:new()