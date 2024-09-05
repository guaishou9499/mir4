---@class guaji_re
local guaji_re = {}
local this = guaji_re
------------------------------------------------------------------------------------
this.gj_map_info = {
    { x = -6490+math.random(1,5)+math.random(), y = -85+math.random(1,5)+math.random(), z = -83+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -17046+math.random(1,5)+math.random(), y = -14752+math.random(1,5)+math.random(), z = 1144+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = -8373+math.random(1,5)+math.random(), y = 4091+math.random(1,5)+math.random(), z = 224+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 138+math.random(1,5)+math.random(), y = 4848+math.random(1,5)+math.random(), z = 224+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 6774+math.random(1,5)+math.random(), y = 12228+math.random(1,5)+math.random(), z = 230+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 15357+math.random(1,5)+math.random(), y = 14525+math.random(1,5)+math.random(), z = 522+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 9221+math.random(1,5)+math.random(), y = -5574+math.random(1,5)+math.random(), z = 725+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = -6490+math.random(1,5)+math.random(), y = -85+math.random(1,5)+math.random(), z = -83+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -5063+math.random(1,5)+math.random(), y = -10046+math.random(1,5)+math.random(), z = 379+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = 4739+math.random(1,5)+math.random(), y = -10247+math.random(1,5)+math.random(), z = 380+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = 5299+math.random(1,5)+math.random(), y = 141+math.random(1,5)+math.random(), z = -106+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = 6125+math.random(1,5)+math.random(), y = 9561+math.random(1,5)+math.random(), z = 374+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -5077+math.random(1,5)+math.random(), y = 10055+math.random(1,5)+math.random(), z = 376+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -4748+math.random(1,5)+math.random(), y = 3+math.random(1,5)+math.random(), z = 377+math.random(1,5)+math.random(), map_id = 201520066 },--比奇迷宫密道3-3
    { x = 4148+math.random(1,5)+math.random(), y = -365+math.random(1,5)+math.random(), z = -103+math.random(1,5)+math.random(), map_id = 201520066 },--比奇迷宫密道3-3
    { x = 12407+math.random(1,5)+math.random(), y = -150+math.random(1,5)+math.random(), z = 391+math.random(1,5)+math.random(), map_id = 201520066 },--比奇迷宫密道3-3
    { x = -8953+math.random(1,5)+math.random(), y = 3663+math.random(1,5)+math.random(), z = -137+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = -6648+math.random(1,5)+math.random(), y = -3888+math.random(1,5)+math.random(), z = 391+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = 2616+math.random(1,5)+math.random(), y = -4130+math.random(1,5)+math.random(), z = -135+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = 1817+math.random(1,5)+math.random(), y = 4839+math.random(1,5)+math.random(), z = 340+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = 8509+math.random(1,5)+math.random(), y = 5546+math.random(1,5)+math.random(), z = -131+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2

    { x = -17046+math.random(1,5)+math.random(), y = -14752+math.random(1,5)+math.random(), z = 1144+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = -8373+math.random(1,5)+math.random(), y = 4091+math.random(1,5)+math.random(), z = 224+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 138+math.random(1,5)+math.random(), y = 4848+math.random(1,5)+math.random(), z = 224+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 6774+math.random(1,5)+math.random(), y = 12228+math.random(1,5)+math.random(), z = 230+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 15357+math.random(1,5)+math.random(), y = 14525+math.random(1,5)+math.random(), z = 522+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = 9221+math.random(1,5)+math.random(), y = -5574+math.random(1,5)+math.random(), z = 725+math.random(1,5)+math.random(), map_id = 10012 },--比奇迷宫3层
    { x = -6490+math.random(1,5)+math.random(), y = -85+math.random(1,5)+math.random(), z = -83+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -5063+math.random(1,5)+math.random(), y = -10046+math.random(1,5)+math.random(), z = 379+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = 4739+math.random(1,5)+math.random(), y = -10247+math.random(1,5)+math.random(), z = 380+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = 5299+math.random(1,5)+math.random(), y = 141+math.random(1,5)+math.random(), z = -106+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = 6125+math.random(1,5)+math.random(), y = 9561+math.random(1,5)+math.random(), z = 374+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -5077+math.random(1,5)+math.random(), y = 10055+math.random(1,5)+math.random(), z = 376+math.random(1,5)+math.random(), map_id = 201520064 },--比奇迷宫密道3-1
    { x = -4748+math.random(1,5)+math.random(), y = 3+math.random(1,5)+math.random(), z = 377+math.random(1,5)+math.random(), map_id = 201520066 },--比奇迷宫密道3-3
    { x = 4148+math.random(1,5)+math.random(), y = -365+math.random(1,5)+math.random(), z = -103+math.random(1,5)+math.random(), map_id = 201520066 },--比奇迷宫密道3-3
    { x = 12407+math.random(1,5)+math.random(), y = -150+math.random(1,5)+math.random(), z = 391+math.random(1,5)+math.random(), map_id = 201520066 },--比奇迷宫密道3-3
    { x = -8953+math.random(1,5)+math.random(), y = 3663+math.random(1,5)+math.random(), z = -137+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = -6648+math.random(1,5)+math.random(), y = -3888+math.random(1,5)+math.random(), z = 391+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = 2616+math.random(1,5)+math.random(), y = -4130+math.random(1,5)+math.random(), z = -135+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = 1817+math.random(1,5)+math.random(), y = 4839+math.random(1,5)+math.random(), z = 340+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
    { x = 8509+math.random(1,5)+math.random(), y = 5546+math.random(1,5)+math.random(), z = -131+math.random(1,5)+math.random(), map_id = 201520065 },--比奇迷宫密道3-2
}
this.gj_map_info_ex = {

    { x = -17014.935546875+math.random(1,10), y = -14587.51953125+math.random(1,10), z = 1144.4641113281, map_id = 10012.0 },--比奇迷宫3层
    { x = -16565.142578125+math.random(1,10), y = -4401.923828125+math.random(1,10), z = 706.64739990234, map_id = 10012.0 },--比奇迷宫3层
    { x = -16301.688476562+math.random(1,10), y = 15158.99609375+math.random(1,10), z = 1473.8387451172, map_id = 10012.0 },--比奇迷宫3层
    { x = -7739.6767578125+math.random(1,10), y = 14500.37890625+math.random(1,10), z = 1035.2412109375, map_id = 10012.0 },--比奇迷宫3层
    { x = -8464.15625+math.random(1,10), y = 5016.294921875+math.random(1,10), z = 224.36149597168, map_id = 10012.0 },--比奇迷宫3层
    { x = -8003.1201171875+math.random(1,10), y = -7826.7333984375+math.random(1,10), z = 721.13775634766, map_id = 10012.0 },--比奇迷宫3层
    { x = -8294.2138671875+math.random(1,10), y = -17174.25+math.random(1,10), z = 1072.0609130859, map_id = 10012.0 },--比奇迷宫3层
    { x = 216.22265625+math.random(1,10), y = -13330.959960938+math.random(1,10), z = 660.54193115234, map_id = 10012.0 },--比奇迷宫3层
    { x = 427.169921875+math.random(1,10), y = -5719.16015625+math.random(1,10), z = 243.63175964355, map_id = 10012.0 },--比奇迷宫3层
    { x = 291.82543945312+math.random(1,10), y = 5510.6376953125+math.random(1,10), z = 224.33424377441, map_id = 10012.0 },--比奇迷宫3层
    { x = -49.107513427734+math.random(1,10), y = 13138.865234375+math.random(1,10), z = 632.94427490234, map_id = 10012.0 },--比奇迷宫3层
    { x = 6881.615234375+math.random(1,10), y = 13117.27734375+math.random(1,10), z = 228.91746520996, map_id = 10012.0 },--比奇迷宫3层
    { x = 15893.932617188+math.random(1,10), y = 15613.448242188+math.random(1,10), z = 522.63177490234, map_id = 10012.0 },--比奇迷宫3层
    { x = 14785.01953125+math.random(1,10), y = 4818.712890625+math.random(1,10), z = 224.18432617188, map_id = 10012.0 },--比奇迷宫3层
    { x = 9252.63671875+math.random(1,10), y = -5060.54296875+math.random(1,10), z = 725.8662109375, map_id = 10012.0 },--比奇迷宫3层
    { x = 17419.49609375+math.random(1,10), y = -14347.0390625+math.random(1,10), z = 2052.0148925781, map_id = 10012.0 },--比奇迷宫3层
    { x = 6616.0224609375+math.random(1,10), y = -14035.900390625+math.random(1,10), z = 3464.5927734375, map_id = 10012.0 },--比奇迷宫3层
    { x = 10310.168945312+math.random(1,10), y = -15807.55859375+math.random(1,10), z = 3464.5927734375, map_id = 10012.0 },--比奇迷宫3层
    { x = -8068.98046875+math.random(1,10), y = -17047.37109375+math.random(1,10), z = 1072.3370361328, map_id = 10011.0 },--比奇迷宫3层
    { x = -99.71484375+math.random(1,10), y = 4950.435546875+math.random(1,10), z = 224.34155273438, map_id = 10011.0 },--比奇迷宫3层

    { x = -17014.935546875+math.random(1,10), y = -14587.51953125+math.random(1,10), z = 1144.4641113281, map_id = 10012.0 },--比奇迷宫3层
    { x = -16565.142578125+math.random(1,10), y = -4401.923828125+math.random(1,10), z = 706.64739990234, map_id = 10012.0 },--比奇迷宫3层
    { x = -16301.688476562+math.random(1,10), y = 15158.99609375+math.random(1,10), z = 1473.8387451172, map_id = 10012.0 },--比奇迷宫3层
    { x = -7739.6767578125+math.random(1,10), y = 14500.37890625+math.random(1,10), z = 1035.2412109375, map_id = 10012.0 },--比奇迷宫3层
    { x = -8464.15625+math.random(1,10), y = 5016.294921875+math.random(1,10), z = 224.36149597168, map_id = 10012.0 },--比奇迷宫3层
    { x = -8003.1201171875+math.random(1,10), y = -7826.7333984375+math.random(1,10), z = 721.13775634766, map_id = 10012.0 },--比奇迷宫3层
    { x = -8294.2138671875+math.random(1,10), y = -17174.25+math.random(1,10), z = 1072.0609130859, map_id = 10012.0 },--比奇迷宫3层
    { x = 216.22265625+math.random(1,10), y = -13330.959960938+math.random(1,10), z = 660.54193115234, map_id = 10012.0 },--比奇迷宫3层
    { x = 427.169921875+math.random(1,10), y = -5719.16015625+math.random(1,10), z = 243.63175964355, map_id = 10012.0 },--比奇迷宫3层
    { x = 291.82543945312+math.random(1,10), y = 5510.6376953125+math.random(1,10), z = 224.33424377441, map_id = 10012.0 },--比奇迷宫3层
    { x = -49.107513427734+math.random(1,10), y = 13138.865234375+math.random(1,10), z = 632.94427490234, map_id = 10012.0 },--比奇迷宫3层
    { x = 6881.615234375+math.random(1,10), y = 13117.27734375+math.random(1,10), z = 228.91746520996, map_id = 10012.0 },--比奇迷宫3层
    { x = 15893.932617188+math.random(1,10), y = 15613.448242188+math.random(1,10), z = 522.63177490234, map_id = 10012.0 },--比奇迷宫3层
    { x = 14785.01953125+math.random(1,10), y = 4818.712890625+math.random(1,10), z = 224.18432617188, map_id = 10012.0 },--比奇迷宫3层
    { x = 9252.63671875+math.random(1,10), y = -5060.54296875+math.random(1,10), z = 725.8662109375, map_id = 10012.0 },--比奇迷宫3层
    { x = 17419.49609375+math.random(1,10), y = -14347.0390625+math.random(1,10), z = 2052.0148925781, map_id = 10012.0 },--比奇迷宫3层
    { x = 6616.0224609375+math.random(1,10), y = -14035.900390625+math.random(1,10), z = 3464.5927734375, map_id = 10012.0 },--比奇迷宫3层
    { x = 10310.168945312+math.random(1,10), y = -15807.55859375+math.random(1,10), z = 3464.5927734375, map_id = 10012.0 },--比奇迷宫3层
    { x = -8068.98046875+math.random(1,10), y = -17047.37109375+math.random(1,10), z = 1072.3370361328, map_id = 10011.0 },--比奇迷宫3层
    { x = -99.71484375+math.random(1,10), y = 4950.435546875+math.random(1,10), z = 224.34155273438, map_id = 10011.0 },--比奇迷宫3层

}
--{ -13412.752929688, -7458.6372070312, 137.19328308105, 10020.0 },--牛魔迷宫1层
--{ -4189.0, -17232.5390625, 1119.7380371094, 10020.0, 10020.0 },--牛魔迷宫1层
--{ -15248.959960938, -16823.193359375, 682.89495849609, 10020.0 },--牛魔迷宫1层
--{ -3935.4086914062, -8735.2138671875, 701.44262695312, 10020.0 },--牛魔迷宫1层
--{ 5710.7153320312, -7815.3046875, 119.05313873291, 10020.0 },--牛魔迷宫1层
--{ 14689.30078125, -8079.1943359375, 682.89416503906, 10020.0 },--牛魔迷宫1层
--{ 15306.0546875, -16639.787109375, 1086.6434326172, 10020.0 },--牛魔迷宫1层
--{ 14286.901367188, 152.21365356445, 122.2772064209, 10020.0 },--牛魔迷宫1层
--{ 6085.42578125, 615.974609375, 695.06878662109, 10020.0 },--牛魔迷宫1层
--{ 6261.9643554688, 7932.8764648438, 683.60003662109, 10020.0 },--牛魔迷宫1层
--{ 17216.0390625, 7860.759765625, 1143.1676025391, 10020.0 },--牛魔迷宫1层
--{ -3069.35546875, -108.5, 695.06878662109, 10020.0 },--牛魔迷宫1层
--{ -13594.79296875, 230.70742797852, 122.2772064209, 10020.0 },--牛魔迷宫1层
--{ -2914.1000976562, 8093.177734375, 1143.1677246094, 10020.0 },--牛魔迷宫1层
--{ -13212.048828125, 7531.455078125, 683.60003662109, 10020.0 },--牛魔迷宫1层
--{ -15056.18359375, 16554.5, 1143.1673583984, 10020.0 },--牛魔迷宫1层
--{ 3410.0017089844, 15678.43359375, 1143.1676025391, 10020.0 },--牛魔迷宫1层

------------------------------------------------------------------------------------
function guaji_re.__tostring()
    return "mir4 pet package"
end

guaji_re.__index = guaji_re

function guaji_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, guaji_re)
end

return guaji_re:new()