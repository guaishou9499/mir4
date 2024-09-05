#### 模拟 odoo 的过滤器写法 解决 entities 的通用性问题

“名字为 ABC 而且语言编码不为 en_US 而且国家的编码为 be 或者 de”or的逻辑关系是用"|"表示。
    
```lua
    [('name','=','ABC'),
    ('language.code','!=','en_US'),
    '|',('country_id.code','=','be'),
    ('country_id.code','=','de')]
```

#### 函数深入：闭合函数，局部函数，尾调用


#### 22 环境（Environment）（Lua程序设计第四版）
 