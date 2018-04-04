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
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        Klog("1")
    }
    func configUI() {
        setCustomTitle(title: "高性能圆角")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.center.equalToSuperview()
        }
        
//        addCornerRadius(imageView, 100)
        betterAddCornerRadius(imageView: imageView)
        
        
        
    }
    /*
     *   强制Core Animation提前渲染屏幕的离屏绘制，而离屏绘制就会给性能带来负面影响，会有卡顿的现象出现
     */
    func addCornerRadius(_ imageView: UIImageView,_ radius: CGFloat) {
        imageView.image = UIImage(named: "IMG_0669")
        imageView.layer.cornerRadius = radius
        imageView.layer.masksToBounds = true
    }
    func betterAddCornerRadius(imageView: UIImageView) {
        Klog(imageView.snp.width)
        let image = UIImage(named: "IMG_0669")
        image?.cornerImage(CGSize.init(width: 200, height: 200), radius: 100, complete: { (result) in
            imageView.image = result
        })
    }
    override func viewDidLayoutSubviews() {
        Klog(imageView.bounds)
    }
    override func viewWillLayoutSubviews() {
        Klog(imageView.bounds)
    }
    override func updateViewConstraints() {
        
        Klog("2")
        Klog(imageView.bounds)
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
