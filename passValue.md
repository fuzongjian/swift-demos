### 传值方式
[1. 代理传值]()

[2. 单例传值]()

[3. block传值]()

[4. 通知传值]()

[5. 偏好设置](#偏好设置传值)

[6. 文件传值]()

#### notes
- 代理传值

  `代理传值`通常使用在两个界面传值，从后往前传值。

  `eg`

      假设A、B均为视图控制器，B传值给A。
      1、首先在B控制器申明协议和协议方法。
      2、在B控制器定义一个协议属性，用assign或weak修饰
      3、在B即将pop的时候，使用协议方法进行传递数据
      4、A控制器遵守B的协议，并实现协议的方法即可  

- 单例传值

  `单例传值`

      1、单例是一个类，创造出来的对象叫单例对象。
      2、单例至始至终都是指向同一块内存地址；到程序结束才会被释放。

    `eg`

      class CommonManager: NSObject {
          private static let shared = CommonManager()
          var name: String?
          private override init() {
            name = "fuzongjian"
          }
          // 提供类方法拿到对象
          class func defaultInstance() -> CommonManager {
            return shared
          }
      }
- block传值
- 通知传值
- 偏好设置传值(UserDefaults)

  `UserDefaults`单例是以`key-value`的形式存储一系列偏好设置，把对象存储到相应的plist文件中。


    支持存储类型：
    Data、String、Number、Date、Array、Dictionary

  `注意`

    如果需要存储plist文件不支持的类型，比如图片，可以先将其归档为Data类型，再进行存储

  `eg`

     // 存储
     UserDefaults.standard.set("偏好设置传值", forKey: "user_default")
     UserDefaults.standard.synchronize()
     // 取值
     guard let userDefault = UserDefaults.standard.value(forKey: "user_default") else {
            return
     }
     print(userDefault)
