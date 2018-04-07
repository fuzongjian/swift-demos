//
//  CategoryExtentsionController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/7.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CategoryExtentsionController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let person = Person()
        
        // Do any additional setup after loading the view.
    }
    /*    类别OC中的特有语法，它是表示一个指向分类的结构体的指针。原则上它只能增加方法，不能增加成员（实例）变量。
     *    1、类别不能为已存在的类添加实例变量。
     *    2、类别中添加的方法优先级高，会覆盖原类中的方法
     *    3、原类中的私有方法，可以在类别中定义一下，这样就可以使用了。
     *    4、在categroy中定义的方法可以被子类继承。
     */
    /*    扩展
     *    1、扩展中可以定义属性，变量，和方法
     *    2、扩展中定义的属性和方法不能被子类继承
     *    3、扩展中只能对自定义的类添加方法，不能对系统类添加方法。
     */
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
