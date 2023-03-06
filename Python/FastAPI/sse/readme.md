# [Server-sent events](https://developer.mozilla.org/zh-CN/docs/Web/API/Server-sent_events)

+ [Event](https://developer.mozilla.org/zh-CN/docs/Web/API/Event)
+ [使用服务器发送事件](https://developer.mozilla.org/zh-CN/docs/Web/API/Server-sent_events/Using_server-sent_events)

> SSE 基于 HTTP 协议
+ 数据格式
  + `UTF8` 编码的文本格式
  + 使用**两个换行符**来分隔前后的消息
  + 每条消息支持4种属性
  + 属性名和属性值之间用**冒号**区分
  + 新起一行（即使用**一个换行符**）创建下一个属性
+ HTTP Response 的 `Content-Type` 的值是 `text/event-stream`
  + `text` 表明通讯数据是明文
  + `event-stream` 表明是事件流的形式
