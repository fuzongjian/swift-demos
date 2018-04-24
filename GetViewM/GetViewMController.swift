//
//  GetViewMController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/24.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class GetViewMController: SuperViewController {
    lazy var testView = { return UIView() }()
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.backgroundColor = UIColor.red
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.center.equalToSuperview()
        }
        let button = UIButton(type: .system)
        button.setTitle("GetM", for: .normal)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(testView.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func buttonClicked(_ sender: UIButton) -> Void {
        Klog("frame ===\(testView.frame) MinX === \(testView.frame.minX) MaxX === \(testView.frame.maxX)")
        Klog("frame ===\(testView.frame) MinY === \(testView.frame.minY) MaxY === \(testView.frame.maxY)")
        Klog("frame ===\(testView.frame) MidX === \(testView.frame.midX) MidY === \(testView.frame.midY)")
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
