local rule = 
{
--    input = "",
--    output = "",
    sheet = "道具表",		--转换哪一张表，也支持1、2、3序号索引
    index = {"道具id"},		--表中索引，支持多个字段
    table = {["出售价格"]="price",["使用奖励"]="reward"},		--默认第一行为表头
    filter = function(key, value) --过滤函数，在其中处理复杂数据
        if key=="reward" then
            return value:split_build({',', ':'}, "type", "amount")
        end
    end
}

local excel = require('excel.excel')
local doc,err = excel.read('test.xml')
if doc then
    --excel.echo(doc)
    local result = excel.process(doc, rule)
    --excel.echo(doc)
    --excel.echo(result)
    excel.save(result, "2.lua")		--并不实际保存
else
    print(err)
end
