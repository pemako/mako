# Singleton（单例模式）

定义单态方法 (`singleton methods`)的三种方式



### 直接给对象打开定义

在任何时间任何地点，可以对一个类或对象打开进行添加方法或重写方法。

```ruby
a = Array.new

def a.size
  "Hello World!"
end

puts a.size # 输出的结果 "Hello,World!" 而不是0
```



### 使用 `<<` 方式

```rub
a = Array.new

class << a # 某一个类基于 a 重写 size 这个方法
	def size
		puts super
		"Hello,World"
	end
end

puts a.size # 0 "Hello,World"

b = Array.new
puts b.size # 0
```



### 通过 `instance_eval`

```ruby
a = Array.new

a.instance_eval <<EOF
	def size
		puts supper
		puts "Hello,World!"
	end
EOF

b = Array.new
a.size		# 0 "Hello,World!"
b.size 		# 0
```



## 参考

1. https://devalot.com/articles/2008/09/ruby-singleton
2. https://www.jimmycuadra.com/posts/metaprogramming-ruby-class-eval-and-instance-eval/