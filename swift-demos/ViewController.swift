//
//  ViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/9.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        base_first()
//        base_second()
        base_third()
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
        if i == 2 {
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

