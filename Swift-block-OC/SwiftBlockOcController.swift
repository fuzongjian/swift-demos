//
//  SwiftBlockOcController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/2.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit
class SwiftBlockOcController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    func configUI() {
        setCustomTitle(title: "Swift-OC-Block")
        let swiftBtn = UIButton(type: .system)
        swiftBtn.setTitle("OC-Block", for: .normal)
        swiftBtn.addTarget(self, action: #selector(swiftBtnClicked(_:)), for: .touchUpInside)
        view.addSubview(swiftBtn)
        swiftBtn.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
        }
        
        let returnValue = noPramaNoReturn(count: 10) {
            Klog("1---hello blcok")
        }
        Klog("1---\(returnValue)")
        
        let reValue = paramaAndReturnValue(name: "fuzongjian") { (a, b) in
            Klog("2---a=\(a)---b=\(b)")
        }
        Klog("2---\(reValue)")
    }
    // 声明带参数和有返回值的闭包
    func paramaAndReturnValue(name: String, completed:(_ a: Int, _ b: Int) -> ()) -> String {
        let value = "\(name)---\(name)---\(name)"
        completed(10,20)
        return value
    }
    // 声明不带参数和没有返回值的闭包
    func noPramaNoReturn(count: Int, completed:() -> ()) -> Int {
        let sum = count + 10
        Klog("1---hi block")
        completed()
        return sum
    }
    @objc func swiftBtnClicked(_ sender: UIButton) {
        Klog("hello world")
        self.navigationController?.pushViewController(OcBlockController(), animated: true)
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
