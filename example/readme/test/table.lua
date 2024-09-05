local map = {
    ["比奇城"] = {
        ["比奇城郊外"] = 200,
        ["桃花村"] = 201,
    },
}
--local map = { 中国 = 1, 美国 = 2}
--
--print(map.中国)

--指定值是否在列表中 key用t[key] ~= nil 直接判断
function is_in_array(t, val)
    for k, v in pairs(t) do
        if v == val then
            return true, k
        end
    end
    return false
end

for k, v in pairs(map) do
    print(is_in_array(v, 200))
end