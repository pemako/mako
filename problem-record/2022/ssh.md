# ssh 使用问题



- ssh 输入一次密码后，再开新窗口免密配置; 在 `.ssh/config`中添加如下代码

  ```shell
  Host *
  ControlPersist yes
  ControlMaster auto
  ControlPath ~/.ssh/master-%r@%h:%p
  ```

  