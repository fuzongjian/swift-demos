### 字符串与字符
- **[参考文档](https://www.cnswift.org)**

- 字符串字面量
  ```
  // 单行
  let something = "some thing"
  // 多行
  let much = """
     在32位平台上，Int的长度和Int32相同；在64位平台上，Int的长度和Int64相同
     在32位平台上，UInt的长度和UInt32相同；在64位平台上，UInt的长度和UInt64相同
  """
  ```
- 初始化一个空字符串
  ```
  let empty = ""
  let emptyS = String()
  print(empty,emptyS)
  // 字符串是否为空
  if emptyS.isEmpty{
      print("Nothing to see here")
  }
  ```
- 可变字符串
  ```
  var str = "fu"
  str += "zongjian"
  print(str)
  ```
- 操作字符
  ```
  let charc = "fuzongjian"
  for character in charc {
      print(character)
  }
  // 定义单个字符
  let newchar: Character = "!"
  print(newchar)

  // 通过构造器初始话字符串
  let chars: [Character] = ["z","o","n","g"]
  print(String(chars))

  //拼接
  var my = "fuzong"
  my.append(newchar)
  print(my)
  ```
- 字符串索引

  `使用index(before:)和index(after:)方法来访问给定索引的前后，以及index(_:offsetBy:)`
  ```
  let greet = "hello world"
  print(greet[greet.startIndex])
  print(greet[greet.index(after: greet.startIndex)])
  print(greet[greet.index(before: greet.endIndex)])
  print(greet[greet.index(greet.startIndex, offsetBy: 4)])
  for index in greet.characters.indices {
      print("\(greet[index])")
  }
  ```
  ```
  h
  e
  d
  o
  h e l l o  w o r l d
  ```
- 插入和删除

  `插入字符用insert(_:at:)，插入字符串用insert(contentsOf:at:)`
  ```
  var well = "hello"
  well.insert("!", at: well.endIndex)
  print(well)
  well.insert(contentsOf: " world", at: well.index(before: well.endIndex))
  print(well)
  well.remove(at: well.index(before: well.endIndex))
  print(well)
  let range = well.index(well.endIndex, offsetBy: -6)..<well.endIndex
  well.removeSubrange(range)
  print(well)
  ```
  ```
  hello!    
  hello world!
  hello world
  hello
  ```
- 子字符串
  ```
  let test = "Hello,world!"
  let index = test.index(of: ",") ?? test.endIndex
  // 与test公用内存呢
  let new1 = test[..<index]
  print(new1)
  // 独立内存
  let new2 = String(new1)
  print(new2)
  ```
  ```
  Hello
  Hello
  ```
- 前缀后缀

  `调用hasPrefix(_:)和hasSuffix(_:)方法，返回布尔值`
  ```
  let test_1 = "yesterday"
  if test_1.hasPrefix("yes") {
      print("contain substring yes")
  }
  if test_1.hasSuffix("day") {
      print("contain substring day")
  }
  ```
