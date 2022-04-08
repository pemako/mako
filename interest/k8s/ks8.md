

# K8S



![Kubernetes 的组件](https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg)

## 控制面组件(Control Plane Components)

控制面组件对集权作出全局决策（比如调度），以及检测和响应集群事件（例如，当不满足部署的 `replicas` 字段时，启动新的 `pod`）。

控制平台组件可以在集群中的任何节点上运行。然而，为了简单起见，设置脚本通常会在同一个计算机上启动所有控制平面组件，兵且不会在此计算机上运行用户容器。

### kube-apiserver

`API`服务器是 `Kubernetes` 控制面的组件，该组件公开了 `Kubernetes API`。`API`服务器是 `Kubernetes`控制面的前端。

`Kubernetes API`服务器的主要实现是`kube-apiserver`。kube-apiserver 设计上考虑了水平伸缩，也就说可，它可以通过部署多个实例进行伸缩。



### etcd

`etcd` 是兼具一致性和高可用性的健值数据库，可以作为保存 `Kubernetes`所有集群数据的后台数据库。



### kube-scheduler

控制平面组件，分钟监视新创建的、未指定运行节点的Pods,选择节点让 Pod 在上面运行。调度决策考虑的因素包括单个 Pod 和 Pod 集合的资源需求、硬件/软件/策略约束、亲和性和反亲和性规范、数据位置、工作负载的干扰和最后时限。



### kube-controller-manager

运行控制器进程的控制平面组件。

- 节点控制器（Node Controller）
- 任务控制器（Job Controller）
- 端点控制器（Endpoints Controller）
- 服务账户和令牌控制器（Service Account & Token Controllers）



### cloud-controller-manager

云控制器管理器是指嵌入特定云的控制逻辑的控制平面组件。

- 节点控制器（Node Controller）
- 路由控制器（Route Controller）
- 服务控制器（Service Controller）





## Node 组件

- kubelet
- kube-proxy
- Container Runtime



## 插件（Addons）

- DNS
- Web界面





## 概念

- Node
  - 获取节点 `kubectl get nodes`
  - 查看节点 `kubectl describe node <节点名称>`
  - 