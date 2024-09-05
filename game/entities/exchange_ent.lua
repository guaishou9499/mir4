------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
--- @author:   zengluolu
--- @email:    1819@qq.com
--- @date:     2023-10-16
--- @module:   exchange_ent
--- @describe: 通用模块
--- @version:  v1.0
------------------------------------------------------------------------------------
local VERSION = '20231016' -- version history at end of file
local AUTHOR_NOTE = '-[20231016]-'
-- 模块定义
---@class exchange_ent
local exchange_ent = {
    -- 模块版本 (主版本.次版本.修订版本)
    VERSION = VERSION,
    -- 作者备注 (更新日期 - 更新内容简述)
    AUTHOR_NOTE = AUTHOR_NOTE,
    -- 模块名称
    MODULE_NAME = 'exchange_ent module',
    -- 只读模式
    READ_ONLY = false,
}

-- 实例对象
local this = exchange_ent
-- 日志模块
local trace = trace
-- 决策模块
local decider = decider
local auction_unit = auction_unit
local actor_unit = actor_unit
local great_unit = great_unit
local great_ctx = great_ctx
---@type item_ent
local item_ent = import('game/entities/item_ent')

------------------------------------------------------------------------------------
-- [事件] 预载函数(重载脚本)
------------------------------------------------------------------------------------
function exchange_ent.super_preload()

end

---结算
function exchange_ent.settlement()
    auction_unit.refresh_sell_item()--刷新出售物品
    decider.sleep(2000)
    local num = auction_unit.get_auction_sell_num()--出售物品总数量
    for i = 0, num - 1 do
        if auction_unit.can_settlement(i) and auction_unit.get_item_sell_status(i) == 3 then
            trace.output('[拍卖行] - 正在结算中...')
            auction_unit.settlement()-- 结算
            decider.sleep(2000)
        end
    end
end

-- 下架
function exchange_ent.cancel_sell()
    local total = auction_unit.get_auction_sell_num()-- 出售物品数量
    for j = 0, total - 1 do
        if auction_unit.get_item_sell_status(j) == -1 then
            local id = auction_unit.get_sell_id(j)
            auction_unit.cancel_sell(id)
            decider.sleep(2000)
        end
    end
end

-- 自动上架物品
function exchange_ent.auto_exchange_item(money)
    money = money or 10
    local exchange_item_list = {
        ['高级药草叶'] = { num = 5000, id = 0x35B5B247 },
        ['高级灵芝'] = { num = 3000, id = 0x35B5B2AB },
        ['高级药草根'] = { num = 5000, id = 0x35B5B30F },
        ['药草叶'] = { num = 100000, id = 0x35B5B246 },
        ['灵芝'] = { num = 100000, id = 0x35B5B2AA },
        ['药草根'] = { num = 100000, id = 0x35B5B30E },
        ['高级钢铁'] = { num = 99999, id = 0x35C4F4EA },
    }

    for name, info in pairs(exchange_item_list) do
        local total = auction_unit.get_auction_sell_num()-- 出售物品数量
        if total >= 30 then
            break
        end
        local item_info = item_ent.get_not_bind_item_info_by_name(name)
        if not table.is_empty(item_info) and item_info.num >= info.num then
            --刷新出售物品
            auction_unit.refresh_sell_item()
            decider.sleep(1500)

            local price = this.get_exchange_item_price_by_name(name)-- 单价
            local price_t = math.floor(price * item_info.num)
            if price_t >= money and actor_unit.get_cost_data(2) >= money * 10 then
                auction_unit.sell_item(item_info.sys_id, item_info.num, price_t)-- 上架
                decider.sleep(2000)
                trace.output(string.format('[拍卖行] - 上架[%s]数量[%s]价格[%s]', name, item_info.num, price_t))
            end
        end
    end
    this.settlement()-- 结算
end

------------------------------------------------------------------------------------
---获取上架物品最低单价
function this.get_exchange_item_price_by_name(name)
    local exchange_item_list = {
        ['高级药草叶'] = { num = 5000, id = 0x35B5B247 },
        ['高级灵芝'] = { num = 3000, id = 0x35B5B2AB },
        ['高级药草根'] = { num = 5000, id = 0x35B5B30F },
        ['药草叶'] = { num = 100000, id = 0x35B5B246 },
        ['灵芝'] = { num = 100000, id = 0x35B5B2AA },
        ['药草根'] = { num = 100000, id = 0x35B5B30E },
        ['高级钢铁'] = { num = 99999, id = 0x35C4F4EA },
    }
    local auction_obj = auction_unit:new()
    local item_id = exchange_item_list[name].id

    auction_unit.refresh_item_detail(item_id)
    decider.sleep(1500)
    local item_list = auction_unit.item_list()
    local price_list = {}
    for i = 1, #item_list do
        local obj = item_list[i]
        if auction_obj:init(obj, true) then
            local price = auction_obj:price() / auction_obj:num()
            table.insert(price_list, { price = price })
        end
    end
    auction_obj:delete()
    if #price_list > 1 then
        table.sort(price_list, function(a, b)
            return a.price < b.price
        end)
    end
    local price = 0
    if #price_list >= 1 then
        price = price_list[1].price
    end
    return price
end


------------------------------------------------------------------------------------
-- [内部] 将对象转换为字符串
--
-- @local
-- @treturn      string                     模块名称
------------------------------------------------------------------------------------
function exchange_ent.__tostring()
    return this.MODULE_NAME
end

------------------------------------------------------------------------------------
-- [内部] 防止动态修改(this.READ_ONLY值控制)
--
-- @local
-- @tparam       table     t                被修改的表
-- @tparam       any       k                要修改的键
-- @tparam       any       v                要修改的值
------------------------------------------------------------------------------------
function exchange_ent.__newindex(t, k, v)
    if this.READ_ONLY then
        error('attempt to modify read-only table')
        return
    end
    rawset(t, k, v)
end

------------------------------------------------------------------------------------
-- [内部] 设置item的__index元方法指向自身
--
-- @local
------------------------------------------------------------------------------------
exchange_ent.__index = exchange_ent

------------------------------------------------------------------------------------
-- [构造] 创建一个新的实例
--
-- @local
-- @tparam       table     args             可选参数，用于初始化新实例
-- @treturn      table                      新创建的实例
------------------------------------------------------------------------------------
function exchange_ent:new(args)
    local new = {}
    -- 预载函数(重载脚本时)
    if this.super_preload then
        this.super_preload()
    end
    -- 将args中的键值对复制到新实例中
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    -- 设置元表
    return setmetatable(new, exchange_ent)
end

-------------------------------------------------------------------------------------
-- 返回实例对象
-------------------------------------------------------------------------------------
return exchange_ent:new()

-------------------------------------------------------------------------------------
