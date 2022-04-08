#!/bin/bash 

filename=$1
prefix=${filename%.*}

# 编译
nasm -f macho64 -o "$prefix".o $filename

# 链接
ld -macosx_version_min 10.14 -o $prefix -e _main "$prefix".o -lSystem
#gcc -v -no-pie ${prefix}.o -o ${prefix}

# 执行
./${prefix}  && rm -rf $prefix ${prefix}.o
