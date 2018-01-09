### 基础内容
- **[参考文档](https://www.cnswift.org)**
- ~~基础内容~~
- [demo](https://github.com/fuzongjian/swift-demos.git)

#### notes
- let声明常量，var来声明变量。
  ```
  let count = 10 (count为常量)
  var number = 0 (number为变量)
  ```
- 类型标注

  `添加类型标注的方法就是在变量或常量的名字后面加上一个冒号，再跟上一个空格，最后在加上要使用的类型的名称`
  ```
  var hello: String
  var red,green,blue: Double
  ```
- 命名常量和变量

  `常量和变量的名字不能包含空白字符、数学符号、箭头、保留的（或者无效的）Unicode码位、连线、和制表符。也不能以数字开头。`
- 输出常量和变量

  `可以使用print函数来打印当前常量和变量中的值`
  ```
  let count = 10
   // 类型标注
   var hello: String
   hello = "hello world"
   // 输出常量和变量
   print(count)
   print("the var value is \(hello)")

  ```
- 注释
  ```
  // 这是一个行级注释

  /*
    这个一个块级注释
  */
  ```
- 分号

  `swift并不要求在没一句代码结尾写分号，如果一行想写多行代码的话，分号还是需要的`
  ```
  let count = 10 ; print(count)
  ```

- 整数

  `Swift提供了8，16，32，64位编码的有符号和无符号整数，无符号UInt，有符号Int`
- 范围

  `可以通过min和max属性来访问每个整数类型的最小值和最大值`
  ```
  let minValue = UInt8.min // 最小值为0
  let maxValue = UInt8.max // 最大致为255
  let min_value = Int8.min // 最小为-128
  let max_value = Int8.max // 最大为127
  ```
- Int与UInt（和当前平台的原生字长度相同）

  `在32位平台上，Int的长度和Int32相同；在64位平台上，Int的长度和Int64相同`

  `在32位平台上，UInt的长度和UInt32相同；在64位平台上，UInt的长度和UInt64相同`

- 浮点数

  `Double代表64位的浮点数，Float代表32位的浮点数`

- 整数和浮点数的转化

  `4.75会变成4，-3.75会变成-3`
  ```
  let three = 3
  let point = 0.1415926
  let pi = Double(three) + point
  print(pi)
  print(Int(pi))
  ```

- 类型别名

  `类型别名可以为已经存在的类型定义一个新的可选名字，用typealias关键字定义类型名`
  ```
  typealias newType = UInt16;
  print(newType.min)
  ```
- 布尔值

  `Swift有一个基础的布尔量类型，就是bool，布尔值被作为逻辑来引用，因为他的值只能是真或者假`
  ```
  let status = true
  print(status)
  ```
  ```
  let i = 1
  if i == 2 {
      print("hello")
  }else{
      print("world")
  }
  ```
- 元组

  `元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同类型`
  ```
  let http404Error = (404,"Not Found")
  print(http404Error)
  let (statu,error) = http404Error
  print(statu,error)
  let dic = (statusCode: 200,des: "ok")
  print(dic.statusCode,dic.des)
  ```
- 可选项

  `利用可选项来处理值可能缺失的情况，同时可以利用if语句进行强制展开`
  ```
  let possibleNum = "hello"
  let num = "10"
  if Int(possibleNum) != nil {
      print(Int(possibleNum)!)
  }
  if Int(num) != nil {
      print(Int(num)!)
  }
  ```
- 可选项绑定

  `可以使用可选项绑定判断可选项是否包含值，如果包含就把值赋给一个临时的常量或者变量`
  ```
  if let value = Int("2018"){
      print(value)
  }

  if let value1 = Int("hello"),let value2 = Int("20"){
      print(value1,value2)
  }else{
      print("can't")
  }
  ```
- 隐式展开项(需要斟酌)
- 使用断言进行调试

  `断言会在运行的时候检查一个逻辑条件是否为true。顾名思义，断言可以“断言”一个条件是否为真。（如果为False，就意味着程序终止）`
  ```
  let age = -10
  assert(age >= 0,"a person's age cannot be less than zero")
  assert(age >= 0)
  if age > 10 {
      print("hello")
  }else if age > 0 {
      print("world")
  }else{
      assertionFailure("a person's age cannot be less than zero")
  }
  ```
- 强制先决条件

  `在程序中可能潜在为假但必须为真才能继续执行的地方使用先决条件。(条件结果为false信心就会显示出来)`
  ```
  precondition(age > 0,"a person's age cannot be less than zero")
  ```
