### APNs
`APNs(Apple Push Notification service)是远程推送功能的核心，通过APNs客户端和苹果服务器建立一个长连接，推送也是通过这个长连接发送到客户端上`
- **deviceToken**
```
1、deviceToken是设备的一个标识符，属于你这款APP装在你这个设备上的标识符。
2、每个APP在每个不同的设备上都有着不同的deviceToken，通过注册远程推送服务，APNs会返回给你的APP的deviceToken。
```
![register](/img/apns-register.jpg)

- **安全架构**
```
为了保证安全性，APNs用连接信任（connection trust）和token信任（token trust）来控制通信入口，必须通过这两种验证才能使用APNs
```
- **连接信任**
```
1、连接信任第一个作用是保证APNs连接的provider是苹果已经同意可通信的。
2、第二个作用是保证与APNs连接的设备的合法性。
3、第二个是APNs处理的，你所要处理的是provider与APNs之间的连接安全性。
```
- **服务器与APNs之间的连接信任**
```
1、每个服务器都必须要有唯一的provider证书和私钥，都是用来验证连接的。provider证书就是在开放者官网申请。
2、服务器通过TLS验证和APNs连接，HTTPS中用的噎死TLS协议，即四步握手。
3、首先初始化TLS连接，即provider（服务器）发送请求给APNs，APNs服务器返回APNs证书（即公钥给provider）
4、然后服务端收到后生成provider证书后再返回给APNs.
5、APNs收到并验证通过即建立TLS连接，不过APNs用的不是HTTPS，而是HTTP/2.
```
![connection](/img/apns-connection.jpg)

- **APNs与设备之间的连接信任**
```
1、设备和provider一样，都有私钥和设备证书，当设备激活了就保存在钥匙串中。
2、这部分的连接信任不用管，由APNs负责，也是通过TLS来验证，过程和provider与APNs相同。
```
![device](/img/apns-device.jpg)

- **token信任**
```
token信任就是保证通知从合法的起点推送到合法的终点，Token信任即要用到上面说的deviceToken,
deviceToken提供给provider，然后之后你的provider每次发送要推送的通知都要携带deviceToken，
这就是token信任。
```
```
APNs会用token钥匙去保证通知来源（即你的服务器）的合法性，用包含在deviceToken里面的device ID来确定目标设备的身份，
如下图：
```
![trust](/img/apns-trust.jpg)
