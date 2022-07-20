# Ruby 基本教程

## 编程风格

[ruby-style-guide](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md)

[RubyChina](https://ruby-china.org/wiki)



## 类和对象

### 类中的变量

- 局部变量: 局部变量是在方法中定义的变量。在方法外是不可用的。以小写字母或 `_` 开始
- 实例变量：实例变量可以跨任何特定的实例或对象中的方法使用。实例变量可以从对象到对象的改变。实例变量在变量名之前放置符号 `@`
- 类变量：类变量可以跨不同的对象使用。类变量属于类，且是类的一个属性。类变量在变量名之前放置符号 `@@`
- 全局变量：类变量不能跨类使用。如果想要有一个可以跨类使用的变量，需要定义全局变量。全局变量总是以 `$` 开始



### 类中的成员函数

在 `Ruby` 中，函数被称为方法。类中的每个方法是以关键字`def`开始，后跟方法名。方法名总是以**小写字母**开始。在`Ruby`中可以使用关键字`end`来结束一个方法。



## Ruby 块

- 块由大量的代码组成
- 需要给块取一个名称
- 块中的代码总是包含在大括号`{}`中
- 块总是从与其相同名称的函数调用。这意味着如果块名称为`test`, 那么要使用函数 `test`来调用这个块
- 可以使用 `yield` 语句来调用块



## Module

模块是一种把方法、类和常量组合在一起的方式。模块提供了两大好处

- 提供了一个命名空间和避免名字冲突
- 实现了 `mixin` 装置

模块类似与类，但有一下不同

- 模块不能实例化
- 模块没有子类
- 模块只能被另一个模块定义



为了在类中嵌入模块，可以在类中使用 `include` 语句。`include modulename`



## String

`Ruby` 中的字符串分为单引号 `'`和双引号`"`，区别在于双引号字符串能支持更多的转移字符。

`Ruby` 的默认字符编码是 `ASCII`,字符可用单个字节表示。

#### 字符串内建方法

需要有一个`String`对象的实例来调用 `String`方法。

```ruby
# new [String.new(str="")]
mstr = String.new("This is Test")
puts mstr.downcase
```



## Array

Ruby 数组是任何对象的有序整数索引集合。数组中的每个元素都与一个索引相关，并可通过索引进行获取。

数组的索引从 0 开始，这与 C 或 Java 中一样。一个负数的索相对于数组的末尾计数的，也就是说，索引为 -1 表示数组的最后一个元素，-2 表示数组中的倒数第二个元素，依此类推。

Ruby 数组可存储诸如 String、 Integer、 Fixnum、 Hash、 Symbol 等对象，甚至可以是其他 Array 对象。

Ruby 数组不需要指定大小，当向数组添加元素时，Ruby 数组会自动增长。



#### 数组内建方法

需要有一个 `Array` 对象的实例来调用`Array`方法。下面是创建`Array`对象实例的方式。

```ruby
# 方式一：Array.[](...) 
# 方式二：Array[...]
# 方式三：[...]

digits = Array(0..9)
puts digits.at(6)
```



## Hash

哈希（Hash）是类似 "key" => "value" 这样的键值对集合。哈希类似于一个数组，只不过它的索引不局限于使用数字。

Hash 的索引（或者叫"键"）几乎可以是任何对象。

Hash 虽然和数组类似，但却有一个很重要的区别：Hash 的元素没有特定的顺序。 如果顺序很重要的话就要使用数组了。



```ruby
# 通过 new 类方法创建一个空的哈希
months = Hash.new

# 使用 new 创建带有默认值的哈希，不带默认值的哈希是 nil
months = Hash.new("month")
# 或
months = Hash.new "month"

# 当访问带有默认值的哈希中的任意键时，如果键或值不存在，访问哈希将返回默认值

H = Hash["a"=> 100, "b"=> 200]
puts H['a']
puts H['b']
```



#### 哈希内置方法

如果需要调用 Hash 方法，需要先实例化一个 Hash 对象。下面是创建 Hash 对象实例的方式

```ruby
Hash[[key =>|, value]* ]
Hash.new
Hash.new(obj) 
Hash.new { |hash, key| block }

$, = ", " # Array 值分割符
months = Hash.new( "month" )
months = {"1" => "January", "2" => "February"}
keys = months.keys
puts "#{keys}" # 输出 ["1", "2"]
```



## Date & Time

**Time** 类在 Ruby 中用于表示日期和时间。它是基于操作系统提供的系统日期和时间之上。该类可能无法表示 1970 年之前或者 2038 年之后的日期。



```ruby
# 1. 创建当前的日期和时间
t = Time.new
puts "当前时间：" + t.inspect  # 当前时间：2022-04-26 22:22:08.826022 +0800

time = Time.new
# Time 的组件
puts "当前时间 : " + time.inspect
puts time.year    # => 日期的年份
puts time.month   # => 日期的月份（1 到 12）
puts time.day     # => 一个月中的第几天（1 到 31）
puts time.wday    # => 一周中的星期几（0 是星期日）
puts time.yday    # => 365：一年中的第几天
puts time.hour    # => 23：24 小时制
puts time.min     # => 59
puts time.sec     # => 59
puts time.usec    # => 999999：微秒
puts time.zone    # => "UTC"：时区名称

puts time.strftime("%Y-%m-%d %H:%M:%S") # 格式化时间和日期
```



## Range

范围（Range）无处不在：a 到 z、 0 到 9、等等。Ruby 支持范围，并允许我们以不同的方式使用范围

- 作为序列的范围
- 作为条件的范围
- 作为间隔的范围



#### 作为序列的范围

序列有一个起点，一个终点和一个在序列产生连续值的方式。使用 `..`（包含指定最高值的范围）和 `...`（不包含指定的最高值） 范围运算符创建这些序列。

```ruby
range1 = (1..10).to_a
range2 = ('bar'..'bat').to_a

puts "#{range1}" # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "#{range2}" # ["bar", "bas", "bat"]
```



#### 作为条件范围

```ruby
while gets
   print if /start/../end/
end

score = 70
 
result = case score
when 0..40
    "糟糕的分数"
when 41..60
    "快要及格"
when 61..70
    "及格分数"
when 71..100
       "良好分数"
else
    "错误的分数"
end
 
puts result
```



#### 作为间隔范围

检查指定值是否在指定的范围内。需要使用 `===` 相等运算符来完成计算

```ruby
if ((1..10) === 5)
  puts "5 在 (1..10)"
end
 
if (('a'..'j') === 'c')
  puts "c 在 ('a'..'j')"
end
 
if (('a'..'j') === 'z')
  puts "z 在 ('a'..'j')"
end
```



## Iterators

迭代器是*集合*支持的方法。存储一组数据成员的对象称为集合。在 Ruby 中，数组(Array)和哈希(Hash)可以称之为集合。

迭代器返回集合的所有元素，一个接着一个。在这里我们将讨论两种迭代器，*each* 和 *collect*

```ruby
# each
ary = [1,2,3,4,5]
ary.each do |i|
   puts i
end

sum = 0
cutcome = {"block1" => 1000, "book2" => 1000, "book3" => 4000}
cutcome.each{|item, price| sum += price}
# 或 cutcome.each{|pair| sum += pair[1]}
print "sum = " + sum.to_s


# collect
a = [1,2,3,4,5]
b = a.collect{|x| 10*x}
puts b
```



## 文件的输入与输出

Ruby 提供了一整套 I/O 相关的方法，在内核（Kernel）模块中实现。所有的 I/O 方法派生自 IO 类。

类 *IO* 提供了所有基础的方法，比如 *read、 write、 gets、 puts、 readline、 getc* 和 *printf*。



- puts 语句指示程序显示存储在变量中的值
- gets 语句可用于获取来自名为 `STDIN`的标准屏幕的用户输入
- putc 语句用于依次输入一个字符
- print 语句与 *puts* 语句类似。唯一的不同在于 *puts* 语句在输出内容后会跳到下一行，而使用 *print* 语句时，光标定位在同一行



### 打开和关闭文件

- File.new 创建一个 File 对象用于读取、写入或着读写
- File.open 创建一个新的 file 对象，并把该 file 对象赋值给文件。但是，*File.open* 和 *File.new* 方法之间有一点不同。不同点是 *File.open* 方法可与块关联，而 *File.new* 方法不能

### 读取和写入文件

- sysread 使用方法 *sysread* 来读取文件的内容。当使用方法 sysread 时，您可以使用任意一种模式打开文件
- syswrite 向文件写入内容
- 该方法属于类 File。each_byte 可以迭代字符串中每个字符

- IO.readlines 方法，逐行返回文件内容
- IO.foreach 方法；该方法也逐行返回输出。方法 *foreach* 与方法 *readlines* 之间不同的是，方法 *foreach* 与块相关联。但是，不像方法 *readlines*，方法 *foreach* 不是返回一个数组

```ruby
aFile = File.new("input.txt", "r")
if aFile
	content = aFile.sysread(20)
	puts content
else
	puts "Unable to open file!"
end

# 这段代码将把文件 test 的内容逐行传给变量 block，然后输出将显示在屏幕上
IO.foreach("input.txt"){|block| puts block}
```



### 重命名和删除文件

- File.rename
- File.delete



### 目录相关

- Dir.chdir("/usr/bin")
- Dir.pwd # 查看当前目录
- Dir.entries 获取指定目录内的文件和目录列表  `puts Dir.entries("/usr/bin").join(' ')`

```ruby
Dir.foreach("/usr/bin") do |entry|
	puts entry
end
```

- Dir.mkdir

- Dir.delete

- Dir.tmpdir

  ```ruby
  require 'tmpdir'
  
  tempfilename = File.join(Dir.tmpdir, "tingtong")
  puts tempfilename
  tempfile = File.new(tempfilename, "w")
  tempfile.puts "This is a temporary file"
  tempfile.close
  File.delete(tempfilename)
  ```



## Exception

- 使用语法格式

```ruby
begin #开始
 
 raise.. #抛出异常
 
rescue [ExceptionType = StandardException] #捕获指定类型的异常默认值是 StandardException
 $! #表示异常信息
 $@ #表示异常出现的代码位置
else #其余异常
 ..
ensure #不管有没有异常，进入该代码块
 
end #结束
```

- 使用retry语句

```ruby
begin
    # 这段代码抛出的异常将被下面的 rescue 子句捕获
rescue
    # 这个块将捕获所有类型的异常
    retry  # 这将把控制移到 begin 的开头
end
```



## 连接Mysql



安装驱动 `gem install mysql2` 



```ruby
require 'mysql2'

client = Mysql2::Client.new(:host=>"localhost", :username=>"root", :password=>"", :database=>"atlantis2", :encoding=>"utf8")

result = client.query("select * from svc")

result.each do |row|
	puts "#{row["id"]}, #{row["name"]}"
end
```

