//
//  CornerController.swift
//  swift-demos
//
//  Created by 付宗建 on 2018/4/4.
//  Copyright © 2018年 youran. All rights reserved.
//

import UIKit

class CornerController: SuperViewController {
    lazy var imageView = UIImageView()
    lazy var secondImageView = UIImageView()
    lazy var thirdImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        Klog("1")
    }
    func configUI() {
        setCustomTitle(title: "高性能圆角")
        
        let button = UIButton(type: .system)
        button.setTitle("第一种", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(84)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
        imageView.image = UIImage(named: "IMG_0669")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.top.equalToSuperview().offset(84)
            make.left.equalTo(20)
        }
        let second = UIButton(type: .system)
        second.setTitle("第二种", for: .normal)
        second.addTarget(self, action: #selector(sencondBtnClicked(_:)), for: .touchUpInside)
        view.addSubview(second)
        second.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(200)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        secondImageView.image = UIImage(named: "IMG_0669")
        view.addSubview(secondImageView)
        secondImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalTo(20)
        }
        
//        addCornerRadius(imageView, 100)
//        betterAddCornerRadius(imageView: imageView)
        
        /*
         *  使用CAShapeLayer和UIBezierPath设置圆角
         */
        thirdImageView.image = UIImage(named: "IMG_0669")
        view.addSubview(thirdImageView)
        thirdImageView.snp.makeConstraints { (make) in
            make.top.equalTo(secondImageView.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.height.width.equalTo(200)
        }
        
//        betterImageView.cornerBetter(0)
        let third = UIButton(type: .system)
        third.setTitle("第三种", for: .normal)
        third.addTarget(self, action: #selector(thirdButtonClicked(_:)), for: .touchUpInside)
        view.addSubview(third)
        third.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(300)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        
    }
    @objc func buttonClicked(_ sender: UIButton) -> Void {
        addCornerRadius(imageView, 100)
    }
    @objc func sencondBtnClicked(_ sender: UIButton) -> Void {
        betterAddCornerRadius(imageView: secondImageView)
    }
    @objc func thirdButtonClicked(_ sender: UIButton) -> Void {
        thirdImageView.cornerBetter(0)
    }
    /*
     *   强制Core Animation提前渲染屏幕的离屏绘制，而离屏绘制就会给性能带来负面影响，会有卡顿的现象出现
     *   注: png图片UIImageView处理圆角是不会产生离屏渲染的（iOS9.0之后不会产生离屏渲染，之后还是会产生）
     */
    func addCornerRadius(_ imageView: UIImageView,_ radius: CGFloat) {
        imageView.image = UIImage(named: "IMG_0669")
        imageView.layer.cornerRadius = radius
        imageView.layer.masksToBounds = true
    }
    /*
     *
     */
    func betterAddCornerRadius(imageView: UIImageView) {
        let image = UIImage(named: "IMG_0669")
        image?.cornerImage(CGSize.init(width: 200, height: 200), radius: 100, complete: { (result) in
            imageView.image = result
        })
    }
    override func viewDidLayoutSubviews() {
        
    }
    override func viewWillLayoutSubviews() {
        
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
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
