### 基本运算符
- **[参考文档](https://www.cnswift.org)**

- 三元条件运算符

  `下面输出结果是90`
  ```
  let contentH = 40
  let hasheader = true
  let rowH = contentH + (hasheader ? 50:20)
  print(rowH)
  ```
- 合并空值运算符(需要斟酌)
- 闭区间运算符
 ```
 for index in 1...5 {
    print("\(index) times 5 is \(index*5)")
  }
 ```
 ```
  1 times 5 is 5
  2 times 5 is 10
  3 times 5 is 15
  4 times 5 is 20
  5 times 5 is 25
 ```
- 半开区间运算符
 ```
  let names = ["Jack","Adom","Tom","Tony"]
  let count = names.count
  for i in 0..<count {
      print("Person \(i + 1) is called \(names[i])")
  }
 ```
 ```
  Person 1 is called Jack
  Person 2 is called Adom
  Person 3 is called Tom
  Person 4 is called Tony
 ```
- 单侧区间
  ```
  for name in names[2...] {
    print(name)
  }
  for name in names[...2] {
    print(name)
  }
  ```
  ```
  Tom
  Tony
  ```
  ```
  Jack
  Adom
  Tom
  ```
