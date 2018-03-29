### 传值方式
[1. 代理传值]()

[2. 单例传值]()

[3. block传值]()

[4. 通知传值]()

[5. 偏好设置](#偏好设置传值)

[6. 文件传值]()

#### notes
- 代理传值

- 偏好设置传值(UserDefaults)

  `UserDefaults`单例是以`key-value`的形式存储一系列偏好设置，把对象存储到相应的plist文件中。


    支持存储类型：
    Data、String、Number、Date、Array、Dictionary

  `注意`
  

    如果需要存储plist文件不支持的类型，比如图片，可以先将其归档为Data类型，再进行存储
