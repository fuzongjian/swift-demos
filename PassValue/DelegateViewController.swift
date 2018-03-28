//
//  DelegateViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/3/22.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit
// 代理传值
protocol delegateValue: NSObjectProtocol {
    func postValueTo(str: String)
}
// 闭包传值
typealias valueBlock = (String) -> Void
class DelegateViewController: SuperViewController {
    weak var delegate: delegateValue?
    var postValueBlock: valueBlock?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("返回", for: .normal)
        button.addTarget(self, action: #selector(backBtnClicked(_sender:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
        // Do any additional setup after loading the view.
    }
    @objc func backBtnClicked(_sender: UIButton) {
        // 实现代理方法
        delegate?.postValueTo(str: "hello world")
        // 闭包传值
        guard let postValueBlock = postValueBlock else { return }
        postValueBlock("闭包传值---Hello world")
        // 发送通知
        NotificationCenter.default.post(name: NOTIFICATION, object: self, userInfo: ["key":"通知传值---value"])
        // 单例传值
        CommonManager.defaultInstance().name = "单例传值----fuzongjian"
        
        print(CommonManager.defaultInstance().name!)
        
        
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        
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
