//
//  KVCKVOController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/3.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class KVCKVOController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*          KVO(key-value-observing)    键值观察机制
     *          KVO底层机制：基于runtime机制实现
     *          kVC(key-value-coding)       键值编码，是一种通过字符串间接访问对象的方式
     *          KVC底层机制：setter方法 -> _key  -> key  ->  forUndefinedKey
     *
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
