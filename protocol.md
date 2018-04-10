### TCP/IP、UDP、Socket、HTTP、FTP
[参考文档1](https://blog.csdn.net/tiancheng1016/article/details/52582988)

[参考文档2](https://blog.csdn.net/hai_chao/article/details/79626161)

[1. 协议简析]()

[2. Socket连接与HTTP连接区别]()

[3. block传值]()

[4. 通知传值]()

[5. 偏好设置](#偏好设置传值)

[6. 文件传值]()

- 协议简析

```
TCP/IP是一个协议组（主要解决数据在网络中如何传输），可以分为三个层次：网络层、传输层、协议层
```
```
网络层：IP协议、ICMP协议、ARP协议、RARP协议和BOOTP协议

传输层：TCP协议、UDP协议

应用层：FTP、HTTP、TELNET、SMTP、DNS等协议
```
- Socket连接与HTTP连接区别

>Socket

```
1、 通常情况下Socket连接就是TCP连接，因此Socket连接一旦建立，通信双方即可开始项目发送数据，直到双方连接断开。

2、 理论上客户端与服务端一旦建立连接将不会主动断掉。

3、 客户端到服务器之间的通信往往穿越多个中间节点，如路由器、网关、防火墙、可能会使其断开，大部分防火墙默认会关闭长时间处于非活跃状态的连接而导致Socket连接断开，因此需要通过轮询告诉网络（发送心跳消息），使该连接处于活跃状态。
```
>Http
