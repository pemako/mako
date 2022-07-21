# MacPorts安装使用


## 下载和系统匹配的版本

- https://www.macports.org/

## 修改配置

修改 `/opt/local/etc/macports/sources.conf`下的配置文件，把最后一句注释修改为

```
# rsync://rsync.macports.org/macports/release/tarballs/ports.tar [default]

http://www.macports.org/files/ports.tar.gz [default]
```

## 执行命令

```
sudo port -d sync
```

## 常用命令

- 查看当前可用软件包及版本 `port list`
- 查看有更新的软件以及版本 `port outdated`
- 升级可以更新的软件 `sudo port upgrade outdated`
- 搜索需要安装的软件包 `port search graphviz`
- 查看具体软件包的内容和说明 `port info graphviz`
- 查看软件包的依赖关系 `port deps graphviz`
- 查看允许客户定制的参数 `port variants graphviz`
- 安装软件 `sudo port install graphviz`
- 下载使用Mac Port安装的软件 `sudo port uninstall graphviz`
- MacPorts卸载删除 `删除/opt/local目录`


## 附录

- 更多详细内容参考 https://guide.macports.org/#introduction
- 软件包搜索 https://ports.macports.org/

