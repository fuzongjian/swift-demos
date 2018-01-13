### 函数
- **[参考文档](https://www.cnswift.org)**
- [demo](https://github.com/fuzongjian/swift-demos.git)
      闭包是可以在你的代码中被传递和引用的功能性独立模块。（与OC的block相似）

- 语法规则
  ```
  { (parameters) -> (return type) in
    statements
  }
  ```
- 没有参数也没有返回值
  ```
  // 没有任何参数
  let no = {print("没有参数哟")}
  no()
  ```
- 有参数没有返回值
  ```
  // 有参数没有返回值
  let hello = {(name: String) -> () in
      print("hello \(name)")
  }
  hello("fuzongjian")
  ```
- 有参数有返回值
  ```
  // 有参数有返回值
  let count = {(numa: Int,numb: Int)->Int in
      return numa + numb
  }
  print(count(1,3))
  ```
- 应用
  ```
  // 函数定义
  func load_data(completion:@escaping(_:[String])->()) {
      DispatchQueue.global().async {
          print("耗时操作\(Thread.current)")
          Thread.sleep(forTimeInterval: 1)
          let json = ["上海","北京","天津"]
          DispatchQueue.main.async(execute: {
              print("主线程更新\(Thread.current)")
              completion(json)
          })
      }
  }
  // 调用
  load_data(completion: {(result)->() in
      print("获取的结果是\(result)")
  })
  ```
  ```
  没有参数哟
  hello fuzongjian
  4
  耗时操作<NSThread: 0x1c046a500>{number = 4, name = (null)}
  2018-01-13 23:09:29.421347+0800 swift-demos[1429:789213] refreshPreferences: HangTracerEnabled: 0
  2018-01-13 23:09:29.422246+0800 swift-demos[1429:789213] refreshPreferences: HangTracerDuration: 500
  2018-01-13 23:09:29.422791+0800 swift-demos[1429:789213] refreshPreferences: ActivationLoggingEnabled: 0 ActivationLoggingTaskedOffByDA:0
  主线程更新<NSThread: 0x1c406aec0>{number = 1, name = main}
  获取的结果是["上海", "北京", "天津"]
  ```
