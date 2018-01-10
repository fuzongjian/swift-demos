//
//  AdvanceViewController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/10.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class AdvanceViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "基本控件")
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        addLabel()
        addButton()
    }
    func addButton() {
        let button = UIButton(frame: CGRect(x:105,y:70,width:100,height:40))
        button.setTitle("UIButton", for: UIControlState.normal)
        button.backgroundColor=UIColor.red
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonClick(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    func addLabel() {
        let label = UILabel(frame: CGRect(x:0,y:70,width:100,height:40))
        label.text = "UILabel"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.yellow
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        self.view.addSubview(label)
    }
    @objc func buttonClick(_ button: UIButton) {
        print("button_click")
        if button.titleLabel?.text == "UIButton" {
            button.setTitle("buttonClick", for: UIControlState.normal)
        }else{
            button.setTitle("UIButton", for: UIControlState.normal)
        }
        
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
