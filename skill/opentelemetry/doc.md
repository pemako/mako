# DOC



1. 入口服务仅携带 trace-id 调用
2.  主调： h5_api 获取到trace-id 开启一个 span
3.  生成被调: h5_material 被调要挂到主调的 span 上
4. 主调: h5_material 调用 token_server , 此时 token_server 的span 要挂到 h5_material 的span下，且 这里的 h5_material 不能再重新生成