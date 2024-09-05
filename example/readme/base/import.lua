--重复调用会导致系统崩溃 指针的赋值
package.loaded["game/other/global"] = nil
require("game/other/global")

package.loaded["game/other/do"] = nil
require("game/other/do")

example = import("example/example")
--------------------------------------------------------------
--在未登录状态调取了不存在的游戏数据 导致游戏崩溃
--xxmsg = show_con

