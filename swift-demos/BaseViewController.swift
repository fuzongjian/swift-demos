//
//  BaseViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/10.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class BaseViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        //        base_first()
        //        base_second()
        //        base_third()
        //        base_forth()
                base_sixth()
        // Do any additional setup after loading the view.
    }
    func base_sixth() {
        print(greet(person: "Tom!"))
        let bounds = minMax(array: [1,2,-3,9,5,3])
        print(bounds.max,bounds.min)
    }
    func base_forth() -> () {
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
        let list: [String] = ["Jack","Tom"]
        print(list)
        // 使用数组
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
        
        // 遍历
        let newlist: [String] = ["fu","zong","jian"]
        // 值
        for item in newlist {
            print(item)
        }
        // 索引和值
        for (index,value) in newlist.enumerated() {
            print("item \(index + 1):\(value)")
        }
        // 合集
        // 创建并初始化一个空合集
        var letters = Set<Character>()
        print(letters)
        letters.insert("a")
        print(letters)
        // 使用数组字面量创建合集
        let newSet: Set<String> = ["Rock","Classical","Hip hop"]
        print(newSet)
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
        // 合集基本操作
        let odd: Set = [1,3,5,7,9]
        let even: Set = [0,2,4,6,8]
        let single: Set = [2,3,5,7]
        print(odd.union(even).sorted())
        print(odd.intersection(even).sorted())
        print(odd.subtracting(single).sorted())
        print(odd.symmetricDifference(single).sorted())
        // 合集成员关系和相等性
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
    }
    func base_third() -> () {
        // 单行
        let something = "some thing"
        // 多行
        let much = """
           在32位平台上，Int的长度和Int32相同；在64位平台上，Int的长度和Int64相同
           在32位平台上，UInt的长度和UInt32相同；在64位平台上，UInt的长度和UInt64相同
        """
        print(something,much)
        // 初始化一个空字符串
        let empty = ""
        let emptyS = String()
        print(empty,emptyS)
        // 字符串是否为空
        if emptyS.isEmpty{
            print("Nothing to see here")
        }
        // 可变字符串
        var str = "fu"
        str += "zongjian"
        print(str)
        // 操作字符
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
        // 索引
        let greet = "hello world"
        print(greet[greet.startIndex])
        print(greet[greet.index(after: greet.startIndex)])
        print(greet[greet.index(before: greet.endIndex)])
        print(greet[greet.index(greet.startIndex, offsetBy: 4)])
        for index in greet.characters.indices {
            print("\(greet[index])")
        }
        // 插入和删除
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
        // 子字符串
        let test = "Hello,world!"
        let index = test.index(of: ",") ?? test.endIndex
        // 与test公用内存呢
        let new1 = test[..<index]
        print(new1)
        // 独立内存
        let new2 = String(new1)
        print(new2)
        // 前缀后缀
        let test_1 = "yesterday"
        if test_1.hasPrefix("yes") {
            print("contain substring yes")
        }
        if test_1.hasSuffix("day") {
            print("contain substring day")
        }
    }
    func base_second() -> () {
        // 三元条件运算符
        let contentH = 40
        let hasheader = true
        let rowH = contentH + (hasheader ? 50:20)
        print(rowH)
        // 闭区间运算符
        for index in 1...5 {
            print("\(index) times 5 is \(index*5)")
        }
        // 半开区间运算符
        let names = ["Jack","Adom","Tom","Tony"]
        let count = names.count
        for i in 0..<count {
            print("Person \(i + 1) is called \(names[i])")
        }
        // 单侧区间
        for name in names[2...] {
            print(name)
        }
        for name in names[...2] {
            print(name)
        }
    }
    // 基础内容
    func base_first() ->  (){
        // 变量和常量
        let count = 10
        var number = 10
        number += 1
        NSLog("count ===%d----number ====%d",count,number)
        // 类型标注
        var hello: String
        hello = "hello world"
        NSLog(hello)
        // 输出常量和变量
        print(count)
        print("the var value is \(hello)")
        
        // 整数范围
        let min_Value = Int8.min
        let max_Value = Int8.max
        print(min_Value,max_Value)
        // 整数和浮点数的转化
        print("整数和浮点数的转化")
        let three = 3
        let point = 0.1415926
        let pi = Double(three) + point
        print(pi)
        print(Int(pi))
        //  类型别名
        typealias newType = UInt16;
        print(newType.min,newType.max)
        // 布尔值
        let status = true
        print(status)
        let i = 1
        if i == 1 {
            print("hello")
        }else{
            print("world")
        }
        // 元组
        let http404Error = (404,"Not Found")
        print(http404Error)
        let (statu,error) = http404Error
        print(statu,error)
        let dic = (statusCode: 200,des: "ok")
        print(dic.statusCode,dic.des)
        // 可选项
        let possibleNum = "hello"
        let num = "10"
        if Int(possibleNum) != nil {
            print(Int(possibleNum)!)
        }
        if Int(num) != nil {
            print(Int(num)!)
        }
        // 可选项绑定
        if let value = Int("2018"){
            print(value)
        }
        if let value1 = Int("hello"),let value2 = Int("20"){
            print(value1,value2)
        }else{
            print("can't")
        }
        // 断言
        let age = -10
        //        assert(age >= 0,"a person's age cannot be less than zero")
        //        assert(age >= 0)
        if age > 10 {
            print("hello")
        }else if age > 0 {
            print("world")
        }else{
            //            assertionFailure("a person's age cannot be less than zero")
        }
        // 强制先决条件
        precondition(age > 0,"a person's age cannot be less than zero")
    }
    func greet(person: String) -> String {
        return "hello " + person
    }
    func minMax(array: [Int]) -> (min: Int,max: Int) {
        var min_ = array[0]
        var max_ = array[0]
        for value in array {
            if min_ > value {
                min_ = value
            }
            if max_ < value {
                max_ = value
            }
        }
        return (min_,max_)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
