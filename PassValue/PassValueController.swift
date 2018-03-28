//
//  PassValueController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/3/22.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit
let NOTIFICATION = Notification.Name.init("notification_fuzongjian")
class PassValueController: SuperViewController,delegateValue {
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "传值")
        let button = UIButton(type: .system)
        button.setTitle("跳转", for: .normal)
        button.addTarget(self, action: #selector(backBtnClicked(_sender:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        // Do any additional setup after loading the view.
        // 注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification(_:)), name: NOTIFICATION, object: nil)
    }
    @objc func backBtnClicked(_sender: UIButton) {
        let delegateValue = DelegateViewController()
        delegateValue.delegate = self
        // 闭包传值
        delegateValue.postValueBlock = {(str) in
            print(str)
        }
        // 单例传值
        print(CommonManager.defaultInstance().name!)
        self.navigationController?.pushViewController(delegateValue, animated: true)
    }
    func postValueTo(str: String) {
        print("代理传值----"+str+" fuzongjian")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(CommonManager.defaultInstance().name!)
    }
    @objc private func receiveNotification(_ notification: Notification){
        guard let userinfo = notification.userInfo else {
            return
        }
        print(userinfo["key"] as! String)
    }
    // 移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
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
