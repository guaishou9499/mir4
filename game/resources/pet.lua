---@class pet_re
local pet_re = {}
local this = pet_re

------------------------------------------------------------------------------------
this.grant_item_list = { '冤灵玄黑花', '被诅咒的玄黑花' }
this.gather_pet_list = {
    { name = '兔子道士聪聪', gather = 5, mining = 5 },
    { name = '绿林天使花冠', gather = 10, mining = 10 },
}
this.no_gather_item_green = { '古老的千年果果实', '嗜魂镐头', '褪色的竹笛', '冤魂的结晶残片', '无尽的天星甲', '魔教修炼书', '摧毁结晶残片', '褪色的白虎珠', '猪雕像', '魔力结晶残片', '蛇妖族长的逆鳞', '褪色的玄武珠', '无尽的赤月魔剑', '触龙神皮', '生灵的符咒', '' }
this.no_gather_item_blue = { '穷豚的磨刀石', '元圣的太极牌', '紫青铃', '摧毁结晶石', '雷铃', '风镐', '活力结晶石', '百年貂鼠的如意珠', '竹笛', '玄武珠', '冤魂的结晶石', '魔教秘籍', '无圣的赤月魔剑', '冤灵符咒', '千年果果实', '威龙神皮', '花猪雕像', '蛇妖女王的逆鳞', '魔力结晶石', '白虎珠', '半兽人突击队长的角笛', '苍穹之愿' }
this.pet_item_num ={ ['红色'] = 3, ['蓝色'] = 2, ['绿色'] = 1 }
this.pet_list = {
    { name = '小青龙浩龙', power = 1440, num = 2},
    { name = '兔子道士聪聪', power = 270, num = 1 },
    { name = '犬大人旺旺萌', power = 270, num = 1 },
    { name = '烛火小灯笼', power = 310, num = 1 },
    { name = '变脸师叉叉', power = 270, num = 1 },
    { name = '青海鬼王丹丹', power = 230, num = 1 },
    { name = '短铁甲忠将翼德', power = 230, num = 1 },
    { name = '乌龙先生牛牛', power = 310, num = 1 },
    { name = '火恶魔火牛角', power = 3750, num = 3 },
    { name = '夜光宝石花螳螂', power = 3656, num = 3 },
    { name = '绿林天使花冠', power = 1500, num = 2 },
    { name = '金翅鸟伽楼罗', power = 4450, num = 3 },
    { name = '倾国之色维也纳', power = 3460, num = 3 },
    { name = '白花孔雀明庆', power = 4050, num = 3 },
    { name = '福喵胖胖', power = 3834, num = 3 },
    { name = '宝石爱好者小小', power = 3830, num = 3 },
    { name = '刺客喵喵郎', power = 3364, num = 3 },
    { name = '雷怪兽巴拉坦', power = 4360, num = 3 },
    { name = '火恶魔火牛角', power = 3750, num = 3 },
    { name = '灵魂收割者黑阎罗', power = 4420, num = 3 },
    { name = '火焰妖魔飞妖狐', power = 3570, num = 3 },
    { name = '邪茨霸王坤', power = 3622, num = 3 },
    { name = '野蛮斗士恋歌', power = 3440, num = 3 },
    { name = '光明龙传奇', power = 4200, num = 3 },
    { name = '春之传令姚菲', power = 4330, num = 3 },
    { name = '青明阿卡', power = 1560, num = 2 },
    { name = '吃货猪豕豕', power = 1500, num = 2 },
    { name = '无双突击海奉先', power = 1500, num = 2 },
    { name = '吸血蝙蝠吸吸', power = 1640, num = 2 },
    { name = '千年狐狸阳阳', power = 1440, num = 2 },
    { name = '三尾狐雪兰', power = 1600, num = 2 },
    { name = '追魂使者油灯', power = 1600, num = 2 },
    { name = '红狼汪汪', power = 1500, num = 2 },
    { name = '金翅雀萌萌', power = 1600, num = 2 },
    { name = '蛮横道人塔坤', power = 1600, num = 2 },
    { name = '黑邪尊毛思罗', power = 310, num = 1 },
    { name = '武神猫头云长', power = 270, num = 1 },
    { name = '天尊喵特昂', power = 270, num = 1 },
    { name = '河马法师波优波优', power = 230, num = 1 }
}

------------------------------------------------------------------------------------
function pet_re.__tostring()
    return "mir4 pet package"
end

pet_re.__index = pet_re

function pet_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, pet_re)
end

return pet_re:new()