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
- 插入和删除
