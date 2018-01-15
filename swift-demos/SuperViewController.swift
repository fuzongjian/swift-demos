//
//  SuperViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/10.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setCustomTitle(title: String) {
        let titleLabel = UILabel(frame:CGRect(x: 0,y: 0,width: 100,height: 40))
        titleLabel.text = title
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = titleLabel
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    public func DispatchAfter(after: Double,handler:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now()+after) {
            handler()
        }
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
