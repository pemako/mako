# 多账号配置

- 进入 `~/.ssh` 目录下依次使用命令生成对应的秘钥文件
  - `ssh-keygen -t rsa -C "makosonm@gmail.com"` 命名为 `id_rsa_makosonm`
  - `ssh-keygen -t rsa -C "pemako@gmail.com"` 命名为 `id_rsa_pemako`
- 在 github.com 的setting上添加对应的 `id_rsa_xx.pub`文件内容到 SSH KEY
- 在 `~/.ssh/config` 文件中添加如内容

```
Host makosonm
    HostName github.com
    User makosonm@gmail.com
    IdentityFile ~/.ssh/id_rsa_makosonm


Host pemako
    HostName github.com
    User pemakoa@gmail.com
    IdentityFile ~/.ssh/id_rsa_pemako
```

> 不配置 global 的 user email 可以在不同的仓库配置不同的账号进行提交代码

```
git config user.name "makosonm"
git config user.email "makosonm@gmail.com"
```