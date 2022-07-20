--写响应头  
ngx.header.a = "1"  
--多个响应头可以使用table  
ngx.header.b = {"2", "3"}  
--输出响应  
ngx.say("a", "b", "<br/>")  
ngx.print("c", "d", "<br/>")  
--200状态码退出  
return ngx.exit(200)  
-- ngx.header：输出响应头；
-- ngx.print：输出响应内容体；
-- ngx.say：通ngx.print，但是会最后输出一个换行符；
-- ngx.exit：指定状态码退出。
