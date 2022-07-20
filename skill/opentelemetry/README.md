# OpenTelemetry

[open-telemetry-docs-cn](https://github.com/open-telemetry/docs-cn)



## 名称说明

- APM (Application Performance Monitoring)  应用程序性能监控
- Distributed Tracing 分布式跟踪
- OTLP (OpenTelemetry Line Protocol) 
- OTel  是 OpenTelemetry 的缩写
- SPM (Service Performance Monitoring) 服务性能监控



## 可观察性入门



### 什么是可观测性

可观测性让我们从外部了解一个系统，让我们在不知道其内部运作的情况下就该系统提出问题。此外，使我们能够轻松解决和处理新问题（既“未知的未知数”），并帮助我们回答“为什么会发生这种情况？”的问题。

为了能够询问系统的这些问题，必须对应用程序进行适当的检测。也就是说，应用程序代码必须发出 跟踪(traces)、度量(metrics)和日志(logs)等信号。当开发人员不需要添加更多的工具来解决问题时，应用程序会被正确地检测，因为他们拥有所需要的所有信息。



OpenTelemetry 是检测应用程序代码的机制，以帮助使系统可观察。



### Reliability(可靠性) & Metrics(指标)





## 概念

- Span 一个 Span 代表一个工作或操作单元。它跟踪请求进行的特定操作，描绘在执行该操作期间发生的事情。
- 