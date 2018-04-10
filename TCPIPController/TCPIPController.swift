//
//  TCPIPController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/10.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class TCPIPController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    func configUI() -> Void {
        setCustomTitle(title: "TCP/IP")
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
