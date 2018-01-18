//
//  SnapKitController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/1/17.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit
import SnapKit
class SnapKitController: SuperViewController {
    var updateConstraint: Constraint?
    lazy var backView = UIView()
    lazy var smallView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomTitle(title: "自动布局")
//        firstMethod()
//        secondMethod()
//        thirdMethod()
//        firthMethod()
//        fifthMethod()
//        sixthMethod()
//        seventhMethod()
//        eighthMethod()
//        ninethMethod()
//        tenthMethod()
        elevenMethod()
    }
    func elevenMethod()  {
        // safeAreaLayoutGuide 安全局域
        smallView.backgroundColor = UIColor.red
        view.addSubview(smallView)
        smallView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    func tenthMethod() {
        // offset与inset
        smallView.backgroundColor = UIColor.red
        view.addSubview(smallView)
//        smallView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(64)
//            make.left.equalToSuperview().offset(150)
//            make.right.equalToSuperview().offset(-150)
//            make.bottom.equalToSuperview().offset(-500)
//        }
        // 或者
        smallView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 64, left: 150, bottom: 500, right: 150))
        }
    }
    func ninethMethod() {
        let greenView = UIView()
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        greenView.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.size.equalTo(CGSize(width: 20, height: 30))
            make.centerX.equalToSuperview()
        }
        smallView.backgroundColor = UIColor.red
        view.addSubview(smallView)
        smallView.snp.makeConstraints { (make) in
            // width是绿色视图宽度的10
            make.width.equalTo(greenView).multipliedBy(10)
            // height 是绿色视图高德5倍
            make.height.equalTo(greenView).multipliedBy(5)
            make.center.equalToSuperview()
        }
    }
    func eighthMethod()  {
        smallView.backgroundColor = UIColor.red
        view.addSubview(smallView)
        smallView.snp.makeConstraints { (make) in
            // 宽度为父视图的一半
            make.width.equalToSuperview().dividedBy(2)
            // 高度为父视图的三分之一
            make.height.equalToSuperview().dividedBy(3)
            make.center.equalToSuperview()
        }
    }
    func seventhMethod() {
        backView.backgroundColor = UIColor.blue
        view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(150)
            make.top.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }
    override func updateViewConstraints() {
        // 制定约束
//        backView.snp.makeConstraints { (make) in
//            make.top.equalTo(200)
//        }
        // 只是更新某些约束
//        backView.snp.updateConstraints { (make) in
//            make.top.equalTo(200)
//        }
        // 重新做约束
//        backView.snp.remakeConstraints { (make) in
//            make.width.equalTo(100)
//            make.height.equalTo(300)
//            make.top.equalTo(150)
//            make.centerX.equalToSuperview()
//        }
        // 调用父类应该放在末尾
        super.updateViewConstraints()
    }
    func sixthMethod() {
        let button = UIButton(type: .system)
        button.setTitle("更新", for: .normal)
        button.addTarget(self, action: #selector(updateClick(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(70)
            make.left.equalTo(20)
            make.width.height.equalTo(60)
        }
        
        // 创建父视图
        let view1 = UIView()
        view1.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        view1.center = view.center
        view1.backgroundColor = UIColor.black
        view.addSubview(view1)
        // 创建子视图
        let view2 = UIView()
        view2.backgroundColor = UIColor.yellow
        view1.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            self.updateConstraint = make.top.left.equalTo(10).constraint
        }
    }
    @objc func updateClick(_ sender: UIButton)  {
        self.updateConstraint?.update(offset: 50)
    }
    func fifthMethod() {
        // 创建父视图
        let view1 = UIView()
        view1.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        view1.center = view.center
        view1.backgroundColor = UIColor.black
        view.addSubview(view1)
        // 创建子视图
        let view2 = UIView()
        view2.backgroundColor = UIColor.yellow
        view1.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.left.lessThanOrEqualTo(20) // <= 父视图的左边+20
            make.right.equalTo(-40)
            make.height.equalTo(100)
            make.centerY.equalToSuperview()
        }
    }
    func firthMethod() {
        // 创建父视图
        let view1 = UIView()
        view1.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        view1.center = view.center
        view1.backgroundColor = UIColor.black
        view.addSubview(view1)
        // 创建子视图
        let view2 = UIView()
        view2.backgroundColor = UIColor.yellow
        view1.addSubview(view2)
        // 同时出现 lessThanOrEqualTo、greaterThanOrEqualTo Snapkit会以greaterThanOrEqualTo为准
        // 如果只是设置了 lessThanEqualTo，view2是不会显示出来的，Snapkit不知道宽度是多少
        view2.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualTo(300)
            make.width.greaterThanOrEqualTo(200)
            make.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    func thirdMethod() {
        // 创建父视图
        let view1 = UIView()
        view1.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        view1.center = view.center
        view1.backgroundColor = UIColor.black
        view.addSubview(view1)
        // 创建子视图
        let view2 = UIView()
        view2.backgroundColor = UIColor.yellow
        view1.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            // 顶部距离view1的底部距离为10
            make.top.equalTo(view1.snp.bottom).offset(10)
            make.width.height.equalTo(100)
            // 水平中心线<=view1的左边
            //make.centerX.lessThanOrEqualTo(view1.snp.leading)
            
            // 水平中心线>=view1的左边
            make.left.greaterThanOrEqualTo(view1)
        }
    }
    func secondMethod() {
        // 创建父视图
        let view1 = UIView()
        view1.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        view1.center = view.center
        view1.backgroundColor = UIColor.black
        view.addSubview(view1)
        // 创建子视图
        let view2 = UIView()
        view2.backgroundColor = UIColor.yellow
        view1.addSubview(view2)
//        view2.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(20)
//            make.left.equalToSuperview().offset(20)
//            make.bottom.equalToSuperview().offset(-20)
//            make.right.equalToSuperview().offset(-20)
//        }
        // 更简单的写法
        view2.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20))
        }
        
    }
    func firstMethod() {
        let box = UIView()
        box.backgroundColor = UIColor.red
        view.addSubview(box)
//        box.snp.makeConstraints { (make) in
//            // 宽度 100
//            make.width.equalTo(100)
//            // 高度 100
//            make.height.equalTo(100)
//            // 位于当前视图的中心点
//            make.center.equalTo(view)
//        }
        // 更简单的写法
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(view)
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
