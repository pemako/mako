# 实验内容

## 实验1 查看CPU和内存，用机器指令和汇编指令编程

### 1. 预备知识：Debug的使用

1. 什么是Debug

​		Debug 是 DOS、Windows 都提供的实模式（8086 方式）程序的调试工具。使用它，可以查看 CPU 各种寄存器中的内容、内存的情况和在机器码级跟踪程序的运行。

2. 用到的 Debug 功能

   - R 命令查看、改变 CPU寄存器的内容
   - D 命令查看内存中的内容
   - E 命令改写内存中的内容
   - U 命令将内存中的机器指令翻译成汇编指令
   - T 命令执行一条机器指令
   - A 命令以汇编指令的格式在内存中写入一条机器指令

   