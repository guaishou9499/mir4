main程序
+ 加载挖矿配置
+ 加载护卫设置
+ 设置游戏自动重启 main_ctx:auto_restart(true)
+ 根据配置设置是否黑屏
+ 


主线任务
对话 1003 1001
打怪 4  0   
技能 2501
1003 技能 体质 对话界面
+ 玩家等级判定药品使用等级，购买对应药品 
+ 设置置技能频率
+ 关闭反击功能
+ 载入主线配置信息
+ 设置用药数值比例
+ 跳过主线中的对话、视频及教学
+ 检测游戏掉线
+ 处理特殊类型任务：采集、瞬移、执行函数、关闭窗口、重启自动任务、支线任务
+ 自动完成常规任务
  + 如果有异常，需要及时处理，包括重启游戏
+ 在魔方秘境挂机升级至40级

主角状态：
2 停止
4 跑动
11 战斗
12 战斗
14 采集
20 危险的救援计划 8.前往狭窄的通道
24 瞬移
27 飞行
当主角 不在非战斗状态 或者 状态为停止 时 重置 监测卡位次数


游戏状态：
5 正常游戏状态

宠物思路:
+ 建立宠物的列表,能力从高到低排列
+ 辅助函数:按名字获取在宠物列表中的序号 按名字获取宠物信息 按名字判断宠物已经出战
+ 主函数:
  + 根据等级,给出出战位数量
  + 生成宠物的对象
  + 按宠物列表循环
    + 如果游戏终止,则退出循环
    + 根据名字获取宠物的信息 和 是否出战
    + 如果 未出战 且 (宠物已解锁 或 可召唤) = 取出可以召唤和出战的宠物,不包括已出战的
      + 按宠物出战位循环
        + 生成当前出战位的宠物对象 获取出战宠物的名字以及在列表中的序号
        + 如果当前未出战宠物可召唤 则召唤
        + 如果当前未出战宠物序号 小于 当前出战宠物序号 或者 当前无出战宠物 则出战当前未出战宠物

手动经验：
>+ 0-30级   做剧情 + 挂机 + 魔方（训练室、经验室）
>+ 30-35级  前期精英比奇后巷挂机 做主线将第二本内功做出 获取蓝装
>+ 35-40级  做银杏任务 奇缘任务 魔方 迷宫密道（开圣域3 挖比奇迷宫2-4）
>+ 40-50级  迷宫密道挂机 比奇城委托 （开次元之门6 挖蛇谷1-4）

游戏状态：
>+ -2 动画
>+ -1 选择账号登录界面 选择谷歌登录 等待进入协议界面
>+ 0 开机
>+ 1 登录前 接受协议 登录后 选择服务器 点击进入游戏 
>+ 2 创建角色界面 先选择职业 再创建角色
>+ 3 已选择角色 准备进入游戏
>+ 4 选择角色界面 选择职业 ？
>+ 5 游戏中
>+ 6 剧情
>
>

需要物品的采集地点信息 以收集材料

自动任务碰到
技能学习
采集
教学
不能进行下去

10级以上更换中型药水
无辅助跑到13级 比奇城风云 14.铲除邪派团队

35/38级前 通过 完成主线任务
>+ 主线自动完成 命令 不需要寻路等功能

35/38级后 通过 修炼->体质 推进 支线任务完成
>+ 卡在任务 寻找龙身 11.确认可疑的箱子 39级通过
>+ 39级卡在 芊菲的下落 7.紧追王山海
>+ 缺 黑铁矿 支线任务中有
>+ 如何判定每个支线任务的奖励物品是需要的？

40级以上 吃药后在魔方阵升级（经验、成长）


自动主线任务
1. 根据主线到达一个地图
2. 检查该地图 可接任务，接受任务自动执行