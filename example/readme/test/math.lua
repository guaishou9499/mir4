--获取指定位数的小数 向上或向下取整
function get_precise_decimal(value, multiple, cut)
    local n = math.pow(10, multiple)
    if not cut then
        return math.floor(value * n + 1) / n
    else
        return math.floor(value * n) / n
    end
end

print(get_precise_decimal(1.549, 2, false))
os.execute("pause")
--print("continue...")

--整除
local a = 10
local b = 3
print(a // b)

--考虑一个算法 一个列表 按一定的数量取出某数的整数倍个数的列表
--package.path = ";../base/?.lua"
--require("global")


function print_t(tbl, level, filteDefault)
    local msg = ""
    filteDefault = filteDefault or true --默认过滤关键字（DeleteMe, _class_type）
    level = level or 1
    local indent_str = ""
    for i = 1, level do
        indent_str = indent_str .. "  "
    end

    print(indent_str .. "{")
    for k, v in pairs(tbl) do
        if filteDefault then
            if k ~= "_class_type" and k ~= "DeleteMe" then
                local item_str = string.format("%s%s = %s", indent_str .. " ", tostring(k), tostring(v))
                print(item_str)
                if type(v) == "table" then
                    PrintTable(v, level + 1)
                end
            end
        else
            local item_str = string.format("%s%s = %s", indent_str .. " ", tostring(k), tostring(v))
            print(item_str)
            if type(v) == "table" then
                PrintTable(v, level + 1)
            end
        end
    end
    print(indent_str .. "}")
end

local list_sys_id = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
for i = 1, #list_sys_id // 3 do
    local result = {}
    for j = 1, 3 do
        table.insert(result, list_sys_id[(i - 1) * 3 + j])
    end
    print(print_t(result))
end