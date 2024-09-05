local monster = { x= 0 , y = 0 }
local player = {x = 0 , y = 1}
local p = math.sqrt((player.x- monster.x) * (player.x - monster.x) + (player.y - monster.y) * (player.y - monster.y))
local degree = math.atan((player.y - monster.y)/(player.x - monster.x))
print(p)

print(math.deg(degree))