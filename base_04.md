### 集合类型
- **[参考文档](https://www.cnswift.org)**
- [demo](https://github.com/fuzongjian/swift-demos.git)
      Swift提供了三种主要的集合类型，所谓的数组、合集、还有字典，用来存储值得集合。合集是唯一值的无序集合。字典是无序的键值对集合。
- #### 数组
      数组以有序的方式来存储相同类型的值。相同类型的值可以在数组的不同地方出现。
- 创建数组
  ```
  // 创建空的数组
    var someInts = [Int]()
    print("someInts is of type [Int] with \(someInts.count) items")
    someInts.append(3)
    print(someInts)
    someInts = []
    print(someInts)
    // 使用默认方式创建数组
    let doubles = Array(repeating: 0.0,count: 3)
    let anthers = Array(repeatElement(0.0, count: 4))
    print(doubles,anthers)
    // 通过连接两个数组来创建数组
    let other = doubles + anthers
    print(other)
    // 使用数组字面量创建数组
    var list: [String] = ["Jack","Tom"]
    print(list)
  ```
  ```
  someInts is of type [Int] with 0 items
  [3]
  []
  [0.0, 0.0, 0.0] [0.0, 0.0, 0.0, 0.0]
  [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
  ["Jack", "Tom"]
  ```
- 数组的增删改查
  ```
  var changeA: [String] = ["good","hello","yes"]
  print(changeA.count,changeA.isEmpty)
  // 增加单个元素
  changeA.append("better")
  print(changeA)
  // 增加多个元素
  changeA += ["today","world"]
  print(changeA)
  // 修改一个元素
  changeA[0] = "fu"
  print(changeA)
  // 修改多个元素
  changeA[1...2] = ["zong","jian"]
  print(changeA)
  // 插入元素
  changeA.insert("first", at: 0)
  print(changeA)
  // 删除
  changeA.remove(at: 0)
  print(changeA)
  ```
  ```
  3 false
  ["good", "hello", "yes", "better"]
  ["good", "hello", "yes", "better", "today", "world"]
  ["fu", "hello", "yes", "better", "today", "world"]
  ["fu", "zong", "jian", "better", "today", "world"]
  ["first", "fu", "zong", "jian", "better", "today", "world"]
  ["fu", "zong", "jian", "better", "today", "world"]
  ```
- 数组的使用
  ```
  let newlist: [String] = ["fu","zong","jian"]
  // 值
  for item in newlist {
      print(item)
  }
  // 索引和值
  for (index,value) in newlist.enumerated() {
      print("item \(index + 1):\(value)")
  }
  ```
  ```
  fu
  zong
  jian
  item 1:fu
  item 2:zong
  item 3:jian
  ```
- #### 合集
      合集将同一类切不重复的值无序地存储在一个集合中。
- 创建合集
  ```
  // 创建并初始化一个空合集
  var letters = Set<Character>()
  print(letters)
  letters.insert("a")
  print(letters)
  // 使用数组字面量创建合集
  let newSet: Set<String> = ["Rock","Classical","Hip hop"]
  print(newSet)
  ```
  ```
  []
  ["a"]
  ["Hip hop", "Rock", "Classical"]
  ```
- 增删改查
  ```
  // 增
  var sets: Set = ["Rock","Classical","Hip hop"]
  sets.insert("Jazz")
  print(sets,sets.isEmpty,sets.count)
  // 移除
  print(sets.remove("Hip hop")!)
  print(sets)
  // 包含
  print(sets.contains("Rock"))
  // 遍历
  for type in sets {
      print(type)
  }
  for type in sets.sorted() {
      print(type)
  }
  ```
  ```
  ["Jazz", "Rock", "Hip hop", "Classical"] false 4
  Hip hop
  ["Jazz", "Rock", "Classical"]
  true
  Jazz
  Rock
  Classical
  Classical
  Jazz
  Rock
  ```
- 合集操作
      使用intersection(_:)方法来创建一个只包含两个合集共有值得新集合
      使用symmetricDifference(_:)方法来创建一个值包含两个合集各自有的非公共有值得新合集
      使用union(_:)方法来创建一个包含两个合集所有值的新集合
      使用subtracting(_:)方法来创建一个两个合集当中不包含某个合集值得新合集
  ```
  let odd: Set = [1,3,5,7,9]
  let even: Set = [0,2,4,6,8]
  let single: Set = [2,3,5,7]
  print(odd.union(even).sorted())
  print(odd.intersection(even).sorted())
  print(odd.subtracting(single).sorted())
  print(odd.symmetricDifference(single).sorted())
  ```
  ```
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  []
  [1, 9]
  [1, 2, 9]
  ```
- 合集成员关系和相等性
      使用“相等”运算符（==）来判断两个合集是否包含有相同的值
      使用isSubset(of:)方法来确定一个集合的所有值是被某合集包含
      使用isSuperset(of:)方法来确定一个合集是否包含某个合集的所有值
      使用isDisjoint(with:)方法来判断两个合集是否拥有完全不同的值
- 字典
  ```
  // 创建一个空字典
  var nameDic = [Int: String]()
  nameDic[2] = "hello"
  nameDic[10] = "world"
  print(nameDic)
  var airports: [String:String]=["A":"a","B":"b","C":"c","D":"d"]
  print(airports.count,airports.isEmpty)
  let oldValue = airports.updateValue("c", forKey: "B")!
  print(oldValue,airports)
  // 移除
  airports["C"] = nil
  airports.removeValue(forKey: "B")
  print(airports)
  //遍历
  for (key,value) in airports {
      print("\(key) : \(value)")
  }
  for key in airports.keys{
      print(key)
  }
  for value in airports.values {
      print(value)
  }
  ```
  ```
  [2: "hello", 10: "world"]
  4 false
  b ["B": "c", "A": "a", "C": "c", "D": "d"]
  ["A": "a", "D": "d"]
  A : a
  D : d
  A
  D
  a
  d
  ```
